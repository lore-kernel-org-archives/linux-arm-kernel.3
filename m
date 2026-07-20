Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33105C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oMscjj0OQ6r+QkQqnuEcryEB20ua4iBrqQS5thIYHw=; b=EUK4z7XFkKcEzdQfeZddZP2zns
	e9HyjtxpOjhTdT+ryjT/9IlEGYXlMpu7XeZBvUOwOpT7P+BWyIyQ3oIHiIIoctPkdyBXYF5XgYmiW
	RkBwvBJBGcPQBXx7ddHWlVexCIoqm+hvx9Jtrc3eczeQ3gppOgHoRWyk1RozsBCI2nx8Ax9udrDnQ
	vikY7nWuvKg/yDppXjh4cEDpg/YeloE427j9M3Q5I3uwrYWSVeofCXH8h32G8M3xMaMbrSfzQ/muO
	a79MSQnhhBB5sjpqd3YqOhHj7Ff5zet9yNR6cUO5FAEr8VjEBWxekqXmTF3I2M6wIbkAGmsgqrhaz
	VgznjNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnfV-00000006ky4-2t7N;
	Mon, 20 Jul 2026 13:04:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnfT-00000006kxv-2Asy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E469D4189C;
	Mon, 20 Jul 2026 13:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7201F00A3A;
	Mon, 20 Jul 2026 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784552660;
	bh=2oMscjj0OQ6r+QkQqnuEcryEB20ua4iBrqQS5thIYHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JyLoXd//Gv3nB8Q3RutCXxOJnNAFesU4ch11Fti8s5nAlDIl38uOjTV2GjL0KEiJ/
	 MsrRNN6LlKXP7h+OgvY6GdAvQDhMiSHfeIIg4f9+1n0uZoWszfXwbYnotxkgcls+uy
	 X2cj7FKn1/ClxCr9Nlz+Dw/+f03vaJFLiMFskNN3RxlTS2tOyvh3q+CPXVODT7whfN
	 9pVBGdhJIcJaf78O9CIeRYrrSqmKVYAl/kVKF5yvzYlIFwNEeDN5bA4aWRZIlsuXrk
	 ahIPMh/wA/6z7rMYWpO2Gd+chmXeto4eX7SQx5T4hWDRqYtn3Y+MaE6fQabKwzPqhG
	 mL8Tu8NXFDSQg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Steffen Persvold <spersvold@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260709122446.3151899-1-spersvold@gmail.com>
References: <20260709122446.3151899-1-spersvold@gmail.com>
Subject: Re: [PATCH] PCI: host-generic: Fix NULL pointer dereference on
 32-bit CAM systems
Message-Id: <178455265741.24429.4069285286269225213.b4-ty@b4>
Date: Mon, 20 Jul 2026 15:04:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Thu, 09 Jul 2026 14:24:46 +0200, Steffen Persvold wrote:
> On 32-bit systems the config space is too large to ioremap in one go, so
> pci_ecam_create() maps each bus segment separately and relies on the
> ->add_bus callback (pci_ecam_add_bus) to populate the per-bus mapping in
> cfg->winp[]. pci_ecam_map_bus() then uses that mapping as the base for
> every config access.
> 
> The generic ECAM ops (pci_generic_ecam_ops) already provide the ->add_bus
> and ->remove_bus callbacks, but the CAM (legacy) ops in pci-host-generic.c
> do not. As a result, on a 32-bit host using "pci-host-cam-generic" the
> per-bus mapping is never set up and the first config read dereferences a
> NULL base, crashing during bus enumeration:
> 
> [...]

Applied, thanks!

[1/1] PCI: host-generic: Fix NULL pointer dereference on 32-bit CAM systems
      commit: 008cb88edb41f3c7c8e0ed763ff9f26719830984

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



