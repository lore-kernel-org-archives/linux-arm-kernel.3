Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03029CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCoIs56pEWsguL/NjY7h7pljtm7qlE6N18YBLBh6WGE=; b=kZ8OKMazy2kvS9K0tmbxkK7rcr
	mzfmSW+bUkt0oLfexHx1yEve3bExQYiJnmTu7DBTZElK0R5suKg3iuZaGuVF7G0Doo87UzX/l3N10
	hhLcJ1MRRP4p7pCwkkNML2aShqc39hmSh8tuRyS9fG4Hx6t8yWBfTTXJEarO7ud4Ev0lLn20yjAaR
	ahksrAIrjq/HQNTK+PANOJVXRr367Zhl4PJE6kScZRrIZKagOhMETXhBaP43aCWoJY0nT+o0tr82w
	Y/6yXioovMbXiDCj+wyrT1iJHER/WMtl1XwUItHMC8ou1+5xsonLkjlpg/dNBTDL1QzYJsv5tOSvy
	T6Jbhcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdal-000000060D8-3kOv;
	Thu, 28 May 2026 16:28:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdaj-000000060Ch-1zEI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:28:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E09322EE;
	Thu, 28 May 2026 09:28:11 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFA7F3F905;
	Thu, 28 May 2026 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779985696; bh=iphaj6GccxEteXGGchJc08ghkb3mc42SVzdR+A0PEhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj9tf664E9YbMlgJX4QuhVr0Z1S+i7bwqbiFSmvZj/sySTM7HUrF21KPItVEscAtb
	 fgE1P6nDereiN4tnqWyBRI8bR8wp47Sae/nXggVm1GjW6RfRBdNliQcBREkYGTOgxU
	 Cr4tYmFAECdAklgcYdSNmeO0leAPALvk+6jGl41w=
Date: Thu, 28 May 2026 17:28:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 00/18] arm64+KVM: FPSIMD/SVE/SME cleanups
Message-ID: <ahhtHCB-ZZrot25A@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <9f95f8df-8c28-4c8c-b13e-87bc366f43a8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f95f8df-8c28-4c8c-b13e-87bc366f43a8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_092817_550477_590C5DF8 
X-CRM114-Status: GOOD (  10.54  )
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

On Thu, May 28, 2026 at 02:21:52PM +0100, Vladimir Murzin wrote:
> On 5/21/26 14:25, Mark Rutland wrote:

> > Mark Rutland (18):
> >   KVM: arm64: Don't include <asm/fpsimdmacros.h>
> >   KVM: arm64: Don't override FFR save/restore argument
> >   KVM: arm64: pkvm: Save host FPMR in host cpu context
> >   KVM: arm64: pkvm: Remove struct cpu_sve_state
> >   arm64: fpsimd: Fold sve_init_regs() into do_sve_acc()
> >   arm64: fpsimd: Remove sve_set_vq() and sme_set_vq()
> 
> This may be out of scope for the series, but I noticed that
> write_vl() and sve_cond_update_zcr_vq() might similarly benefit
> from using sysreg_clear_set_s()

Ah, yes. I failed to spot that, but I agree it'd be nice to do similar
there. Thanks for calling that out!

As Marc and Will wanted to queue this ASAP, I'll send v2 without that,
but I'll take a look at doing that atop.

Mark.

