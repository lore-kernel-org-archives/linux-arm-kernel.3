Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6B6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 19:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO0i/b34tXG//kvU4HGnKVOSOCmwct33MArJWNqY/sY=; b=Xq8od+RN0Gv1KF04jqQgd7LRaQ
	sqmJ/pqRqhZEDbXG3zInuEhBFopPnDePRRdH9RVaVBCT/T8tZ8QbhLVmNW485hSh0HdSiPlLupt3D
	DdxJPPgRN+RnIcQbYCeKPRL3MKIW+WU4SB4Xnubywxuk3miXEgkEDfxxpsOVdNMu5Tin3oxTYu6FD
	RAtZe+HJugLsVtkEPrGZNnGsMmOIRw6fTAL+XXF/+KyhL1jGM9aWrv+260T8nZT8tmiwNCBKvCUuU
	td8G1pv4kSgQLFGM6kEik1tst7na69dr/3JsJxrxLBl4JExdTauQlFjIgs1n+BNqZmO5BBYHtqgZD
	gO4jSmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mfl-0000000Ccow-1pc9;
	Fri, 04 Apr 2025 19:25:49 +0000
Received: from mail-vi1eur05on20631.outbound.protection.outlook.com ([2a01:111:f403:2613::631] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mJX-0000000CaCb-3aTA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 19:02:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zze9yGTQD2YnYJiVyUP0rRQ1eyWqvG0DChgSw1Kx+DqQzTDfPzl/n0bCUIXd/1JKkxTcI+l8uqFRqbB6QPSJaSqDs8GVNYqw5MRb8G7wee4SNNSe7VzzXPq+JJ8LgSWl4R39gVaEytaZgiokoEgCWj4qGf7k8neWRjpJn7+IkxRUWhR0976FaQAP57nV1j7ncorLGJTdV1bunP55cyTAW4RjtOCEg202mLqv7eqtBEk4L8U690nuII02T7FT6cOAphrrPOtjEAdyZgz3rW2fCynpBgn4NiX3w2LL6Ri9rRQuwyp80BJfaUDQ2GqHwV42B9iFj2BLTv986ZawakvDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO0i/b34tXG//kvU4HGnKVOSOCmwct33MArJWNqY/sY=;
 b=xjsCWpmEZxM503fdKhYSCuCrd6oWumup4UKnu3FeUiVZz3V21nb1ibdQy8FICJf2I3Kj5tXbwdmIz2J2d1ebzMzyHLGobdCmnKxfebu8L9Wmgr9l5gRaeqULqckV8/lzco/qK3c7GbRPe5vHdimQQuZdUO6RRStbyyhWH7ebrzmVB4vQsOsgyh3WP70OwVMHB98pNbMhCe40Vgiv8NtQPJ2xHrVn3ZY1o0Rrw/uB8ZAfJOir/Ya9peCD/FWAF95LQssw6P2fxrNdI1+sDmXouS/jIh/JbyzHIswkc3LuaAdzlmv81uBdqHyJgFxbWbUIZb4wanF2weCkDqgPtVg9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO0i/b34tXG//kvU4HGnKVOSOCmwct33MArJWNqY/sY=;
 b=lmE459cUA9t33cTqdEkmFIRR4FZaI3K5PelewJpfAqMqFBcTis4okPiK3BwviqigD5MvPHp+l9PVQnq3Qok9i6bOMrq380Er/DX5VKrtG0emhPEInSZl70gpyZpWLLte6VfJ/ODB0JzNp5H8MVxO7EypENpg4z79RR48iTUFs/HrUyHv4hx5RyFeUfL8HkfQWKMczA4Y8e2y6KzBvOWZykszxM057GmMUAUi+3S/HIE1iRG1hWrXi1Vv8+ldNFJE5E/qlVZgTCknYZH+w8wFK2s4HXVGaCl7R+SSMx87JJfmUxsYGSnxBHddsYXD//BhJpGjh5uY+O/6iLpuJ8aQOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6957.eurprd04.prod.outlook.com (2603:10a6:803:135::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 4 Apr
 2025 19:02:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 19:02:49 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 04 Apr 2025 15:01:13 -0400
Subject: [PATCH v16 12/15] selftests: pci_endpoint: Add doorbell test case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-ep-msi-v16-12-d4919d68c0d0@nxp.com>
References: <20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com>
In-Reply-To: <20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743793288; l=1300;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+SgZEl+0x0mkZbAhvLt5Evhno7zgilVYjrIje6KjXVc=;
 b=LN2B+R1vsf6JaK5CX4Joy/oBvNhO85gqCcFoQCaUHRJN9eJV48vPNn0X56dvx9HzDHYkQvBaE
 7fVB4DBH0KeC/J3QJEBmLYap4bpgX88tuHxCeAMpg7/czMGwg2EXBQb
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 396b89e7-5e93-4324-be83-08dd73ab4ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVRQMVI1Ymd4NStMQzdNYUtPQTNaNHBLTkZubkU2WkJnWHorSk1XdnN0TGdi?=
 =?utf-8?B?a0o4bDgvM1pFS2ErUWp1bzgrWEY0c0ZvdWtFK2I2NFZSK3lqclg4OWFwcnVS?=
 =?utf-8?B?TTg3WmZQRXFGc2h0UGp5dG5TYjduQzJBQnRvWWhSMW1VQmpZVWFnREFlUXVx?=
 =?utf-8?B?NUFGUTFIaUxkMGZvOGxGM09qbWFqczVWZloyQnJlOFE1VXErUGsrMzRLelRK?=
 =?utf-8?B?RTNlQ1JxS1JyNFQ2Skk5cERuTFZzR09FL3pHL3JRNUZ2K1Jqc01QbmhIS3FM?=
 =?utf-8?B?V3lqZ2JNaXAvWGdUYVNNUkQyZDMvNVVTbzlWbUJOenNwWmZxQTJNOE9ZSG1m?=
 =?utf-8?B?THRPbW9HblpjSnRBR1lOaUwyWGZ6c3JRanl4R2VLbkFlTGlXdVVHNXpTSUFU?=
 =?utf-8?B?RStTK0ZRelNBcnFsUUhkWkt0OTQ1cDlISGhMOXRlQnpDN3pkeGVBbjhMTkZn?=
 =?utf-8?B?Tk1Zc1FiU04yM0pNQWpDV0dyTmhFUndERWRVYmZJdmJENnpmOFlVc293cHB5?=
 =?utf-8?B?Y2RaVmh4bXBMdUdCa3NhS2haUTdTbkw1b1M0TVJudWdLYjRsenVQOFRmbW05?=
 =?utf-8?B?VVVNWSt3TFpZVjZNcVIwQ1VUYm9tblBRWURFWVBPYnRqdVk0K1VoYkJsdW9x?=
 =?utf-8?B?aUFlSnlNNVBwM1ZYeEEvZHRJRUhQRDZNYnlZbDU0K1ptT2V1ekF4YWErZ3RT?=
 =?utf-8?B?eHRRT2NWZzV6dXY2UFU3UXplQ3YwbkM3NXBIaFpuMmZKZmVtbE56ZWducmcv?=
 =?utf-8?B?c2orcE1sbXpLcExqWGllZFMvUzVrelJrQzNMT1h2TTFWR3ZGN1M3V0tyRTFD?=
 =?utf-8?B?TVVEbkNXYnlCK0JCS1loOHVDcVNEV092TlJ3T011YUYxY0E0elQ5cWZ5eEVW?=
 =?utf-8?B?d0twMnlhUlBYeURuaW1UbkhRQWdOSDJLNFVxYjRwNndUM09WZWtaNTVqeE9W?=
 =?utf-8?B?cEpGOHR2K3FyVUhJUHlYbzYrVm0waVFCUjZMNi9aOGdrZlRBYU5xK1YySDFk?=
 =?utf-8?B?cjhENUNHQ1RwS2k3KzI3cHl6UEFsRXY5a0NZYllNSmpLenA4YTB0UVdjaXk1?=
 =?utf-8?B?emtHdUtYMGtaZS9rMmVYdUE3WURPa2xNNnlXZmtaSlpuV0d6VHo0SFNEcnhB?=
 =?utf-8?B?c1NkSXhDOWFSc1NhdzYydXFYS3BPSk1Fa0NNMVk1V0FuZGZINVhsKzU3MGZU?=
 =?utf-8?B?UzZLaUtTa1UxeThpVHF6eHZzc1RPd3NyVVRlNnJzSngzZkp0Y2Q2MTNLd0lW?=
 =?utf-8?B?Ymh4M1kxYzlpWG9yOXdOSlNBWDBqZGVlbi9kbXZUcmNwaW9GK25RR1h4UllK?=
 =?utf-8?B?S2pDclhpR3JkdGFnSysrdVArYVhFU3RSa0V6Smkzc05PeGgrU3FkMEVER2E1?=
 =?utf-8?B?NEczRE5RZkRBREJvRXlLdUpDUFg4Y2NNd01IaURrbzRJMjdYdWJ4NHhxdG9M?=
 =?utf-8?B?bUhlVUhVa2hXU081OTdWNGNxMlJ0NVZNbkdxcEVVQWV0eGwvN1J0Q0o3ZjAw?=
 =?utf-8?B?amFMZUlYOTM2SGs0aS9oeldTblVzTFpvWjJEaDJaTFVFQXVabk4zR05rbE1a?=
 =?utf-8?B?c1lEN0EzdGttQXQ4eTRGRTRyVUh1ZnVmaUxxWTdvZER5QkdKbEhTOHJ6SGhH?=
 =?utf-8?B?SU9YK3pNRjFycE10ZTQ1MmUwZnlidXpHUXZ0R3I4b0xLYkltR1oyWk1uck9T?=
 =?utf-8?B?Rm1ScTFMdHdiYWR1b0xCU0NUWS82UjkxRGlDVlh1eVJkMFUrbVlBZFM4Sm5a?=
 =?utf-8?B?V1R2ZUhSTGJxSk56YmNuUW9KYVN2Q1NxYnhiUUVGa3NXemo5S2R0TnF2dzVO?=
 =?utf-8?B?NXd1Q3UwZE5iSnRsUDIrQ2QxUERTNDI5KytLaC80SEJ3QTcxMG4vYWNhNTFy?=
 =?utf-8?B?eEJQbVlGcGdlc20zYnpyUndpTFBOMVZDYUZZRjRtNUNlVUZETW83OGY3d0xB?=
 =?utf-8?B?TmRYdDhab2ptVlJtMVBwbk9BSE9RWjluUUcxMkZ4d21hL0c2ZFkxZUxRbWU5?=
 =?utf-8?B?UWUrQlZucUFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlEzMzJDVmhpTDZoeWQ5RGM2UUNDa0pBWWJvWnhjNGtremEvUUl6UjNFRm81?=
 =?utf-8?B?UW05YUFhblJrYklFdElLWGpnck9zTnNjMmEwNjdhZldNWE9qWG9KS0pDclM0?=
 =?utf-8?B?YnZWeGptcmlENjlEYitBeWVnOXdOM1dWQ05KVDFBczNmY1Y1aGhqaHg5cnRa?=
 =?utf-8?B?RjM0Y2k3UWdzYnpGbjlEWFZWSm1aRkpqZ3doYXhZbHBNSHpKS081VGpIdDVI?=
 =?utf-8?B?SVUrbElMMHlFMi9zdzZkSThhVE05VklqNXlsb3JWUDN4Q2FIWXJNa20rTTdu?=
 =?utf-8?B?c0h6N2xTbjMxSFM1REc5anZYN0ZuQ3l0eUdMOHk3MjF5R1RhQ3lOVlZjRzlH?=
 =?utf-8?B?UFExZkNGL1ZBUzUraUl6aTAzVUNaRmY3Um1Vd3ZtNGZrVVFmU2lrS3Qyblh1?=
 =?utf-8?B?aFZmMFVJVEl1T0VOdDZ4Vmc2VHJLbHppMFNGNHg0YzdTNVpWRjlkd3JkbW9j?=
 =?utf-8?B?TGZhVzVVbk1haERONWJpdmFia1VpdjB0YjNYMjZiZ2ZhbGtiVEdMNFhXa2NT?=
 =?utf-8?B?RFdwMEFodURMdlVINi9zWjVPVS9BOXUzVTVRcHFwbE1xREdLZ3RhKzBiSkgv?=
 =?utf-8?B?dkh6eXEzektMQURXeSt4RVJjOFJDOStFdTBuR2dMdjNpNDZGOEdQOHkrRnZN?=
 =?utf-8?B?enBYWHdzNXRxTWhVZ3RmVFRwb1RhMmdra0piMUlPeVRENmQrcFVaVFZyUVV3?=
 =?utf-8?B?T3FRQUtxek1zNnZIYWhyWTRWRHhLM3dHNkpYK0JOQnpIR3lpY2pNWkpod2NT?=
 =?utf-8?B?bXdveDFGRmhBM0EzdzZCUGlBY0tyVHdKWXlqaloxZXVzQzhqNFRsWk4wUnAr?=
 =?utf-8?B?WDg4S0lISHBCSHZEQ3QzdzlRY3NwWkVnbjdINStyckEySXVuRlRDSFFsN1lW?=
 =?utf-8?B?NjlicFZoT2Z2bEUrYnp1RWYzc1lZUkwxWTY1YjU1R2xuLzBSVmd3SjA0ejVs?=
 =?utf-8?B?VmxWQzFIa2ZiaEF1V2hsL3kwMHJ0OVd5OHNHay96VGpxekthVWU1VFBCdjJO?=
 =?utf-8?B?eUdIY0RSbGdtY1Q5cXhhUW1mZGtrOHRFR2Q0cVo5OUVVK3M4K2MwSExKSGEx?=
 =?utf-8?B?ZDRwa3JacGVZWUpaOW94ODRnQUNHMHRtZy9PWXRiTkZ0TzhSTmUyVEZ5aEF5?=
 =?utf-8?B?UFlwZkFEeVFMU2Z0TG1FSDVLWUdtS1hHaloyb3ZSY3ZyMTZXZ1VIQmpIL1hT?=
 =?utf-8?B?M3pwbDVuSTBESnhaenliS1FKemlGZmcySExPdG96VENBZ1QxR2hjR1FnbEcv?=
 =?utf-8?B?N2hmcGQ1MGtZQjhQK1hYaUZkUHY3bHRNamx4UXdYMWdNSitpR2JPWjBZTUVU?=
 =?utf-8?B?a1UwZk9nZmEzajZmL3laSVptTHl2UU01VC9TMlFYYXlybmNOVHZzbERlV0do?=
 =?utf-8?B?SVNONHhhZ2JXM1h6ZUViNkR6cFU4d2tjMlFlUTU3aFVtY3ZQbVpFcVZtS2VU?=
 =?utf-8?B?WDBzOG9Md0FMSVBmT24zTmhka3QvS3R3ODlEYjZDb05lQXZpVlNXSHZYbFky?=
 =?utf-8?B?cGhtdzBGaTlKcVhoOU1nZzhOYkVVQlJIM1NkZk5hMFdVU29RbmVHSkI0b204?=
 =?utf-8?B?VnpCSnFJM21IclBSNU51QmdTMDl2ZlRvVFgrbHQvUFZuMHpxdWZYM24rTW1P?=
 =?utf-8?B?LzZ1TEZJYjN3dmhyaVh2cDRTTG90WjR5L2U0MFVESFhBSHo5YmVIaVNkakZL?=
 =?utf-8?B?aWdQU3FUU1k3MmNaY2JhTHY3M0N1aFFGdUh1VHFUTE1aK3RKY093VjZZZi9P?=
 =?utf-8?B?R2M0a0FiWFczc253anBxZnJvaHlCMEtSTFp1cDRGUHdCU1VrZUZDSHUrdUtn?=
 =?utf-8?B?THMwbzBWK09CUDRveDdIWDd2V0hKZGNHYVpMQlZpRXkxMzZvdGR4MkR6a0k1?=
 =?utf-8?B?UW1Od05FMHJHK3NvaGx3aHdndGVRZDlXNG5DcXRnbDNTZDVQZTczQjZUODFE?=
 =?utf-8?B?YUdVRG9EdWVsOCtGWlhTZUYwdEhTbHhjMy91K211N0ZoYWZRNFArQ2o5SmlG?=
 =?utf-8?B?Y0NQQi9BV1FYMktIR2xnNHptVkRnbkY4dVAxMC9rQ29BelF2NjZRbzZWUE9E?=
 =?utf-8?B?ZXhvS1RTa1pKd3hwc2l1QSt1b0ZSaDJOMzQ3QTNHVnNUbUZhNVk2QVc4bm1C?=
 =?utf-8?Q?PVLw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396b89e7-5e93-4324-be83-08dd73ab4ae1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 19:02:49.1027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnwuHlzciemVjapJw54hxFiVH1Z/B+oomf+JONHwCax1bmwnNyM/UXDMC3KpbYXlJib0QrmYwQEwN9fiXaBQqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_120251_901837_F7E227A1 
X-CRM114-Status: GOOD (  10.24  )
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

Add doorbell test case.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v14 to v16
- Add set IRQ type

change from v13 to v14
- merge to selftests framework
---
 .../selftests/pci_endpoint/pci_endpoint_test.c     | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
index ac26481d29d9d..da0db0e7c9693 100644
--- a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
+++ b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
@@ -229,4 +229,32 @@ TEST_F(pci_ep_data_transfer, COPY_TEST)
 					 test_size[i]);
 	}
 }
+
+FIXTURE(pcie_ep_doorbell)
+{
+	int fd;
+};
+
+FIXTURE_SETUP(pcie_ep_doorbell)
+{
+	self->fd = open(test_device, O_RDWR);
+
+	ASSERT_NE(-1, self->fd) TH_LOG("Can't open PCI Endpoint Test device");
+};
+
+FIXTURE_TEARDOWN(pcie_ep_doorbell)
+{
+	close(self->fd);
+};
+
+TEST_F(pcie_ep_doorbell, DOORBELL_TEST)
+{
+	int ret;
+
+	pci_ep_ioctl(PCITEST_SET_IRQTYPE, PCITEST_IRQ_TYPE_AUTO);
+	ASSERT_EQ(0, ret) TH_LOG("Can't set AUTO IRQ type");
+
+	pci_ep_ioctl(PCITEST_DOORBELL, 0);
+	EXPECT_FALSE(ret) TH_LOG("Test failed for Doorbell\n");
+}
 TEST_HARNESS_MAIN

-- 
2.34.1


