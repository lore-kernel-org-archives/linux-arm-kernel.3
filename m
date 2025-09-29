Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16F2CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uX+Rs2GpwX4p7YWz3dNrHF8TA3yFyKelo6x88KoABqw=; b=aCvY/7y1nkimKsKW6ei+T/QozX
	dlqei0ErZsAARrhRhzmTCjtoGRC1bn+f6j/D6HUUC7EarJQTKwGhXJTqC0PyWeNAo3Kuhd61LDlD5
	KZBZAtvmBYUg2P2fnVCBMP+MTJod388BhcD8L+Va6LPSwxnaoU3vW0mfDOo9dk87h4FDqKL90MjYY
	g0sQLQmNGVpChanRipu81/mEE1/f5/LRENAhHtsgqySNPIgDniCXMWzFS0GC6IEHI7iyN0XYyQIAh
	rG8KNh/Gnpl7iP5tmQ6yOGvLWE1w7BLz7KhcO9f/ejRe2OfHN/WsTQFvkMJHbBD+EHXzHB065CJD1
	PoaTh0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39in-00000001r5T-19zI;
	Mon, 29 Sep 2025 08:59:01 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39ig-00000001r10-1SIO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 08:58:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GF1LTo0yIKkHf6Bo1HGRep4vTCQmXl7juxwvTNgI4NbKbb7FkPZ/xEk6I3NOC78OMB/bSfncofRudkBYvVSwgLAaN/sJopom5Q8KfmMuBJtWY4seSDMd2MFyHA2MGdftJGSjwfRYgENe3j8IjWsA6VIRipH/stL16xCow1EdK8rphOr3TQcWhcp5aMaMu9afOdSMgt0NMteQyRihjZakcxNV3ANCbgz36HaOr//UAr/PJsEANndL1HDcXEy3gJycU1GSQpXXSVVcbf1R6w+Djy/wQdoAQ14M+8HjAnLsDZBEf8OkCUcxVbXlVIgx0pjMGV5zPehyJK8wvioFCgkjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uX+Rs2GpwX4p7YWz3dNrHF8TA3yFyKelo6x88KoABqw=;
 b=j/oG0bCv/cnq/pOZQ4A0DnoAShCMBWitf5Wgly4xSpyAvm0yggP6uRmDDDet4cpP/dDSE6hjGYjCDbp2Np200P/gT+CfGbwGr1TGARYh6CEi2OvSAZ9uhEOGalvXHzgj38KN7R/Jzz6JrK0qUIg8aPuAoSUbObHCZyja3JKuj+Vqga2aN/Kh73cUid+esdlA5OmSSW+R5tSyYOd/MpdzU+iVeEbI5qZs8ZvKOv/EDCPYGLJDqEOq351/wEkK3uIgp5Rh8+y4igpqAPH0AOyAqk5KxuveA21Kc83V0UugKQ3yX3qtBm3B1E7M/wywjnKIYYQr67le4pAhUktzIYVzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=axiado.com; dmarc=none action=none header.from=axiado.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uX+Rs2GpwX4p7YWz3dNrHF8TA3yFyKelo6x88KoABqw=;
 b=f7Q7keyZnayh8fNKbrkZh5pF0j9MTzmxylSM8rj3k98g7L/pFSZ3GnEMd6HjKbFAj/lGDxnSu4guRbhIgkjXpuXYduMWfVlaPii/U/8C0BqkUqDNO8lSceFQXuHP/4aMnEewY5IpT5P7/tsBaGCr5hl5jqWfTzlnanSl0hcyaeSgNumYDrFJoPQGo4fRkcn1XblwVtn17cBgcFerbrdgH/+mUa/SS++Ji2wBIPoHQA0humIQTNa5TTNj3fMPClLIi8ajR5VCedzI13QSBcObq9SZBizeCdJqa14YU/uZ58uVsnoGNvXz0H542x020134gxkkS76UEKEeFrYBWy6Pdw==
