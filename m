Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF75ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RIjhM75n2hSGLJoUlt0S06Heg5ZylNzeaoNynjFZGM=; b=V9pdpYE3IZBtN7ynw5iJ7FhVR8
	cGUZwN09KAHOCaUNt6QBIZlzCmkT76mwC8V6mznPlkLzP3AJH1cdyyFJSCNZ87iN70PgnVLqrPz25
	StMDTxt1BFkFx7B/5gzulfv0BYjo2dSgr61lRwssYTCyfSLwLq33hL7X2v2reOmSNh/M4ozZLdBL2
	fcN6mlvA/XNNVX+wPqHRsnxOrSXMkw2fKIFvf1n528eBN/pdOaZncMcJ6ISZs+4/9+QWPwDlO2Sym
	X/OO37gUSWb7k00eCCiuu7K+wDNL5gFMv//NucV7NTWigMyZrUVLN4b3ysWtPcmgF/VjYRpzPeUPm
	pwoYnOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Xn-0000000ElQH-31lU;
	Tue, 23 Sep 2025 20:23:23 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Xh-0000000ElLc-3SkV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 20:23:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTNGucAgSHu7VLYrZPE0wVNZrkUrwjK9J9SlXBwT8+2Hg1hOzBv5uwsZNqv37T3RpI+/3z1eCX0KB4+nuNHPzVy+RQM1JCiZCBzRO1O30XouMyCx6yXynJRleYaL9Pu8dZoX0i0kAwxA6pIGPHIKuQ+rnQxQP4fltTxBghq6mp0Q+dwfwmtCc+XVo4z/IiYViticZLTInQjqCzneueNs+1zGaPmJDf2u0xiXLPRAdEuv3kqWaXuxVqmT56WspQ4xFru2jp3Pd6Sv9aaTanpDCoUEClkatpX3qxSIyHzLio/l+Q4Rb9ZUkpce3ffOSsAq1xadm0niWHORkksY8z4yxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RIjhM75n2hSGLJoUlt0S06Heg5ZylNzeaoNynjFZGM=;
 b=lNnCVU4EfA2SuwEKaeZYAEk2n8n2wyXsIWIRHMjLjWqX46wnh6mUgpZkImZVX8vvnScvlt8dE+qS5K2SRo5NOValcG6br2+ztuUX6c3fWfib26Sj4n2fBA6buHqNfEiFBOTq1L4DzCjlUnwwUgUc7oCklh1CpxpLwXQefJYj2+80ru1ADgiAgYl3pdBXvnc3XkNAW562oEPgF9xdZcLaUkusriA3jfssOmWZ39jXAdYqqoeqVDL09EGxhm66Yy9NGH/AC46Ig65gokv9nhlhQrJr5z6Xv9uReAGipjmOP+EixJ/rTUhu5BRNqyvLDUnu+JQ9Hs5Vm6ZvJSgRMLGYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RIjhM75n2hSGLJoUlt0S06Heg5ZylNzeaoNynjFZGM=;
 b=HMbmxaj79ua+DwpR1iMv67nrooc5JfSHzenU0YrLMbFW8S1wLsnxqiE2vzz2yVyGZ7N3NyLYadAk9l+fy4Ov9XXA+j5jNfLUPGB0juJlb3xxJdXC+Koqg9RQdB5CzixtaZCqcdFdZOPck/xBwJXiWyzjSVy0w9rwxRVEpha76T2cs9oQu1sKLx6IYWfyVSkm2+SARxvIUOdl7UrAQleBbZ/uERC2u7zxBoSrjEHNPw6cVPCdtvFzNss/44bJ0sGMfYuXO3EvjytpevDDIr0sXfXyD/UAD5/GMF3hNZDTkCQD5YOJ9sx0CdAb/4FSY9R9g2/UoEvKcB5tA19ZZVGLDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DB8PR04MB6953.eurprd04.prod.outlook.com (2603:10a6:10:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 20:23:09 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 20:23:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 23 Sep 2025 16:22:49 -0400
Subject: [PATCH v2 2/3] usb: dwc3: dwc3-generic-plat: add layerscape dwc3
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-ls_dma_coherence-v2-2-ce3176396bdb@nxp.com>
References: <20250923-ls_dma_coherence-v2-0-ce3176396bdb@nxp.com>
In-Reply-To: <20250923-ls_dma_coherence-v2-0-ce3176396bdb@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, Frank Li <Frank.Li@nxp.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758658981; l=2775;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gL2M3aOcqxxdhs8F2+tays8dWe6dK2iWCv3uKTUAcU4=;
 b=fv8k06lgqhx/angnzv2OmQbyxCqrsKE8lLG2h/Me92SiXoTxdwERXs3TEcau3wQfJRfyZ3mzH
 PdeW+JXjkQQCakFaQIBdZYO/T2ixMNu8sIPXr0Ix6oLNCA9myOyMpqH
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM0PR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::39) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DB8PR04MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b76728-cf94-4ecd-91f2-08ddfadf02aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnlkaEc3WGptWGdUa09OWUw5YkVFMWFYUk9UM2psZmVCRzMwQUFoY1IwTzk3?=
 =?utf-8?B?djlWNHRlaU95QndQTHQvRFpIaEpIOERVN1dHZm8vQjJuazFobVJzOENTRVJl?=
 =?utf-8?B?ZERGa2FBYldyajVhTVFhZ1dBbDZEQ2ZaRFhLSUUwNGsvckUvbXplUlBLb04w?=
 =?utf-8?B?ZWJOd3RxTXRIZXZia0MzampQaEh1ZTlIWW9SblJRY01wUkVDYWc2RElhRW9O?=
 =?utf-8?B?VEZHUnpnTWlmVmNGTWt5VGJYdnVVVWFWT3A1OVJseWtKU0ZGdjkzS1hkdlhw?=
 =?utf-8?B?L08vSExpVGJTUkVyWStORm52WFRlOW01cldlSjJLaFJybTk4WGtVRkxiWXp1?=
 =?utf-8?B?WDBESXlBcVRRVXRwY0xyaWdsYVJZd21QYVptSlNlWUtQZDBKcXM4Skpqd1R3?=
 =?utf-8?B?MFcwNHUvU3Y1bFl4TGRUQ3Fra0NpVmd6bkdYVUhDUXdsZlEwOUxVWm1lcHo4?=
 =?utf-8?B?QzdYUWh6cmVKRENlSDRheis0SFg5SFFINjBJYTlaNGx3VTkySHBIRVEwNHBI?=
 =?utf-8?B?QXFNZWJ0eFFGdHBPMjlGc20ySnB5blBFNUlrREFqTjJibFJCSFZ3TmgwZjBp?=
 =?utf-8?B?NFAyVTFwUWdkNm03VnFxaHF4cWplWHQ4OTdOcUhKTDlhblJrb0llZlpJY3VR?=
 =?utf-8?B?UGMrcHQzMjE5Q09haFIwVzMwRURxaXRJTGlQM2xkWUdwLzI4MjNaREgwc0lF?=
 =?utf-8?B?b2VhWVZJVjVBakJEMjhMSEdvaGlSVThoSnFXdHFaTldaVUZFSm5vcHdIQXRw?=
 =?utf-8?B?R0piODNkVVlacEVwakt1NWl2UVlrdUlOY1dIU3BqamxibTdzVWgwTkNtS21Z?=
 =?utf-8?B?NkVsQjJSNWlqLzJxTU52eWxYNmVFdThqSmtyRXYwL3JGNFNoM1pUTGRpUW41?=
 =?utf-8?B?cjljRGNBMzViSWp2c25zdWpvbU1SRXpsVk1GMFdTQXpKNzBaM2pxVXpZSFkz?=
 =?utf-8?B?K0ZOSU5VdkZMMkdxS3FSNGxjTkgwK1V2NFRVOFpBMEN0WExtVWV6Nzh1SUZl?=
 =?utf-8?B?a2lBTjFWM2ZDMGxrUDRBU3VwMVBFVWdiVWd3MWJ1ekN4L0NiTWZJZkFMc2ti?=
 =?utf-8?B?Rkw4QzJCUE81THpqd3hWd3RsMnRWM1pHazNBUjU4VEVFSDdFdmFLaU5raTZO?=
 =?utf-8?B?VjUzazA2blBZS0ZaMDBLYXVvenlqdDBJSGZDZ1VwK256NnV4WVNTRGQyQkY1?=
 =?utf-8?B?Y0dJUmMwVy91Z3UyY2hPOTQ0QTVGaFJPUkFTMmZLdGtaSlczcHZGVjZxeTJw?=
 =?utf-8?B?T2VIUW9lZlo4aHpodlZ1VTVDZWtIY05oSnk2TWRzRnJSWjRJQkZxSGcxWS85?=
 =?utf-8?B?WkUzTWFsZG11WWowdUFIa2t0ektpTW5CWnl2aFBZdUdrdjhCbithbFllTUFV?=
 =?utf-8?B?dzFiMm5mM0N3YU15b1BKMVR5QUpuZU5iUllXcG5Ed1c5T2dIdDZBcGJBOHJV?=
 =?utf-8?B?UnVZZnRwMGNOYlZKQ1RCYWg0cmVBb3p1c3YwMkhvdnlYK1lLalFlQjRuR1Qw?=
 =?utf-8?B?NFNsRWlqZEhXYW1XNWhPUEpjT2hvYko4UUVTL2c0MERLbTFERXdOTUVNUEdm?=
 =?utf-8?B?bG5sLzFZSzlEd2M4bkhXV1lGNml1ZllHOGprSnVDSFpjbUlyV29UZDdrcTcw?=
 =?utf-8?B?K0VlNEhHaEZZTkNxcTFyWHZUa0F0NmxaYWx3eVNWZmxNZ0FqaVFCUzZobE1S?=
 =?utf-8?B?REpuYnpraExkY3pLN1FOL2RRaVhDdS9ydFo4RGNrTktvdENRb3RnWUUwT2VG?=
 =?utf-8?B?K2Z1ZWJxcVlnV0tDQW1tZDcyOEhXZ1BNT0IxdUpEZ3VabFRSeFUvNG9LRVpy?=
 =?utf-8?B?Rmc4SkpSWHBycStvZnR4OHZWRmNIVFA2b2w5c0FFQzBteVFCVVkxeWJBeE9y?=
 =?utf-8?B?cjdPTkNadXQxTmlCU1NaTzZzQlpTRHpvSno2MlZReGdqWHg0b0g5MnJPRDQ2?=
 =?utf-8?B?dXF3bWZEYmgyRXZicDBOcHlPMzVJNWFPdWtnODlOdnJ3MytLYW1GQWwxRWRr?=
 =?utf-8?B?Qml3ZHU0SnV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01CWUQzS0wvTi9FZDRLVzlpam1CSDM1bk16c01vTDN4TnRaM0RTMGpjSFdG?=
 =?utf-8?B?c3NWVU5PRkF3NjBnUE9oam4zaERXbWhUQ1VSMThHb3hjOWtUY2duNGQ2YnZJ?=
 =?utf-8?B?M1ptRU0rclFRTUJGei9NcEVkbnNSaFJTSXdMSHpqTHIyZHUrQjlFakJETkd1?=
 =?utf-8?B?T1ZmRnV2UHU4b2R1L0lMTVpGRlhTSGJTQmVMLzFlb3lnL0ZQZkdyNWo5UjVW?=
 =?utf-8?B?TXhCRFY0ZnRsQkNhMEJERFcvTnQ2SFhwTnQreGdycE5TV3lzb1k4K1dUaVda?=
 =?utf-8?B?U21hRHZ2b2JRT2o1RjVPKy9FSTFBSERKYXhpbm1pazZCSDZRbERta08rQVhY?=
 =?utf-8?B?dUcwOFdkcmNOOEVEeTgrbXpIUTRXS3hFYURqalJoMHozUmxudFBEVS9GNVpH?=
 =?utf-8?B?ejh4emtNalBuYlBjTmN1ZTJBS3NBa28wUkliQlN3N3c5Y0dhNVJtaUd0a2xO?=
 =?utf-8?B?ZGo1R1k5OThxR0lQK00wajZBcE1HTFJkMndXOEZDdkI5Y2VNOEkxei9Deksr?=
 =?utf-8?B?NlRZV0ErakFlVzJhTXFqemNTekJiWGdwZ0F0QTBLU0doRWtsZUFQOWdmRnlD?=
 =?utf-8?B?OHY4ZkVacUptenFiUVBIZHdYcDNJZnRyWmdLdEkxa0NvaElOTDFIRTFpbTNO?=
 =?utf-8?B?Z0FvdXUxeWtINENGclFza2E5VjZJbnBNQzhNRDRrSHR6Ym5DNWRBdm9RRHBw?=
 =?utf-8?B?S1QvNHFjbWNkVW16VTNhdVo2Q01wZzJXbm96MzZuOUJPMHhGNytablJqTXdV?=
 =?utf-8?B?VUtFNHpnVUZsdmhUTHRROGxLZUl0U1QxaTQ2Si9Sd2ltUW9GSUIvN0s0Ni83?=
 =?utf-8?B?UnRBc3ZTeHlYSldQWGhLVVFFY0VjLzkvVTM4ZWNkNy9Held0bExmdFRIQ2tW?=
 =?utf-8?B?UzVRUFdrYmdmOFB0bm5kYTZVWVVDUlJBUHkyQ25EdzlvWDBUUjRMUEVNTlY4?=
 =?utf-8?B?WTVYeTdvNTZuYSt5OWZhMTUwdmRrdy9VQ0xicWx5UVkyWkI3ZHJMR0ZobC9I?=
 =?utf-8?B?dU0zVm0rNmZwMWdXOU50dTNwRlBHbDF1ZHo3ZE1oZlgzU2NNSFRXM2hWeTlH?=
 =?utf-8?B?L25MMTA3N2ptVlgySVNuWW1TbmFoU0VPcG5qK3RSRWF6TEVsMVRTTUNuNFIv?=
 =?utf-8?B?R0J4YU51a1ZVcWpjMGZmcE1TdTZPd3ZyZStEOWV2Z2JGWGZxL2pUQVRXK0J0?=
 =?utf-8?B?dU9la2ZvQ3pVSGMvQ1JrSCtiQlJkb2J4eXUvSC9jak5XTXJ0Nk8vY0JzVXZs?=
 =?utf-8?B?cW9LN3JWZXdJNDRMZE5qMGFaRXE1cTljbXNYMW5DbnJjT21RL0h0eXVIZUdx?=
 =?utf-8?B?YWx3aUNUZUR6bGhtR25yOTY0SStjMGZwS0RiMlhvZU1hVWFXQlI4S29wampP?=
 =?utf-8?B?N29oMEt2SUYyR09ycC9RUHpMeFBEZFE4WU10SG14bjZQSVhEcGpJenFoYjB2?=
 =?utf-8?B?enc3T05XZGcwenJhZ0pscVJKZTUzNnZWU1FjdVpiZFkyd0tMNitKOUZ6S3o5?=
 =?utf-8?B?SlRISmxPWlJHQTZ4SkVKd3NWaDVxbkl0Mkd0RXRUQWRuajJ2SlJsaDdkT2tk?=
 =?utf-8?B?QithUmFKblJ2MlB1eCtKL3VMRHFteFNZb3V5ZFJxcTRFUGRNQXNTNkZpb1VE?=
 =?utf-8?B?a3FyanhrRTUyRE5pSHNkT2dvc2pKY3BaVEVLcVFIRnF2VEdzZjZpdWtsMDd6?=
 =?utf-8?B?YWtyRzNBTm9ZQVVrZHFMWW1keHIvMnNnTFJYNmpaWVozcVcrbThVdjUzSFBu?=
 =?utf-8?B?MVk1MTFsRHk1NkRVRDZMT005MlBpaFlHRkNtL05qdXJOc2JvRkRJRjBmWmZq?=
 =?utf-8?B?Vk9acTB6eHVwN3BvV09LN3Y1azRmWkdVbURXOHdmVXEyajRvazBTUytaMHdK?=
 =?utf-8?B?Tnl4NjZzSk1ySWNENmNjRzZBWVJibXlxRXFoWGUyeW9kVVAvM3VJV0V5N0FZ?=
 =?utf-8?B?dFd4TWRzY00wQnNHY1ZYMGZhYkpCaG5vbTNlSm5mS2dVc1hYZFFtdStrT0Jm?=
 =?utf-8?B?b3lRZHlSd2RnTVdmQzJyZXpxTmRjVzhxUmJ4TTczR2V2dm13SnlSN2k0elpX?=
 =?utf-8?B?SnRDV0Q4eFZPbjY5VzhsTDM3b0M0Z2J4b3hpWlRtYkhvRmpRcDBSNi83SnZX?=
 =?utf-8?Q?QwINRKumIOrWk6ywQStTjz/go?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b76728-cf94-4ecd-91f2-08ddfadf02aa
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 20:23:08.8748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VV0ozRWy5iDbjX5ax5l1cPaffHdWnY1rLwEVEXCqHM78DpB79atbtPNL8B+WoAJ7vgjuBYy9rX6JKwebqQG0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_132317_878510_BF4F21C3 
X-CRM114-Status: GOOD (  17.10  )
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

