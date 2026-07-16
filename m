Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CFAC44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=; b=uDP5AaeIoJM/M1vrHMDNSFOOZ/
	xWC2Udf1Xt0agp/wh+FimmmlLQa2XS6mBq4RYkWlc+lSdzS1fsleiaff8T5MbuAZtlxDfn0Kht6y8
	eppZGkHoS6DKbaljNcNSb0VJcOx27sjDC6TrfHdTKHf1J7eevoZlhdUVqYI/MZzvgPgwF+AUivVN2
	0AvyUUC1HuxAowVQjBsIZMHPDW8uvzjo1Vy4E83KF4CgAnthdq52dksXRdSX30lfijYq4izsTkZ1f
	ZZDWZxfmGe2zNj7vjhuugo7iR1UDv/nfMER9eqnc2XGAxB4NUKnkWOnFHTiYC7eDx2vYMjpqzB4wg
	qKGz6Gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPig-00000000Fsr-22PO;
	Thu, 16 Jul 2026 17:17:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPic-00000000FpV-2erx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:17:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caf228a910so54073965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222274; x=1784827074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=cvzcg8G8A9RHhaBuG/wKh/Slw3gaCnQnvZmKaWnTJLZmgf8/fRzzyrMT6oQgWenY2k
         OHRziQGGcPHRIixItpsMj5M8CMQIlluNblDwpUgtn3wZV8udKP4jOKRjq29QojxHSHsc
         KgojIMVsnABYJ0bFzWZCJndUWsdpg1O8Wyd6J2SXnkHJ20KqQFuJH/GRILyINt6MkZIo
         2AFiY5zHlhjrk9sq4FwVdXSWnq3BVgIszfUn+7tnYKMFl21DcORrgq31nFTnADmy3OAM
         9cSqHrcLrzjLgzvkwoiVmWNMm281D4/rkx5i3AeVai3yN6dW+53Bz/UKaLvnWzmSmWMK
         M9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222274; x=1784827074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=m8fORPtEhu/jE9UJIfocxzBZ9uWShhDhKod9j4Axq5BSV31074xAZEeHisql7Kb0Oy
         fn8vlVdjO6IaAt+EMNx0W96ry6oUbEydk2QmYbtGBXD/oMl9K95N9ohQXkooN2AGp4QH
         Uy4HuKaJZtQdpkm7ddw3Z0yxVq9+U97JiLLiBE3wYSugrlDNAeJ0g7G/zK9XNwA994Nl
         i8JzWE6bYNqE2IdCLf0R2x+Q+lGPz8s94i8buREWpj/vXGF7zvQUgjGml1kQ+yke/4Pw
         horUJj2xLwIeie8tKToJIGGffJUe3X4w5LY2IONswbK8+gxRgmmjPE3Pdhx9DeDnocTz
         0V2g==
X-Forwarded-Encrypted: i=1; AHgh+RrpfQMJhpn/Vi0WeQz07ANG2sgM+eCrWznOx1dSovpLVfXH6fkRgniPITi3OMVlzxSTdsxsSf58EAi1LSQPOR12@lists.infradead.org
X-Gm-Message-State: AOJu0YwzklfOYK8O8DlsLw/XSN7Cy96xnJ1oDRf7nQoGQClNqG/jOsLl
	WBUj99jKTg4YudqxJ9MY39XyX2HflB0IUc5bjW8yqWRfbWYYKm+tYM1A
X-Gm-Gg: AfdE7cmTr3ZQf+DJPLnE7hGklCBe+5MqaVQ0JQ6QQxbstLFzdiDiUyxsHg9pLW84j55
	Gn1lnpe70OK3hPwsEf0/Dscw5nlfN+T5SmRBmYHGIYV5nAIB4jazJhR3xnbX8OzRU+k5fHYj3Ni
	Xk0xyPKM36uPzGuOTGBhFZk+Dgo0wHM7WNkdNSeWUzmrEc2kwFeF7BGgG9pBLTsYe5KuFGwyRqw
	ySdkq9yzs3JX3Acu3kmoA+ix1CWAO14oIEsgDYPwDPUtqK50sZptI9tcKfsVjK3B10EtRx4NLcz
	a70TQmWwmkbkhoYz5JraZAsbnrR57Y/qi9U131zSyZQW79dN1YhMfHmyFWU/Z+IUMZ/9FUJp6B8
	Poi+GXH4qvvgKR2R9FnBeRX5eObdevBGJ3qMgQCtriezKQhkQdB7z/mezb77H04+/1ePkTaDN3Q
	4FC1057jl4/OGCyd1npeXjFMozvTG2PRpEMQ==
X-Received: by 2002:a17:903:1cb:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf03c36420mr81705655ad.18.1784222273587;
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
Date: Fri, 17 Jul 2026 02:17:31 +0900
Message-ID: <20260716171733.300885-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_101754_740275_E75D5DA5 
X-CRM114-Status: GOOD (  12.03  )
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

Add compatible string for MediaTek MT6589 PWRAP.
Also update the description since MT6589 has pwrap bridge.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a487ed39e6cb 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -19,8 +19,8 @@ description:
 
   IP Pairing
 
-  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
-  The signals of these pins are routed over the SPI bus using the pwrap
+  On MT6589 and MT8135, the pins of some SoC internal peripherals can be on the
+  PMIC. The signals of these pins are routed over the SPI bus using the pwrap
   bridge. In the binding description below the properties needed for bridging
   are marked with "IP Pairing". These are optional on SoCs which do not support
   IP Pairing
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6589-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap
-- 
2.54.0


