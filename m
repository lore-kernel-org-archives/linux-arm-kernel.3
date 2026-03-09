Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A04FCA179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QC9/sSLN5UkKL9tIAayTYN/AUCaa7JCPPvv3/PSxahM=; b=bL9lkHYx5I2BdlLBsQ2FjTypWG
	rii6wWWsLX4JBbX3PCAOOu8Zv71ay3JEXVfxz2qCHlkiGBh6YqHA4iDGGBX0UPmAxEBx5boexD1TI
	+qwfTQXIpn4L2/WB9Bw5jvSCNp1uXng9J3st9hpcwg280iBQavOv/SA0bVAtGVGbWYHYhDzq57RjT
	Kj1VF/DG9EdENCeisckQhKerQwvTTJEKR4z9QWU+jGaJGtq4O9Hf0v9hf35DyL6hRzVpIEhiEmZZe
	Ewv0j9bAhat0SsipvD33NgJVz6IhREx2v1OLqnXMZMWM8E1S7bZhyWNobObWfUSmuOL01Nv5oHFGw
	NDimzyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzg06-00000007zQH-42A7;
	Mon, 09 Mar 2026 19:10:46 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfz8-00000007y7Q-1SJg;
	Mon, 09 Mar 2026 19:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9/HzrCcLP5rRI7F6EO8ts7RtGDaJitMTNbXA5TvLZ7bwq25gVhMeliIuzJSDiiLS+XpljbTLvNOrWJox7TIRWpzcrfaOEnAYB7h3FjdXIrTgod4kEfRj4+BwIF0F3jqAxYE2foRUjE+oFPsqir9rVr33ImxKkhyawr3x4IgvzgoHIW1U5gJhphw48G4ATyRKzIldWurAFwFYP08NiVhFNE/31xB9QRIOW4xPyPbEZGvDngrr7KKIgGTxDRLJxw17IuNmm5rQx1GIAI6D3JtckpoDAioCAjvlr8M+uOdSpy8ygKXY6M6LWuffvfYqTXrZRQ/UskCP3PgLR8Wf34/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QC9/sSLN5UkKL9tIAayTYN/AUCaa7JCPPvv3/PSxahM=;
 b=ojTw65fgKcZXx8edFjzjiYAgIxfcwyWw2j3CVWXKcDmas3laVKY+K30rL0wzZsrS7K/tfArc1QthREnBPECgYl/TjbqGmBN1516HAl2erb5FlB5DzHRKf9TyKd0REkyMtCZOnz0FNMdokg6XyZh1lZI5pDU+Gd5xUpXjpy+Zv7u9+nLJPRKVYEC0hWk2L1I6IS48Re6wijbM65HLn2sRhrvSxVbpwwvX6rl+syPGSLJ9OwHmMt+Ze9J4YyuvcP8UD89Z58euBe+OipWCaC0z0eWk61fFJaH9yVJDARhTOyjLbhiQCnlXkpTwwCf1SGiFvQcC+WSPn2v/NAkRX+AY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QC9/sSLN5UkKL9tIAayTYN/AUCaa7JCPPvv3/PSxahM=;
 b=D3TvpWoizcOm0LqtgKFCalHH/Ksp1ckXOPdtwKBcn7poXdifKun0vP871VUePHdVKeDFAqrE9t3lE+G7/wixgfz6MAUHQsG9Glt5QZnHP1lLF8r3vAShvgdJBPZ/TimaaBDYHP1dCCo6BwrXQ9KXp8LUznjtnqNs2/ljq3j/KhiYFHnQ6OfbJpf+p9+24ePUs1+0d/MYG7h3iPSss9R1RE3NZ0kuwCpsLrphXwk1QJXKl+Xi4vXr5LREP7pJreU0mbTclijZAbgeTY+i1FHcu9k1y2LvtQbN/byZ5slNXCK6+cEA6bFAboSaPkIteZk1HYn+8jKbk05637omqpTlhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB9841.eurprd04.prod.outlook.com (2603:10a6:10:4ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:09:39 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 19:09:39 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 phy-next 15/24] drm/rockchip: dsi: include PHY provider header
