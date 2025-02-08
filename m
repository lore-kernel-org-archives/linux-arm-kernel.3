Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42466C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeLogvOTrg3hgl5TU48qPOFJSwSkerHCTCM95+nKuv0=; b=FXxvcRTn8DrbCAHIUaQEe7YvxC
	ld/au8gSBcHyQQYEB4aAY8uYO10CsPQcC3A64WBwqkFpWX/YBnWv5tigUh4Zcf0LLWQdpVo1/sO7E
	36COSwXtwPWTlxMNCwpllOw7wyf31kKIi0tFS6HdaaFJivTyLbXwmdkxvOc9huwZGX6V61WR4jW5l
	99I0ynCqJNUnZM9p2Q9jmhKvoBQjMc4ksHF/hYxkg+vU4n9N66F4vtWrZL1pD65MGrMjF7CXvv3kY
	U3TYw93lfPjDKgpvXD18nGBVIxC3+w9bPYI727DTWku8r7ia8Ml5YTOqc3mzWss7U8YLt5dl7sFpe
	TR5dnb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsR8-0000000DaNO-1e8Y;
	Sat, 08 Feb 2025 21:32:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsPj-0000000DaBo-0k5P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 21:31:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso21226085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 13:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739050257; x=1739655057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeLogvOTrg3hgl5TU48qPOFJSwSkerHCTCM95+nKuv0=;
        b=aIa2LRGeoA1U5xWrff6+kuHQMbcbTN8Ka5TDUoO8wQYqFvaQrddUkXQD1eDbpMnTwy
         TcyAKrBz7ulxVPmWMVcXkzjkamfQqJerhLwY3R00YkfnH65cFNG+KbdnwgR4NC28xQgR
         Itqvke/FPPe2oKf3ZxfTGT2yDNJePpk+D0+9AsXZeQjmLT0x+DvaOtcI20I4Rdv2rGki
         gMyEQkR2JxC1Oqklj9uFyfxged+qhKE3FaFp4AIT30x5XJL8UunW7ACPouQRGSTekb84
         jzDAZDHaZPaDC+pgQI1wjQTqlz8WWBw0U7H44/oKMQjusMKPCSQw41F8zdnTABoIEBU7
         3PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739050257; x=1739655057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeLogvOTrg3hgl5TU48qPOFJSwSkerHCTCM95+nKuv0=;
        b=eBV6OIHKtP4vRh4fBjRT1DADgK7Je3G0N4CcHfnWhIxikS5otjJ4hCdgCQMhSmNFyH
         +MEhRiLmQECS/bqndvHHqcLWb6DDwm1ypC1DfPDjNf5UFB2Yfgh8CXw6+SOfPNZPsvFC
         uLXsU9+L7AKlif1TzdTDc8ubznrLOhdzuFbRZky61OiwS/e+hhv395Up/Du5p2R0L/6r
         AHCaNGo7VCRSD1CqsLQg8UH8XAJ5rHJYOMRtjKQ0TszAt4jEuZmg3CjER531kKqxZFjp
         8SAEw71rADKPDdeuoywxkyx4fV1Vzezb8w0u/bAVcFBahSkGqbWVhBANBsgQPdvZm/oA
         Ojhg==
X-Forwarded-Encrypted: i=1; AJvYcCVHvTmX9Zp4UNO4LYyxjMNA6kAbomaCfuQ6ik+oB7BPx/ZP8U+YcD1cyTm97/S5jgVuxyx3m7kJgKeXJA4b/9YY@lists.infradead.org
X-Gm-Message-State: AOJu0YxyEzg4N7RIW3f79VZLu1mJdsuIhvq2xcyPOtYZGdxCw5Hdvzhb
	pjuA4JTWffR4BJrOqgFvfjFTqqbounvQLiWgPchrqwU5+JKNIDKOvUnz7nPGJ5vmAPTvOPDCx4j
	3zwpEGZ+9jushgrH6TinCM0xLSlo=
X-Gm-Gg: ASbGncusm8edanTLXVzF3MW7/4WH7XcLo0BSRnEYAOaWGpi2dvI/YQkafKwXvT90Lve
	Kt+bIK6xVg/mqVNpcdlZrfpmFaCXa6rYp1FKbRQm9XJlDh7EHVbhBYNDIeBHnERl4Ux96wBPwL1
	M/fZDb9zbo6vMxcbigf1QtGjPWpunk
X-Google-Smtp-Source: AGHT+IEP0vhMZghv54Q+6Voz3luuHMi0bOzgdsxcCEz++Zjhl9x/NdVS4KE4GKQfNkGM7Bwk01RIJ1lfPbZtfTdWZPQ=
X-Received: by 2002:a5d:6d04:0:b0:38d:d9b3:5916 with SMTP id
 ffacd0b85a97d-38dd9b359ddmr121320f8f.1.1739050257177; Sat, 08 Feb 2025
 13:30:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com> <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
In-Reply-To: <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 8 Feb 2025 13:30:46 -0800
X-Gm-Features: AWEUYZkrJWmpVXeIIF_fMq9Qy1erCPKH-mY9gn4_cLquOtiI9oiPRGGrxOURbaQ
Message-ID: <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_133059_238977_27C4F7E0 
X-CRM114-Status: GOOD (  16.63  )
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

On Thu, Feb 6, 2025 at 6:06=E2=80=AFPM Peilin Ye <yepeilin@google.com> wrot=
e:
>
> Introduce BPF instructions with load-acquire and store-release
> semantics, as discussed in [1].  The following new flags are defined:
>
>   BPF_ATOMIC_LOAD         0x10
>   BPF_ATOMIC_STORE        0x20
>   BPF_ATOMIC_TYPE(imm)    ((imm) & 0xf0)
>
>   BPF_RELAXED        0x0
>   BPF_ACQUIRE        0x1
>   BPF_RELEASE        0x2
>   BPF_ACQ_REL        0x3
>   BPF_SEQ_CST        0x4

I still don't like this.

Earlier you said:

> If yes, I think we either:
>
>  (a) add more flags to imm<4-7>: maybe LOAD_SEQ_CST (0x3) and
>      STORE_SEQ_CST (0x6); need to skip OR (0x4) and AND (0x5) used by
>      RMW atomics
>  (b) specify memorder in imm<0-3>
>
> I chose (b) for fewer "What would be a good numerical value so that RMW
> atomics won't need to use it in imm<4-7>?" questions to answer.
>
> If we're having dedicated fields for memorder, I think it's better to
> define all possible values once and for all, just so that e.g. 0x2 will
> always mean RELEASE in a memorder field.  Initially I defined all six of
> them [2], then Yonghong suggested dropping CONSUME [3].

I don't think we should be defining "all possible values",
since these are the values that llvm and C model supports,
but do we have any plans to support anything bug ld_acq/st_rel ?
I haven't heard anything.
What even the meaning of BPF_ATOMIC_LOAD | BPF_ACQ_REL ?

What does the verifier suppose to do? reject for now? and then what?
Map to what insn?

These values might imply that bpf infra is supposed to map all the values
to cpu instructions, but that's not what we're doing here.
We're only dealing with two specific instructions.
We're not defining a memory model for all future new instructions.

pw-bot: cr

