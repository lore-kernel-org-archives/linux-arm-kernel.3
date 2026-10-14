Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48290CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZV9wpLaB7GSx4PtVOFkB/b4sfjtm/46M63tFH45CRE=; b=MNMuuO6qlVlh+c5Y4eQ7vGgwRf
	x1gpPm6jZWtWcohXivMZUoe8luVgv41amVlogIjsV0J//IzkJwJv+V1WYTS5XoVQvRuVIwYBupIGV
	6efAIbNBRkpRF6mgeGX3zPrQh48dte5F3dcOnEcEBkCaAO8F0OoNzCx74PdWoboZU13iC9zeKw9/3
	TNqborPgQxWxPccBJHstXChYT0+2gCUFadQB8YIrYTe5i+L3r/bFS2V6O+HlaqXJuDhvMLv8L1JtP
	HIZu+sp9OKWux7qKHT+pGjlge3geNUSk9NsVezTvsZ7h7cRHNr2ACiuQBqCx7PKRz+EjN7rduvdhw
	Ej7BurTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz7j-0000000Fbtj-0AW9;
	Wed, 14 Oct 2026 13:34:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz7h-0000000Fbsf-1rQ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:34:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8C77605F0;
	Wed, 14 Oct 2026 13:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A6F1F0089C;
	Wed, 14 Oct 2026 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984864;
	bh=XZV9wpLaB7GSx4PtVOFkB/b4sfjtm/46M63tFH45CRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H6NqJWrbi7Q7UOF7JBoq4heJwKmi5w7AjaTmDd58ZIIUNVtOrN2VWklG92FxN2PQV
	 KYFvWpkK3ajLvCvw92WLcZQE5vZW+auWA1y3ysCoZPeODAXuQod/WKSAa9c0UpXDeY
	 3/gR/kXCiLH3pP0H1EUhaFk/jTJeipIPiIMl2B6ple+GGz1cH7XfoJ41iNwpQEKboh
	 ZVzSa2ul5RtabFmxnPDHmBCbEY+NKGutX0l99DzpzhT90o8pDCevIjnitpvrVPptiP
	 IWIuxJYV+CeYsopFayTEvpgGpAjnW0rzNSBKX55JYZjc+s6mM2RNKuS/QINWvefxCp
	 Wz19rT3phBcYQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Semih Baskan <strst.gs@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>, 
 Rani Hod <rani.hod@gmail.com>, bcm-kernel-feedback-list@broadcom.com, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <20261013220421.1588051-1-bhelgaas@google.com>
References: <20261013220421.1588051-1-bhelgaas@google.com>
Subject: Re: [PATCH v4 0/2] PCI: iproc-bcma: Use EROM instead of devicetree
Message-Id: <179198485820.77319.12457284951144723062.b4-ty@b4>
Date: Wed, 14 Oct 2026 19:04:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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


On Tue, 13 Oct 2026 17:04:19 -0500, Bjorn Helgaas wrote:
> This is a combination of these two patches:
> 
>   [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
>   https://lore.kernel.org/all/20260807160526.379-1-strst.gs@gmail.com
> 
>   [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
>   https://lore.kernel.org/all/20260912043626.437-1-strst.gs@gmail.com
> 
> [...]

Applied, thanks!

[1/2] PCI: Expose devm_pci_alloc_host_bridge_release()
      commit: 4e93e052afad91ad28e8343d3777c1e5ab8c24d2
[2/2] PCI: iproc: Use the EROM outbound window on BCMA
      commit: 694a9f52a937f272d8aa6e845765e37118c10e17

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



