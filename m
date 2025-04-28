Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCD2C3ABA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjvZYK2d2GAr0o6m4ARn5rvHXuqogyOYirhk7zcNjLo=; b=3kSJr5uuIcRpvHWulKwTHf8Z74
	PhE9wQF4KuRkqN5ZKZGmVcSKQ01y56tcejlqzItf8D/VRc7dhAJzneU12a19NWLxO8/E2QxxVspaJ
	VgtZnJyrp2BJqf4heD/5PclBJAFkMpPsCL8WKFLBsslrmPQ6ByqRIhe/VpMAo+oBjML0x0Vj0EHEW
	nBzOW0i/WDc66lZgoTlpUCSGzKWM1XN7dZYEequFECc8tAWdQK6WvK7B588ptgL0AEuWLjHEWfbWf
	27t7UUuj+JyejE9/OlJZvwGmruK7accS0JBJYydGN+l/plAB/ze+a6zTFA/61g15upQH2oERudY5h
	iAd9wmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rnj-000000070CW-24yD;
	Mon, 28 Apr 2025 16:57:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rii-00000006zPx-0j2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:52:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22423adf751so51701355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745859159; x=1746463959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjvZYK2d2GAr0o6m4ARn5rvHXuqogyOYirhk7zcNjLo=;
        b=BONd0QYiMZcAkmEGu942KWP0t4D4kNUH8rk/sw/u5nuQlFtZHhpBNOn7oAHI5nioxi
         ScVoirlu9Yqm4MhTq+MNk0u94V166COr43hDHqnFIGHdWoP5y9ZEb4ANS7UkxbWUL5gE
         pAGysEDH2G4JPrsqVz0Wr/9HTITUH6cyHXEgYRHhskuanMlW7wk6vMjbMpLgZ/OprX8P
         MEgOf2/h8ZJQG41mX/KAH6ov4vD9QV7Vp6JrS9tyKyua5HgkBAHYvf8B+T2eeWGBFIdI
         c7c727kfX9WndwLNorQxDPQnt8yBwm9FkfqJ8VOSK2+5t36AxihWHgxpXDQ6C8MvQcEP
         umxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859159; x=1746463959;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjvZYK2d2GAr0o6m4ARn5rvHXuqogyOYirhk7zcNjLo=;
        b=us1e2NhFxamHLffsjDOW3DfPxKwb3k7W0yTEcQxNAEniiyGco1hQTVPiZhH7IIUUsB
         ks6WBf14fkCo1ayrf6viOGyiGgh7FwTtM+wkwQVgzPz36FbNatqfkKACR0E4iH5Dwq1Q
         +t0vlQ6plwO7hUaRhCaycUWOFmKDh2+ORzeWRVmmCtFfkGfQfKcN3cPZ7KiA7OpUwG7N
         oNQ7WrmuM047OhmabQDIzVLcQjxDQp/WrOoWPwHqcLa2ZjPCQ/U91nX2mXFVvzoZLI11
         MOfo3O0j/Tw+LutnAuTt0cZwmZO2ZXRq2FhMgfITEj6yYfDWfcGEfm2XiKgAp8pvLEAb
         FkZg==
X-Forwarded-Encrypted: i=1; AJvYcCXfHhuN+3TL2sqP4gRQlRTroMV7q/B4sCHmhT65EcGD3Zr8p+D8191QBhnEBNo7FCTP4D/411i3pRP/Ao2igpTJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/TtEKd/kT7zEP0+OQigHCid/CrrX0v7riI/Kr0fFr9d5Mqyac
	CrirGRYCAi8aoNEkV9JkqTO5PEW1ezW0cXPEpACllPB67QlEdSdOYDCY1Yei4PI=
