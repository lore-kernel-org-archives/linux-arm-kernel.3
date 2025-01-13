Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D32C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2dg6/gM26fz8Jma39ELXhS8S4HhQDdMa7KZgR4r6dc=; b=R4CwFWVPKPDLegvg75ds1TjsRP
	4d3cpzI5gNBQTAygGzMJHRJ9Y7fhRcJqfK2svI+7GGCB2y1svkQRzz/Onje6vknBqSvMlssppbxD1
	7g5H+6a2fLuVnSKJo+spHq5hSKSSRRGX1wIjUZChGDO+AxhAeTa8yBkp55wmYiArJuzLtDglHLfex
	VzVG7X3bbSBdZwC2CNMUJZBgX4iOs7f7bXupJUwChtG5AVFGeXoU3ewrEq7UbPe/mghLZ3p4+A0o0
	68DTl9rrSUWivJwihJrqHZTlCHfJXG5QwEH2b3keJSE/zILHA8F1YnJQcb9sry8MzMYJYvxe4jFiA
	G1GB9qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPdX-00000006Ikx-2ePL;
	Mon, 13 Jan 2025 18:58:07 +0000
Received: from mail-bn8nam12on2070f.outbound.protection.outlook.com ([2a01:111:f403:2418::70f] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPcI-00000006IeH-2ZuZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:56:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLqZtgdi8umJejG+CJn1E47UhojzGIU5nybKGRekEX/uFCknQcat8ChXfTP3ygLbyimcwg/uLO/hbT+mFmJOSEiVTF/zma9U3yh3o+TFtxtnDEHUsS7LrnOmv0wXd/ai/Xc8PEf7+hTOJSGOQcLPCmDq+/iO+DtQgp9llvCzUzCg5JZocgGevZM3O8LcOw9Px4zwH6lN2AKdmiAA++VnU0vHBMQT/j/6UFEij1qDune2a7Rfbpo6O18aIx+Eh15SBQDNw+0HwjF3tgzJxZDWeT24KiXUOUoblihk3bkCXihIDCYSTR/bJaTm5JV6F/PYH147ICME/13enso+WlTLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2dg6/gM26fz8Jma39ELXhS8S4HhQDdMa7KZgR4r6dc=;
 b=SOAPpNdrjRFT6nlfgONBFs/Qdpmge0+mPE9ak4OHv0Szk8v1Pu4g0QqdI60jhR7jgV+ABN9RwlS+V7TqKzgowcLDLiW+azU9C8CjR4QtDkzWnzHdg+0JgiOGWjsBmXclsX4ELmQolxB2S/eefnzikN6ZEScqkzfJGHlzEYt4nIsPsgWms2hzxdu2uZ4nXsUpKIhnHBxgqazl1kBhuvkhkPmYBfWwf8HxdJ0ihGNdimBtNN8AE4brKtP8eQQLGG9wSNQfoup0nnDdfbyRe2zVteCpCHIRH9u2NjzMIq8SApEclcgXrlWMkn2/GhCAeS+jm2jPPKjbvjBcdYrf4Y5JfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2dg6/gM26fz8Jma39ELXhS8S4HhQDdMa7KZgR4r6dc=;
 b=Vs0beokrD46xAHvVpLUaX+FaoGrdQ+sMORQfcVf5+kHG7Rmg3xKBwpyK+ZRHmyyUPXOkudSDU+kkBCe2YpKJKPcg0pQCV+VOOG9QCkKUsJA14MQJ2xqS89270N7t2hVNz3jYPlIBqZP3/4IxFFh3Tce9efsCfiVCDMwtiq6H+jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com (2603:10b6:a03:537::8)
 by MW4PR22MB3716.namprd22.prod.outlook.com (2603:10b6:303:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 18:56:42 +0000
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d]) by SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::789c:e41e:1367:383d%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 18:56:42 +0000
From: Garrett Giordano <ggiordano@phytec.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	shawnguo@kernel.org,
	neil.armstrong@linaro.org,
	alexander.stein@ew.tq-group.com,
	biju.das.jz@bp.renesas.com,
	javier.carrasco@wolfvision.net,
	elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] arm64: defconfig: Enable BANG BANG Thermal Governor
