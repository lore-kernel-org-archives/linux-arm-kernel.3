Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A8DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpOxnUuYuiAKpv3UeEc0kDOUPXyoFt/7NcJoHQR217s=; b=wQUYRLgCgYtUlg3qxQr4/K2GhM
	lyrpceBXQNbSYzOaQ1wTCwEAC38qC9Dmiqptb8lSXqu8UFuhtzXGKduxaHnAXfMaPPmVtSjlcjoHw
	GKS6T/z3wPZvC4dING+TZAT0w8yS7eZzURSHlDPF/GrKIdN8EmOzlrho93zEnrBMko+W+a1rpollL
	xoXB6zeK4YD8ODQQINL3mOhsSwprFmlu1IULw5yoLTYXArdHpUmgkmUjRFPS1638/MtKu98N+sSv+
	pZMwsAt11d4aU47Th7uAGtyxyqFTrU5MJvM1dLBIXcZGM491ZITd7zOYFbDf6Y4O2eHymk07T1lcd
	snc1bwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaR6-0000000EBFM-12X4;
	Tue, 17 Dec 2024 16:28:40 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZv1-0000000E2po-1pCA;
	Tue, 17 Dec 2024 15:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJZHggbMZTYhGYzrxv7Gji77Rg4acReYat+MgErackxzKZ7yomfGkSq26+AuKBDvBhtRk68Pw7IYv6jgfhmlvgEhFTDy48lCysb9uNJr/mIHJuTNkUG9CNce8pub1E/9qA/nO00xwhxldlna+n7eVTb6AoE0ji7yf/MH/GamJL5h+PnOPX6+BSVztG2cyREKwHHJK9RoBlJunAi5SU8lJOVDJwkkADW+t/2fTG+C20uWIoFWrlij8x/RPQx0EWAnGxJL1uZNe67fqR3nLYIHoAHQbUtQ60ORy7E2evnI7hep4GcTleWpM6g1Xvyxogb62WSfQpVASPkg5LcWBOl6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpOxnUuYuiAKpv3UeEc0kDOUPXyoFt/7NcJoHQR217s=;
 b=i+WZ5hJFX2Gev7DZY3OXl4RNLZ05yFbf3ALLzCw0O5/Lzexta7eEY3QesThF1hlsYyobPX11ZAlDV1JmvoHgOGj/tZXyKZvhxTZG15ahgRq/gGN08pW5EIeOqnLbTBeLpD2n06sO3ZylKR061rUtLUTJKIHelYEMJ2nJe4Rq3GwfCuTNIU1ASlpksZVRCPGpayDbeKXCDEATUl/+44WrAddGfT3Xb8PKgdzrzY98ifZavst3UfIcuIXXwcH8GSTwX5yy3PuDnTnhnox7QH0TjzqHtpvze9kW3Tpo5j+dshCyCMkBSbphyJzAg2YQtcMMsUW6cRajJDp1QF2dukmaiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpOxnUuYuiAKpv3UeEc0kDOUPXyoFt/7NcJoHQR217s=;
 b=OIYgQAOnltwtd1uhTH09MsmouBDBWjixetTxdDo4Y/QVaZz/r/dk8IKjIBtgqxP1E806QYEC4D5r0ZmmL7yEq9cksu0my09T1Aqoj3kexZiafmInJHo/gG5FpPafZlYA7zfWdjsuK5Z2a+n4c+lVz57ZKdM/g/fcQg7Z4LYIls0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10149.eurprd08.prod.outlook.com (2603:10a6:20b:63f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:55:25 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:55:25 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 17 Dec 2024 16:55:15 +0100
Subject: [PATCH v2 3/6] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-v6-8-topic-rk3568-vicap-v2-3-b1d488fcc0d3@wolfvision.net>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734450919; l=5915;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Va3AH3yoDneGj6VtaQffrOm8FCWBAjJbbRmmYuUD33I=;
 b=2mUH4BvuS669MmEcjMJQOLwkfrBWbxecZ7IkJ2hCwIpppansZuzkSQI6xEkM/F/c0SrDhz29C
 sRzQd3cMfkCBQViO7UdwXCLdNtO3AC/95srFmKuTFKKMysdyYnop+U3
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR08CA0244.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::17) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b2af74-f356-4e3d-62e7-08dd1eb3385e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0JVdlFERFZKZjhUMi9DMmx3RXlOTjlhd2I4ek5LOVRIU3VTa242WlEzV3JB?=
 =?utf-8?B?QXQ5VnRONWNtVlljUXJrVXo3cmtPdzJCNW4xZmpuaENJakIyRElPYnlCeHhN?=
 =?utf-8?B?QjBqUDJhVjZDT2QzMEY1SjU3M3hqNEVSN0tHZVNEbkVBQ0ZLQXhjMzRIR0Vs?=
 =?utf-8?B?a1c3QkNFSSs4T3cySk9BVDU2eWNTS2NlVGdreW0zZkZOUzhMaHU2QnJVNHU1?=
 =?utf-8?B?V2dFNkJoWjI0NDBiWmJrb1c5ZXVGM3FyTFNmN1dBTVRzd29ZN3gwcHl3ei9l?=
 =?utf-8?B?VGd6VFVPRVM4d2RXYjQvSlR2d3FSTkl5QjFIbDdwbmoraDBrZmF4YlU2OWZS?=
 =?utf-8?B?TlI5MXgvM2YwWGZlRVl1UHhjTmdDb3hKdzFVWHlWbTNzTzVmdVYzeVlRZWVX?=
 =?utf-8?B?NnJFSW9LK2h0aEFWbGRXa0RXL0F1UEJpWFpyUDRNVFdDVVBLeE1jM3JyWDUw?=
 =?utf-8?B?RWtaSWlrNGFIdnBnTk91WE05ZGtsYXRFWGRoM1NHajBaNTNlOFRuMXI1QjdS?=
 =?utf-8?B?aEx0b2ZYbno2U0pDeVJ6OHM5Rm0vbExhMVJwZzhHUnZBSThrS0RzazFRMTZk?=
 =?utf-8?B?MXpjbVRKcUNQMUVMSU1Mclc2RXE5bUpvZFRibEk5a3paYmdsZVdSeXdGZldU?=
 =?utf-8?B?R3FhSWJSK2VJNFErMytTdXpaMVRuZlRLSThuTG1NVGM1U0lvRnZhaTVadjJP?=
 =?utf-8?B?cDJZUExoY2tBYXltaHJhZmp1Q2R5aE0rSzRVbjE0NlI4SzQxc3F3bDJPYzVq?=
 =?utf-8?B?S3lVTTdOTDR4TFIrbVRFOXBNMWZsODZyclVvT2ZSZ1RWa1EyMVpJYVcvODRY?=
 =?utf-8?B?Y1Q0dkZueExzb04zWFZPaTd1V1pjN1BVZXNRcEpmK3Ezb1Y3djFyV3lHK2lC?=
 =?utf-8?B?UEZLVEpaL1AzblQ2MVFsQlRIRm83SktxVG5Bek5xQVZ5QU1aYTZ4QlJFcWl1?=
 =?utf-8?B?b3pEOFM4L2xCaUZZcHJqb0dxS1pHUG5vY0p5Vll2RjBRZG1FZjc1cXZlQ2Jt?=
 =?utf-8?B?c2tGczRNcFEvTTMxcmwyTXdWUDE5bFI5UWpvRG55S3B2U01EZXBnRm8yNFlP?=
 =?utf-8?B?a24vQ1ZjUDIrMjdrNEFLZjdvR05PUnhhS3NXNjJxWTdkQU5mNWlBZTZ4VlZ5?=
 =?utf-8?B?OFpIWFVjS1JlbUlPVUNFaVd3TTRFbndrQnlFZTkyZUNFeDNzQ2wvZTN4S3Zr?=
 =?utf-8?B?SU9NV0hyWk1yMmFCM3UwZlN1WGFkTTRYYnlxZGRIQmNtRkljY09oUzYvb0xx?=
 =?utf-8?B?WTczK1QxTFBjVDYvRDltbW1JTDdsNm1CbGIyVm05eDd0Nkh3L1lPT0xBM3Ju?=
 =?utf-8?B?eEYwTW53UUtKcDRXWFBpV1k4aXZyeGt3MDhHMnh6Umg0ZkhpTWljUHY2L3gw?=
 =?utf-8?B?djY1MTFCQ0ZHdXk3eFJHMDFpWW5WZkdlSjJjQTBwU2s5Y2tuNlN2ZnR3MUVs?=
 =?utf-8?B?TnMveFpUR1g3ZnlZSE50alRhQlRId0xjMWpFOE5ISmFlaTA3YXllb0RnUXh2?=
 =?utf-8?B?YmJTMnE2eWY1bzRrSUFrL1VKNTgxbnNqZG5GR0RNWFNXeVpiMVRBL2szMGp4?=
 =?utf-8?B?OUR0RHZkNUxud1lRWEJuZmQxNENSUnBwZkNNczRBNDIyRStJMlI4ZzBFM3lq?=
 =?utf-8?B?WVRsMUI5S0NrSVYvZG5ucjlXNzN1dTlLRzdMV3dLZ21VSGl6RXRtcW1TaWNz?=
 =?utf-8?B?NncwdGhITmpKR0R0d2JZWENYTnl2ZldqOWdjUmZ0RUJTMkNITDlqVFVYQllF?=
 =?utf-8?B?STRnSFZVRWF3VlUycXRtRm5qMHRvRzJrZ215YVFKbEhzMnBGS0s3UUl5V1Bt?=
 =?utf-8?B?ZVZ6Y2FqSjB0Tnk4SmNwdkpaWUhpN1kyR3paR1pXWjlWWU9mYWJVeXdIclNN?=
 =?utf-8?B?aCt1ZkJZUEdIT0U3d0VOa2owdDE0NW92QTcwb1JWZWxaQ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTY4dTRlUWZXZENmVXZqamxkNjFHWTIvditnbW1iZDZJM0hHaGJON3VOUjEv?=
 =?utf-8?B?ejJEOVBDQmF5Y05GNDV5cEJ6bmtlWFNQSno1VmRvZlZZT0w5MC9JQjlkdzBE?=
 =?utf-8?B?U2l4VUNzcG1wS2VIMGRvYlppK2s1bVc3VVNQYXhvVW1ydlo0VVVFOUhjSkp4?=
 =?utf-8?B?aURGZ0pFRFFyV1ZBN1V2cU9ZU1BjM1UzOFlVR0F5L1NxRVh1MGlNY3NDa3BC?=
 =?utf-8?B?YVM3TEZJYTB1d1Btd3R0eTlPeXY2ZEE3WE9uTS9vYjBhY296SDhCbTMrZjBo?=
 =?utf-8?B?ZDMwMTZyVmNkUjlNVDkxSmdQbjhkVDRTTzlFSXJ5WmFRQ3dsY0lnVzNKQWwy?=
 =?utf-8?B?Y0NFdit1QTN6NmhaRnVhQmVjWW95QXQ0RTJjMFhIUnB1Rk5UdlpmdjhLL0ww?=
 =?utf-8?B?elpDL1Y0d0pPYTBTa1ZnUFIybEV5WHVJQWtwOVAybzY2VkdEWXk0d2sxTHM0?=
 =?utf-8?B?U1J3alpxWVlaODV3clV1Y1U5Q0R1cy9kdVFnUGdlQ2VrV3FmY1RZNzN5Y2pI?=
 =?utf-8?B?bXV6ekFwamhsR2tUNVJQb3laZHdQK3NZNzFqeHdpVXlCZzVYdTVtSzJEbE9M?=
 =?utf-8?B?Q2Y1YWNzVjlaUHk1cG91Z3MwS0phakliS1J0eTFXY1J5K3M3QU16WG5HbzY1?=
 =?utf-8?B?Mmg1Wm9oSmM2RUo2Q2s2VDdlYURDeVVxd3lycUZvWkJCbWRvdzdpcldxZmdj?=
 =?utf-8?B?eFN3alFTU1l5ekFTaTRyN0IyMTN3V0tsNEtiUzVOQUlkamJVb1MrcWpZM3J2?=
 =?utf-8?B?NTl5Tm5tZXkyWXlvUWtSVzJtWHNmMXNOV1RCUG1KclA0Si9ZenRrVW5JQkQ2?=
 =?utf-8?B?TUJBQWZEQ05XQ3RnRi9tamJBZTdGL1g4ZEhCdldjaStzUVI1ZE95OHlOS3B0?=
 =?utf-8?B?UEdlWC93Witqd0t4YzhyRVRuZm9md2tnUitiSndvYlVObnhMc0IveldvK1JB?=
 =?utf-8?B?V1Ird3UxcVZXYmphM0kwQ3VTMzBnOWQ0akdLdjExdGdIUTQ0Q2VvUEJtOEgv?=
 =?utf-8?B?MllVRHR6TnM0Qm9VOTYrRHM2TnY2cURidmpzd2o0eGhoMUpRR25PQkMyNGFY?=
 =?utf-8?B?MTVBVWhscU1SRXM4RXJlU2F0aGhuSDhqVnkvWENsSzY5MUhJUEpXc1d6T3Bu?=
 =?utf-8?B?RTdGa0Rld0ZxVlB2djlTQktYWDVpVmdWSkxQWHJUWGR1VDRoWHRrVzFrNlVR?=
 =?utf-8?B?V0s3ZzBGRFJwUnp0a0lSa0ZZS1N6OU1VaUpyWldQWW43cnZGQTRvNTlKa2Zz?=
 =?utf-8?B?clR2NnlIdUJ0dmNrU3BZSHBMb1k5dmRlVEpPMFB2Ni8rdXJudktNVG53OHl6?=
 =?utf-8?B?WFg4aDZhVlUyb3ZuejAyQnhSZUhzNUFUSURsK2hhTDdKL3V1cHNoUmt1bEhu?=
 =?utf-8?B?VUdYRXRoVVNjb3ExS1lkNDNGc2pDUWFqZE1TVmZ3dEJ0MUxaMThxejJuOTla?=
 =?utf-8?B?YXE3T2RvbmRvMHU3MnpQN2FzcENMWHZIMVZHWVRnejEzUGg5Q0Z6U3hySm95?=
 =?utf-8?B?dkphUUxVTlN0Nk1RdjdqY0dwOWhXZXFadS9IZy9GZzhGTUtLaXB4OHdkRnhk?=
 =?utf-8?B?UlUvY1VEOXRyVHpMTDVTSXgxSlJBdW1tWXBYTlhZSmh1Y0NuVXpqV0N5NTVG?=
 =?utf-8?B?cjRnTFJiY3crRkNmQ2t2MGdnV2ptTDFDNWVseTBmbFhlMU1UTmdVNXV4bjcz?=
 =?utf-8?B?UmhGWVpPMXhwSUMybTZlQUlCU09PaEJ1R096ZjlTNWxvWktkaXB2ZDUwK1d2?=
 =?utf-8?B?VndXemd5M1JWNENzd3RVU1RiWW1pNEVxcXk5U2dZWmdVczhjRXBJcXgwREZJ?=
 =?utf-8?B?TksydmdLQVZFbkkzcmc4TG9MaHlobkRNSjdQOC9ja00xK2VpV0lkczZ6K2ZE?=
 =?utf-8?B?UTlsWTBPakpNdnFHMXZSTE9uM21mNDdySVVZWVo2MjRtMG1OR2JTRnhsU1Vp?=
 =?utf-8?B?SE9DMktxQVAzZ1ZRNlo0bXlMWGVCaU1KZmp5bEV0bVl2S25YVWtBUGVxaE1I?=
 =?utf-8?B?OVhYbTcyaU1wM293TkR1SUpRZXN3Nm5mdC9yU2Z3ZkhwMUhnem5TL0sxT2lO?=
 =?utf-8?B?eDFadEVtZmdIOW9GdFNEOHhZUlROdURNVjFuWEVHcXd3cEt2UjJnK25lRUc2?=
 =?utf-8?B?M0h2TVQzdm1ldFFXQkl3RW44Yllqb2tPUHp3VVhlSjh4R3M5MTFvRDZzcEtO?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b2af74-f356-4e3d-62e7-08dd1eb3385e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:55:25.1188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNcHUJJDf5RCwtjcqrIAmsXR+FDpxU1+sM0SV18Y+/6YbE5KFRQFYUDOvBaJkw/7eprIuMORKkpQF4rcBgzFA2jP0r2jQx+VbxkUeMdb3GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_075531_629451_265293D7 
