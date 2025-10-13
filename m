Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA937CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCJT5qJRzoYDN5HCSmFRUGhqrxSLVQWaebjounZZ2/g=; b=T/ZJajLCsxy58/OvhNyFC7k35r
	m6X/kilfDWy2nVzvbEeL+rFAT8lbWkCfqA+sYRzsWAsFEBDv/19aIwFgFgXCYLHoaNxudnG28LD6d
	JVREKxzwq7Vs4icOXSdDpbQbNpcMoARuRhYtYNDqtwyiJ0eECRM4Jk4lnbbhfBSSgo+tTcqstaO+X
	mRlaXx1oBQPI2Jdbba9xvR97cMPMbBd4dYDWEwYrJhQvM+ke5GfX54D2cm5N3mNew8PbQnn74nF+6
	2RIQJecUoA+mlgCo/zSr0n5n1wFNJOHo5QP5jTALgb7G5WyZtTEvgS+LiZJEObSFVmFIerCFCsb3B
	D52u0HNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWm-0000000EUJI-2Lmh;
	Mon, 13 Oct 2025 20:52:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWi-0000000EUEE-207U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:52:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-330b4739538so4375116a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760388735; x=1760993535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCJT5qJRzoYDN5HCSmFRUGhqrxSLVQWaebjounZZ2/g=;
        b=KcE410PEKjKUcYq3CkozpFKEd1iH/PZWD8UnaqpGKwVwEi5pmmiwamu59j9mcu0Vv2
         GN+T4fiUhSRy1YYdHCiTiNPJfvDxRTfVALqpnFsfKk//FMCR5rbGiYMX6BOBCqiUjF+X
         MJh1MPmGib5GhTh4J4XLtoYltmtaEh3h9dC3SNhqMd/EZTLuw6FXD+5tcHtP0wj04SyH
         4YnTNJQ/nw+L7IazgoKzPzWAaQPdaNpjKZtb2/F1daSuDe57joaue1WXY8iwdF9wFMX8
         uUawhNv7M3NSdjLou1GQY7UpJW5xksAoWwkQYb8d3Z0VaQ5Mi+SGltHPCmai+ONz1Kki
         zEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388735; x=1760993535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCJT5qJRzoYDN5HCSmFRUGhqrxSLVQWaebjounZZ2/g=;
        b=cMaFn7UfHbkxv+M5PI0lom+zD3vSQ4c2Tee4QJXIN/jJC7hwAnMS+eb3Qi7x/GKD1i
         aSH141B9k1pYyZQWshTyVd3PzXKROKClui48L0Urq9UfqQxiXGQHN7zw5BV4Hrf3Mvnd
         hSYaeX/NSVkHUI4ZtL2odmWblv4Y4/G7YFI1qvcDPneWb9rcw86irfYWjOCPM+btgpc7
         AKQtmOqJJZSSp/r5jVsmp4xcY7Dfhko64CCH49hzl1F8kZosDFhG0Zd+lbpRdTq+kzJe
         DU1FU3dGsVKZieft2VORZCgv1XRlUWbgh4i7dB+wYLLLG6YTfRvLjwzHFylskXRQTU92
         FsQw==
X-Forwarded-Encrypted: i=1; AJvYcCUyO7jnR+2/9lIctVDkpJwNZT+CoJi4kGFK71nV6CKd3R3SOdFseU50gftyyTBQ4IQHW3Exr8R//5zDVZJkuOUJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwtXSXezhu8Hr1HYQIpvTb4+etRKM2l58yVI4pDO53/l8+R+AVu
	kY9A2RajLGNlBK3SOEUejZJ78yVv/gMTMILkB5bE1BEiZoVBDcbGxpFC
X-Gm-Gg: ASbGncsYMr5A+SSzT494e9R2Q6m5qr34sKA/mxmdkyCe/Bxf0pQcIdPMWQ364B/8XLE
	zZDMU2IIM0bXaHPCFKGzOri6ezOiVIXFnrJ7kuaziq1917/n/czfayqGIk192fQWKTmBlz0BT/H
	C558B6g1vkNVob5/Q3cZghzukDiaXVaCVDl1obyW9nOGX00G0eE1fz/vspZEJlr1kuIw5X+CqwI
	x44gfg0QGQstnlJJ/9GtQxVvG4UDD7Tu09MHAfmRUD0NBYmdQwLNxpsAJZseJyT+xh32Tgv796A
	Wjq+ZgK2vNIH3Bs37lUUws/6bfqfpXWZ4GSnRuIG4ruehC1rRKZNkjC1Yre32/p2sJHzUN/VFyL
	Z8VLzLQmod6nBev8I8Idu8ThIXzQ874t/6oVDL3mEZnSMBLD+j/eFKDfzmBhUdb5n2Q==
X-Google-Smtp-Source: AGHT+IGSiJ0cJsM0+QkIjYTOvMW3PPxd74LrG+PyQSmnXQ1wow4hy7WMH7D3pl2v9plOVEqf1jvdHg==
X-Received: by 2002:a17:90b:3b8d:b0:332:5349:279 with SMTP id 98e67ed59e1d1-33b51148b30mr30740786a91.3.1760388735130;
        Mon, 13 Oct 2025 13:52:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de,
	stefan@agner.ch,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Mon, 13 Oct 2025 17:51:53 -0300
Message-Id: <20251013205155.1187947-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135216_514038_9DCED411 
X-CRM114-Status: GOOD (  11.11  )
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

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Hi Liu Ying,

Could you please help apply patches 1 and 2 to drm-misc?

I got several Reviewed-by/Acked-by tags on this series, but the patches were
not applied during several kernel cycles.

Thanks

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..ce31b873fb95 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -19,7 +19,6 @@ properties:
       - enum:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
-          - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -32,6 +31,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
@@ -199,7 +202,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1


