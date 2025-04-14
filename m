Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DF7C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqFvcCRVkNjL1DXRoG9nvtjK9q1aouH/vJtmLYrjJy8=; b=meg7teIXo3aD/RP53kwwZly4T4
	z4qR4yczgLvbngHGJm4M2yLhIMCO5E8HUj4DTwpYdE2ULADfQ1yQxm1xb2ZMaJkJYEXSida5CaWly
	TRe+TOeFvRh3YhBW+h6ijwFTFk8t0PaxF9jn5iAWrMYxa31y0M00Qiy4gIWBEwRSCAfIxJC1bl7Re
	/RpS+2kyRbFbNd+bTeW6znmRIWFhn8AmIyZ1GY488eX7BYlay4y7Rt6L0xhuHeTvX5H2kSqC4+HHK
	2BOMEFpi/J9tDMIjpFz7XckPfh8e/a4BJButVjgYLMal1QNvOU0AZm3LUS1a9PFyVup+eil1TbpOU
	LYyPpS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OqZ-00000003AHZ-0LW9;
	Mon, 14 Apr 2025 18:47:55 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Oar-000000036rD-0KfB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 18:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWq50Gx2v4ceURt3imtQwKV6gaEzGOj+NvVdT5m6u8q4PiGpQT91ha56TCuKnkeSpTdpKQ1QDitYygVwwQKHaA9IMON8jYcMGFZxeJrYGpeZXrnSjlYNyUsvYezl7eyt8s0311PxbUn0bCoU8tBBasWuBaVzXKA4aqwuieozoVwZNIZbhhIK5QvoxBcPVlUqQPyNkYgGi7vak5wzXvU2Ma/BhPzPclRtrsm8cWXiMoYZA+mCiuqBoXceGDCNzbDgNviO/TQiYH85nujF2rc5esYFVb5SJYLHg4zcAJblWy6augoXu/tXRfY223lA0dbK9uLPzFLkxPznYaQ5NcKpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqFvcCRVkNjL1DXRoG9nvtjK9q1aouH/vJtmLYrjJy8=;
 b=CW4ITh3mdI32sCgqaGAHnCQDnruLmjEKERTk7yPgcK/8xxK2mqeMu3VIjBUnnkKni4gr/TWNEf+lfJtXIMMzgtkAAuIwu6SAiF9+lD26I0laA+5HRvLP9L6P1rthVZyTQG5rGHM4nJvRoPIR4jlZRoxna/Emw7mcmb5Z+Z0Eli7AqrFnBCP8lVljY5bf/3fpmJr2O21xxot8dz7VHVIl9MowUCMKJgYzPHWHUKLQPm8gA+8fn1jrTPDv6BCZCOfKqjmHWMDNtH8FZbN2rDQWFUPPAr0ghr0nksu6sAb6VdvTrPu9Lyw+cHj8HFuOxgDSok6jAWOQbEsXdE324P7WYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqFvcCRVkNjL1DXRoG9nvtjK9q1aouH/vJtmLYrjJy8=;
 b=k+eVNDOKIMaUgr6ImKK4pwCEF+4KKTZccRMaAM1h9rAp4XS+4tqIYGZYO/OGmtqX+ifwYk0cJlJ2n8afVLleAUN6Z1nDlu1wylBzb2hfy/Jprd+b+AX80+ey7wAWUSdiM3vofMSfv/4VJiDercCg/Q+AuhPlkoHQ768W2dmKGVmws4rXj1WJlSsQFUYFsDml96sj1YF7oiDG+WMJzB8OLLvc+X51XJHUl1aPuoBLIZ9/lRWq2Q02o+T0mxgXW+14HJUJLZRwv7p/UDUpVfYMBETyaT4M1vdcTNyQ7DPFxKsdBMqOBOEsv6wrxRfi8OExdG7vyPBKOidrSdwLWm5XGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10245.eurprd04.prod.outlook.com (2603:10a6:150:1bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 18:31:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 18:31:37 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 14 Apr 2025 14:30:58 -0400
Subject: [PATCH v18 04/15] dt-bindings: PCI: pci-ep: Add support for
 iommu-map and msi-map
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-ep-msi-v18-4-f69b49917464@nxp.com>
References: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
In-Reply-To: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744655465; l=4533;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DICYXBAwY6+u/JnFgOyQ63yT+g3nHSDoM8gnluX1F38=;
 b=cMqoO0DB3vUMnMnxEnoUyMJIbe2ztPJfIJbuPaYC0B1rm15/aESG9ZqyU7+ioL1F++ozn4o0W
 f9uZ6PrwCwMCoPZb1aGzioxU+5qwEgtw28D+lhyAEUwUSNfssKbHM2L
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:510:324::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10245:EE_
X-MS-Office365-Filtering-Correlation-Id: 180b9db7-889e-4e6b-9e3d-08dd7b829751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFdCK2lCeVRMb1N4UUJSYzIyZlQ3ZHVXS21QY2RudGI4UmZ4WWRCNzJkcXZM?=
 =?utf-8?B?b3ZYRjNqdDVDeVNiNlFEbDdmdkNNVCt4SlcxR1g1V0gwelFWTGNXZ1FyUE41?=
 =?utf-8?B?aUw2VWFhLzRuRG1ZSkVsZGgyRzRjMFd1SkFQVXJXYVZuak5iL0lhWFhKbHVF?=
 =?utf-8?B?VGFVUVQxQ1hnTVZ4VFh4dDJJWCtjK25melBLWjF2YkhmSGlFVkxYWUNIazh5?=
 =?utf-8?B?SUZDSlV6U05xQ2RpNU5yRVhkRXRpZUNKRnNzZ0c1QVQwSlgzZmdyUW44U25u?=
 =?utf-8?B?dE5JcVlMdXY5ZDJTMWtRTitwbmtzeWlxOTQ1d3lhamRGQlZmS2xIUWhPTVV3?=
 =?utf-8?B?MWxSUUdTQ0s1bUYraHdZcTkrM1MxNEhTY0JTeHZvU1lFSVN0SUtXbnljcHBx?=
 =?utf-8?B?V2NuY0t2YmpiaWZqUkRrRDcyaEdob0x4YW5Ib21mVTU0U1hSd3NWeWYwdEph?=
 =?utf-8?B?NnFwT1prcGxhQXFNZm4ya3FhZFJHM3hDME0xZzd5RnlCTWhPNC9iTi9CSVp4?=
 =?utf-8?B?MXArdW1VcEJNUTRVUFBtaVJ5c1RpMHZDN0V0dHV4SjEyYTZzU0hKV0c2T29E?=
 =?utf-8?B?aHU0bE9rTWJlUTNHOG5POFd1RU5DYTlwcFQ3NFFSekl1UTdHUGVPRU1MOHQy?=
 =?utf-8?B?S2tSdkhhRVFsbHM1MHMxaXFZQjZLWjBKZU44SXI3ajd1MkJZOFZER0RISEIv?=
 =?utf-8?B?bmNmcEFOTWRISFRmN0JzTXJkWm0rWlc0SUJOMlY3UHEyL3hkcjlLem9UcG9m?=
 =?utf-8?B?Y1lveXU0TkRsbUF3SXJSemxxM3VPM1RUSHRlVzdGMjRGMFFlS3A0NW51N2xX?=
 =?utf-8?B?VzJJVzJRM1BYWEVWbXNhenVlT2hRdzU2YjFNcGFvclZlc3V2NVVMQlNuRVJq?=
 =?utf-8?B?YmxnbHRDemp2VG1IbXFOZ2huSFA3R0JDYm1qb0x2TnNuSVNodjBSZVJzSGgv?=
 =?utf-8?B?bHArbkRrajJFWDlhR01CZ3VSSGEwR2c3N0VMNHZIYjlVZkZ2c3RHM0hmUHMv?=
 =?utf-8?B?T1ppai9xZVRXWEI4SkhVYnZuTXdSNnZkVU1lV1NBZ3dWY1RPUDVHMTh3RXdH?=
 =?utf-8?B?UHdocmZVRjBaTkpMMnBmekh1K2hLZTc5TjBPdnFocUo2QUIwRE91TG1EY2F1?=
 =?utf-8?B?ak1jOTRjOEk3d040bmU2QkM0K0pJWnZGNnBtV0Z2dktIVWY4a3pVOGRjUDlV?=
 =?utf-8?B?UWtzQlIxaVlCWE15VGo1TmdmTEs2OFRFVzZTSDFzcTRlQmVpOVgxU0Q1dzgy?=
 =?utf-8?B?ekpjWmFWYW5UM1M5eEpsa0Nid28wRnE4NGNIWDh0YlVtcDF2bzhCWE1kT0Jo?=
 =?utf-8?B?a01hdnNBWm9pVFVBczErZGR4bjQ0UWNrZ2RsNEdReVdVTDg5VDVYaUFxMWhI?=
 =?utf-8?B?TEVJcHNHTzNNOEp5OGpWQU11RDhSVkljNkd1K1lPLzlUMTNJY1J3NGJubDdh?=
 =?utf-8?B?ODJ1UCsyeXBhdnlNS1NDTFpkRHVFek9LK1Z4K2FvZUgzVlZpNEdUWFdDTU41?=
 =?utf-8?B?RUwwcmNlcG1BVm1SajlMaTlEUGwyaytRWXJhT3YxcjEybmJzN0ZwRkREQ3dM?=
 =?utf-8?B?RERhdWZwRWJmSDRXQVM1a1NOY0VPMWh3aXRTZzVRUkNWQjJHR2s2TTZ6QjE3?=
 =?utf-8?B?T3BORHl5aWsrbnRWc2FMb2laZ3gvYSt5RWJnclVHa1VhT0l6VlVjcVNuWE5G?=
 =?utf-8?B?ay9rRE0xV1A4bkZkUXlpMTF6aDNZcTYzRXhMaUZsRy8wNThwVE1KSFRBMkdp?=
 =?utf-8?B?bnJzeDFmMndvTnp4S1VsS1BCL3lHUGZTYmtMNG9IOCttMVJ0Z0g5ejR6emlP?=
 =?utf-8?B?RGxKSUYyMk0vK01Cak5UaXpLQ3dQVllaKytmdEhjV09FazJIK0kxRzBISXFj?=
 =?utf-8?B?Sjc2UUVTK3crY3BkUnhwYWthYVpQUFhVMy9jWFM2OURTd2NLajY2TStCSTJx?=
 =?utf-8?B?ZEhKREFTclNaNDM3MzhZc2RRN3hJOUZWK1dzcEFEQ2lFa2RqUXgzTVRick1j?=
 =?utf-8?Q?ctPW/zjJburp1wV+mWQcZ1zdaVrv7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bktUaVJKWW9KV2h2YTVCVHNmSzhVM3pQK012c1I3OTY2WXJOU1lyZGlvelNQ?=
 =?utf-8?B?OHdpTUFTWlRkeXJ5YjBNeEY3WE1YZzBOaE5ZM2ZIbDh3eUJpTTZNaFpmYkk0?=
 =?utf-8?B?NGNtTkkyWW0relhxZGFqRXJ1VUFSd2lQRERVdkREOUtVbWwxYzE3NitibDVk?=
 =?utf-8?B?MTVCdG56amRreEVwRW0yWDlZNUd0SVNRSG93VnQ4M0NpTUpCd3JBVGVnYjM5?=
 =?utf-8?B?ZXJoWHFHZUZiME03Q3FVdVU0QUtDNlFBWjErL2lZUGxNOEZVMTBmK0VUU3Q2?=
 =?utf-8?B?ZnB3UStPS0RHU1g0cEN1eUdaVDFPalJ2Q2NUS1VjalhERTdhVUxSMVl0YktJ?=
 =?utf-8?B?TnVEUFQ0b1djcHVOc3luQ2s2b1h2OXEvQStpYzZSd3RLQnQrNW5kVjd6RUFT?=
 =?utf-8?B?cUZqTXU5Vk1JVjNLa2xPallwdTF1NHM0UGtwRkRGWWhHTnJOMkZEU2pZZmtL?=
 =?utf-8?B?YkVDRTVpLzhxNnB1dHhiYlQxSSszL1VFdm96SGd5OXVZUHZCazJYNUo3cERQ?=
 =?utf-8?B?VUhnOTN2TzcyYmdydDZMd1loYUNKOWFGVWFOTTNTK09OcVBkaWFFMDhRcHNo?=
 =?utf-8?B?dmVQUlpteDZ1Tkk1RDZ0WDZ1TnVIWCt6R2RxQm5iSGR4eCs4SngxZEtZSDBC?=
 =?utf-8?B?ZXlWZzZmNnNuWVEzV2FrQnRWYUZzR2NTbk91OGFHL3kzVndRV1BYaDFOaSsr?=
 =?utf-8?B?OHpuL1FKK3J1b0pVd3NYT1VFSk5nRjNsTUlJaGorOWQyeHVIdWRtdTN5YTY2?=
 =?utf-8?B?MGo5OHB1UVpDWkVtTU5SQ0ZoR3VPUzF6MnF6K09ud2F5ZlFqMEVxVGdFbkhI?=
 =?utf-8?B?VkRNamdvZGoxTkxGZE0xUXRpRzNJNU1IRzNSWGhGckFMWkMvQjhuVmR2MzdU?=
 =?utf-8?B?cktZL0VQK0d3MzlLcCtJdTlsMXJrcUZpZkxDNkFRQnZkRUVFczFBeEFncmpI?=
 =?utf-8?B?WDh2OFduTFZFRXdUS0luVE9qRHBldkUxdVB0WjNsbTR1amZXWDNzM0xqTnBZ?=
 =?utf-8?B?dEtUM2VIV2p5OXVqbnFBL0dsQ0dNZm5XSm95ZXlqVFV4V1loOWJ6RHRMc28w?=
 =?utf-8?B?V2lsMm4yVmltQU02c3BzQ0wvMVh1dGQwNEFuMXFJenBYUTJHUEdGK0JQRnlm?=
 =?utf-8?B?WXJpWGJ2eVJJWEtwbWkwTkdhVVg2Y0R0Qy9qa2JBUWJ6OFRhdGpZK25HbFBl?=
 =?utf-8?B?NG9pQjAyVE95U0RkUmQvTlZqdTBaMXpKcWVCRHFJRHZaVnRtY0p5M0ZncXZK?=
 =?utf-8?B?ejlkYnZKQmV5WUxpRFdyOC9nUnBxZ2IxaFBGemI2b3ZhZDNJWlgreEFwalpY?=
 =?utf-8?B?UDIxT0hlUDJSMUw5RXc3eUF6RVZPZWdrTVFibGUzMk5GZHhlb1hIVmxpa0dI?=
 =?utf-8?B?WWNSdFNWZFllKzlMc0VRYlRoZWtJUThKNDJhdm1lYUNEcC84aG5TeUMxYVRC?=
 =?utf-8?B?b0RuNDZCVlpqSS94RGJWVXVQQVFQM3kraUI4WG5rVDhkWUppMS9Nd2ZYdS9Y?=
 =?utf-8?B?K3JoRWN4SWVKYTRkcm50YUlVNmZkODdGY0Iwd3lkaHFSci9QcmRFWGpTUlhS?=
 =?utf-8?B?VGtKZ3hWRFRMQ3ZzaFhTS0NJQXNXUGpNejd6ZkE3UzlkQzhwQjR5RTdGeWc1?=
 =?utf-8?B?VmZRTGhwVExDVzMvVC9MeEtxV1BVanhyZnhkYk9DNktyTEc4Vlg4a05mRXVL?=
 =?utf-8?B?NGZhR1NaNTRIN1Nxam0ra1pBdVNWa2NCZVBxbnMyd250S01vWmtRQW5iSXhj?=
 =?utf-8?B?OTJPYkpMbExaSTd1b0JWNURGQUFjbHZjNW0ySDE5Y2RPcExwU3VWQUhuTHZR?=
 =?utf-8?B?R2pETWduY2dwN0U3NGRzdlN5SmFwT1ByNG5tMWl2RHpvdy9tc29zLzZXK1N6?=
 =?utf-8?B?T2xsUzdJSW5qN3J3TXJuYUVYUjR1S01PWDBFMlNlY0t5cnVRZmk2ZFhSaXRU?=
 =?utf-8?B?RmcwSTBZM1RUMnM5cU85YUVLNXFtWFd2ZThpSUZhUVdHMlo0dlFkMW9BWmJW?=
 =?utf-8?B?TFE1SjY4ZUVGb0h3OEFzV0pGQmxkaW9xN3FOWHQ2MnllN1RDUFAwSXBMS0ZH?=
 =?utf-8?B?M3cwSjhZL2l2MTFQS25YUTV6NlRkOUlESWthRFNzZ21taXQrRjFEVjAyd3NG?=
 =?utf-8?Q?2vV8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180b9db7-889e-4e6b-9e3d-08dd7b829751
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:31:37.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3/HZf18u8qytUbtU0ubK6EhI+I6bHQZM5gvq4t/u/NaoXRWCkCRUs9swNFyPtE2EmmeAupX0+MdrJ2uFi+OvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_113141_268080_459AF1B2 
X-CRM114-Status: GOOD (  16.94  )
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

Document the use of (msi|iommu)-map for PCI Endpoint (EP) controllers,
which can use MSI as a doorbell mechanism. Each EP controller can support
up to 8 physical functions and 65,536 virtual functions.

Define how to construct device IDs using function bits [2:0] and virtual
function index bits [31:3], enabling (msi|iommu)-map to associate each
child device with a specific (msi|iommu)-specifier.

The EP cannot rely on PCI Requester ID (RID) because the RID is determined
by the PCI topology of the host system. Since the EP may be connected to
different PCI hosts, the RID can vary between systems and is therefore not
a reliable identifier.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v17 to v18
- mask max value should 0x7ffff
- order according to property name

Change from v16 to v17
- new patch
---
 Documentation/devicetree/bindings/pci/pci-ep.yaml | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/pci-ep.yaml b/Documentation/devicetree/bindings/pci/pci-ep.yaml
index f75000e3093db..214caa4ec3d51 100644
--- a/Documentation/devicetree/bindings/pci/pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/pci-ep.yaml
@@ -17,6 +17,24 @@ properties:
   $nodename:
     pattern: "^pcie-ep@"
 
+  iommu-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Device ID (see msi-map) base
+          maximum: 0x7ffff
+        - description: phandle to IOMMU
+        - description: IOMMU specifier base (currently always 1 cell)
+        - description: Number of Device IDs
+          maximum: 0x80000
+
+  iommu-map-mask:
+    description:
+      A mask to be applied to each Device ID prior to being mapped to an
+      IOMMU specifier per the iommu-map property.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 0x7ffff
+
   max-functions:
     description: Maximum number of functions that can be configured
     $ref: /schemas/types.yaml#/definitions/uint8
@@ -35,6 +53,56 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 3, 4 ]
 
