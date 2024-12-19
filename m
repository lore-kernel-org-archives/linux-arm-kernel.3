Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB0DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUvfT27SCPJ/1I/rQ7u1CFfvkxFi4BwZuv6rcMUwBXw=; b=sAXhQdH2VTR1+qgoXxVGCKEBUj
	4jtdE30+DWNUfvR4DAh1VBbr/19WB2M2NKcLMihNKDqoEifxRyvGFvQ5ER3T7ryW4C7i6KxTjeR99
	zQdEMeT92zuyRT7GuZfsmETU+rfKgG60+xp2GpysGT1cmGXSDy9CnjxKLDyZauHxeVriIrg1xYAPh
	/oDnRKenJWJIG1meGjRRuVa0AW3zkITiYdc1kHXpGYu3Hu227etmT3BooYI+uDkAPQDnKR/mgXQrq
	uNDie6vFlDTxbiMv3XjY6ZlRHXgXJiuxRb36NRpFjCkKeK/jZVzafkAHx6KxZe0t2C0jaoP4/4M1h
	2RRNML5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMlq-00000002xrs-1QDb;
	Thu, 19 Dec 2024 20:05:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMft-00000002wLg-1jqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:59:10 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa67333f7d2so203921266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638347; x=1735243147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUvfT27SCPJ/1I/rQ7u1CFfvkxFi4BwZuv6rcMUwBXw=;
        b=qLx1xKqKW8oZmUywX/Q9ZzDNVoWyZYEWJAwvx38Dt312Uo3IohkWsfM+BKwgCAuxnJ
         YMwnFkXs+Vhr1Ojhs4EC8SkHmQ9+dVfMBR/Kaxs9/e9wX/gIha0NnleuvEJInYDhFfH+
         vR7/FARCJWV7XI6w2BYWKwAdorEwZLiryDIH/PBikqGGM3bpOIU5c+0kI+ypdsTyMEtU
         pqhDlopkDHhbC17MR46XIFjoXEopmOO+fzFq0ERojy7R8RswnwPvDhsqiM6uIsiJBQUG
         AH0WqNb6gNbp76uroqxOO0jCSuQjkjEY2XqCX33szz9SQ15Hm6+rS1HsTdRrQNiR9cr4
         bYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638347; x=1735243147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUvfT27SCPJ/1I/rQ7u1CFfvkxFi4BwZuv6rcMUwBXw=;
        b=G4AtdCUNWsYT4lEQmIABNrYLd3xiW1VICAVkyIc24viauL53GTKkJdy0AkiF/smz4+
         04pZcQPTWa3q/39wRbTCzCYui1GRRGfZEHW5UTZQrd5ZCaH6NkWJd9vhNcq9/92MyrpV
         mDfA/75Y4XjoLulb/A9dyxvQ5Pp9ROWxNa22Hxs81r52a0U8VjKCKHOJh6ozZgzy6m1Q
         x4DOKmU9Hv60f1wJKy+bYCBJpZ+IqU1417EpRtRNfmOx+7yTda1uJzyKC7WNIHpYvRpr
         imG9m2Oz/diorT0are1fqkf2pCGt5fTm5x0QLfEbOi4CWoPg9Xzku23+JgYm4WiNFpgN
         W8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNH0eG1BrMa7b1nkl05x9tjzbTaNp7S3nK3D9WrtX6z56TzjKuOOBU2x6V5Ao9WgjHVR2s7W7wyfl9hpBkkCm2@lists.infradead.org
X-Gm-Message-State: AOJu0YyYUioQbRenPf/hMVGM0f1Q8wGsWoglfaWPNZ5F4aRbRBEPIpQF
	X3e3+k6uMCCIikGxLrSqtG5Ly6cDjqrrYLXP5JNC4P63Amnx6ygaRyWm2iSDA0A=
X-Gm-Gg: ASbGncvz/99U5iaW+mUmdNwG2tH4VbOZxgGbknZVqoZI45LghwWW4J+C68q0JXY6q0q
	OBPHtU6ycBTm7bHwEBcboKi9Wmto7RHFWceI/cMrusf6kXdFJiaejiEh6fymdGLR2bRsvTTUdVS
	iWuFqw0J9Ec8g3uRaSpSoHcRFqRMa8qY/uoXly0kQYU1QY0NA7YR4KlBvIP5ulUSUKFbUHx9uPL
	+qWXcKSMgMBM0FMDaPpJ/H3m7T0X1EyqknCrcvK7GuyA2EezA==
X-Google-Smtp-Source: AGHT+IH/fZzedKlcK5U0wriyo0zt+BLfVIxeZ3sOC7b5Lbwtvat8IssszxYlnVAebbWoaHGw9AkAhg==
X-Received: by 2002:a17:906:478f:b0:aa6:6c46:7ca1 with SMTP id a640c23a62f3a-aac27038e93mr8059666b.10.1734638347397;
        Thu, 19 Dec 2024 11:59:07 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b1asm98230866b.148.2024.12.19.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:07 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 20:57:55 +0100
Subject: [PATCH v6 4/7] can: m_can: Support pinctrl wakeup state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-4-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
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
 h=from:subject:message-id; bh=LNk2Yj//BXYCvnGeYALUx0IGjDCStCiWRmkgerTUxYo=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTqj7dOLK0YW7EhP5JSS/+Pw9YorDKzmGl0NlpLTKp9
 6IzhE/O7ChlYRDjYJAVU2S5+2Hhuzq56wsi1j1yhJnDygQyhIGLUwAmskiIkWHzS+bt04r/yzNO
 9NWQ8zhcIVIzp//2Kaf9Dd8/bmvyuxvP8E9Z5obMcjnNn/5xPz4Z9cxVy8jbcfAce9lGW5mz2Yu
 7bvMAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115909_486033_348E870B 
X-CRM114-Status: GOOD (  17.93  )
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
index e69e9799710b3e4cb267324e8e9db40ca02328e2..ce39685a7c42a2238ad8afd6cf53aa53c9bbb3bb 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2197,6 +2197,7 @@ static void m_can_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct m_can_classdev *cdev = netdev_priv(dev);
+	struct pinctrl_state *new_pinctrl_state = NULL;
 	bool wol_enable = !!(wol->wolopts & WAKE_PHY);
 	int ret;
 
@@ -2213,7 +2214,28 @@ static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
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
@@ -2341,6 +2363,44 @@ int m_can_class_get_clocks(struct m_can_classdev *cdev)
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
@@ -2381,7 +2441,15 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 
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


