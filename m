Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E190AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B3V7/w4cFBAP59uZBA2E1VXKKouoGJuiTbWC/ik1O94=; b=l1UULSsuHH/EYTsjnOxlEaCpZl
	uoMz6dydRGgwye73Fo486QEn8p9wXvk/ghvx+oLPo8r0QuSdZbTu2nF/XbMWzNssa5haDcpmz3Eht
	xWbJqXxMvHWJMJyKLdSXK7HYRppylPjIVE+QEudd+Y5YZF5LX9JZa5WKU3F0/UEIBncVvdfnZXy+/
	WhQ9xwbRocyCQiKwhX6agHH0DoTsX0N/fNtPYXsIDF76QENBNCZWY55uePBSaDQaBSmErcn4pq4FP
	TotGOAaApNs2mJq8zzc/zV4rSoZYoiuVrD4uaLDsIDQGHITixJjWOvm2qgtkn4y02eLHWf0MgBA+F
	6601yO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzlr-0000000BUTU-22nb;
	Tue, 10 Dec 2024 12:55:23 +0000
Received: from mail-dbaeur03on20607.outbound.protection.outlook.com ([2a01:111:f403:260d::607] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzkm-0000000BUAo-2IjH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsyD1t9V4OsLwWWUdUxpzCwawHOVH6em5eoB1mx9m9h3/5X7ye8Gb8c5c1xNeu9CubP/uZit92dVM59niXlgU1raZGAggw8iMmRDAkBVv8M7QlAOlQ/fsGGfzVGr+zQH73aXiPMTdwv2KB7Y/pnxIlMvIr4ZF8cYPTGps7LTlDQMP08dIW3gr/zjcBf1qgZRj/qh/Epk3hz25JJYPxeWfzllM/51DF1fghJbIAlqNblnwjJEEKUHIoOCFhdakMrakM/hdWkl8oQPRMHdztW4cxHL/G1ZTXgLjOYp6lXX67L8sRkh5K4mRxx693pTry+glPrO7s1kyo+x6Wp/l7SBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3V7/w4cFBAP59uZBA2E1VXKKouoGJuiTbWC/ik1O94=;
 b=yoJJYnvHwjWORoEZ8IfdJ+kXyBnuQpKJoK3yHatUNylE/XwGJ45V8Cq8rQid0UPK/wOIugzjhxFkHstd3fiUrDgAnozdrO0tfGLInIYNpNp4/0QFZeeuriexS3wAOkDMHRWedIEemhsriaMZvJfdfIGzGF/HybuU1u8to2OwQxBovfjf9Le2bElo0GtNZs5p+q2HbKH16niSnCmpxStPlAk9+lsjmY/QHiW5Qv3pugdSsaIxl6JNV/e28W692abNAc34msSnVxVls/j56yrXeIt32+6l5fSHGJ+dWIreqMvkZkcpxjHHqdLFUDVemmdDRb5M9nF5v+l9jlRzCqBFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3V7/w4cFBAP59uZBA2E1VXKKouoGJuiTbWC/ik1O94=;
 b=lLMdFHdf0LuMJ6LNhVQhBD2h2c1zisLVOlpqAnCF6wcrZjZplqs0iBU3s/z4yIc5kJcFMJqFMdy7P5E51wrwjanZGuKNeOOKa7UHmFKbKWpsRyYn5gYzcSiQSOEYJtle/v24NxoP+i14gO0TuLpgaWmXd4+zA1PFDAAeddPrR9kHLGghozIVXAXMotSQ7x8ri8xYAwSfANZIrGZfkClRE7iQRy+m+G6N/ZI4obzNSAEFcUCrs6R477O0fRZmTrcOaHzYVgErrdoqHGuU3Z/Q6mhIS9DDXNyrMC1eFdOm6Yt1wzHi5+89a63wGRRjCSKtAl53Czrs9ANEn1Kx2b79OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 12:54:10 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 12:54:10 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/6] Configure imx8mp dsp node for rproc usage
