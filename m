Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB1CD3E2A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiJccS24YzbERRopKG6CEKyvgFFySXKUJlR/ejlx6gc=; b=Ryxc2fp5SxFIDhHk2UTfiS8NNW
	pRTMKGIdnNhjKEpi82fLLfb7iTg1Spf9/e0stmNlkbzjz6/rMRWyfPblBJ2VVaqNuzIM9It+m7kjh
	G2VWGTEXT8GEi5IehJDoQFQYF9kbsJD0wWYX4AUeZe59sFCNunH2fFMcHp+6zps0ffbMprA03n+xY
	fR6jyNWWw0N6jkQgTHslzFzEPRSuEp0XzEuTCzP+IhoAnMyvZbT599kLjoUW0K6BrpPh3E6EXhlHm
	QUgQu79QKwAlZ0/W4Y1SXEBhd6idNoCPMBu/L92i+ez+7oGKg0LeKCPX7DMl5P8nP72iysonp8/gm
	QCeIX65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UyV-0000000BvUR-2EyJ;
	Mon, 28 Oct 2024 19:00:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tj9-0000000Bg6o-1uqT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:28 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so2978429f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137226; x=1730742026; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiJccS24YzbERRopKG6CEKyvgFFySXKUJlR/ejlx6gc=;
        b=utyjN4YqUnVgMW6ypzoUXKL/rrkDrgEP3pjcoSi/bcQNZxIavtFmz9OptWWbNFsgnH
         TvXhR907PhY022zwcU5RCZ6O5UGTEmK7QPUI2nfAGBM7GZP7/WWvEBAx/0wPjEdDJWNI
         JjPEXNLWgtTxA65eEBmh2+s/tp2b1NhDhFP7KQOFX2nX/TNfZ0X6J73AT2EicVw136hA
         cing7vCffYe+cAYBIMPIBduntg0Pr4QV7/xKDUzz3lH/KhBeW/Qbq78061MtoA2IM4QP
         KwB6zIWG9o/Tk1vgooU+0HtDDeAHjq9QLOGD9sQktkdL3uVFloI7C6w1YkNuzLZmt22Y
         zHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137226; x=1730742026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiJccS24YzbERRopKG6CEKyvgFFySXKUJlR/ejlx6gc=;
        b=Bb2Nx+N+bGAioGhJjG2DVdmYI0q2Gq0d10t8pnael310FUct3P9XwZJM8UxlfBylx5
         LTOSCuz5iGFA1RVY+iCapjmaZ/ZiwfLdubNiJd3KrHDVvc7bscrBW+m+wHvTm3icupAg
         UkChtDnZqJemKTYKbc5IfrrjQyT/Zhzwp4WNVvGStcuCBSgdGHDv0s91bXpUI2194wtS
         mfq2PZEozzViOQCJujFBXvBl3jh92LeuAYAqgUmHBPRroNL+ZSrLQc9KXGUdA5l+ftsQ
         XNyDbCoGqM4uN4qEdBVHWZH6fbKq/4XstJF4b7VcKQdZq8gSS0o1UYDbqDsJ2kyOqNav
         /PKA==
X-Forwarded-Encrypted: i=1; AJvYcCWkSyhzuv1AelF5va9ib37Re1xR1sDRveqSazunhFkWVczXUj3hjXnszI8yapilh+G6duXF9Keu+nJE7acyP4HI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmsa9jKt4TGddCdMpbNvqlupSVBtxoHAd58TAeMTWlaI3yjW5B
	9fuK+vhFaaLBZddED/mKJs+PHdoQqe5kqWpj28YF+xLwYCUMRCaDcdxQ1d31Cug=
X-Google-Smtp-Source: AGHT+IF1bTuUiXOYCTuy45+oilc80aMb+3rzydWNyd626/C9NhqmYcI5G2GAG8x29z0tzaS8fa7Ybg==
X-Received: by 2002:adf:a444:0:b0:37d:46f4:35 with SMTP id ffacd0b85a97d-380611dc87dmr6493569f8f.45.1730137225466;
        Mon, 28 Oct 2024 10:40:25 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3be78sm10179460f8f.31.2024.10.28.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:25 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:11 +0100
Subject: [PATCH v5 5/9] can: m_can: Support pinctrl wakeup state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-5-33edc0aba629@baylibre.com>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086; i=msp@baylibre.com;
 h=from:subject:message-id; bh=XR3crKyWb+tG9mI1yPCh57mhnmim4HwK+22w7Gd3XFE=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz6TIeQcn3PZZtDPgXIMps8Gqc9lBOhL+PuomwsW9m
 1R1sro6SlkYxDgYZMUUWe5+WPiuTu76goh1jxxh5rAygQxh4OIUgIn0LGf4X1uz+MJTjZO3X1xK
 e7W46GV+xvZ4rUy/5fr+W/pMVMKVXzH8Fd1e12Whxf501YxTMW0KFVzp1mstul7cvWjJ7RKguzW
 AHwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104027_536181_D15B77E5 