X-Gm-Gg: ASbGncttOTZt19K8AD9b1XtlCZtnbq7JtnoXgUdRvNi6wSrd1ZIAyolMW5j1UTOcLnZ
	KabkvWjD+UNAVWMTtHV/GLGPsnt3FKpqEDo/OuHDXv2GK8C6NIyhg+e8T/Z18hNhDqESc4unKKL
	UMUzjE8iWGls0qxYfUV85oLkhGqjXCAifjgmgTTq0rPrcZMTk16ajXllGk2klWWXB1cSkKdt/iw
	izGrryN4p7cf8PnZR27bCi8YLUURG13iqrigp8BOL51+IVTbq/rFYD+a0nlc7KYFzg/F6gHN3BU
	sVt5IvSl+z/rMHYG9NLEq+ugsU1WOyy7bVOBTu2uiJ/q0lwEtg==
X-Google-Smtp-Source: AGHT+IGBCRKNAZsf7FtVymPsCdsoGJ/DJafrNa9HOoRlQsbwOsn8q7cEi76BNaSHeHA2zQC4abBnMA==
X-Received: by 2002:a17:903:40cb:b0:224:1935:fb91 with SMTP id d9443c01a7336-22dbf5fd432mr161245665ad.27.1745859159109;
        Mon, 28 Apr 2025 09:52:39 -0700 (PDT)
Received: from ezingerman-mba ([2620:10d:c090:500::6:6628])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dd86032dcsm25258755ad.181.2025.04.28.09.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:52:38 -0700 (PDT)
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>,  "Daniel Borkmann"
 <daniel@iogearbox.net>,  "John Fastabend" <john.fastabend@gmail.com>,
  "Andrii Nakryiko" <andrii@kernel.org>,  "Martin KaFai Lau"
 <martin.lau@linux.dev>,  "Song Liu" <song@kernel.org>,  "Yonghong Song"
 <yonghong.song@linux.dev>,  "KP Singh" <kpsingh@kernel.org>,  "Stanislav
 Fomichev" <sdf@fomichev.me>,  "Hao Luo" <haoluo@google.com>,  "Jiri Olsa"
 <jolsa@kernel.org>,  "Puranjay Mohan" <puranjay@kernel.org>,  "Xu Kuohai"
 <xukuohai@huaweicloud.com>,  "Catalin Marinas" <catalin.marinas@arm.com>,
  "Will Deacon" <will@kernel.org>,  "Mykola Lysenko" <mykolal@fb.com>,
  "Shuah Khan" <shuah@kernel.org>,  "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>,  "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>,  "Florent Revest" <revest@chromium.org>,
  "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
  <ebpf@linuxfoundation.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <bpf@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kselftest@vger.kernel.org>,
  <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH RFC bpf-next 3/4] bpf/selftests: add tests to validate
 proper arguments alignment on ARM64
In-Reply-To: <D9I6TQN2I6B1.QC4FFHEWAURZ@bootlin.com> ("Alexis =?utf-8?Q?Lo?=
 =?utf-8?Q?thor=C3=A9=22's?=
	message of "Mon, 28 Apr 2025 12:08:32 +0200")
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
	<20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
	<3a16fae0346d4f733fb1a67ae6420d8bf935dbd8.camel@gmail.com>
	<D9I6TQN2I6B1.QC4FFHEWAURZ@bootlin.com>
