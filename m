Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7D4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBAqHiJFBlluHKmrWNHYLsCQylCf5RMzSWDONfpSfgY=; b=n6hqjjZrugDBlzrvvqCAv/YVxD
	i4edQZry7aAvTUV+0sS7lE0/lwpbvcKLGJWwej29pLPKdEEThx+JRrtCO/Bmbm2jjuzvuvH5t+Ljf
	S5KLggE+EMfzd0ilkJM6/nocEbYHopGOlMk2ALjeUm0S7F15mjOfMopEP5b4Zt/fs5ADOobGh8Dvu
	aPJBhJN9HlAGtTp/x5iupU8i+hkh9250K4oOlVanSHCzVvI9rYIl+Gu0SVfEbJjHjc0fDJ1zi0Rt6
	7/dkkkmTCaTB+dKLeK7keuPC5RegyQQF/hvsVR9P1bOWQex/Siy+bZbUpUtHIPIJUfyV+IzucNcWx
	CpW8MPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzduU-00000004T51-2brL;
	Thu, 27 Aug 2026 17:29:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzduM-00000004T0p-10sA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:29:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso17915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851736; x=1788456536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBAqHiJFBlluHKmrWNHYLsCQylCf5RMzSWDONfpSfgY=;
        b=aD8yUyfJARqDlNi7kNvVeIa3VEhVWs6/5sRM9jrPlZ6HWQaF6kIs/+6z4AaE6VrumK
         4cYwtu6Bb4r82Wj9rlWp+ZYeKeaOgs0oCBpI7ZVa4UtPqH3FSFpWoTHU2hhkKWefRggQ
         zWTQ8/pX24P0q8w9JH9WSzV+507AEER+i2JI+47J+KM68f2CSr5Y5yVoYFp5XuBF95l4
         O0Je4Nn3AQm7HaBPmIxAtt/siddcR89sigNIK/dJDFYWkXJIjQ25vvhNemrpv6Zudokm
         5Tn2J6g3smj/e9InJMF0M3jumFA5Up+80yQZKCugSzABsSjG1OZRMpEVlRs6QHiCvkUH
         B8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851736; x=1788456536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBAqHiJFBlluHKmrWNHYLsCQylCf5RMzSWDONfpSfgY=;
        b=MOK+72UwnRos+QUMRBsozBfDSO5ttZuBW0zQ+hMwTr1lNJV8H9oy/kKXAfR4OBom7w
         uD8YF/Vqe3M/uA0nhcS3JzfQKbM3kltzcCjf+JbfS3R5vN9qe/2qz96XOMQNmGGQhbyP
         WPdnEIx/wXzPJRLBO9fYUCQz6BfxoakpxIxrJk+nQJGKbY2UQya8sJJiI9A7Q7Vuzele
         UDKCuBiSk531eSDSxNW4Eh8mPGPxEl/ZvnWM4wWygPLK1WDnD+WP/CAXYyxIhwHcSw+R
         namVVWu2qnG/IYGQTRSJCjcSSCaW9v/3xhLOoZhWhQvjNZVAvcbuxK5u1FtHDzN0tQSv
         UENQ==
X-Forwarded-Encrypted: i=1; AHgh+RqprHWmY+y/8sNJyEHqYEd66UmZUvRYX1lWR5WYqlKNqiJiFf+O1ZAIiPO5vzrr2Q5v/tbUL4/gUpbRXDunsC3l@lists.infradead.org
X-Gm-Message-State: AFuF++neWjSnlIcU99CG6LM/W9ARVlaStcbc+vsakT3DOR/EXLBGRh14
	QhHHny0ePhHAFJcUZb1Cx5oJ6gMq0wrUi1XF5WTa8V8Lakgv+ofexV/l
X-Gm-Gg: AR+sD13Ej5NAUX84MDEpDSa92OXJCRyWNMqlyE3/VLx36IFzQhtDQvTg02EydBbxaBD
	+6sE/4+VHUMTWHC8huWLWLA4Z6ytQjclJb1PYWJUtIBy6KlBO/m0J7zXIk+9XJjY7f5Gpq03RwA
	pNgB8BrUT8OY3kzHmEUReiS3tVEQXXR7BT56xwuudWSfwaD68815wds5xKc4z9YVJlo3calshJy
	hZcD0FOGaLPjOejuTii1yP+Pe1+9P/N5UtEA6y2htWe2E5o7s8TqIuqJ89zywXA65F3s7Rd6U1U
	qS9AXOvRhZr8OwA4m4yo0ZWPItACARDHFV1lFuIET3HtOwkBzciyk2cEY+7bwZ73Z6q2ZGwgENs
	qKYsd7x+hUb8UxdGFts49vqYkb0jkgMg/se+uz6YEPdRLzAtGG6xyMpSc2dJSzAhLgN/kW1RJ1J
	zeLLt1nVe+PbzxN7hP+0MR0Cc4Hi5s58xlIEAQ4Extl/YZw/5c3KQs2LA7i+Re96O6zyuEWQiiz
	4Ga1R9IfO2nG+NgOnsMq1vDdIlSLoGBfMRbcjhoiRT79mGoNvU+pwe+bXiKC3K3Bg==
X-Received: by 2002:a05:600c:46cc:b0:49b:909e:922b with SMTP id 5b1f17b1804b1-49b91c17b6dmr7287535e9.1.1787851735928;
        Thu, 27 Aug 2026 10:28:55 -0700 (PDT)
Received: from GLaDOS.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm2174405e9.0.2026.08.27.10.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:28:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Thu, 27 Aug 2026 19:28:46 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787851637.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787851637.git.stefano.r@variscite.com>
References: <cover.1787851637.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_102858_303984_2356D41E 
X-CRM114-Status: UNSURE (   9.93  )
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

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3


