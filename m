Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E472CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=; b=VH3BlmJO7ZL66Z6gXNzwkkP9q8
	ahl05/+XsVvE+nDRAb6gkNsRwKBmpIgeiOOTwOj0MfvrB4Oc8d+3Fxe5b2NzhrVhnCtvKqBsWFNj3
	TsB8h0Ceyt+ZFzDP0VSAC2CvyqXyZIvezDcwNn4zER2pUyIr2SlcprgofDKF2dLmjgGQpfvzYmav+
	Q6OhF+bHhd8hY6YiR3ODEbMlWShcbzO9qMqu7v4y2a76c9uYsUqAbKD9fR6ulEviu1ULc0TgRvTgz
	6KTbBxYdr7HZdbMQOJHdYlWovQPeJP4vRk1uJ8Gm27L5aXrhb+oAE/IVa+qcJ4LfEVbpxnTgL/ma5
	3vC95x6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZag-00000003uyA-3epV;
	Tue, 29 Sep 2026 15:17:58 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZaW-00000003uuE-1k08
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:17:49 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4888129c46eso2467445f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695066; x=1791299866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=cmKB6Rl4xwGytwtyk40CuN5PPasaSQPeG103LyVNnGgDlmKqnWh4icV98X8evdsmIX
         XH8hYn5zPm/9udDmjIFEZ6F2BLM5Gj8MrOFic4BwoxFvm2PEGd/FQSjo5S6QQOJElo3q
         g6aaTNBTIu+/6moGIhIDaQVRgns1zrXijdwC1IMrs7nVAQPgy2qzBfspFLhTcnJtT8AQ
         BxKwmtfSCeAqz+nQeXm367rNdnig5ZNLRSTIPb+bmtQ9KBsZlIzBboCFFi4mypkjihDf
         qTluTxQ9sR+KmBU+7DjWeJwMh3YvMKgDA10kTOVB8LkL2FxPwEIlYqQPirE/gpkkuo6R
         X4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695066; x=1791299866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=U4ANF1STVb6rjYXMGO+lZRoEAwhF64M0b5XnYjRX6PUSLj6jDJuJ6eY6sGk3U21geS
         WUkxHGhG/Aff/q3tQdWSASsU/wkYMiHFm0BBfqVzqEgHaHrLR3X8wdpoqYrJ3/aLs115
         Hg4PC3kMJicfv+hpjE2PREGo8fobZ/Y8+lGAdQE26ZBr99jzHWJ8E1+KkjmuK7rRmDUo
         b/VDnbBJ5YtQtJAmM/kkiIjnfHZ6frutqvSOiY29XdhbdVkXlHMBUM13U+1YkkDL17bC
         D7FlCAIQ/a0mUvNshBtoqS3md6lOg17WzLwjgbU71TAbagZd2Ip57HKk/3U9u62CDG5X
         vIvw==
X-Forwarded-Encrypted: i=1; AKwUvBy2T7pkQ9IpQEjCY55El79gmFt+zI+hEHAL2Q+HY42iL4fRaxOFvRt+zU9jMpIZCb8xooedF8QIvAaCeENcGBjZ@lists.infradead.org
X-Gm-Message-State: AFuF++mNccyVonj0m1+OfPyMkuxSd/Pjbj08DcJJsN7rZmAXxJcrp/ZN
	meoFTopgAB2X38QhyXniutuCpo47SO1rnMEkkgEa87GdOkUY33GQmZnF
X-Gm-Gg: AYBFou34H5HgwVb9zxDykWH8zpGFIxc6zQ8zVzhDjnS0Bi+4e/chLTmtcGxsJFXYmAn
	f2HBAUgatZpsMDr2BPp6KvRNLiy0dMLTRli5pLO1gLU1ADLDjqYbFxCU4X+hZjVNRcOJ1TNgt/L
	Bp0jRWdX29f9ku8Omcn+IPo0wZPd1lek/UU6F8Wb69d7hp1QzxSHSNRUMfFa6kgqa3gaA3gZrUN
	ZMzO8DgOFdwz7hDY1hZ8wpKNIXDhjXKcW+A08P8Qaht72o5PYE/thiWTQulrrLiEmds5dF57saF
	XbkzBgl3sYwMsKSUTUxNX00KvfjCCVhyEQRhKD4kCScN4dtVT7Litq9V+ElM+hDSo+hYWyoA3jr
	BJMUu8sZGTKTLZJWLmmdrgJztEAymqkWbH5XVqxakvHVvUaFuyUs2Pm7SEjxfZRtSzEJCT2w9X8
	8BbMzCgezPV8ZXb1731QJxuCW088fKsbu93hX4U+sp37Gl36bjmX6EuGE6/jdYW1Hwf8qcvKjVy
	gpGebwvMQ1N5mOMiVLBGldU9eKpHUkD5IsBBb5ymI+2H+Ye0cdJxTOsPRrD+3uqJc/p+R91Nq4E
	FjqAItKekTLlvV7Hb24RNg==
X-Received: by 2002:a05:600c:1c2a:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a00c2a48cdmr69280265e9.33.1790695066289;
        Tue, 29 Sep 2026 08:17:46 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:45 -0700 (PDT)
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Tue, 29 Sep 2026 17:17:28 +0200
Message-ID: <c547995bcb14779a5883d855137148ebddb7ef8d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081748_478929_528A578F 
X-CRM114-Status: GOOD (  12.20  )
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

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..233687131adb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,9 +688,46 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ul
+          - const: fsl,imx6ul
+
       - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ulconcerto
+          - enum:
+              - variscite,mx6ulconcerto
+              - variscite,var-som-imx6ul-emmc-sd-card-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-symphony
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ul
           - const: fsl,imx6ul
 
-- 
2.47.3

