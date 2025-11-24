Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2466CCFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0DekikVpLnsKsiER1THEE6pO3XdOQLJ+lM0HCKbOyV8=; b=UNhDtIbadLV8JDYvPj5fSA8fjY
	xYZkL39qt9XhDkz7mOa3uSah/r0TI/L+Zl2NQf/4+I85/WS6kL5tdKKceiIPKQ4WzRpfRfxeMMj+/
	2vkkPHiaOSESVd7uGoJhpI2xcikawJ8tcE6dEEDCir6ptRtqtfpaBVUdQxonghAiOHQX9Bna59Srp
	GrXwhszY2hKjbm2l/44qCV7u30FA82E5GHy5oeBPigLaUGsR4EClz6YjEzy5cBG0jV8LN4M9k7PLt
	SO+KNv6o2fhuklDY/YSJl5b5AFxzEkeS5mHsOlmiP7W3M4WEEKKKc6MGAA18SZMVPAf1tdXUTV/Vw
	2HNB5lEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTDL-0000000BNb9-3oS3;
	Mon, 24 Nov 2025 09:50:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTDI-0000000BNZY-35jm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:50:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b735b89501fso453935066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 01:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763977826; x=1764582626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0DekikVpLnsKsiER1THEE6pO3XdOQLJ+lM0HCKbOyV8=;
        b=KohHrrkU0MiaUfMlCcQfhxm5C1yaYJwXWC6CXfuvS8uXr7I6mtN0WZC4zcurxZDzIU
         n9S6+XzS3hVwg+z2L/mdiZKqS64fLqLR3+OZkDQrroAU9o85oQCAESJdjJ76ah3DZ8kU
         BAIkH8bozye4tnTbqVZ9+Hi4QPdRHGARdG3OBmcEvfd+xg7BIcMcnoO6Fu9tiy/pPShf
         LpfyiGLoLOGRAdUa23IzU0VXRDo0D46k+Rymqs38xXoLNLi93J4ZcvbBSXqiVUHoW3f9
         b9Q7LfjzKS6uPUtAww+uZ++RbGdqDEplQF3xtOE37yR8XG6NQwUG9a5tpm62rlZm4YZ4
         eBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977826; x=1764582626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DekikVpLnsKsiER1THEE6pO3XdOQLJ+lM0HCKbOyV8=;
        b=cWz9mSDAseEAc3Ngcf+Qb7WxjobktUeBLpftOVXVz1tASJ1UiPjNdzKz6veG46a5tK
         SmQIesXVUtPIeg6Jvcs4hFxD2H2sGb5dyAClVrhA81v3ntjrLKhBhqoFxdTev1CvwDbH
         Jl9g2tmNHeQ2fIeST1iyjGKGdKL1von7SZC3Do2YKQAm/kWYWi3FfUD+jALvZpocv+CM
         ioCwE00478WIzGnwovaOHwfu4kE0oAzDUUO4xwKV2FqyOVm0CssawmZ6efdnAHV68EYd
         lwn8P3Y1alzUopFkxr3eWlmSQJaZ13HlTaPWZOu7KA80VZnjjP6phV/f86i4gNb07EwH
         EumQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxVjTzUZPurUOzfbeRngs8FrM31CHMDINLOt8VGl2aicCDu9BaSZYzCnY2bR24wnVL8nI1GMj1JQWPbH3TVkUb@lists.infradead.org
X-Gm-Message-State: AOJu0YxY4+3OTTmKjly9JbgPqMpsvzIZwIzPnUBvAvvtPUN+CrFxgPgY
	P+QhcDP6zWd016bAkDyAMsAYihUGhmC/qyDOF4bH5ilrLBKzFAiHvkE2
X-Gm-Gg: ASbGncvyT4MCQJSt50Hkxssi1AOBTTiqJ0Z3OZAEhc7Hvob4nVI7ojoa0NcnxJMc5Mw
	k4jAMXVlU6qOxPv4cqYsI/srOxUIsAfiK6cWKy6kGErTcl8yOAgF+CG3aBh2ezexgZ7nfRg56y1
	T0PC2/XIXwm8iPPJu+auKn9SiwwgXg/zoEuEwdnGM1j4MdZGCeZ3NREoPuw0DN4oPo8AdPsiHHU
	89UkSKcnXUJag5y3wns1U52YB9bk2i5DJPc1l1K1b/rCZzjQqBR1X4Uk6jP1N2M6zc6QyNMJ0iM
	zezpJFWqhC4egmVGivX6Lf/TOGvejhUbIo1xW6qElDmF/rVhkotrH7S8I1EF6oE2zkyutBKY3DJ
	HL3Jcrsn2Q3sFCJ5mpqc8xsDmEVm3fKhhH+cD2l36rlqnDNHWXYF2kFNdGmdauTIQ62zBzuzOKK
	kcEEL0KeA8HLAJ+r3ha4mhcx6dLnHCpbm0ZCPU6WyfdLbtFRWQDwahYGtJUPHrjcmGHsriM3qS6
	PNknEgjhkyHA9FsIlw9V4k=
X-Google-Smtp-Source: AGHT+IEL8+nySp0VAycSYHZn+I7GwxBVv/UyrBmMEYYVlEgpR7XzCQyUy/x/1//vDbu/fyhX+j6fpQ==
X-Received: by 2002:a17:907:7f19:b0:b73:6534:5984 with SMTP id a640c23a62f3a-b767158cd57mr999143066b.16.1763977826184;
        Mon, 24 Nov 2025 01:50:26 -0800 (PST)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5e0sm1309608566b.1.2025.11.24.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:50:25 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH v1] phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
Date: Mon, 24 Nov 2025 10:50:04 +0100
Message-ID: <20251124095006.588735-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_015028_788569_CB30AB3E 
X-CRM114-Status: GOOD (  12.85  )
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

This patch replaces the preprocessor condition so that the orientation
switch is correctly registered for both built-in and module builds.

Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b94f242420fc..d498a6b7234b 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -124,7 +124,7 @@ struct imx8mq_usb_phy {
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation);
 
-#ifdef CONFIG_TYPEC
+#if IS_ENABLED(CONFIG_TYPEC)
 
 static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 				enum typec_orientation orientation)
-- 
2.43.0


