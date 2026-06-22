Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A02CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7PibXAcIGUzMHkMw4d52MV4Cue1riJ2jFkEYSXTQ0M=; b=J2K0bdkS2B1GjCYXN7kqx8y75+
	HE/4yYz36N4aIOQOmmIAxJEj6Q7wiD985AsxJW0JXG1fxKLNi1VHCr8yyZmOeugGF4plj9lO+rTvi
	3QcodjVWMxp9OIHuKoJlL0CFiLhHCFiIlq3B9Z4JMLtZ3cIDk1m4+DsJYGYLkOyajmNWQomwGNbaa
	qFSVCEQwNJKRhU2JAXymH3wME++EAJA1dU13kdfgYEzrzHxX+1L0ne7WdxCKfY1lg4WTBw39TWEOW
	Tpo8Jz25tU/VRXc+maTUfvdEG7Jg2kJ3mZ6ldxfgX/Ms/F5kufgiOBXX0XvyQzjU0Z37FWQDRn+Xu
	I+9yGcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZNk-00000004Yyx-21av;
	Mon, 22 Jun 2026 07:47:48 +0000
Received: from mail-westus3azon11020120.outbound.protection.outlook.com ([52.101.201.120] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZNe-00000004YwG-32Sz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 07:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rac31rWcMfJu/uuuhm4/k9NOzEOKP0KuSIjBzDNxJ7cYoNfqmGfHGfZMlFTYnt6/g8GYgZDz+kHMTMBb2Mi7++Rzos9kVgdfy0hLfX9AETzLVyZcZJFoUtL2jRE7tk5scmGs9ZGNkQnJiEKDhWibme9CtKIh8R41tbXDPF8wUQxxYZ8XbkxvZAuzogtA3shTUE31yFE7vM7+p7+Au2VtkkaeXV/PQHm2D22jVjgLsEMq0i9Fy2SleuP8dutrAKZ+snXQeyQAu9lzHzEGM9bhDK4IXg0ryIXf+6g/R0gFxVB4jSc4qVCLK79QAWh+t+KjfhVVmjIqlXpjiNYgzn/h7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7PibXAcIGUzMHkMw4d52MV4Cue1riJ2jFkEYSXTQ0M=;
 b=bVNXhWT12Av+6PFpq8RH7CPH28k5IFo4OThzIBFM4HGAgM2e5YPbJscr47ib7uzUzm952kFYgqEDLsK87IGuiItnXo0+jUl8nC5xSuKNs/RrQYa0KhAmMru8CX56gZMeVwM8a32zX/okVy3DYs2co3fKqs/tX37Zx6n4I5fsr4DJNhBvBLr3DMLdJeShQbjlMMiD5M9Lfk1/5gCi3hfIumJnboeWQeb2EjDzIuMYD99Zfy+BTB3CAxO7o7MfZ+NORa6fY6qiOebNF12jXfl/ExrDbA8DEvW31cX3A8N5muPYO2lTrZfJcSyz7MJtxCw9M3BWYKeHrJ++jyaZb8mnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=analog.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7PibXAcIGUzMHkMw4d52MV4Cue1riJ2jFkEYSXTQ0M=;
 b=dwrq4+0Q/7bxTjO6Fp225KBSkmuFnNIZAW878aLmhAsrEJkJcv60Mh7uet6fqPQhCoSwa/3//w0A2Dtpb0tSWMTI4miyTxanvyxxRInjAZQ7bvkR8UDF3hCW1MzYwqbjmw9pia7rWoIo/KDODMv61y/mkGRRgAbu2QHOpSrUKSkNBmXnnfSHqwUTaBmAeSqLT9vqORR2LEIOBzKc9qJtxOd/0wgPZVrrzYqqdnPZ0rVyKXiFBDponwTkf4GIrcBwITdfbd89HEkzRYC6cRrwQLVQtmAegW65LiIlgVB3Hu/B3Fb7I52frVxpQP+P1ngoec+67KMQfj1xTjN61ZCiDQ==
Received: from MN0P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::19)
 by LV8PR18MB6178.namprd18.prod.outlook.com (2603:10b6:408:261::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 07:47:33 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::27) by MN0P221CA0016.outlook.office365.com
 (2603:10b6:208:52a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 07:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Mon, 22 Jun 2026 07:47:33 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id DE5BA4186B5A;
	Mon, 22 Jun 2026 00:44:48 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 22 Jun 2026 00:47:27 -0700
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: add Axiado AX3000/AX3005
 SARADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-axiado-ax3000-ax3005-saradc-v3-1-e57c7c7ae675@axiado.com>
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
In-Reply-To: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Petar Stepanovic <pstepanovic@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782114452; l=2930;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=Ew66nKJhFNAmdvqu9iVmRMIwLOJEo8YdAdbb5syWQEs=;
 b=i63SDhGkA3GtveWBDbDBy8aup8b7WRgGo+BpmY2KoGUPQ6aZRYSV1chAH1xSi48bZvZRbgFTJ
 O9SQow1UU3qCGXCwmhflmJ+oL5ME7Thj2cVWZ/0+euxWI5O7zjhcBDp
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|LV8PR18MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: a16a5a7b-59d6-40fc-2db2-08ded0328537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|23010399003|18002099003|22082099003|3023799007|56012099006|13003099007|921020;
X-Microsoft-Antispam-Message-Info: GUGAjO6IKR8DIVmUfD30TtQASCESDBjNyp68QVPkNp/P3YZu6ADS0ENWLEGfNbi0GY8LUV9I1hmx8RYBVkwfXw2NnEl+6mtoEbVMHdcNNoj4hPW0E01PT+Bm61LojsFsa5libnI0pXuc96O8A5DXx6FLgJO3cVYWmAEzsrMC5RbHOy1b+o3+gnpfZ7T+75rEn+ra3vqPZFa5JlYerstoE8VTmJdXtFXBRXqj6Q87ngHvmufEcWTCa/nwth5a2jNmG/OgaoOzTvlrrim1xx0lD8CFCQsFCMP1fanCwm2gQOvWSFRU9skajV/SY2VVXxaiZLJHZ0AxCUxwYXH90w7EO1lW/yiXIBToxIccmIUk23vtA/lq0sErz/VtGX2bxPS52RZE2h7oQyhw6JAA2+xPRvyhtWqP6+QOuxKRbZBjNknGob7nCLg+UqmNDhQ358zoYDCjCDLqHYrvtpNlitqJ41Z6chl08eATj2+GIgIlFjWp5Ri36lL0zvfN1LnyzU6HBPlpv93A9KVx6oLQSN6VkXWvacPiq9x9qxabGH8ahDlrZHw6l8i6VZycR5iJV+OF49bxz3zzyZXx7iDyY+/LYqFYdVNUygxnD95CqEJl8IhgEqCkDnIaaJQ2YQaGn+nuN02ii3MpqqpzDMp0oMddZamgSJwYShOWVKKD9tYbqT/vKL8TNz4abC9HIfZ2RChHD5bOKbg0hiGW9A+mvbcFsw==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(13003099007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sO9F/ulp6P742S0IfBEyjzZybI6Sk2hAx13ajXc1hTvUt3C4rUgBmBHZzjqVWnhvCFCF+AXHLqg6SnQRhEXd6Q3tYvLxvNXJBevE70QGBxHDk5GqUuJLvwTIdAQDEQy4RZX1kN2tzu3kRq6+tzfLhMRTLupbYKUgteBngQ/qBCpal6wG48dU9C+CkEcb9M/u386E3d5JV0MhB9tEwZqC2bI3eoquCZDv87Ya+ue40lxKqB31yY9LCUzKzfVe9d6h7ShBtM3gcXGoXP698eRm3hUdAR2pe2EAJ/6Bf20Vur+HNaUrO8Tnn+xMvkugejek+5E2XC2TelU5NrOVib4KNREig+VHgTpno5F8dD3iLr2Rfq+mKvKlvUuJsFnWRwoE+muWPswcSRxCr8uNyG3+fKGUmRy7w5/x14OGd3ciayNlgNBUeh99uu59GaFTnnLU
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:47:33.3362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a16a5a7b-59d6-40fc-2db2-08ded0328537
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_004742_801011_74773538 
X-CRM114-Status: GOOD (  12.37  )
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

The Axiado AX3000 and AX3005 SoCs include a 10-bit SAR ADC controller.
AX3000 supports 16 input channels, while AX3005 supports 8 input
channels.

Document the compatible strings, register region, clock, reference
voltage supply, and IIO channel cells.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iio/adc/axiado,ax3000-saradc.yaml     | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
new file mode 100644
index 000000000000..b910852aa56f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/axiado,ax3000-saradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000/AX3005 Successive Approximation Register ADC
+
+description:
+  The Axiado AX3000/AX3005 SAR ADC is a 10-bit ADC with sixteen input
+  channels on AX3000 and eight input channels on AX3005.
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Akhila Kavi <akavi@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-saradc
+      - axiado,ax3005-saradc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: saradc
+
+  '#io-channel-cells':
+    const: 1
+
+  vref-supply:
+    description: Reference voltage regulator supplying the ADC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#io-channel-cells'
+  - vref-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      adc@806a0000 {
+        compatible = "axiado,ax3000-saradc";
+        reg = <0x0 0x806a0000 0x0 0x400>;
+        clocks = <&pclk>;
+        clock-names = "saradc";
+        vref-supply = <&vref_reg>;
+        #io-channel-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..932bba890780 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4312,6 +4312,13 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO SARADC DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Akhila Kavi <akavi@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1


