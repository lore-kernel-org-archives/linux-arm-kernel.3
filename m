Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C89BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0FCkqTWarPZ/Alrb1TBHUBHsPbxEV74UniaSC9ntbI=; b=xGYv0CVF0UmE9dlOtthtBor2kD
	cNW4VyZdPN7EPol0CPG95YvpU6FtcwVwYaiHeuQHLq3Bp4Jifwo4JSz1PvFuKUEwek5Mr9S+lEkYF
	9Y8wFBMAQp8vldA3vMioklhglLyxum9Zq5REZnLaGwZfyafyNR52PFW5e8X3Vhfuj371v4sHi/vOH
	NeZgHTppi5G4fMLLPZ02iHbwWoeTCaVpEBcGc93/dmx8ajzmNixdt7zakQNUVWFoK46Rrgm0h7sCD
	aImHG60v4dvJzENmJsM2q87YXtXy79BoRfFzdCRvaQ1tGIEiYSlgs8OruotsNWW0q9fCobxTS6Bik
	jwogKm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXR-00000006OFS-08Ur;
	Fri, 03 Jul 2026 08:46:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXO-00000006OAo-2qhK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so2100305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068377; x=1783673177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0FCkqTWarPZ/Alrb1TBHUBHsPbxEV74UniaSC9ntbI=;
        b=l2pzITO+mDZK3u1///KggIrsyy9kqT/DbB5KI00EN1Bp8qqQsG/ve1bF9pyBA4ipOu
         7ztZgiNhkgoCWxddw8YOodugs/6lzmo3I4oBIMa9lPnho/Z2GJVMm0RDfLiqwHAaR5vR
         ckET0P53SeZS7t0Pno50I8oZ8ZdhyKUPumeRd64JeMk1Z74TIFzbRkZ/oFjXb2kx9avC
         cp7cm2wxCl9cx/OQSJ0OcL83xAfeKeuVs4BsRqjIYu+HRHZICIM53lsvVLNFfvgvrntO
         LUS29/HOR+wp1FnX8UVlhOOlermQHy9Rb+/D4ifLJQzEXwiK5Nm64tuwyaUtOuQftdd+
         eSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068377; x=1783673177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G0FCkqTWarPZ/Alrb1TBHUBHsPbxEV74UniaSC9ntbI=;
        b=cPPM/z1U8c0pLL7gwQh2fdv3Fit5Y0WHV2xzbLKPiHkzAO8R3Gm4pSrx4WbusQjA/5
         omMY2uXtoddiWO30BXyy0PtUd+HCvF6V1VcLHFaToNf26mZoGpbQcbysYw9NvvIXR9/B
         UXaBNyx3kgvUjmQdAE/TuunVEw35sNuDmZ4CxddGSpdmn5VEky3xJwjMJlD9Zt9UmT+k
         zVd1mbx07o2XUmrubcqvSsmiP4P+/U1iH4+Kz7kACqosuR/HQfxt9Nntz8XSv7/SmN8a
         xveNPZ7p1ULUeMbnPxvf1YduAG+IpVvJ8+Fzh7EipqLNViTJbQFWnsgWeo4Fs5pNQrC2
         Uoog==
X-Forwarded-Encrypted: i=1; AFNElJ+0v4Ak3NqWXj/lq2hUK5HIo2flCWbFnyvN1xVEjUTgcXadVD1aFIDTT7hbX4AplUCp+cnNY0TyaTY9WnrI/01I@lists.infradead.org
X-Gm-Message-State: AOJu0YxqxaVthc2m+Ir7PIxVvemy31sKoG6/WwUZ877ypIFQj+vLQ3Ta
	3H7SB8JgYHhwAG6LU/ic1OJZDd2G+QF0yjnXF4BgXIkvpWBnJ5IZzybp
X-Gm-Gg: AfdE7cm0kypG3zX6Whmo/YLkIdM8VHEKr5F7vHyyAztU0KQhHopm7W3S3bZf1lRHRHl
	omdzHZMAfgoKmIuf1sDPPyCxV/RvgWsTgsHZB7qnRNE1PBYX1DpKYksmJG35mWZbE5YNKJ0ZuhF
	lHZurry9F0l0xp2XCKARFW2K6IbaQmh4eQNfmMU0fvzLguH4C2HxSlLRl/ZpIQUoxvtWxqcSc3z
	hW7FtpDBXZfZ7JHS7xT5d7Y04UvJ8ll9emB7PK7pnDRbeptrOQ7FQJqWjZjYNJK8vszCCG8tu88
	OLO62QVrJbkuOCA8uih/omWVruX+KjfQayfWnnUqePOUUq3u4rMyqzAHwnHvayu2XwJSADLT8fA
	q7Qj8r3tq6QUd4a1rPNukz0T/VziazZM8NDofWf+3WR1+RRHlepl2i88cKNym33HWgFIwWzyyZy
	03DCBe/DphV4N4Dm/wDVd/TKVQju9AAuZQW9yBWaS7ThyGbE6/zc2PKqFeJygCTVLeImYLJqZ5U
	wErRgpfo6fMIgvUA4L2er0J0A==
X-Received: by 2002:a05:600c:19ca:b0:493:cce0:3724 with SMTP id 5b1f17b1804b1-493cce03d79mr16704165e9.4.1783068376592;
        Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 08/15] arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
Date: Fri,  3 Jul 2026 10:45:55 +0200
Message-ID: <3bf0960b005e174b22df28ddf31268f0560f51b9.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014618_751086_9A9204E1 
X-CRM114-Status: GOOD (  10.84  )
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

The VAR-SOM-MX8MN module does not provide an onboard USB connector.

The complete USB OTG description, including the Type-C role switch
configuration, is already provided by the Symphony carrier board device
tree. Remove the duplicate USB OTG node from the SOM dtsi to avoid
describing the same hardware in two places.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index ff5f658b33de..0abc2d33e711 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -365,12 +365,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.47.3


