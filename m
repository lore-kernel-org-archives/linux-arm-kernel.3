Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BCACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sOg9yBVnKXtQW1qiQWx896srMKcez1QafqjQ/RaukKM=; b=pDawUSfv4CVIhHWXa9Y7C/R++f
	R8C87R+AwPmR5QFDnwg0MO4RT2YyDJbypyi/JMPmlXnZwqEzJIJQIVClc7qn7jrVosFQCiRMzZN6N
	bINIEcBqif55MMwa3Z9GNEuqKacjbG3FA+LIeyeWhfqJvKeUil9OkziqC3r9MOiyYCLHD1UYd6Ie/
	Y/sYxbFbtbc40gfUOJTbUruH3a1NZR9auYuczi2mDbjFD9egoG64GmaA7tHQOHy5PWmuJ978LAlF3
	gPalmSDLDxMyGy84ZD4qlWrEBCDw7aue+54LRhnjMQ9ow/LYw6MsH/g12LsqRBTEmutg8BOQt7YKk
	Zk/nGjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTH-00000004KY5-3uSP;
	Sat, 23 Aug 2025 08:19:31 +0000
Received: from mail-dm6nam11on20717.outbound.protection.outlook.com ([2a01:111:f403:2415::717] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXEY-00000003MMd-2QTy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:15:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1DKUgas+E9HVKw6uRlMEsqOem98Pv2dqeCfxc4dOCWwRzO9B+/H6pn3jdqX0aG6nuRZ90LwBiFISHTIJWlJsoJTk5o2PxxWSJLDbMwRn3qACLCvXniOzh59Qo2akRUflpd7tDJbHsbB0CTyxz4hlWs2+mvdBTohLhNERdMMIvhWhA4B5xfjj3WBrLjgEoSLQwSTOr5kePFqYne2jerhQ4WdoiWyxnSn3YMWlB1sKCrBjhoEqimoLjPtE0ngdpdssPaG+Gql6VhxJcCxT2i/hVCtc5HhtgF7d6v0780hBT6/9JXQm9w2LCsqy1QXZ+zbHkm9jHNfoz/IyTDimLZAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOg9yBVnKXtQW1qiQWx896srMKcez1QafqjQ/RaukKM=;
 b=iTmeHrFNkYhLW9hYY/SvHEy6JsiZMzNFPiDgfCd1vZWxenyZX51w/mf0ilCuQ9nkEACrOSKWFWqprGpWWmFb2ldYBOcyjD33FGiXVxBg99Tx5KJLovwR92ofjOziIRUdaMAqL7a7fkvMoBZRIExKPVoUaGLVyKDJk1kXHN2Qedw8eArtMqlcUzPk+EiSFQ4m/VBUYlZK+IDbQFOsReACDwlfEo1ZvbxnnvqnDniQiFCny2TLJ4tJCBV+HLLa3eaNu9BV0LroKBffxjlIqM7nG1BxgMeUrzTuUeIh+oX+pUnxe/wzWi/RsxiZxRtHcA58kBYdu634cCy7xfkkLKXgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOg9yBVnKXtQW1qiQWx896srMKcez1QafqjQ/RaukKM=;
 b=Po9x6PMny7fZ+zSyaPleyaseBvyZ4qsVFiUIsgDP2ESK2cjiMF3wCRstpmXrVWyRFuJNyWml/UWsE5oO/+BFVgG83JxA6EqYhZAKR/sWKVhFzkx52DVtuInEHecR/Ga8OkGIqm9MZvUu1b+aiz63HW7bSoR1X4p8mAviQbdIst4weK9ZoFyW4kKyu1327SgbAK8Q9Fl5J91cYK1m3IXg5vUFifKFG6HL7BH1gDYIaqLVHTPl7/68iUFtahNemUwqY6IoGnieqJdnWfIZSD34eziJSlRFXJ7S4umOZ+RfO5YD2Xm9CMSrmAx6fY7S+OSogLOgh44ONbU++mUhBYxseg==
Received: from BN8PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:70::28)
 by SA1PR18MB4536.namprd18.prod.outlook.com (2603:10b6:806:1e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 19:15:24 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:70:cafe::f7) by BN8PR04CA0015.outlook.office365.com
 (2603:10b6:408:70::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 19:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Fri, 22 Aug 2025 19:15:22 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Fri, 22 Aug 2025 12:15:10 -0700
Subject: [PATCH v2] arm64: dts: axiado: Add missing UART aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-axiado-ax3000-missing-serial-alias-v2-1-54052d75467b@axiado.com>
X-B4-Tracking: v=1; b=H4sIAL3BqGgC/42Oyw6CMBBFf4V07Zg+JFBX/odhMbYVJgGqLRIM4
 d8tYOLW1eTc5N4zM4sukIvsnM0suJEi+T6BPGTMNNjXDsgmZpLLnJdCAU6E1qejOOfQUYzU17C
 uYAvYEkZQ2pxKrQp+Q83S0CO4O02b5FrtHNzzlVzDL2woDj68t0dGsaZfpxT/OEcBAnJZWF1oo
 xzyy146Gt+xalmWD9LGHS3qAAAA
X-Change-ID: 20250813-axiado-ax3000-missing-serial-alias-39c489370ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=hshah@axiado.com;
 h=from:subject:message-id; bh=FgphQcoG+DlnEqB4jfkdWUB3Ga7nEjUCjRTnSibHBmw=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoqMHJze8NOuKI4fxX1G4hk4mM0teEp4eqAQRmw
 bwGI1bBUYGJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaKjByQAKCRDxWHMRoTLV
 +7YUC/4+xFdGQml/ARkX4JQHa3iIX3v8/xwWfDcs1/jVwFbJXIhxgTbxbLcoPxCG4Sad11YdgML
 ZY05FZkXCBoxHvYQ10py4IkNco1HPgRmnF4BMKhJWmLNprLH02+WjmLNLrXkQgoouz6oTVJuswQ
 taW890qKHvEJf+2sSBpXjZxY714nvbxP20bTmYSo+uZwNsh0q0QD8ucaTaMMiDgooOk7RuDMWDB
 wuK9RR2mhg+Ql5s0SCHturZgXOmpPLrLsWGUvd6SxcvWwdXI1x+1qcPI7XzIW+9ZrM0oZJXul6T
 7yNMBkd4nBkvjjExKHssWG4Inr3G7VKMLszl5mLRh7s80aenjdHuxQO+MBaW42e0nuz3iWagmdz
 xeUb8+cfBdCZPFD6jY8CdcW75JAvp1x3TzeP1m+lMwlqScSsLYmqaGwRqrlEU+HY5C2lCBnwuGV
 q/WZP5Vk7OldHSdrvgC+DjNK1UuKspMMCuTdYofxYyVmPD83hRb53YCh1oWPbH0Et08/Y=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|SA1PR18MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 04668c8b-3d82-4be2-3e1f-08dde1b03e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW1QZmd6ME9oWmpJSVNiVUMvTURMQkVpNno5OHE1N2xNV2d1ZVd1WXNJTWFy?=
 =?utf-8?B?RThJRUpxOEc5RDQxdTM0Yzg2cnlrSFpYWUY3TEc1cFp0L0l0anFhWW9RSnU1?=
 =?utf-8?B?WDVJdndWV25VNjZDMXZYOFlubUx0L2pueXNaNTU5cHVHMlY4OGtUTSs0UWpt?=
 =?utf-8?B?ZktPYlNzdzRBK01YbGFHcStmb25QWWtNQ3BhN1hlc2NmbmtyWTh4bHdEd3Nm?=
 =?utf-8?B?R3AwMGQzS3Zna3hEVjdxTUpQVy9RZzZrTmNvQmNJU3k0aU5xdTZOdnhTT0ZB?=
 =?utf-8?B?RzdjaHlMclNEMXhjdUQyNmpaM0RpZ0p5SDVSYVpmUGI5RXlwYTlxaVEyelpw?=
 =?utf-8?B?eWZSaWFESGdMck5UWENGNDA1UThUMDd5ZjFhYStkSlhBWG82TG1kWVM4RkdU?=
 =?utf-8?B?STlvc0JpTVBXVzdvQjM5Y1pENzFVVXZYNExvVjNXQU9ZeW1mVGtIVzRONUxF?=
 =?utf-8?B?dU5BMTR3WEdxWFpybVlOV3M2SkxWUXVkSyswbHIzVGdpY0VvTU0zd01zWStz?=
 =?utf-8?B?M0xObmtOT2IvMFo2OGFiRjNIVWVVV29mTllOSm1GelJYTFhuUEhSSkVpUSs2?=
 =?utf-8?B?ZnJZUWt1L2d6WG1SZTJ1MWk1bmt2WGNORUxYY0x1N0wzS2ZTenpXeDhtWEYv?=
 =?utf-8?B?OFpBM2YvNWc0aytWbnJIWUx3S2RaVXRodzUxSXlRb2FZWW1CMllsT29HcDlE?=
 =?utf-8?B?bE1hNGMweC8yTUluSFE0Nnl5bHlibHJsWnU0akY1NHFzZmF6MzRwSW1jNGRS?=
 =?utf-8?B?a2xVeWJNSStzUFI5cTZTb0JKcVcwK1hLanVGS3ZGR3dRTW45SUpiWVV2YUdI?=
 =?utf-8?B?M2Jock1BMHpHOHBHM25HaTNjSWk5a3ZTcWRMYmd3ZnZzSDFyU3hNc0krejRG?=
 =?utf-8?B?a0Z3T2pKeXJKNmVuMkZXdS9Ha0FhRW1GdmxmT3ZZOFBZWXF0bVZKb0MzdGYw?=
 =?utf-8?B?QXVCdzBFRnZVbHd1NG5qV09tRG0vZjdYMC9PbjVJSjVXekdMTzRnOVUvYStQ?=
 =?utf-8?B?TUthSHQwRUJRVW9Obkh2MmRva3Z3U1J4TVhuVXN2alh0RmlFZDBoQU9wVjlH?=
 =?utf-8?B?SFp6Mi9wTEx2d01pdTBNMUlPMWoxSUdjdkg1RHRteXBGck9rSzNpaDZSMFpx?=
 =?utf-8?B?SkF1clVsbC9xc1F2b0FyNVVjQXRCdGlNSiswNGgwZ2pjZXY0Ti8rMGhYdlp6?=
 =?utf-8?B?NjNydThma3hERVErZ0VnTEkrcHgwVXI2Y2JXbUxRWHRjNDQxQkhoR0EvZnR0?=
 =?utf-8?B?L0tjOGJNbmdXMEdyTFZKQUdvZklyVnB4Q1ZqN3FoWmZvU01kdEN2Y2U2WjNn?=
 =?utf-8?B?d1NDZ2VLRENPSGZkSVhyT0NFSzVsTzlqVi9VZCsrMVBvQm9MZ3ZXdlErdGVP?=
 =?utf-8?B?OUxHeCtZWGpEd3VzUTZHc0J1NkZ1a2xIMGNZZWZwaGEwM1RHeHdCUFRLb2RI?=
 =?utf-8?B?VjB5NnFMK2ltL1h1SU54b3FTNWMwSW82cHc4M21jeFA1d0lDbUNzc3NtSkdy?=
 =?utf-8?B?cEloem9RWUtOb0lWU1hxKzVrOHpsbWNMTkgxNndKME1CS2Qya0dFL01ZYWtl?=
 =?utf-8?B?VVVBNFAxdmI0SlhzdWEraHdiZVZpbEtJOEdQK1FlY1BOcDdjOWlRSCsyb3h6?=
 =?utf-8?B?Mk5IaHRBSmxyNTZVNTFrR01KTDhNTWdiUVE1cUlNUFphSVhISHpnZHpUUWs1?=
 =?utf-8?B?aEJnWE5yRW02QU1xS3lOY2J2dmdKa3RxbFJ5Y0loay9BOVMwV1VWWlVSS1lz?=
 =?utf-8?B?MXZDUUd5M0Z4OStudmhIdXhjaWNmK0hiamdxekFjL1dBMmV3U0RyN1UwV2pD?=
 =?utf-8?B?S25wem4ybjRTY2NRRXUreXB4aW5YZEFvbUU0YnZqb21PbTI0ZjZsZ3p6aElI?=
 =?utf-8?B?UERzZHVueUFOUDh5dVFURU9FOWdSbGQ0bkpSUCtQYTh1d0duR3hjNVRIMjVO?=
 =?utf-8?B?eE9TeEliVlZqWWZlM2dIV1REWVZERjQxMVdtQVh4MEMxdGduMWJGZWMvbjcr?=
 =?utf-8?B?WUhoM3RJWWhOQlR5V1owbFptU0gzRlQ3NmNoYVFYSUxady9DSzRZanFuLzNG?=
 =?utf-8?Q?H3glh+?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 19:15:22.3124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04668c8b-3d82-4be2-3e1f-08dde1b03e38
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4536
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_121530_622637_80B1DB56 
X-CRM114-Status: GOOD (  10.06  )
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

Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
Axiado AX3000 EVK has total of 4 UART ports. Add missing alias for uart0,
uart1, uart2.

This fixes the probe failures on the remaining UARTs.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
Changes in v2:
- Add missing "Fixes:" tag in commit msg
- Link to v1: https://lore.kernel.org/r/20250821-axiado-ax3000-missing-serial-alias-v1-1-527d979c3ea0@axiado.com
---
 arch/arm64/boot/dts/axiado/ax3000-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
index 92101c5b534bfac8b463adaa1c4f0d4367d01e21..b86e969625573bf92bdd5e4435ea571dd7500de2 100644
--- a/arch/arm64/boot/dts/axiado/ax3000-evk.dts
+++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
@@ -14,6 +14,9 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 		serial3 = &uart3;
 	};
 

---
base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
change-id: 20250813-axiado-ax3000-missing-serial-alias-39c489370ba9

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


