Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A92D277D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDpCtjo5qrFDIkZsLP+0Yx1Gaj5zFz39R/IP3inKrkQ=; b=dW4+MlsI0vgU5Al2o71JXnbU9q
	dUB39hs2dDj6L0PTaj6HDl06S/M5OnIpdt9RYQFYQvnBy6ufoAvxWFntxKzwbQgTAa+I07Ibm7neC
	GY0EL6Bw/WaIsWsYWEaMRiuXsaunFpsP6psBeJm4DUXaon5c5+dOZYJLL5eH0KBHPSOFRjaDVYoq2
	/rlSb1bcQ/OZuk5EsrUSa8z2VWsL9uuO8Z7OnRkZqtvPEiqAUi+OMcHCu+EX8zBKygbuUZAfIqsgB
	xlglguilmohCs0uT559hMQqfFttRaL83cQFMEUhVhwx8f6K/YrNj1ChhGjDaC5cAVuTsgmnbR7CzU
	i9rNCeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVFW-00000003MdN-2qBd;
	Sat, 10 Jan 2026 09:27:10 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVFU-00000003Md1-157g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 09:27:09 +0000
Received: from 8bytes.org (p200300f6af1d9600dfc71246d978d903.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:dfc7:1246:d978:d903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2914F5DC43;
	Sat, 10 Jan 2026 10:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768037223;
	bh=wYmoWm7BTojrEnJyTKvvqvGn/JiK9wET35aEG/KxfoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDwehzmiUPaneVy8leWWUS+FSM8CwhlYOagzG/QPx5OpdR79dWq0gFnxMh7QsvWxb
	 esqVGiliwYW5JR7ntfQEg8m4Nz1nqf1jK8Sza68vMW1/3DtQ0/PMa0hY/Pxws08qUE
	 u+JAL7GlwKnfAMny1kdVdijEeO1L9J8ZI2cZQbH4qxCzEutwIoVL5eZzb/ymVckkpJ
	 NdIbPtRkMXOpSP86W7EnXN5Ve3GtkMVyB4BF3ZC5xV/h98OE8vho/EhkB1ZZjMZ6Ac
	 tuHhUpugpklqEkxDpIrdJRMancXyp+uCALimyIhATb1m6zyhdfYm5HNKvr69zJzRnC
	 L4VFHPVYrrJRQ==
Date: Sat, 10 Jan 2026 10:27:01 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, afael@kernel.org, 
	lenb@kernel.org, bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com, 
	kevin.tian@intel.com, baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev, 
	pjaroszynski@nvidia.com, vsethi@nvidia.com, helgaas@kernel.org, etzhao1900@gmail.com
Subject: Re: [PATCH v8 0/5] Disable ATS via iommu during PCI resets
Message-ID: <u3763xmcq6tr5nnuye7jj7c74nxbboneylbgywvydjtuhlmxcu@ho7sf4z4u55l>
References: <cover.1765834788.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765834788.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_012708_516925_45E3A238 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
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

On Mon, Dec 15, 2025 at 01:42:15PM -0800, Nicolin Chen wrote:
> Nicolin Chen (5):
>   iommu: Lock group->mutex in iommu_deferred_attach()
>   iommu: Tidy domain for iommu_setup_dma_ops()
>   iommu: Add iommu_driver_get_domain_for_dev() helper
>   iommu: Introduce pci_dev_reset_iommu_prepare/done()
>   PCI: Suspend iommu function prior to resetting a device

Applied, thanks.

