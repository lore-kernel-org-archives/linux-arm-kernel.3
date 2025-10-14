Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C00CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ECD6YD/9cVcme/PryDiEd6/cZXsWx2lAl+ZUZ5W8UlA=; b=R9CFaniuYaGJDz5Qy357H16J8W
	a2bBrIhI6GEaijSXBFN12YKcqGQa4GJCjjFQQULHKzcSnm+tgOm6tcjEWXXMdD+qr5mh5BcWw8OB7
	1pbHpYGoFuiUDXZTCd1AKT+05qUUSDdLWAps9rCWP4hP1ogjj9yKzsnqH1OsYtyETbzDe/jpnR3y4
	XOFOuItmMdiLTARJPdw3PVjmCY4ASlE6QVYA9RVVMO+7YOMsVES/RCmc0wcQqasdlQFMv/UEJTjTM
	t5hGpiQBCtHTFk12Kk1RtPacVifx8ArTozVnWm8Uf6lfb1Ma/rMSfFcF86UI/qSaqc7ZNWwqlcBH/
	NTsxIoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n2I-0000000HV1i-0mXe;
	Tue, 14 Oct 2025 21:58:26 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8n2F-0000000HV0u-3ZBa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 21:58:25 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmSlL1cmMz9tBF;
	Tue, 14 Oct 2025 23:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ECD6YD/9cVcme/PryDiEd6/cZXsWx2lAl+ZUZ5W8UlA=;
	b=pBEikIK+wtwvSAqqpRB732i7/omGwXf3d8SQ7CVldrydsdHvoqgWetmcCdNvHntoC/qvxC
	HZVzvzeMhylPrn5x7LYs4TaBXBOpZdDD3tU0j1AbgJLzhYV+7eiDFSbdu/1dD1VlgyFwrX
	JYOvJtCqEr1AJ5PVpYcXMlK6TotJU45tGTbYa9sQRXDEBxLCh43IrwLHMlJKu+eICECpny
	jBJAuULpendajw2tvPrMn1CjCywAU26dnA4aI4xOsnFb9z9EAa+ijWG5NlkQQ2M1KnVChJ
	st/Qx6XMVAffMDLjg/o7Rc3FC2ROrtJ0DJY7+ZO2RGbkaqvpLHVmfQ9JV/y9ww==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=snsRmcIz;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ECD6YD/9cVcme/PryDiEd6/cZXsWx2lAl+ZUZ5W8UlA=;
	b=snsRmcIzhz2zONjehPba451aEJcwqxKk4vdTuE8eRF93uf8/e8n10U24xledVckHrAkY9V
	2g7L/Bwax9Mw7U8o6HCRoujAIZgDr103EavOTseOJsorQywzQPja580Y25jD5dKlCezjmy
	RnE6AJM588ZmGtqv34Ndt2JQblXhNHz/SxmRVMNEV+nHMzKNEO1k40bMNc1SlOcPFDzl0H
	oY1qoc1csonb6QOtku1oiK3njoTIjbvaygxFWHwxU2Oop3MfZpGXBQIrBAfqRWi2Qgv6ZQ
	HFEJ56WiiXw8VDJooazjnuEmcyqP04L/OqXkxUiqnGUE2oeIuknggKVdwHFzdw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2] dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX95 support
Date: Tue, 14 Oct 2025 23:57:15 +0200
Message-ID: <20251014215801.51331-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wjwkupjez7okptt7rcxc4om87i55xhh8
X-MBO-RS-ID: 96a075b7f644b75232d
X-Rspamd-Queue-Id: 4cmSlL1cmMz9tBF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_145824_031995_F0CE1DAE 
X-CRM114-Status: UNSURE (   8.60  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: Add RB from Frank
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