Date: Mon,  9 Mar 2026 21:08:33 +0200
Message-ID: <20260309190842.927634-16-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309190842.927634-1-vladimir.oltean@nxp.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0098.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::27) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB9841:EE_
X-MS-Office365-Filtering-Correlation-Id: efd08f86-4f81-4deb-3744-08de7e0f6943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: iYyl80P7aIoRbSIvsYnpwFlEbNFHtEtt7hXYdZM0R8qfo//GJU5W4W70VgdUS8GNm2aw5yqkd48jjMca4chP1XUplxLdz6KmanRVpBBc3JwOGMHxP7OmRMGHuB6RzfOi8dEzLP02IZ7Usfk2pVOU0wI3Do4nb8tw03VyxO6RPNPpljp/xPiYRMrmFNz+HJBFSO7lJ/R0p2Snep9K6L+SAKtGxCkZL66aTM47ydsrureVVZesKAofKF03HFi5pG1MvybUKqbZ8YX8OZgjkc64nC65c47I7uoj0H8wChiIsUVtdav1Tl/+c3HvvXHCf+FwmCbqbzEcGg5wAucxtHz/YX+PIy0dXP+JkUaiMrt8Lbo2zEawFHFEP0F1tXyzARj9+h+RwQGENwgchOaNuHpU/t0TgguHFKyVK1bXkQGQJy6WWE1asD5Tl/dyOt1eVFKTpj+ZkscetkzuIoICPYtZEwAY0XkS2GJ3HV57DMtkTRG4jyNtlXATP3DQvz+F7K+tBZoQBZBJbLkSvOIAqz5clsMn6avcQS65YXNEAl/TyDzLPBnWbDvFGgYZpVloTd3gw/vqPM5awQ3bTbsuVq6CGMpXonN5NvZkJVegZ+ix2/wefPR9bZLhomVkaISK+mT9wZWYE0kQLtMnjglFW8AGKHZ/mY5aMDgzGqfaGN85+rLO3Xulc/X6oU6f+jdLrbTOBDtr7KKzgZSoqkmDvo7yK6mGw0oEj5jjAFMawX2uhho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0pnc0RqRURDa1pic0krOTVpekJUTmo3dUxoODk1U1hNSitaWUlRclBDTmRy?=
 =?utf-8?B?N0xJZlk1ZTh4MnBiU0o4Wkt0elJKei9FUW92bkQwaWxCTTJuaGJUREZVd3Ns?=
 =?utf-8?B?R09OVEFNMk9GTjJIdlYxSWF4aXdCWkZ1MmtoSUR1dktvOEVWSm9paitEUUtl?=
 =?utf-8?B?ZU0vcHFZY2tCT1FUR2tjRDdQeTBJMHI4M1JUSlhhbTJLdGdhSWtZaVVnU1or?=
 =?utf-8?B?V1A0VVMzeDJSRTd2STBsSG1tQk13RUxITUpPSkRIQ3hoMURXeGRYYXVueGFs?=
 =?utf-8?B?ZUFJUzcxMEFIaEgxRy9CblBnaU5oVTVwVzVQcFBFSkdVOW5yY2V1SmVaRTJm?=
 =?utf-8?B?NmlCYnpYZFJMRVlDK1EvRmpUb3hpVmNGOWF0QjFVd3l1dXY5YWFNTER4eUZG?=
 =?utf-8?B?eTVtK2dNSjRnMFRxK2xUTTRpT3h5dnZpdVNLYmJUUjBJZGU3c2ZzVVpPR3Jp?=
 =?utf-8?B?SnpDSmJLVWowWTVOdE4vbW0vUTkyQnh6MEU5T0NEOWNnTGtYSmNweEthMnNH?=
 =?utf-8?B?VHY2SXk5empOSkdhb0w0UWU5dzNtUWUxU2dsS0RPVDVrQ2FYZ2xxdFdtMG9Z?=
 =?utf-8?B?ZFo1WWw1aHE3YzBoTlNnYXJMeTdOckhXTFlFUHl6SXJ1WXZMSFlxVDlWMWM0?=
 =?utf-8?B?OEE0SEpiWEdxUzRNdHg2NUlobGpaRVQyQzRwaEl2aG5mV3ZIbjgyWEdXUzgy?=
 =?utf-8?B?NXNaYUg2WFF5Y0R1NDlibjA2Z2E3bjV5WTVnWGxybkoxTmFJTElVdkoxcTF5?=
 =?utf-8?B?emNVeWNWV3o4ZDdnWWJEbnBDQUZzOEp2VDVLZHA2Z2FwdW50MFI4SElqS3hL?=
 =?utf-8?B?NFVlSWFyM3pRM0xzY2VnYUFqeEwwaXZkOHhNYWxxVjdVdnZqTjR3K2g0Qms4?=
 =?utf-8?B?SUF1UVplRTkybi9FMTZDdUpLaUR4N21LRmhuaFR0cWVHUmZWN3JUNkhXbWVJ?=
 =?utf-8?B?RWxmWTc1QVcwZ0NidER4eVIzUGVSS25MZGQweU8rRm1ha3ExY2w4V01jT205?=
 =?utf-8?B?UUFpd25XNEJzOU9ZWlNwQ1lUMW5uSUhmSkRjSzNjNy9RODVPRkJIRmVrSzZl?=
 =?utf-8?B?dk50NjBuQXo5a2drMW9qNjk3ZW9QaXVVSEN1d0xjQVIyNUtrM0N1M2k0Nk4z?=
 =?utf-8?B?MEUyNmt2WWlGM3dYcGk5R2lGYmJVdUViK3FRaWtMME9jdG1vZVRpRTlycXhs?=
 =?utf-8?B?U0xWRFJCRThwNG03WFA2bmdWN0FqZHN4TXJ5cjd6ZXo2b1Q4M200R0VyaXFq?=
 =?utf-8?B?WnpqSGlKK3p3WE1SRjc1S1hhRTdLOHNuR2pya09yM3J4VTVzV1JPYkN2MmhS?=
 =?utf-8?B?VTdoV1dPRlhhdEtpOWpFT2VpNTlXTW8xd1Rmdm8rN0o5dWFnKzVJSG9TMHFx?=
 =?utf-8?B?WHBoWlpML3pyRmI0NnJ3R0lzM2tBeGxsZjJqOUo3KzFPOUNDZFAzdnd0QXQx?=
 =?utf-8?B?cU5pMGw2bElxcFllR2dQNkxNaHRCcnVFc2RRanhTOWZkeXkrMG5peDU5SGhG?=
 =?utf-8?B?TUlKOFRsWkV2U2xkbzRMQjByeVNhUWVRbmFBcmNaaXEzOGpTN1NPRGRkdEli?=
 =?utf-8?B?ZXE1cDB0OTVaVE54TUZXbFE5bWpPVUhiYm1McUw4WEM4M2RzT1o3MjBBNGtB?=
 =?utf-8?B?dmY1ZkswbUZzMk14VVdPMjE2K3Q4c0hLS2JBSjkxNThBd0RtTXdqWHc2SGZI?=
 =?utf-8?B?a09hM3ptNzVPOVJBbkJCZy9tdGk1eXBVUEZLM25NNmozM1cvZlFaY3R3Tytw?=
 =?utf-8?B?VDA4OFJjbGpTT0Q4QVFMNUtNeXRJZjJPWlBySlJHQTJQRDNHQWlKNFVxNFlO?=
 =?utf-8?B?N2dnbzdObXR1UFY2eUJaYU5YcjF0ZVRRNlRIK041dzFxVW13YnVwUmVtRHBR?=
 =?utf-8?B?QVlzb3BvRFJsNWRSajg2VG80T0tYVWpCeXVsM0FtMkorVDJwb0k2QnptbXdX?=
 =?utf-8?B?RWxlcEI1Z3JrNWJlQWF1OXZMSFVVbHg4SFA4alpoendhbXl3c1htdWRuVGsr?=
 =?utf-8?B?TTRNKzJwQlNsaHltY2thQ0lDc3ZUVGVwTUxVK1VFMnYvaXo5TFNRdjlPOEpE?=
 =?utf-8?B?cHNTaWhzc3ByUy9OZFlIVktaclNhLzBIL0V1TTE0Q3QvUGo2QjRCOUp0WndR?=
 =?utf-8?B?UmhudEFzQUthNjlMOURDeGFlOFdCRXZ5aUJHUzNxVkw2YnljQ3VEQm9CKzNV?=
 =?utf-8?B?VWJNOEhjNFJtMkRiYmhsMmVHbmJvTkZZUmplY0dXM1dJSHJIWkpKVWNrTDhJ?=
 =?utf-8?B?TGxUZDZMTHZRUlp2czRoZDlDeEJpQlZVRWFsa0FpaUtBcVVrV3ZVUlNJT2Jo?=
 =?utf-8?B?bVNUMTlIeUEybTRBNUkxSTA5ZXNPMlgwMVNReWdMYS9RdFFDYUJTQmhNMFlp?=
 =?utf-8?Q?gqD2LiqB2z6cmQ4QsR/Y1sVonhAKMl0k8dJgCRTSjTdX8?=
X-MS-Exchange-AntiSpam-MessageData-1: BnN7BzgvsvPWytflRCcsSpF0Ro4R97WwwrM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd08f86-4f81-4deb-3744-08de7e0f6943
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:09:39.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90LpvrWESBK4fhDES1KebOwfiV7Cy4No3d+43raclu6H0ir2mEn5vjrNOgATdMmKsbYmsAoP7yjHX8OkCYEL8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_120947_449140_63FF716D 
X-CRM114-Status: GOOD (  10.82  )
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

The Rockchip DSI controller is a PHY consumer driver, which is also a
PHY provider (calls devm_phy_create()) that lives out of drivers/phy/.

According to Vinod, this is discouraged, although it would be difficult
for me to address a proper movement here.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

v2->v3: fix cc list
v1->v2: none
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..c0aaa51e0237 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -27,6 +27,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include "../../../phy/phy-provider.h" /* FIXME */
 #include "rockchip_drm_drv.h"
 
 #define DSI_PHY_RSTZ			0xa0
-- 
2.43.0


