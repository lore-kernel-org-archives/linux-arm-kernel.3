Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EA0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 00:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=; b=uXydSzjRtVoDdNyZ2kg3CYacxH
	rolzqH7QWO+oyvUZLnPKbJRNlTtB6IulPvHs3I4XA6Vr8Jh4B1SppcvEx7McViIaASSs+JoKjqW8o
	sBmPUDMmFfGq6vl/hIJKCQ0Hz6Q3nducqpyKNQbRDLyETc+nBcxteAx8NOwSvp9aexNOyj0s7Ve/A
	8hAVO1pldTsB5spxg43yr32lsWrCwG/6FvklC9JSb+TBbd/EpcSpdyEOpGq+YZr/PMr20PgsAVAeT
	Ij7ikI/bj03mFU44pQak9G3UTFUGnBmg5z4nN4El0gnsx9ytkOBuM476v0l8/SUoD8kAWzqZZrID6
	riHSc4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX7xN-00000009scr-0FGZ;
	Thu, 03 Jul 2025 00:37:41 +0000
Received: from mail-dm6nam12on20728.outbound.protection.outlook.com ([2a01:111:f403:2417::728] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX7j4-00000009r8P-3ie2;
	Thu, 03 Jul 2025 00:22:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlEt2GE7LAh9yPpP73v91ap8b/Q1lxfTlVHDDRvWAstQZiqVreKfAEzeGPQikUDggDvCEjqi7ZiJRKpeVp8MU5p7Ynftwpl1nLAyKAxHrZW8lHKH/K/9A7zwHkBuA+Gb9GgNr0amxM3pwt0Xr19b1fr+JyP9QeJ+mcVqIlo03Xy6KWDTHo2uSx0U2qhEv0V/4+ij4Efc1mTalLTgpww/372hZzpuD2Z9GKJD+SaxHJEF2+4355CKnqABFWzDWrGhwaasPtAraJtcLUQHHD92gwMOtCHLQ5PyA8FV+gtExGUkYN6j0YXa0ESkLe9S3f0OuAeWSESZ1LWkvi/BeHdkoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=oJLbg/pKgYw330qSyJ3DKMDlqDo+7OjGtwCIdy6x7/TLMvEQWzKit2aHUMlhNYlFcVY+pHW9Hokb9RoFu39AZpPQcLaj0ncMuBJD9Vd6b0RrEZ6vTEEOSuqP446HBmAdFq6t4OhVZ0QeiJgVvoo4sXS9M2HfY9aNHYUfGsA6SypukMLUiSsXSZir6bQ4WUHaIPJsgLPbWFAPp6OIV38AkXALKkMFm9E9eCBPI3OrzR5C53q0SHH0IiEZyS8BY7x1qeuBrYKx7977sig/QS6BHEvWVLxdIYi31HxK/3L5MNKzEMt4nz37rXg4COvWNj5M+hO+rJw/JwJDqzUbhsdTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=QOd3qg2xiCh09v+dlN3niSX/fXLi3NLWqlUmn6Fdek1Hbp9j7DSI27OpIF/s3mjMULFa+aFYECYnB6GsiJX1kVZhcFKNwEnVIf89eE5MTNx+gNi9L02IffqpYDHgSz203YpfK5D7fmLYCj6GB+cpai3A07kH22a1bRG3Y7HRSFkjdw9RNCgEJfrHJRpmEP0vsSGHSe66pKS2ZqshpJruW26Yo8/UpHTWRevCdAW5Pj+e59GBHLwUaik7bLB5fClEN3XpVSlYE4rsEasyMmWoOsTlXyZz95bHpgktdjptlPg1XHpKEEcOdpN6m31ZQnFDZEn5jvPT32L2ZVhZbgmoKQ==
Received: from MW4PR03CA0095.namprd03.prod.outlook.com (2603:10b6:303:b7::10)
 by PH3PPF0E97770F7.namprd18.prod.outlook.com (2603:10b6:518:1::c85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 3 Jul
 2025 00:22:51 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::4a) by MW4PR03CA0095.outlook.office365.com
 (2603:10b6:303:b7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 00:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:50 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:39 -0700
Subject: [PATCH v5 10/10] MAINTAINERS: Add entry for Axiado
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-10-6ade160ea23b@axiado.com>
References: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
In-Reply-To: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=hshah@axiado.com;
 h=from:subject:message-id; bh=wasBNtUEn7bp/0zcFhO21l4GoYcsVPb4OUeNpfZS2j8=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1TXudClIXLQNEYVAnzitalElPG5IoSbNebV
 4aforCMD8KJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUwAKCRDxWHMRoTLV
 +9/HC/9igs8cjLnZUDuS7hNkp0Qm0FdGQFj2fzDuvB+1nuohdGrFB41htRkdxr4QD87C+8S6Rji
 UQvSIsLWmJNfEoyYbCC40l/Y0CDPof48CuRrnMsTenJv/pKfRuK7/IEdFKDdrTED1lO+qAj8Edh
 Bcaz1KCFkW+NObR+zB27q9qFbDqx9lUyuuBK8JtQ/M3n11HKaCh/Ct184aDQzCtTugMf0WiXF3p
 qY57Lo2ov7deCno59tZG/m+KV44AJixCRi3Y7L9/v1+JIPwiHXzVoFLdTq+NGHsH0xWAqps0nEv
 cWI8TdMoFhkFFf4e3gM9SeeLrvkd50e4eVMfICTaZ4+QJiNBAc28uxvEkkKafhA2RP6TtcNGmpH
 /FX2PHKjYJrwMIB3fq7VAV5tMRT8D0qXfGy14CLHUh7mID0M7oZ9UMNIPoPGljk8yRCM3NVlnVu
 KnICvYMpuQBiSHDPag6NgVoP5t94PV+1QP9t6VpDw9VW0CHyx3eX9Lfvh1Di15CafghLY=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|PH3PPF0E97770F7:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b629574-dfc7-470f-8e3d-08ddb9c7bee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVdWNEVBQ2hQQzJaNEJSSWplSkJFRWVPZVNlRE1VT1prRFNLVzJEUkN1VUNC?=
 =?utf-8?B?QWxob1NxdnRhZ0hrbFE4QjhMcDlIUjh3TjVZK0EwbG91enhDMmdlWGxWMTc0?=
 =?utf-8?B?VWEva0ZwdmRuaDBsS25OUW1vVmR1YmwvWUJMckQyNzc3Wm1vdDhGLzB2YWZU?=
 =?utf-8?B?YU5hL0NnUTNoV3lFQktyamhpMU42T2lNb25qL2poT0dsRC9vOXUvZWdnMWRp?=
 =?utf-8?B?L0t2M3FES29WWGFTVHJMS1JrY0lQb0JITm9mcGZ5aEt3bmtyVVkwWFUvS2dH?=
 =?utf-8?B?MUxlWnptcWh6d0dFQkM2NlFuWk9LOGtGdktadkROc1g1MGZMcGRPVjExRlZo?=
 =?utf-8?B?cllOMXJYdHB3SUk3S0ZPM3BKVzk2RWRWL2J4OTBVT1NtbjcxNy9IS2RlU2hM?=
 =?utf-8?B?SUNDWlFza2N4QUhESTNpazB3RXhTZnNoQUxHZUtlS2ZoS1l6dkhnU25KTGsw?=
 =?utf-8?B?NGE1bjd1UjZWRWUzUmpoNVQ4YlREU0I0SmQ0Z0p3dGFYUlZWNXc4QnoyTXZs?=
 =?utf-8?B?c1NTNDRFbnJ3NEhDUGhSWkZ4TGxJY3RFRXcxY2lHWGY5ZGFMbTZ0UGtTaXlV?=
 =?utf-8?B?Q2Z2bXE5RUhwS2FOK2hYUE9jUE1SZDJJOTRPNHV5aGRpSSs2em01dXJKWkZx?=
 =?utf-8?B?Q0RwVzNGaElybVVtMU1mTHZRaGNNK1BjTHhkbFNMWUlQRU85WnYzZWJKSm5V?=
 =?utf-8?B?MXM3VHRPaHF5RFA5MXlscHljbUJ0RFFJVjQ4TlBJVFFXc0J4V1J3VGZCTm5p?=
 =?utf-8?B?UXAyYTdEUXgyRXo1b0p1ZFRaRktOVzl3ZDZFMW9jQ0NSVHhaU1JuMExEUmlz?=
 =?utf-8?B?ZytvVXNNTjZtc1lYcmdyNXZLWXhyc3JRYjhUam1OZUpQbnJVL3RJQ2JJdEZZ?=
 =?utf-8?B?WWxpdkoxQzFBOS9pT2ZvM3ZDd1puVnBBbFJJWVl5VzM3QkRHdXU4MDcrRkhl?=
 =?utf-8?B?MVNHOERyRzhJdmJibXE3dythNXJYUFJ2czdDOCs0bjVpQ2NqaFFmV0FSQlVx?=
 =?utf-8?B?aUs1U3AxWmtBQ2Y5YVFmdjV6VzlVRFIxdVU3VTZFR1hiaFVJZXNmOS9lVURv?=
 =?utf-8?B?Zm5vYzczVXZzaWhCdUNJWGVkYy9GTVo1dklsRlYrbG1xTjc5dVFQQ2NYNzYx?=
 =?utf-8?B?UTUrL21RMjY0aTBDU1ZCMzFxWTdNancrR3RRUkFaRXhHMGpaTU0yL2hjZml6?=
 =?utf-8?B?b1ZrckJCWGN3dTdzaHlWTUhlZEU5QlBTZkVtMVRvcndIVnV5bXhLTm9VcDhY?=
 =?utf-8?B?dTB6c3hVai9zYXJYTk95M0phazZQWnBXcTNUZS8vWkhoN0pnUHhDbEV1WW51?=
 =?utf-8?B?UTRJUy9HeWhDc0FlQmw0QmIyUysycnJuc1lQWlh0T1Z3emh4UnovOGRwVnNj?=
 =?utf-8?B?UWVsUEk4cmlSVzZuWGNHWkRRRzdwT2tDN085UWQzdGQ1MEJXUXdjK1BicUFx?=
 =?utf-8?B?WWwxN2NsWXl0NW5VVE9oQWJDSm56MjVjdzhlMy9xb2RYTUhvTDVPY1FaMjFD?=
 =?utf-8?B?RW1GTmgzM1BqeDN6WGgxRlozUkJpci9YTWlZU0xUNXdYNkJ0c3E0V1hjNm5B?=
 =?utf-8?B?eUlFb3V1VDZqeHJsemdSV0ViRzRuWWRsdWhKZWswUWwwUUpES2xOL1lVZElt?=
 =?utf-8?B?V1NlaGlrakpzcGZ4T2RYOXQwNnBjUE8vdFRYMzg0cDNlSTlzNExiNlIzQktI?=
 =?utf-8?B?TXVraGxwVnZsTjNTNVhYbmhXNkdyL1dtNHQxMmZaK3dhYUxQN09DV2pUbXhz?=
 =?utf-8?B?UFNQSmVib2NocHhyclVLRFpDc0JFYzE0b1lldi9oY1M4eXFOZG1QODNOb3ZE?=
 =?utf-8?B?K1lqVUJrV1J3VUM3MzJNRi9malBYMzNnTXliemQ4LzBtM2lONGp1UmllTWJu?=
 =?utf-8?B?eVpveUNueFp5Z2VEQVhaemtOeW1mZmhZS2FlSUNtZ2ZJRXJYenpTVnYrREpW?=
 =?utf-8?B?eDdQbDh1cmZybGJDTHRHYlFjRDd1VjNuTE5Va0JGZzlYZk01Y1NDU1F4RVkv?=
 =?utf-8?B?S2lIS0JVRjk0dnBXdjZITXdOVW85UitUMk9IenNZRnNNYUcxaWpWck9VQldB?=
 =?utf-8?B?by9uc0xYNUJ1S2lFRGRsU2RHWmVoUkJHT0NPdz09?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:50.7880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b629574-dfc7-470f-8e3d-08ddb9c7bee3
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0E97770F7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_172254_922246_DED74835 
X-CRM114-Status: UNSURE (   8.38  )
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

Add entry for Axiado maintainer and related files

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..7a04bee308cda1d8079ef61d1c0c68bafa89fa12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2414,6 +2414,14 @@ F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 N:	aspeed
 
+ARM/AXIADO ARCHITECTURE
+M:	Harshit Shah <hshah@axiado.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axiado.yaml
+F:	arch/arm64/boot/dts/axiado/
+N:	axiado
+
 ARM/AXM LSI SOC
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.25.1


