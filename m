Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933EECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 20:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaPoDTtn7s8EeJZUzfUM24xmTWkUcynkEL07agINNnA=; b=bWgLxnUPHZ320qGh+sX7IMX7EI
	5zQxpxmQJFHVM8Ozw7kuo6kcZaOq+YyKcqskXm7883T6cvMVJdfG+B0S4P5MQ7CuYCUc3B4fMJEIc
	ZPuZhaKTMXZFEx++ZbeIoh96NMNUcCwqtAhY8eZDM3hQNspY4/SoDyzocwnojbSmQgQtVx1fElznI
	b9O1f++QwtVZ5D43OVkXI4Yr+DfcUR0LCHXAfOqa5hAcQdlctpGR7kI7Rw7w+Vu3lHivJrCUhmG7H
	iqIehtlk0nIR1j3fhL6trnQo385ePIb2pchXzKM2oH3vHxnllO1YzdpDVpKkw/D4GAMJBkd3EidFK
	8pNWF4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNjp-0000000CY8f-37qX;
	Tue, 04 Nov 2025 20:34:45 +0000
Received: from mail-northeuropeazon11010050.outbound.protection.outlook.com ([52.101.84.50] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNjo-0000000CY7P-0XHC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 20:34:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHf6E69zY1Yo1+QpgthzbbpCvYzbYtLO15FPrAs32swVHCeG4mlHj6hiAyYiKwlDFMEWa/Nt85uJScV1BgbiaYfFqWlGXDr3K5qw6qrM4txLXc2KS7x/YesGfrbtKhfFlchRCSVb84V0BgueMgyybKRip/j4LM5ozAqNvMmQC2xfvffQkXjOb6ToN4hNph8dBDdrKAseW7fN839MKMUoXLGJGH00En5B1gsxGcuKHYDCOId758eOSy+NuDTg6U6eghnzejgqINE9Rim4/GH7/+qe1rKGshXo5ImXDnSwHallaGJU4JlbsJrZ1/nIfc07b0g+jriKBx2t52BfqxjmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaPoDTtn7s8EeJZUzfUM24xmTWkUcynkEL07agINNnA=;
 b=LiEAlSSq7G1keF6hc+B6PRdD4D8zWrAtjQ1fxIEJFG1N9SHGBK1FxsnUQbHnhy3V1Gyo/O0w8aiVlUn8tWwG4YhD2xKYlHIg6p8X/94HS7yiPSmVJWuO/JfFc3BfrBPEjsa8I9HKf0K7nnT2sa31HhbO5kI4TLLLYDu13iAn7o4mj7psF/9unTrTgZcJaYPjGyXkVD1HRV7vWj22gBeZF3E7yiGPHVZZ2BwtY2nQt2vqeIIiBUyIl+TvPrLLYauSOh4UFQJtZCWj6mav3dvBPeIJjxG3PAVfQlMfU0Df4Ce1AcgO0hl7qEGeLQOsujd+C/yaNuEdKuEkuVTfQ62GPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaPoDTtn7s8EeJZUzfUM24xmTWkUcynkEL07agINNnA=;
 b=i8Ox3wwN41TT3+dbcPWmmMwWascKl6MvZZi/6352/p9rsz/eYXRwrLRe9eBT6AhIy8mvdcB7ZGNeJWdfCwkW7jsJ/HhbFIAjtF1NX/C7qfwxGh6xGNk7c6WQPkupoJQYkJvXO5UhCCYC8lIoysCVrJdiH+19JWZRQoPBAktvJclmcttCR9AGymmYij9d2/4cGeO1pC65svj2THhx6fL/YGqVZuWbIBxh51BG8e/hKfpoSTqv8cTbx0uPcIlatzGQiUGjmlCXHksTq/qEeXhugF/t6JCzlr9LC7dYvvZoIdm19Ft+OczPbwy6WAxyih6WXzTMw+0+zEwMqkvKXm+eOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 20:34:39 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 20:34:39 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Date: Tue,  4 Nov 2025 14:33:13 -0600
Message-ID: <20251104203315.85706-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fff3ca8-665e-46e4-d571-08de1be1939c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|19092799006|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tzUWeTlUJoUGFFCyGzbm/DbJ7GtU0ySt+29CiGsbjj9RB1dz/r7MpE3dJJ09?=
 =?us-ascii?Q?0Suxdjel91NgcNIIKwqervwJD04vVh66F13QZDT0NLvmdhOfxUlp1FjMDGDt?=
 =?us-ascii?Q?v7WVEnz4qs66RYd/Socuk12ePOU15CfqwCKQX8W4CsGSte1epl8+y2LbDAbb?=
 =?us-ascii?Q?Y2lHmNXZVXZyNobsP/35v5kVqWjSrOKo5PRzJ5Yq6ocLhH/KzkeKbEJoZnhM?=
 =?us-ascii?Q?liDnqEle2m4CKtlLOq7r7bMQuoa9aloDHgijYNgDB/yLnTQ4Cn1vDmxDcApW?=
 =?us-ascii?Q?eGQZXKMFov8uQHl14RyU6TzM9QKbULe907N5LeglbdqPeOhc2ov6sJd+ttvy?=
 =?us-ascii?Q?MjsCho+K3Cktw4TZHNsfzUcAwLHDylmkfm+ALkUD4/x+dGmFOOnTfrSYYmDJ?=
 =?us-ascii?Q?ogfhWyopC4F+/kLSYMdWwE8UMvmiK5hYElWTVE5UkYN5M4eYG5K/EOZLjDoC?=
 =?us-ascii?Q?dTrpzTZdSYFMAUAvCexdRhw2hVcH9ktG1HVl8nCobls7gnpLOCPsLPdtpnHe?=
 =?us-ascii?Q?roWzIrbPXSjhj/trLMjcGd9I5v1SSCe2bGm94BMdlssq/E9HkuSGhfWCoUhN?=
 =?us-ascii?Q?7/Yb4pHzm4DT77KYipxyXIA3aS7V0J1NUrcb08TP9b6SalyTINTVv1vz8mFV?=
 =?us-ascii?Q?5MS+n2awuQ9DMxpS8Rs28O3gqrknRGRgMQtQow6H5eHNvXbP6eUCcdsEWU3h?=
 =?us-ascii?Q?jiSEBg2KganoHO+WEJHhuuYO2bLysIrkWKYTad6FOsSTBkpDjNLyxWQL24F2?=
 =?us-ascii?Q?Naor7dT0OMhiNN8Tk9SJ7D2oekK5xesSw66Z8PGs9s+REVqLtdpEiAfL9687?=
 =?us-ascii?Q?zmoonck7WCWFAb24X3WZEgYzkjCUMyBxUof155Quj/btUpCzvuyyvg3+hODL?=
 =?us-ascii?Q?yXNVAqNXkha8U7MOnGE4WDQXBIidsG7nzX39DT6JeChpXcPNbeUpAXjlWWgw?=
 =?us-ascii?Q?KlXy/QvI8von5s5/vzcrWRtneYO4MnmLFfeG7FgrQqweTMU2CqU56+2qM/Nr?=
 =?us-ascii?Q?etWAHaioZ5SHKTpOnM4v7fJbMe+bCQtKrudIULUrxgRIxx5kMwyF1FnMZTXB?=
 =?us-ascii?Q?EJnOEE2aUqKt0E90PlHPnkmmIHzl6e9f0kDUlNCL2O2iQrFqtFDiHoG7xV9y?=
 =?us-ascii?Q?6NusipIXRsmAJfHigf0D0XhqPL0BzemoEuLFddd1LB4r1WZ7K10noHec3Fyt?=
 =?us-ascii?Q?agkr8S2Q91LPNP06Dgv921y3QIoFsBY4yeYlhRehZ4N+8rVyvaUyKnDbejLr?=
 =?us-ascii?Q?rKBz2/9WEeY5NxwX1Gb6DjQUqDFb9N49N2fz5O9qr+V4UQ43DMLMLciE5Gkd?=
 =?us-ascii?Q?frqWGEaREuF8+bRrKAAD5qGWvwHl/tUdQIRyT5Nyv4ukjBDWKFsAgS6pX+NW?=
 =?us-ascii?Q?xhcy0RT5PJh9QxYn8xfVU2DfYybIslU4l2UpvybEz5cry6m8D8BlMv1fyYEB?=
 =?us-ascii?Q?SlZgsI/PPA5Ri0iw9DwIQWAnZmEUPuTK0I1tSFqLTpJltQZIKf/DKBM0rHJp?=
 =?us-ascii?Q?bdCRpdqfx5H7yn5LRV7NEKMLG/cD+Eg5LwEreRSjKuR/Pd6pPE7J/zUorQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ATJPV4e5ZvVJm6p73ESbu04BY46csObAURatll+w3SkVW2U/RNA78cH8TtX?=
 =?us-ascii?Q?3AW6AGJH+yJiCX3LWyE4NKoFW5v1h0XBmcAl0wxEd8RKjVmPpwowTUrYnYmC?=
 =?us-ascii?Q?GqCOp90a5FQvYy1ySt+LftAJ0jlIneDIUFqdas32rUA952QHgekchPgFBmJv?=
 =?us-ascii?Q?VS4PQ6tNpPZNH4V6NypaIvsTJHh1SAqDDMtPPfHuDSSGmDYo0OQSjJ44DIuM?=
 =?us-ascii?Q?VPPBhkKfliN4sxnNdOVkx26cJVwHVnbGDlin13Zgmml6S4LEpuiXKIk+ikqp?=
 =?us-ascii?Q?HHy7Yc3/TcgidKFuwGQPg8NsGzmotXljSzohM+nkM/NghM3UF+0xMdP9KPlD?=
 =?us-ascii?Q?gBur6qCo05Nwo1G9er04G9G8XrY6WQvGzad8G398o4b3mgXKQhUV7/ukW4yL?=
 =?us-ascii?Q?SsOmq9oK+0NBM//vpo1aiXpYHqZzAlFLnBdNIJG3tpn/N6oCpePeEz5Dwaf0?=
 =?us-ascii?Q?r+suXG8Y+NReeu5PAnQm27a2sYf4dyt9QTvjQNpyC5k8FN29+xkGFHdE4zpd?=
 =?us-ascii?Q?n48vA5vdc8la06UhoG05GCI+Oa/5wpg7vZBxsz1y2s85KCCEDyiEu4NU3QKz?=
 =?us-ascii?Q?LrqhLu5YGfoiJnswuYAg9nDLcNF4KizfQ8t3ix7Dx3GBxqgb4m/Zs8EUIng4?=
 =?us-ascii?Q?+w+RiU98ObbJ2QUqNTIwFF8m1IuCfEJuOJ2ryTL+98WOeCDDQVGAXD23IZ7c?=
 =?us-ascii?Q?b/UcjedEGiLWxgBIRdGJinp3QJ5jnGthNfiCn7c0EEXOcotoYwtHY/pS/nCU?=
 =?us-ascii?Q?ohiYEuToC11v/QJ7N4x35pNpoYkUopdxipZWseHZ5nCIhVRABFhlr/bPhLUN?=
 =?us-ascii?Q?nA8kqhhFp2pb4v2AKYyFX7D7lmBCtcaLEyWaxbcj0lnaqmrNrBHNLd618iYN?=
 =?us-ascii?Q?KZO0rw5ru12l5beGiyBnS4pY8v4kA3Gmrx0u/zHlnyLHQb9WX5fwbRxLRqTp?=
 =?us-ascii?Q?AJlACdYoOa1zrp1zOvpCxSMz9Z0LHt+YRPemIyFm4FKRePtk591diHop1NJ9?=
 =?us-ascii?Q?HokvXP0z7cDQqCPrAI+hg16H0RW37yQJJzycuH0sQsu6RnMrH0KutWUzybyg?=
 =?us-ascii?Q?t2eq4feCRE5QYzKhszxw4d4tU3gIdlme85d+3kY+oEBY2kbKXV7LXYXwpztD?=
 =?us-ascii?Q?myBebBpp/Foe9B0+WaerQBsekduUyJJLYyKvMRLru1CFKnFl5BSPBob7ViFK?=
 =?us-ascii?Q?LDrB4jsoUGWOkjMgPeaJX4e8KmZW3OLgKp5oFQerqKWyGugTfMpr9HjzzdQU?=
 =?us-ascii?Q?BtiwNPXtpYhbS/SwwLSxFwn1ZFqT98HlxyLBcC13SMqx3Jx1uB3q2+PQ1eXL?=
 =?us-ascii?Q?UD17gytjF2tOPxbf91hoLIqEKuRHPFc1a3SF9UVPW27WeIVCk21MfN7dQcpA?=
 =?us-ascii?Q?lHsi48UkfthdHq5TnCBMR/eBKZ4Jog6E9OxfN9hdrS1D6L2JZgvt7CC+Wl4a?=
 =?us-ascii?Q?x6zEt9slHikAn0S3n4uW1AZTmS6lVOc1ZHFVDhRz5W9uo8JwjelVQ5QhgfeN?=
 =?us-ascii?Q?Jn5fMkVHNj98MD/0bofR5WWLp0aTRvfuVoqnlwkmDMoh5wFa9C1ypuw2rumh?=
 =?us-ascii?Q?IKVkBNo56xWtxcKP0Jv2irPF98OSVy/67Dav+Dt5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fff3ca8-665e-46e4-d571-08de1be1939c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 20:34:39.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sy6cbqbQP2Xn5Wi1mQaWkOlGezn3s5yT70+gKFpASUf9Fe5+pWYO+Q9tLrQd6Py4wFItSMdjIHOIeN2MKhamQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_123444_315414_E695AFB7 
X-CRM114-Status: GOOD (  17.27  )
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

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the cores.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
 Documentation/staging/index.rst      |   1 +
 2 files changed, 203 insertions(+)
 create mode 100644 Documentation/staging/gpio-rpmsg.rst

diff --git a/Documentation/staging/gpio-rpmsg.rst b/Documentation/staging/gpio-rpmsg.rst
new file mode 100644
index 000000000000..ad6207a3093f
--- /dev/null
+++ b/Documentation/staging/gpio-rpmsg.rst
@@ -0,0 +1,202 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG Protocol
+===================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers located on remote cores on the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 14-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+------+------+-----+-----+------------+-----+-----+-----+----+
+   |0x00 |0x01  |0x02  |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
+   |cate |major |minor |type |cmd  |reserved[5] |line |port |  data    |
+   +-----+------+------+-----+-----+------------+-----+-----+-----+----+
+
+- **Cate (Category field)**: Indicates the category of the message, such as GPIO, I2C, PMIC, AUDIO, etc.
+
+  Defined categories:
+
+  - 1: RPMSG_LIFECYCLE
+  - 2: RPMSG_PMIC
+  - 3: RPMSG_AUDIO
+  - 4: RPMSG_KEY
+  - 5: RPMSG_GPIO
+  - 6: RPMSG_RTC
+  - 7: RPMSG_SENSOR
+  - 8: RPMSG_AUTO
+  - 9: RPMSG_CATEGORY
+  - A: RPMSG_PWM
+  - B: RPMSG_UART
+
+- **Major**: Major version number.
+
+- **Minor**: Minor version number.
+
+- **Type (Message Type)**: For the GPIO category, can be one of:
+
+  - 0: GPIO_RPMSG_SETUP
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
+
+- **reserved[5]**: Reserved bytes.
+
+- **line**: The GPIO line index.
+
+- **port**: The GPIO controller index.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
+
+GPIO_RPMSG_INPUT_INIT (Cmd=0)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Interrupt trigger type.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: Low level trigger
+  - 5: High level trigger
+
+- **wk**: Wakeup enable.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (early remote software only returns this unclassified error)
+  - 2: Not supported
+  - 3: Resource not available
+  - 4: Resource busy
+  - 5: Parameter error
+
+GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+GPIO_RPMSG_INPUT_GET (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 2   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 2   |  0        |line |port | err |level|
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **level**: Input level.
+
+  - 0: Low
+  - 1: High
+
+GPIO_RPMSG_GET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 3   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 3   |  0        |line |port | err | dir |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: Output
+  - 1: Input
+
+Notification Message
+--------------------
+
+Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line index.
+- **port**: The GPIO controller index.
+
diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
index 77bae5e5328b..fbb212e26007 100644
--- a/Documentation/staging/index.rst
+++ b/Documentation/staging/index.rst
@@ -7,6 +7,7 @@ Unsorted Documentation
    :maxdepth: 2
 
    crc32
+   gpio-rpmsg
    lzo
    magic-number
    remoteproc
-- 
2.43.0


