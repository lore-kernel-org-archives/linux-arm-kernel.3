Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BBCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXT10w3JwIzjDNmgL5a3o8h4+fjE6CRvvk0IUCmWmyY=; b=MDQzHdSuHw0NibPNf+9+UwpJkY
	uw05zYkYac0tnSJ45/wqSu1fiA/omX913fvTXbNRJ8noUgVGbrOxfdRaPV6TbDVrHgB/Zx8kWfR4n
	MYxVdCWJqSxQWKedK9TQYUAEfA4PwOmcE/0KhfTzdNCcG8nnH5BF+VV+Ien9R+zoexidXh3EFZ/qG
	GmxHiihLZ2PF+Gt95aKA0pNHQOSnQCYZLyCrHU1aeObK5fFy7uMhiW37bEc5PbqSXhaeh04YYGnEP
	8Vqi0yzIyE9xJ//bltBL84z/xDCBUefceFCfxUNAuK/rRbfx8OA9u1gjHmNb6G585KVBjFajpDX1E
	vp0hPsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkrY-00000003gdn-38dt;
	Mon, 24 Mar 2025 16:41:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkgs-00000003eTr-0uFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:30:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so28972405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833817; x=1743438617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXT10w3JwIzjDNmgL5a3o8h4+fjE6CRvvk0IUCmWmyY=;
        b=Mp+cpqezSqMrCQq+hggJ6GO2/pDT+1/hGOYxbZYYO3ldUKoo69nmlf9E5Q3BvKvD4f
         TFMxGcWl/ayiVrmRzwgHhCyGFG9ivq4R1wIyZmbYeu5qOtyGRkbFVeXRxuCsv8XEwkKp
         VHAOm3iPNHli36CAOUQROW41bqQ2FwnDudwcpRss9vUzjGXy0TBixpA5/g26wp/3+4xa
         6AX9OR6hA8KaNMUTD2N05CfuEL9gYkeo/Pil2vyrJbFqCGdGGPYRdNL4fIh1U1aJ5mbR
         F1P/aZ9/13QsaJMSeeBMT+N4Wjvhx6uYPJ1EBy4mTRjUbfQvo1+6+a8yFENs3/jVrRHC
         kyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833817; x=1743438617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXT10w3JwIzjDNmgL5a3o8h4+fjE6CRvvk0IUCmWmyY=;
        b=iNOe/vsKnQLMR3601KAstFud9l0xzoBa9RkWm7OwV593Ua1G/ZqqIRqVDNIwgqthWt
         1LQpnHrdT1IO148vhq2w7neNhp3k/0pWpW7gxG23rnmV8ZhLl9nyCRePlzYTP7R0iVFq
         33zd888Ui2LZS5zmzBTahJTN8NsfedUYVOZhDRKD8L++SIpgxZFPDSsaXmWKGCnfEgUH
         Una0nU8uBhM0VXidEjbhi5c3skqlbF14kdrgRojULxA+5fSOAnP2NTP+VwaUBIs/v81O
         QxX/FbQPa09oN0riDUS2a2yoTzSb1QEgQa4a5u4QGEw9aRNzph/1Jnyy+AdLseHvoSMk
         yCTA==
X-Forwarded-Encrypted: i=1; AJvYcCWGwSQmOh7k0WKmtv5Ab07o44AquqwkDqKOcYT9knEA0UCfDon7ffoKlFFN++5K5YsWC3Crg0a1wkC1RbL2qqm8@lists.infradead.org
X-Gm-Message-State: AOJu0YzgUvmXsvjrJ6xRF8OmqHo5mMX+0MD5ZpPB2BOiyr/KP+x8rXDS
	Hcgxa29LGlb2oQWQSW7KAVfRycXfk7NLgxcLPgrKB2vVny9x5f55
X-Gm-Gg: ASbGncvB7xSEqOmO1Mgvujgoy7oKp/jkh6/udIIN7oDi8sOe61PHwkfeLci6lInh7jz
	rwmqA/Hn35KsTaCINOyO9IUHQ2xi6NVN2JWdLTwFu5IQZs87O7RMWkl98V7PdKI1Qx0McNW7Yt9
	WyBwoVCdVVpGJzm8h9xoiDLzm2lBMhuSxXXt/YeI9FQ9N/iefl1h6fNZw5tE/NPVyGu8XHDvB05
	z5PdOMtaGGNjS7Kz6RZrvoVy5a/jmS5/ed+DbJKhWjRyi8BaD8zVT3fAEKlXtnZBFwDsgPmSsFB
	ZB9d8u0VzfKY5wTTZTTfSSndS5ZA8dJRGLUF9wlfvFza7xSSaLKQMDRa2XC4P/VuYGZYiVAfXb9
	ayDV1Olo=
X-Google-Smtp-Source: AGHT+IFx9LdNvoxcmfurF69vi4WC8lka5DNxoYeKcQFuNnicURHcUqXEChK3XzKRjFR0RH0cV+xM3Q==
X-Received: by 2002:a05:600c:1546:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43d50a524a8mr131049695e9.31.1742833816586;
        Mon, 24 Mar 2025 09:30:16 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:16 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Mon, 24 Mar 2025 12:25:55 -0400
Message-Id: <20250324162556.30972-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093018_254662_D3A33830 
X-CRM114-Status: GOOD (  14.84  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..ce9f6da1e257 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1400,10 +1400,13 @@ eqos: ethernet@30bf0000 {
 		};
 
 		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
+			reg-names = "bus", "ac";
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <0>;
 			ranges;
 
 			spba-bus@30c00000 {
-- 
2.34.1


