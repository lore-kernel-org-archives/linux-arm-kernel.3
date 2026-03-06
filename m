Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BA9FCC04D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuSGvLRcijRhyv53Fhaa02Fta5OZReKa/jZoeaJdDZ4=; b=RNy7Is0FebqjX0O+y1WZoS/RZM
	j5d5VR7ZQV3z6Xs5+ZB5exb0yg8HRJtEBeiEHrNajOp6XFmZNSFXCfIuguHLBzfPlGmmXTFSecc/N
	HVTIX+aFRhZK71Ics+ZqplCr69NR9hgueKJI5ahshHiYBwbMMMFB/B6umKMhyFnhg4XGW3mAcqjcN
	SphP6H81xqk2t8cBZPq6oz+9kzrpVG9Zq+MbM3broXkKXmR0s8cR2+wpALkyGjQGwqGIXeZWieiSv
	S1G+mFGMhRKvMgUR5ZnpLZi/BR9Ah1DsSCc2RRuPSTGN59ywQB44KkJHwLDD488/9hz2TYekeQUfX
	U9f19RpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZwp-00000004KZD-2g1b;
	Fri, 06 Mar 2026 18:30:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZwn-00000004KYm-0boC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 18:30:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439b78b638eso6343520f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 10:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772821847; cv=none;
        d=google.com; s=arc-20240605;
        b=Bouf395DyJQ1aQIu2Ce6QK/dG0j2jEITThgPwzx+fU9V1WG2yiByqXiTnywKxsc4sq
         uAvb3OeipmNArrhS2p7Y3IplhkNm44sASCewQFxJSOjdCtdU35k1TfAqsFBGZ/ducQVX
         HNqf0BrwBt2odSQbxestNQ2ThmZlqXIlvuvhMPyxux7+C/p6OGlrgKgLv2Hi5DJKzit+
         br0vcT2f44X9RgPJ/x06ejBfH1o97xDn0jdwHsxjtopBXlft6VtmeVgO9q8wt6ybUVmp
         yqHDYjpDlQkmSatA2ZY6Rk71JVXaKVKXKapUZ2uCLymPnVUoZdoYPElKKURIfAUSPOAE
         aQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuSGvLRcijRhyv53Fhaa02Fta5OZReKa/jZoeaJdDZ4=;
        fh=EwJv/xUPOTMAnSRKt7PvwTkJTzalmbbRBJU6mULF5Bo=;
        b=MIRomCgHyqEcxsFbJkXNL2tolkTJwT1guQxE1EngQug3xo5ziHMLA0VACp436dW49h
         JIGLWGXKI0X/s2sSMaUZJrNmQInvnpFIeawovUxLFykjnp3vT+Tovb+bkM0829LEYIXb
         GCsejyv+naUWxT+j5Xu5muBZgpKD7rTd8SjPT23LHZN50X4vtpCejpFUuVjgPUV0UhZH
         0MJ6jGNPZRZ3EqrGQUIxnIYoFUxapACMrV2lDnsDlI1yYDndfnLabIc2xjAiUH5r94Rw
         wEzPUMAJmM3HJblg8iZyYvi9YPs5k38Mwg8p3g8fbNMh4hWUXLIj4RWQOKBZZFo1Lwn1
         McBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772821847; x=1773426647; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuSGvLRcijRhyv53Fhaa02Fta5OZReKa/jZoeaJdDZ4=;
        b=k5cHvotC0vCApGRgH1pBgFOCep9XDG+H2mszqGtqNNfyGZq2X5JOsYLgYHVt8wngl9
         lTLIF0XBfE+J5Pd7YtZdoqKnrIR70sqoQS8hnExSZxztEPVydgHKK7X3q246dAePh69T
         X7pUusU0JDf8Nxv6L9RSOxLNf8JJCddNtL6+83jhpzpVR5qHVdPtpPsZwo+dy9L7yUN9
         IvD42ZEe9oYpCGX81SWtnTcFIFr5deAONeMbExFGrk9jN1uLDtPpBaSXwwm4BMa0sTcR
         HTOSoOkcwnar/m0zsP9Us7mDI1DVn1s2dUqANUgrNh6slgeyGiAD6B9Xnj3yBcuRV2iK
         0ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772821847; x=1773426647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OuSGvLRcijRhyv53Fhaa02Fta5OZReKa/jZoeaJdDZ4=;
        b=RgI6Eq55vpN5M7WPr3cddOF4YRxzND+eKmhKmCXfwXl2K/004bFbuIZnGKon3k/A6g
         VDvuE9+mn1sesCo2J2Dvy+KXJ1N7K+dY18wSqUNcmZEbBoZg4yn98J1vAP5M8qPldhiH
         CvUMzLgSsk99ZQK07/FRMzoA4ieYdEP713nfB1YylAva54QDeltRwOc8+dKeaMpalFzB
         w1JvWMwo2YWcgPFvlSI4TiK/8M1Qwh4P7Qhu0p+VRgyEwNg0WhrM9w7TnVW0GulchDTS
         xLYGHoVP3nybfPM5X+RK0bgHvEidU56ZxEflQB1qyeJtiFxmQYjT5mbv1zztCM/tkkUP
         Kigg==
