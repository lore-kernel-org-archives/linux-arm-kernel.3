Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2AAEE0AE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9W9/g77jOrUZY4Vom1pwr4e+Jb98dvCscwpobNoHak=; b=AhlvarwBCtUxTphPqxKJe3EUfx
	dmEXDd6IWEKjidEmF/PEtHn6DZI9DOXkKXfttwREcqysEwddXKm8drXdNjwTAdSJv1Qp124SIH8UT
	zkbUZ5YGpfipKncH//aU66JA09bsGjLlHwcohyhnuU95Z0PBpIZ55YTNCY1D/+H1OXJvWOIN/SJ1u
	T9EW4pYDATKfpA/olvoiaj2C24LN1ZqV4JpSJkPFrEQ2tS8EZguJQAcclk3+MFrNzPTYvAr9+YOwE
	xom39mRNsUZHBN63MmFhQdgqFlDqOhRYYcWxid1dMWdwHqXC5LVlpSzvwOV8b2eAXXtB0A2J6GKM+
	WVr31nyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiCW-0000000CT96-3qi4;
	Sat, 07 Feb 2026 13:18:16 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiCT-0000000CT5X-2tKc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 13:18:15 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-124afd03fd1so2234491c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 05:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770470292; x=1771075092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+9W9/g77jOrUZY4Vom1pwr4e+Jb98dvCscwpobNoHak=;
        b=P+DL4Pde/AYUpL4YqdyMWfJ6EnmDeL/BsUHjYT9jW+SyDpNAQSjgnsfecVuxE99BYI
         vghXtbrRVd/PwmZ9VIl0UUEfKwgNk2iqjsCPWoj/cTGOeK8hFTumkD0yR2YFBdNTNwUU
         0pY77bzbM9hPeVBs0tQTuheIHLyrGboBr82mbdI3PXnuELjCwclUICo3vHzcfOTcFAuB
         MH+BEbwYgl2aYIMZ+16pFExFQQupqhmgq1VfCLChsPy77kdYdr0/hPGfJ/gspuTT1U28
         6ZNXMO4cT1kYjl/OPKYy2qYJgo6mFBwjyV6jTq0KMbSotqwGwS81LvUpwUuFFZT0d7nR
         sfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770470292; x=1771075092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9W9/g77jOrUZY4Vom1pwr4e+Jb98dvCscwpobNoHak=;
        b=Ni1XsTszW1PX0kecUZ6IFD6QzqDfCATiHR3KXfZBQZFPfi0rmX/7Mej6wGM9vcVM9w
         xvkDOfOoqR7gdy3NhPjeeg/ZnVFcjuvVS+8U9jtq/isFkahiHNwTnCPYHys6Jb0Gf878
         bb+3jBEJPgR6iBhQSop60m9WnYgQ0nd1vOs94SMIu3j66xXRHF+u59tT9CmHxC3GRPaX
         IWkOCxzAdJmRe97BjoZKWaf/82hnwklY0PhHvL5pmzMnTMheGuE56+7HMlLM2o+QEQtS
         S95hNoyH6m0xJdW3wSfqvoYzsxUGhVTTGDKhLVZV1VxNoFdFoSj9VtaO67+FrTQRaVpH
         hqYw==
X-Forwarded-Encrypted: i=1; AJvYcCXVqikBn9GyzfiglCiuJsbeTsRKYye2MrCbWN1ztpVIs/++lfcbTCvUyhnKuBcI8h2ZnVvvsWsjrM8yfom2Fpv1@lists.infradead.org
X-Gm-Message-State: AOJu0YxJwtN1SZtJNpUeBav9fgW1HKitW4FSoCH7xML1Qlnivjt0OEO+
	qg18QmbLZ6eICBd5YgxoKm7mTE2Alz3z/YCUwMMoJOqk0RbJaH7SxoUL
X-Gm-Gg: AZuq6aIFVzhH0BYoOjtCntUQGNaOj5pOYaJyKR5Gv4aCsGeBrbpg7TbljKD4PO+L4SC
	ahDbdeh38PesxwHRkD44SzJ7WMpVtWzfABz9P2PXEp73woCFcbmeoudkxkw/ndHNuAqDtfmyqNR
	iR1XwT5ejY1qbeSl+ET4k51V+DobgAX9Gphmjp0EjcSif4Aqidb7Yx/NZ3ZdDTgbsOQe2AVjtK+
	jYLEr0t/GF36Y16Ylb/DsDi98UbhgxG7XYUMOQo3F0bkvokTFj082uw5NbcvRVaNNux32SG90ue
	JT9vsgRZ01nD4LSHBbcjGFzabGsh/kSm9OFCpQgbYQ1bOvbI49GSlyVNOjCmtIDUdJHYn+Ra+vL
	U4fywPhWBsg9SwNEo5qY4N8Ys0j3+N58088OsQikeiG5dobnyI+DbbFH4oRNHCdwG1N7N+3pnxz
	U+8k79dRVx3WEcavQz1lhf3kAZ
X-Received: by 2002:a05:7022:f8e:b0:11a:51a8:eca with SMTP id a92af1059eb24-12703f84c42mr3550846c88.18.1770470292497;
        Sat, 07 Feb 2026 05:18:12 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b1ab:5cb0:a2f8:764b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7f5fcsm3688627eec.29.2026.02.07.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 05:18:10 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Sat,  7 Feb 2026 10:18:00 -0300
Message-Id: <20260207131803.2834749-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_051813_753709_DCEF8C8B 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Fabio Estevam <festevam@nabladev.com>

Add the GRF and IOC compatible strings for the RV1103B SoC.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
-  Update to the list of children.

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 0b8e3294c83e..4fc01a450139 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -63,6 +63,7 @@ properties:
               - rockchip,rk3588-vo0-grf
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
+              - rockchip,rv1103b-ioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -98,6 +99,7 @@ properties:
               - rockchip,rk3576-pmu0-grf
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
+              - rockchip,rv1103b-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
@@ -231,6 +233,7 @@ allOf:
               - rockchip,rk3036-grf
               - rockchip,rk3308-grf
               - rockchip,rk3368-pmugrf
+              - rockchip,rv1103b-grf
 
     then:
       properties:
-- 
2.34.1


