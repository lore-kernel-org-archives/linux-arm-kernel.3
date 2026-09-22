Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D34C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=roiZPSCU88QygX7bo5nR/bW1y+/DZdenzXqm3MmxBs8=; b=Oo18ukgyj0vj2PbVURB7GzBwun
	Q4Eh222hzi4Pg8rB2bfxRnJHChLXjjFwYLp5pY7xpbtRAO5E9qL/WM2C8ahBgESNdp2RsIbPl2KJv
	lp1amI/8OE0CNiFNkCTYBSrLMdLXoUaWoBy6z62dG6A9d/9BoGMbOjH5hVINjlkNKguD5iQbb1Im3
	SGAPuSB/fyfuGobpDSBygy6Ua7a0XtxV48ZcsA9lkQd5e57aX6FNoOeVVYIxMvZq8p8qmyTwNCsyl
	PN0J0uniLrtKz1FmebkjkTe6Ov7XSFkzkQO0TFDRcdR0h1jUFLVBH1c/QWrAmgbGs/k1kGNk6ZXYZ
	pKSB+lrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wUw-00000004qrK-12Tx;
	Tue, 22 Sep 2026 09:09:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wUu-00000004qqz-3L3h
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=roiZPSCU88QygX7bo5nR/bW1y+/DZdenzXqm3MmxBs8=; b=lNk+HJK/b9ZRK3TZK8yibLQ1zj
	iAk16vJRD+ffECL8KnnkvH6JKHXkCaV5Sy36L2rIka8cmsvrXtdsHv/VXNcym58Lneyiq2BKa8IjX
	HGxH+qhk0QsuF4Q+Gqvi7v3iQaVbSLnMPR3Ig0lU50Sh7uy9H3cH3qQX1XxWO9qZk6noO2MergZ5r
	jdUrPYaxaJwih2fnbn7hAryc1EbTZZRtPBLDjzOuwcSmY6g8R6Yj+0fARwFafbmGrYg6Ry4V4K+vD
	K/lMAHC8+T+7R39ml1zDa26TWn9g7lHnQGnxQojHoUQDqwG2ztoZ8rmstmJLuetL5/r3a1+nctE29
	MpROpiMA==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wUr-0000000DKwF-0VJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ro
	iZPSCU88QygX7bo5nR/bW1y+/DZdenzXqm3MmxBs8=; b=RVzYoTFp9Jwt8W98S3
	VbTPYnrCOsuIm1F1xc2YJjKHR0WTtJgjafSdF3WVVFBA2d00O4P03ZOjArMxNVr7
	lwIz0ZNW1+8nYD3JiCSfeQbpTwA9Y6YRKqNhIeL0f/RgmX161AVlDD+PlNf0syiU
	u1bBdclULseELVwINzcYM6R10=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3X8edRbJqCNNdAA--.41173S2;
	Tue, 22 Sep 2026 17:08:47 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH v2] dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files
Date: Tue, 22 Sep 2026 17:08:36 +0800
Message-ID: <20260922090836.111516-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X8edRbJqCNNdAA--.41173S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jw45Ww47CFW8Cw4kXF1kKrg_yoW7Wr43pF
	43Zrn7CF48JFyxJw45t3WIkw45Xr1UC3s7Cr1kZrW8X3Z8AasxJrnakr1rAFy8JrWkGayU
	trWUur1rJF17Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piAwIDUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-x+-NWqyRZ8D8AAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_100905_647457_38E4907E 
X-CRM114-Status: GOOD (  16.16  )
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

Documentation/devicetree/bindings/hwmon/vexpress.txt describes the
arm,vexpress-volt, -amp, -temp, -power and -energy sensors, and
Documentation/devicetree/bindings/regulator/vexpress.txt describes the
arm,vexpress-volt regulator.

Both restate what arm/vexpress-config.yaml already documents: the same
compatibles, the arm,vexpress-sysreg,func property and the label property.
The regulator node refers to regulator.yaml for the generic regulator
properties.

