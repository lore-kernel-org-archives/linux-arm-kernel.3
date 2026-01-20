Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3D7D2629E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ApFDKJ+DF3xD2Y8YQ56x++eEpgO28hEQtUQ3ZK4ZZ98=; b=vw4W4dxaWuPR4rtFlGjsU+ZzJq
	SKGgHL593Y66BQi3UKxmD48z9JzqKSZY9G5zvvvOJl0X8CM47Ax62mp/I0QxKQA/wsae6MAOkIYwZ
	oj5xXwemaFrLGfy2arFyavCwrrFDP/0jp1MsVvEfWphNyEOxF21mdNkIrBYvoMin39qV+/s428kfu
	UQNbYDU52P3CEdAkHI+11xEcr7KTh/hlLMQ/aPQ8ENBQApSgkMQSAw2dhXhrNXIjo05wtZ4YGQQyb
	MZDvV+DuyjvfL5fX9RRz3NLRQmHMEVE3d6qAijrnEZ5vYRkHrS3WSS7nFosdr08OQcEZ1x7d2YdRh
	7rXCGkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIQv-00000004RVG-1agL;
	Tue, 20 Jan 2026 20:34:37 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIQs-00000004RUt-3LCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJM2sah5xHR8StJ77wrvDLM8m2jvPU3JZwsuCZ81o1cu0Zi+ajK6Pnsc+cE87V3x8WAC7y99YyByvq9gSPgWERTR0SQfIuCbmyhXQVzeYXBOO6aidJa7quTSuVP7bkQWPyav8fgRMjtMx4fgZLvAeaWTtXxiqTAvG3t4S9/z5spWA+djalKKDDn8hxsYRHLJGQVs0XP+W3ZLE5hUFDTWJExwoNdqHSeil3R/mfWZkhvEImB2fzTUfkvfsZgr0imqjOtchjL/PiGYfAi+OEuciLjmnQAWlYqCcOzdN5tDF3JIKjUbOwkZIZfS+1mdHtnX1KBwufsFeZi4DFEhk58AMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApFDKJ+DF3xD2Y8YQ56x++eEpgO28hEQtUQ3ZK4ZZ98=;
 b=HbH6fs4Lv6pq3imkUkd6wzwlr/JnxkY4Lq7UC8GgDM26Cfex+CuKdUhPKP1mmGtepOlnhw3dHVyu1RdIDrB/BLtaCmYsYx1cTLh9ZmDjubnLLtOG8Tf/E/Dgkku11MPsdfG22VE0AP45fGGQF8Lf8kHFJPFFjBifnJsNQkRA6JyMJfGMPVji2lVDFAU7mqwkbh+eEvGKicr9023RieSirQmiWmKqESZA9RpEwZm86Wah2rFaBXsr5EppWXRGSqV2sFN0iXzZRHYIQZpTI8JbN0Plf0lKSdijepnCylPqdKRaZSCR3IFvdsF0reNIXCAl5FRyPxC7OTOSAuLKKB6hYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApFDKJ+DF3xD2Y8YQ56x++eEpgO28hEQtUQ3ZK4ZZ98=;
 b=Kloi4UtlqEeP/UGcSkpgalPMriremhPdq6bXJ1qT9UHEChdBP2w3k3JYE10s0HWXMCp0ZxaCT7OnmZD1WhAXJNVy8s3BMoWGo2SdZpqXDgve1K66HUGJUCmUSHPDXntFDpEj+PMtNV/G/yJ0jacKSH/iD8fzyzk2X7veq9cGjuFmUl2iRSTYBUoD6EZ3vP93fSD3SoADUz7wHCll+nsg8k4Z6xBvFIfQeW+g/XZP7zkAwHILCQD0wBa7rTNFSH/0UIT0Fcv5nsy07KpOBEwc/1dy5BELwWbK3RZWmVW+uvhLXsGm96cqlpYdSUe+XhyjQWdwkG3Wh/2I83WpHaFwGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by SA5PPF8DEAB7A29.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 20:34:28 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 20:34:27 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 20 Jan 2026 12:34:14 -0800
Subject: [PATCH v4] ARM: dts: aspeed: add an alt 128M flash layout
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-alt-128-v4-1-0e5c491a532c@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAMbmb2kC/2WOyw7CIBBFf8WwFjOMrYAr/8O4mBZqSbQopUTT9
 N9F4zNmVndyz8kdWW+Dsz1bz0YWbHK9810OxXzG6pa6veXO5MwQsBQoFKdD5AIVFxolGKULJZH
 l9inYxl0epu0u5yb4I49tsPTNizd/oKsfIk+C5wNoSmmwqgvadMkZR4vaH5/aYM9D3hU/7tb10
 YfrY3TC+/d/X0IOWVxoTVBJW+lv8V2Sli9wBQLhAy4zSEpUhpoagOQPOE3TDTd8KsY0AQAA
