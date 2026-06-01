Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8DFCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=; b=ZEfHGpGzSA+I/fvjRUNl8A20X7
	Zmv/Lhh8xiTDaIZnVTnCiAPDl3g39axiqLuPWEP3DnviFhzzBhmCPvQUDrLtco8HDCeJeR+s1500A
	FyvX1IJP6fgVZC8SL87cVXoJaadVme6SNOsBlOk3k07RbFnh+RSE6+mA1s6QKvGMSpp4EKIzMHyaa
	NTh9Np5VOPFv4lcFOe2IQqTmTmpATYqgtRnk0ouCzbb+Fr8wt+QyZ1Q9nPtD2J9RHRZEP0PkJEbcU
	0ONUIMvvBKzAyBsrWWxy6aWd4IL2+lnhGL1EVxXkaZAMDFTR9cdXyC4Qnu6VCE4+SFQZZ/5EH3jfT
	38fI0Y7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5Ow-0000000BTND-1TDt;
	Mon, 01 Jun 2026 16:22:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5Ou-0000000BTLL-1TCz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:22:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf2247e38eso27722235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330923; x=1780935723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=VekglrTIqmGTFRHNEtoYzQrkC2kS5X18YIJYbtgkaoatltKSbErfWT8H6+Cjh8bq4u
         1x01ZA7JG1qrcaD/loDrWTLBHCsAUDHVpsatlck8eLhD5WwNEA0KK6nmjnmU8va2js8g
         eqSELbs0pEmZ5MJR6l3fQvg7M4mM/X2l4BTWwMqLl8En9YPSTi3yNzbYoaKuA+ugaZ5r
         YY1oXUxYux0dNaC0gMtwg3s47X17Xjr3pxpclHjziOcxJke8jWU4NqMpm8bxzjdV49Po
         0tQRqLxGi1AKJ42Q61yaJlpiYZu4VD9XsxeR/VAqF7jziEsRFmPCQJbhSi5bPxCMPLOf
         +X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330923; x=1780935723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=cq3msRcAHNGpCEGqB9j27SXNPjN8Opg5pEMpLfRMrpmFjnH4e6Eijz2b3b+dGir6t1
         vcQfbv6D3nUggusP38nPuNP7cHkASzhWWudXObLk0POxlIg3QhAw63bqQRRPa6D1XDwH
         c379kjCpXT5FbROAdIzWCJAlObo28+VrUHfjjDQW+JKYLv68Rv4QxmPmO1x+LccB+Hsi
         s7VhI2O79zDK4vBlOpL5Zw9RMQPlKkIzvum4y/SfslRo3F0RtXQYMScKAXiV7p+5ULx1
         WgtpPSO8VOclHdBC6Jx03L9VMADOX77FvoART2wxIhojMBfu4+3XMcyvPweDYnaKOytk
         g2Bw==
X-Forwarded-Encrypted: i=1; AFNElJ+MjK1g5FvQ94Aj2txHkWvTy+emm1fv7qsH0DekSKSKw4QyL7L16iapkKkXRuNo6ipEE+jjqshNqH2yPEOtz/8s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/YeoQfGSe7CLte+YM4fPlq861ESTswTOYm06eUOq9sDK7EYo3
	1PMxbXckQJ7nGnI8DCdMqj8mSF7HavqAq3ysUdmzV7Lc4a/rLd+cKvZJ
X-Gm-Gg: Acq92OECaBdO/n/uG+04+4mSZr/R7mef+erXll6m7fJqyCw+sfa78S/GFvlMG4Z549V
	RL/2rwV/TB4NKEByg6CrW4Qy78AungohUKr+Gi4/w1tB/wsLFEaL/oS1gR6lnSAuZTuTkvXBbLY
	VCMej/AmSZeHgW+GG3aAeghEyRpe2Mc1SFYFjR7HWqXOq1sb5+82Tk/ligzObpRdpUplmUPRVAt
	/tEYpGA8i5XHmdKibL0uk3mKW7uWiG+SAwYPbpb3lUVe8F3e54ye2gUgHq0GaauXYzmrj14AWYI
	Q4n4BTnrGoqAWihUkEpVUjurgCCHJXFMC4qmYhkqYLatZqIXrUSacgV+tnEDEW1+A/pGz+1gt2X
	91f88Ul5HXCBwtMCWMStuC0bTtXZOHfda2awwxK56J5VW66jJ1dFjEN+l0worWffGYHOe0h6Zn3
	Yy4/eZjeS9XtYR4rh+qVlkSZ9AaXCQ0aIVf/o7TcCS
X-Received: by 2002:a17:903:2311:b0:2c0:cb90:1dfc with SMTP id d9443c01a7336-2c0cb902165mr76599465ad.12.1780330923397;
        Mon, 01 Jun 2026 09:22:03 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm116647455ad.8.2026.06.01.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:22:02 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add vicharak
Date: Mon,  1 Jun 2026 21:51:40 +0530
Message-ID: <20260601162143.170030-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601162143.170030-1-hrushirajg23@gmail.com>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_092204_422803_E587AB48 
X-CRM114-Status: UNSURE (   9.80  )
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

Add the vendor prefix for Vicharak Computers Pvt. Ltd.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3


