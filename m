Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D0D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBQGka5Y5w07dxk8x3V5p3po6ZGvflQmzypSi4PqoNM=; b=C/YEfwKDkZzfJ15JFUf9ni3sBM
	7DUHO5d+8pTCcn7fX6O8JiSg0rbsT6lllVIUmVKEKBQd0myOMaa5BBlmRXWgwKlYalyBFdrD0hrRk
	7EeWdMqZl0kVG3IesGPe+xsWlVhiisIJANcAHeOaZSUrBqLaE5lwZZYDE8pc/wS6/U3bICLUUJdgH
	sVXvMAlNwgfIGT1WwJAjuMwUnHVo00/q4kX0YM1+ycRoCFHF9+LnKEUsgjLRWeh1xjG+PMy7SytF6
	1OKYD96/nibuFyMvJChi40nkFSNGvw8cN/ld05yWWgQQ3/2rC9NrZ3llIR0S7QCndEU8KRA6aMh/C
	eFcee2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbY8-0000000DSlB-1Ih8;
	Mon, 22 Dec 2025 08:45:52 +0000
Received: from mail-westusazon11022110.outbound.protection.outlook.com ([52.101.43.110] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbY1-0000000DSgJ-2L25;
	Mon, 22 Dec 2025 08:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebX1GN0qMMWDLJ7eGy2lFZuVkYyK7LlwU6iJqmr7WSHKhEeN5AWYcilizZHhB7ejt5ROeU4f5XOroyJhYAOEcAaOr7oJn9S1iXU+ixvQIa4JJQo4PreS9xmrqZ7kFciR48t3VmLy8X6ghCNWka5sisJDEeT3n0HEU2vmp9CSE39m1+L1JAmR1NfgyfkrIw8uBwUsEhGXWHdyvw08qKXDIt4mq4PD7KdI8inebW9/Vuc3w3p6XEb+xb1mJ9cklEJTvkBQXhV00TtbGgJoOaNQSMnRFVgFudrJ84jA7fvmsUAHmbogeeuZ85qVPtZrZSjB2mmklmLXDATtrMsr7nJHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBQGka5Y5w07dxk8x3V5p3po6ZGvflQmzypSi4PqoNM=;
 b=R8F1Dx2tzvqO+eNOoDULVkL+XXBa5CKrF99/OTPr/8JV5VX+QvPbnF9h+OXH1/4u32QPZIfwvg0oBFZMuP3pyEQ18DXUVV4Jzg6hpxPyFOsFbLgtnl2V4lumLL4PwL5AI3PiLBg76+8GC6aCDcoWxK667eYoTeH1PWITc2aVWMrffkjH7U6pi8fMtr8SvGqopmzVkXrK7q8qCrmIiW1ZCJbkV9ao5ybXrnldLStTGivpjzVPuWmUP7YhRYB1d1xZulym2zi6NkHC23G+3QwUKwDKyw3wg52NbyI+ULDDciwxwiA7KBtoabLQ+cT5cT4/hIcWFgmaDq5iF0+fU/qJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBQGka5Y5w07dxk8x3V5p3po6ZGvflQmzypSi4PqoNM=;
 b=ht0xb60YMng5Awj+mZ6myXdYCMK8DSx5v7e3liOttaTRw7ogQ0YpNBKcVjaxzSYh3yHS6J7A7ZrO5gNIrHLKjOciVAI70OMWJ7jpQK9faiII5LkYRsdICzv1pv15Zw5s7WdMcd4sBK1gqZAVUUVPEFXU54SWvAPmyEb+VO+aU0aoPVd79/QIjg4g1t70z98Nq17cMjlxGQM51rJ2zN6zslkMzXAJDSr/CoCB5hi2zubm3j8WOSRTzP+T4W1Tv1Sz7FvrSULsZmq0q0QWUx/yZS3eixOpORaqAfhvH3PiJEKWcHRdVpdnNvH71g6CXNkgF00eK5tqTlHezk3+4YznzA==
Received: from PH8P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::28)
 by BL1PPFB109A61B6.namprd18.prod.outlook.com (2603:10b6:20f:fc04::dbc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 08:45:38 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:345:cafe::df) by PH8P220CA0018.outlook.office365.com
 (2603:10b6:510:345::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 08:45:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Mon, 22 Dec 2025 08:45:36 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Mon, 22 Dec 2025 16:45:02 +0800
Subject: [PATCH 3/8] arm64: dts: axiado: Add eMMC-PHY node support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-3-5457d0ebcdb4@axiado.com>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=twei@axiado.com;
 h=from:subject:message-id; bh=bKDGM0AoPB1Kehw0OKtAw/BafpDWEXp4fnMgv+HJjks=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpSQUno67imnQ591wfP3TLl05j0oADMlABwTz9f
 4ZFmBNiZOCJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaUkFJwAKCRB4EDBdxFrx
 17Q+C/9OZLXGrEmR6nG9HGiF2RY81/V4sXc+Fw+ii16jywl+MCCLzMn0aOHDXbWcpNzjYqFo/ca
 QJdZYfu/IMUvg0VJfpOOFv3pgHfVLebpi8KWcMOtI2G/V4dMLzpMsUMeSt8fnKZBVH0bs5C1oOc
 36gtAf3IPb0i2CW23YaOIMNwnbpoCQH9YU216JwlRUbyr/oE+eF54IWkDz9p5xLeQv4CRDv1FPa
 k/2FrtBetyye2ZiSbygjSd3zbzHNlWLxC5nIR/ilv8fp+iZuLlOqOtQuKKjEPiZU7ImAW37NM5d
 qQZkRvPwzOO5ifSLzGUg98YsB65iz+ascAtHXMAUgxShzJnSZunYP57tmhgpN/RSO1geS0b7qf9
 Mp8ZaqlDqu0z2TFqJrPZlyN3/b1m+vtWiZzsbcD/l0pCog7Y3XKCZxVljFd1KJmA0Fi3MHQpE2f
 QGwoAHGmsBlYxRCdqCMsjSg8DJfrcMq3pzAiNWk5v55D9mIrfDU6zd9TZm6/R5eTLPD2U=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|BL1PPFB109A61B6:EE_
X-MS-Office365-Filtering-Correlation-Id: d620a384-43d4-4db7-f733-08de41367aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|34020700016|1800799024|42112799006|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkdtMW5sb2tzQlF1alMrbzNjNXZkeTFvZm9QbnlmejdhSHlnbmVnVENVZTZG?=
 =?utf-8?B?U21ObzNMK0FjQmZNTTNFb3R0VndkNmpFdE9qSXozV1h5Z1kzL2ROYkdRUUFv?=
 =?utf-8?B?dXdhcXZFSitJcDRXTXJnOWhpWFVXanRMQUk0bXFvNTNKMlpzekdBcW9NaTlr?=
 =?utf-8?B?cytsWE5ud0kyNzFjcEpXbStOcjZzVk1UTGRUUWhjZzFRMDkreWdoUnJDdVdq?=
 =?utf-8?B?T0NQYnB4WFNIZFBhZzJ3NjYvV0R6MUNFc1N2M0IyZlU1dElSbk1CN25wT2Nm?=
 =?utf-8?B?UUdibm5pbjJVVlh4SFpVelI1d053Z3NTZXR2bWwrQ0RKMnVPZExjbHNoaHBt?=
 =?utf-8?B?RHdCZ3VQWmpSVnZrY3dxVkxTZDdMOFNjd0FTamlDVXJDMGVsZHNDRHUyWkRF?=
 =?utf-8?B?SENWcGFrQzRJVFVrbzdSbHUxWVBEcTd3SER4aktuZGJLeHowY0hTKzJ6RTlD?=
 =?utf-8?B?SmZNLzdUMmlrOUFhSk9IaXpZZnpwVUllQjNvOGJabndHaDhFVmplYTMzQldX?=
 =?utf-8?B?RXI0K2pTSEVsQjUzREpRY1VhZnNXMGRnZFVkcnQ0MGc4MHM5QkF2cWN3c1BS?=
 =?utf-8?B?a1NCN3lPYmM1b29HVldOSzQxQ25jdXFsNXZqU1VVMjZteUJXcW0yMGJ0MTFJ?=
 =?utf-8?B?WEJGS1dHeHF0QXo3aVljR21rdXZUaUR0T1pHanlCZ01Zdk1vMkxycG9hTlpz?=
 =?utf-8?B?QXN6bHduMzVuOERBQVdHMjJQZXo0SHdVZW1aaG11Z0ZlOGxMZWRQTlpNdVlS?=
 =?utf-8?B?aVZTWGdnN0txcnJhZWhiWE1DbHVOakVmQlFDZmErT0RheTdSa0pKUkVkamJa?=
 =?utf-8?B?akttVlNnS09RbE1LdGVvYjJCV2prZzlkc0htdUNXaTV0THJ4MGJLQy9BYXBr?=
 =?utf-8?B?OXhxUGFEUVZDSUdZc3BDTkJRLzF0MEJNTURXU1pJRzNxWlJVY1RSamkreW1K?=
 =?utf-8?B?d1lnTDk2UzZmbWt0OTlFNzBXVVF3cFB3WklZSXdDclZpeWJYYjM2NUcwU1lB?=
 =?utf-8?B?RlY4VUJycDR1ZDAwQ0cwK0Nac0s3elJCbUExRFJsOVBOUWpyemd3NUpETEVC?=
 =?utf-8?B?bkxPSFlVM1lnZ011N3dUSEI4YXJpUzJ1K0FQdXNqaGNIbURydWMvc09UcG5G?=
 =?utf-8?B?V0hETk1tdXRKbU1HL250Y3pKY00vVGVKeFhaamdEQnZkQ2tzajY2SlAvajFm?=
 =?utf-8?B?RHM1M2hiU0Z2blh1L250T014eERuRWZldXA5cUtqWWV1L1ZuZG1TLzBkYlor?=
 =?utf-8?B?UVI4dlNUblZBcFBYc2s1RU14N3o3QUFEZXpqcmdnQnpBTHlTUVFOMGQrOHpC?=
 =?utf-8?B?eTFtQ2N1UHdwWCtjbTZ3MWlQUE1hU3l4ZSswN1c2K1duanh5c1pPSnFYV0dt?=
 =?utf-8?B?cEhXTjA4aEo3MzBocGtGTGVmQU1DRE1uVHIycHNlZG1KOFFpZ2t0VUJxcnZ0?=
 =?utf-8?B?UWtidUVoMHp0UWxOaFFyQnVEcklyTHB4T24xSDlOYzhBMEhVUmNya2ZqOElX?=
 =?utf-8?B?cDNOWERDbkxZb0lSV0s2bU1xYkpsbWEzWG13UWZHQkduQmFoV1VmNDdWSGRo?=
 =?utf-8?B?cGFZdjBaZUdzVjJsMDRqNzdmd2RScHRPZXUvV1B2QTRTaHBkUFgvZkd4YnhR?=
 =?utf-8?B?VU5NWG1PTlJuV3MwUWVybTNhVjNkbXF6dTFqcDVCTVpXZm1HRktLUU5XT3Nx?=
 =?utf-8?B?OGFjZm1ob0RQYitJTWNnSlZ1c3hXbmpYWWFZNE04KzRYNjRTYWhsVm1xZnpm?=
 =?utf-8?B?cnVkU3gzd0dNQjJpYlhDNWVSVHdsK0pXdU8wT1NsWTFhZVlBOGVRZmhDTEw3?=
 =?utf-8?B?NDQ5MXdaK3IrUXJ6SDAzdWJVVitMWGI2WUo3MkN4WkI2aFFKTzY4OWptd3hk?=
 =?utf-8?B?ekU2dXZHZEszbkV5T3cyNEViMkFrdldEcHZVV0tXUUtMUjZCNTl4L1drd2o4?=
 =?utf-8?B?WkEyV1hPYXZQVTZDSmlnbFluT3YxSnJpb0dLVC9HemEvdStqdVQycjQzcjRu?=
 =?utf-8?B?b0c1NWRKU0tvak56a1VIU0dLUlU0UFJVUktKVFlrOVlDaVlLRTVtWVVBVXNY?=
 =?utf-8?B?TmUzS1krTzJ1eGViTFJMaVZUeHVra3ZSeWp5OUxWdzNNaWhDRjlXNENrMHI5?=
 =?utf-8?Q?OrCe6PnUht4ZltIrNYqzT4p3l?=
X-Forefront-Antispam-Report: CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(34020700016)(1800799024)(42112799006)(82310400026)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 08:45:36.5906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d620a384-43d4-4db7-f733-08de41367aaf
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFB109A61B6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_004545_622046_08CB36E5 
X-CRM114-Status: UNSURE (   8.33  )
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

From: SriNavmani A <srinavmani@axiado.com>

Add the eMMC PHY device tree node to the AX3000 SoC device tree
include file. This node defines the external Arasan eMMC PHY
configuration required for HS200 mode operation.

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8..0b64cf1245211ab0e9380dc27dae37dd9f3082e8 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -507,6 +507,13 @@ uart3: serial@80520800 {
 			clocks = <&refclk &refclk>;
 			status = "disabled";
 		};
+
+		emmc_phy: emmc-phy@80801C00 {
+			compatible = "axiado,ax3000-emmc-phy";
+			reg = <0x00 0x80801C00 0x00 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.48.1


