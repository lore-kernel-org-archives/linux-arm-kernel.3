Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B0DC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=egu+Y2r5neCKJI1VPUzOHK+6rqQB3jxaMTenNgwRk7c=; b=Zg/PZWICMGcmmBl/aDeCyeSvY9
	46QoLm/gNDyGEknEjXG3pnZOI6yNopYD/b7p3EgN0Ldf879CzdXDoQSxf7fhcRpHEjzbadcHnlp6h
	SYWJDJrXxGVtlpYJcfDTPnrri7fAOjalCuUvsRVj++8yCt8QeUvFqk3WL0qk6lh35Cst8iDHXhssV
	H+hh6wj4l6mSSIVntq6guXoK91QkdKqo/98i593mj2YNqGHU1G9C2OUOBTce9qRuyQrltsUO5iiPn
	Z8Kj0/UKG1iiyUJbgFu9R9/Qa5emj83EY7OOrPat2Zr88E2WXvjL4mIX07TJM+KnCWwDcep0hwQ7M
	Fix/A8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffu-00000000YaV-40ug;
	Sat, 25 Jul 2026 16:56:34 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffm-00000000YUc-3AwI;
	Sat, 25 Jul 2026 16:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/5hoeyDWJIH0P2HnKeNLZiMTCXWlIeMZ0G/Qx9PGEul9btC21aqFHsnz/faqVk3bSKP8k/3c7c/ICV7lO8lKxt+xXrUn0rJG7SKl5BuBEObVqyZOd/7+MZDwStDTGNKOxEUw+HdzaZ0/59FfXVOXXYGvu+NHEAcM6yj3hgB41UfFhzpeCuQBqQZ94pp5X7HStERSE3JMTjdv74iGBztIRADwXpLG+LrSIIq1MubBMUK7bZVWs9/P8USEwhjbqP6lJG3V8/iuLiWbwbTxNoRF8yfaXJZ7D1QljSy8wHYV7CYGEQqx1TO4juH+LrOTOrbb/Hreu2raUwzIq3zdg6mVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egu+Y2r5neCKJI1VPUzOHK+6rqQB3jxaMTenNgwRk7c=;
 b=xlsCUd3emcCH5vKxMmArWZ0VDGmct+UOy/Un0gPIUesR3TZpIomiAQ11lJFaTkM9iYQYCPS//KyWyVi5w4nt6Bhtxf8Zia/QhqOLBS9k8PHlQ0/upS93T9W+421jSgkqFBIQpnd94+FKwT0jXSIyCZKnYlMtwf//9ezMIl/QrB7LR4v0k8HFsFNVG9To8ecwTGORHuOLLpD5Mvh4b7BCIoG6jnm/L+ZJa79ZHCR0LjQDjPBJe8Vopa6xCzr294uVc6hMCgiNPMsj73hhR/GGzagsSJkhv6Qoq8rlQMS6EduZyuVnphEt4anPZ672jm5a0VEqQ5/9h7PMLBDSVSA0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egu+Y2r5neCKJI1VPUzOHK+6rqQB3jxaMTenNgwRk7c=;
 b=HNxiIvA8gIp8EsIN7CCKe5gfJsLquybjUJD80Im3SEvDVWqD8XDdUYEE+JNlM7deVQealAarg4gIvIvKNht12TcwfKVfEs8TuJUhTi5igLYqSczjensgsOpd+6AJaoJ0/ezMuKdpPNza0ztqBdcA84F7K7saUWUmuqARuvY60IA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10789.eurprd08.prod.outlook.com
 (2603:10a6:150:163::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 16:56:16 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 16:56:16 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: [PATCH v4 0/3] phy: rockchip: inno-csidphy: fix 2500 Mbps support
 and add clock lane phase tuning
Date: Sat, 25 Jul 2026 18:56:02 +0200
Message-Id: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLqZGoC/43OzW7CMBAE4FdBPrOVf1K76anvgTgkzi5ZCklkJ
 wGE8u51kgtSEeI40uibuYuIgTGK781dBBw5ctukkG03wtdFc0DgKmWhpbbSKgeERT8EhDN3DD4
 yVF19g+zXSsi/XO5NpQgzEgnoAhJfF3y3X3McyiP6fhbnRs2xb8NtWR/V3HtraFQgIbNKEUlZS
 qKfS3ui9fxHg72Y10b96OUvPZ08o435tF57r/GpZx48I196JnnKWZfronSKin/eNE1/SPkr4Hs
 BAAA=
X-Change-ID: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784998575; l=2373;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=6HWl8dQBwPu13ahq4/IEhhhKgmOS4CGLdYLivmL6Tls=;
 b=c7RcXV/HYhppYYr5B/+h87TYqNHWnQpqkq5yCluWKa0fvUSyZTZ2CXRGr/Iu8c87NpdmSQIPr
 SmHanWsyg6lAZnlnjbRs1sHwY0oWdHkSbEMxSBTahePf9DMAiAcKJGu
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV1PR08MB10789:EE_
X-MS-Office365-Filtering-Correlation-Id: 9941f15f-9700-447f-3fc1-08deea6da451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|23010399003|38350700014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: FKq2JoEPoUL56XuY7NOcF+wX8sUT20evoCCzUfJE/fzk+4HFLCZdw6cMpawY7I2Wfn4EK/xHFfhCqIB7XNbDwIt5gRGIrYv3Vt+zQSLJV0SwQr1BuE56vWiEgzVE6tgfYljWnNTs1LIJ7x6dNt5Bk95jDJklKyTxf3rMvE4AU5/9Me01ueMUfe1d5lVePB3fMbFjr746qZyEkHclDnbZqUm7Q+wwLyjapfaSpJuvFlz+wicYolH3JiXF66qn027HaiXwzssjJF2gOhZplHkGAPNCbpuLS7LvfW6CClgQqvufk4T7Zx0B8EbFU4j1b5cJpwbQF5Kqf3+LpYPaCwInqNNU4PanHQdti4S3t5uxUmEwFWEdeXMV5E8BUGFWck3T32PF01GYZjlbWH55TuKJgs2uyk93x7yb2UOzE3v64io87HUR/1I1pJYiMqc47daxJuRx6Sbtu6LUV0Ss0ADgGJTqeeKSxX2V/O8MptRdKZAC6MmIEO2pcqiEXbvJ/b82yKFFVfJuyzLivBZPT/z1IJkqEabmYtFP7Hciv+Yx3EPu5ckDpUmkzA2vziJwF+cFMWfB/AMOSv1i7BbJmm+LqcEwDMQBFCtfhoF/1juddJxdfy+QLLb0JFKa2WEIbMlXoT00YH/+sdU16aG196KmEowrHbMd5Shx+WCw+kvTe7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TCtKdWoxc09BbVdSVHdWc2Y4bUJZeXN5VHB0SDN3QW8yN0ZWeHBsZGN5cS9w?=
 =?utf-8?B?dzROWTVmWmJwZGdUakx2a1d1ZmJIVG5STXRNTnB1R1k1UVVSY0MvcXlZSFFk?=
 =?utf-8?B?Tjg0L3ozZEx1RVhyLzlpbmJISDQrazRiL0xEYllpNWNkRUQzUzEzZXFGWDYr?=
 =?utf-8?B?eUg2elMzOXFpYkt4alVrWDBJVitwQ2RqcnNMZFdVSEZaM01uU3lXRHA4YVVD?=
 =?utf-8?B?TmNELzRpNEthWTZDZDR2NUkrL0k0U2lHenJMZ215S0FrMXhERXRkOHhieVRa?=
 =?utf-8?B?eC9ZUG9hYWN6R2tDN1dDaVpUY05IUHlCS3VhY1duMmp5YmplK2E2U3BPMTB6?=
 =?utf-8?B?MjJWOG5EZ0RUOEZOMmdVVEZxNHA5M1A2bExPSnVrZE1rQWVUU1duSjVpMXhG?=
 =?utf-8?B?NmxucTFHd2dVYWFsRW9nZ0g2UEx3STVnSVdmRnFVbXBYemI0S3ZWMk14SWRX?=
 =?utf-8?B?YTB5MDNXOVRwQytoMGdGZ1N6cHpTbmdjWVpBK3RZeFczYkNPTjBJclorNURw?=
 =?utf-8?B?MGIvRXhnWkgyQmZ0RXFabWxuQ0MrSG5BMVordlN0S21OY0ZrRGZLclg0RU1T?=
 =?utf-8?B?WnYyYzQ4eUhlRkhqOTNWcnlQeHVRZCtjR01XcytPbWp0OWdQT2pGMlE5aWhI?=
 =?utf-8?B?dmJNaGZjZmRvdmhKR01hL1NVaXE0WW51QTlabnczQWM1cjU1VzR5MERUNzJ5?=
 =?utf-8?B?OEVSVi9NVm5HUUNWejg2bDVsU0xtS0RiSldhVjFkZW5xTGdHdXFXRHVtaFh1?=
 =?utf-8?B?SGdnaUhSN0dtdFplTTFGajd5eVFvSkJwZ3VVMjZXZGhxV21YMis4QlJMY0N1?=
 =?utf-8?B?eXNlWWZFcWdlQkhrUXI5N0VxKzVkZk9EYVNPempBTVByMXY4alpYSDByeGdq?=
 =?utf-8?B?RnVnTXlENXZyUU5oU3M4T2RqNGRBMEJsYXRkaDA5cGplZjZhdklKa2NETlZa?=
 =?utf-8?B?KzlhK0orWUh5UHEyMUhlWGtTSDlTM0x2aEpla2lMWU5NTUZidEhia3FUVTJI?=
 =?utf-8?B?OXI5OC9KU0ZCS2Zkdm5rS3hrbTRHYnpNL0ZtajY4TjhwTDBNdUlvclduYjd3?=
 =?utf-8?B?WitzaURYYVRmT2RRc1N0WlRiQlRwbVBUQXlTNFkrazAyc0JqRU1RL043TUR5?=
 =?utf-8?B?VHFYTlJiUHgrRXg5aTdnQUExbDkySitrWVBwM0trQTVPRkZtN1Z2VFdLYjVs?=
 =?utf-8?B?cVhoZ2ZPWnB2QVRKT1pHbnlTM1ZPd09ocGdUQnhMa21JakVUY3NYcWNJbGI5?=
 =?utf-8?B?ejJNS2hFbE82b3BrOFp2V2lLWi9FQmFPbHZWTXo0dnFodTZ2T1lwbW5HbjFR?=
 =?utf-8?B?ZUZBRis0a1ZUYXByc1FITTU4RzN6aEN6WHFScVBZS3hIdStSdUxkdGdmakdh?=
 =?utf-8?B?U3l3bTU2MXU3UU1LcnBlRkl3VGJoQllyaHlJZUtRTWtCRmkwaUpnSE5HQzFs?=
 =?utf-8?B?M3dMd1dHa2ZLMjJYMmY5anVZTnUxb3AybXJidHJLZitwdWdxQ2tuTDJmd25i?=
 =?utf-8?B?NURiNDhCK1FvdDFFM0ZoQ0FqNmxtajN6K1dXaHpJbEg0aGR5WUd0eWE5YVM3?=
 =?utf-8?B?djB3NDd2OFN3Nmc5eFlKQnhiTzJuUXpPN0N6TExuRjRPdFllcjUycldTMWJX?=
 =?utf-8?B?dWVhMmI0RUtja3dWeVBqNWdxY25xTStvRXorU2tobjV4Q1dzcUdnRU0xcHg4?=
 =?utf-8?B?czVxTzkreE4zZzhIUXhHcU1XazlkTS9LNmZIYXRGSldDZjBYQ0xpRGhmY2VY?=
 =?utf-8?B?WjZnYlRRelpNanVmUFFaMnlQaTVLWnRjWEFFVmdVQWE2TXBIVnhld0dJb3VF?=
 =?utf-8?B?SW5GQ2puTi9wdUlUWGFtYnhqZWRYSHlERnlMdnJCSGZqclErZHJPSyt1dkZS?=
 =?utf-8?B?VnVJWVlSYVcxZW9iS0ZYeDBxc3BDU0djYWQvZW15OGZEUDlEWFo2aDhETERx?=
 =?utf-8?B?dkVVbGVhVGJYNWtmR3lkQk5BcjhleXU2elJLQ3lVQ0FIQkpzUnNDcjgzNmRH?=
 =?utf-8?B?MVRmR0JoNDY1ZVZJdWg5WEhOcHhiYk9MZGhrZEdGenZiTUJ6OFZpM1krS055?=
 =?utf-8?B?d0ZUcW1MVHRGcFE3enIycjBGczFTTXpsbSttVmdXRWthZkVaREx4cXJQZ2Vn?=
 =?utf-8?B?Z2NkNVR6eHBGcFMxTHUrK2hKUExBQThFUkpXL1dhWFVuNHIzcUtsL29IQ1dE?=
 =?utf-8?B?NmwraXB2c3pYazV1WWdUMjVJWG8yb0pramZSOXl2Z3Z0aWdhK2hBWVN2Vm1S?=
 =?utf-8?B?UnVPRnJiR2VBTWVGaHFsdTJuSXVtd3BaWGR6TnJjUEhaVFJ4ZHVxVEF5UU5V?=
 =?utf-8?B?VnBVZjNiTVFocmRsaXRNdkl1N3ZaVlB1UkgzSG5TSVJtQXJENmQ2UG56a05o?=
 =?utf-8?Q?x0swuWRELe/1dSkY=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9941f15f-9700-447f-3fc1-08deea6da451
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 16:56:16.2972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/uO5rdzzmFnmisIVmlb5bi0I5xphkThHt60Vaz56cK4Y8OUWiT7isi+xHGX/6liQAKg/nY2rYkkEKiEPRpJZvbZ6Rrbpr34nfIBYzsSCi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_095626_804587_A71A820C 
X-CRM114-Status: UNSURE (   8.07  )
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
Changes in v4:
- phy: rockchip: inno-csidphy: warn and clamp to default instead of
  failing probe for invalid rockchip,clk-lane-phase values (Michael Riesch)
- Rebased series onto latest phy/next
- Link to v3: https://patch.msgid.link/20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net

Changes in v3:
- dt-bindings: add default for rockchip,clk-lane-phase
- Link to v2: https://patch.msgid.link/20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net

Changes in v2:
- dt-bindings: improve rockchip,clk-lane-phase description wording
  (Conor Dooley)
- Link to v1: https://patch.msgid.link/20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Gerald Loacker (3):
      phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
      dt-bindings: phy: rockchip-inno-csi-dphy: add rockchip,clk-lane-phase property
      phy: rockchip: phy-rockchip-inno-csidphy: add clock lane phase tuning

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 10 ++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 27 +++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: ee6aa0f01d4e8eddf1c7fda49d65c7ef12444e78
change-id: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f

Best regards,
--  
Gerald Loacker <gerald.loacker@wolfvision.net>