X-Forwarded-Encrypted: i=1; AJvYcCVcCZJ0YiGltMHtjhT5zlqgyZ1wyNLICLBtIE2bn4iFBkX+z3j3jX+M7U08NaObmlNKEpIl2/cXzhMCmphm/fUa@lists.infradead.org
X-Gm-Message-State: AOJu0YzBbIhWu3CCw4sh6IdiATa5tOrz29LBZBG9YC+THRzZM4fZ2SoN
	EVKg2AIGsRjSaeKMRTHpz/8PfBZFQWyyJvhbY4zUZNBeWiHaMd1LIsKENOMHqOuSRwlQQMaBytp
	2ALhzedMKxu2Z6VT0pkq7flPj7l7EjWI=
X-Gm-Gg: ATEYQzx4oOACNqp5v/dahxrlpMt8bsC59u5P6P6miqV5IBbzE1lotAEc30pYR0l6ktg
	f1fK7a5rzuSkr97AWCdPQhIbKJW3jGd0ABNbpOmsWLjT8QeWuBJVk5vwpceCFFOq1qj+jOpd/G7
	XUc7kxSX5iAIh3TukG0FkestU4swcKVEvy/Z22gwCzU0SJh78QvgyKVzHgjCsyeZuHR8eqY+yns
	b3eTUF5G0BKrBxnVQwLVhDvlSlR7cJ21k5SmY4MjtJhxoCqGms52GguO9NqtbhxYeEsZhPiSxw8
	PPBb/FZatwSs4a49ibS84VHkhl2l/8vNAQ7vd+ltRd1Txv+cCEjAHaz1Dl23X3bev/RJ03TLQE9
	1V1if6bW1LnP3N06xITgaQQSB1sLXI6GbtzFI
X-Received: by 2002:a05:6000:290d:b0:439:b8b2:fac6 with SMTP id
 ffacd0b85a97d-439da6621femr5656153f8f.22.1772821846273; Fri, 06 Mar 2026
 10:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20260306102329.2056216-1-xukuohai@huaweicloud.com> <20260306102329.2056216-2-xukuohai@huaweicloud.com>
In-Reply-To: <20260306102329.2056216-2-xukuohai@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 6 Mar 2026 10:30:34 -0800
X-Gm-Features: AaiRm53NBXg75ZsVgxZZRREOs1exnnImw86xT6rvgG7ywSHYFj2tZC-NCuB719g
Message-ID: <CAADnVQLv1+8SePM9K0A0gS+zqjePafSmwtNAo=Sh7cEEy99Xkw@mail.gmail.com>
Subject: Re: [bpf-next v6 1/5] bpf: Move constants blinding from JIT to verifier
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Shahab Vahedi <list+bpf@vahedi.org>, 
	Russell King <linux@armlinux.org.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Hengqi Chen <hengqi.chen@gmail.com>, Johan Almbladh <johan.almbladh@anyfinetworks.com>, 
	Paul Burton <paulburton@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	"David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_103049_213331_B5071D20 
X-CRM114-Status: GOOD (  13.61  )
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

On Fri, Mar 6, 2026 at 1:56=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com>=
 wrote:
>
> From: Xu Kuohai <xukuohai@huawei.com>
>
> During the JIT stage, constants blinding rewrites instructions but only
> rewrites the private instruction copy of the JITed subprog, leaving the
> global instructions and insn_aux_data unchanged. This causes a mismatch
> between subprog instructions and the global state, making it difficult
> to look up the global insn_aux_data in the JIT.
>
> To avoid this mismatch, and given that all arch-specific JITs already
> support constants blinding, move it to the generic verifier code, and
> switch to rewrite the global env->insnsi with the global states
> adjusted, as other rewrites in the verifier do.
>
> This removes the constant blinding calls in each JIT, which are largely
> duplicated code across architectures.
>
> And the prog clone functions and insn_array adjustment for the JIT
> constant blinding are no longer needed, remove them too.
>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/arc/net/bpf_jit_core.c      |  20 +--
>  arch/arm/net/bpf_jit_32.c        |  41 +----
>  arch/arm64/net/bpf_jit_comp.c    |  59 ++-----
>  arch/loongarch/net/bpf_jit.c     |  50 ++----
>  arch/mips/net/bpf_jit_comp.c     |  20 +--
>  arch/parisc/net/bpf_jit_core.c   |  38 +----
>  arch/powerpc/net/bpf_jit_comp.c  |  45 ++----
>  arch/riscv/net/bpf_jit_core.c    |  45 ++----
>  arch/s390/net/bpf_jit_comp.c     |  41 +----
>  arch/sparc/net/bpf_jit_comp_64.c |  41 +----
>  arch/x86/net/bpf_jit_comp.c      |  40 +----
>  arch/x86/net/bpf_jit_comp32.c    |  33 +---
>  include/linux/filter.h           |   3 -
>  kernel/bpf/core.c                | 263 -------------------------------
>  kernel/bpf/verifier.c            | 215 +++++++++++++++++++++++--
>  15 files changed, 288 insertions(+), 666 deletions(-)

JIT changes are fine, but pls don't move main
bpf_jit_blind* logic from core.c.
It makes the diff unnecessary big.

pw-bot: cr

