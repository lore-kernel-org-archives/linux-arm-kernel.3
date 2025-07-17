Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DBAC83F38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vKkpSNYuEZ47V5IXfS7grf5UeR9f7X+lXcZ0a8iOck=; b=YpFnSptTfnkZ2okZr1B8otjuoi
	GnuzTaKPS6QiMpd5EjFTJVCJcZGQApyojxIYMRLQc8hPoleq1bplD6zyelbiY0dlpofU5YLIfrA7E
	WnmHTnKCmT5L2MPfwQgNdnsSK/GsdwBykWrkkjj8t+OLT0jx7CPqqhZ6RbkPZQ07pzOuCgzMr1iSJ
	lPosZ+mwg6Zjo6THVDDoyjycCupuiDFVCNJjQCSLXK7IMg4RZXUTGsqectkznBuzxfxwfKLGSkK61
	PHB7xIw7HluQRSpjGzamnOVj6hdI/K/7I3ax+qzx7K+ixjQWd9ewI6ydw7iDVTu7TwqBgkUhRJU/9
	xcUWZNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPXH-0000000AML0-1RyE;
	Thu, 17 Jul 2025 14:24:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOVA-0000000AEpq-1XSA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 13:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7462601FC;
	Thu, 17 Jul 2025 13:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C69C4CEE3;
	Thu, 17 Jul 2025 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752758299;
	bh=ptH7dNBspgIP6UsKnSP/sRCJoEZvn2kCE+mTvSXMsi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RN8FmRrAJahPQDvzq6wXUASrBSm9U8a7sStPNCPg2PzmRgWoRMOLlKSUfxQKHkOca
	 ACI2CYsu6n5evkETU8BI370l/55L7WoAP91aZ8pQ5iMPJNep0n8xD76FjS1ha9FZ8V
	 DZaDxW1NBnSgAsXtYnZFzY/07xYcwUzF6wXs21GVaovD6B4zTyXwWhCpgboVM7VyyW
	 OSVslg/RHqJhZAqPNhCCQdTpQL2o7M2RsrpRKoLVhS/YKzPa7vf+cRzSObl0vfm4NR
	 8hzIdts8NiAGGV/1H10n7JmLWXFL9m8aiPBvIiXtAtXufPxpLrfeOirmV8+Iu9ElQr
	 C4LL6pzIHki+g==
Date: Thu, 17 Jul 2025 15:18:14 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Toan Le <toan@os.amperecomputing.com>
Subject: Re: [PATCH v2 11/13] PCI: xgene-msi: Probe as a standard platform
 driver
Message-ID: <aHj4FstvO+MnnB0B@lpieralisi>
References: <20250708173404.1278635-12-maz@kernel.org>
 <9193ef71-72b6-4946-a830-14fbbc786658@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9193ef71-72b6-4946-a830-14fbbc786658@web.de>
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

On Thu, Jul 17, 2025 at 01:45:12PM +0200, Markus Elfring wrote:
> > Now that we have made the dependedncy between the PCI driver and
> …
> 
>                             dependency?

https://git.kernel.org/pci/pci/c/a435be2c3318

Thanks,
Lorenzo