Date: Tue, 10 Dec 2024 14:53:32 +0200
Message-Id: <20241210125338.104959-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: fa65a687-6d2a-47b8-adaf-08dd1919bd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xzL0KOk+V6SXF0GrW4ux+CKcKpykOIO2SX3lcTF+VzL+denn/Ba8sLHcPTgz?=
 =?us-ascii?Q?nR/jOI1mtJ1Em0SRWa8HtKLumTPR+B18JarnoFfXprPRYkKYDziNebvJ8CaR?=
 =?us-ascii?Q?wKmDYapBroax/ZqTocTMHBgzWzNzXCsMmPaPqns6WOGGNJcRiLaCUlzRoZQ5?=
 =?us-ascii?Q?vQNyISZfez/eNh7Q3BDcQWL80LNowZy2h19TKUaG5O1cRsehgnqrSuBOcC0U?=
 =?us-ascii?Q?49IYsHArtXZod41lihLiXADUihMbFyx3f9TLQqybqSYzQCwOU7WQgvuDAwx0?=
 =?us-ascii?Q?H3cvbejTDoFhu9IdU99AUOJSynsOqx7AKpJqGS+wiuV8rFTtoc4GpdONkhTA?=
 =?us-ascii?Q?utfJnZis5nL1gRifY/gAS3u/5v7aCXOAnLGZ9opOerqukbDyAeJjgf/paHJU?=
 =?us-ascii?Q?bgvDHRzxrqiBbJws6SWLMYnNpDuDZE2lRqYvEBvJ74K6vkYIVW81N7JVo6/R?=
 =?us-ascii?Q?PHFUSq3DM8kqb1kuFHdBNInEMOW6D3HJEsGq3sWUks5nWK/pfOq2j3fhFIju?=
 =?us-ascii?Q?aq7zgcf0XzlGT77lUi+LXd6YReX1OC/oeCWOrm0TzczYc5FpJVmf8RaSlHYg?=
 =?us-ascii?Q?isAv4u6c7K7BfIKaQa9DCFzoX2ZYTlhdFbPn0FftYRApYKzlAp1rIJ399Iah?=
 =?us-ascii?Q?3NlO50q9lixpXVRLQJXhoCr1ndOogblkyajTMCsPH8IvrtwOAIn7hDDCY7OX?=
 =?us-ascii?Q?CGtC4ErORm08ZZcB7RXSFvnwm+0/It4h1xq2gc//+Mwknu8ZdVNatIlVHRaw?=
 =?us-ascii?Q?kSFBbhhz4boofoTSX4Es4HV6C8i05+VPVicf508i8HS9YuH9qDk5WXHPT/Ej?=
 =?us-ascii?Q?c8fSrVV02xza9jnpowtjB0aoUEnZ1h/UpTXZA4qHhTS4D2WYVpsJWtKito+j?=
 =?us-ascii?Q?3PLB7srcRykuJQNK1woJZhtKfzya4yD5PkRNNpGa3fD0bsy8zuU8rbXweFLM?=
 =?us-ascii?Q?gjpq1ZhCk/pJhQ5/jZlzYMAdS3M/Dh6a6RAyAESa/9sv0qMkDr4Rff6rgXtQ?=
 =?us-ascii?Q?fCoKvLvwJHYg4KujuY6R+4awQGScVj6Wod87KD4SsIbIobArlgdVPeMrySw3?=
 =?us-ascii?Q?LeIiHPIO1ys2dnx1C+z8tapei8vScf18GPWcYy+6I9Fj0gyU1j+hkfmJQ68t?=
 =?us-ascii?Q?QsQnGLka63asauxyuukBLJJQAKVN1bBr+dEwqFNBDEO4BrDiARJdq/OOMkQm?=
 =?us-ascii?Q?85G93VlSJG6+xbBT0JF1SSHfSzcGC11PuztQzGmzFXZkjhhxI74adtpm0a5E?=
 =?us-ascii?Q?JepMOUgDWERBKIWdC813Z9cJBqgkPEfwg8FbieBZjR+K8R6OxpY8eLl2jy83?=
 =?us-ascii?Q?jaGKCzN4/NED5OFwZh1NkbI9nnFHDT5fGsbfGIFAhgUkvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fQHuWBL+uSQ2g5x7x4TDL3XeBFthwR5ahIqUwCtmecBuWIRsMuOU32i0UVk8?=
 =?us-ascii?Q?adUEgLUhIO6e5LECaAmoy5fmd4GA3C+MiLER3WPViBhOMygo0nH+S8uEHo82?=
 =?us-ascii?Q?aVZzRn3scpUkeL2O56cB5Zr1E4V9vv5Eu3EnzWFWVfCzoQ09pA36OFmZBSa0?=
 =?us-ascii?Q?xgKPX2loq46NxuAM0cU3Ek0Pr1ZnU+1peYKUkwRtuURA357ew71fYVPgjF8b?=
 =?us-ascii?Q?EBckEMNaSYxH10AS/7AMNCXjSwfzF7zaak0iZA9ellC5AViTarmbDcIxs3Pf?=
 =?us-ascii?Q?jvOyL5L+RslObTSFeYi2J30Zg7hIS5uW5jWHWURm1aA+X+VDRU2szBlEotq2?=
 =?us-ascii?Q?JajeejvCsS0pDuD/HcYpKfKQijV0fmI3PM3pfvsfITsuOHdEj+K1Max2OagX?=
 =?us-ascii?Q?obE+1fD8e4Yha2BXa681Q9bigviPVssdCt9EJ/0uKxsj/DPIa+mSoJm+Scs7?=
 =?us-ascii?Q?7aNhLfhEKdturjtF5Doj+YL1CFj8U9jbuD/YMhDXKbvhvK4Ax+TEzFVcB8S4?=
 =?us-ascii?Q?ZV5MBJSz6iVqLX6/96p1CA6FU40CY1x2Fwx1UgqueUQfrxxZCx8XGZTHIryJ?=
 =?us-ascii?Q?UGMA2TFLeX1SPl7RS9ITH6Vj4N/VSFmTgNSlMBzlCTXHPRrTZ8IABJm7ooIH?=
 =?us-ascii?Q?57N5dZAUeYAWBi2ZsfSczkadXCgHA0OC0hqfIzH7xA3xms0I8S21pvxCjVy2?=
 =?us-ascii?Q?MRo7SD3WGNBGiQPSHb+K0okwaja0KgkmaviRH/d96fdMv6rs53A0pFCI4pO1?=
 =?us-ascii?Q?eQ0swWOO9cqCOPYu/deUj27SYWkXwFoJiZ4rGt/nNtEZBSqcxXs86R/rfIQ0?=
 =?us-ascii?Q?a3Dk89udQSi1EGHvscKAYLp+3zac7aB5cZ+KTp1j1hQHlzSaQs1UlQutvki1?=
 =?us-ascii?Q?ZxepeeCC6oUgw08hgwJrmmGT9XFiEJwar+51nSL4aIcjzF86senYszb7PkRY?=
 =?us-ascii?Q?ocelFomRSOfiy/p9d4O2PPMoYSKSddZ0UCFeTyA1ZdzPitX8LHkHQfPq8+rN?=
 =?us-ascii?Q?UY2CiF3GMQVRNt9AHFexs1ysdtKi5ZhEl+tW+MsWXiiYUHWX6Cr7D4eY7ys9?=
 =?us-ascii?Q?GlrWMgKDI4i+scsCQIkd4aO/kjjzpiB52mdjw9WWh29oJWLRiGucefcnfFlc?=
 =?us-ascii?Q?4tOQ8/+ELGP26FR43eJkVzfvMojvmCXgW1bT2Uo3oQDxd+CNbxM5IQvWDPN5?=
 =?us-ascii?Q?432a41RWXLo6c+JiCOCjtmAYW2RXIrucmID/2HFQWEjBgp81QlKxlZONe9zA?=
 =?us-ascii?Q?tRmR3GCU52mfJTz4kW7LKkN68O/qLKVBXH90XNr2KCLgo6L9ecCcmdUEy2rX?=
 =?us-ascii?Q?kMy49Zxr5t/iOLVVVyWu7Q+jXYBTqJwOcnIm8j5vtdFNDjMvMesZ6Tcgw8w6?=
 =?us-ascii?Q?vCspCVgQKJeDKBzfFGLm0LTy049tKNajObW/WAtNQhNwEPM9HA8u5Vuldl5S?=
 =?us-ascii?Q?8nFnZHuXSM4AXdKSk92XAzA3ISk/DYcFcYx2kTpiQ3ARoDQVfudk1Tewbz70?=
 =?us-ascii?Q?tcPX4J4eCQKf4xsqMTPSuSmUdfPIQSd8VnCdqdokKizE27BgxufgHn9sgkoa?=
 =?us-ascii?Q?widCYW4L+e+LHCrtpO36TWwaT9+8tK8yg3PQ6/o7gUAAvZ0bab8D36GlM/75?=
 =?us-ascii?Q?bsGNtkZW4+49gduh7vJelQi2lwZl3zXNzt6wCclfeczd4wuIPTVi9aQ/6bY+?=
 =?us-ascii?Q?soLwsg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa65a687-6d2a-47b8-adaf-08dd1919bd72
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 12:54:10.2856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV9jJpE2SqT0MmsVTkkZpFl/jQNVFiOt8bPP6f3fxfZ9eTl3JeRdPRKDwGVLratD0v9pgCk50H5Oryx2rg57sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_045416_609176_728B9E23 
X-CRM114-Status: GOOD (  14.79  )
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

DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
enable various applications:
        - rproc/rpmsg framework, used to load for example Zephyr samples
        - Sound Open Firmware, used to enable various audio processing
          pipelines.

Current dsp node was configured with SOF in mind but it doesn't work
well with imx8mp-evk dts. SOF controls audio IPs from firmware side
while imx8mp-evk preffers to control audio IPs from Linux side.

So, configure 'dsp' node to be used with rproc scenario and later will
add a separate dts or an overlay to configure the node for SOF.

This patch series configures and enables dsp node to be used with rproc.

Changes since v1:
        - document syscon compatible as pointed by Peng Fan
        - do not disable dsp_reserved node in the dtsi file as pointed
          by Ahmad Fatoum.
Changes since v2:
        - Fix dts example in patch 4/6
        - Frank Li commented that we should handle the reset using the reset
        interface. I have two objections on this: we are using some bits from audiomix
        for reset together some other bits from DAP region. Also, the implementation is already upstream!
        Frank Li agreed that it's up to Rob opinion on this.

Daniel Baluta (6):
  arm64: dts: imx8mp: Add mu2 root clock
  arm64: dts: imx8mp: Configure dsp node for rproc usage
  arm64: dts: imx8mp: Add DSP clocks
  dt-bindings: clock: imx8mp: Add syscon compatible
  arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
  arm64: dts: Add dsp rproc related mem regions

 .../bindings/clock/imx8mp-audiomix.yaml       |  6 +++--
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 10 +++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 22 ++++++++++++-------
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.25.1


