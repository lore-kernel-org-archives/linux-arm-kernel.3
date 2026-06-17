Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C9CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qIvR4sFhQKjfMWuzkC7VHSr2I1Wqm31qb7WKPippyuA=; b=kCgZN6bBlo7ursm/4jm/zxPjqu
	SPt7RLSxRUBQzt9w5iJSS3TsT1RiRw7a9IR9TGOLifkG0m7FvMHrvH8ajdmDDBtclqrVr9XVQ6/NH
	x50KdQpmXKnmhluep+2sMVu0AwGQRgLTnPX8oxZpJjKrkVmorY53KBi2LQEmidIkSNheGFAxSQp4N
	hnBF2hzKO5KeMK7GHbzBVVS647bnvUctat1hiexDcDkrlu98jUbnYTQfzFxsFdyebkaf9Tqa6oROk
	DUQCI82w/OLYh7fJ4vAb+k7NzSv/RdZKjQZOmo6NcAUky3vLOtTqE3iNBwcp4Ig2dniK8yfzZQUoF
	lcBx6owg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpJ7-0000000HKMO-02eY;
	Wed, 17 Jun 2026 12:23:49 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpJ4-0000000HKLZ-3nwI;
	Wed, 17 Jun 2026 12:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3lYF6YXDlt6oCphiNpOcBtn2cwo5Mx4rqwms36Htx6jgrEdDNJd/kqkEdmbiiia0wjnjVmUbnYVkmdJr4+wcGuxhLP7Kwq1c6IGz4f9EaVvjEyA70EXA6olX3NQc4M7qfiAIoLk5ruyUu3nCiENh+NRzJPrvTxYZzW/LAP6DaoxQa6ZEFWXTXW20l8s0pZA/HXNZFP3Mdrc7t1KuykSHWMNlGt2yHT2crn5RArhxkk/0bRnzyjbR8NpOX1EmTbFIkYPRd9Nz9X7BGFrz4EBafLpqF7uv7y3Nk7mw5GdSm5Huqxm+XLvXMqZbIQ30S8tkTC/6QoPITN/6Symf6KWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIvR4sFhQKjfMWuzkC7VHSr2I1Wqm31qb7WKPippyuA=;
 b=jULpcR8+dBx30uvBAKpsqWmf7ChoGJ8VCnTAJsc0SV4j7hC/4ypdrBUjxk6fWBAvGSeE2oB93Al+SDhh7a8Acb7ugUR8zE9So0P3FLXdp5W5VfvH/2tSHTFvpI+BfNORpH4DwRbwusHrRr80gQJPXUPvDeW0HpDkTFNHRDJ8Pvzb+whI/Dw3voEg9kR+Lpx5aI0+R5YEoaKlGwRb6bDyTySUQR8mGdqvJMBiGOXnuF9pIHkciPcZg4cQe46myFumsl7ReUDyUR7THejSdF7U3UQQ16ClJcS/76mGb9yr8UV+5L9GA4hL+QliD6kbQno77Q3CO7WBoitRmBMlfKBqyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIvR4sFhQKjfMWuzkC7VHSr2I1Wqm31qb7WKPippyuA=;
 b=ySNg0064TPWtjIjZKXEh4B0gyM6ep/NInXBnRDj12J/fNtW1CCdynvONPASfr4kzlspQj9zUitje4P5/R/s9dGJFukHKBHRs0C+cQNh5PCWWMKTA/aM4nQ+bUMjqWEPtH3ddFupoX2MPPXIIWLEPbBxKV778DVZEQSISeNgemDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DBBPR08MB10697.eurprd08.prod.outlook.com
 (2603:10a6:10:52a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 12:23:38 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:23:38 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: [PATCH 0/3] phy: rockchip: inno-csidphy: fix 2500 Mbps support and
 add clock lane phase tuning
Date: Wed, 17 Jun 2026 14:23:12 +0200
Message-Id: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGRMmoC/yXMQQ6CMBAF0KuQWTtJi6SIVzEssP2V0YhNB4yGc
 HerLt/mraTIAqVjtVLGU1QeU4HdVeTHYbqAJRRTbWpnnG05YpiXDL5LEvYqHNL45ubmDHeHtvP
 7YCOaSCVIGVFev/zU/63L+Qo/f0fatg+bU76JfgAAAA==
X-Change-ID: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781699017; l=1231;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=O3km8EweAJ6ITjpvGQqs7mWNerFEtBc4hbWpi/uoIz8=;
 b=xjAjy8FTDPfYgT1IpnXu0a85qz0tqnyTK4Lmjbj3zIA8CQ3FeSaBiMEE3KBRYhIXmor8v+7HE
 k2Ty+AwitdmAoTDKZ7nxvoShFeHydu4Tzh4hTz7cdKlU7qcTcFZ5nz7
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:803:64::18) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DBBPR08MB10697:EE_
X-MS-Office365-Filtering-Correlation-Id: db6a1d9b-1d57-4a3e-af96-08decc6b424d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|7416014|11063799006|38350700014|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: YX0GvzOvgjZkl41UMLjCI9chVdYnRDkpr6Iu4mV3cJeDR1lIoE4asKTTfLN40CUE/vLpvG2zCQrycn4LpwHRYeDnuylQx24JVWDrSyT98tRViht87Za4sb7Accoj2/vQSeJk2bKnPUyvzQ04lgNDFhhw8VpD6XmgW//FlsOyx5YbI2BkuvEKZk1G50ASYqgUiLLw62gW6FpM2/bDvbotcqjOVQWxM/TAE22d9WmhH4LV/E4JtgM2wofZ2K0S2xz/UaFHQCk0WjI08IORjhqOfjDtZClUr2PMKZk7XOsBYER4z6x6wWSXQi5huE+QGlLs4iM2FQP0lS2LGONciDc04OpygeoYlp3kjXd3N/bMSeHwJVsl/5LvQ2F1S2A4D85bc8CdcEk4K0uKw9QA5/3GjC5l30mf17Wl1s7/l5orLicOjydBCwrzxvgrVbDi3565jOPjbuRdT6+tcV90bITrYbXXFjXNAmQz/EsobW2MUK9Nw9xA8TKNVEpawJgGg8VWop7M+qN7D9KKnV+Abiw0UuPIa0Qs2AuvdHxdeK1t/BJOtIBG4qGmkb5/KXBQ1S1DsGBUC9c166zrERqu1b1e5vsehIH/m8EfIW+4bFlOzi8lQT7AjiRn87kiR6J/NjNSHYcraQq96RqU8wCe1n1hMVpfzQ9RTnRMT1YKYPP1KNELzn0oKrRvBIvryjG6VAbNgx/agvprDFXrMVJP1V2HBoCq3dJ1GS7zaczPfWaXoQLu0j+5fLJPM9JVaZFJ56An
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(7416014)(11063799006)(38350700014)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFZRdzBnSlpDeU1GSlp2eVF2YjVBUDhzSzVHQkFFY2ZQQXVtbjIyUmxMYm4z?=
 =?utf-8?B?eDVURTNQMHBaenpwRVRScU8xWFBnaW42cHA0THJJQURKRUIzVDFETmdSYkZr?=
 =?utf-8?B?a2hTQXlLclVDT0FMUnhUSVRXZXcrSWNHTzFUMkw4VWNKc05wQlFOd2hVV2to?=
 =?utf-8?B?TDhUTzN4U29qMzJVQzV4NWMyWFNScHAzZ1RKZTUwYkc3bnpUT1IzUU0vQUFo?=
 =?utf-8?B?aEp6RHJsV0d5bVNhaU41dWl0VW1hN2RGVHhtQmNJdjVKNGFQbXJMTEx0SEtk?=
 =?utf-8?B?cWpuUytWc0IrZWFsQjBDQXZqU1pjcmV4ZFNuZ2pMQ1FLcVNHWStvWUE1MTNY?=
 =?utf-8?B?VStDaXA4K0lpM2ZtUlU5U0YrekMxZWU2ZmxlMkVNSWZyNmJxSldqUVVHS2kv?=
 =?utf-8?B?Y3NSaDdrVjJHOTlaYm9vVy81L0lMckI5dk55TWtqTVdEVjN6QnVZYlhpZVQ3?=
 =?utf-8?B?blI1VStRcXBYY3RPY2pYeW9NVytzVEV4OHFtR2hvUEJ6Nm9QQy9BSVVYcyts?=
 =?utf-8?B?b05wMHBFL1R3Mk55cWlxK1hDQ01oNi9TM3Ywc3BZejFtd0U4NDdhUFBuQzg0?=
 =?utf-8?B?UWZtQVVHVTFkWHdDcGZ6R1lzSkVNUHBnWkdueldNWjY4VGtvbWl2dHlYU0kz?=
 =?utf-8?B?YXFadkZuUzRTTG10dUhkYnNrYnFTYXZZSkFoZDJzWFVOTm52VEs3dnhVUGNR?=
 =?utf-8?B?S2h4M0tzODdIVDRFMSs1a1pVWENUTzFQRXhTd3pYTExLb0ZzOFp1VHdUOUly?=
 =?utf-8?B?VVNFN3FrK2NMRVdDT1hwdnlVTDlPbjREWkZTcFJGYUdSaTZ2TitXZXE3ZmRM?=
 =?utf-8?B?OUd5cVMzVmJ1Q2w3eWI4Q3FrdHpOUkVhbWpDTDlRemswSkVuaXZLYmVKcElj?=
 =?utf-8?B?bXBOOW9XZXVPd0lzeENuZUxIRklXaDVGYVR4UklKYlhUQ21YWGFRekt4ZHIz?=
 =?utf-8?B?T2RabzdxblYybG1ZTzUydXh5VnNoQmdRZnhiNkZtclJrNm9xZ1J0ZldqY3FD?=
 =?utf-8?B?VHk3VDdBU0NvZ1dDdXNEN2dFWXVRRHdEWlQ1d056dGowWU5XK1J6UjcyWUlH?=
 =?utf-8?B?cStkaTBObXFtbHlIZHhxdmo3d3d1TFVUb3Z4WXpzSTVLdm1UQk9rYWh4QTl2?=
 =?utf-8?B?aENnSCtvQ2k5QnFZbUlWTlhSaUJqRkVGbWRwMDNyRFBDZHZBU0graGxCelVM?=
 =?utf-8?B?TnBFNnB4RGNNWnlOSjByZnpDVklvTHFXK3VDVzFBREp2SHY1aDl6d0hOZ2dU?=
 =?utf-8?B?aE4wcTdtNnRpZHRzUE1iVk5kZVU3MmxLcGg1ZDFETWRXUitMclh1ZjYyVjFo?=
 =?utf-8?B?NGZkWFlJSldBRGVvSWVKWHI1MFQyL0JlMzdTWW5zcUEvdlNodlNyNE5iK1gw?=
 =?utf-8?B?VnNVaThFdVptaTRGd3lub0JaN2wzNmlrc0dhNHdSeGxrTDdMSzBWSU15bTVt?=
 =?utf-8?B?MlRDRFJ4WGlKeERRbjQ4UGdnUEJ3dWdQaiswZGtDcUxjaTJwSnI5Ylg0NFl4?=
 =?utf-8?B?Q05XZ3l6ZFgrZEowb3o3Y3lXUnhURkFWazI3NWx5ZkRKcTJBdkxNTnZUd05S?=
 =?utf-8?B?U2l2S21UWE5sb0J6eFZCdTYvRTlzZ1hnNGh2b3NBNmw1d3hsdHF0VTFiM1NX?=
 =?utf-8?B?cXloMll5S1Y5K2VvWWcybXU3TUFUeXFWdUtZb1oxZTlpVzJjbWROU01PRUMr?=
 =?utf-8?B?bVhlclJqYm1kdlgvQndaS2JqT1FlTkRXUzZ1ZjRYaTVmMGo1TDdRd1lQV3Va?=
 =?utf-8?B?L0o4OHJjaCt4clFyMjBFTUZXWE90eFJ3c1RmdENjRUlEc3lDUEdBN3poTWE4?=
 =?utf-8?B?SFRKV2dsblZOWGFyTVBmS29mL2RHd2pCdi9TdHlGd1hvRkhrdkxuQ29aOWdp?=
 =?utf-8?B?d0NPQlRjMnRDT3gxeEFnZklJTjFnTXBPaUtEcTg1RVQ2Z1l5anRzUUp4eUdw?=
 =?utf-8?B?YnZQV013V3VUcVZLYnRXNjd4VFlMc0NLdGpkUUI5RStPdExvNWxPZHNVVUZ0?=
 =?utf-8?B?VzhubjNVb1Zqck5DdTlxam5lSTNDSjhqVmRCTHdWZU5hTUtLRWpYbGZEQnlo?=
 =?utf-8?B?aE5QaURoZDcreTJyZ2IrZkEvTFVPb3grQXNrSStqcm1rVEZGS2JuR0JNMVcy?=
 =?utf-8?B?N29odnZUS0puSVJBTG9wTVl6TWRIekdnR0RIYWJ2dVNqT1hVcDl3VGMxejBV?=
 =?utf-8?B?NlRlSW9lUTZMWFdTczQ4dXpwa041RHU2bXIrTG5LZ2plUldoQmE5UDcxdnZB?=
 =?utf-8?B?Vmd6WGhjcFRXaG1EdkROZWpESkV3QllYd01OckdHaW04azNlUTJoTis1NGpX?=
 =?utf-8?B?YnhrQ3QyWUgvMENrUU03VTBOaE5GNFQxdlU4NkFraGFsNlVjNVNyck1UOFdC?=
 =?utf-8?Q?4SbrHIQVzrgO0P6U=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: db6a1d9b-1d57-4a3e-af96-08decc6b424d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:23:38.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTHriKW7anHrOC2KCkHHw7r2qSXtHrxfCi4CqUN9T2fYdof3w8TfLdbjMeCxqAM7iCuM+H4BR/fDIQ6ICRElte0+7/LAHIDlpLrjw44A7pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_052346_998409_344CC6A4 
X-CRM114-Status: UNSURE (   5.39  )
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

This series fixes and extends the Rockchip Innosilicon CSI D-PHY driver
to support data rates up to 2500 Mbps and adds optional board-specific
clock lane phase tuning for signal integrity.

Patch 1 fixes an off-by-one error in the rk1808 hsfreq range table:
the final entry was capped at 2499 Mbps, causing a rejection of the
maximum supported rate of 2500 Mbps.

Patches 2 and 3 add an optional rockchip,clk-lane-phase device tree
property that allows tuning the clock lane sampling phase in ~40 ps
steps to compensate for board-level signal integrity variations.

---
Gerald Loacker (3):
      phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
      dt-bindings: phy: rockchip-inno-csi-dphy: add rockchip,clk-lane-phase property
      phy: rockchip: phy-rockchip-inno-csidphy: add clock lane phase tuning

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  7 ++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 27 +++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f

Best regards,
--  
Gerald Loacker <gerald.loacker@wolfvision.net>


