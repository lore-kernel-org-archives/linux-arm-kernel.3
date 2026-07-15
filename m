Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qd0jgdEP7Eyx6NeLkQUSlxLKBmJIoJQHE/UWc0B4BPE=; b=YYJpaBHGsL5LND/JX8FM07kg8u
	a2cRH5QpR9fi1vrAfrWv41CEn9SsuFLUjteYYwiBfW6pm7XrcyuwV5lyQU1VxPO1x5bY4IQBRe+JL
	MN6Jq6TSKqKgYx5rbIJkXkXAYzFj3TWbASHjnsDnQD35RzmjnPUFKQ9UPiCRpQkPqyhPSJOc8AVhu
	6NAwumHfGP59sDaf+kVmtRjPoUMgUQig2TT++7Sz4B53ZBbQGuUsUXGYC1ZHOg9t++JuQg+F+J1Y/
	BDeBSn2VAQvy0ZBgy5KBW119z081/JwgPT7qP1w55bCcuhC3fvSOJjSzmDxVBEmQ44Y27rDqmxEEb
	y4JpDTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxTU-0000000EXG0-2Ev9;
	Wed, 15 Jul 2026 11:08:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxTP-0000000EXD8-1afQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:08:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493f60208a5so45068565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113697; x=1784718497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qd0jgdEP7Eyx6NeLkQUSlxLKBmJIoJQHE/UWc0B4BPE=;
        b=sNpk6rOst+wApbqY/HSVbf06kzU55dSdlQhTQGjcV12aCwE5ysF0Ulcti9vI+Tu4Xy
         KLhi55c80yUdvcOkuxRwmIxhayM48NQFSXLmPZojebbXjrLdey49Rc/IwQLcWtIxtIEU
         NUeXeC41gyg9iJCjVGQbrKeNo9Yx1deIQq4goEpS4IwIHMeOu0Fn6XXqVxhHIu32oiOn
         c5PyWbTwvvzHz+A96MbjEqcVaMURxMhgwllDbOGLVqHQRFmEJsTzxzFwX1JKpyCyQl3D
         v/QJwhEf1za/FO50kRK+nz8R9fBKQhMjXaw2fZy0PNHJBeM3RfeiIAoQVZ0pwVNHWjwJ
         EUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113697; x=1784718497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qd0jgdEP7Eyx6NeLkQUSlxLKBmJIoJQHE/UWc0B4BPE=;
        b=Yg+0Rj6KNMpByIKkQrRNS7QIdwzxpOMaStRVA2RCbFWLYJOur7JJzPrZYikUHBhAxM
         Vc+Pr7jvuv9YcOkmiusJGUWk8ee69/NrQg24wcfc/usFfCtJO04LiD59c3UjndVOcTtS
         WLAQjPPyeHjJAqwaXTsu0Ie+6l555ESEwV+pAZiu5HTjx4xOThlaBDe5PES43oC2NV8A
         xqD/KLe+etGLzX6v+o4wHkMV9An+w1KQltZED3Vx4QratX8Gc9qh8phgyScEgP0EXsNG
         6MqLj+iregScmBOPNYNAq6KPZNQx19Yx+pDz9DBM/XMFznxBsDbRyoZj+Su1VrLYESar
         7cqA==
X-Forwarded-Encrypted: i=1; AHgh+RpgS+PdWqjgJ0j9d53jXDQ4taXzB2RFa0FcbzAfgVc0fHuNmXQFH/9RtAqpW/NKHfn6tFrRxRM7xJ+O4e8gmmQi@lists.infradead.org
X-Gm-Message-State: AOJu0YwNZZj7Z+R+s+FhlZUfqf0yUYehlGfMmHCs4USyVHwtRYRF7YRe
	CYb32z0qVr32+bzw/aw7JiNxhv57hg3Orvjik5huUcVIL8yGUeZ/c+Me
X-Gm-Gg: AfdE7cltzqK7bFGFi0PXQ5wRiaz02c9qiSL6r9rtA1WrDWetQiTbqq+bOEOh28lmf2S
	GwyblWbzKZmOTvCD/IZIJpzDD+rINA3hkmntYM7wVNfXRfzqyw6P3RWS+fbkgt/9YAY0sPJsXRV
	78qACR4UY752T4VcTSvgqUZKB2co0MDwA5W7EzKy8hIndQUcFYKxbcuu2mH4Qp/6og4c1wdj6ce
	E/yHGsiDlYTcK4Tt+a89aC4ELYFA9sK822jNLHuTWbwZFIfpMd7NM/fYs3E0HvsT/xPZtW4g+qc
	kis5S+UX40+t64w6lGtL1p0lru9yoNPdrYkVrvDFYqeuXMygQlUqvv+tZnmSuZyE+hT0mpx8zv/
	dpwcJAXJLINCUUNBF4uy7Ifd6kvzgJZWUG+r9UjWwTLbRcZmW7rwpaLzRhfsa37eN5xlI7xh6iO
	3kdzP8hkA3YFzWys4s5/ZHLCD6KxgzNcU8HZsYXEZrh8xU7Apb0Oz2YjEc4w==
X-Received: by 2002:a7b:c5d9:0:b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-4953c27b35fmr19597025e9.22.1784113697474;
        Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm151389875e9.14.2026.07.15.04.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 13:08:10 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784113547.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784113547.git.stefano.r@variscite.com>
References: <cover.1784113547.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040819_435017_F7E28462 
X-CRM114-Status: UNSURE (   9.16  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3


