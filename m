Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CE6CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 05:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ1lD7/HiIrsx1nwS+to//VvpTeYHESswHKS1MyGRd4=; b=tR9hS6kfq8wQQy/B3O/VfAre21
	FG1Fiy4oqIIe69XuUpudxv2u8PU5tLEtFmi05wOUszQWvkqS83c/hzyE/vsmK3Xa9xuUmULKeO2Ms
	PiExk0Wx6hbbyVXkaTtq+Lgd8wlZFZAkuQY+Q9xwNxCbogATOJuf23jHhvecCp5b9MB2IoDLWEO/O
	OcLiCcDQpvSPsOuM053xbtyyHsz0sks/eDyYNHcb2afAlxGIevtf8bai3Hl006XN1bECaF7sn1mrl
	ZfFWsUDKd4NSbnynuqejtA+pIhupFr6PbntSBxroCBtJCtKHCE34KVy8tWRshQZ3yfz4JNtYwdzwH
	AXuM2wdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxU7-0000000BFPZ-41q6;
	Mon, 01 Sep 2025 05:53:44 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxJg-0000000BEXl-3BXq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 05:42:58 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250901054252epoutp04f4c31f88f0dbeed2b092f8b60b7bdd20~hEjp7urIs0472804728epoutp040
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 05:42:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250901054252epoutp04f4c31f88f0dbeed2b092f8b60b7bdd20~hEjp7urIs0472804728epoutp040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705372;
	bh=PZ1lD7/HiIrsx1nwS+to//VvpTeYHESswHKS1MyGRd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KrZKyG8BPhP7vmkk+cWjFKosTwK3UWl2AyEaYCImwTCAap3zgo0KP8dMA6Y2Gyo1f
	 3bpV8Jbu4RiYbN55UEAAR+T1LFIWud/DUgycu20cz6L8VeWeLW6PZhLNV/CKaNUuXP
	 BNSAAdJIWx2J36HmIUY3xorWqcc/0ydepbO5mM5o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250901054251epcas5p475f99c8efd986d517e5e335f8fe4f514~hEjpAtrz_2599425994epcas5p4Q;
	Mon,  1 Sep 2025 05:42:51 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cFd7Z0dP2z3hhT9; Mon,  1 Sep
	2025 05:42:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8~hEjnlIkfz2137821378epcas5p4E;
	Mon,  1 Sep 2025 05:42:49 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054244epsmtip284d5c2a46a5299c22e8e6bb99ea8e999~hEjjQRonB0761907619epsmtip2x;
	Mon,  1 Sep 2025 05:42:44 +0000 (GMT)
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
Subject: [PATCH v4 3/6] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
Date: Mon,  1 Sep 2025 10:49:23 +0530
Message-Id: <20250901051926.59970-4-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_224257_139417_767FB4FC 
X-CRM114-Status: GOOD (  10.49  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