Received: from BYAPR07CA0108.namprd07.prod.outlook.com (2603:10b6:a03:12b::49)
 by DM6PR18MB3588.namprd18.prod.outlook.com (2603:10b6:5:2a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 08:58:35 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::2e) by BYAPR07CA0108.outlook.office365.com
 (2603:10b6:a03:12b::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Mon,
 29 Sep 2025 08:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=vm-swbuild15.axiadord;
Received: from vm-swbuild15.axiadord (50.233.182.194) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Mon, 29 Sep 2025 08:58:35 +0000
From: Vladimir Moravcevic <vmoravcevic@axiado.com>
Date: Mon, 29 Sep 2025 01:58:03 -0700
Subject: [PATCH v2 3/3] MAINTAINERS: Add entries for the Axiado SPI DB
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-3-b0c089c3ba81@axiado.com>
References: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-0-b0c089c3ba81@axiado.com>
In-Reply-To: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-0-b0c089c3ba81@axiado.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, 
 Axiado Reviewers <linux-maintainer@axiado.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir Moravcevic <vmoravcevic@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759136313; l=1038;
 i=vmoravcevic@axiado.com; s=20250904; h=from:subject:message-id;
 bh=C7nnMnsyXlhPIhICq87VESYreB884vyiukeXP9i7ARY=;
 b=icejvxRouaytdxpijmKVRg7yr0FclRQlpsrUfOD3nutH6C1AxUiCwk54g8jXAfQCz3/uTIjha
 YpzyiCmx01SCN8MlUhyFBkGP0biihaaB/OYUPfaw5Jk90N1Z2YAhw/6
X-Developer-Key: i=vmoravcevic@axiado.com; a=ed25519;
 pk=iiyhWhM1F4HlCbbW3I3qKZhPCE8JsCrDQMgCBRg4YMA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DM6PR18MB3588:EE_
X-MS-Office365-Filtering-Correlation-Id: e30ca6d0-ea5f-4d87-ba2b-08ddff365f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZCtxQUF3L1JQZ1psbWc1dTF4aTdoUXNXaTBENkF4cy9kYWEvb0xWTmJpWXNL?=
 =?utf-8?B?S2NneHFYWi9lWWtGQ2FPem9LdGNxMlUrVlovYVFOT3k1NW5ZRzFRQXNkZWUz?=
 =?utf-8?B?UGsvQkpwdmtvV05pRlJPSlFPSXlvZHVmN1Ezb2tDSVl4Z1Izd21TWXltT1JO?=
 =?utf-8?B?c0N5MTV0UHl5ZVl6MkY5TktuVWg1MUdHVWFoNzNzTjNmb3g1MGpzKy9wRzdy?=
 =?utf-8?B?RHcwTW96dlJ2YWNrbE9ra05vc2Vma0R4cmVLT0ZJdEJFc0EvREJXcmVUNTJF?=
 =?utf-8?B?bVppcHBJbFZteUlhNDMzSXdFcTJ6RVFqck1xYmx4eTZjc3BKOXdZUEo0NWRM?=
 =?utf-8?B?NVY3eG5ZeUt3S2VNNFJIUUx1ekZWa3E4T0pNUFZaL3BVRVhmSWhiSmk0MTNJ?=
 =?utf-8?B?a1ljcGpxL0daUUtLdFlRZldoeG0xMGxmNy9qZEEwS3VBNDR4ZGl2TjR4cUlk?=
 =?utf-8?B?T1lNdXBjS2p0VEZwcVphU2JwRG1nVHNmTk04WDY5OFZwVGhkU2J2VjBrQkFs?=
 =?utf-8?B?cmdCMDdOMlNUYzdPMEdZQWlHdzRsVVVGdkE1d0NzS2ZIMGFlKzNybVdVbE1m?=
 =?utf-8?B?RXFrUmVRMGYrK0hyeXl6NFRUMlVjeElpNHI0WCtRRzAwYWpVUjdmK0JteHZj?=
 =?utf-8?B?dnIySjF3bHREdUhzQ3owMktJSjV5ZjV6eGNTVVRFQjdkbmxqT2JqTURaTWJl?=
 =?utf-8?B?aS9XNWlwdytJTWE0TWZwbG5ETmQ0WGFiNElBZnRBalBJMzFmQXNxQTFUSFNt?=
 =?utf-8?B?bnRlL2JrU3Z0RC9BQXFmTkNHMW5EQkNuU2ZOY3F6M1ZzeDVkT3dSL3V3M0NL?=
 =?utf-8?B?Zm04NlFWOFJWOHpKb2daMXB2VVFTbFpmRGxwR1U0K3ZuUHhuUTQrdkJJdU50?=
 =?utf-8?B?V2xvZmROeStyVjRCQjAwblpyRnRaQjJkNWluc2Y5WEpBR2hVbFl4NmNMNkNO?=
 =?utf-8?B?a1hkUmU4TE9SemdndmplQlQvUDdJNHg2Tkc1NnlnVE1GUElGRUs2d1pjSVBH?=
 =?utf-8?B?NVFqbEFFQXRSeml2d3V5ajV0bGgwemo1UDhORkNwbEZkeEZNb3VSVks1UTdo?=
 =?utf-8?B?ekhLQzU1cUluS29jNENiTmRjU3ZNaDlmSVptUDFEYjcxWkI5dW5Id2ZXWG44?=
 =?utf-8?B?TVNDcTI1V2N0RDhXVXlKQzNwRVQ3Umw2UkF0aG5pK3ROR0NZTW50enFYNFJV?=
 =?utf-8?B?ang2S3FqSVZBY1FQclM4c0JQdGo2aVBGdzBFNFdzWldWRlBDaHZqMkRYSlVL?=
 =?utf-8?B?a3F6cnR1MHRRdnExZmZNdi9jdzRwL2VRMFRXYUdLT09lWXZvZk55N01yZTA2?=
 =?utf-8?B?S2NqKzFtMENQSnRsTmhadmhXb1pYU1RGSzNnNjJuSVUwaGhTNGtLeE53ZmZl?=
 =?utf-8?B?TXZFMGlkVEZxWUpnMGVLQWw5QTJFbmNCYVBVTC9jOTdGcGZicnAwSWp2TDBD?=
 =?utf-8?B?WHI1U1JRK2FxSlcrVXcwYVVxV0ZsajFjUzJGRWhQdzNjbDFrMmJHOEwxWUlp?=
 =?utf-8?B?dnNuQ2cxRWwxRWZXckVmbXdkeVM4Z1V4RS9QKzdXOUJleUNmVVpISml4b2JG?=
 =?utf-8?B?WjZmS1RIajFuUDU5K005ZVMzWjJPL09TYnVMdjlSWEJBUXRtTkRzcUlIbUlv?=
 =?utf-8?B?RTRtZEF4TjVtUy9pbXpaeXBGcU9QSDJ6UWk2T1FMam13MlZuNGUza2Y0V3hK?=
 =?utf-8?B?WE5IMm95aFVRZTNicE0wbjI2cmNQVTNSVVlmcEpWblRhTUFCNzBOT0E0bkdO?=
 =?utf-8?B?TVJIT2hyMGpSVnBicVpDS2pQbHhHdWkrcU5hbjNYUUU4Qks0eERNVVh5ZlN1?=
 =?utf-8?B?M0UwL2ZRMHM5VnpQVXJLN2RhSzc1UVBIWDdMTWVEVDQxYk14d2QxSFNlZVNk?=
 =?utf-8?B?bEtSTDRZZnptdzZoamxNTDA0SXJqTmJ2Tk5TRzlteWZ0OEZLcUk2Rmtpelo3?=
 =?utf-8?B?Unl5WXBpbCtCYTFBR2VSQmhtQno2OFV5Z1p0NzZGZGJ3b0JYMG80YU4zbXly?=
 =?utf-8?B?alZ3RUx0cjFtTHRpajEzK2dIblhFV05tdXAyUklsMlVGcmwrb3o0elpJUlJj?=
 =?utf-8?B?d20rbkluOVhkOXZkNGhGWVlqM0Y3UmFadXZXRjU3TzNodGZYc25ueDkyS1VU?=
 =?utf-8?Q?jtfs=3D?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:vm-swbuild15.axiadord;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:58:35.3343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e30ca6d0-ea5f-4d87-ba2b-08ddff365f9a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[vm-swbuild15.axiadord]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_015854_397723_349BAAEE 
X-CRM114-Status: UNSURE (   9.46  )
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

Add the MAINTAINERS entries for the Axiado SPI DB controller.

Acked-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..4fa4b99661b37b161e4326526e0c5049cf24691a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4130,6 +4130,16 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
 F:	drivers/pwm/pwm-axi-pwmgen.c
 
+AXIADO SPI DB DRIVER
+M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+R:	Axiado Reviewers <linux-maintainer@axiado.com>
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
+F:	drivers/spi/spi-axiado.c
+F:	drivers/spi/spi-axiado.h
+
 AZ6007 DVB DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org

-- 
2.25.1