X-CRM114-Status: GOOD (  17.39  )
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

am62 requires a wakeup flag being set in pinctrl when mcan pins acts as
a wakeup source. Add support to select the wakeup state if WOL is
enabled.

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c | 68 +++++++++++++++++++++++++++++++++++++++++++
 drivers/net/can/m_can/m_can.h |  4 +++
 2 files changed, 72 insertions(+)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index b7e350ff64cb9cc706b7d53321dffaa079f3a8c0..8c6452d1490c11d365bab598f2abe047f730d24b 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2196,6 +2196,7 @@ static void m_can_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct m_can_classdev *cdev = netdev_priv(dev);
+	struct pinctrl_state *new_pinctrl_state = NULL;
 	bool wol_enable = !!(wol->wolopts & WAKE_PHY);
 	int ret;
 
@@ -2212,7 +2213,28 @@ static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 		return ret;
 	}
 
+	if (wol_enable)
+		new_pinctrl_state = cdev->pinctrl_state_wakeup;
+	else
+		new_pinctrl_state = cdev->pinctrl_state_default;
+
+	if (IS_ERR_OR_NULL(new_pinctrl_state))
+		return 0;
+
+	ret = pinctrl_select_state(cdev->pinctrl, new_pinctrl_state);
+	if (ret) {
+		netdev_err(cdev->net, "Failed to select pinctrl state %pE\n",
+			   ERR_PTR(ret));
+		goto err_wakeup_enable;
+	}
+
 	return 0;
+
+err_wakeup_enable:
+	/* Revert wakeup enable */
+	device_set_wakeup_enable(cdev->dev, !wol_enable);
+
+	return ret;
 }
 
 static const struct ethtool_ops m_can_ethtool_ops_coalescing = {
@@ -2340,6 +2362,44 @@ int m_can_class_get_clocks(struct m_can_classdev *cdev)
 }
 EXPORT_SYMBOL_GPL(m_can_class_get_clocks);
 
+static int m_can_class_setup_optional_pinctrl(struct m_can_classdev *class_dev)
+{
+	struct device *dev = class_dev->dev;
+	int ret;
+
+	class_dev->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(class_dev->pinctrl)) {
+		ret = PTR_ERR(class_dev->pinctrl);
+		class_dev->pinctrl = NULL;
+
+		if (ret == -ENODEV)
+			return 0;
+
+		return dev_err_probe(dev, ret, "Failed to get pinctrl\n");
+	}
+
+	class_dev->pinctrl_state_wakeup =
+		pinctrl_lookup_state(class_dev->pinctrl, "wakeup");
+	if (IS_ERR(class_dev->pinctrl_state_wakeup)) {
+		ret = PTR_ERR(class_dev->pinctrl_state_wakeup);
+		class_dev->pinctrl_state_wakeup = NULL;
+
+		if (ret == -ENODEV)
+			return 0;
+
+		return dev_err_probe(dev, ret, "Failed to lookup pinctrl wakeup state\n");
+	}
+
+	class_dev->pinctrl_state_default =
+		pinctrl_lookup_state(class_dev->pinctrl, "default");
+	if (IS_ERR(class_dev->pinctrl_state_default)) {
+		ret = PTR_ERR(class_dev->pinctrl_state_default);
+		return dev_err_probe(dev, ret, "Failed to lookup pinctrl default state\n");
+	}
+
+	return 0;
+}
+
 struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 						int sizeof_priv)
 {
@@ -2380,7 +2440,15 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 
 	m_can_of_parse_mram(class_dev, mram_config_vals);
 
+	ret = m_can_class_setup_optional_pinctrl(class_dev);
+	if (ret)
+		goto err_free_candev;
+
 	return class_dev;
+
+err_free_candev:
+	free_candev(net_dev);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(m_can_class_allocate_dev);
 
diff --git a/drivers/net/can/m_can/m_can.h b/drivers/net/can/m_can/m_can.h
index 92b2bd8628e6b31370f4accbc2e28f3b2257a71d..b75b0dd6ccc93973d0891daac07c92b61f81dc2a 100644
--- a/drivers/net/can/m_can/m_can.h
+++ b/drivers/net/can/m_can/m_can.h
@@ -126,6 +126,10 @@ struct m_can_classdev {
 	struct mram_cfg mcfg[MRAM_CFG_NUM];
 
 	struct hrtimer hrtimer;
+
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_state_default;
+	struct pinctrl_state *pinctrl_state_wakeup;
 };
 
 struct m_can_classdev *m_can_class_allocate_dev(struct device *dev, int sizeof_priv);

-- 
2.45.2


