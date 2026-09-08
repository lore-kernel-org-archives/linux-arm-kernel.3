Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7326C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=; b=dRjva64wpxuMO44E6uF2qPX6Sg
	ZMJBuy6AkJT+QhFXyohKaa/olyEQKNE7ZqDVWfCJP04WPDqDrqpcyw0s8bRplOsnFv56o4nxX4nJO
	F9zoat7qT/kbvwF29BhtoNkGqms2Yc32WLKTqSZ2Ys1V05nMEsgbZ+aD4Z4xgfs+Ti7TZHMqCrhkb
	fhuxRPIn8ZMd9L0Yd97yjnabkJZq7LYPTU6O4sZ3aJmnAV2rPAITw/Tjg1nnRmCTFPDRj17OtFEld
	dp3uiQZno/Z6uV3fc9PCnj5ugiymJ6sEg5NmkQirXidZ+FkmSHX0viELMiD6VQ3JhpQYJjpY+QViv
	aeIPqXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsK-00000009sHa-3pTn;
	Tue, 08 Sep 2026 17:44:52 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsC-00000009s66-0HUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:45 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so27597295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889482; x=1789494282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=EHBcMX/gHYBwpSvJNulTmnHtErJ+RrSdFWSJgtAXIKJhF+Sg30IEnhH34QvB6AIELM
         HAC79HiQERp7CjrrDHk09f3odVtJ4cbUqmVICEhFHYZ4j4r4oIclt+vFZaxUqrpagGBD
         9vM98cyxsR0B8BHx9iUmBhjPKun6x5j+PPeJDQXRZJrjg/MAVJxtSr7Mk/PMMgST79yp
         fxfqoFPWu0zQG9rFifKEHchV3ZNKgqzd85hWz6DkrXO0OZO0dhkM9DnWqjMXYWY3YoUX
         MV0OHzib66WjtbBs/ll+is51oyRQAnk1UL1xzB98zSYQoyBbnIhuAgVngKYReP8N3xeg
         km8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889482; x=1789494282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=T8FTqWebozymnltgivfES9G+EEYzQDiscpzEcKc14ABRu/e2U9iS3b3S4gDl0LnXON
         rkvgUwEfp/HjmyL0Bhtrh2mX9h86rYObL8yUUdRhEN8HZzWNc5ypUcLaqh0bZLnJ+mU1
         ur9SdxHCk1Aa/P17QFoBjgj/PcKNj6oAFAbyBIPlnzVxw344t7pVht3PchqMQco/6l/i
         K7pNFnWtGoiZnLe4T7uKzN0Yu2/zI3ADGFajbVNMulNOQcKB0889UROj2vlxcFA7JRnK
         uUYCN869jeZ38P3Qeus6T3Zm6+sglQBWLuVPXmQQBnqlduwu5fP6BK8VUpx5FG8upRbi
         kg6g==
X-Forwarded-Encrypted: i=1; AKwUvBwQUZH6z6cSZGpH/XBncosRlTcFmQZLgsZFY8mqQlZ9Ovd5mLdSWpzJcBatmYuuLqVZIcgfzd8ZdEVs1lMpxOOj@lists.infradead.org
X-Gm-Message-State: AFuF++n0DlJHR26/UD7ya13ArKG7smnAaJOrWbb3og25w4hYH5TI3hIa
	YhgjUznkJY9SEZFF9orhgqcZ3OP8V+HLFYlxp4z+EsxDIhbzjKwzfjf2
X-Gm-Gg: AYBFou1WS1pclUpMeS3AnY8xDRvxHFF8+Ssnu7z/XyPTKBAbakGGQk1OV4qaD1uCyrr
	P+FzzBDqGicpnmZJN8EJgDKecpKxu83cHWcsJIy8GcmrJdhu+JZ3V41yNu/Q88UG1wwsKX2XGKl
	lSy1HiFjcCA2MohIGc5U3p/MLLuzBSgf+fL/x1f8YXCFJ6FkJvHRjPMdIsKAMY/nAhU7ifZqPTT
	ZR7ACPEvaZ5w7JEk+2qtQhof9LzPveG2tLn1LyE2U8Zy3xAPQgJSbuZG3FRblVEeV2U776Gei7y
	2bIWINPaeXcbHFbJQyvdBBaNzH82NlzwCoFjHaPeXkslEp8ZCM7Uld1VnyifVt9Re16K6xtJASC
	KDlRYQDiFkfA8nhoPxICKwhJdoYj4FJRUOcFrCw3wAHSjbsZJu0+BDguAlwKrg9lEcppf3fOVJR
	kXL6R9IO6mzYTdE4ttvHwzlOF5nvhCRon3a3/Pgo2feEe0O3K4UPxPVsSO
X-Received: by 2002:a05:600c:4fc5:b0:49c:fe18:6dd5 with SMTP id 5b1f17b1804b1-49cfe186dfemr274872685e9.29.1788889481519;
        Tue, 08 Sep 2026 10:44:41 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:40 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 8/8] arm64: dts: mt8167: Add support for mmsys resets
Date: Tue,  8 Sep 2026 19:38:35 +0200
Message-ID: <20260908174259.9009-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104444_117930_C0A53DE5 
X-CRM114-Status: GOOD (  10.72  )
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

Add support for mmsys resets by declaring the reset-cells property.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index be215390730b..9eb24dc8715f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -132,6 +132,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		larb0: larb@14016000 {
-- 
2.43.0


