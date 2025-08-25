Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AF1CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KrVFImLWWMk4u+RCG6atSptECAqVlbM836WIDvTOgE=; b=iGmxRPToR02TVBO73llew+NYw/
	837o8zXg98JYr01W+HxlQNGHtYMBAqOZLdXHUZIBACO47xegj7P3B3sMiN/LWKonC9z5y7ncarS6J
	l0JKP90dTELBf43hQ6YW6cU337W72Z8Hdi1lD6PJ4lbB6VYQRYN3yV+uaBYdSo41mXFwHICiTSBNb
	Cm7dGpidPwQQ0/259pEmVQcxW4TwM3MMIhBgBE0SqhnA1x9zOLcL5OV9aBA9ET/AiCRuCCwpMCztv
	Pf/SjjJJE/0QSMC2phkBu88o5tcBAqtfd36zKDmAg7yMDfiqBkHF/j+0v68e8fHzdNhcbx0zpQmnN
	9jq4OqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYeo-00000008L2j-3AvG;
	Mon, 25 Aug 2025 14:58:50 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVz5-00000007sBX-1IQE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:07:36 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250825120733epoutp01635da5a0c345b09c84e59fdf7184a394~fASiNfgC10269602696epoutp01u
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:07:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250825120733epoutp01635da5a0c345b09c84e59fdf7184a394~fASiNfgC10269602696epoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123653;
	bh=4KrVFImLWWMk4u+RCG6atSptECAqVlbM836WIDvTOgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1/TmrCqoyvCzSZXahR4NgruaIiy5XmE7CF7hFIIjejetp4ZqBShD1bOIDhASJm62
	 SVp6ieBJuvGspLyJ7FWdD4kSFbr4LIP0VYzGY01Trj8GPEXfoKBpvbxacilYbpcKD3
	 +RlUzb9eYbSa875ZlXlRj4fl+I0kl86rAG/gx5pg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250825120732epcas5p4e2a69e6f20490ca8708f2c879e7763dc~fAShY-spP3220632206epcas5p4Y;
	Mon, 25 Aug 2025 12:07:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0g3yC7z6B9m5; Mon, 25 Aug
	2025 12:07:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825120730epcas5p347b6acfa329848471d55191150c8c983~fASfk49tU2789627896epcas5p3o;
	Mon, 25 Aug 2025 12:07:30 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120725epsmtip2eb025832c49be2d2926c812e51782b51~fASbCU4Y50171501715epsmtip2H;
	Mon, 25 Aug 2025 12:07:25 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v3 07/10] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
Date: Mon, 25 Aug 2025 17:14:33 +0530
Message-Id: <20250825114436.46882-8-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120730epcas5p347b6acfa329848471d55191150c8c983
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120730epcas5p347b6acfa329848471d55191150c8c983
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120730epcas5p347b6acfa329848471d55191150c8c983@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050735_662942_F857F0DD 
X-CRM114-Status: GOOD (  12.68  )
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

From: SungMin Park <smn1196@coasia.com>

Document the Axis ARTPEC-8 SoC binding and the grizzly board
which uses ARTPEC-8 SoC.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index f9c218dc6883..63e9aca85db7 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -8,6 +8,7 @@ title: Axis ARTPEC platforms
 
 maintainers:
   - Jesper Nilsson <jesper.nilsson@axis.com>
+  - Lars Persson <lars.persson@axis.com>
   - linux-arm-kernel@axis.com
 
 description: |
@@ -24,6 +25,12 @@ properties:
               - axis,artpec6-dev-board
           - const: axis,artpec6
 
+      - description: Axis ARTPEC-8 SoC board
+        items:
+          - enum:
+              - axis,artpec8-grizzly
+          - const: axis,artpec8
+
 additionalProperties: true
 
 ...
-- 
2.49.0


