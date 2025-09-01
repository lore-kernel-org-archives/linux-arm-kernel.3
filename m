Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA49CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 05:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV9RpIexSuF3/gygvngB8sYZsg71i9JN65/BnbiCf1c=; b=VascOEJDDqIYqHq4pgDHl9Ggfu
	vf44GstsMiTk2oKgsEgVzx6054Rw2lb4EgzsNh8J8XUDPDDWG3t234XHqRQAbH4yNqQq0Sv7vJfOq
	uf5IHfoIXxbYMjOsMrJpGduKX4+MPH8ZMLau4+1YYiyXvAqNMfNprA3eNTzOYDdQcxai1yPJWHFxn
	5ZbtQZt8ggNc2aBN43u7ziVKvxO6N/RDGpwOcEogHp3wowm/AE8c+lv8gnRndgADYWRACJVW0Bjp0
	dRiQA1fj/nFYD8klh0h5pUfkQD/nhvwKeNIoauIBc9amVdrNfGyOd0/mdFUQQYACobqmVIf16TOX3
	If8vsLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxOp-0000000BF2H-0OKI;
	Mon, 01 Sep 2025 05:48:15 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxJW-0000000BEWD-3QL1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 05:42:48 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901054243epoutp01f7c4b70d496ce587109743ccd460ecd9~hEjiLrB6d1871118711epoutp01r
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 05:42:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901054243epoutp01f7c4b70d496ce587109743ccd460ecd9~hEjiLrB6d1871118711epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705363;
	bh=GV9RpIexSuF3/gygvngB8sYZsg71i9JN65/BnbiCf1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/CwxSKh1EGEk3YKlASG+3X71o/BfXqFkyai++8ojq2DPcRGlXFrgN+LkTPIXSEon
	 6OZ0zCLl+iCjEjUr2YbCt1nPr/6tzOvrXUemttgOJz18u9moZRHn23rPMVCueXSOqe
	 yldD45aO0r2iidxM6ZZLr036NPtZNhsmT8W/m1rQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901054242epcas5p159d9214ba1e2f31e9f73194e947ebbe6~hEjhZfsRj2209922099epcas5p1J;
	Mon,  1 Sep 2025 05:42:42 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cFd7N37Ngz2SSKg; Mon,  1 Sep
	2025 05:42:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9~hEjelPBYF2209022090epcas5p2F;
	Mon,  1 Sep 2025 05:42:39 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054235epsmtip27f16f19754b507b37b56600691808528~hEjaKgOYR0762407624epsmtip25;
	Mon,  1 Sep 2025 05:42:34 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-8 SoC
Date: Mon,  1 Sep 2025 10:49:21 +0530
Message-Id: <20250901051926.59970-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_224247_170523_AB864236 
X-CRM114-Status: GOOD (  13.06  )
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
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