Add layerscape dwc3 support by using flatten dwc3 core library. Layerscape
dwc3 need set software managed property snps,gsbuscfg0-reqinfo as 0x2222
when dma-coherence set.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index d96b20570002dc619ea813f4d6a8013636a0f346..d886b6e557b12edda71203e4f640a9a0a53b4f35 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -8,10 +8,15 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include "glue.h"
 
+struct dwc3_generic_drvdata {
+	u32	gsbuscfg0;
+};
+
 struct dwc3_generic {
 	struct device		*dev;
 	struct dwc3		dwc;
@@ -29,6 +34,7 @@ static void dwc3_generic_reset_control_assert(void *data)
 
 static int dwc3_generic_probe(struct platform_device *pdev)
 {
+	const struct dwc3_generic_drvdata *drvdata;
 	struct dwc3_probe_data probe_data = {};
 	struct device *dev = &pdev->dev;
 	struct dwc3_generic *dwc3g;
@@ -41,6 +47,8 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 
 	dwc3g->dev = dev;
 
+	drvdata = of_device_get_match_data(dev);
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "missing memory resource\n");
@@ -70,6 +78,17 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get clocks\n");
 
+	if (of_dma_is_coherent(pdev->dev.of_node)) {
+		struct property_entry props[2] = {};
+
+		props[0] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo", drvdata->gsbuscfg0);
+
+		ret = device_create_managed_software_node(dev, props, NULL);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "fail create software managed property node\n");
+	}
+
 	dwc3g->num_clocks = ret;
 	dwc3g->dwc.dev = dev;
 	probe_data.dwc = &dwc3g->dwc;
@@ -145,8 +164,17 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
 		       dwc3_generic_runtime_idle)
 };
 
+static const struct dwc3_generic_drvdata spacemit_k1_dwc3 = {
+	.gsbuscfg0 = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,
+};
+
+static const struct dwc3_generic_drvdata fsl_ls1028_dwc3 = {
+	.gsbuscfg0 = 0x2222,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
-	{ .compatible = "spacemit,k1-dwc3", },
+	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
+	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);

-- 
2.34.1


