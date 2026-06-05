Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056E2CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZkK5iRkM+bFu8r36hoA1oZzT41u9/qmzwRkx8FhOsM=; b=V3CVvS0QUNsPVaSETxAOWOJOac
	HL4HfOv96ocrhB0XKLLdoj5/iz6mi4/QohXZdI6c2h5mIITAXhn0qUgUkfCe+KAq27XG/6RpqZ9lG
	1JLHhD2yYvnTr+SfXTGEGrbvw0yCKpBL8xKrLrVKzj0pS7UPrlyeA6OqANRf40cArrJXtGUUoPyNq
	r5GRIOXuxwQivfwwvkeY4OaE3rs5mHScNJo7/OYY4s5QOSkb76jHORPnmwlohf19cWIkXV1XMgDp1
	tYxuZhIROAlbgThmcOZdPWFcELBqaeMYwYxs95A/xZe0j+imgrG8a+rdiaZmEJCpvjFMFtSIyYX+U
	o507+3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvU-0000000HTfX-4Ak6;
	Fri, 05 Jun 2026 01:00:44 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvR-0000000HTcp-3nbx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:43 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4864a8e80bbso912065b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621241; x=1781226041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZkK5iRkM+bFu8r36hoA1oZzT41u9/qmzwRkx8FhOsM=;
        b=0u9+/9U7nI2TvMml/ML4fEmpUftMTSZUWTm6iTx7GxLEPO5Ic6tGKulIY2RRMKktEP
         Zgku70bOUuCYybs7MZ1ENcbT6FL3XF1My8rtRnuPhN8WxMJLrShUDGG4yfDwNGlIsQ/o
         Oc+AA0BhXNbIhgG0TCJWlQIRV1Tgr7/WrJm75Ko+vgT92gKZ8D/LKe7lIZ7ZakJ9soWQ
         WVGx1PCH9/wJSsTpe8ObukbEaP7xzHyhtpOti62vNxm+DdbuRwCGm02uwAyIqMnG7axv
         OeR/NL8sC7jS4uDs2VUq1u1kLc9YTxdSYvDnjNoW5DnsVeRM5Dgt5Yy3Rlc5SN/ZyoN2
         yQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621241; x=1781226041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZkK5iRkM+bFu8r36hoA1oZzT41u9/qmzwRkx8FhOsM=;
        b=E2i0cf24o6Vc5zHG99nccofA5P3t+NS6m4wmfxNAP0O+z8xPYeUy49K4tPecr1HJEB
         HnmtUmiL8iYIy59SSSn9tZ0cDRmmf99FYUcU2wZx550MiAcKp0KVxkNPNVcyQf+Uj+d4
         fUC1zLIvpP5Cc30f8C1UhWKh8Sw6plZSm8KkaJkvimw7cO5rE4aDCyn06It29G/CXZJJ
         wHZIEw9jjL74ZtqF6h1mkn5u5jZx5uxANiyiZILKX9YiOPqVGQ0VhfA0UENs8UtvEhj/
         6MredPkFY3JBOvG00LItPwMlwLNNKNz6n47zLyFV4O/ZYSh4At6CUtr1yakxQgT54Q0k
         8lmg==
X-Forwarded-Encrypted: i=1; AFNElJ+dx8uBepPgMoE/TKN0GFtaQ1VJsGIa72f7iKsHqOeX7vW65lid9YxcHXKBS22RVhJU83JmKAoEVvTytDqBsxzZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwIxJYPf/2anrfxdieAXa8gXo40P/LqtctGPB8FSEqEvhBI/2fd
	+G6cQu39MjVgbQAL4KxQ2emYyhwGoRagGCTPDEGNRHn4TwyOi04FZDnXIYc4dl9/EF4=
