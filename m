Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8466082BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nK0aFu1b;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UNF8t2yQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5oG796ZsMIzUdujbfiI9ngeaTwHYr3CIhqpe8MlhOAI=; b=nK0aFu1bCNd49p
	b+0aCRCt7sYgAWhyZC/sjpuOqtGAXF727xT6HCKih7jEob7KLiiSkjWOfnRwmrjzvUzBu/zkIeSBr
	U48lomhkhoNFPSoJB9W1E8QNUv4rL7gr2T3/qhWWG1aCWiGw1JaTmHcaoS7js00ZIODHIbOZ7YHoS
	rSSq6Kinyz3PMZlp7uRhV7xvxB6aZ0BmT6NgergGBujnH+0dgN9MMqFfhUyotewnIiBrvuUFZLgVr
	Q1ah9DgokWYk22b2sJWqKKEy/08pTbEiQQdSANaOVem84edqx6e9doie2SIoT2YBZ3g8A6yCCXAGx
	u7hjoh0aB3Fm/7plLGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAC-00000006TC9-26bk;
	Wed, 04 Nov 2026 18:56:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgA8-00000006T8O-2hsJ;
	Wed, 04 Nov 2026 18:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793818601;
	bh=NQeFSwVzjO3zfx4y+HItj0QcIreheijn672U0YY9ONw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UNF8t2yQlGAceDIjfec70/pti7gUuKeB6SUsyrpBg8GUTPotig4AL9BCXqTX8P8iL
	 OGUUdW03K5ENlee4xEqgLx8a67tVkzTdMMa+F8EIx7nycJxLkhTlE48srYI9W95HnS
	 JSFnNKCoxAm8uXshb7D4E7+cRxtnqDZjV2hZKyxIVyr7TNbHdxiu8qZzv98XNyupNU
	 PSmjiLAuP6+ggUL4ror+gKbrs/+KFe4UeGqEDCRy90MnL0VNUQ6/E0qxpT4an7raAV
	 imODKuEXTmB9oUYCTXIKhfdutNvJTmS8TZpRzQ5KIGVZvoFPIRrneyGFJ/CntpOexP
	 wB4OtTi14awvQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 299E617E0D49;
	Wed, 04 Nov 2026 19:56:41 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D8EB4480031; Wed, 04 Nov 2026 19:56:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 04 Nov 2026 19:56:42 +0100
Subject: [PATCH v7 04/10] PCI: dw-rockchip: Add helper function for
 enhanced LTSSM control mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rockchip-pcie-system-suspend-v7-4-6ae6875939a2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=NQeFSwVzjO3zfx4y+HItj0QcIreheijn672U0YY9ONw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrf+iWzuKb6gXvj3ZCiv/DFzNuW4MAAR1zM
 wKypmemU11B7YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq63/oAAoJENju1/PI
 O/qaTVoQAKe0hiYJkvOaqAipnBuevxZfk2QziuUd/FlkpTU2A06rIkQCCNKS/6wC8Qs6H875tld
 OMWv06XjLGv4tAo9sEge6o0Z5cpQaXWSAg6miOMWgb0TbDk4N+j1WFTW6ub7zP4+huu0H0Y4GBK
 hxlEIL3Pil1Fujd0lSYYoVHimoN11uYRAaHAaS/wsR7wLP68OA4b0L259OZBwrwkxFpTYmrDNcq
 ApB9mHDnRCxY2VKExWxyKsc4N6BOEfdFS4vwsWJ8vh4hu6ZO1GbhAFmidMYMGuKWINRIUQWr32Q
 GVlFWY8XbNq5QftZ80bWdmeHxHPM0vq+jn0X/6OcivPgU6lhhh2Kfz8Eu4xhWR/c0g+RfkutZah
 3wzVMz+sTQHMKnj3NJQxKXP9Pnn2ldH5CgdXLorltbmmBLVxoMmWHduLBftqNLexQeImBPzIm23
 HGpdyt+InHuxnsNrElWweYj0XnwD61UvdwJS84KK196vBaKgHPeWsGbpj8yEeX3F4d2Ahh8EFYD
 VS7NHDJsA9lQ5l1RLh+W3XOu9sjk/C5KRb4elluxwFTlCSoY98yPsxlzbgXCusbY8E6n7kkWmd7
 fqB6XrcVWkwo8iycXEIyHGSkCKshklAXz0k91siYnbHe7HVpJPaxw2k4uqMBhzD81qdt0Jo8ZLu
 rxf3krlNDQ7ChaMT2fkkklA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105644_881627_21E17AE5 
X-CRM114-Status: GOOD (  13.90  )
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
function to setup the enhanced LTSSM mode.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index a3b0fb918479..7645b0895bf9 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -683,6 +683,18 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pcie *rockchip,
+							     bool delay_link_training_after_reset)
+{
+	u32 val;
+
+	/* Enable the enhanced control mode of signal app_ltssm_enable */
+	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
+	if (delay_link_training_after_reset)
+		val |= FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -706,9 +718,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* LTSSM enable control mode */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, false);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
@@ -765,13 +775,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 		return ret;
 	}
 
-	/*
-	 * LTSSM enable control mode, and automatically delay link training on
-	 * hot reset/link-down reset.
-	 */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1) |
-	      FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, true);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),

-- 
2.53.0


