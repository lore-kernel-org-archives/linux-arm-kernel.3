Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A8E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 03:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtyB4SY46NxuIdwv7dfFGVDyrq1C/SfLtzvwlH64N4I=; b=lwqAgPKhJCcjbF5lTgM27w4O61
	ItVyveMsDt5694iHlUgCZKkq9lkxmMjBrvboPE9uPVtlu+cdhbA11BmuZiaRIkK3AfkQvBTsvsdo7
	IJoRPWiYPgabqa1MwtHRIFp7IFYOEuAnUGTrxigbww/PyglJ1R0pudtktr16bsPPj52QyJ0+NnZOS
	QBR9iLNp/SqQb/vU2Lle8WkNvpQ/ftan1hyqDU2cfhFaDHwXuBi8i0zhB+d0n0Vd12epXi7C1NAK+
	OWc1AhfercAiK3dJaYmis8uwXiTGzyCdEXYTmCgGeX2negISB6TDxU5LxWHF/WHTp+PGU+QsCj+Nl
	4WWhfoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUim-00000006KSx-24lJ;
	Mon, 09 Dec 2024 03:46:08 +0000
Received: from mail-vi1eur05on20618.outbound.protection.outlook.com ([2a01:111:f403:2613::618] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUdA-00000006InU-2ad6;
	Mon, 09 Dec 2024 03:40:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmGPo3igjj38qxXrEa7fQMkdaGPRRfMVT7t7CcAyRJLsAPJOMHyogNGVlNDatLnQE0x9hAI3TfIPfp6KLs3FFKsAb0zJCKNOY8+lGu06pKjy8QzD92FRtW3L9Akjnum1kMPqg60k8ntFNzhO8NDw3zLGWamMu9mzWKkbEI1qxpdWFdquDWivyYQeMVOxS3ZDsjDVSPBul5xzBBT4JgnRFEric7gdJc62SzKLuq/z+x+vRtu/qv5GzEZ6t/KbTDiR0Vfocjqcc9IzpYlXEMVCIULUYP1gp3Zeu2RQ9O84UDUNuskQIjDEeoJc5UmrzdG0wpBlzASxGlelDP2i2Z4quA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtyB4SY46NxuIdwv7dfFGVDyrq1C/SfLtzvwlH64N4I=;
 b=v4HevqvWtRbCDtAiX2WE3SklRYhzfMuz36JOCvIg+v+qgh8L6X5XH8TTsTs3YLSLHB4tcdC54bAms9525G8u616IMvLBxm8XgMLnzu3WnLxJhBAFPToTvVnzoGc5rZ4x+D2gqdeWudN2O7H4Z0YXZjgiWNHtG/dSKa6ToZCTl2RNeYo5PWA5MGkWaTzAcGDnTQEIai42Nrb8ZekEPPHWTOcObhA8qOFlZ+cE22lyuW689/sZHozUPmOvtiAj3TkrWb8UHu/0xO+Dlf71BzO0Aper5eEwKjNPbf0eba68hyn/W6pRvvjrnQq1aedjeTEFLKHDz7ojO10APcAPZLeyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtyB4SY46NxuIdwv7dfFGVDyrq1C/SfLtzvwlH64N4I=;
 b=KkKV+2viUp4GV71WPyzTT8bG4j8XfcbtxUi6N7VWdSSK+Xv9Cmu3xDbeSjEOyQEYYo0lgJJJi/GyeSW44A5YOvB/tv6RIb3ngHbGutNR92B4MXzxfSAdEgqhCBWagdczFSBFwvok3mG09Tr6wTBG3/0ehJHo5ANTuKQMcT0SDo79DZvZXDksgx9Q9wLPPC9CdujkzyCbT0jbF77qNjcVYAkUyKQlSbDnEFbPXEm7SEhTku2v6mD9pnQWkFGJqmNdXRL4slbqvb0VXjGwrOB8tAJ9IglPQHdDjhPVxxiLzeVPy2uzRZgI5JeLrmWljbtjW7qCOKe+sR/iUQAH2cgWUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:40:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:40:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	tglx@linutronix.de,
	vkoul@kernel.org,
	kishon@kernel.org,
	aisheng.dong@nxp.com,
	agx@sigxcpu.org,
	francesco@dolcini.it,
	frank.li@nxp.com,
	dmitry.baryshkov@linaro.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v6 05/19] dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI performance counter
