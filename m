Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B351606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NwFg5Hxb;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hOKa2D6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ih8e64eIFh4zy0l5Dkq2nWyyFdIYsw0j6wRXY/x4Y+s=; b=NwFg5Hxbr5zznq
	eAoe18+Di2UdqjTGm4oA9to704b9YbF95UConLT4Uob4TNtej796MKaHfpco0gl30PuvfdR7wTMJI
	PFovFunezeRsxQKQy8bn2wmSvAg6disSv6FcpQAaJQlP5I91+kU8X8fnpIUWqZQD/uo4uttxCKm4w
	fsBOmJTFfiwxX87Mhu1laogwlA7IawWmK9LqYL4eeqo/Kvi+JGfqETsz2aU+r7/U1KUXN9OIsMEg3
	9Hiv+VNQlr9R6hJWXTrE3i8XzD3rOqI0xEX0nLEv5II1oq3od58NjSlP55q9zgAg0nk7Z2R1Fa1Py
	fcRZwDkFwFnj3uvI0ZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxah-000000098E4-1tHA;
	Thu, 05 Nov 2026 13:33:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxab-0000000989E-34of;
	Thu, 05 Nov 2026 13:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793885591;
	bh=UgCQbv933a+8c/5JcSutP3El6g81sTPPXpwKWLLRMhU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hOKa2D6YvO27XnRIv/j2OhsmqBsRwmSa0ja7Gc1eccBUocTe/LKUaooDCRuS6OfeV
	 pSkDuIEtsgWWh6WVlj8RnR5qPZ12jGf9THuK+3xpYRiiedwAkXYKzqiniG1YvVHb7f
	 KAbLn+9aNrt5Opr6PCrRLlo5x2HFZLkl13TuHv+XHSK+xBV0rs7f5jKBavzGdv2car
	 Hz9cjY3qHjP7UumDw8KiVBa+L0E7vvOnOa1475kbfQDv8GFkT0Mt7a8ePeo1CUg8jX
	 GvXE8hsX3BShNJpcJns7tFOC7VrpQAZ5AkluJ6IWDF1FrjfIXMBNpXB5r4ieU7p8yX
	 zlnzfbLkbrfLg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4034D17E07F6;
	Thu, 05 Nov 2026 14:33:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E245A480029; Thu, 05 Nov 2026 14:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 14:33:09 +0100
Subject: [PATCH v9 1/9] PCI: dw-rockchip: Fix LTSSM set functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v9-1-a2e55846649e@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UgCQbv933a+8c/5JcSutP3El6g81sTPPXpwKWLLRMhU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrshZbD1OCOQCQj4g9smfMOVQHxp2+Xz0N9K
 jMObvDs8UgvoIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7IWWAAoJENju1/PI
 O/qae70P/3iDfK7o83wMlY2zl+YOy+L/Fpd/3IJYua0Yo0PRxK/cVc5Us3bM/J0Oz8rFiKz8jKN
 VX0K5LYcax2VJHb8zRZ6bwB2orcIK4hZgssTznKetm10t2fxdWkuLJsPy5vm9XT8FDMv0HcnG5a
 m7sEikuZKlYqIRC4VZXdnanXba4jMPOyTECf5xxFVn/WfeXqtIv3wfQfN2Luzd1NxxXy/loCIxS
 OSqadegxjtuYNOX3DlQI27x6j7xHKiRtMB2Fm4Dp40xQz6VDdhB1jDPW9z7+jkSmBlRZ9sIXh9b
 CAXa8bYf+jquOBpp5gfcaTS1oYszAkVRWgh6csk1lqnRYM/lW1gNrrC50l4hvNYkbLFCisog+A5
 kvpUwqppXxx/XjTcLLiemj88mBMhxlxE5dN6mYMurOtJZeM6TKbI/fu5pXsTATw6cCIVtt9IcLq
 7ncFD4K7pL5a2r4FVNCUK9zEO/yf0QGJiuBDh/SHbWg4WqpJHsM9K3OIfgpqYrbnC+HHzV1iOif
 mCJg9sUKFdKXUmQtegSsA/pzw8Sin2yT7cGmC3Ogai3l666a+FMTwg9/jdR2+vn/z+En1HgbF+v
 Qiprsv9w71o1vAXyIWBkVYFOE3CIKXvjowXqorykHr9+MMrTRVNOCZco/vLO+coXbQ0MIroEWo/
 Kq5PmaTsx5HMY+uJUUUQ10g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053313_997243_BB1A1AD1 
X-CRM114-Status: GOOD (  12.01  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Before the Rockchip PCIe driver has been switched over to the
FIELD_PREP_WM16 macro, PCIE_CLIENT_ENABLE_LTSSM and
PCIE_CLIENT_DISABLE_LTSSM were setting bits with a mask of 0xc = 0b1100,
which means BIT 2 and BIT 3. After the conversion it only sets bit 2,
with bit 3 being handled by a separate define named
PCIE_CLIENT_LD_RQ_RST_GRT. Apparently the conversion missed to make use
of this new macros resulting in the third bit not being set.

Fixes: 30e919570581 ("PCI: dw-rockchip: Switch to FIELD_PREP_WM16 macro")
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index bd86e32cc2b1..c35c5583c797 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -322,14 +322,16 @@ static void rockchip_pcie_ltssm_trace(struct rockchip_pcie *rockchip,
 
 static void rockchip_pcie_enable_ltssm(struct rockchip_pcie *rockchip)
 {
-	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
-				 PCIE_CLIENT_GENERAL_CON);
+	u32 val = PCIE_CLIENT_ENABLE_LTSSM | PCIE_CLIENT_LD_RQ_RST_GRT;
+
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_GENERAL_CON);
 }
 
 static void rockchip_pcie_disable_ltssm(struct rockchip_pcie *rockchip)
 {
-	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_DISABLE_LTSSM,
-				 PCIE_CLIENT_GENERAL_CON);
+	u32 val = PCIE_CLIENT_DISABLE_LTSSM | PCIE_CLIENT_LD_RQ_RST_GRT;
+
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_GENERAL_CON);
 }
 
 static bool rockchip_pcie_link_up(struct dw_pcie *pci)

-- 
2.53.0


