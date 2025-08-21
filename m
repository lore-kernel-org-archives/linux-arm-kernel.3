Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0454CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaJAXK2wOTdF1z31qS2L/1Jcukpna02k48jPpUzUhP4=; b=uSrBDUz7Wbj1qxyzl2tlgU6Z+t
	63Wfytp1wihtNLl7njgn4w1f+EFrqOETPM2BWIJa2S0U+OL4/bQZXstEoHNDT29VWbUwveN0X84Y2
	XkzQWIIqS62k6XQA6ym0Y3ihNz56EBi20+dRIUSglJIsSqWDKpuGC80prXLcVwTnE0EKtyE4Jf7bP
	iLEZSDMdFJc0wZIg+j5u0Akgg0UZeW3g1uwqqZ19StzMlIxrZJ21SiCcnqYwzPXV5Lnpuoqwbqe4p
	D4BAQwBYP8a/8KQrHcbNsuZZjCc4NKvHvqyPT/DhxgxaveDx30u20q2el0Kt9CoEFgmELkDW2LfVs
	vkbJPXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8KV-0000000HZ3P-1Zr9;
	Thu, 21 Aug 2025 16:39:59 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4b9-0000000Gvdb-2apE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:40:57 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250821124053epoutp048d800509cfe6859141e84cf8d5d94cec~dyKgSeeMA1828218282epoutp04c
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 12:40:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250821124053epoutp048d800509cfe6859141e84cf8d5d94cec~dyKgSeeMA1828218282epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780053;
	bh=EaJAXK2wOTdF1z31qS2L/1Jcukpna02k48jPpUzUhP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fe/TUYttMcVyXw0g4h18Hj6vUPme+ljsY9hYu7SS3js+ABVPpW2aEMGiHOGoN/UKB
	 1eXP6fQiRpO5sXZQ753PmChgU3w9I7rcw/zkG0Ew3PpdtzlHV74b3fFHiE0bs9YLR3
	 DG2Kn/n7BRM7tCI9ba+LRyiqn5bybwBIiLrOJmOo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250821124052epcas5p109ce75936e0e30ea2f11c90dcaa1e3e3~dyKethypv2595525955epcas5p1t;
	Thu, 21 Aug 2025 12:40:52 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c72wz1xGLz2SSKY; Thu, 21 Aug
	2025 12:40:51 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4~dyKc7nYw81778317783epcas5p2J;
	Thu, 21 Aug 2025 12:40:50 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124045epsmtip2ce3689d8c8c55cae7f27daa7e2ca514e~dyKYVddln2624826248epsmtip2P;
	Thu, 21 Aug 2025 12:40:45 +0000 (GMT)
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
Subject: [PATCH v2 07/10] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
Date: Thu, 21 Aug 2025 18:02:51 +0530
Message-ID: <20250821123310.94089-8-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_054055_971248_F1F50CD3 
X-CRM114-Status: GOOD (  10.29  )
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
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index 610806d87416..941eaed2b3cb 100644
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


