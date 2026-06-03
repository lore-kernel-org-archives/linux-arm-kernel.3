Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DB6CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzc5buVQexaNg+IpqL8SaWf6JByvXpZdkx2mfK34LjY=; b=oG33GmrYDDQG48tTdomB3Hu3kR
	3HthbkAIUdIvpArzWd42zDvH2/27YzZzdM+fT6NkBCBUOtHDkGmpfoqWZmd7bSBmAd+2WXvy7IZop
	q43JevQhS7rk713SWBhBRlumDWAlMBmIvIrgGcnhNsbealC4jU8TLyWvwnnm5I73g15SS34eK8Igl
	pSnokhf9iNUJ363ZFIUUzFXUbTnxjMTRS/oRHaxLlbaaq9bQVfl6TKHoYktKNw0RVkJoJIcjYPY+4
	ZqwyOc4/JWWvGOBHzwns4xOLGjzZLfbOiQHNhkN6j/pDvvfiejuJ/+bULDyZHDh2l6cAXzr+II+HF
	5ROovJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhqx-0000000EhTG-3hXT;
	Wed, 03 Jun 2026 09:25:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhqu-0000000EhSp-2YIo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:25:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D3D632E3;
	Wed,  3 Jun 2026 02:25:26 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA52E3F7D8;
	Wed,  3 Jun 2026 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780478731; bh=NsTJnFO14678jH+MJDNJCWiRBgwV46oOz/dG2+avMjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axQkMNIMjPHK+jZE343ctM1yPWI8lFtfozF00JDJSCDBcNNpTUgGL8y7XW/RX4mpD
	 30lgjvV+hPV//CAFE30GmpbsfTk7H3azEpUHTvM8dMaarf6JqrrfjBcc1fRymtI4+W
	 TmmQ0aJgRA/dP+VJkNbOluR93IKx7KWyAfY0tyTM=
Date: Wed, 3 Jun 2026 10:25:23 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	vladimir.murzin@arm.com, will@kernel.org
Subject: Re: [PATCH v3 02/18] KVM: arm64: Don't override FFR save/restore
 argument
Message-ID: <ah_zAzgSBzQsZOOU@J2N7QTR9R3>
References: <20260602151150.925126-1-mark.rutland@arm.com>
 <20260602151150.925126-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602151150.925126-3-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_022532_715808_4D16E7E0 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Jun 02, 2026 at 04:11:34PM +0100, Mark Rutland wrote:
>  SYM_FUNC_START(__sve_restore_state)
> -	mov	x2, #1
>  	sve_load 0, x1, x2, 3
>  	ret
>  SYM_FUNC_END(__sve_restore_state)
>  
>  SYM_FUNC_START(__sve_save_state)
> -	mov	x2, #1
>  	sve_save 0, x1, x2, 3
>  	ret
>  SYM_FUNC_END(__sve_save_state)

Sashiko pointed out that this change opens a type mismatch bug. Details
below; I'll send a v4 which fixes this since it's also a latent issue
elsewhere.

The function prototypes take the FFR parameter as a 32-bit int:

  void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr)
  void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr)

Per the AAPCS64 parameter passing rules, the callee is responsible for
widening values, and where a register contains a 32-bit argument, the
upper 32 bits of the register are permitted to contain arbitrary values.

The CBZ instructions in the sve_save and sve_load macros will consume
all 64 bits of x2, so depending on how the compiler generated the
'restore_ffr' or 'save_ffr' argument (and if the upper 32 bits happen to
be non-zero), it's possible that we'll attempt to save/restore FFR when
we shouldn't. In practice it's most likely the compiler will zero the
entire register when passing false, but the compiler isn't required to
do so.

The same issue exists in the sve_{save,load}_state() and
sme_{save,load}_state() functions before this series, and hence we
should fix that as a preparatory step for the sake of stable kernels.

We happened to avoid that issue in sve_flush_live() by virtue of passing
bool (which the caller has to pass as 0 or 1 specifically) and using tbz
on bit 0.

Mark.

