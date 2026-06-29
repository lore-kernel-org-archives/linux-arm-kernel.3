Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB98C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=; b=OCtDktOW7qcNG0NroroTlX37oL
	dZQKQQ1kGMWkgSuYtD0ObqcvcuZ+H1sx6/jcN0lvMY3lUC9qOvIqfyOaVw+hbyHNdrEM/vz0jagVv
	ctVNq7u39TfapQ/wg/0Oww1j2e2XvqXtNvFeyjpPGB9Hk9Tg6DjZAZLYhwruocWjymZlr8QZyD/0D
	/PUZ5y2xVbwBfyqifBQmUlaRTrMJIpYB/SelCk9CFIURClC9JhaIxcniq/zggQ+r0pY4ovVkY+Aw3
	5aI4zkR4UQtH7du0oo+qN7cVHi3SkQ/xcNxyILvuCIQO/rWV/W1NokMsxKPgkYK8cC4L7TK/m/sED
	BADCVCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we62a-0000000Dq6Y-32f5;
	Mon, 29 Jun 2026 07:04:24 +0000
Received: from mail-westeuropeazon11013002.outbound.protection.outlook.com ([52.101.72.2] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we62V-0000000Dq3z-1UaP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:04:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqrwaMfyu/6E3OdrYjfZ5UHD5ehIBfRgNaPwS7zPWziaV9+DOXPhNDvhR8BoESznWYkQeq9ciDMGahARmScTtpvMGk0DHS/r1diLt0SBm+CjPt4YldbbN831KyDoZy1cbWhIgCCVw9Z72z9oMwoktoOyuLv4hCbTnhRj91h0kDeNaEyH5pzORLnUUG9oqeCHDfSHZ6324l7sd+c14I8z3YDdKORAEddWsIpaKKyZfIzox900Bj6xOEJF1d5gXR4x6+EXMTaOr3MfHylG6bwyAwsVmksnFHyjtHxG/B4xwosmsCEgOTDa+z2qyOBcBcr7sdn4qBL2zc/R3Ai/u70dCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=VZe2OyMPxNqtpzAvFd/p8jntta3cPlLb6TP0PKOb0HVLopjclMUI37LXX1Jii1RnynpHT1qUACoul0UgKHc0tdfBxTE74AQDKZ8NHQtsE3PARMhTZhaNPj9MmMgHWwg3JB2sdBKjiHFa2W94WiBwSohaIVMGdfauhy8D5Et9DTNvmWPlUWs4t0bUQRUxw8Y9FgnuRTkgMgp8wjjgtGm+WQ6D+4qiXqjeBre2Rc5KC+X67w0wObUi/obNcn2QAmC5IZ+kbeHQaxj7BKjkZzgd8EYQQB02c6q32g6io23xgpvYLILlBLVsD5oVZaeOex54oxxUMMUrAhB5ePb7iTPeig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=DNc560OBhnCIyuP1ouQ6SVKeGhETV2zAufMEgeM9CeiKGcektMJwyc8EtI7lrsIMUHc0ANoETaasxNBpkXaAi27tNXMrwqyAdMI51Xsnpz1dySzlujanzUzZ/ayhpoHj37S/rs1AY2zdrJvF7wFp++jpxivlCFqM7oHfo/45b4WH9JZjLCF9+3mtJx/idsUH/+guyfDvZW0wgq0Xoz42hEhqoJDc96P1dZlv+svEBbHFBE8kntY1ZX6HljS3T/OUpWA4aeD7cQV1ma0mFvu021dgzi3z2hX8DJjyeSwlGtu/wG2d7JERMfQGO7YwIxBGp1kore5u6yA91omENnu74A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:04:15 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0159.013; Mon, 29 Jun 2026
 07:04:15 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 29 Jun 2026 17:51:57 +0530
Subject: [PATCH v26 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-imx-se-if-v26-1-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
In-Reply-To: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782735844; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=IAcIixXhnfNNLyPhwB03kX+A0cbyGynZhuaDibTudH9zN/bkvzK3GwI6w3UvqTAjAhBfKAMEF
 YfkyM8MLQtaCd12kKlW+ncXUfHFkZjruGAwS8+jBCjAoKZ3T9+oWkI/
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 8616b33b-895c-4f26-b465-08ded5aca105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|6133799003|11063799006|22082099003|18002099003|3023799007|56012099006|921020;
X-Microsoft-Antispam-Message-Info: 91oR/dWyvhsCW3wLWY+lGP/JwmTwAgfkgS5G7r4HpahTrmNTlqRB3A6aAcCsJqZ0Sasj9ajsZ/JQ0ifq/wPaNiGbRLTyQdarNiNIIr0FTw4tVOadohAyyxPSqlcginyS9pq79HUapWufjd6H0m3NmbAofr/VcYWg0L4i0vW0061tp8ru0n69CyHmNUx3esltMYIiy/bAstkx5vbLEFg0qn4k/i0lSX4lG2CWyeeuRfVkTu6lek48LlARYiUi3JkJXjxPTlWbvcpCy3flCLhnz8NiKszDEWA7Pwqy66Win4BHSpUPJSgUv7p+9tWBC86fF7tJ/5+lGQjfxKQjZkutTGi9bDqWF9GYXstMaLtt+waWh7V2VOfaRoqh9psMEBZh80LqpcYlDR5+5mC8YIt/sMNrAjobDn+PMNQVmf3oKBAyj3wOad9SqTKGqdxVsuUfxWxNHETlCfurXpLXRYFmSWqz/1+1sjr8LPIYObZsf3trRutyGC1TcLgbMfu1OMNhwRWYzUiAne9RjE22VhuopblJnkkWAsd8IH6YISRB84ksOwofaULV2z4SjH8E00INCrD1v97pdSxkEj84Pl9DDCavOoVKGvLY8h9EFJXT5uDKkLRWlFNn6g3BZ5CYYvUWzDjw4ANfxCCgpDLPXJD5LfRYVmbOeJ5ubDzZJCI973O5PR8LvGlMkjT8PzXdonZIivaCoDIBNTiFGSGksbvlSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(6133799003)(11063799006)(22082099003)(18002099003)(3023799007)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnYxRGljWUFlNlZ0Q1JqVEpRNDdrNGZmZWhNaHQwcFNvVEdFRUNuemV0dVNC?=
 =?utf-8?B?b3AyWUFIUC9heHEyU3NoNGpwMHVLei9OOTlMaldNYi9wVHNFSURsQnEvdUd5?=
 =?utf-8?B?bkQ4RTlkWFB2czNqM2lVcGY1SkU0NXNkbWN6Ynh3bVB5YmczSko2aU82UitV?=
 =?utf-8?B?cFNiejQyVTVIdXpnSGZYdHlNZE5wRG1Md1FRM1Y4ZjlQdW1JenJ4Q09UNHh1?=
 =?utf-8?B?OHpsMU51TSs3QUc1MEVaWnNzMnMvOEdVdElERGptV2h3aXZYOXBCTzVqNmY1?=
 =?utf-8?B?cm1MVDdNZmdoNldaa1RlSzZPckZlaUlzT3dXbkRSS2xlUlg5QXZhSjh5cDhR?=
 =?utf-8?B?ZVFsZnlBZlhmdG9Cc29oNlY0MGgrT0RId0xPcGRzOTI2WXpUdytDNU5JR2px?=
 =?utf-8?B?U2t3OTRWOU53b3ZQU3M0NkRydDNEb0NzWUZsalZuMmp0amtjSUl1eHR4ai83?=
 =?utf-8?B?QnJJclV0NFFhSjlXZE9PU1BvS0hLZTV5MjMzZmV0bnAxQVpsZ2pLUWR0V2pF?=
 =?utf-8?B?enJxVUVPWGtDLzU3SkIxUWZFV284TVFtRWp6SFRna2JXc1YyUEtGTDVGNjVw?=
 =?utf-8?B?R0NYb2htbzcyTU50U1RKQzF1MkZVNVpPZTgxZXJRRzhSYlNscU1lVFROVTls?=
 =?utf-8?B?RWJ6Z1FEVkZlaURFNDAwcEEwak9vcExVSGpZODlkR0QrVzBtZUFoZkFTKzlh?=
 =?utf-8?B?cWdNWGhBTXd1R1hReHB3R21RSlYvcm1kWTFSVVZBa09KeGUyTWxhOWRtVitM?=
 =?utf-8?B?REFYUUk3MXZJeVUrSjhZZkxsSUZlOGs1RlZvUm9oOENvNDVscTIxcStPbk13?=
 =?utf-8?B?dXllbjR4N2Z0bDVWRlFtbnhsemJRVmJtNU1kc0ZlNEVhaG0xdzhvcjQ3bzU4?=
 =?utf-8?B?cjBhUGI0dHZFenErMFUxQnJaRytreVFCRWZmRkdpNmR0ZWlYd3BxM1R6UkJ2?=
 =?utf-8?B?ZWNaVnJxUjRmYVlOMkJqWUhaVnhiQWhCY0NwaERFTytLQ0poNklBd2p6NEpy?=
 =?utf-8?B?VFBrdFoxanBnVXNaT2FGbFFEN3VNa0E1dWJ2dDJ3azluM21yZHU1REhlZHZ6?=
 =?utf-8?B?Wlk2ZjVZR2t0bHhrRzJEQ08yVk9hdHdnNmR5Q1V4a25XWWtaVW1Oa0huQlJt?=
 =?utf-8?B?Q1V1MzhseGtYTC9zWEJSVkhIbTBxOWN2bUIrUGlXNVF0NHZwMUVZVVFUaXZr?=
 =?utf-8?B?Vkx2Vy9FMm9ROENiMytXYnhQeDBxZEpuVkpvTXlkRUIxQ252SGNXM0x2MzFG?=
 =?utf-8?B?OER4TEtlZmdNQmxaTzNZVkM1Ujk0L1dzVFN1U2F2NTVYbkxoQTNVSUUrM0lC?=
 =?utf-8?B?Qm5aUTdJUk9IeGVZZVNwWWhyK1NmMjdiVmRCWU9tSklDS1VSN1gyYXQ1MGFm?=
 =?utf-8?B?ZVI3ZWtCUlpEeDdqQVlOVit2R2Z6NTd6Z2poTHZvZDVBbDJWbkdHM25hcjBS?=
 =?utf-8?B?N2E3T1UwQlhiZDI0ZThPVlhQZFJURkJlQ21UVHdRNGRJeCtMYWNpMGYwMHZy?=
 =?utf-8?B?elYvRXRVMXZ5MEcyUVVPR3ZzNTFZR0xieHk5ZldyM0N2SVhoQy9POFJ5UzAz?=
 =?utf-8?B?d2tlVnNDeC9VUHI3V3hNbWZzaUUxNjZNcVc2ZThoTWxyaFdPSDIyWlRIRGZB?=
 =?utf-8?B?YmtRTEkvRVIvWFZFVXE1WmI2cjJBRk5FZ1pOeVVKalZFS0pZVVBiOWdpT3NW?=
 =?utf-8?B?cnRuNkI2QTdWUEZHTk9YSTVwclFlcGIyMXpEVHdTVWtsc09uRXlueHp4cCtl?=
 =?utf-8?B?L3ZxUldSc2lTQkVadUdlM3lhUlczSTZwNmNPbGRkczZ3QldBZmhOOXk4S05m?=
 =?utf-8?B?SUk4Mll4TTBqeXFFL2NMMnpTTGxwNzI5OHZqK1JIdXZSM2ZlWTFicE5rNTdl?=
 =?utf-8?B?TUlGQUg1RVA4c2ZJUGJqcjNEMmZrYjdKZSs5NE82NkRRZEYwbWdPUEt2MXNj?=
 =?utf-8?B?Q0hITTRoR21UOEhUQ0V6NmdEaHJrYndOcVRoU1gvY3Qwb3preFVjWlVFeWM1?=
 =?utf-8?B?emFRaU9rRmtQQ2ZBOFVscW1sUkVMR1ZHSWczZFFBUFpJTnh4UVFQK1dMZlJ6?=
 =?utf-8?B?VkwvN0NsdXgwS09EbWd6dUkwcXBWMVNyMys5N0FaTnRvNnN1VDdTVFN1cVhP?=
 =?utf-8?B?ZHcrUW5XdG42ZnI3S2VnZjZGMjBNRnYwV0lNNm4zYm0rWWh5NUt5MkhHbUlX?=
 =?utf-8?B?K09FOW5TdDN3eW9rT0tXZWdRTnkvODZncE9FL0Z1enY2ZGVtS2NoV0NoczEv?=
 =?utf-8?B?VzFFZDg1QjNBbEIrUFVIK2lhbWJ0QVZRek9CZm9LRitoWEc3dWQxZDBqcHc4?=
 =?utf-8?B?azNKejN0S2prYVdPL1ZpQU0wOEcrQ3pnNlBZQk5meEg3MTJqdnU0TlpPS1Nl?=
 =?utf-8?Q?YSerkmfTx1FfGR2k/PwjqcPnqVLYxThIBvz1q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8616b33b-895c-4f26-b465-08ded5aca105
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:04:14.9468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/Bnz8HmSh5izFPLjHEmAyYreZwsdHLnA1APWWeH2i8nyKvL/2KpweGfXBtVguzWYeO0BHZPD3aQNy38n7V3yBQMmLyHznc2EAoGaDIs0i1K4CW5I4qx27ukJdzreGwM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000419_555993_AE351934 
X-CRM114-Status: GOOD (  13.86  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0


