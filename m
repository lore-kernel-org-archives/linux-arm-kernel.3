Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAABCD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaWjlNamJmHc6Vj5CnVtmPCxqilnzYjt6Rs02KkOq2k=; b=AKpzrNrn8+FmMhsxYTcaD/Psc5
	kF2iTEMFts0J5251GZeFo1CGm2de0uTFtvgM7c9DLJxN8rvvxVL69j/XUI0fuZNyPY4wZ1YUxVvgI
	Ys73X+ftnlgOKeveFQj8JDGp3C12/pWojMXEUrcgIO0gczA3z8offVHJijrMntGrQefEeIvpvf7Be
	3rKDuPoSGFyNcUwE1eXSBDia8cZTlYqsCjYH+tfcZDYBZ0xWFGJi+Z8m5TRfvLrLoeMlCo2NjWGGl
	IHJhF+gfFBU6Ne6cPG/YL2prQWonMd0q7H7YzH/U6AOmysmOYgWT2rQxZyeyWnQnDRqAajG6GtEvP
	fGdoOrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWDY-00000003Aq5-0DDC;
	Mon, 08 Jun 2026 09:24:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWDU-00000003Ao0-1OSn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:24:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso32813995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780910658; x=1781515458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaWjlNamJmHc6Vj5CnVtmPCxqilnzYjt6Rs02KkOq2k=;
        b=pdWuxF17R6KD8FfHgYP2j7e0Jh7vGfkOBRC4oHrRVyw7vAVUpavSVYMjsGZDMpPTQl
         iVIsnAQ2VOoFYl+VQ1xNzrrhOS7fqL3fm/EGU5AXAoQHD8AUE6RzS6ANfmpGKm9mnh23
         mU6QozT69v19h1NTzPm4+gRjxzIHdUjxLUcnM9Y8c6JeaWUZsyZAwkiKuWyopUX0tgeh
         GwW4cK2Kpx6SX+tmVetv3IZnS2d4fRvuzxxUO2VEP6cxIRd9SdaWPfxS3aOeOngZulGk
         4iyH+6+tSpAQcv/zxn+uIEyyjAymPVif5B3Gj5fyh2nMbH2l2AUlIKAWtwod8gKrZ17Q
         IKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910658; x=1781515458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PaWjlNamJmHc6Vj5CnVtmPCxqilnzYjt6Rs02KkOq2k=;
        b=QD/K6dXw5j0OVnb+mxsuy/bgV4jN/RDOe/UAHmlxSwzKV4sg1jkL7086LZdt+uHEtt
         yuV0I1bJ8k/Nbdk1ge0+y2ajfYdqcp7Gl0gP2Dki3coDTGyLkUgmXUSJDaTqs9E86eH9
         tvkYcSbmc5nZbifQanP5+AIjPKQDqSDAusJ4a8shXYbCI8SC8qb2rP2GVB2nY6gyfGnc
         afTvquTxol9K8Pq7heO6wxlKQ2Kl2Feo1NkDBwDoOK8TWuPKSS3s2i/I2EDDcI1SlH5s
         u6EyXJCnvO/sKBVIOI3HhWeaXLASI88zUhCP7cpfvtFxnqMVqMKOSO9Z4Omv7xMWEQsk
         BZ8w==
X-Forwarded-Encrypted: i=1; AFNElJ+vekd8a4U8BsF3oUoUPVn9BA2XcVEFoVtbu3U73kST9h6t15iQcWrp5dqrpNTdboQyHJ7dVb+LIKGqDtIhwRCm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6NaviKvRztJgAlshHuDI7k3uj2YPkn1toAwGgFPyAXfxow6Yr
	iJ/tc+XK5n4mk8DVD9mHrPTacOSXzRbyJMyb8k9F/nDamqoDaMXVfaeL
X-Gm-Gg: Acq92OGjd1uQgsA9oBVdAA1mRCEdK+8BmL6Ja0ZpbRKXTCe3zovOl9X483rnqhvDf9S
	DlCCzftFs//gIUhNmWc81BcPha+oQKmt83H8LYQTvnBxQx+ryQERJ1IPSodxup78ISHQlH81thL
	18lFjDpxJGa88d8XVjys5kEM6KAvjumg0rdO/AN6A9j2FV8iEzBiExaGttoZtO7F8+5bUgwke8S
	XyPqpVFDc2m+a/Pze0OdHG6wtXsTMY5XAmXnQbPtGUVUvtogKtantXBtl8tNZdGZcPyG7Q7l2jZ
	N3+XDF3RBBUPokye/mvofrbTffD6Ha/XI75u3E641Z+vwh4SFWa5V5VdDUIrU2XzEYc8kwrlqfU
	H7PnjrcVDU0Sm65sddBHS7+kiWP6ine/aedC6BsRZSceb/SpDbbR1IkTeaQ29wN8AnZrBucA2a6
	DWniQRy1nPL/GjFmVsysCyuTYhz9gbgE3aXXyq8T0eutOCBe+eSjBYF4y+0rt75Ba0/ChQVthuU
	2XDACClAtUgin8NPAhmjCA1T5Vb/XX8iaCOidmpI7T4tiGz
X-Received: by 2002:a05:600c:468a:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490c2a2ea2fmr250385445e9.34.1780910658182;
        Mon, 08 Jun 2026 02:24:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm364812725e9.13.2026.06.08.02.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:24:17 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Mon,  8 Jun 2026 11:24:09 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780910435.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780910435.git.stefano.r@variscite.com>
References: <cover.1780910435.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_022420_387875_CFBB451A 
X-CRM114-Status: UNSURE (   9.18  )
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

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3


