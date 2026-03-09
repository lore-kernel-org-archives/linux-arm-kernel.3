Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C088EF3718
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jXCW9TlCZ3hHSi9kSS7Ek8EU10bJr55LqLcA1zyr+4=; b=Rry4MhvTXI35oi5b1oIP7hTDp4
	oL8ckPG2sZm2uqnfSL1028creordVUohvGn/f8RN7ZSvyKaEcumwxxjYML190r9LRTH8j/ravxlS7
	twXU79aJt64/cINfnyjeW0sf0dlef3rTcvuLV7xnwEZByZyv7BH+qj/jqPddJi+cQsHCemz1KBZxM
	7fxeZQzEA8f7ty4bgdq+yiH9GBegP/X/YX01BOUuewr9wFNj3imkYqGplq6XkJU/ZFBdFIjZBHgmm
	jgbbLg/NTGXQTBNihh7tcoBLKEUE7C8BN5efC4fJYDlFOqTDSfg2aKzTuyMX6RyCQpDhIi4d0WaR7
	IYF17skQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzeN9-00000007pHI-1oRT;
	Mon, 09 Mar 2026 17:26:27 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzeN6-00000007pGu-2OCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 17:26:25 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8cd7aab92dfso230899885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 10:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773077183; x=1773681983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jXCW9TlCZ3hHSi9kSS7Ek8EU10bJr55LqLcA1zyr+4=;
        b=eMalXAfgcu53QjdPJUS6jbYzl2mb1eS3+VCRZ260NfBGk1MaLbGlrEMhmuj3acEvfn
         oIWIcvu4XPj2NzqYiUf3LwRB1SCDromcPiMT7O3ib1GaMpnLNa3BHO2j1dDqhcML+Qk2
         JlGSV5kLA6u97CEshEAjzrbvbY4Dt9NeLz4L0enIU/Peja8UU73yixMiRp/OoFMw4MCJ
         OjqYlAUEi2AIsnuOVJfOxR3m8xp8qoaSCiPP2FlQg5hpDPxVb43dnUZMb36XhgEoNzqj
         038L8pPbm+CHr+ZSUa8lk4FKTMRoUIDvH6VXyat0MCbU0uiHdVJkJRzczWrwBwqbgx69
         T1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077183; x=1773681983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jXCW9TlCZ3hHSi9kSS7Ek8EU10bJr55LqLcA1zyr+4=;
        b=DhnKaOXS7h7vHnyCe7EdDMr6owRGYoF/cPHXkqv5g7w8a+1ePcJPJtkceECcSuA6W7
         s3z3ZE+9xfrdUZowvrCtpgXu957xgavmIxRhZSsq+raBEafLTCnE3TS5y3eaYrQztHL0
         IoOgCcJjDS63qggPTUx91B0600naLsVx1V1NXoHLfxHNxY2JlqVYjw21rDf8M9T/gUrO
         64CyKcyRbgY7vDmt4LZG2NOY0KJm5sFyd02+a6btapxoN0v+bGZQZSOlQ1IBHPwB99B2
         wFIEEWIyuePuGxx0dUK8xwq/ppQMOmo50jwLZAt93QzYvUI6pYqFXubDzYMxtrSMCeEC
         u3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWzcIWuW+Wi9QJB3VYGAiQ4taWqDZ7NdaFRcTz5HAzVLsWrc2jgx9Yo4LJUOLRaz4f0973DyoDtkJNikgdiL1Fg@lists.infradead.org
X-Gm-Message-State: AOJu0YzlUXgUZSx8F3AVmzNhmTZCXLCNeRXQNjIKWzJXkM07F7e7+dFB
	m0IZ/rWpYDNVJYRMJys7mKycWSq7eklPt+NrZni3ZiKUaLUY/jskZDQn
X-Gm-Gg: ATEYQzxppWgtaQoHUQt5JImlSxqokkNrxvPM7IdblMoBYej+oHH3oP9k0bZOkTAe75x
	5SLexSTSQw8xwkGih1Ca1eI9hkoF9urX+g5CY9yUmA+7RLomrb9EDlOdsYpEOQRatBh+t/AfZJd
	BBe/DbVFm1dXNs0NP18PfLhB7y1H0hYKFBTUfXpnCSh9dCrRT6uoRnlU9WyP8x91ZMbwOci7wzV
	Ab4vutkrKajFJ6k7xqE3P2DRYYjhL8x1YbTC3L8qnEg9SIlwnQJkL7hvxPNqlEL2DWRYvhzxVxW
	BrRA2yy/ICDLO2A8RD+tj9tSvTxlL8QYHr/o8mGYzvXvnI/Y4E4VJMV7MFgx+NLeoL+NZDy9bRs
	IaViEzxxKpJ8PwSp9iZiOa7X9dFHbx6fQgEW5Qv6EhPzlE1kx+brcI6EvT8jgfRzwGU7U7pbJHb
	mSGsT8EYbC+N6so/o0dLYGYsdWZF5y2IdBdr1dFdTjwr4=
X-Received: by 2002:a05:620a:414a:b0:8b2:1fa8:4684 with SMTP id af79cd13be357-8cd93b4cec5mr56470085a.2.1773077182874;
        Mon, 09 Mar 2026 10:26:22 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd90aae370sm114447185a.28.2026.03.09.10.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:26:21 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:34:49 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>
