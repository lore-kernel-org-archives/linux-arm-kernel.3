Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16063C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yZmW0hn3MrvYOWlnfGa/3CtDPfOpCdnzl3M85GUApc=; b=rQlqv6jAPgnt6OwR0Rd32sVG4D
	Tr1BM2T5f07KXiw0oVzJhXGEeovcyHa8+CKc6+gHxLy02AfmGPQ2NvVFAG7aSXVK6CrsfsspmqLxZ
	MjzHsRzNjMdiKPh85Pw1+AGJUcicxp8IKMrWef6pk/Jt2fcQ9NVaH/RdU60HqnN1sLW76eWx+WQVc
	Hnn+LScszyb2QCfwHESGK9RDKclVM+CRHpikHWa6eRKG8kuHsjQAJytBx2pr5uqWa+2UerVk5NE+8
	Yy5TunCXo2GJ8X30Zx5mAPNETHAxgrKaBKbysE4beoXhYVPCI+WsK0F9un80CsiOqRTaCjjWkbqwp
	32okvCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IWj-00000005BO5-28rA;
	Mon, 28 Apr 2025 07:03:41 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IUH-00000005AvV-1mGf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:01:10 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6228025b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745823668; x=1746428468; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9yZmW0hn3MrvYOWlnfGa/3CtDPfOpCdnzl3M85GUApc=;
        b=G5+0nJ+/qXSTMqaBjKe4deA7RvfyAHC7ObbcR8D95T662TjGxFAeJkc4vxC1h/PXAw
         kxxtqT6SfBT+MhRfIPxheEeRBWJDehUjuK8RRgNU9eRPHPDDEEAzGNdjX//29kz6Wqrz
         WKytOuldFExzedC7n4Ds3eWCrBpfIHT5CshXm5xlyuYuvEXYlVETQsy/QX3qQVkit8lH
         Ft7yiouAaXNnHqAe4tMfebOEX2XStqmjiEL4xHQKcoIG20fFO8Be1jEeIij/T36o5seD
         O9I8wzWjkaOF2YwdPEH+oqNw7AWlGiI/B7dYKODHZl4cJ41IbVOziRhuYblrYscOROWE
         8V0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823668; x=1746428468;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9yZmW0hn3MrvYOWlnfGa/3CtDPfOpCdnzl3M85GUApc=;
        b=j7DHwQ8nnrPx9HlYkMr2K9EHowJ9dqyXdzpYasYJ9O78pMAXOLZvn1sGP7qXgIUQjm
         qIF6w22JMbgNbZ6B4BPFccAhXMvA9jYFlB82OksU5M0Ep9k7F/jH4kCo1R9Q8usTmbYp
         gz64AySjTUc1sk+AIE+/VwbQAIZeGf23Z0kUphekOUOVro46zBZvy1GKthzUyzizeptL
         +8M3pA32f2b/OAiWmqyn25R3NjhQfJD8ZjnRAwzd+BL+qqjlVt/VLi9AU9EtOLnZz1CM
         mbE5jiztZU3et1pYcgGJsGyr4SY0gPRtcgLizUMOoq2yaOJBx13pWqUH/AVAT9IB5LZH
         lOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuefGtvkdDgwLfbvBFJ0tnjb8q+zx+98BGRsiO2maNGiWNRbQa3wAJy+VxodZSGVwZyroO8j5ZZYLXVBq129GS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5a4N+HXlAb0FQa41mRz9vdE9whZwSTyxy7HA1uA++DTJ3kLpM
	ATkJuQIkisgCnPii5gzM+L6xBfKFFEjij9pYz/xH7XOMIVWWXyEO
X-Gm-Gg: ASbGncsYhkKIFNSfedqCIxP9JdJS3m5VDCkO5cKVkQqnHDdcDcrdejSHiSHtrvXirEA
	vxvOnMRHml0x8OzyYKMyV8c983P4ZxjWGqDg5IsvKVVYMkytcVhKPgmHDHTF60m0mQ1FctGtB4i
	FhfV2aQE3jOFn3hU/lUWs1STjQN1reyiQrhSGqq822+o2ipTtYnafY/uBBofaqcXkzIDmn5vUX4
	pToR+9y8dxYYOkyiYwkVEyIyegIqHLsYtR9cMSwx3VaBXykUWZjZDjCzBj3uQAvycUNqcAOwvIg
	iFYC4YCcPNJfMVOoMHE7jvSrheezrmaPRihp
X-Google-Smtp-Source: AGHT+IGP4IZjA+2oOl5Xp+BcG0TkWdBytzGu1mFgdq9c4ypqmC8f8TKCih+yUOSsexG/Sbbus31DKg==
X-Received: by 2002:a05:6a00:2e14:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-73ff73bcf1emr9419880b3a.15.1745823668236;
        Mon, 28 Apr 2025 00:01:08 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm7173316b3a.122.2025.04.28.00.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:01:07 -0700 (PDT)
Message-ID: <3a16fae0346d4f733fb1a67ae6420d8bf935dbd8.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 3/4] bpf/selftests: add tests to validate
 proper arguments alignment on ARM64
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexis =?ISO-8859-1?Q?Lothor=E9?= "(eBPF Foundation)"	
 <alexis.lothore@bootlin.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko	 <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh	 <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo	 <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Puranjay Mohan	 <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mykola Lysenko	 <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>,  Florent Revest <revest@chromium.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 28 Apr 2025 00:01:05 -0700
In-Reply-To: <20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
	 <20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_000109_462077_766324C6 
X-CRM114-Status: GOOD (  13.40  )
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

On Fri, 2025-04-11 at 22:32 +0200, Alexis Lothor=C3=A9 (eBPF Foundation) wr=
ote:
> When dealing with large types (>8 bytes), ARM64 trampolines need to take
> extra care about the arguments alignment to respect the calling
> convention set by AAPCS64.
>=20
> Add two tests ensuring that the BPF trampoline arranges arguments with
> the relevant layout. The two new tests involve almost the same
> arguments, except that the second one requires a more specific alignment
> to be set by the trampoline when preparing arguments before calling the
> the target function.
>=20
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---

[...]

> +SEC("fentry/bpf_testmod_test_struct_arg_11")
> +int BPF_PROG2(test_struct_many_args_9, struct bpf_testmod_struct_arg_5, =
a,
> +	      struct bpf_testmod_struct_arg_5, b,
> +	      struct bpf_testmod_struct_arg_5, c,
> +	      struct bpf_testmod_struct_arg_5, d, int, e,
> +	      struct bpf_testmod_struct_arg_5, f)

Hello Alexis,

I'm trying to double check the error you've seen for x86.
I see that tracing_struct/struct_many_args fails with assertion:
"test_struct_many_args:FAIL:t11:f unexpected t11:f: actual 35 !=3D expected=
 43".
Could you please help me understand this test?
The function listened to is defined as accepting 'struct bpf_testmod_struct=
_arg_7',
at the same time this function uses 'struct bpf_testmod_struct_arg_5'.
Nevertheless, the assertion persists even with correct types.

> +{
> +	t11_a =3D a.a;
> +	t11_b =3D b.a;
> +	t11_c =3D c.a;
> +	t11_d =3D d.a;
> +	t11_e =3D e;
> +	t11_f =3D f.a;
> +	return 0;
> +}

[...]