X-Change-ID: 20251218-alt-128-19270d894872
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Marc Olberding <molberding@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768941266; l=4439;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=VskPOMBFlzZnRQWxmRCT9e+tBXNlEm8FEds/ZMTH48s=;
 b=aUuBy+v0k+Ki2I7cRSgujbScVzXNLHUoogbYhxSgt5dKuegjwbPSowRMbpgnCtbXRTu7Bu1XX
 NdACQ+TTn3ECuZGbhUPlTFe027Rm6yUkFKytodoHQosC7FjUJJ4OH7/
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::25) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: c3740a9a-b48b-4880-9e0f-08de58634e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU5wM0p0eCt0eG16ZW00bVNuOVVMM2pkZStzMUI5ZDlNNHdSUUZLKzV2eWp5?=
 =?utf-8?B?TXFhN0V5NG00cVRtL3ZKU1dWZVJMUnM1R1NkeUNVQzExcDlGZUw3Z0hCcGFO?=
 =?utf-8?B?UkU0V0g4SmdvckJxT1MvWVRORjRlV0NBVDhMNlg3V056N1dhUWFpWkJSTDlI?=
 =?utf-8?B?TkswN0lHOXJYaWhHc24zcFQ0OG5ZNFF2azBPeEI1NzQxQ291cjZQaU1ReXB0?=
 =?utf-8?B?TXZXZDRYZHJlaE5PL2twbG5vMzFlYkVPTWVaa21iM2FJZmVtaXpQT2R3QkQ0?=
 =?utf-8?B?YWo2ZjFDNzkyNzQyWU5oWGVXcEt5M1FTY2NZUS9YYjlwNXBZYTMvV2dMUUJ1?=
 =?utf-8?B?U3BGOVNQa0hLa0hVSFZzbWRlUHZmRnYvYlpkMXVueFlXeHYyTUtuTm5OT1Ra?=
 =?utf-8?B?Ymc2c0RqNEM1cTF4SGZNdFc2WWF5SGRzclpxRzNEbklqMXNGRDRSMm9wYUsv?=
 =?utf-8?B?TVBsRmlyRWdPYzlVNEh1ZStnd3NpT1YxMmNWUHBEM0daZlhvN1ZBR3dySnJs?=
 =?utf-8?B?MUtoL1cxeHRZaFVaYVlIL2FOSnkwVFlmd2hTSzJLWFJJSFJZaWtWdlBHUGpH?=
 =?utf-8?B?YUsyWTdtVTI0OWsyam1FUWVZS1ZJeWVwT2lPWktIdkUxN0NjSk9lQTFqVGdk?=
 =?utf-8?B?V0lzMjBQZUJLYmsvQWl0cHAxanVQWHptSDlnQzBhK3pGR1pDaGRVVTVGcmdt?=
 =?utf-8?B?OXBKWWNBZUxXZ1d3bU80OHJEZ0VqSUhra1RhNW5vVHdHMGk3b0FBOERlK1R3?=
 =?utf-8?B?YitldXFGRUdrL1RoMTlWVzc5T3RXSktmK0xRU2hxVUp1RlkvMWQ2QzBLMFN2?=
 =?utf-8?B?WlBTTTVOWVJ1OXlBMzVDazg0VDZFaTA2K1Z0U2Ywc3BnV1p4ZDEzWWFadElr?=
 =?utf-8?B?MjhZdWV1cElXRzFkNTZBR2JtSW1RZklkdlBmN2RyRVBBTnJaNDM5QXk2d3Na?=
 =?utf-8?B?M3JxNThSVDhYbzlnM2Nack9oUGsySGlPYktLa0N1TmF1UDRUZ0pPNlFDd2FS?=
 =?utf-8?B?MlhudWs0cEpHaGpKUWpLRWthRnZUSU56QjdXZFk4VUJyRjRCdUg3QmtFK1Vl?=
 =?utf-8?B?elhNV3RIaFo0SHpoa0JraWI3ei96VTliSm1zekhxMys4RyswR0FvQ3dQazhz?=
 =?utf-8?B?aUxRYXBrdnVjckJNWTBzSVgzVnhwaVBGTUdLZFJEYjYwK3VvTU8wMDZpYmtu?=
 =?utf-8?B?djlyaXY4NTk4SU42N3QzaFJRSXpOQ3JqMW91aWxick43dzd3YXNTcERIZWUr?=
 =?utf-8?B?OTN3cHQ3cTFOWGJjdjAxRVBaaWhYTU9PUW1VNkcrYWZUek0xT0Q2ZFREZ2Nm?=
 =?utf-8?B?SGxpQzk1ZGhUUyt4eVhPSUtxUjJOQStMMmRBbm9iK2cvd3MwK0hmOEZuRlhJ?=
 =?utf-8?B?WGpNQTY0dzYwaGZRYTR2bDFDS3UyVGl6S20vWWt4K05zb0tVMlFFeWoySkor?=
 =?utf-8?B?dEZhOWZCcXUwcHk3YmNPQTJnRTYwcVY0RC9tNW5ZNmJ0WjVkQVZPd2JBd0do?=
 =?utf-8?B?d3k0aDQ5M2trYVgrbFdrUkxwQ0VCL2MzUjZEZ08xbThzSzFqTnFTS3h4TWRy?=
 =?utf-8?B?MnZmNFZhclFjRXB2R3JKV3FMaFdmNHdQcysrWDQwNzErMUdnOHhidnp6d0h2?=
 =?utf-8?B?Szg4QTFZRGdzTGdmK3lYSEI0L2tRa3V6K2R6WlRyTTY4Rk5xWURkSEpGcWIx?=
 =?utf-8?B?SWFiN2QrSS84S3J1NHIyY0Zlb1hpaDZkcDFyVFRVb0Fnd3ZRek5XeFloWnZz?=
 =?utf-8?B?d0Y4cUZ5cVFORGtOUktYRmtSeFNVdjQ5RXE5TUVWaWVEUU1iU0xFeUo0M01u?=
 =?utf-8?B?eG5aT0lFNXRjai85WGx3Q3RKYTU2U0N4TWdoVVRBUTljY0s0NnFDSGFtMkov?=
 =?utf-8?B?cXVPbStTU0NkUDdtdEpENVNNcU9sMGxGTjBGdkxYMjViZ3d2eHU2bDBqUHQ1?=
 =?utf-8?B?YkdWQ0YxWU1hOU9qUjNEcUppb3l6dWl6T0JlSW5TYVdqNmRvaGo5SktPWEV4?=
 =?utf-8?B?REc0YWxnWlh0SW1tVkYrTHVHYzM2cFdUa3BpTXhKeVl0M3h3YTBUeERVd2hx?=
 =?utf-8?B?MTRSRFRlUUF6ZVU0dUU4VUxHeXVBNitsdWdpRXlFaitKZHRQTlR5OUVzRy95?=
 =?utf-8?Q?TyK0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTJMMHNmMnQ4aFhPajlWRmg4bU5qaDNVWUdraFl2ZXRMbGRNTXZWTDltbEhr?=
 =?utf-8?B?OXp1TnhSWjQyOE1JSXgrNFhjT2V2bXlCMGZXTjdnVlh0RktqY3dseWQzNTVB?=
 =?utf-8?B?bGFqM0xtL0dYL3FZSmJwcENRZmFtMnVMeGUvSlpsWk5pS3BxL2pFRzFGckRL?=
 =?utf-8?B?ZENzQkJ2MEFNZzZYdVlLQUFuNlJqZGphcHZhZTlwMEVwRmNxajQwc0FZamRM?=
 =?utf-8?B?bzdlMWhaRGRKaGJwU29tNmE3cWFSM3Z3UFh6T29RWWZ6VVRTN0ZIaFNlT3hi?=
 =?utf-8?B?Y3A5QkZzYmhSTlkxM1ZpZmxESFlLejJudTlLNmZlMFZoS3d3Vmw5ODlSS2Rl?=
 =?utf-8?B?WFEwQmhMMHJqc2RIUUZ5VjRIQlo3VW9ueWRLem9oMGpFa3NuUnErYlF0WW1r?=
 =?utf-8?B?Wko3Y3ZBSmZheVVuUGw1UjBUKzRzdmRNb0lzN1NVTG1OUUI5eUFQbWxFZGg5?=
 =?utf-8?B?YkloemUxZnFEUVA1dXN2MUZhaUpJVWxlYUdNRm44L3lpLy9OWE5BUzVMU2Vq?=
 =?utf-8?B?dUYxSVR3QkYzQm1JWi90bFRjakkybUxMZ2YwRzJCVHl0K3ZlMkpybGozR3Jm?=
 =?utf-8?B?WmNIZW13OGlFY3BXZVlLTnp0ejZXWWV1MWQraUlZWWlJa0V1NytHb05sT1BC?=
 =?utf-8?B?enB6UTZzYldoWm9tRmVHaEo3Vk1lU2pqMnZTVUhxTGtEclpDbEhoaFdreHN6?=
 =?utf-8?B?SjdVZEtrMmd6YkM3NTlTMDJhMU53aDErQkVnOXd1bXBOUGZqRWNpdjZZOGxh?=
 =?utf-8?B?cDM1aStaT1IvZjBRcUlXZTE5SmkyVUhGUmxIWk9uZ25aZC9TcVpHRVJEMUcr?=
 =?utf-8?B?YlVZNmkwM0Ixa25ySktvWVBNeEhvQlVMUDhTV2RGbm14c0k4b0xoRElWaUUv?=
 =?utf-8?B?T3NhSmx2SXJLTEdjRHRlcFptN3B2aStwNFNWR0wwUXZtUTF4K0hSTHlvUS9r?=
 =?utf-8?B?cm9zaFZJaURpMjFaZXdVQ3Q4TTZxOTc2ODZtY3pGZ1dmekt6bE1rQm1KWUl3?=
 =?utf-8?B?OEV4QWtYdDJLMTNwY1ZTSWdWK1pTTTJSMUdDWUNqakhYTnFyM0dNSXRTS1pN?=
 =?utf-8?B?MW5OZFBnR2t6Yko0ZUhTSzcvQk9TSTloVDFrRWxvdUZVQkFPZVFWWnZPSWd3?=
 =?utf-8?B?eG1GQzRDZXdaT3VFTjhqeFVxSS95YVZVU3ZVOU9nVU9XRy9IZm84TVNvNm9a?=
 =?utf-8?B?YUwxeWlJK2pDVFdTRmwxU3hNQXpKbHc1NEtYdGlLSGhhZ1E0YlNaOXQyaWVs?=
 =?utf-8?B?dHdQSEppOW0vN1V0bWd5VWx3cmtBZWtLNVNBWm9CbThZQ29vREtWd2FsOUhR?=
 =?utf-8?B?VGVoWTRiRVEwTC9URlovM1F0dEc2ZFU3YTA5ZEdqZW93K1BLdGFoVVFuL3k3?=
 =?utf-8?B?aFBldUd2SUJ4MlFzeEZoY3lpTjJGZGxhODNBWGVWdWNCZVJZOVg2VTBzdlh3?=
 =?utf-8?B?MU5nTUZ2akE1OTYzU2JSbFduMERxcE5VOXpxM2NtRXFMb0ZuWStZcUUyYno3?=
 =?utf-8?B?YUgxdWp4MWJQWFVaVThjUW9acURwRU1RV3cwQTlpbFg1TlJtRXFud09VNzBx?=
 =?utf-8?B?K2wyd0orWjhzREpJaDdieWhDd2FjSjRDQUNrQThSNzE2MWVJL2VqK3NkVjdQ?=
 =?utf-8?B?cFlad0lVcmVHMUdKWENIclBjeTY3ZjBURnBDZ0lNMGpUbVNXSGdiaENna29N?=
 =?utf-8?B?eFJxYlF1WXEybTZjVHFDZUpZU01IN1h6dVc1V1M4b1VNcVhwdFN1TWRpQXRv?=
 =?utf-8?B?ampiOTViSzJBZjBzNVVBQjJZZ2lxdndtekNwUlQzRytkZ0xVSEsvMmlWbTcz?=
 =?utf-8?B?MDU1ajhrTmZPTmROekY2bEgrdXpsTkp5VjRhUE9sMDJZSzBQRlpLSTJLeVdX?=
 =?utf-8?B?RVlveTdjb3VKc0g4S0xiYTBhN2w1TS9hLzIwY3o2WWFLNkRYL1pWY1prZDI0?=
 =?utf-8?B?dXBISGRKc2NzSURYVkkyNEsvK0tEdmp3TnE1K2psZHBBWDN3cnZ1VTNzWGlH?=
 =?utf-8?B?TkFhSWxUYXg4T0Nac25Id0NQMlo1dXR2R21IS1oxNjlKUGEyNmNrdzhnbDAz?=
 =?utf-8?B?VU5zRVZtci9zWkdDbmltMCsydGpadGVBdlI4VW1hSml4b3lYajVCWjd6RXAy?=
 =?utf-8?B?UHJ1aHFMTzFHUzJvWmlMWFV4NVFIK25tRGdITDc4RC9OUnk1VmQxYUozU0cv?=
 =?utf-8?B?cnZnMHp3YXpFeHFKTXdiK1JVWUpHZ0FNNEw4ZWloQ3BLbVMvVnB5WnZGRlZz?=
 =?utf-8?B?dU9ZcVhLSTZMTFdHTnI1Q1htT2loT0dMQ0oyOFNnZnB3YlVObndwaFd3eWFu?=
 =?utf-8?B?TmhZcmZIbWlqSS9XcmFpQXZ1K2JaUHFYVFBpTDdDcUdwdWFteWZ3dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3740a9a-b48b-4880-9e0f-08de58634e98
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:34:27.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlIxt2aemvf3FAZsaMl8rmdntmJ6DVKpKL9QYmKBxn9GdxsCAXz3OHT3ff5p4Wa5PcrA9ylihfNG9c3Die09Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_123434_871454_8ACE9CAD 
X-CRM114-Status: GOOD (  20.20  )
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

