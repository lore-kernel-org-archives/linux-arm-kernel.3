Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2921ECD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vypfoCHyNA71TZL8kA8N3I9Fe3pQWZEycvSdihqFZuU=; b=O4fwHg8TZGL+5f
	1YiH3p9BY/WXrVqm2jfBpwGOD9W7hdiKMf9Utou//s405iNJoy7bf4/QjgRew+XjdbQfqliGlkcsL
	zYx5o32+Ijvk7gcZPfLMcxqhD+2aGGt2XlPgePmYEGgpfwbYkoytumkeJXnSXfEVoTsPjQZDibRQ8
	W2mSdNoB1gHBxUoLisTqbkRCCNgGr0+WmJUOcy76TRGctqQiKfiiO/K8sRLqfs/70bQA5wtqLAhjT
	0H2O1y+aahHjHNfHEN6CP0BEgeOf0824DRaiHHnzaMe8tY8C4EJK4p250uwzWofn45xtDQDothYwg
	8tVmhNNKJXJEgLJ65FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcMi-0000000AxCX-3fYw;
	Thu, 13 Nov 2025 18:48:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcMf-0000000AxC9-3bFN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 130B240AF4;
	Thu, 13 Nov 2025 18:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72B3C4CEF1;
	Thu, 13 Nov 2025 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763059692;
	bh=ZruTlfRU5hPkW+XuRxMTGWrNG1rB4wG/83de4k1qrS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sy4qYApcRfWPdXBhESWfm2WIxzG2f+dLU4mU7qVwxV9KHviy8mqEr/qr+2JXYeMWm
	 pxsEZUKvWxfzR5xPwicrQB8YTiUUZZhuo64qwAqBT9K5V4lmK2SyHeaIxCoU3FYrcW
	 oF3proxO6XgPUej88gzvQVW58bGjOGfpvQs8Clkim9VEU+G/7OVS3uPTIOOVv9l3i/
	 DmCXwH6jLF6DjOdihR08DMmNq42TiYweRavxjI4NzlBQoe516yyuzevM0qTV6wrRSt
	 8lVLyxQl1AvrdlEEFCUumEx9r+KHNRdPFjTfnOYL/JSaybBZG6anH/eIVDFtrEonH4
	 30TIb15CGXSvA==
Date: Thu, 13 Nov 2025 12:48:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	christian.bruel@foss.st.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, shradha.t@samsung.com,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	fan.ni@samsung.com, cassel@kernel.org, kishon@kernel.org,
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v5 4/4] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <20251113184811.GA2297285@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRYk4Xj1SNEFYW-J@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_104814_423993_EE824576 
X-CRM114-Status: GOOD (  15.25  )
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

On Thu, Nov 13, 2025 at 06:35:13PM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 13, 2025 at 12:13:55PM -0600, Bjorn Helgaas wrote:
> > >  config PCI_KEYSTONE_HOST
> > > -	bool "TI Keystone PCIe controller (host mode)"
> > > +	tristate "TI Keystone PCIe controller (host mode)"
> > >  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
> > >  	depends on PCI_MSI
> > >  	select PCIE_DW_HOST
> > > -	select PCI_KEYSTONE
> > > +	select PCI_KEYSTONE if ARM
> > > +	select PCI_KEYSTONE_TRISTATE if !ARM
> > 
> > This is kind of a lot of dancing to make keystone built-in on ARM32
> > because hook_fault_code() is __init, while making it modular
> > everywhere else.
> > 
> > Is hook_fault_code() __init for some intrinsic reason?  All the
> > existing callers are __init, so that's one reason.  But could it be
> > made non-__init?
> 
> Yes. To discourage use in modules, because there is *no* way to safely
> remove a hook.
> 
> While one can call hook_fault_code() with a NULL handler, that doesn't
> mean that another CPU isn't executing in that function. If that code
> gets unmapped while another CPU is executing it (because of a module
> being unmapped) then we'll get another fault.
> 
> Trying to throw locks at this doesn't help - not without holding locks
> over the execution of the called function, which *will* be extremely
> detrimental on all fault handling, and probably introduce deadlocks.

Ah, thanks, I hadn't thought about the removal problem.

