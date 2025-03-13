Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3D4C35FF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl3xiLG0FY0pZqbosojTmV56ZPRFZg5iixJ3i6CKXz0=; b=KsWGpJIl0IQhMlz5x4/9YCycfz
	VE6cg08jMjA8sLxRJALPj6WT+gqXLVMTBTUu6d3p6YWYXwa0GwTQbLZURmBW478vEWU33UkvUDbFh
	VJ9rUt/tPkjqsgqUe4rVXDeCDl6Q1bJAsNrfGuksWKF+kmZrxCJlwhCC3LEc3164GT4aVIWpdvDm/
	dOtOePRb0ufJZvGFeLbrVIWZEDuJD6sPSl1Nn5ndGs1v+s61DyZPrN8T8v0Vlo6A/xqEOb5Qhb1EX
	TEurDCcgZiEI1mbcoWqfV/m3+8b6w4hTiJSCnTRghUq1KYWYV7WP0o3nfI8kpe14io0Xi+0Gklc1l
	Nw/JWhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjQe-0000000BVcT-3vUe;
	Thu, 13 Mar 2025 14:20:56 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiEx-0000000BK0S-0HSk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:04:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIFm2B+YzfNYqa5EUV373QDNtc7QgTpD5ZsFlG5RLkd0FxSVZznZ1qh5yK7fyO7jpN+k2MoIRQZPsFcmuUKrlnSaE+idYFgo7YHOH4nHQ0OEUkDfVhw8d14GPt8pdBKEbXvUp3yP62Yz8j7xew9fRiGZIKfOnkPfx7kkI0AhxKnBgYd2D6Nca+f8YknTWpaE6inLDcfDqAvofI2bbX7f5S215dWttpSI3rCjGiMJWW2OGdVc1JWoQSG8ftcZVu8jhnLGFLCAZSeqvHaRvT/GmjVvm4J9V2mfk4Mc9C/hUPuW2CJiJML1rnfwqyCLHI3lcVHjuBYXwtT2AmRl2Nb/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl3xiLG0FY0pZqbosojTmV56ZPRFZg5iixJ3i6CKXz0=;
 b=Rs6h9G60zLrEun1dsDioTN8Qvwsuq7+79VlylvI5cGlzVLHbsM9iQpss4p7yHVsPaqaCZyhxs1x7r1YzcORVjvBAtaksrPcYZAf89198IZltEd13Xe/LvCiwWUzQ4iZnSkYnZGiT3z9a/BK2jAwMy+FWORWtwRt3acCfeN5tuKYu5EPGZui3tddgmBFxQh3NlP0oHHPiwdY+XMbRIYpeWUN4skT5kegvG1PQ5pCpXH0K9k19thBXsdqd/QKu7JBgPTR5snSK4kd8JyQZ/igL0sc2D2DGMUOb3kR1cNd5cUIWEi+JGCKAfe8Z5akb/6wxy56QwvVmhHttfhkYLvgXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl3xiLG0FY0pZqbosojTmV56ZPRFZg5iixJ3i6CKXz0=;
 b=KnVNmOEyy4VezPtfAvNyRyshIVep1/XUkhFYoy7YLPOEMrGvdLuTy4AW3WM1kdlweD8jhXB3gDwxI1aNrq1mO4E0eJupgRkvxiICSQL/z1bYqkV3XNUR++DQtk3cqjLtzxUucHytX9i4ss7e9nphxck9N882idas/hoSPa5Sbi9OAVlKHN49j1vby046IIe3s/JNm1/gBivA6aV52QyqcMLyYmNdwBC1UA8DNZ3yw9DlBYCVcSr9JUe9fV9qOpnS8J8V6FDCv/TpLcBgvgUGjVUPRqNO+FxGQ9j3QNOTIRMxrWJnool8HSQuP9HWHeEREvPLO8RZG2b7JmTZIsyStA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB9056.eurprd04.prod.outlook.com (2603:10a6:150:1f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 13 Mar
 2025 12:50:33 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 12:50:33 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com,
	carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v4 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Date: Thu, 13 Mar 2025 14:57:44 +0200
Message-Id: <20250313125746.2901904-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313125746.2901904-1-florin.leotescu@oss.nxp.com>
References: <20250313125746.2901904-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:208:be::15) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|GV1PR04MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: 83347cb2-1496-4225-f8e7-08dd622da49b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yw1uLejFz+ONlo7Tj7OoGDBW5OcrKYypUwvkcckVVuLt/5C+2xXehP0ke+?=
 =?iso-8859-1?Q?7c3LsSTItfl5l5JUaYj6yeDGSHWlu2yjRZKOnUYxwC3+cBsBafjjjxDyx+?=
 =?iso-8859-1?Q?mT9d0R3OD25CvwlwXgLw6LKufQ17dijbgvlCF5D+QlX68+uR5LUDJs+dTB?=
 =?iso-8859-1?Q?rCRxqjbDDPXEWQqB2/Bkktwxb+W+AC0/m+1+PZJG70BNKNMsVR6HtBy36Q?=
 =?iso-8859-1?Q?KOVf1nW3CWauM66X9ngEYlFbSVhbYtVbzkc9St1opngioxJc3XG+U0pWOJ?=
 =?iso-8859-1?Q?YO4V9Jz70y0VytDcAgZGhBSfSvYSu+nqGr2ElCZ0UNTyEoGPeE/Hdntr+K?=
 =?iso-8859-1?Q?MJAE7toa/rd+BO6/LRVQbZs/wlYrHHEDzSZf40k+1O6rloNsYGQ0/YcnWV?=
 =?iso-8859-1?Q?KVfxi2BlnVGUxSO+1YUpUzw830JsDyDxnPDy0cc06c3VWPg0Q85WNJQaPv?=
 =?iso-8859-1?Q?lAKclqqH5k5bo4GRlzCx6Gb4F1ADKGJBp0K0Zfyrpcq4c+iTbxNgGvwJp3?=
 =?iso-8859-1?Q?sSUybiw352MJqKq6+Z6u5yL9306WLodPuLbZa/pv2ywkl88irvRVlDQjwy?=
 =?iso-8859-1?Q?nz28AGvb4LbZYvfcboGKRk47i9tCN36VWbwr9a7/+m+3mjnYGzfMvasBw6?=
 =?iso-8859-1?Q?cqBCh2AU4UrtQuk+HKmiOmZBmgnemBm7N/aJGR7stxwOJUoXTTd/AwTUB9?=
 =?iso-8859-1?Q?CcYGNm09VT68v3hW3Alcm0/on+8XY9dVUOWXXDp+/QGuVsNbLEe/VmGuxZ?=
 =?iso-8859-1?Q?x0awB+nZt7LY5vBgyHw2CL3K/VLvBjOh9dwMcnXfMMaPakGTTQCkAbPBeV?=
 =?iso-8859-1?Q?wvQU5KMmmoSoFdN/8AJvKISO7QhABw/C3EAY3Vkao2CQRtqRq29jsjEoKf?=
 =?iso-8859-1?Q?E9BKrYoFmhGwMv6mr4mj8ZjkIjJOx1mYjbLAsO8dmNBtpGzUPaj49Pp2vT?=
 =?iso-8859-1?Q?zLMl2Mqjwhe3OSkY9uTRs3Hw5zZCIJOowKWy+f0kwGR/h4/Rp6ehRNNK8w?=
 =?iso-8859-1?Q?qK8WPwxYB7oCwVSJF3LxL6j1KCBIJh+KM9Q//EKpFtSzRw1jd/Nyq/TZw0?=
 =?iso-8859-1?Q?TtRh+8Fas5nOswh7eT4UbCnbp+E0kad9Trcqgco0QXy5f1iH57ktp4FD9L?=
 =?iso-8859-1?Q?KfbpEI1Mi8LrteQ/MCVKnyuDhD5FK4CMRSaKjCNCgqjcI7+TrBtNF95clV?=
 =?iso-8859-1?Q?aPCJ2j+sQn/1v/auqayKsIYS7OOEw57r89tzX4cscBFHjmULt4URl/NjZP?=
 =?iso-8859-1?Q?Z1m0RAG5ERMCHnBghf/lYF/l5paxXaChL0Ev0KPgRgkEumaKUvY+xAwFJD?=
 =?iso-8859-1?Q?URXqvx6/Zgx6LX73a4IoMC+RUtBuY5rex0W1WjxOJVs+QA1JFM7yLaQ7WP?=
 =?iso-8859-1?Q?X766kYlHjjKFIKfbpKRWb5T/ewyXNwjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pFK2Se8cqQj1f0ZOUztJLE54P0hpttsn1uw/eiWlgTxY/3r29pCcuUDyU1?=
 =?iso-8859-1?Q?beKUvENCO78hJ6W7etBHnwUv0yIsNCriuo/gVre6WhL416K8CsHMzPvbOB?=
 =?iso-8859-1?Q?VnfDA2E1d1EakFYbD1Kg8F6bzLD8V8lF0EXNghFrVL1f650c30SFWYBbYg?=
 =?iso-8859-1?Q?ve7ibld18U5CdeYGRqD4ysTFWlwBCGFw9QgLvW/jZNopJu4cMp+cRSVhhq?=
 =?iso-8859-1?Q?ElA3VqqT6QxKShTGlRRthP2Xc7rmWxojuAQg8xbpwUpPO4eXrBSV+eNx4J?=
 =?iso-8859-1?Q?LG9VTQ7b624e51CDkx2LoaR6JRiMzc4V09JdXfwpx0amWQ1/LkWWwMWArP?=
 =?iso-8859-1?Q?EP2yDovaQ5JqhOnS5KfSLbCyJv0iSVcY1RbWUQSCWVvZWv1I8I7WfN64A6?=
 =?iso-8859-1?Q?0ZxCjleCRuxoF+aeLFlrsYAN4/GH+r0aCXf2rcxmNTjEmO8bcNj6yx7CSB?=
 =?iso-8859-1?Q?22VmJDVzUgpimYzsy+xjWH1TWdDTgatXnlYf+mbk+Jb2ItR2nQyRrF8xp7?=
 =?iso-8859-1?Q?2dNiRVIC95nmx1HLakwD0bqn1siSDXud3mWz5JO0kGCJHaH8nntxfmt4Lx?=
 =?iso-8859-1?Q?SFv/77ULk5qqqhvfQ6iwYkL47sRK1QWfEKfeSWHZIC1rpHAkILKQ3/qFe0?=
 =?iso-8859-1?Q?dNOD0rijSlPN6pEkpAbKqN71XMdLUB2ROM8pqE4RP5xPgjg6lNxqoWnEMf?=
 =?iso-8859-1?Q?RYd7Nk49D892zdxamKuvEqy6poqAEsYHoRzihoO2gPe9LHzOL5jPKYTAE3?=
 =?iso-8859-1?Q?EqkJrnYysLKl338t5u4tSTgtFImrSBwRsXgqffIozrbfFHpviLTQxu/BtC?=
 =?iso-8859-1?Q?xZ4H01k+TiOVhYMkDUA17eIIyJKGcMshACYxbvIEhXG3MqZUdypXi4HmCC?=
 =?iso-8859-1?Q?745jdiCoRp6NYarKzFpfwzu07PaGNUCtwdq8EExNaoI6+iCtnHuiQY77xs?=
 =?iso-8859-1?Q?7Rxym7vBhzK1pdCxErnWUa5BFOGSsd+fhNKAy2fqU/J2MGGdTRG6p4acnK?=
 =?iso-8859-1?Q?K6qzpZ+xlKqw2Ha9jwOUXKoV9nsOYV3aieLyJEZG943fh/uY3cn7/3AcLK?=
 =?iso-8859-1?Q?QGikStJJovHPw3RBe7pp6osjQD7/yMiABIawygnY2DpdaEVt7Hm6dmbYOQ?=
 =?iso-8859-1?Q?/fWAvPj5BoBxgygbQZIuTsZ8SMAzOcMS77u7A1MoaoaFCuLmHyio3dH15P?=
 =?iso-8859-1?Q?BX579IwdFmXrxqfaQ32BLNnGh/miP9SjTzx43Mwa6d0g2e3jU5npn4m1CR?=
 =?iso-8859-1?Q?nv9HISW44CuC5cxGNSO0cVjD7XVPJSOb3oSmqjuvr6WqZDLDFXmxYgldiu?=
 =?iso-8859-1?Q?B41W8zXwnKHy61Fs3G7vFYZOhwbjXyc7QURBY+vxZJCa3yzlISH5vVahUT?=
 =?iso-8859-1?Q?DyokUr5zjArDZjD3anIaW7F6MTlKOHQBn3D9tuYhGSTNC8CBG/a+vDrLi3?=
 =?iso-8859-1?Q?AXnfzPCSTddk7d6g0wbk06m5dMBnLbD+U+HDUS2HAOTV8gRt+whHD2uL6Z?=
 =?iso-8859-1?Q?8aK0x+TwdT8XJ9tKF5WiCNGmHnIiZ4gSClapUBd/VrR6NF6fqy1bJNuMwy?=
 =?iso-8859-1?Q?tqtYV/3hKqr90f9X+5plHx6HZyA4GHtVu4CB4cSNqMCEHGyxQIWSh/LhTL?=
 =?iso-8859-1?Q?/MuaN1RxKHsuvWu/SspgAxA8iWMz5PxiKm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83347cb2-1496-4225-f8e7-08dd622da49b
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 12:50:33.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+Z8/wQ3zSCxlEyebEyGONEgJTafhGr+OhsDon8VNkqAGXQI+1ooYpRdOw4JjhRFZGvXdPrmRIFCKNKD6eKJzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_060447_101289_6BD017D0 
X-CRM114-Status: GOOD (  11.93  )
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

