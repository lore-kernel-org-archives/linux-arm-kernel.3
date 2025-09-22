Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A841CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 23:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8P93O7mFuM2RNG5Gl6sjJK4baF70StwSvvALSzglIM=; b=pN2pcjB4f42qCGgBi2mH4KgCZF
	uwIgnhpaIXdxT/Y/LBYt8XyHfPJu2W2usbPxv7A9ahXNuIYP5Q/DB/pN2Y9ZdGRDvD48HWmyOSqcY
	GpgG044B1QSZ8M70Woye7wbuAw4vFQbCo4Ly+yr6U4pYBFcxULo03KB36+19rrDUHMfklnit3os/p
	mBgvYN8Jg5BWa0DtfQPGMu1+pFIUvWiz/95I7oy65yq2Z6FfxnglNzgdNdQG88nO++wd6a55lR7bn
	4P84+8fCLFywIX601Jyr1q6CmD5ST5E7uRNQDklGgFszgVwi4J/zNz9NkCbeUWFotR+zz/evQxPaZ
	MhLaPEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pup-0000000BkZO-1FLf;
	Mon, 22 Sep 2025 23:25:51 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pun-0000000BkYd-0c5y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 23:25:50 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so43602076d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758583548; x=1759188348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8P93O7mFuM2RNG5Gl6sjJK4baF70StwSvvALSzglIM=;
        b=lYT36X5Ppj8tS1r3Yqw5P9XOu1PiBRI7D9r17R5uDeuDwyL/L+NbiTOH9lXLArNrax
         7ywNEw0pCNtG5HmjNpoAcE4ndM01q3lFxxgYBcQjt5jxLIoyfBPdCFr7HkxDpf6uc+x1
         oyRC8WcUZYxOUnbshLm1Bt3c9Fvsa8fbil0cvrOf4skmEyRcMaRm7ILt8xTMoqB/xAS9
         eIDzIH6nRC3SKk84Wa+p1dDHxWUKIp+G3kkHOfCUHOVwbbBjj0bkBGn3xqDxKV6WqUjY
         goZSMKn0O99V/XeuW0koFayCA6WKW4G4QY5fQm0FStvtNua+H9U0b9GZloE8Yveq8JdG
         QX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758583548; x=1759188348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8P93O7mFuM2RNG5Gl6sjJK4baF70StwSvvALSzglIM=;
        b=O1noLV+HetXdE0CY/+hK71rAjFc6gBpNoPycFRH2QujYlXEJA5woAulK0sacqCbC0F
         G4drxgYbeE9KXMykMDZJAm+aktBkQKOJs2u2hm2ZTxtRszHnhLZk9tJTgWgyl2UOJDIo
         Lg+pw/stk/hmkcRMUk8FXuStREcT5Tjds1nz3HyM9bd6sV/kgOIVHuc9sNf1oKc3yECq
         58hOji6ZWr6vAEIKdLYX201fzreVEX+iklQf1i31vvlKfR4lMI10PjZQ9VHf7nE+BHmQ
         CNwKu0QRD+DzpH1uTT8rebeVGT6XiZ3/5jZblnlpc4ECew2r5eaaLArGqnnWYVbYSl31
         jqLg==
X-Forwarded-Encrypted: i=1; AJvYcCWeEDvIDjIaxJjMBmi+6fR9kV97J5NT4QlAIrkr0XJfUnNaxtQjWFMQ9NgT2ssVktyn5NSs/4XEkHX/QIfKZLbS@lists.infradead.org
X-Gm-Message-State: AOJu0YwTTBvE/E/JjOBBCx4aMIyrR8BL0fqrIZRUdi51/f23AEh2QKPV
	F5LCpGsKtJSfgotyq0vTLz39PV6oOndlwYuEL0xcMXEGHMN1AJO5zK1S
X-Gm-Gg: ASbGncu9R6vYLYT9rx6ARSbMay45BsDGGbblKbbuFlPhE6/fomcT7NZTs7JxsWQgSvy
	m03wTwQanuu+9mvD3e6WTRq4pxti4bolBkRmV0hV9synwgo1LZV1Q/C0bFgfSKiZCZOxSTrsNiW
	tiwcCJjY+mn+QgcTLlIW9d4M5N1deIoPRuF2ZO6Xm0NMMIw5IYKVP7XgoAXZ2FQRPdiGbpH6Jfe
	2qU/7xmlwXmgFV78Q/gM8Ys7RaA26BdZt45yiVLusYm+HKDT2UrRQPWsf571pPDRiImyczN3xLy
	3T/mDrFH/w5379uWKHWuVuU8LaewzWvk+GzelhX7+OTGYlkTjaxEuop7vwnYZUWdEWXswpP5U1X
	U7+ZEgOKVTFE89L4fjQjrlZy8aT2sK8HD3njxbrxY
X-Google-Smtp-Source: AGHT+IFbSBgrLxfeIQurMy9quETHgDR5erLT96k/GtUBVfyP12lxyT/MwQ6vyqqabYOGY6hcIz9rTg==
X-Received: by 2002:ad4:5ce1:0:b0:777:2f9d:71ca with SMTP id 6a1803df08f44-7e719766627mr7924456d6.56.1758583547736;
        Mon, 22 Sep 2025 16:25:47 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793548c63desm79417226d6.57.2025.09.22.16.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 16:25:47 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: xiaofeng.wei@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Mon, 22 Sep 2025 19:25:22 -0400
Message-Id: <20250922232523.844633-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_162549_191698_31345722 
X-CRM114-Status: UNSURE (   8.87  )
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

Add device tree compatible string for the i.MX8MP FRDM board.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

No changes in v3

No changes in v2


 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..8bddf1f8a78d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1


