Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36425D10F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BWI068vPYLSXZ5RCwTG2CH0PZ4pNstxIHxCa8vD/TIk=; b=fDkrRWilx/TXGsgX0JvKfWyA9s
	p/w4/hbtkddLsvGy0rCY+kvQ3baZw2Bgm0+Dd0NXetdc20KcPhKXSGJkIZAyanyjA+79bABvGWDiP
	O3ewaPzLNSNNnQOpx62JFNC4igJ8pA+bcoxJ/ws1RlXQZwfDZE8aVTXwmSoZfb+ZJEbgox9finwqX
	74DiKA4lKtc/gHtVw7kl1QKVpakGZHr5zhkkuLtD5Amj/kWwgSzpd5n6/HjRQJ40Jb/ARXIlbBsPo
	3APdSBc5M6ZMSGZSyyqdDpvaZgF28saQ3nTMOyrzN0y32YpLH5wgg+JtC9Wia7ixQeGWk1M9gwCIY
	fhDyDzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOG5n-0000000F4QJ-28n7;
	Wed, 26 Nov 2025 14:01:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOG5i-0000000F4Ou-2zHH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:01:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so64799255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764165713; x=1764770513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWI068vPYLSXZ5RCwTG2CH0PZ4pNstxIHxCa8vD/TIk=;
        b=ciuK+u2y0WXtrMByA6jiqP9bg93pkXqyzgieEvEkgLqZgij9T0KX3c8mTU/HhdfqpK
         jAM+/LUV32AqncIXgXMpoLOIbM0W39r8GsrLfi3BFIwbNv6Vh8kvbdxKDyd0IZbrZKgC
         +x09t02MZyUHH5jYzBJ8olBETfZyds7MeN9LoGUNsDGGNq47NKRE4TsS/V+SaEhWa/B7
         27nG2SP8HEpkiA+vVvYXxvTJeVAfdk93xZsaVrA5Wd6H4vQslzi+tgqYz80DuGKD8uqw
         TX4UyJlDFQyliBbN7gdh2QLjSs7DMKt2JTkm694Hw8Rq0fVEMicLL4zue9047M1TIxtc
         17hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165713; x=1764770513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWI068vPYLSXZ5RCwTG2CH0PZ4pNstxIHxCa8vD/TIk=;
        b=i/SpnGn1hpSY25vCiRKuboZFTCO6OZR09skbHulDMf6hJgBfLhf8gARkHzww/2j9p+
         9zeYNkuDRePqgOz7ZJdOw9Ov7hY2831ee9Nv9/YfbLQ8o2HhQSUkDXHLy33ZKfZSJvex
         HtVvaq1o6KCfBa3u6jMGmrOsO1oK7BxPbrGxJ7AWgMjm4UqqTxZ+Vjbpx5uQimFrCgUP
         QmL3OgSKXPO+/51FVuZ7Cb/IlurrN1KgPVsinRHcakklBbdn17sLrCOljtVKZ1jWgKNJ
         FbjXwIGv2i+9vRvr/L7wAvMke6q0GQBd/yswRVuMdD2eDEhQvUGEt76j6iqRH438/8pw
         EsLA==
X-Forwarded-Encrypted: i=1; AJvYcCUrt5ZFE0U5jfZqTTs2P7dMAbOHHRZmsHlO/5oCREahniGcfdJ4aL+n6PyoUY/dfl1a7drevoex1x65b6boT0aT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2+e0GRsQ8X1/IfRyKlFf6bRnsCqf88novpn/7phBsJqzS0/lH
	9dTiijGzXarm81G2cuiiK0IEW9dyvQHPIqQXHLdlXk4KN3xHvVlB/ZZ4
X-Gm-Gg: ASbGncsdkWTGmL5+ycTckbi2dE7eq5nylEA1xo9rmcx9TN+UMNzokoPpaQ+0/v7sCSy
	heAzlgd8FWAJ3SQoaPWoSDzoTCgv+VpuNAGK5M85lmzaEi+ZDiNYA1h0LGAPiY9xjyFyidL2q1l
	YkZmmW2h72Bc5IH+piW/nTOHRZgEqrGUXBE1wf9CD2yAjbb4SHHHBlUFN16+7NLuHIIiyAWFkH9
	1E1TQi8j7Zh9imcygvUW/y0EG1ySE+RGuDvG6XfYPwi7vNU5d7HFHN3SbqAfgwfKRZhOMsyI00z
	zQ0wr7aRE1pFHHCKcs+HOkjgz8a3z6dvh50NoeOhDqd1MIRgNfWl6qrYpcXZZLSQKhxmpnotxuX
	SRr36vlos733u8ghzXQYl3x67lOBl7IsUOPiZbJbplh7L5BDQTyc7QY85FGwKd98QfIZvD8vXAu
	2COChhDNfZTPczk7wEUbZqVuceH3AVAG6vETkKcWTes0MNVK+TyBOyhlHiFJO8hyxQFrMTE3d5L
	01GBvnBrwyJ02RzrBH1+2k=
X-Google-Smtp-Source: AGHT+IFzSn+vJCoVouAYGcpvzgFcmoMn1o28RCuRXQI35098v7LfOQ48EpWiC41admPbMKt9BZI5yQ==
X-Received: by 2002:a05:600c:8b16:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-477c115dc85mr167384395e9.32.1764165712461;
        Wed, 26 Nov 2025 06:01:52 -0800 (PST)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add608bsm46720265e9.5.2025.11.26.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:01:51 -0800 (PST)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	stable@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v2] phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
Date: Wed, 26 Nov 2025 15:01:33 +0100
Message-ID: <20251126140136.1202241-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_060154_986935_B33439BC 
X-CRM114-Status: GOOD (  11.64  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Currently, the PHY only registers the typec orientation switch when it
is built in. If the typec driver is built as a module, the switch
registration is skipped due to the preprocessor condition, causing
orientation detection to fail.

With commit
45fe729be9a6 ("usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n")
the preprocessor condition is not needed anymore and the orientation
switch is correctly registered for both built-in and module builds.

Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
Cc: stable@vger.kernel.org
Suggested-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Drop the preprocessor condition after a better suggestion.
    Reviewed-by Neil tag not added as patch is different
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b94f242420fc..72e8aff38b92 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -124,8 +124,6 @@ struct imx8mq_usb_phy {
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation);
 
-#ifdef CONFIG_TYPEC
-
 static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 				enum typec_orientation orientation)
 {
@@ -173,18 +171,6 @@ static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
 	typec_switch_unregister(sw);
 }
 
-#else
-
-static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
-			struct imx8mq_usb_phy *imx_phy)
-{
-	return NULL;
-}
-
-static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
-
-#endif /* CONFIG_TYPEC */
-
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation)
 {
-- 
2.43.0