Add a 128M layout for the BMC flash chip we didn't boot from. Including
this allows the user to write to each partition on the alternate spi
chip. This dtsi follows the existing standard of using the same layout
as non alt version and prepending `alt` to each partition's name.

This patch also adds this alt spi flash layout to
aspeed-bmc-nvidia-msx4-bmc.dts

Tested by running on target and catting sysfs nodes
    for devdir in /sys/class/mtd/mtd*; do
         [[ -d $devdir && -r $devdir/name ]] || continue
         name=$(<"$devdir/name")
         [[ $name == alt* ]] || continue

         size=$(<"$devdir/size")
         offset=0
         [[ -r $devdir/offset ]] && offset=$(<"$devdir/offset")

         dev=$(basename "$devdir")
         printf "%s name=%s offset=0x%X size=0x%X\n" "$dev" "$name" \
            "$offset" "$size"
    done

    mtd10 name=alt-rofs offset=0xA00000 size=0x5600000
    mtd11 name=alt-rwfs offset=0x6000000 size=0x2000000
    mtd7 name=alt-u-boot offset=0x0 size=0xE0000
    mtd8 name=alt-u-boot-env offset=0xE0000 size=0x20000
    mtd9 name=alt-kernel offset=0x100000 size=0x900000

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
Add a layout for an alternate 128M flash layout. This is useful for the
aspeed ast2500[2] and ast2600[1] SoCs, where it has the ability to boot
from one of two spi chips, nominally the primary and backup SPIs. Adding
a layout allows userspace to flash the alternate spi by partition and
switch over to it, allowing lower downtime for firmware flash, or for
updating the primary flash from the golden backup flash. This is already
an established scheme for the 32M and 64M layouts, where the layout is
the same but each partition has `alt` prepended to its name. This allows
userspace to just prepend alt to the images in the update process to
specify which flash chip to update. This series also adds support for
the msx4 to use this layout.