X-CRM114-Status: GOOD (  12.73  )
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

Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
new file mode 100644
index 000000000000..ef7b14ca6879
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Video Capture (VICAP)
+
+maintainers:
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
+  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
+  the data from camera sensors, video decoders, or other companion ICs and
+  transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-vicap
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: DCLK
+      - description: ICLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: dclk
+      - const: iclk
+
+  rockchip,cif-clk-delaynum:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+    description:
+      Delay the DVP path clock input to align the sampling phase, only valid
+      in dual edge sampling mode.
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ARST
+      - description: HRST
+      - description: DRST
+      - description: PRST
+      - description: IRST
+
+  reset-names:
+    items:
+      - const: arst
+      - const: hrst
+      - const: drst
+      - const: prst
+      - const: irst
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to general register file used for video input block control.
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: input port on the parallel interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+            required:
+              - bus-type
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vicap: video-capture@fdfe0000 {
+            compatible = "rockchip,rk3568-vicap";
+            reg = <0x0 0xfdfe0000 0x0 0x200>;
+            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+            assigned-clocks = <&cru DCLK_VICAP>;
+            assigned-clock-rates = <300000000>;
+            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+            clock-names = "aclk", "hclk", "dclk", "iclk";
+            iommus = <&vicap_mmu>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+                     <&cru SRST_I_VICAP>;
+            reset-names = "arst", "hrst", "drst", "prst", "irst";
+            rockchip,grf = <&grf>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                vicap_dvp: port@0 {
+                    reg = <0>;
+
+                    vicap_dvp_input: endpoint {
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                        bus-width = <16>;
+                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+                        remote-endpoint = <&it6801_output>;
+                    };
+                };
+
+                vicap_mipi: port@1 {
+                    reg = <1>;
+                };
+            };
+        };
+
+        vicap_mmu: iommu@fdfe0800 {
+            compatible = "rockchip,rk3568-iommu";
+            reg = <0x0 0xfdfe0800 0x0 0x100>;
+            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+            clock-names = "aclk", "iface";
+            #iommu-cells = <0>;
+            power-domains = <&power RK3568_PD_VI>;
+            rockchip,disable-mmu-reset;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1138c8858bc7..8dbeb2927a08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20223,6 +20223,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>

-- 
2.34.1


