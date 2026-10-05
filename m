Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD72CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaQB9mWiQVNM9d2Wev6zWgj/quUcdaC3vVhI1YEuvx8=; b=V/AuWy7r0KswambjPheQNOL3cl
	7oXjvSzxzz7ox2jSprAW1wxNon/nsGNDMqZEUzxHyFh5pVp+/lL19IQWYy4eC4DNAayJdH9d1wpgV
	XpwiBwBrV6a2xigu0og9O22siEuAUrdc1f3UNmA/KpQiIk6iIg+d2MGDLfiX4EO5jwH9hLEexzrSq
	jTSbBaeIy/B3fAFw8SJA7FbKT9ObhQvfOB73xZk5ushGAxV8FlLBizaBOEdZ5E/0iEM9cXTsCH33b
	j3ERychs0+k6ljtiss4pjgk9snBuWdc7v8QoinyTieIHG/jIp6uQdVztjLmzAwD6Ikk85FefI1WVO
	jJRycM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdQ5-0000000FoL1-3BWp;
	Mon, 05 Oct 2026 07:47:33 +0000
Received: from mail-westus3azon11022077.outbound.protection.outlook.com ([40.107.209.77] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdQ1-0000000FoIZ-1ba5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 07:47:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHLKfick1axW5pybFal8fgYPHQenvbJ5MnfTwJGQmq+XgS2HdSckZXK0tA9v501yC/v50neOx4oYcJZA7E16HsCnteYr2VwAf97z2OLGcL9J0LXR09Y/gOFGsgmyw0Oo3jnsnouS0H/T558XbtRPXk79qotRgege6Uc4n26tFsWfimkAsDcFE3WDZFRHyM9R3VFVzc89Cg5GlEdmRInX3SkCPILhL1CKzJmvQZGeMfaTLAmwVEQ0I3Gjpy/UXjsKsgYEUcvCvx+qLMmmnkX3T2xT//Z82BNa9IbGUwrF4XTQB2mQ0FL9y5XbJ2M5AdYVxkA/gcbZyZHbgHuRfM/49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaQB9mWiQVNM9d2Wev6zWgj/quUcdaC3vVhI1YEuvx8=;
 b=PxCrGcw93QSS1aPid6l1dvfo+cnPeqjK4L82/t7zIo3OS7okAfpQ76Y4VcdYpZ6/vKCUHnfJujYS+5O+jFJE0yslLguojLruGBZ9QVDbuXyPnJYnsGqZdUR6zICMCEEg9JdUhYR6LvigyDcvgSyS65OBc5JB81c7cQld9liyd58ErLRQBA0PQz8qGqlM66GFBIlDIk2QplFSB3R2qgufCTA3o169tLfJI/DCWyL+v/Fx1rcEKDZuP08DJnigg5HJxGXKKYXmXXVHfdnASESeBQrDqOG+EIEGNn3H+Jg5b2ekg7IvDUYRtivwfMh/YJRtPgJtH3YgeKxDMx1LiA2gaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaQB9mWiQVNM9d2Wev6zWgj/quUcdaC3vVhI1YEuvx8=;
 b=OKk+kdrp096cUbbm8cuhDUMmaSs3JmO4hncmO0FTeGKzFMXNLrfrzBHiHwGXCKsvLKmG2H4EAuPwFqHtuU40TU2ZdgsGpImlqXuiv7gpBBEdHDMLP5IDN2STMef7rjAlcLD5YoTLCylk2/x5epMOk8Io0r2ViwVr05ipOLbnFIVoL8KRFbnbfwk3sZMf0kmFgmSB/vWlqonUvYNVgvUeaQurYflh4PhoICIDUtZB7YnGJKbDkg+8tDEhCq+UrZ4VPQ9H8CMAqta6HGohRBJoPzlikKnTlBOTCcSfx1dbpliekE3TbsHXL7BQTRu66btDgutn96Aqv47+445r3xgRkA==
Received: from BN9PR03CA0532.namprd03.prod.outlook.com (2603:10b6:408:131::27)
 by CO1PR18MB4617.namprd18.prod.outlook.com (2603:10b6:303:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 07:47:20 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::b) by BN9PR03CA0532.outlook.office365.com
 (2603:10b6:408:131::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 07:47:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 07:47:19 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 47BAB4186B58;
	Mon,  5 Oct 2026 00:47:19 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 05 Oct 2026 00:46:09 -0700
Subject: [PATCH v6 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-axiado-ax3000-pwm-v6-1-7feecd0087e4@axiado.com>
References: <20261005-axiado-ax3000-pwm-v6-0-7feecd0087e4@axiado.com>
In-Reply-To: <20261005-axiado-ax3000-pwm-v6-0-7feecd0087e4@axiado.com>
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791186439; l=2448;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=IYZfKysTQzTHk1Q9X9Vbm3pej44/eD/SCDq0VjOyQ7g=;
 b=T5RW3kL0xk0KzYq8WvSrKm07T42tEuuKxPMP2JxitugyA34mzDNm2E7AL37MLzQuPFnQkkhc6
 FSPqIjcD0n5BNpxJJeCVaiyzVNHXaOdCdwF4UjApVr7ZSxdhdIF28Ix
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|CO1PR18MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0234b2bc-32fd-4aaf-5b47-08df22b4e2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|36860700016|1800799024|18002099003|22082099003|10067099003|13003099007|3023799007|260925022911599003|260925021911599003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info: KsXaZdRjZmk9DkgGKf/Yuw63+ltIUtrIodkm6YnG+Lx/d6WN6Jm5nhd+doRMlx4ef1mmVaphQf3Eyx0SC6vqX0Jn+C1z0O0dzKH6Ov4qRZTrpRx9cUG9UTBZ/HtWsvGFx7np8znmKlOuz4nVmQLcm2A5wn1HupRqF2/IGMbYnE+Fg1YEPFPgHqC4uxmao8237mfwlk/YlJuP9dhhmSNVMKENWYK3BqWVX0efoAuE3zvBPWcBKvLYKkV8IlFHMryTmifEytUZQSZwxhG1bp/V8lb0vkR3C3sMqsvd/3n9sr85mg4rydCS9zjWvZz1q1Cyyx7iBeIRm0zlNLUql1aVKncMA27UzKg0VW9Sk/iBhPd4pzx5hrhzo9y7KjTjQ+gJykZP8xzjYmiTtgsOZHzygaNQOEGZ8KefPU5j+Vy6+IPHWV7fozhrHPgBzx7dC89Sab3rWOyH0HKtYhirYJ32Nmfq73gbgYCaVKc2EAnDzHe32o/vPC1SEBUhusd+RXru0KmB3h4aHVxxVW5jD8XGqcnqwlB18p0gyepE4T8qMl4XrAzY4QtUnuCK2k9sH58tLNPduUa6nGTGvQllom1i439Bq3W6xWKBmD41nakcFghS1f6gaMmiBrA75i1q7i/9cG7Ywel7lvEanrv+bJY2kA==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fduAUvMwC64Jt1pMdpV+jn0lyzs+uQzvOiyH2kJD7A8IbTFOUywacDK3OStHN3SCedK/GBBJgG4SB7fRt5BnHG1fxFRt180OiaK8uYS9Jd5oU/ggPVvo1qOUr2Inqg8ri9nTVOddLHKuIzc9lWip3HOAziUyIIbqdGX2Wi8Jsyz4GkXeykHp5w3pyebdxH/8w/CbQjCSZBKvQqHVxP8EIuBiWDrQ9gJMDdfYfHfaHSOcXEZDDM7XR9zNKpB8IE41zv59haR6jM8jV9AGDCMGqaUzivfsLo76L3GIjMQtA9C2WR9bIPvrODnH4YMuoOYJdsv8Lk9uitwcsEup+m9x9Aw+eDu5nzF3eBBeL5V/T6UQhoeVE5hSvkj+/P6aCGgz4n3rffn8xLVOvCmnuBBNG3whPSpJLmyC9K/lyyBneReNQAndzUvKGn8C3Wes8RGv
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 07:47:19.9976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0234b2bc-32fd-4aaf-5b47-08df22b4e2a2
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_004729_428301_50FA002B 
X-CRM114-Status: GOOD (  12.20  )
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

The Axiado AX3000 and AX3005 SoCs include PWM controllers that can be
used to generate configurable PWM output signals.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/pwm/axiado,ax3000-pwm.yaml | 53 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
new file mode 100644
index 000000000000..f0d5a3dd70e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/axiado,ax3000-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 PWM controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Akhila Kavi <akavi@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  The Axiado PWM controller found on the AX3000 and AX3005 SoCs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-pwm
+      - items:
+          - const: axiado,ax3005-pwm
+          - const: axiado,ax3000-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@80801c00 {
+      compatible = "axiado,ax3000-pwm";
+      reg = <0x80801c00 0x1000>;
+      #pwm-cells = <3>;
+      clocks = <&clk>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..9999480376cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4312,6 +4312,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO AX3000 PWM DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Akhila Kavi <akavi@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-pwm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1


