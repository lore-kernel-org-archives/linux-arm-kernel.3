Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A432C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B9gUeUskHYx58Fjh7br/1q07DPSUudd8ylMEKHRV+d4=; b=TcBm4f4yaU71HV68WCsL2hg0LT
	7VYY4Obq+rlr3ax4XIXbHyyGIknSsnWwm4rEDAu8JzDfpCcERAqcA5/+X1rOSLL4y46yVM2JcLhgK
	uJiLiH+CTnwZwkdCf9pdeeCHh+BwBe4QFIuaxuki9Yh66HIo9K9lcQ+n2Cke5jalyfWoI2+duTTXA
	u+nGZ3ETRNfH/xa70dlmaVoBxCTXykDShm4fXmJBdHbhXBvFZvB/Big4eQJuZMlJGzJA8cHJLkBET
	BfuPqF46/horNTqhSt3bigvRNbNyA3VDmOuSc0xysFr2Q9C4wD0eQ8dya66sZ2ePvgGMI300FA4rp
	3DOH+eXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDAU-000000077NK-1LdC;
	Tue, 24 Jun 2025 23:35:10 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD2P-000000075xL-31FH;
	Tue, 24 Jun 2025 23:26:51 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 85629C000C95;
	Tue, 24 Jun 2025 16:26:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 85629C000C95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750807607;
	bh=MryCwuQ5UgpRpkPiut10MXF4O6MqDCKghsmv+2OB+JY=;
	h=From:To:Cc:Subject:Date:From;
	b=GJcmcRUkZuoz94XL5ZAK8UH7RAU6imQOlEXiY88VUZLxxNAXEyUIfUcMoAC7UyOo+
	 CfVAJOkPj7fwVIOMrow9i0FaSzCubIlKRqasyysHuZfJXJBe9Ispa0Csey1LlmEbX4
	 KhbeAAJM1Mx8PJO7lt6AVKfPp7GQeBHIte6NeG88=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 12FEE18000530;
	Tue, 24 Jun 2025 16:26:17 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-pci@vger.kernel.org (open list:BROADCOM STB PCIE DRIVER)
Subject: [PATCH 0/2] PCI: brcmstb: Trivial changes
Date: Tue, 24 Jun 2025 16:19:21 -0700
Message-ID: <20250624231923.990361-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_162649_827990_7C7E3F6A 
X-CRM114-Status: UNSURE (   8.86  )
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

The first patch removes Nicolas from the maintainers list since he has
not been active and the second patch uses an existing constant rather
than open code the value.

Florian Fainelli (2):
  MAINTAINERS: Drop Nicolas from maintaining pcie-brcmstb
  PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS

 MAINTAINERS                           | 1 -
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.43.0