Subject: Re: [bpf-next v8 0/5] emit ENDBR/BTI instructions for indirect jump
 targets
Message-ID: <aa8EuW4fcwOXnIP7@mail.gmail.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_102624_626337_B63E719E 
X-CRM114-Status: GOOD (  19.18  )
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

On 26/03/09 10:00PM, Xu Kuohai wrote:
> On architectures with CFI protection enabled that require landing pad
> instructions at indirect jump targets, such as x86 with CET/IBT eanbled
                                                                  ^ enabled
> and arm64 with BTI enabled, kernel panics when an indirect jump lands on
> a target witout landing pad. Therefore, the JIT must emit landing pad
           ^ without
> instructions for indirect jump targets.
> 
> The verifier already recognizes which instructions are indirect jump
> targets during the verification phase. So we can stores this information
                                                   ^ store
> in env->insn_aux_data and pass it to the JIT as new parameter, so the JIT
> knows which instructions are indirect jump targets.
> 
> During JIT, constants blinding is performed. It rewrites the private copy
> of instructions for the JITed program, but it does not adjust the global
> env->insn_aux_data array. As a result, after constants blinding, the
> instruction indexes used by JIT may no longer match the indexes in
> env->insn_aux_data, so the JIT can not lookup env->insn_aux_data directly.
> 
> To avoid this mistach, and considering that all existing arch-specific JITs
                ^ mismatch?
> already implement constants blinding with largely duplicated code, move
> constants blinding from JIT to generic code, before copying instructions
> for each subprog.
> 
> v8:
> - Define void bpf_jit_blind_constants() function when CONFIG_BPF_JIT is not set 
> - Move indirect_target fixup for insn patching from bpf_jit_blind_constants()
>   to adjust_insn_aux_data()
> 
> v7: https://lore.kernel.org/bpf/20260307103949.2340104-1-xukuohai@huaweicloud.com
> - Move constants blinding logic back to bpf/core.c
> - Compute ip address before switch statement in x86 JIT
> - Clear JIT state from error path on arm64 and loongarch 
> 
> v6: https://lore.kernel.org/bpf/20260306102329.2056216-1-xukuohai@huaweicloud.com/
> - Move constants blinding from JIT to verifier
> - Move call to bpf_prog_select_runtime from bpf_prog_load to verifier
> 
> v5: https://lore.kernel.org/bpf/20260302102726.1126019-1-xukuohai@huaweicloud.com/
> - Switch to pass env to JIT directly to get rid of coping private insn_aux_data for
>   each prog
> 
> v4: https://lore.kernel.org/all/20260114093914.2403982-1-xukuohai@huaweicloud.com/
> - Switch to the approach proposed by Eduard, using insn_aux_data to indentify indirect
>   jump targets, and emit ENDBR on x86
> 
> v3: https://lore.kernel.org/bpf/20251227081033.240336-1-xukuohai@huaweicloud.com/
> - Get rid of unnecessary enum definition (Yonghong Song, Anton Protopopov)
> 
> v2: https://lore.kernel.org/bpf/20251223085447.139301-1-xukuohai@huaweicloud.com/
> - Exclude instruction arrays not used for indirect jumps (Anton Protopopov)
> 
> v1: https://lore.kernel.org/bpf/20251127140318.3944249-1-xukuohai@huaweicloud.com/
> 
> Xu Kuohai (5):
>   bpf: Move constants blinding from JIT to verifier
>   bpf: Pass bpf_verifier_env to JIT
>   bpf: Add helper to detect indirect jump targets
>   bpf, x86: Emit ENDBR for indirect jump targets
>   bpf, arm64: Emit BTI for indirect jump target
> 
>  arch/arc/net/bpf_jit_core.c      |  37 +++-----
>  arch/arm/net/bpf_jit_32.c        |  43 ++--------
>  arch/arm64/net/bpf_jit_comp.c    |  86 +++++++------------
>  arch/loongarch/net/bpf_jit.c     |  58 ++++---------
>  arch/mips/net/bpf_jit_comp.c     |  22 +----
>  arch/parisc/net/bpf_jit_core.c   |  40 ++-------
>  arch/powerpc/net/bpf_jit_comp.c  |  47 +++-------
>  arch/riscv/net/bpf_jit_core.c    |  47 +++-------
>  arch/s390/net/bpf_jit_comp.c     |  43 ++--------
>  arch/sparc/net/bpf_jit_comp_64.c |  43 ++--------
>  arch/x86/net/bpf_jit_comp.c      |  68 +++++----------
>  arch/x86/net/bpf_jit_comp32.c    |  35 ++------
>  include/linux/bpf.h              |   2 +
>  include/linux/bpf_verifier.h     |   9 +-
>  include/linux/filter.h           |  15 +++-
>  kernel/bpf/core.c                | 142 +++++++++----------------------
>  kernel/bpf/syscall.c             |   4 -
>  kernel/bpf/verifier.c            |  45 +++++++---
>  18 files changed, 233 insertions(+), 553 deletions(-)
> 
> -- 
> 2.47.3
> 