Date: Mon,  9 Dec 2024 11:39:09 +0800
Message-Id: <20241209033923.3009629-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c084449-0b0b-48c4-4ae8-08dd18033127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QMNJq9aDA4RSImnqJ3jjX6nHTmILMK4+1USkIx/An/e3M7PxTth+CD0dYCZD?=
 =?us-ascii?Q?yaExDSV0r4CE0bzl8kD8ly0tDGDBENp11t5pChSL3VK35dm9YZsj3h/Oi3ek?=
 =?us-ascii?Q?up1emgc/+b85FgcWB2QUnphcV1JXFE7HAx+BVIz9/BcBWxsKro94K8YGOw3n?=
 =?us-ascii?Q?XIpJiXIBR3oXj8dSGalPc4wTTazbMMo5baOR35XePCdq/KjvEMsTWJNjK3GN?=
 =?us-ascii?Q?+xejHXqkYtRLBuvKfGEeOzPaBDcXZoWi2Fjo6dd+daTed3cUAPorsl08X1iW?=
 =?us-ascii?Q?2CvMRhxMU1Ng5C9ArYDZATsy3VKGqXu+f8lkjFs+CFhdmKaqJoijFvyxx5eu?=
 =?us-ascii?Q?pnZ4WpMYzXW/mDeX7Y7yH+9nJCw0eexJE38ceC+4r8WWtqNORc0CwRyCuWF8?=
 =?us-ascii?Q?jI2tkdOvovTCpz1nJygYPA4edP2xknTSz8fZV8rwhx7BotqmjVL8N43bhaib?=
 =?us-ascii?Q?cJCl+XRxElfuN4dYOWeYM/oq9BvRqILLprBEljbcbi5JVeTtG05L8kM+5E5U?=
 =?us-ascii?Q?WieHYKoWKpRSFm1Q9k0R/RMnKnKgJHZ9k1EKjE14zmWQ1qBPspuR8LtHX9ut?=
 =?us-ascii?Q?G5Gnbn+y40nKxdBwTvKzcTeu1Jl6FbYKtbE+FsUPuXGYPuAipY5KPAIMprKV?=
 =?us-ascii?Q?oRvdBVbsdhoPwyf5lRPfF+zd6yDXooMkZzQtLnMm4ztTALoKTfOLu5cNPBNs?=
 =?us-ascii?Q?5qeU1xwnPxr4dRMPTE9yAHAQjT/2g6ogFlRj1YuDbgCZffTQA2DFEfDLhnnO?=
 =?us-ascii?Q?d2XQQ7vlmfZyh+eCyvoAuYdpbguaPwdcD7Zsn1ffcPQCTEHhBsRiNbT70srU?=
 =?us-ascii?Q?Mh4eDM6Db0EZlcPcWJJ5Bh5VA6Ka9pvUN5+g0T37oCqd7YMnErA7LESILWZc?=
 =?us-ascii?Q?HZifDRBfFXxUMT5SX2QuwmjoRaJlu/8vKiLdHVUJw4g3HaXWc51mTZ6/IqNu?=
 =?us-ascii?Q?kuYNCG01+RtAQH6RQwMkZ8XL7TE7avajN9il3SfzBuNNELMQU33eF7o2g1NO?=
 =?us-ascii?Q?68xIehQblqoRgMsuia587LOtV0Qf3eo/2cjIc/3UNQswo+DzKvFPC9vi7V7L?=
 =?us-ascii?Q?hZuqWOorMUw32M6RCDzPQKcknyvlpcUIq4w/DpiIb3CE+pHEMYv7yOBar9SJ?=
 =?us-ascii?Q?lhWM+9WM8we3YlhtHZGMi0OKzkCZ/4J/UwFi6vqk95fh7UX5cLIaV4pY9mK6?=
 =?us-ascii?Q?RvBlcWh5DsA/RO0Hvn3CcflnRmasCm8irjhsgdu7HUQijnr5T8U1c03WvO8B?=
 =?us-ascii?Q?9bkGazyEPC9Eh+cdgvFKoNpV1rc7hODuWiNpV4rsCCiL1S3qhf9uMOOll5Ap?=
 =?us-ascii?Q?BrU9gZDpSTaFlnJ77nYwy/f7DpQDTsPQHPx2g/PQ9i8SbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C4pP1grw1aoBTjZon8XJGKBOf8/90JNhej0x775FLlj2CxBLop4EP2OfTej8?=
 =?us-ascii?Q?KVGB6jNY66pQvWFB855SGnJ1kRpo4Pe5RXv5UBzr5LgiUar336eGixjNwc2f?=
 =?us-ascii?Q?IJKCEIVeLOM2z97wEjcKDXs+cFpip3TEmwRBYIvEXlHcjthr9PduyjBXMu16?=
 =?us-ascii?Q?cIbA1zypZm7cNs1ufWcwEGFoDJVCjkkId01GgkWWj8i+iu9WzGclZTvF6V1j?=
 =?us-ascii?Q?tZCVB7Hh/de/GfSmbjEWvVa7/+9TEb/r7YOYovivcKvWHzCUX0f6hUokS7e3?=
 =?us-ascii?Q?F84nEFaTCJHEB4f0pGdrqRxqkHNMLaG/RWr1QM7vx9OfQgHMO5n3l472LbdH?=
 =?us-ascii?Q?GMm4PAMoE/Oe9UPdKkfu6iH4jd+Kb5nUD+SAAPSN+Cc1fo3ymSeffjbTFAVN?=
 =?us-ascii?Q?eTzZgkj3DMQUcYYlOoWkyO+fbtdK1ai0bluTDtAITkUSWyuPEddSMJHQbqp2?=
 =?us-ascii?Q?Fo7BxWzVXwf7p5OrywcKajpaKTDhudR1kKqsd9ni0aFhKDCCMnDlAOtorNbe?=
 =?us-ascii?Q?8844C3ADya8zrCG9JVentCwslVpP4KkJ5fG9Y7YNwyHZ2Eb+2iNO2q7u5fG/?=
 =?us-ascii?Q?+29yTLuk3xzDLJHtyH6h1FcgaWEfn6WPPWu4Kl1Sa+RFq2yWurIZbicvc2W2?=
 =?us-ascii?Q?A2QeVQm/yUQcvtPaCuM3KHVmBDgtAQKtT4rkg9DC2rT5y7MUgOj/y8gKpptp?=
 =?us-ascii?Q?p+McnVmgCH9tlct+QscMs6NDsowwCuXY+NYSudlJM1YQpDP3uHTItQLxt1Qz?=
 =?us-ascii?Q?f6DEM7rrC3N/22aBEbj6qazsvFUEKErdcoYMGMgdfWofCa7esd0a35mUyaxB?=
 =?us-ascii?Q?JlwUf0zN2vtJR/Np4QG5KhcNprTiCnMiQf791AWBO9XB0QAsyO+OP1nPoM8v?=
 =?us-ascii?Q?tEo2c/to7IjIwzakOr2uNPoAzgPrRvAs2s3N8LK7+d0ig/i54HSh1sn3vVsW?=
 =?us-ascii?Q?saSrb3Usiu0fSlnyGnt+ceu9mOdgddQUMzZxjQnDPSqEM50/BwtbW4zw5PVk?=
 =?us-ascii?Q?fFvEsZEr+UCgzfdtOkER1Gd3Lu47fB453WZz1IkFiC2Kk7J1412uqxBfataD?=
 =?us-ascii?Q?0EwSS/nYS60QNKW1w+uB4VO4sig5zM8EvCixinClZlIhaUBfjgYx7Xz17n7F?=
 =?us-ascii?Q?6o4ST98tSwGWvHKHdW7xhU6Jre5ewRlVb+nhAzwkRwot5c1Tc7AytCJY1xcy?=
 =?us-ascii?Q?yvr29OVZ3zf9d8KAwUlkHCSj9kt8L7Z3WaiOS5RZh9KxwSd+sKCmvTWr22jQ?=
 =?us-ascii?Q?VsH0X5LmGsZU0NMbnJrK+20ccZaL1Jtgv1ct/8/433M/N5bNFd/t/W8de2Fp?=
 =?us-ascii?Q?uBxf8/Fwc6B70O+VWFeGGwwrMT1VL/N1HO8y7ngOkqTQh35/8j64sgWmcbTz?=
 =?us-ascii?Q?lEjZXm+fFbMhRs23IR4cKN2418kc/pHOsI1xv5FaDm6vHy/CepCJ2U/gUStd?=
 =?us-ascii?Q?zW91DCpp0nBoVikPurF7z004HElmD5uM0odHXdWx97n7iE1RPagCqYU5jYUm?=
 =?us-ascii?Q?3mROr0ADDXShh/1CWXLhwu8ze7TjEMXg9/SDU5QtJ2hZriiCwORj4OUEeDGu?=
 =?us-ascii?Q?CNjInsT+eX/zdQj5Zu+CzU7VBM1nYnp0SmwVPZ6T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c084449-0b0b-48c4-4ae8-08dd18033127
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:40:14.7708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2e8faFQXWO5LxjpdoQHVNP5+dpSUSjJ/htSAx4NyZKbD8DJ8fOZleF9k+iRp+Gqd9OY7l3HGR2wonHk12QJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_194020_686412_29CA8CBA 
X-CRM114-Status: GOOD (  12.14  )
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

i.MX8qxp Display Controller contains a AXI performance counter which allows
measurement of average bandwidth and latency during operation.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 ...sl,imx8qxp-dc-axi-performance-counter.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
new file mode 100644
index 000000000000..1d6501afc7f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller AXI Performance Counter
+
+description: |
+  Performance counters are provided to allow measurement of average bandwidth
+  and latency during operation. The following features are supported:
+
+  * Manual and timer controlled measurement mode.
+
+  * Measurement counters:
+    - GLOBAL_COUNTER for overall measurement time
+    - BUSY_COUNTER for number of data bus busy cycles
+    - DATA_COUNTER for number of data transfer cycles
+    - TRANSFER_COUNTER for number of transfers
+    - ADDRBUSY_COUNTER for number of address bus busy cycles
+    - LATENCY_COUNTER for average latency
+
+  * Counter overflow detection.
+
+  * Outstanding Transfer Counters (OTC) which are used for latency measurement
+    have to run immediately after reset, but can be disabled by software when
+    there is no need for latency measurement.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-axi-performance-counter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pmu@5618f000 {
+        compatible = "fsl,imx8qxp-dc-axi-performance-counter";
+        reg = <0x5618f000 0x90>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+    };
-- 
2.34.1


