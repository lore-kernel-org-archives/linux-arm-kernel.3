Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=; b=U9q1Dhkxd8G4Xb2V+0Y3vji8J+
	L1nZA+zv6m7+QaC0YWtHjbnF4kj+CE0rfzy+u8OwaUNVcQxwJW+IZl0nnu37gmnu1aVQB2PuUPfub
	NxyVSxc6SiCIdih7SH/7ueqpTGopT21g93FsjZCdz2hf7z1AA4gtDjvvHxHB2IhAh6BLWjoXKHP1g
	GD20Ul6bC71RpwLza11vUloxbDNrthhuXCz/s3lJ9S5CUReNoqUfbZzdaSOEzzPgz8oj7R63PUb/S
	eWMHp7Vt0eSJNDwKuC3t5bmSC5dct+iIv7QaKyXyocOXIPyZKvWeYxRRLzOuPGQLy3MjIaXuzls25
	l46VCMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpJI-0000000HKVU-49cq;
	Wed, 17 Jun 2026 12:24:00 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpJB-0000000HKLZ-1IkZ;
	Wed, 17 Jun 2026 12:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyZRFEevzIASHzaEnT8oBcyVm/aRlCDDJ/cuyRF3a1RNgrv9HTEjflI7qykZXrpSws+0WNN3Fz5+Iv4CKg+G08fODOaCi61qcS8dM2lbzmtbKM7Yqb7AwGkT27l0RU5NFJCxLe130wzF5dZgNL77dxes7zVV9YtBmAPrHjrhwcBo/2jOajksIXwZ7jDGKeRtiGE47CcHvXBMEbu69kyniryP+DDd54To7974twZaXhTdGqCgMzY+THlks6ItsA/vvaszDnhUKssaMy4P5WFT33xKl5p7NEI2H1neuq2NF/mpN9pcHKJ/nwZXC9wg1tZJc47xpeECj1VkJGOfdyl3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=;
 b=P2rccdbw62S/J4hsFIK0nurnvN8vdoGfXKaBQYL0sdgy+r8FtGl2GguXqicUGys0INDF/MmR1bN4X2cMVjjBp+irMrjLi/voX9Yx2K/1vU8YUkFXXEnmtcjbV7HMVOzLgBiz1A8ariXjPtREaQ5PVeydaid8jFj9TGTz3SDiZ2lMZIppX4Rv0a53/12DJw95nrJZ8HoUvn1oLqCfTyd8XJMyKUYB0YsOVbF/o8NYDJcrtAre5CSuw6AufH+d7rI+qE/it0dTm1xpYMsLD9I7MxAV8vzRumA/8aIkEH4RE2GH3YkKTLmUJN+maQC4nusjY8RUoX1+V2jrtKzpXp0H6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=;
 b=1PwGe6BPEjDWv2TMwvm7zQBdmUaFXevjS0fR0O9cj9PpeZvM+eCT8IrJFq0f0BHENruHS7YefBj+9a57frSOfDKLTRRsVfuztXJERTbKagxNBO2csOnDFfD3hjZJyR/MbN/a5rzy/TfQs2lBA3AQ3J47czx4k2jKLIO4n38E+Io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DBBPR08MB10697.eurprd08.prod.outlook.com
 (2603:10a6:10:52a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 12:23:43 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:23:43 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Wed, 17 Jun 2026 14:23:15 +0200
Subject: [PATCH 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add clock
 lane phase tuning
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-feature-mipi-csi-dphy-4k60-v1-3-4611ff00b0ff@wolfvision.net>
References: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
In-Reply-To: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781699017; l=3042;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=Tqd4m+h+mXUR7yNiqt+EmEzjdd0dUJ2ulLBb5QSWcpQ=;
 b=kO6aiMmjplm0FiOdu22T0jqtUc1lKaF4XTHSUYhkVvLM3GTcR/p4Xpa7WCCcX1wU6607hWcDu
 pbtY1vv437LDonjazE3VdBWaiZkzgYAJLm4+QOPol7KOasR0w5+4Z7i
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:803:64::18) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DBBPR08MB10697:EE_
X-MS-Office365-Filtering-Correlation-Id: 282f6bc0-c551-4e3e-9b1a-08decc6b4532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|7416014|11063799006|3023799007|38350700014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: scxWNYBSjFenKsN3mUTnGn2rlpDRVB6OxNhAbTbdmA6YzZM5i7m8IuDHaxe/nZxzU7eM/CHgFE6vRYZ8vpGJUUFx7NLc5QgZ64Yt7lCJZVizruZsFG+ePw1orrvQjFNa8ovegMNCR4aajQ7OcAg5YPDHdhfyagE4nHrO9ZSgyWTv6wkVv+pmmixPaMTnwd/SZWA+K8dNgUYm4MixflGVXz+I77EcMCoVgCajWir/JIeslP5M99po9YnB8ymGLU32tT06JgxwkZdgxmpRz5AQmiw6+1vdoQcQxrqMNdGXS9kjp5zm423AQZPKIHb6YGSPya7fKSQVIPcn9gR6G1VK6GO6LB4Veu5SRw6Y68xE5OanbJr6arRMASF2PbNgLi+8+6V//eAx9dnQZC0XueBsGgnpbxrsFb6PEj0nAfi0+x5fX2s9JXtZkhVQHam9TXso6dGJnAaJHG/++hFoOfRzPKj/JTbeuuAPlBkl9mOHQeSYIelI+ga3dTAp7OrSrnNqBVpu70c4dn4+TUZhLeRwuSG7fkN/LoVZlpSlCeNzim6mDKPLtTaYYGvRBmSZgTArF9GixOr9mH8hjRWRF9j07J8cxQLfcdWFMJGEtqgdOlxFRDM/Bge1G5a8O9aJyRKjckuxNpylf9j+PPpYb20Uc7D8T/cNQqUDNQlb3OnsEC+rBiwfWLMUJi/OIobzpAVIraeLATHe4WFHuZP5rOzg4E6Y4b6/Xbl/GTxc6V/918HFr9wRHNSaQEgF7hghDvp1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(7416014)(11063799006)(3023799007)(38350700014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXNJcnVnZ1UyK2xDdmJLUVNWZ25ncDhhUk1pOTF4QVZYLzJCUnFHUVRvRkFX?=
 =?utf-8?B?YW1RN1lRV1FONS9XUnJMcnFZZDY3WUlQVHFJMStqQlEyQU9DL2x6bHJPcGp0?=
 =?utf-8?B?N3pJZm1yUGJOdWNWOGV6aWJnV2xrcmN2UlVab3VobTlERWl5ekxodkI4NFFJ?=
 =?utf-8?B?QUw5bkNScnF1ekZxSUkwUXd2blk5ZXQzU2xld29XTWN1MVNDK1hIdVBGOEtP?=
 =?utf-8?B?OFRUVFcrV0NTZks2YjRXcFJkQUNkdkVMZ21UQmtzM3NPZHJPSlF1UE1uclM3?=
 =?utf-8?B?bFp5SXFaa0hjbzlSVEJ2SE0zZWIrQVVvZHB1c052ZTVXSjdqbGpjbW1leVQx?=
 =?utf-8?B?TDhmY01JdytuTTZMWjhlcHNmU24vV2JTZ3Bad1hpQzdSUmhhTVlnYlpUZjJz?=
 =?utf-8?B?MVgyNTZBdzErQ0U0VW1mQnlrWnNFcHZqTzcwVVlBTzZRTS83VWE0cHExWkww?=
 =?utf-8?B?dEZCQmRTSU5iVGtyejBRMmMxWjdEVUlSMWxRR0gyQkNydXJjNTZEK2wvZWMz?=
 =?utf-8?B?cU93cWlHU3RBVG5aUmxFSmFCM2svWVRFRDJMMXdCZitGakJ3TEtuYy96aklS?=
 =?utf-8?B?citZYXVXL0I1M3QvZkZHMmVvQWM0SDVHL3dVbkZJNzVVbTFUMThPek9rd2pz?=
 =?utf-8?B?WHZQNGxDMFpaa1ZOOVhBMzdIejRBNDhENFMxUk82VHdNQ21FeCt0RnZxdE12?=
 =?utf-8?B?eFN2aVYrZml1WTJ0NEhMMC90UHBRWTNCM1loYnlrWCtaY0xnUFAyaGxJbFBs?=
 =?utf-8?B?a2FqVElYVXIxZCttT3FyS3VDV1NhNkd4amVxbko4K1NCeXhFZmk5QTJqd3lz?=
 =?utf-8?B?anRpTkFjQ241SGhTS2tpdzVVNHhSR1B4TjVHR21zYVFaTE1OM1NvWCs5TnFZ?=
 =?utf-8?B?b3dUK0NlejZ6SWJ6dEFoZkd1MHo2MHhYOGE4NFRONFRFR2kxQ29UblUzc3p5?=
 =?utf-8?B?R21yZjRLNTNCS2FqNUk4WjFQeGVKM3lNcjJBUWU1NVlZUkNBZ1ZoUkpiR0sv?=
 =?utf-8?B?ZE9Ra2w3dlR5dS9Lbkh4V2JhcmRIR0NTendNWVF5ZnE2NmlINUpCRnVzcU43?=
 =?utf-8?B?NmZHRGZEWkJ5alMzdlJpN3QwQ0N2L3JKVkpwd3YzQlh4Z2JoTmpyd3Rhc0gy?=
 =?utf-8?B?SGkyVkE5ZEJqN1JCS3JqMzJqdVZFZjNqYTFqRDZ0a2crL3NneGhEbzF5UE9Y?=
 =?utf-8?B?dm4zK0c0dkdhRGRSaUFsOUlud1VDRlA4NWIydkFlZmUybElManpYZHdUK0lW?=
 =?utf-8?B?MVhsbmJJai8vVG41Wjg2Nnk1aCtXaUJkSHB6ZFBRMU1POHdGRm1zMXdRMUZE?=
 =?utf-8?B?UndpU1V5TUh3ZkxjdGw4VWxmZ2pGdXhjQjAvMVFvVUVJVUFCVFN3b3lkOUN4?=
 =?utf-8?B?Mml5Q0V0WHhRdUJRbW1vTERXR04vejNZZ3pldUlwWUlHL3NrSWpRZlFSVHR3?=
 =?utf-8?B?c2tkRXl6Qk9WWkJUZDViSTlXaWI4MEJoYStkN2NzUTdPZjMyVkZiK1dOR1dO?=
 =?utf-8?B?S1hFVzVFWmVNUS9BQ3pSd1VqQU9HWVVybnpoYS9NUVBrcnZZeE00NmFOeC9D?=
 =?utf-8?B?aGZkMmg2aVVMZ2N3N3o1TXVxSXJuekVMOEJITXNteEhvWXpVenlNTmhFQnox?=
 =?utf-8?B?Q2VsSW1zeGFBR2gzWnIrY1ZNVE1FbWJkU2dlUTF1TVpScXdSeStmaDRYSnVa?=
 =?utf-8?B?UVhNTlJ2T0IxRzd2alBjR0FPQVBvV2FIQmFnOVNMUFdJV0RDcW4yRG8wbldU?=
 =?utf-8?B?akVacnhNVmptS2ptalo2MnFCQVdoYkIrVDE3TTk1Y0J3RllLS203NEhvU1Fh?=
 =?utf-8?B?YW5UbWRIUkxLQWlLaUg2NWhSVVVPTXNzdU04S1YxVk9vR01maFZCOUR2ZzY3?=
 =?utf-8?B?TXZIRFpaTCtZRldmWFgxYXRGUnZtMnN0UnF0VjdVUGo5QzA3MWppVWFRS3B0?=
 =?utf-8?B?eWVNYzNJWGdtZ3E3aHBQNXlVK1o0bE5odFZzdHdPeFpNQVdvMnNQNnJINmdO?=
 =?utf-8?B?ZXdkOXh0Q1JQcllCRHhjRlViYU9rVERwN1FyY1BrYUVOVmtueDUxYVhpUXZt?=
 =?utf-8?B?OXo5dnFnYU1OdkJRS09EUkpGWjVjN0hqOHE1c3FweUNuNC9vYmtKRmJTbjlQ?=
 =?utf-8?B?dG9xd2lWbXMyNlkwaWNBTmh6Mi9CVUJFMExMZTRoNlAxSjdJbnZUbHU3L3Qx?=
 =?utf-8?B?RUNCMkl2aHpmM01QTi9Idm9SVi94OHMrcHZiWGNVaFNxSHNwRnk0VmFDOUlJ?=
 =?utf-8?B?THJ2K0NDa29zQ3R1VTRFQm5UWkJpVktELy9iUFFhV0ZGdW5YdWNtY2JYQUlR?=
 =?utf-8?B?b3JYSC9xSkZreS93OGJ4OUtKZW1acDMvV1N6SDJzeVhPZ1RibXZ1Q205N1dj?=
 =?utf-8?Q?rrGGqYKIlsB75zfs=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 282f6bc0-c551-4e3e-9b1a-08decc6b4532
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:23:43.1635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkHa9noND+NA5z93G02EaJW1VLKQ8fe9MQ6rymJuMtKyq1EkVekZQn8O61+WHuPLEzlPRU1VPMPO9EncLrNc05P8S73z7bOHY5ey3M5pXTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_052353_388308_10E6B99C 
X-CRM114-Status: GOOD (  12.92  )
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

At high data rates like 4K60 (2500 Mbps), such as when using an
LT6911GXD bridge chip on an RK3588 board, fixed default timing parameters
can cause signal integrity issues and clock-data recovery failures.
The driver currently lacks a mechanism to adjust the clock lane sampling
phase to compensate for board-specific trace variations.

Resolve this by parsing and applying the optional 'rockchip,clk-lane-phase'
device tree property. This enables board-specific tuning of the clock
lane sampling phase in ~40 ps steps (range 0-7) to optimize link
stability. If the property is absent, the driver falls back to the
hardware default.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 5281f8dea0ad3..3a15840e86cad 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -69,6 +69,10 @@
 #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
 #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
 
+#define CSIDPHY_LANE_CLK_3_PHASE		0x38
+#define CSIDPHY_CLK_PHASE_MASK			GENMASK(6, 4)
+#define CSIDPHY_CLK_PHASE_DEFAULT		3
+
 #define RESETS_MAX				2
 
 /*
@@ -151,6 +155,7 @@ struct rockchip_inno_csidphy {
 	const struct dphy_drv_data *drv_data;
 	struct phy_configure_opts_mipi_dphy config;
 	u8 hsfreq;
+	int clk_phase;
 };
 
 static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
@@ -304,6 +309,13 @@ static int rockchip_inno_csidphy_power_on(struct phy *phy)
 		rockchip_inno_csidphy_ths_settle(priv, priv->hsfreq,
 						 CSIDPHY_LANE_THS_SETTLE(i));
 
+	if (priv->clk_phase >= 0) {
+		val = readl(priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
+		val &= ~CSIDPHY_CLK_PHASE_MASK;
+		val |= FIELD_PREP(CSIDPHY_CLK_PHASE_MASK, priv->clk_phase);
+		writel(val, priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
+	}
+
 	write_grf_reg(priv, GRF_DPHY_CSIPHY_CLKLANE_EN, 0x1);
 	write_grf_reg(priv, GRF_DPHY_CSIPHY_DATALANE_EN,
 		      GENMASK(priv->config.lanes - 1, 0));
@@ -449,6 +461,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct phy *phy;
+	u32 phase;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -464,6 +477,18 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	priv->clk_phase = -1;
+	if (device_property_read_u32(dev, "rockchip,clk-lane-phase",
+				     &phase) == 0) {
+		if (phase >= BIT(3)) {
+			dev_err(dev,
+				"rockchip,clk-lane-phase %u out of range [0,7]\n",
+				phase);
+			return -EINVAL;
+		}
+		priv->clk_phase = phase;
+	}
+
 	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
 						    "rockchip,grf");
 	if (IS_ERR(priv->grf)) {

-- 
2.34.1