+  msi-map:
+    description: |
+      Maps a Device ID to an MSI and associated MSI specifier data.
+
+      A PCI Endpoint (EP) can use MSI as a doorbell function. This is achieved by
+      mapping the MSI controller's address into PCI BAR<n>. The PCI Root Complex
+      can write to this BAR<n>, triggering the EP to generate IRQ. This notifies
+      the EP-side driver of an event, eliminating the need for the driver to
+      continuously poll for status changes.
+
+      However, the EP cannot rely on Requester ID (RID) because the RID is
+      determined by the PCI topology of the host system. Since the EP may be
+      connected to different PCI hosts, the RID can vary between systems and is
+      therefore not a reliable identifier.
+
+      Each EP can support up to 8 physical functions and up to 65,536 virtual
+      functions. To uniquely identify each child device, a device ID is defined
+      as
+         - Bits [2:0] for the function number (func)
+         - Bits [18:3] for the virtual function index (vfunc)
+
+      The resulting device ID is computed as:
+
+        (func & 0x7) | (vfunc << 3)
+
+      The property is an arbitrary number of tuples of
+      (device-id-base, msi, msi-base,length).
+
+      Any Device ID id in the interval [id-base, id-base + length) is
+      associated with the listed MSI, with the MSI specifier
+      (id - id-base + msi-base).
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: The Device ID base matched by the entry
+          maximum: 0x7ffff
+        - description: phandle to msi-controller node
+        - description: (optional) The msi-specifier produced for the first
+            Device ID matched by the entry. Currently, msi-specifier is 0 or
+            1 cells.
+        - description: The length of consecutive Device IDs following the
+            Device ID base
+          maximum: 0x80000
+
+  msi-map-mask:
+    description: A mask to be applied to each Device ID prior to being
+      mapped to an msi-specifier per the msi-map property.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 0x7ffff
+
   num-lanes:
     description: maximum number of lanes
     $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.34.1


