Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FDAEDA694
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxEKFs0jFuv6u4VJhIGhmJsnyai2CUMCJeV8dWAXHLQ=; b=yMcZHat/xjcktwWvOwQhxI7skb
	eLtSW+Hoawyd/t3pJQ3iW+gM1ZoqcoAe+OkJPu4lL2LiFn7Ed6ZjpNrtJnXhKjSHWiwH4J9FX5wcI
	G4Ve7jpgeAPo+nw+nNRgELMVz0+5o1oZvDbQGmPpU25pe06hshizITNcoQyfUmTgUe75bKwvWkAYG
	6i9/Juvz65k+08JjWH+CUP+z0Mx80DPwi1b0qU9H4+6XrA9QA35tyVzyutPv/gh8gcKr5xFssg4p/
	jjfDrH/MWoCkU73tqWXwiflXBro9YVV+KnYrRerbDbhyxy8aZLQgI6fo2Ox3lgn1894XH8cQHX/xt
	UY89vg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxScv-0000000FZCM-2thh;
	Tue, 03 Mar 2026 16:29:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxScr-0000000FZBc-3dxv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:29:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 272F34E42503;
	Tue,  3 Mar 2026 16:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E066A5FF29;
	Tue,  3 Mar 2026 16:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28AAD1036875A;
	Tue,  3 Mar 2026 17:29:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772555372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vxEKFs0jFuv6u4VJhIGhmJsnyai2CUMCJeV8dWAXHLQ=;
	b=V9g/OBGJCkYKEquzv3iFqY58vCKodgkgdEE4Ye5HIsVuNVKWXt1iFth0miD4iIVc0YHGtO
	brqiAKR1unqtUd2Q91a1TY6oPHhcABPV8oYKEecCUCMuscYngy6FuCADq8cERfoICZ85SM
	dKH+MXepzfk3oHg8lT1Oa2Kbi8+x5kzTb1YPrazrOW4pDLmLupuCHPthNb2Y8VL0KrbyoG
	utiwSpqnjv9m+EQZN7AB1RdauZtz/aWqsrOROc8aI8pdu+reKnTdYGZvab1vWW3O5dfA+o
	g2V6dgiwyplXYdrynyXAKSWQEPWAd3XmPl1PZ5WKdkQtg/LhmMJxFudAR3jHgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 17:29:27 +0100
Message-Id: <DGTAFQ1WX43H.2R6R1RS5F09Q7@bootlin.com>
Subject: Re: [PATCH bpf-next v5 0/5] emit ENDBR/BTI instructions for
 indirect jump targets
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Anton Protopopov" <a.s.protopopov@gmail.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
In-Reply-To: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_082938_266037_16C2F758 
X-CRM114-Status: GOOD (  12.22  )
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

Hi Xu,

On Mon Mar 2, 2026 at 11:27 AM CET, Xu Kuohai wrote:
> On x86 CPUs with CET/IBT and arm64 CPUs with BTI, missing landing pad ins=
tructions
> at indirect jump targets triggers kernel panic. So emit ENDBR instruction=
s for
> indirect jump targets on x86 and BTI on arm64. Indirect jump targets are =
identified
> based on the insn_aux_data created by the verifier.
>
> v5:
> - Switch to pass env to JIT directly to get rid of coping private insn_au=
x_data for
>   each prog

Nice, thanks for this. As discussed in [1], I'm planning to reuse this
in my KASAN work to pass info to JIT comp about ldx/stx instructions
(especially, whether those insn are accessing prog stack or elsewhere).
So far I've been using a small POC aiming to do the same kind of thing,
but your series made me aware of a few points I missed, like the offset
induced by constant blinding. I'll keep my work rebased on top of your
series, and track it until it is merged.

Thanks

Alexis

[1] https://lore.kernel.org/bpf/CAADnVQLX7RSnOqQuU32Cgq-e0MVqyeNrtCQSBbk0W2=
xGkE-ZNw@mail.gmail.com/

> v4: https://lore.kernel.org/all/20260114093914.2403982-1-xukuohai@huaweic=
loud.com/
> - Switch to the approach proposed by Eduard, using insn_aux_data to inden=
tify indirect
>   jump targets, and emit ENDBR on x86
>
> v3: https://lore.kernel.org/bpf/20251227081033.240336-1-xukuohai@huaweicl=
oud.com/
> - Get rid of unnecessary enum definition (Yonghong Song, Anton Protopopov=
)
>
> v2: https://lore.kernel.org/bpf/20251223085447.139301-1-xukuohai@huaweicl=
oud.com/
> - Exclude instruction arrays not used for indirect jumps (Anton Protopopo=
v)
>
> v1: https://lore.kernel.org/bpf/20251127140318.3944249-1-xukuohai@huaweic=
loud.com/
>
> Xu Kuohai (5):
>   bpf: Move JIT for single-subprog programs to verifier
>   bpf: Pass bpf_verifier_env to jit
>   bpf: Add helper to detect indirect jump targets
>   bpf, x86: Emit ENDBR for indirect jump targets
>   bpf, arm64: Emit BTI for indirect jump target
>
>  arch/arc/net/bpf_jit_core.c      | 19 +++----
>  arch/arm/net/bpf_jit_32.c        |  4 +-
>  arch/arm64/net/bpf_jit_comp.c    | 21 ++++----
>  arch/loongarch/net/bpf_jit.c     |  4 +-
>  arch/mips/net/bpf_jit_comp.c     |  4 +-
>  arch/parisc/net/bpf_jit_core.c   |  4 +-
>  arch/powerpc/net/bpf_jit_comp.c  |  4 +-
>  arch/riscv/net/bpf_jit_core.c    |  4 +-
>  arch/s390/net/bpf_jit_comp.c     |  4 +-
>  arch/sparc/net/bpf_jit_comp_64.c |  4 +-
>  arch/x86/net/bpf_jit_comp.c      | 25 +++++----
>  arch/x86/net/bpf_jit_comp32.c    |  4 +-
>  include/linux/bpf.h              |  2 +
>  include/linux/bpf_verifier.h     | 10 ++--
>  include/linux/filter.h           |  6 ++-
>  kernel/bpf/core.c                | 93 ++++++++++++++++++++++++--------
>  kernel/bpf/syscall.c             |  2 +-
>  kernel/bpf/verifier.c            | 22 ++++++--
>  18 files changed, 157 insertions(+), 79 deletions(-)




--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