X-Gm-Gg: Acq92OEb+hQW9yRch2HZP/EWKoPmjJ4STQFF1vqS49I8Shlr/ioId4aU+WDfo6bB4WF
	cHK+ulYol3WUP523+58yElEx1pD0+pDcUh5Scy58mocU2mPmXxtB7vcILZPisIdO6IbNp/upp3w
	JgHegDxI/TX8cYg3K9b5TJnLJDKgrvNamb1TF8KO1DKFFMrcNcFOwBgcz+0ITfGOtV+2f/H57qU
	SI0hXiw4f+ZwtEgX0XfNqy0nomyd7FqCIPqHS3t0Gl5FQG/K0e82dBEXw+YMogvFV8FJ6SgHzLd
	QE0Hnaj/ECffPVh2j4RVdQCgKoRMlPtZNdPVDrKQ8V8pW4/gNuyAkAhBch35ez2xj0LKQeZ1QYx
	IIATflOSwbfJOYXfhKrvhLxX3N2rDnLyzYrknBgdDHokXwJjlpn2sezOUN+tmeqGRDOuX5mri2g
	gpAy+Pq1gmm/tWXM5FblAUL3E50o7UC0LVM6r5bg==
X-Received: by 2002:a05:6808:1b0e:b0:467:5f1:fc93 with SMTP id 5614622812f47-4868dbe795amr869921b6e.9.1780621240655;
        Thu, 04 Jun 2026 18:00:40 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 04/14] net: pcs: xpcs: re-order xpcs_pre_config() to update after the reset
Date: Thu,  4 Jun 2026 20:00:11 -0500
Message-ID: <20260605010022.968612-5-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180041_955014_EFE794BB 
X-CRM114-Status: GOOD (  18.82  )
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

From: Daniel Thompson <daniel@riscstar.com>

Currently, on Wangxun platforms, the XPCS is configured during the call
to xpcs_switch_interface_mode() and, if the need_reset flag is set, the
XPCS is reset and the configuration will be lost. This is harmless at
present because need_reset will never actually be set on these platforms.

Nevertheless having xpcs_switch_interface_mode() on the wrong side of
the reset is an obstacle for future changes where wiping out programmed
configuration with a reset could be harmful.

Reorder xpcs_pre_config() to allow the reset can happen before we
switch interface mode. To make this work we have to hoist the special
case logic for SGMII into the parent function.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 56 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e69fa2f0a0e8d..76c04372b5b50 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -705,46 +705,50 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
 				      phy_interface_t interface)
 {
-	int ret = 0;
+	/* Wangxun provides a full alternative implementation to handle quirks */
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
+		return txgbe_xpcs_switch_mode(xpcs, interface);
 
-	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
-		ret = txgbe_xpcs_switch_mode(xpcs, interface);
-	} else if (xpcs->interface != interface) {
-		if (interface == PHY_INTERFACE_MODE_SGMII)
-			xpcs->need_reset = true;
-		xpcs->interface = interface;
-	}
+	xpcs->interface = interface;
 
-	return ret;
+	return 0;
 }
 
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 	const struct dw_xpcs_compat *compat;
+	bool force_reset;
 	int ret;
 
+	/*
+	 * According to the XPCS datasheet, a soft reset is required to initiate
+	 * Clause 37 auto-negotiation when the XPCS switches interface modes.
+	 */
+	force_reset = interface == PHY_INTERFACE_MODE_SGMII;
+
+	if (force_reset || xpcs->need_reset) {
+		compat = xpcs_find_compat(xpcs, interface);
+		if (!compat) {
+			dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
+				phy_modes(interface));
+			return;
+		}
+
+		ret = xpcs_soft_reset(xpcs, compat);
+		if (ret) {
+			dev_err(&xpcs->mdiodev->dev, "soft reset failed: %pe\n",
+				ERR_PTR(ret));
+			return;
+		}
+
+		xpcs->need_reset = false;
+	}
+
 	ret = xpcs_switch_interface_mode(xpcs, interface);
 	if (ret)
 		dev_err(&xpcs->mdiodev->dev, "switch interface failed: %pe\n",
 			ERR_PTR(ret));
-
-	if (!xpcs->need_reset)
-		return;
-
-	compat = xpcs_find_compat(xpcs, interface);
-	if (!compat) {
-		dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
-			phy_modes(interface));
-		return;
-	}
-
-	ret = xpcs_soft_reset(xpcs, compat);
-	if (ret)
-		dev_err(&xpcs->mdiodev->dev, "soft reset failed: %pe\n",
-			ERR_PTR(ret));
-
-	xpcs->need_reset = false;
 }
 
 static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
-- 
2.51.0