References:

[1] https://www.aspeedtech.com/server_ast2600/
[2] https://www.aspeedtech.com/server_ast2500/
---
Changes in v4:
- Cut out unnecessary testing details
- Squashed patchset down to one patch.
- Link to v3: https://lore.kernel.org/r/20260120-alt-128-v3-0-a81bdafc00a7@nvidia.com

Changes in v3:
- Reworded commit adding alt flash layout and fixed formatting issues
- Expanded testing section 
- Readded the Changes in v2 section, somehow they got lost
- Link to v2: https://lore.kernel.org/r/20251218-alt-128-v2-0-10499a0b7eb9@nvidia.com

Changes in v2:
- Retargetted series for the bmc tree
- Added a usage of the dtsi in the MSX4 device tree
- Link to v1: https://lore.kernel.org/all/20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com/
---
 .../boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts |  1 +
 .../dts/aspeed/openbmc-flash-layout-128-alt.dtsi   | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
index 44f95a3986cb..a12d4164de4a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
@@ -67,6 +67,7 @@ flash@1 {
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
 		status = "okay";
+		#include "openbmc-flash-layout-128-alt.dtsi"
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi b/arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi
new file mode 100644
index 000000000000..08ce2eab472c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0xe0000>; // 896KB
+		label = "alt-u-boot";
+	};
+
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x20000>; // 128KB
+		label = "alt-u-boot-env";
+	};
+
+	kernel@100000 {
+		reg = <0x100000 0x900000>; // 9MB
+		label = "alt-kernel";
+	};
+
+	rofs@a00000 {
+		reg = <0xa00000 0x5600000>; // 86MB
+		label = "alt-rofs";
+	};
+
+	rwfs@6000000 {
+		reg = <0x6000000 0x2000000>; // 32MB
+		label = "alt-rwfs";
+	};
+};

---
base-commit: 459a5aa171c0f13fcd78faa9594dc4aa5a95770b
change-id: 20251218-alt-128-19270d894872

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