Date: Mon, 13 Jan 2025 10:56:07 -0800
Message-Id: <20250113185607.2210352-1-ggiordano@phytec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:408:f5::33) To SJ2PR22MB4354.namprd22.prod.outlook.com
 (2603:10b6:a03:537::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR22MB4354:EE_|MW4PR22MB3716:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de9380a-b0e6-4b79-0fbb-08dd34040492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2K4x+ocKNAWvaggMelVVAI4AhskvTPlvdoTm3Q/kCYqV2i5jjsHmZ1VDZwKM?=
 =?us-ascii?Q?pSSEP1wYoPXxRcP47YOukCtBH0bakXMFcYd8Maqo+UFRn7lB7imtTydTfI4S?=
 =?us-ascii?Q?RXGpiLpRS4OpKaWoO91wfDPtrD+E5Xx/OKXvIxlbJAZfacPxDASEj+1wCaXP?=
 =?us-ascii?Q?ArjdhLkHYvlIDQY3cJmnsi850ZwuJAsvqI5srO9GlA8RsCweLahK6Jik2oEw?=
 =?us-ascii?Q?vDyiEcbC9cIHgjBq55BUWV3qS2Wpdcs08FyGhzfd/B8PA7MWEbt5ERkOyv8F?=
 =?us-ascii?Q?LZHYY65mV0fBjc2FqLYmhQVtDBLEhQcccnj4SJfhLLKhROZoOzWhNHTJWYP/?=
 =?us-ascii?Q?TISco7owqG/NHy6XkguupVpZNT93wO6TjqQe4rwZ3kCkLPKPW4/eUrDR8HNI?=
 =?us-ascii?Q?HSNlnqHRSl/vADoKGqvurn2Bf5dogOZBWtxLZZ8AEokNdXKsnnQNzA8PMTA/?=
 =?us-ascii?Q?Pr+5N8/GS3NAu4LwzIaZlzEhz/R85I5xHelsRacPqYIFRrz2LfJBjK5lQQSq?=
 =?us-ascii?Q?pl4dXwzTE3bnfXKVrp5lfmmGRta9v3QA/QFAVIpt3ZNtL4MRtTVeqFm+Lz8Z?=
 =?us-ascii?Q?bSG2iKLHjLIeRPdIvy10DorLsh052EBrZYBfA5u2YSy1IYFWbyVE2vPrKfdE?=
 =?us-ascii?Q?95HYmcakiq6HfpUM4LBEWpwIBsf4O3+Kj0w1zrpHFMTeG9hxMAXVbrQDyeSC?=
 =?us-ascii?Q?0fvYCuJ6WbrPZYuA6bNpa9CmnGsaWQ8RlmQYE1PSaJikTChhOq3iedZnv3Yp?=
 =?us-ascii?Q?V5EmSSzVAGTZARpAv2cjCQqL4VtyLHcKyUsFpeOIaNkIKtNfSh33MaTTm/l/?=
 =?us-ascii?Q?Z/9o2GGLVPmV8If9XUN2IvSnyaDrLa73rmVimx3YWrf8+iunFootEO4HJmeD?=
 =?us-ascii?Q?AidrpYF4WdSLZiNkurd4M7Mia2FrKLIkULk/8gR0sFSuSKzqmhRzzpO4sS1H?=
 =?us-ascii?Q?jnvm3JDA1g0pm3Gik3o+pSWZ187SeS39usPFfb8x9JvA0+SUI6RAl3bV4IH2?=
 =?us-ascii?Q?747QbsDyrTMXItFvoWUxGcFxSkj2u9+iVRulNZhWv8w8yy7P+wRoFiM9t4u7?=
 =?us-ascii?Q?f5Xv59p9uBDdgX8DepgUumu9bcUxB+DEO9b+3w1MPFSCHHlXiIwh9/PHMYem?=
 =?us-ascii?Q?W5GRupkRjX9rmPBG7g5L4cp2PC4oSjiXHjE6rHChBxVluQBJaBX+FiPLfAho?=
 =?us-ascii?Q?Na6yHYUKCKNHTlUZUEj548XMW/ecR5f/OiEgl+06TgBFVUX6C/IGAGaY1TpI?=
 =?us-ascii?Q?aKTZXtGCMA9TkppTSBBk+vVK8CfrRIUxbQxhQwPrFE6LOHlcCX2gtDGTWK5Y?=
 =?us-ascii?Q?71Dl3nboJFkIsAYeyRKXpWOdEA1fUnDFwNj8jw3NzBoP9Ap6HAIxaOfZGFLp?=
 =?us-ascii?Q?rIRI3p77Q7NRvs0wMkrefURHOVuz6VgT+g/30xWH7LkK9WbQVnWGS6h+WBlL?=
 =?us-ascii?Q?GSZ2CIHOeec3Zf4YF3mDnA1Gs3RL6NHKcmHDecm5f2Z/DPnxmysYOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB4354.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lvUgyBYqrYJdMvQPqu2phOWNJssDHSpnn5XX+oH0Lov1WG8FGlAWGRJxyQ26?=
 =?us-ascii?Q?bVZKIGP3V5iZ9ur7MHgjYkbIKBsw/rK07vq0GDAE4b0/26SkFeBETdLAXpOB?=
 =?us-ascii?Q?JO01v3hTiNMYeQpiIfqSPV234XTasvj1EcfROWndF41Kvbp30PecsFVJ7YM4?=
 =?us-ascii?Q?dc76F6kxQPdR2IBg8kvLXp4WNRovlD1IXe+kDtklcbd3ShsJ7Kc/05zEyPWH?=
 =?us-ascii?Q?WX1UbtR/44LtSYKh3I1bg7gOEeuFRwutocMcsDJpGF0FpTh/UmJRG+/EmYLr?=
 =?us-ascii?Q?4erra2tOkq9Q+eyqlaLAGNw8J6A1AUMIfKngHueVy/Amjyj27aeVldkXO+np?=
 =?us-ascii?Q?5JKp4akWBnmWP6hkrb5MGtFmNGfIauUVIQv/xtZ+SBOQxUXma1TkynRep2BR?=
 =?us-ascii?Q?kK54+oNqHpQG4DztJ9vIjONcBeyb5GZERllUue1XFhdkcQIUrU+3NN3QpH9a?=
 =?us-ascii?Q?aAFEnvZS5V2KvmpyJX9+e8EXnbZTLDOtnR+U/3f1majC2T8QvLduw8gjYH0z?=
 =?us-ascii?Q?I86CNDViEihN81CFfpJ/X4SytKYpIX2K18Y5JaM34rzT7Bi/IrGczBJccA8N?=
 =?us-ascii?Q?lQXNKsXr+OULI7rLGVOpovQtLvPM+8n+dEy1bkvEHeBGGYNS6Bmo7j6mMYPr?=
 =?us-ascii?Q?oAl/UV0NSp0gmJdbRu4tjTIHrXEJLMmPKPco8+J2Czme0XIab4nPmnq2S2cO?=
 =?us-ascii?Q?ddVE2zUm6un15oOMlspHAH4kk5XgHnlh8CG/xdvZR1zFoRfr8IcZznRy2u7a?=
 =?us-ascii?Q?OPe7v//7X/0jfTGE7xBFc1G0gM4Pq+rH9pfCiLElpAbZSYvdGQst91T2vyzZ?=
 =?us-ascii?Q?XjXhUBsLJMHyAQ8aCaw5c6jEPR6qKub5wTU/T9dAEohPAj0kezMI4+MA3ttb?=
 =?us-ascii?Q?RaUd0RR3i7hVgA0yagUTTN/L+CBzkmsxGZ8rM78VdpqCQU+ms8/fKY66rU5T?=
 =?us-ascii?Q?/+ZoxHC7OLnFRriNPId7N3uRjX2cAFyFM1IHrMfLjOQHfXWTMUtiJMg0EqbI?=
 =?us-ascii?Q?mXyAxhOd8gEuyjNsdXef4HFJkE1NEwCTY37zRfuXSnJO5PZxQE2hMd06NtVd?=
 =?us-ascii?Q?1ouM+MJXF4RpWnDGH8BfrSOoO3QB061L+5CUh8uOFLzaHWWPj4WfOyt8p0d5?=
 =?us-ascii?Q?Slee6kB6T+Cm8y1mX0Dgt6zJvllHDm34WfAqHSBvxlnnV7rA2psUPVvnTMCv?=
 =?us-ascii?Q?8UfsXtLzei3vPpynxcQ2KuIWuuZOSw+UNqyNN63sU3cVRl81BeNhjgaxfpGj?=
 =?us-ascii?Q?OKEiZzMmcVUNT0OTebn13nRLCIUIa95jNh9uR9qaQQs3HPYwLjwbW3UQ8WOt?=
 =?us-ascii?Q?gFU0eCLaQRZI9m7FzWXhPSjdqLEla/Vkkp2QiRO3C2wyusA58NNK48Rp4gyI?=
 =?us-ascii?Q?mgZmqPL3wTyvtSUPjc5ozEc/nEnOX8d9GRMWoAXQjg3IOxMumgPIx4pSQwCP?=
 =?us-ascii?Q?dVQoZGfOPkc1dDJJZ8i3WjsBcoHiI2DQ9SbLMFVDVekguMDrqzLbc5d8EksD?=
 =?us-ascii?Q?Eohqz15TxPgF+Fx2P9GH590J4bo3dNVOHP+Q4Fpx/7wnGdLKw9R7vU5gPhWQ?=
 =?us-ascii?Q?1PE8rBEVTMMa+D893El4sCPJrT0U7x9eudJOIIq3?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de9380a-b0e6-4b79-0fbb-08dd34040492
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB4354.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:56:41.9766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHKtdmawyolZXANufpfoJ/zAyqGQa3GCR3cY3o80Hoc+CGN8HUmZK/AdvzN3lSqPXE2vjXikQIPEfF2mRWIFqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR22MB3716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_105650_652849_01DFF23D 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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

Enable the BANG BANG Thermal Governor to manage the GPIO Fan using
hysteresis on the PHYTEC phyBOARD-Lyra AM625.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..3fd04c689269 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -690,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_THERMAL_GOV_BANG_BANG=y
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
-- 
2.25.1


