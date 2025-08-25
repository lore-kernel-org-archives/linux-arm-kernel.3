Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB21CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3iriXNf200SBhskNtc4oq7XLJZRiYx0ShgqUZlpXtU=; b=XnamIL8uNe64aeUUzlSYNLbxGl
	3/vOR/zxZbl8C7yV63fCb6+rtb9TAZdypKhw9pMj92I48N7FknLpTolWJdXr2B5cv6nE1yt0oGXs3
	k7R/U/g6cUYJI2IMAndRlCznE++a44C1UCrN9o/zJLKOaWF5E+4DoBE3uy2x5Ag2YwZMGilG4919s
	E7PSyI2jLO6zmXMh+yMFbbVzcc/Ai+jA4qnrJntAba6USuWOizR/vM1ZdCHWraLGJfPOjEwO6iT0m
	2xSn3ZKX4Fx3n9JFecg8QV+xYGBosL8lBFpqhFRYD5jbhESx0tInglc14a/bZ2oVZsQ2EO8dAwHf5
	BGaSASGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWj3-00000007zmu-3DIO;
	Mon, 25 Aug 2025 12:55:05 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVyq-00000007s6i-33mt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:07:22 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250825120717epoutp026c62191c33c61d0ac0087ecd08c3fe0a~fAST0zDXj1987919879epoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:07:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250825120717epoutp026c62191c33c61d0ac0087ecd08c3fe0a~fAST0zDXj1987919879epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123637;
	bh=G3iriXNf200SBhskNtc4oq7XLJZRiYx0ShgqUZlpXtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzINJEZ79zQfGnF2q1ACW2YTcpO9rYEdo3kkOQhSAIGusmmrjoIMHIuAEhYYeWTQU
	 u+FNQswrKOD13ub/lrP8Tnh/dDtFzyWuTqL6/hD0Czl+w6wUKJ4+JSB5oSYVZ+nW71
	 REzDf/MestBBA24w29ijC7cFk83qSzewv74nXBTc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250825120716epcas5p398639a7dd305f2183935de8f1c3fad52~fASSu9G_u3066630666epcas5p3n;
	Mon, 25 Aug 2025 12:07:16 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0M5ZqGz6B9m5; Mon, 25 Aug
	2025 12:07:15 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64~fASRHTVOa1420914209epcas5p3a;
	Mon, 25 Aug 2025 12:07:15 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120710epsmtip2a6ce643bee5f1b4baa735219ceedd8ef~fASMlc9nW0172101721epsmtip2r;
	Mon, 25 Aug 2025 12:07:10 +0000 (GMT)
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
Subject: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-8 SoC
Date: Mon, 25 Aug 2025 17:14:30 +0530
Message-Id: <20250825114436.46882-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050721_080795_FD001216 
X-CRM114-Status: GOOD (  10.17  )
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

From: SeonGu Kang <ksk4725@coasia.com>

Document the compatible string for ARTPEC-8 SoC pinctrl block,
which is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856141..9386dcd418c2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - axis,artpec8-pinctrl
       - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
-- 
2.49.0


