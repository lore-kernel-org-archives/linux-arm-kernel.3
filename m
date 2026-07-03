Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96378C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+y5W164dlcrJTGRumnXkL5RSs7h3mqolWsnSZSGBcDE=; b=Q5qS12rOvrat4hNbjCCUtT+MJv
	03o6Lc4B0ECU/4e42NCoqVmHrdupZjMDyjMqU2AYExA4YyQcFLmjff51iImJLfix3LT9+e54HE3Xo
	R90QB9g/YDo+L0VdN+/ktleRYnIvwRTU1T+smRSBfYKY2L1KVcVkzBc43ee/a+3TNEJRi0bHj12TE
	JiYciPCOYz2Xrqolb55xcIRjGw2RkC/Wv86FfSg3cYua71NQjLQSQ+YUw+vBZoqZvIouD22SBkBHd
	oNs1Phbv2i/i0QXJK6r0y/MAY8/Df6AfcDaK5g08oqi3zkymrgJxl/uBPL4OaW5qTsZve9qasAPVr
	RmWWeiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXb-00000006OWL-0agD;
	Fri, 03 Jul 2026 08:46:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXU-00000006OIL-06ig
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b77b150aso2269195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068382; x=1783673182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y5W164dlcrJTGRumnXkL5RSs7h3mqolWsnSZSGBcDE=;
        b=O141VpZYTvkBmhCEnnWsHqqfHwvTAXTA/ptRJ3H9kgXOSvWErHYTRkKEYEgGV3NuGI
         ozDJ9VaqoI8csPYmEEahGI+MuR3yg5doxY4qaB1fWZZ5UyxTGZWKne+V5f5k0Gf+UsJ6
         m1zVZSMu7XYEQ8oGIIY02udHgkIH69OWCkkqXimO/nYWexV5uT6O+pIFtiIb3/bI4QqG
         DjsePI1AzYwfI1HV1GOVth7X4hqk6oXvQgmANuROF0rtovuMhGYKl9YEi9ZnpukGfeo+
         oF+h+XkjyAObl0IktldAy2Lrte44zQcu8PKJCuKSA9T86e0vUnXi4UTmeTy0zHL/rZfj
         h8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068382; x=1783673182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+y5W164dlcrJTGRumnXkL5RSs7h3mqolWsnSZSGBcDE=;
        b=fkoGQDDtqNnXHOzHQf/ipL37ARGvsHS/2mwRY89kso/QZkwBg2r/YvLssJp4kvYf/v
         jQ05V1Aq3WN5dvb9WjQFGG52lN9kYrngNc2FCAvj8C337S4RFq893EzIjB5b+MOe8KQs
         fpEgQ12/4ze7u2OGj+RGRImZ/wSuzA27iatKcf4QQi4sz31pLPM+k5uH+DxeYeHkg+K6
         af5SoDiHT7q7wQKsbS3N+ynrQJfwD0Nfq4lP2m/uPrtdCpze4IghMFwyoJ2+7mJdxbJB
         IyBLYRMS9Lh+50xRMPafy7n9dVM14zey5gmvCyc58tDaCwhS/D+XauubJICoOeyga+oI
         HKBA==
X-Forwarded-Encrypted: i=1; AFNElJ9oPsembPaX9kAG/Waic9HqkEK6u6CGhWByVu04Fy3DBPcK98oV6tZ4DJBHWWGshl/p2cpiheow5PhfxOhhR6fP@lists.infradead.org
X-Gm-Message-State: AOJu0YzWwzd0hWArccfATgZRqKOxv4gi1wmub65UjOV8W5OJm7fU5bpH
	rIjYSoiikLjBqKNFONuxJiXnlB2vxw8LsxPPudmwGRUQxdOzPcRB3KnK
X-Gm-Gg: AfdE7cnHvxZWBnKtD6rQDAlr5hMIvdyXT12POSZeihwFaq5facOxlQTBvjVY7TtMRSg
	15uRql0T0liRwLWSur2cnnIgPjhvyEjpGsBijdEd1hf2zwn1mADwCa5wtYunHp80Wlipn3IBo2D
	8FlsRlpOyUUH4zDw7O1tkJG96Zo8gnZophnbZtAOlUS21O+J5XC110pWoDfv1a6uosGdYp8VpF8
	B9fArNJCx6li/9Zoq6+GvGc4GEhXEJKhuEPsPKNTA88SScIyw+8oPP6aajUUesqLyaNLY/Hk8ok
	DwgTACoCT1+UKan0VQ0khG4FJbayQJAw4qlXW1NHefWvUGnEa+FkOFnoKESigJey3/9dNe05YpA
	W9adeqWluSxUhnGkWQPoY1sPH8NOTVxl7w5tcfRLNzU4sSKpt6wKXjrU8oMBNMCYS3jr+pQBbzW
	K4lggpjvT4hRpGT0/BONWQIxD0zGNLIuzQxiX399UI7qx5a5HM78QtuScrJbcedTLJHxXd8nH1l
	pxqJL2UHIdc7W6ohMjvMjNZWg==
X-Received: by 2002:a05:600c:60a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493c3cf8cc5mr79033825e9.32.1783068382118;
        Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
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
Subject: [PATCH v1 13/15] arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
Date: Fri,  3 Jul 2026 10:46:00 +0200
Message-ID: <2599c90338d72b3062b36b8c261493fe4ce5e589.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014624_091479_2440E12F 
X-CRM114-Status: GOOD (  10.71  )
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

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index c98dca8e7889..ddd4651b35d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


