Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9CBC53200
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wL/s0PqroA/mh+FLhnznJQUnovIq6DaTyC8quI8H2U=; b=XJg7Ds87fzZMu0HIZrFAEiOErh
	F6kXDrs0URfOkPFJjz/Ff/L/8W85f6ut4DeKXc/b+hJvDtIrH8WICQGBy+eGuMaMC3fhjaOAcbc+q
	sD8K8tC0LjJOINojOhWk3zzDsFjbpEn9576H5UqvrgmH+wriMpP2FPVPuSSoISWHbyV7rQeCb+BF5
	CzxBtB5UHtqvhU5yx7shQ7vRN62TTjgoHdvCe4IAe/HT1ZzewnPU7Xb1aJVXQVuljZnkn37OqvJub
	5ce4XOSmi3ZW6UgoMf1Y2hQeYCFOEwkQcvZM9cbmcC5J7xa4vO0IV+/VbgeWncbcPnDvNN0hWfv+z
	peWOtn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffw-00000000YcB-1CUb;
	Sat, 25 Jul 2026 16:56:36 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffp-00000000YUc-0pUT;
	Sat, 25 Jul 2026 16:56:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRVDIegSmOctvnWLN2xunT+ctWhWt4L3JtUKTZTGCqdJPb6MjE277HPX6ku6uQlT2cu9fDmrjWr0uigpvUzKabr9riH/R21oE+u872lb2hc055uqF7jVjPwsQ+DpIzAaFw0WINyBMrPCiLV7JIwapLriJcu9/rjnkUdyLSa5XwDbF/lra+CDPPAvVGjW3yaX73Lx8jrgfSZrwmKAsevqdK4Cnv6ilTDGRyFsnmcVeP36WGnomINMBgQQveGBnASH2WeZruhau2DKLKZrAfX3UnbcBASWor/4OI3CLiwf4ArjA4OKeZ2wQpPHW4Tfw9db6yJxcqwU07H3iZp9yBAs8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wL/s0PqroA/mh+FLhnznJQUnovIq6DaTyC8quI8H2U=;
 b=cr0NNC54hASg8sCkbPcqnJrQwYRjNtq5mZXIBpr38TAAh58f4cojecfgpY1HsJDTyvrYdj/rkIcNrBBmaYoRao/MEa3LfXFWg8ogHu0Ay2nePc5aTK+sAmVF5bytFYOHI4BeddGna7llJLJ52O9Oegb/lKbhnAqjyw8aOyYbKTFWKCIdx33m2IDtIulSK3IgETkPbgzmSJCJ8v+txBQOM5aNmha4XkASqCxBGyPscnd6qgkFtBDJH58SlaaUT02E7HmOfoWlE6VOgccPdvk7W62yrolf/Sb43YUbKuCu9D/FMxq5LSGl5yHo7S6v5ftbx6GUKH/iZCsw9cyC+sehhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wL/s0PqroA/mh+FLhnznJQUnovIq6DaTyC8quI8H2U=;
 b=XTeOhWCEtrW1r34aTc4bWxJ2g7sKAPXVQMSf3u99huVuitSJU4B+hfI3wlQYB/bkQLoZfcIjLNwgTQip9nJv56mE17rgoZTytkxiO/i9hN0u4ekEJvwR/B6F7OedC9m3OHrAfGvhyBujG7QbTH4C64p8G/L5clocamVtAWej29U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10789.eurprd08.prod.outlook.com
 (2603:10a6:150:163::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 16:56:17 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 16:56:17 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Sat, 25 Jul 2026 18:56:03 +0200
Subject: [PATCH v4 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix
 rk1808 hsfreq table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-feature-mipi-csi-dphy-4k60-v4-1-5b2c4626d31e@wolfvision.net>
References: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
In-Reply-To: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784998575; l=1273;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=KF0oiI4oxdIWN/TkQPG56etALROg7OD/PX22wCepH60=;
 b=6hLQQK+XYutZA1giSV2n4BfUuQZsWR+d6pcW8p8Mrcz1jAHx3H290bJdgeD4d/QsOlDnKXnVg
 Tf2tNgYZHVQBP3gt8/Er2yrafFVrFGWCNb4F84IS2GTgyyyUq+cxUlS
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV1PR08MB10789:EE_
X-MS-Office365-Filtering-Correlation-Id: f275ea1c-d7a9-43cf-ef0a-08deea6da4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|23010399003|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SIB9AhhCZhKYbDJoezW5LdfQVu0orHxyYMUyW5LnWGLdm2v/8pQYTM5Oi/FohPEpH4sv+4iKtwuCuRiwipmd2H4q6/ZrqRnGA8BWo4T3B6erbYnPtrs/TbXYZVcsoeEB3uWNgG4jvMcFgOTtpY40CCpVgiv7Rtn92F1fUsrl+Mk9yFt9SMUL18hGncigRvux+GSURJ5OM/b7SZR+hQldeyDSq4NDMoWFzHJ94hfQTgsVPQhn67EHwtH8/m0FOzA1mOpMsKM6TMY1wgc/SyGkrBtWlSdwxZTt5t5SQ98W1U6GB/sTcdYEN4RlyWXgZmMKWASZpyZqh6hA+yXId0Zwn9dcZvgWCOLYsjQ27uSJF9//BWz063i40006wUKqtZRgvSUwIkQm9Lyi/WQkh3wkpLTMlOfZ3VDYqKwl8KU+/OnqSSETQU62VFFt/Z+HPbAEKz87kMTnnlHhVO1gktuYaYeIOJQ24fExrU28Yclv5uldZwN+pjISmp/e01Vaf11ghlZLjI2INe4wNZ6cccr0jm+IvpTV4W/JPi5QPspuVP0+bTNdXwk32EXUlX3Z4+1kCyzoyuwbtIcSQVMoqe0ejA7lW85g+tskaYddv4T/8Q1GC7BjkhPbtXkYiVFTNTnafrzIlUz6p0xIKYMIfITOePlRDfsKaKzCQj3D3ippa+m7INgZScM8OeCltLJSFg6Sr2R+lCe7XsqccmAADKLphQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG1XVU9FL1ZJYWl0NGF6L05vdVBGemNBRkt1dkhqb0oreHdhNHFuRDJ6eGZ4?=
 =?utf-8?B?VytJTGxZVzR4UnFtaTBtR3BhZENTc0d0YllIUHVLbVVpQzB6QU4xSGs5d3NP?=
 =?utf-8?B?SGg0NzNHQlFHaXVnZGVwWW1MeWI0WnlxTVhNcFBLcENxa1poTVZBRHRDYUo5?=
 =?utf-8?B?ZSs0K3JJNU1qaURMK1RveVVMTmVicjUwK2RhcEVVc0MxRGxmMjRsa1c4SnZo?=
 =?utf-8?B?UDJwdTJ2cnd1RDlTQzNsYjBBU1lXUFdYTndhbFBQMVFqelNxdGdFazN5S2Iw?=
 =?utf-8?B?YVZTdkw4bG42ZnhjMVQyMlJYelJTT3g4M2ExYkpDaXhPMGFLQk5lcEJKMUJS?=
 =?utf-8?B?eTR6bUMyNjlHVlEyRzIvbVQrcURxMi9XdnUvbHprZHl1bExsZFRGMTZ2RzZ4?=
 =?utf-8?B?c1BySU9VUk1oMmM2MzlkWE5vSG5iYXZFbU54TnE3UWlYVHVVMmtYTHFCVXF5?=
 =?utf-8?B?M3RXZHJRRWhNTFNLOGR1MmxiSFhidExiWGpZNEltRnVDTDlsTEszSmswVDRZ?=
 =?utf-8?B?TW9zeHlIZG5RNkxlU1ZUNjdJOTk3N3ZaNE9CdHcxME5XNGQyT1hvTC9lak1L?=
 =?utf-8?B?WUZBOG5KcWVOU3lwY05qNi9qdklZdmI0ckh2VEVVangyVnBlNDA1djBwekNL?=
 =?utf-8?B?eitMQS9KK01YQ2xSeGtQczk4M2NoWTFXb3hoM2pLbG43UnZVNXQ5NVBobUNx?=
 =?utf-8?B?WGVQa2QwT1UvR3VudnNvN203WVlqWGFzYzNieW1Db1c4YjRlQWl6T1oySWk2?=
 =?utf-8?B?UmhaMW8xT0s5eVl3c3Vyc1BuRUU3YnlPQXZYV1ozdHEvNVdYbS9EYndQSi9E?=
 =?utf-8?B?QkF3OVNvaHR2T1MxblBmT1FmRHNNQWYrYzdrZ1BocE9OM29la2ZJVnhPWmV4?=
 =?utf-8?B?cUJDSFEyNkRWNzdOdkt4TmJuMnZRK1YxVWxNL3FyZGVOTmQvaHo0TS9kR3Zt?=
 =?utf-8?B?MUtqZzBZdEs3YTN6eVJCYnlTNzlQanpITlZzQVJCZlF3dmJIdnlHcEZlTWl2?=
 =?utf-8?B?Umh0cnBzZi9qQ1ViaW5leHA1bXArd2V3Q3BYRnE0TFJ0TVpYV3BTcU5RaE9p?=
 =?utf-8?B?ZnltdSthZ2tJeitDbC9SWGo4TXY4MFZXanR0eDhmZUpxT0J0dkh6RmVqdVVm?=
 =?utf-8?B?TVA2YzRqSG9Id2xEWERqSWJkNHZIdmZxMTF4bzJOc2x3eWhRZ0s2YUlhdFZN?=
 =?utf-8?B?dlFnWUFsQmJrZ3J0NVZBOTdCRGFyUTAwZHp0WjJmYWJINXIreWFWakZ1aHRw?=
 =?utf-8?B?NVMreWxBSmtHSFgvWnRULyt1SkRkQVAvdkFWb2VFSUpOaGZ0VDBIUmlLUkRW?=
 =?utf-8?B?SCtCR1dJLzIrczFMa1h6RkZndDdFZlFMUVRJQWczKzZiaUZJT0dxSzJWcDVD?=
 =?utf-8?B?UkNZbGdZVjcyT3FWQUhiL1RlcjFLWHJkd3E3V2s1ZnEwL3pnMlY0TEJHZWdj?=
 =?utf-8?B?MEMyZE5UdUVaZ3Y1dGtNTUkzY3lsOEhOZTRPcDYzNWM3T2dCSVZCWEl0M25R?=
 =?utf-8?B?bW1JQkVZa1U3NHlvK3I0cVJVWmpEUnhlL1c0MUpSNU05ZlA1ZTI5Z3FuY0Vz?=
 =?utf-8?B?Q1ZhVXBRMDFyZ0QrOFl3VUJzSFJzMHVIa0FuV090OG9zTFhKWGVzUEk2UC9x?=
 =?utf-8?B?NEtCWXhQRm83QlZRR2NCRWdIOTNKeUVjTjRWZG11YlNOUTBUNFI1cHdmSW5q?=
 =?utf-8?B?SW0xZ0FhQ05weFJsdUJZei9Mc1FDdDcrWHVtdVVoQkdmTzAwTUt2U3RYV2xh?=
 =?utf-8?B?VXpVck1zaG1HNXBwTmlaVjA3SExWOWZ6Smlqa2EvRTBaY1lzMlI0T3Rsc2Jx?=
 =?utf-8?B?ZXZ5UjZpOUE0czU2allPeWhaVElLUlJxazNMaHZma1ZvSHJTTmVNdWlXaUhD?=
 =?utf-8?B?VlpnQXBWdUtIZ09LSW1NQ3ZweFlYSnhUSkFzM1U2RDBpM2VZeXNWV3NHZW1L?=
 =?utf-8?B?cnFWMVJCMFhSalM1c2l0VUhWMDNQQlNqVnprZ2xGVzJhOEVUc0VNVTZUTDYv?=
 =?utf-8?B?VVJkOENDWEtjNFljQU0rSU4xYlNrWDhHUGdWalYrOHZkTythSVZWVk1GVzVI?=
 =?utf-8?B?STV3bjhwZGgzZ1RJSlhSZUdYcFl0T1ZodDhvOGtZUTFqazd6dldVT0VGSHRn?=
 =?utf-8?B?SE5xZm8vQ21KU04ySGRwc2pBZFpHRFBVM05wMG5PdmpkTEtmcWl3Ym5YU1dO?=
 =?utf-8?B?cERsdFZjRmtXbXhQL2o2NU9jRjJGV2tTSEtEYjdvTzZRNGIramNNMHdYK1pO?=
 =?utf-8?B?UEpndzk2d2MwWTRWVVA2eGJpc1V3Wnh0YWFGdlliT2VPZXNib1FwMU10T1la?=
 =?utf-8?B?OERiSXNEUUhiZEtzeTluTnJvOEY2NE04UVpFQzR0M292WkNkc0JFaVFBUEgx?=
 =?utf-8?Q?wRwCUAbt8Gui97YA=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f275ea1c-d7a9-43cf-ef0a-08deea6da4d6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 16:56:17.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+/TX7DzPlMYvjXRFaZbGzI0fAq7pDDaAnJlctM+WpGe9Ja8tNfwFKC6xpSN6wHHni+wi5qIdS7Z/CEdj4LNt5S8otMBFJ6SRq0dLowGHRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_095629_247833_1CA4060E 
X-CRM114-Status: UNSURE (   9.81  )
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

The rk1808 hsfreq table capped at 2499 Mbps, preventing a data rate of
exactly 2500 Mbps. Extend the final entry to 2500 Mbps to support this
rate.

This is essential for RK3588 reusing this array and fully supporting
rates up to 2500 Mbps.

Fixes: bd1f775d6027 ("phy/rockchip: add Innosilicon-based CSI dphy")
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5c..5281f8dea0ad3 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -170,7 +170,7 @@ static const struct hsfreq_range rk1808_mipidphy_hsfreq_ranges[] = {
 	{ 299, 0x06}, { 399, 0x08}, { 499, 0x0b}, { 599, 0x0e},
 	{ 699, 0x10}, { 799, 0x12}, { 999, 0x16}, {1199, 0x1e},
 	{1399, 0x23}, {1599, 0x2d}, {1799, 0x32}, {1999, 0x37},
-	{2199, 0x3c}, {2399, 0x41}, {2499, 0x46}
+	{2199, 0x3c}, {2399, 0x41}, {2500, 0x46}
 };
 
 static const struct hsfreq_range rk3326_mipidphy_hsfreq_ranges[] = {

-- 
2.34.1


