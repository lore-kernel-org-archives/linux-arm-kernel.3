Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB516C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMSg+5qg1m1zJrM2UgcNNkne8QK7zPjEnwsVUpOBES8=; b=zUJCxRXBbGWwYHb25BKM8Z5kfw
	QBHHik45IdVL46jt1MiWOTH1iKxKmUTiLSWFUe1tMus5QGfo2gHCnMPAxEvUNblDlSsbEjYNxxr/Y
	VLhKpVXPW0KWRLN0z9PRd+3NPcJc5FKSuqWGOe3WNnfARG9MjPJuQKtPkaHs9v8jB/0F4uwST+H78
	NUn4a6OnAHiXv0vS1KbBibY8k6b0Zy8FrbrD2Xkzbz91yLakUH/d0WWOOxAxvh4gQArwapZckrru5
	LqRNnuIcNICER2cxR8q2Sl2ejG3ArNuwrONMaxscExGmZZ/UErXND62jiECyU3qlQ/lJVi6duPv4S
	RFe0nN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pvC-00000008EYX-2Nzb;
	Tue, 08 Sep 2026 07:07:10 +0000
Received: from mail-eastus2azon11010060.outbound.protection.outlook.com ([52.101.56.60] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pv7-00000008EV0-11oF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:07:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9dKbdq0Txci3Z2FrRAXBKCDAmR4LgYXkTjphJ/BJhuZrpQhuXFmLZa2RjLl/3QL6sSfnjMj1YblbXeqjSsozmT7yNcjRU5dVgJwMqtMPCsEcR803eaieZjT6ZSIZ6/7kWDOeBUyWWkOorgneXbMB4cB3fr811Rc/kQ1+WPxZ6czT7gyBJ9NJh6sY98Znjl6ywlJn+pMr+s4Gdfc+RE/qBaLQBvaz2tsQ9JLrw7/yuurYp4gCNZ6pzQJcY3XHiSfqNH/znAUrdsfkkUCHYnJbGVRXDUd4uGjXATsEqD5D43RWDlX7tHjS7ny9RxcZrGWIOaWwfu0yxJ4HEUF+sMYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMSg+5qg1m1zJrM2UgcNNkne8QK7zPjEnwsVUpOBES8=;
 b=BGQfuD3fnoANgGAvan5el/zsvL+SPcjmZsBZ9mnSHgW50lQl803vXlHSOF3yFa6GKa2E3atBC6O/C8Y9N9glni1sdLRzgogRmb1Ut2YHbLYrf5bJ2S4qdNTlZytMrEf7GQ9xMKywTnodb5kH6Gu1ptImNkoiLW0H80qKy0/wQ7lZn7IlZ91N7H8p3zoyniNljrKhardqWaLej7ijnX0cNH121LM23IhuxYwavkoRFniqqmmayWRUsFoF0HmodhQISil2pX3SEIJG43GQoZkn0uLxuQrlSDGqhg0jM/IVEa2AqnIuXCWXQPoPj1K3cpaJC2sC0moD8UQRGsKgxxjqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMSg+5qg1m1zJrM2UgcNNkne8QK7zPjEnwsVUpOBES8=;
 b=sn96qLuPriHKZNm+vuZfoxCXtcqPMAPc1PD8HvUgpHQK3JEwo/UpbbY4xZ8ayInQ7nmJxwRqbtHbSXyOu4czVY8YVjDXCkH387L0w4n8dMNoBTRjU/+9C6/aEpnprGGyNcUUOZZ9rkUAcEqdDVo/vk0pcyEXKxYNzof11tsl3I5UwXm8T0wvdscjGOY7bXVyZYxGOBcxbBKcnRbEEKsE+FcGyvlgvAttwqa2w8yYWGu667Ymi/IdKLrL9N1KtZ4+u7YobN/Mj2Kl9kECnXm0vSSZn9Iz0tC0O4knmyCmLD8eVnClglk+NCrER9zUVh2NqTso/F3uv7mArpW2aXeZjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CY1PR03MB8123.namprd03.prod.outlook.com (2603:10b6:930:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:06:53 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:06:53 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board
Date: Tue,  8 Sep 2026 00:05:55 -0700
Message-ID: <20260908070557.3585-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|CY1PR03MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb6298f-7a83-4b6d-c323-08df0d77c30e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|10067099003|6133799003|22082099003|55112099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: RXk9U+lm69t4T6wX/67gxR0M8xIsogYaLWhMRnL42B3mXuEXi9D5Zkw0Ke6zsIZ7yMlJP+JP2RakUuVxnMblYe5KuIqmV3At13b3wS5WofJ82VF9IAlxiP4Zi7tnSsi0kLJhlbY5dWCzMkgdDP5Ttgo6Qet2LaZvgy2Anv2b1jjyhPBC/dCs8szrP6oGHLhatsZgq1maDhWbhj0GIrIwKsU6gvN/FlUP18TJ2B3xyvwnswQNY8c8dqq/pgCPuAzSsPwQhEQ3+fo1IdiNO9uBt3aBbz2r1rMuC0s75sxYELLrRBldkTBsgr8JtZ8Jhk2ihBoD9bXrO5+MtIiSUzUwMFMDHlOXggHLoNOh/wfqGhGgm+MgnabMr7Rg9WXT9OGxlQ/aKCHNsnh5adtBDoMcXhswAqlQxR9hfWaTafT9qQUJSgXKDtz4xnTQVRu3IFE+SI2V5it2RXkf5iRMCzeC+2ukjgVGw6rrsNHdC9EiZZtrRdg5kVCT6vX0yfERYdnlo0orFQ5Wf/+CuU3vETaNo4MfN/OmhJqxJgJIROQ6SDH7AbsOnHamegKvvzmHMMdpDWFdOSdP//TZifatXrq6PKZ1ozSBeD2pK92uRVUJ8x9Pr+s9yELfwTCs7qijWf9+HQfNnki4sY36BlqzPpHHZB47LSU8cWy+FL3S5Jz63oQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(55112099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Bm8Mf3oisNNuwNhSakUu3YA6FIpmo/X55MOmROis5c7rGcJjgEQoXf/n9Ci?=
 =?us-ascii?Q?mjuJN2/6pbyxpy5ffI7BhFCFpR3pAxvwAIuQhjAEUuSuSdWhJ4SrgatoeR84?=
 =?us-ascii?Q?u+k0ZL6KguLXjUAsUermFp/4Pg1BavMGlWTZQx1FPIqGVeiZHd+521KqYmj+?=
 =?us-ascii?Q?PAk082azKegn3/xjA94uLK/wjSuf2bTXIgM8LDg/k47Y/Cua6irsa1486rxG?=
 =?us-ascii?Q?CPR6zoV9fQ0tgTlWJQZLjoRxIRbWo6FOKtGyGACoMzF8J9MsFERPqMhBhdJU?=
 =?us-ascii?Q?IayUL0E1shlQ5f+NDD8QEPX4z8SpgBPr3LPVIZ5dBGdAUAyqpj2IhqudauLp?=
 =?us-ascii?Q?Hz713HvL8ssArx6lRNVBewsP9+h0UHXEB9tVOLgQ6+BEGmZ6dSIibruINJVv?=
 =?us-ascii?Q?O1CzYIv9/KG3Qnvwr5uj+MXL6NA9Xmf/1ITmJgsMYXMrZxvXgUzO3+LVJ9MJ?=
 =?us-ascii?Q?Ttx/VCRdpYAXZ0/qv3xbslEieGtRSj2gv7oHXR5xIcx6o8aJovRxXhYZDMqq?=
 =?us-ascii?Q?tOVH03rSBzvHGhXLosE9wdB8i5ygmqeC5eXwJavqxccHD+WQgBhprZVSMpuf?=
 =?us-ascii?Q?j0AXp+rv6ydIXRP6NytChPHoq2O+TtliLXfvYYtrSHsU/w3AkuqjeFiZmJ+p?=
 =?us-ascii?Q?v9dMV+w8cAGjS0n1ILFUmIJxWDjIHUDWW15UCh0pGH4Rmz5likBg1yVD7EfM?=
 =?us-ascii?Q?pXH2OoIYkAmqJAFbiTRk3/1h29VqxzcD3yUk3bVQG84/wGbh3TxEr7Wf15do?=
 =?us-ascii?Q?6LbbzNmZS0+Y0FFzeqacE/STIVy/PlgImyKL4M7W4xpcvfM3M/F40SN0km7T?=
 =?us-ascii?Q?VK7ayyFS1Zfpb7y0Nic2oKcHy7yP8PYLEoIUeIHQABqWCEbG5YbLdPnN0oFT?=
 =?us-ascii?Q?EW1AUHJJkxMcczep070SjzYLIYj8PN50pa8g0CmwWgj5u0FHqyjzff81u29l?=
 =?us-ascii?Q?EYbKbsFTw56j+SR+GVMWPMYNIICIChgRTmoGJus2ydRKMitsiJNSTayTb9po?=
 =?us-ascii?Q?b6B2XA6QMWbq27U/2mAIYj3s+YBYOi++I+MzmGwRgoVloDz4fk/hjwRxHSls?=
 =?us-ascii?Q?ZCfMA5TbzNkk9lOdbC7hlfieTueYG9l7K5gir3OInIZjVyrENPUjIIVahKyp?=
 =?us-ascii?Q?nYJEAIvox+pEBO1olxuPbQJtUQI6GEM3IkcXeGwZZAqu0ZQjRy7j7Q0+c96W?=
 =?us-ascii?Q?RmOqWEjaGnz6KFWCjnjIntcBhH+seLzbTIKS98TlaPFWrltNJ88lVqUyJhNm?=
 =?us-ascii?Q?8WGknjsQPnWhAFbwDjIf/zke8EnpZw0FHbjosuDxgKWDViRdmOrz5uN3Jp4q?=
 =?us-ascii?Q?uca68II1w3BcUW/FidpZm4g6EpnVeuOrPz8+ORTTqK/IuVBXsAeUJmggH9Qd?=
 =?us-ascii?Q?GRwZOOepCRTyGhq2sBx1Kfpf0jYp83aksjhk5HEbvlsjFlnytm+2feZ0zVP1?=
 =?us-ascii?Q?b4qust9DYTK33T3ZqV+rcMi4/oQiioZWLXgC2O2Rz0nktsFzx1LTrxO02qjC?=
 =?us-ascii?Q?omjwLoItdMSWQqePS3KbUF45214btxh3OjXGmsm9s2G4Hgds8wEO+YkAiUMa?=
 =?us-ascii?Q?eS6ReP8TR1Iw78S59PrRN5gm5EPb4FtWCoZIor70f/Hb1TkSxQeSp80qmM+P?=
 =?us-ascii?Q?156H2266li7ge6nFDbCyzHcittwOzwJGptrkEpU1t0URmlB7gceciQeTTDpP?=
 =?us-ascii?Q?/c1KJT2sUMyox6RMdKfnFEPwQxIWj41tpJyJwzLiAJOlQqdsrk/xDD4x9mjH?=
 =?us-ascii?Q?3gdHfM+Coiwr2h5onXjoR68QBhuWX+oZThxKkHbCdpB954Ng7DKVOBwxuVeR?=
X-MS-Exchange-AntiSpam-MessageData-1: Dbc2v9aaQ3laRQ==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb6298f-7a83-4b6d-c323-08df0d77c30e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:06:53.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aX4jx91Fs9DH0uD/79xhEyUYDuPoOxUPJVtkNtdmCCG8bzIbVCL1nooo1/9jMndHsJ8CkoJ+Q7+e20UeBlsS29RUGGbC8cjfosFXEqm/UFUvTqoy5p+dHaCiSxf4pONkOHkhTve930zwct0qL8f/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_000705_360705_F07224FF 
X-CRM114-Status: GOOD (  15.23  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add device tree for the Intel SoCFPGA Agilex5 SoCDK TSN Config2 board
variant. This configuration enables gmac1 as a TSN port alongside the
standard gmac2 Ethernet port.

The TSN port (gmac1) connects to its PHY through a GMII-to-RGMII
converter implemented as FPGA soft IP. This converter provides the
RGMII TX/RX clock delays, so phy-mode is set to "rgmii-id" to reflect
MAC-side delays. Use altr,socfpga-stmmac-agilex5-tsn because this
integration is not the same as a plain Agilex5 GMAC port without the
converter.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
v6: No changes from v5.
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../intel/socfpga_agilex5_socdk_tsn_cfg2.dts  | 130 ++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 270c70fdf084..ce7cf3a63275 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex5_socdk_tsn_cfg2.dtb \
 				socfpga_agilex72_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
new file mode 100644
index 000000000000..9d39f843b424
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex5 SoCDK TSN Config2";
+	compatible = "intel,socfpga-agilex5-socdk-tsn-cfg2", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "hps_led0";
+			gpios = <&porta 11 GPIO_ACTIVE_HIGH>;
+		};
+
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+	compatible = "altr,socfpga-stmmac-agilex5-tsn",
+		     "snps,dwxgmac-2.10";
+	phy-mode = "rgmii-id";
+	phy-handle = <&emac1_phy0>;
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		emac1_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac2 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&emac2_phy0>;
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		emac2_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&qspi {
+	status = "okay";
+	flash@0 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot: partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x04200000>;
+			};
+
+			root: partition@4200000 {
+				label = "root";
+				reg = <0x04200000 0x0be00000>;
+			};
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.43.7