From: Florin Leotescu <florin.leotescu@nxp.com>

Introduce yaml schema for Microchip emc2305 pwm fan controller.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 .../bindings/hwmon/microchip,emc2305.yaml     | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
new file mode 100644
index 000000000000..3107fcafcf6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip EMC2305 SMBus compliant PWM fan controller
+
+maintainers:
+  - Michael Shych <michaelsh@nvidia.com>
+
+description:
+  Microchip EMC2301/2/3/5 pwm controller which supports
+  up to five programmable fan control circuits.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - microchip,emc2305
+      - items:
+          - enum:
+              - microchip,emc2303
+              - microchip,emc2302
+              - microchip,emc2301
+          - const: microchip,emc2305
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pwm-cells':
+    const: 2
+
+patternProperties:
+  "^fan@[0-4]$":
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description:
+          The fan number.
+
+    required:
+      - reg
+      - pwms
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan_controller: fan-controller@2f {
+            compatible = "microchip,emc2305";
+            reg = <0x2f>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #pwm-cells = <2>;
+
+            fan@0 {
+                #cooling-cells = <2>;
+                reg = <0x0>;
+                pwms = <&fan_controller 1 1>;
+            };
+
+            fan@1 {
+                #cooling-cells = <2>;
+                reg = <0x1>;
+                pwms = <&fan_controller 1 1>;
+            };
+
+            fan@2 {
+                #cooling-cells = <2>;
+                reg = <0x2>;
+                pwms = <&fan_controller 1 1>;
+            };
+
+            fan@3 {
+                #cooling-cells = <2>;
+                reg = <0x3>;
+                pwms = <&fan_controller 1 1>;
+            };
+
+            fan@4 {
+                #cooling-cells = <2>;
+                reg = <0x4>;
+                pwms = <&fan_controller 1 1>;
+            };
+        };
+    };
+...
-- 
2.34.1


