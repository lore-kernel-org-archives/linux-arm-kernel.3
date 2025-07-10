Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28799C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 01:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5F8p4jbyrmYWy+tnfwmczom/QO8eT/hxOh2jCDRLYs=; b=O5Nw7vZ4lu+d9ugDf0kTHxjaMX
	ynaKMLqUzddMc2xUlNJDDdbZv+l6F1DhTYL7ms8HIovB1AbN4A11zpsSd9s4lHkEv1wcQ3aVGIR8V
	E5uVETtSYhhOj/4tR2hNtPcp1CEU2ualz2MMl3kwQbpO4IF2GdmOHLc/C1BenEgbKiqU+PwT7fcoZ
	Dxnu2LOYepqMfBdEH1Ib+ZjnM/v2hLIwtNZgSelY9VUEvqP5R4kgBiApRuod6QwvatZHL2z0wigaJ
	Rl5xW/pudMIc3iKB1of5XWDaEiEvHMTFGs8m6yHFfEcXKo3NBKihEzpM2RmnY2iBYfSizOvk/f4I+
	Z9emRHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfkK-0000000AOrz-1f2a;
	Thu, 10 Jul 2025 01:06:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfE4-0000000AKtl-3Xjv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4849B43463;
	Thu, 10 Jul 2025 00:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CCFC4CEEF;
	Thu, 10 Jul 2025 00:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752107604;
	bh=YEeckHKCFE1NcP4TydHNicpGNicwK7iWvdNQF9JsqNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4KgXoDlvu2vkJvd2HuLqTgrcAM1YeJyKxBur+6KhaWqovalD3ruhwJevuk+boILH
	 B3vsnbo/PVWEMhE/cmaHQfyqDCKkHV2yCIfMGtJmyixDirA1RyGqJP0whUcdfCBpk7
	 K7YII7EGQKVCrn7auVzWz7QfscuvF9GIYZY+9XexCAVIFTag5a7vH0wBj4e11phooE
	 aCBLdS7gHI8dWitsFOJuxBKpu2vCtZzRMVPd2DSBzXc5AmaCN8AaH0DXB3k/jCgm94
	 Jpaj3GJgemg9rUnmdtPrPh27QkHpmSAuIJO56nEYoc9D7b+9Vqlh6aNaLlcsAieTZc
	 2D7EJJRKglGRg==
Date: Thu, 10 Jul 2025 00:33:22 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	mhklinux@outlook.com, tglx@linutronix.de, bhelgaas@google.com,
	romank@linux.microsoft.com, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	jinankjain@linux.microsoft.com, skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com, x86@kernel.org
Subject: Re: [PATCH v2 0/6] Nested virtualization fixes for root partition
Message-ID: <aG8KUlEAejn7IDxb@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
 <aG8Ad0yeifapux5D@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG8Ad0yeifapux5D@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_173324_900006_60D88FB8 
X-CRM114-Status: GOOD (  12.26  )
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

On Wed, Jul 09, 2025 at 11:51:19PM +0000, Wei Liu wrote:
> On Thu, Jul 03, 2025 at 03:44:31PM -0700, Nuno Das Neves wrote:
> [...]
> >   PCI: hv: Don't load the driver for baremetal root partition
> >   x86/hyperv: Fix usage of cpu_online_mask to get valid cpu
> >   x86/hyperv: Clean up hv_map/unmap_interrupt() return values
> >   PCI: hv: Use the correct hypercall for unmasking interrupts on nested
> > 
> 
> These are applied to hyperv-fixes.
> 
> >   Drivers: hv: Use nested hypercall for post message and signal event
> >   x86: hyperv: Expose hv_map_msi_interrupt function
> 
> These have pending comments so they are not yet applied.


PCI: hv: Use the correct hypercall for unmasking interrupts on nested

This has a dependency on the second dropped patch, so this is also
dropped.

Wei

