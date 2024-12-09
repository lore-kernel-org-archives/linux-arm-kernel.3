Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB6AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3vRqml1KschqrqQ0MliiBVEeoMW5PWCe2FzpUkVNkQ=; b=06Iayr5rpl3NqmA7G/YAjRg90h
	mDXoDaGzfPj6v1gjTiP1wL6HkWgV0Jwm7zmwiazeUKWZlHMASPq8UD5CBpc2IciiLUbRwNQG/vQSy
	zomfaZuRcJwwbjI8EbqcBo3FOIhnaux0+PVlJP614PYJrCXimtVf/PIMeKZL1ft6K+IHc0QSKmL6i
	SyrInjQHJMks9E6q8/vLFa2DuQdE8QXnaKq0r1XjydEybWX6Sq6zKXrjfOB984kv9aKGnwlqZfKXe
	XkmgiReQayZVUB8UtcNYgtGW3QKz9uzjXd15/JogZP3feAfp9Lw3CcHwtheq2+Uf2Q3xDZ8WxbydD
	NUebjneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbsT-00000007U1D-1TjY;
	Mon, 09 Dec 2024 11:24:37 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbrQ-00000007TqV-1okJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:23:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 687F120008;
	Mon,  9 Dec 2024 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733743408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k3vRqml1KschqrqQ0MliiBVEeoMW5PWCe2FzpUkVNkQ=;
	b=fh/kCLCn8aHeCuI/toH5XuqdwxkFSzlg92oSxTr2IhJT5l8MPjeYF/stySgowTq2k7wSUb
	RHQQNz7CxTBObd6GSD+mSGJ7T/2LsoektcokLDYiWst7oElKJdwxiMm30Gz6rCzBnoPG0z
	/ogUc3as+1GCzY1rxiqLEIAB0TQG8rplTbeGETQSX8eT33FldVrKueCyIzPq+FpvJFVZer
	F72TCA+vd1ddSFCALW7NpxBhPIpwmxaZVBBofT/8FUUijq0uriWBfH2UwFGjuMuqpD7q6f
	mtcxXLwMEb3xMd/t19z2GY/7tAdOLC5LFwnMoXhbJjKaD7U+GogjinWMJyxnCQ==
From: Thomas Richard <thomas.richard@bootlin.com>
To: vigneshr@ti.com,
	s-vadapalli@ti.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	theo.lebrun@bootlin.com
Cc: thomas.petazzoni@bootlin.com,
	kwilczynski@kernel.org,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com,
	u-kumar1@ti.com,
	thomas.richard@bootlin.com
Subject: [PATCH] PCI: j721e: In j721e_pcie_suspend_noirq() check reset_gpio before to use it
Date: Mon,  9 Dec 2024 12:23:21 +0100
Message-Id: <20241209112321.65320-1-thomas.richard@bootlin.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_032332_758908_D1DC9E60 
X-CRM114-Status: UNSURE (   9.83  )
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

The reset_gpio is optional, so in j721e_pcie_suspend_noirq() check if it is
not NULL before to use it.

Fixes: c538d40f365b ("PCI: j721e: Add suspend and resume support")
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 0341d51d6aed..5bc14dd70811 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -644,7 +644,9 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
 	struct j721e_pcie *pcie = dev_get_drvdata(dev);
 
 	if (pcie->mode == PCI_MODE_RC) {
-		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
+		if (pcie->reset_gpio)
+			gpiod_set_value_cansleep(pcie->reset_gpio, 0);
+
 		clk_disable_unprepare(pcie->refclk);
 	}
 
-- 
2.39.5