The regulator file also lists two of them as required, regulator-name and
regulator-always-on. regulator.yaml defines both but requires neither, so
removing the file without doing anything else would quietly drop that
constraint. Add them to the regulator node's required list; all 13 in-tree
arm,vexpress-volt nodes set both.

One sentence in the regulator file is not a restatement: it says that a
supply without regulator-min-microvolt and regulator-max-microvolt is
treated as fixed. vexpress_regulator_probe() implements that by selecting
vexpress_regulator_ops_ro when the two properties do not both define a
range. Move the note into the regulator node description in the schema,
so that removing the file does not lose it.

Nothing else refers to the two files. Remove them.

Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---

Changes in v2:
- Add regulator-name and regulator-always-on to the required list of the
  regulator node. The deleted text file listed both as required while
  regulator.yaml requires neither, so the constraint would have been lost
  silently. Reported by sashiko.
 .../bindings/arm/vexpress-config.yaml         |  6 ++++
 .../devicetree/bindings/hwmon/vexpress.txt    | 23 -------------
 .../bindings/regulator/vexpress.txt           | 32 -------------------
 3 files changed, 6 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/vexpress.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/vexpress.txt

diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
index 41c53e3acc12..8fe24a997cfd 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
@@ -139,6 +139,10 @@ patternProperties:
 
   "^regulator-.+$":
     $ref: /schemas/regulator/regulator.yaml#
+    description:
+      If regulator-min-microvolt and regulator-max-microvolt do not both
+      define a range, the supply is treated as fixed and only its voltage
+      can be read.
     properties:
       compatible:
         const: arm,vexpress-volt
@@ -157,6 +161,8 @@ patternProperties:
     required:
       - compatible
       - arm,vexpress-sysreg,func
+      - regulator-name
+      - regulator-always-on
 
   "^amp-.+$":
     type: object
diff --git a/Documentation/devicetree/bindings/hwmon/vexpress.txt b/Documentation/devicetree/bindings/hwmon/vexpress.txt
deleted file mode 100644
index 4a4df4ffc460..000000000000
--- a/Documentation/devicetree/bindings/hwmon/vexpress.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Versatile Express hwmon sensors
--------------------------------
-
-Requires node properties:
-- "compatible" value : one of
-	"arm,vexpress-volt"
-	"arm,vexpress-amp"
-	"arm,vexpress-temp"
-	"arm,vexpress-power"
-	"arm,vexpress-energy"
-- "arm,vexpress-sysreg,func" when controlled via vexpress-sysreg
-  (see Documentation/devicetree/bindings/arm/vexpress-config.yaml
-  for more details)
-
-Optional node properties:
-- label : string describing the monitored value
-
-Example:
-	energy@0 {
-		compatible = "arm,vexpress-energy";
-		arm,vexpress-sysreg,func = <13 0>;
-		label = "A15 Jcore";
-	};
diff --git a/Documentation/devicetree/bindings/regulator/vexpress.txt b/Documentation/devicetree/bindings/regulator/vexpress.txt
deleted file mode 100644
index 1c2e92c7831e..000000000000
--- a/Documentation/devicetree/bindings/regulator/vexpress.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Versatile Express voltage regulators
-------------------------------------
-
-Requires node properties:
-- "compatible" value: "arm,vexpress-volt"
-- "arm,vexpress-sysreg,func" when controlled via vexpress-sysreg
-  (see Documentation/devicetree/bindings/arm/vexpress-config.yaml
-  for more details)
-
-Required regulator properties:
-- "regulator-name"
-- "regulator-always-on"
-
-Optional regulator properties:
-- "regulator-min-microvolt"
-- "regulator-max-microvolt"
-
-See Documentation/devicetree/bindings/regulator/regulator.txt
-for more details about the regulator properties.
-
-When no "regulator-[min|max]-microvolt" properties are defined,
-the device is treated as fixed (or rather "read-only") regulator.
-
-Example:
-	volt@0 {
-		compatible = "arm,vexpress-volt";
-		arm,vexpress-sysreg,func = <2 0>;
-		regulator-name = "Cores";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <1050000>;
-		regulator-always-on;
-	};
-- 
2.43.0


