Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8385BCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=367A/rZ7UTnDfmjlT6T1zz71iP4ogyv+HPSWUI3+1HQ=; b=3HeUJzZFW/nkzj0BOlBnczCZwc
	HF78lD5TzDncKOgAdIXW03akSl76Cq0XwsJYIt3uCYw1/gQ76u6MqGP4p/2YmVG79DWX7cL04wL4O
	wTedGhaT2AFr0GNuqr4S3Bqjtq0jNnD/nJLPg4QpCmRIp42MMHfs6msGGsoIv7RyV+sjpcq9J2BVt
	R3eNoscFqys1i7jrp5BG6e0n5ONjmyPcTtjfRyIA/Ln/zouFUd09i6fxw3epDtx5nTRQ1tHZZCn2a
	WrIbGuf1JZhHPZdR7rvDHcy/w1B4tjF1BjlS+Y6rz+46m8AolkSv7lCrpRVIY67PoLUn93UCUXVt7
	24eWXYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7dBr-0000000AQbq-46jd;
	Sat, 11 Oct 2025 17:15:31 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7dBp-0000000AQZA-1qWx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:15:31 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVMq1rhTz9sqh;
	Sat, 11 Oct 2025 19:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=367A/rZ7UTnDfmjlT6T1zz71iP4ogyv+HPSWUI3+1HQ=;
	b=qntewtUTmMA/YfdUzZIWaVWE/0T5B8HgFWP50oONfA/vYxCUQ6LKhefnjW5P+NSWI1Vwr+
	AXpD+vgwOV7Dl6y3QKUtFfU2NSF2MYqiCYUpQX7Qm+eij6d2eBDzPAEIEw7S4ogVtZHiAL
	YNiyd2W5/K7FZ+Qe+9fA6CqDrZzZ+Is5rFrd31oZqdHXxVcXfACDb1xepllF7LjAI0gDD1
	vadpeuDmEZc86+E7kXZmKODXmtknynvEpLN+D51k1+SL4DoryHxiaIBlZejsT+zMDlqqzH
	Ir3B3PVFBh4UgUW8ucZATm8MGkz1dgqUh3SCJDUNLC34Dnniamx8RYFQ7/THfA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=367A/rZ7UTnDfmjlT6T1zz71iP4ogyv+HPSWUI3+1HQ=;
	b=ILg7KWpqUEZnRUys6Q17qWzUBE4HkdF+yRnxCXiTmE9Cc/JAbnOedtt+mozTP05FiRr+L/
	CjaXHGX1Fe+Pz/lVBQWmGt/whsOD3W1zbKaknaNJwnajiJJGgARzY8ZYk3nIQqTGBYDf0n
	hkSYjYXxm5Eag6nutiB+i+wcSO7INddln6GL01wI0P2VQPV9lrOfwGxrB6RBot97LWA76E
	84sd1HEhORl1MWnn7HH+T1hLF2gCWNgXa3xUqX2imxgGON+uAAj+BRTFOpR8GFeJycUR5r
	A15MgwVoojIq10liekHgT7Z0+5wIgnU4wR+mm8ul3rBrVbZzrQhqVtQtOFUjFg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 37/39] dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX95 support
Date: Sat, 11 Oct 2025 18:51:52 +0200
Message-ID: <20251011170213.128907-38-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4teipx56a5ji5ytbza95e8jhhftthrwf
X-MBO-RS-ID: 4d16a57372f0a97bb62
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_101529_623144_67B5DFBA 
X-CRM114-Status: UNSURE (   7.74  )
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

Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
backward compatible with "fsl,imx-irqsteer".

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index c49688be10581..5c768c1e159c1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -20,6 +20,7 @@ properties:
               - fsl,imx8qm-irqsteer
               - fsl,imx8qxp-irqsteer
               - fsl,imx94-irqsteer
+              - fsl,imx95-irqsteer
           - const: fsl,imx-irqsteer
 
   reg:
@@ -87,6 +88,7 @@ allOf:
               - fsl,imx8mp-irqsteer
               - fsl,imx8qm-irqsteer
               - fsl,imx8qxp-irqsteer
+              - fsl,imx95-irqsteer
     then:
       required:
         - power-domains
-- 
2.51.0


