Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A993B60A260F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fm54kXDm;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JCZ/efHi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rxgX/NZJyDSaUF0l+bWb1KVC9zUm/fwoXq8hASaNyw8=; b=fm54kXDm+HI8Km
	AfSaUq9ztyQCLAi8hvQuYSzpnuf3wc0H3AeKEbRCcgA3uW+LGNAlqBLybRwvhCNEocuyIKeh8ollg
	5sGcWzUdMYNoqtNwuzE5UBmNneZNJeUv7K/dRRsgLtKQOAqab9BLzS5eqMtXPTzK1LExLaN7fz8I+
	+YwSIbM+qpOruvDsCkkSCHfI673Wu6lR3qkx8suBZ8VVGySf48pkOR/TXC2BTRPdMiTP4LP3nNHsN
	D8MIU/WJCB2YVLrEjErUz1+k0EaBvZkJ/sBxJldnQWIZwZ5B7QXwMUIKhSEP4yyphPkc1B88MX8xC
	m6Q2Bnm5CTPGAYE8rbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAP-00000006TSP-1zV0;
	Wed, 04 Nov 2026 18:57:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAC-00000006TAS-2T4U;
	Wed, 04 Nov 2026 18:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793818601;
	bh=QQAYFAnTkv/pKIj0b3J4mqLvwbwXUkjQ5XKgIr1HDrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JCZ/efHiiifVEuMohhJVYz8qE0A67S6Cvc1gYvH9zJyZzirjvhqZu4DjmTFkvKaSF
	 BoOnst6VXb7un24YYLMglkKkbGEWy7rzbm01vcwOu3AK11oyrrI4cFHW9Eg8+EpD4q
	 AWO+u4H0onJrj6dkQx8adl0TrcXJATk/m/mxezDWLSeASoJrtIaSNuhd4v+XuxGoXU
	 qqXbqXUFUsp2i0C9rjQ98IzFmqsuneRbNJrR3B5X5U2mKTLRGUzP+H0Fnrq6Y9+MbP
	 VFnvDMsIAHGZWGS/0Vs8BU87DnBiCWSKIPTil1OoWi8IQkCr5W2Bl7/04miNE20JQ/
	 EwwEZwucbyWtA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7836917E0D58;
	Wed, 04 Nov 2026 19:56:41 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DC52B480038; Wed, 04 Nov 2026 19:56:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 04 Nov 2026 19:56:44 +0100
Subject: [PATCH v7 06/10] PCI: dw-rockchip: Add helper function for DDL
 indicator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rockchip-pcie-system-suspend-v7-6-6ae6875939a2@collabora.com>
References: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
In-Reply-To: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=QQAYFAnTkv/pKIj0b3J4mqLvwbwXUkjQ5XKgIr1HDrc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrf+hlASs/JMY/QpkQeL7gOYJZ7+g0jX7bk
 npIxXbuj3ztWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq63/oAAoJENju1/PI
 O/qaAIAP/ifXji7ytsHrKBQb3pwhTwW0oBcsIMi98OWsF8SPdY6krk1bK98l0E3KE2GIww8Gh0H
 DsDB+lLTMThbjV02FyPxgd9Tsvkfpc/Esjbsd7GUxDMqaFSjOBLmifv7CEaI7FH3w9dFeK5h9M5
 K40oog1eUlR25wG823Mm1TJ6zcvZShgfxVOv58sxfOMNLDKZTAc/YWxPMN3DgXvzk/2uIVJG5Ku
 60S1ht+aRzRdSew3dBMqShlKOXBQuQTVeb9W/nrCZ1d6fM0B2e80ObkhNU3yhMeROHS+cu/jO0Z
 IBaZcgLZCr1mZbrxOGU2HzGXXTECIlb+CC2I0B3FcAoKmtv6n7cxd4l1ltX32ZjUclqZYF9ykpP
 tuY2KwpMFKDo+MVQ6K84t9wIB3Ysf/BmFiP4MKMMYU0oyJZsod63/UCOg9LDYFVS4U96NREefJH
 oiwLY57ecUauIfVaxLWtvUdQH5S/oRnX6srWpbZc+PLsKBzWDB+X0zAxIuzZGdCQ5vKGU+ejoKp
 addaHidF8AuRAzZeUx7aO5flgKu94CDqFOrT528Iud2h5SInVJAgC6MdMXMS6wOd0cy04g8tjzZ
 FjzgU6cP8ibY66XU5GUy07RwDZk6vRd3zGVKXDNcbWvhGexrS7zUnkPTpeub4Ujp50TMD6SlLtF
 yawPK4hKnl+I9FXiRWyIuTA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105648_838028_7C0FB9F4 
X-CRM114-Status: GOOD (  13.85  )
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

Remove code duplication and improve readability by introducing a new
function to setup the DLL indicator.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 18dce2f52a27..f089dab4acf0 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -700,6 +700,16 @@ static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u3
 	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
 }
 
+static void rockchip_pcie_unmask_dll_indicator(struct rockchip_pcie *rockchip)
+{
+	u32 val;
+
+	/* unmask DLL up/down indicator and hot reset/link-down reset */
+	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
+	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -760,7 +770,6 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	int irq, ret;
-	u32 val;
 
 	if (!IS_ENABLED(CONFIG_PCIE_ROCKCHIP_DW_EP))
 		return -ENODEV;
@@ -800,10 +809,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 
 	pci_epc_init_notify(rockchip->pci.ep.epc);
 
-	/* unmask DLL up/down indicator and hot reset/link-down reset */
-	val = FIELD_PREP_WM16(PCIE_RDLH_LINK_UP_CHGED, 0) |
-	      FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+	rockchip_pcie_unmask_dll_indicator(rockchip);
 
 	return ret;
 }

-- 
2.53.0