Date: Mon, 28 Apr 2025 09:52:35 -0700
Message-ID: <m21ptcmdnw.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_095240_220301_F9912664 
X-CRM114-Status: GOOD (  24.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> writes:

[...]

>> The function listened to is defined as accepting 'struct bpf_testmod_str=
uct_arg_7',
>> at the same time this function uses 'struct bpf_testmod_struct_arg_5'.
>
> That's not an accidental mistake, those are in fact the same definition.
> bpf_testmod_struct_arg_7 is the kernel side definition in bpf_testmod.c:
>
> struct bpf_testmod_struct_arg_7 {
> 	__int128 a;
> };
>
> and struct bpf_testmode_struct_arg_5 is the one defined in the bpf test
> program:
>
> struct bpf_testmod_struct_arg_5 {
> 	__int128 a;
> };

Apologies, but I'm still confused:
- I apply this series on top of:
  224ee86639f5 ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bp=
f after rc4")

- line 12 of tracing_struct_many_args.c has the following definition:

  struct bpf_testmod_struct_arg_5 {
         char a;
         short b;
         int c;
         long d;
  };

- line 135 of the same file has the following definition:

   SEC("fentry/bpf_testmod_test_struct_arg_11")
   int BPF_PROG2(test_struct_many_args_9, struct bpf_testmod_struct_arg_5, =
a,
                 struct bpf_testmod_struct_arg_5, b,
                 struct bpf_testmod_struct_arg_5, c,
                 struct bpf_testmod_struct_arg_5, d, int, e,
                 struct bpf_testmod_struct_arg_5, f)

- line 70 of tools/testing/selftests/bpf/test_kmods/bpf_testmod.c:

   struct bpf_testmod_struct_arg_7 {
         __int128 a;
   };

- line 152 of the same file:

  noinline int bpf_testmod_test_struct_arg_11(struct bpf_testmod_struct_arg=
_7 a,
                                              struct bpf_testmod_struct_arg=
_7 b,
                                              struct bpf_testmod_struct_arg=
_7 c,
                                              struct bpf_testmod_struct_arg=
_7 d,
                                              short e,
                                              struct bpf_testmod_struct_arg=
_7 f)

Do I use a wrong base to apply the series?

[...]

>> Nevertheless, the assertion persists even with correct types.
>
> So I digged a bit further to better share my observations here. This is t=
he
> function stack when entering the trampoline after having triggered the
> target function execution:
>
> (gdb) x/64b $rbp+0x18
> 0xffffc9000015fd60:     41      0       0       0       0       0       0=
       0
> 0xffffc9000015fd68:     0       0       0       0       0       0       0=
       0
> 0xffffc9000015fd70:     42      0       0       0       0       0       0=
       0
> 0xffffc9000015fd78:     35      0       0       0       0       0       0=
       0
> 0xffffc9000015fd80:     43      0       0       0       0       0       0=
       0
> 0xffffc9000015fd88:     0       0       0       0       0       0       0=
       0
>
> We see the arguments that did not fit in registers, so d, e and f.
>
> This is the ebpf context generated by the trampoline for the fentry
> program, from the content of the stack above + the registers:
>
> (gdb) x/128b $rbp-60
> 0xffffc9000015fce8:     38      0       0       0       0       0       0=
       0
> 0xffffc9000015fcf0:     0       0       0       0       0       0       0=
       0
> 0xffffc9000015fcf8:     39      0       0       0       0       0       0=
       0
> 0xffffc9000015fd00:     0       0       0       0       0       0       0=
       0
> 0xffffc9000015fd08:     40      0       0       0       0       0       0=
       0
> 0xffffc9000015fd10:     0       0       0       0       0       0       0=
       0
> 0xffffc9000015fd18:     41      0       0       0       0       0       0=
       0
> 0xffffc9000015fd20:     0       0       0       0       0       0       0=
       0
> 0xffffc9000015fd28:     42      0       0       0       0       0       0=
       0
> 0xffffc9000015fd30:     35      0       0       0       0       0       0=
       0
> 0xffffc9000015fd38:     43      0       0       0       0       0       0=
       0
> 0xffffc9000015fd40:     37      0       0       0       0       0       0=
       0
>
> So IIUC, this is wrong because the "e" variable in the bpf program being
> an int (and about to receive value 42), it occupies only 1 "tracing conte=
xt
> 8-byte slot", so the value 43 (representing the content for variable f),
> should be right after it, at 0xffffc9000015fd30. What we have instead is a
> hole, very likely because we copied silently the alignment from the
> original function call (and I guess this 35 value is a remnant from the
> previous test, which uses values from 27 to 37)

Interesting, thank you for the print outs.

> Regardless of this issue, based on discussion from last week, I think I'll
> go for the implementation suggested by Alexei: handling the nominal cases,
> and detecting and blocking the non trivial cases (eg: structs passed on
> stack). It sounds reasonable as there seems to be no exisiting kernel
> function currently able to trigger those very specific cases, so it could
> be added later if this changes.

Yes, this makes sense.

