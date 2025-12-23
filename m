Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2993EE6F082
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCleaf6UF9fK9KNtk34+bHMqbDi3R8vCmZ6phkafWNU=; b=xvcvK94NbYqavO9rg/eInO7Pvc
	3A2oMifQRMkGH7JZ93WHApB1cSwwe9sdjvut+bhOI3kIr/IPWtnCkj/jzMqf5Rhf0aUBca9WXvPid
	a6MY74N5S+Y+UwscKLkdFIN1f5eq3KlspBk0862uabJePpT7q+UifP+7iDa3xX1M5rzMiemWFIOnH
	V9Q8R2nbHJuumB12R0vcg+lWD+gEFOdUR0P/qWLUfLA2aqOfXriQJxm2I4UJuXknXKCYpY0sGDEjj
	f/F9pyY1z/DtsTtKiKEHanLXHCMlh6beR6+DtGMqS39NXZj72nF4WzgabBSGH/474s0V0nep9MrHe
	iDO5A3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzws-0000000EuLS-3NpJ;
	Tue, 23 Dec 2025 10:49:02 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzwp-0000000EuKz-31jf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKlC8n49gKwcQoybN3qC8vtDVppeK+9quHNW/raXvV0HSHFI80wpIduU3aqM8nzwoYAoOZ6eq/qY9Bsm/L+zStrecDwCWCK2H8ScCXJMkcAEev1Ry6KpkqjPSB0rdYJkjZA0oHzb4HySaNuJeoQnZo3XQN/hNdaD2vWZYKQmEj2OYPiwNIwMIqqktopXBTrB8ZGGAyyZ+mKgzWZZ3R01NNRbR15DKvl8dItMRsCoxR8yk1ASLdOjuSN3YJjzTOYi6dFqbp2Qkz9bdvZrUe1PxEDr2RLUhvtatTp9GVhtO87M2fBiGWKRofF8n3epUHA2v17EttYQBlb4zuS7OoFIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCleaf6UF9fK9KNtk34+bHMqbDi3R8vCmZ6phkafWNU=;
 b=nBvhzHFf5nenOZESCfgWCkNLtvIo9btYjZZdJU8+kMyI0YGsu9+y30nU8UDbXNG7eJs2WxlsKjQqa8Sa3LgPKysaj4rYrMbaR0FU6Qc+JktetnuzHSi+wfVofCMnPpHN1QKJx680i+YbltRZf1DJ+1hC9IeBww3quyomoGmQ5WPCADTlf5G/1iozldbMsLxgk2+1Pzd5KkrHTsqL/mgV4/TZRP6ZcCIlpEoGaIgLcDhlxQ93S2FPiU7A0Gts4cGeeCa9Eb4tMu2cxC2RNVQfDRz4kHUpQdn8fHuR71MLcs/yFXvaPN99bPER8zopkAEJ1Ng7pxs1XBy8MWFFfpZk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCleaf6UF9fK9KNtk34+bHMqbDi3R8vCmZ6phkafWNU=;
 b=ELtdMl/UigcglBazwmXMVAZCDVk0/JD97XjT/vny+OLd+YAr+D7tlOVc73e7W3nTVdMT5g5IwUUy5RJIS4l5IKCcluJAqxOUjxPBKXiNcDlixEZ7X+Fx10rcw5emzijaCCLoDgEWUWov5fTXpWNovbCOAvhgN1TaRRbgj7YpAes=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 10:48:50 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 10:48:50 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "Simek, Michal"
	<michal.simek@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox: Document
 msg region requirement
Thread-Topic: [PATCH] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox: Document
 msg region requirement
Thread-Index: AQHccv4aazCh0ehtQEKTU+QLk8ofWbUtX0UAgAGr02A=
Date: Tue, 23 Dec 2025 10:48:50 +0000
Message-ID: <LV5PR12MB980465BAF86F179E5638016A92B5A@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20251222044653.1757886-1-harini.t@amd.com>
 <20251222-funny-aspiring-seal-05c4ae@quoll>
In-Reply-To: <20251222-funny-aspiring-seal-05c4ae@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-23T10:42:16.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|SA0PR12MB7076:EE_
x-ms-office365-filtering-correlation-id: 79203d5f-0598-4f52-9f77-08de4210dbaa
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UW1IMHMxaXJiamJwR21oNzBOU1NjazllYktaU00wQzFsVkZ1Z3lMRVR0ZUdG?=
 =?utf-8?B?MUFIYTZaOXN3cVk0cFlVZ0ZaMVcyVWtNR0p3QllnZUc3OVE5Nk0yekRuYWN5?=
 =?utf-8?B?UExuZzhLeC9sT2t5OE03TS9JUDhTVUlEbnBOZndCUThER1hZVjVsSmlPeWFh?=
 =?utf-8?B?L2x6SmlxUEd5cEJsemRFaU84RHB1bnoxbmg5NXhLMWcxczhQdW5mc1dHQ3Jw?=
 =?utf-8?B?YVNkTkkxRFhCSHJRSnIyNk1WbFB1ajFMNk4wL0pmZkhnbGd4MjNRVjBYVWJk?=
 =?utf-8?B?WnJYRGxvVk9US2JDQSt2SnQzVjR1WDRjenZJOXVoakt3ZGdqQ0VvQXAzN0hC?=
 =?utf-8?B?aUwwakZQT2E2WmZvZVFDOXdPVGhjVXZYMGlVS20zVGxVZmJMdng4T25RWXlp?=
 =?utf-8?B?ZlFrMmVDQ1NrVm5NSjVQcUpJcjhjaTh3Nm10Q1J0Y1hKcWJpNC9xZWhjdHZi?=
 =?utf-8?B?cXl0M3dtUWhLTzRMb2laL0d3MmxRUTRVek9YQ0xNSW10S0liK3h0eVdLNkFi?=
 =?utf-8?B?L3BJL1lDMGJaSVdYOCt3bkk2RE5yMEc2aTg1a3lKbllkWERQUGVSekZsUHhY?=
 =?utf-8?B?eUVEdFlUdGZ6KzJGdWFmMzlLbUlyZEpUYU1SVTBLdFNEQ1lEdDBaS21xQ0hj?=
 =?utf-8?B?WXA2N0F0NzF6WXowR3MySml1OG9hM0lNZDlWVXlKK1BXQVFiWWN4K2NjWlhl?=
 =?utf-8?B?dU5uQUpZWVZLbWlCdlZ2a1dQQlR5cHdtWGJvcE1pVHpIVlRUQU9jUmdvMnlT?=
 =?utf-8?B?NnV1eDBUK21EOEQrRjZlNGk3M3JuUHUxK0huRXlKWHJvV0RjSEsxMHNkTW9T?=
 =?utf-8?B?dFc1dmsvWjJWbGtSZzd6TS9pQTR1UGZhYTkrcWh3VmduYkt3UVdVdzNLakdr?=
 =?utf-8?B?V0lGZXZDcjN2bXByNHlzZEVCb1hBOUdlQ3hrcjdqS09NQzhqVHBiNGVKYnYw?=
 =?utf-8?B?S2FabkJJaEJGVldsOC94VGd6WmJKeG9Za3lJSWlSUEdwSkVUc0ZYUitOV0Ux?=
 =?utf-8?B?ZXFuN0h5UXdVbHJlRTJuaFNLVER0b2tnMHllUVJnTnFCTXU4WWFLSGZqWVR6?=
 =?utf-8?B?UUJJSGEzMlBJYVViRnRZVnZEZ3FxSGw5dE0rRGZQYjdzNVZ1ZUtCbzJVc0NM?=
 =?utf-8?B?SlRaaU1meW9rQ0Vva3FpRHorVGdWTUVFaVYwamZHbjhEbzc5OVFmc3pFRldR?=
 =?utf-8?B?d3VTaGtDYkxwWUVVc2NGOTE2UFV4dnNwZnphY0p2bUpNTExzNjB6ak1nSHlN?=
 =?utf-8?B?b0p2azRmZ2wxWitIemwyN0Q0cmN4Q040b2VDMG8rRGRqUkI2THI5ekFwdGVs?=
 =?utf-8?B?S2UxSUJFdnFLMTc5TGliZHAzUzVOMHRGNnRsV3pYVE1Fa3ZzU29Bc21XMkNr?=
 =?utf-8?B?MElwUWhXcjNPVnpacUxOU2twdU1kOGVBY1hZci9DamF6MktRbzBvVnlWakQ1?=
 =?utf-8?B?cDJTYUNpSDJXUk9kZXg4TGJSZjJvMUN4aGF6OTJZVGdVdTc1NFdscE1iWVNF?=
 =?utf-8?B?S0NjYi9FSkMxbnY3NkdNQ1FWbzhUMWZma2FTbEp1NE5CS0RmNTRwNGhMdUtZ?=
 =?utf-8?B?Tjd0d2U1RkRsOW5ocGk2aEp3Y3NXMjErdWdQdlJlRVR3WjlOOGhMeDdZcWpo?=
 =?utf-8?B?YUx2dDAxZGUySkNCLzhsem8vMVdhNjF5UTU1Wnk4TTdZYzJnRlpvYnF0TmY3?=
 =?utf-8?B?WUJ3Q1BabHFCT2w5S2NpYVpoOTJyR2U0eGtVTXRrb2t3OWVWTFI0clBsUWdN?=
 =?utf-8?B?ckNhemZteGgvV2VacERiY0Z5bXpDMGZHOVA2UUdvN0FUNStaOWtzNXpqZWpz?=
 =?utf-8?B?YWd6eisrMlFKbGovTTR6YTJGK2g1dHZ1dnFYbDBOT2VrczY1dFd1ekx2K1Nt?=
 =?utf-8?B?UDEwbVhPTDBIVkNwekp2UzU4TStsMFRQYjc5cXBnck50M0E2VlFlLzN6c3BC?=
 =?utf-8?B?KzR1bjRVVFdxU1ZtOHJXWVdVT3pmbEtBOWhXRDh0aVFhdVV0R2l1d3VjUm5I?=
 =?utf-8?B?QXgwMG5MTFdzckxpeVhEYm8yV0VXU2JxL1JLRXpSREE4K2I3NzYrVkd2bnhU?=
 =?utf-8?Q?ghdj5t?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmNqcTlpamQrV3A4YWVzcy9NSnVOeHd2U0RsOTRBMlY4MTM4NE8vOXhNTytY?=
 =?utf-8?B?TExVS1pTV3dmWTRoUjN6dnRndXZNb2MrQWdxRHFUZjVyWGJiV3ZiVStZdjkz?=
 =?utf-8?B?WTBQNWZrUVozTy9oaFBTaUZ6QVllbW1PSTlkUHVsVzJFaFBrbHJZWEVLdTZG?=
 =?utf-8?B?YlZTaVQxZlUxUk51TmpadTduTjRqbnlFek9sZnRLZG1KR2d3aHlOUElsdmNL?=
 =?utf-8?B?WEZ6NXR4MWlHQlJlcWkrbDFZZU9uS3ArR3JpVSt4VzE2R0FrZXR1Uk13SDlO?=
 =?utf-8?B?a1FhaHhRa2JBN2JiR1duRC95NVRCejcxaEJNbWhIRy9aMG5IUVVvRWs1dyto?=
 =?utf-8?B?RUd2Y1BuQ0plWVA5Mk4xMXRPN3g2cCtrY0ttQ1lxSHVtaDJNeHBzOEM0a3dF?=
 =?utf-8?B?MnZXWUtGWEs5RXoyempSSS9SRWRicldIdk5NSHcwNXVsTmhZcVBUUUwzNzF6?=
 =?utf-8?B?aGRJSEJHSFp6MG5xUmlCZ3NkR3k0b3dpTkp5Y2lNUkl1MUdyTmk3RTcwdk9M?=
 =?utf-8?B?UGR1VTdCNzNkalRYT0YrK3QxbkdnM2Nwa2VXMjhNZ1ZvaitOTm1ubVFhWWJC?=
 =?utf-8?B?QnpkY3lMSGJyMjdzQ3BKdW9qWG5ncjR2SlRHWE9kcDFBZllXM3JHY0NsTFlV?=
 =?utf-8?B?N1RwVHlmSVhXVUxpLzkzWWxMTlV6dHhLTkZIL3NCTk0xUkxzYWNGczN0RFBr?=
 =?utf-8?B?MWR3SzZFVURFWmhIMnE0Y1U2RnBmZTIrcmZVbjVoODVaUHRmZUczaW90Sk1x?=
 =?utf-8?B?dzErOWtIaHpwdm8vdXVxMG9XWXpoYXY0ajBSTUVHL0dCSGg4RU9maTM1ajdw?=
 =?utf-8?B?TTRYazlJYzFQdnN3SlA2K0tkK2lBSXNXZWZ6NzFpVGthVVl5czQ4WDluUkFH?=
 =?utf-8?B?Y3FwTVhXMzBleDNaZk81Mkk3MEQ1ZWNYNVQ4NENKQlhjY1l1SUlVRGlreHpT?=
 =?utf-8?B?TUhvcVVwS0VOa3dQQjlrK1c2T0FnQ2VCRWRDZVFGKytmQXdwbTJWV0ZsbUpk?=
 =?utf-8?B?SWpXM0pzUVdBSmNhclV5ZmFkeEZ4Ky9FWUZYYm9tNHNyNGNCRW1WSnFtREpt?=
 =?utf-8?B?LzkvNHN6RGxpdXBNSUVIUGxpTFBpOFR0TFpjV2VCSTBEeWZzcklENnRPYTBM?=
 =?utf-8?B?RGRRK1JkNklPTytPbVRJdzJ2NDhzLzk4OHE4VTJWSGloS052c0s5cnR3M2J1?=
 =?utf-8?B?TU1IMkEzdW9DbTlYT2NTeFdoNDQyQWlBR1htUFdjbkYzaVNNM2VZQkJFc2pN?=
 =?utf-8?B?WDIyVEpaZFU0RXJRcUM3UkVDMkV3b2JGUVUxT3E5b2RSQmRTL0FXeGJTWXND?=
 =?utf-8?B?cUoxWlBwdHJvdTVoMzJDK0dqdUVFOHYzMFk5aUNFRDVtTXhpZitya2NvZW55?=
 =?utf-8?B?RTAweFp1TklpRXd5ZjJWOXZvOW5TTm9JR3hiMjhocVFKbS9hcmIyekd3NVk2?=
 =?utf-8?B?Wi9QNVBDQ3ZkRkd2R3JhdzJmdlFObXZFdm04dXJ1ZEkwWnJBdy9oQkkxNlRn?=
 =?utf-8?B?aTd2ZlAzc3BQaTRVc0NUNUxDQW5mZjVrQzlwSmh6Ym9CQ1FHRFNEUHpGSnZX?=
 =?utf-8?B?c0o0UGxTdk9QY2R5Y2oxcVZ0TnpJVVhFWitCaklpQ0xrTStaSnN3QWtudldN?=
 =?utf-8?B?U050K2IvVGZ4cmF1WU56WlZMZGM1WFFtQWtDbnMyRkw2Q1NIQW9CVVk4Y0lM?=
 =?utf-8?B?MTFvNGM5OTJzQ3hHdkVLTEFsc2k3bzJkTldHdEwyQyt1RDEyVVBTRi8xQ0wv?=
 =?utf-8?B?NzlTb2J6NzIzQzlxN2JrVGt1SjNLZEtsNk5lSnYvSElLeDZ2N1IyTGRVdWkx?=
 =?utf-8?B?S3BkMnlteU94RGxQNjU4YUROSjl1MUYzdWZhN0dCTkk2eDRTT0NpandzM3Fw?=
 =?utf-8?B?SEwvb2RUT3hLd0hmUE5PR3RtcXRVZ0hpN1BqREg3L1M4aTBnQm9CV3Y1Z0F4?=
 =?utf-8?B?TWIrSFlUcng1czdldFRyZlQ5NXozbkdZc2IvdkI4d09PTG5uSm94S1AxR1ZY?=
 =?utf-8?B?L1MySFFKQThnQndLRWJ3bUZhM0Fac2p0bWFZZWFFdkdkMTk4anFydVFoeXBZ?=
 =?utf-8?B?NUc0L0ZFL0F5c2pWVldKTTRsaTJmSngzZGpEWTNnWkxFTzdtOWIvRDZiVjVv?=
 =?utf-8?B?RTM2TzhCaE4zYjQybm1oQzV6dFBWWFVQbVovSXBmaDMwRlZrVVpVRXVaOXV4?=
 =?utf-8?B?UGRKUVFseVUyT3RsVUcyS0NQaStreUtQU09aVXh1Umo1Nko3YVV4dzcxRzh1?=
 =?utf-8?B?dW01c2J0Q1FwZ1ZNamtpcmtRYUNLNzZWTnRCNmNVVE9BREFRZlJFL2E5MDg3?=
 =?utf-8?Q?UwCZIvmzHJorrnj9Xz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79203d5f-0598-4f52-9f77-08de4210dbaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 10:48:50.5044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gl+i5oDcCwLntW9LbplKiADUnQuxGIHPOFLZvDyKsT3x9Y71NRpCkomH5OYYjk0i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_024859_860175_487CC9C0 
X-CRM114-Status: GOOD (  22.41  )
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

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDIyLCAyMDI1IDI6MzkgUE0NCj4gVG86IFQsIEhhcmluaSA8SGFyaW5pLlRAYW1kLmNv
bT4NCj4gQ2M6IGphc3Npc2luZ2hicmFyQGdtYWlsLmNvbTsgcm9iaEBrZXJuZWwub3JnOyBrcnpr
K2R0QGtlcm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IFNpbWVrLCBNaWNoYWwgPG1p
Y2hhbC5zaW1la0BhbWQuY29tPjsgRGF0dGEsDQo+IFNodWJocmFqeW90aSA8c2h1YmhyYWp5b3Rp
LmRhdHRhQGFtZC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBnaXQgKEFNRC0NCj4gWGlsaW54KSA8Z2l0QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIGR0LWJpbmRpbmdzOiBtYWlsYm94OiB4bG54LHp5bnFtcC1pcGktbWFpbGJveDoNCj4gRG9j
dW1lbnQgbXNnIHJlZ2lvbiByZXF1aXJlbWVudA0KPg0KPiBDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ug
b3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uDQo+
IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcu
DQo+DQo+DQo+IE9uIE1vbiwgRGVjIDIyLCAyMDI1IGF0IDEwOjE2OjUzQU0gKzA1MzAsIEhhcmlu
aSBUIHdyb3RlOg0KPiA+IEFkZCBkZXNjcmlwdGlvbiBjbGFyaWZ5aW5nIHRoYXQgZm9yIFZlcnNh
bCBJUEkgbWFpbGJveGVzLCBib3RoIGhvc3QNCj4gPiBhbmQgcmVtb3RlIGFnZW50cyBtdXN0IGhh
dmUgdGhlICJtc2ciIHJlZ2lzdGVyIHJlZ2lvbiBkZWZpbmVkIGZvcg0KPiA+IHN1Y2Nlc3NmdWwg
bWVzc2FnZSBwYXNzaW5nLiBXaXRob3V0IGJvdGgsIG9ubHkgbm90aWZpY2F0aW9uLWJhc2VkDQo+
ID4gY29tbXVuaWNhdGlvbiB3b3Jrcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhcmluaSBU
IDxoYXJpbmkudEBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvbWFpbGJveC94
bG54LHp5bnFtcC1pcGktbWFpbGJveC55YW1sICAgICAgICAgICB8IDYgKysrKysrDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L3hsbngsenlucW1wLWlw
aS1tYWlsYm94LnlhDQo+ID4gbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tYWlsYm94L3hsbngsenlucW1wLWlwaS1tYWlsYm94LnlhDQo+ID4gbWwgaW5kZXggMDRk
NjQ3M2Q2NjZmLi44ZmRmNzdjNzkzNWMgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC94bG54LHp5bnFtcC1pcGktbWFpbGJveC55
YQ0KPiA+IG1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21h
aWxib3gveGxueCx6eW5xbXAtaXBpLW1haWxibw0KPiA+ICsrKyB4LnlhbWwNCj4gPiBAQCAtMTY1
LDYgKzE2NSwxMiBAQCBhbGxPZjoNCj4gPiAgICAgICAgICByZWctbmFtZXM6IGZhbHNlDQo+ID4N
Cj4gPiAgICAgIGVsc2U6DQo+ID4gKyAgICAgIGRlc2NyaXB0aW9uOg0KPg0KPiBFbHNlIGJsb2Nr
IGNhbm5vdCBoYXZlIGRlc2NyaXB0aW9uLg0KDQpDYW4gSSByZW1vdmUgdGhlIGRlc2NyaXB0aW9u
IGZyb20gZWxzZSBibG9jayBhbmQgbW92ZSB0aGUgY2xhcmlmeWluZyB0ZXh0IHRvIHRoZSB0b3At
bGV2ZWwgZGVzY3JpcHRpb24gZmllbGQ/DQoNCj4NCj4gPiArICAgICAgICBGb3IgVmVyc2FsIElQ
SSBtYWlsYm94ZXMsIHRoZSAibXNnIiByZWdpc3RlciByZWdpb24gaXMgb3B0aW9uYWwuDQo+DQo+
IFNvIGl0IGlzIG9wdGlvbmFsLi4uDQoNClRoZSBzY2hlbWEgbWFya3MgIm1zZyIgYXMgb3B0aW9u
YWwgdG8gc3VwcG9ydCBib3RoIG5vdGlmaWNhdGlvbi1vbmx5IGFuZCBtZXNzYWdlLXBhc3Npbmcg
dXNlLWNhc2VzLiBJbiBoYXJkd2FyZSwgc29tZSBtYWlsYm94IGNoYW5uZWxzIG1heSBiZSBkZXNp
Z25lZCBmb3Igbm90aWZpY2F0aW9uIG9ubHkgKG5vIGJ1ZmZlciksIHdoaWxlIG90aGVycyBzdXBw
b3J0IGZ1bGwgbWVzc2FnZSBwYXNzaW5nICh3aXRoIGJ1ZmZlcikuIFRoZSBzY2hlbWEgYWxsb3dz
IGJvdGgsIGJ1dCBmb3IgbWVzc2FnZSBwYXNzaW5nLCAibXNnIiBpcyByZXF1aXJlZCBvbiBib3Ro
IGVuZHMNCg0KPg0KPiA+ICsgICAgICAgIEhvd2V2ZXIsIGZvciBzdWNjZXNzZnVsIG1lc3NhZ2Ug
cGFzc2luZyB2aWEgbWFpbGJveCwgYm90aCB0aGUNCj4gPiArIGhvc3QgSVBJDQo+DQo+IEFuZCBp
dCBpcyBub3Qgb3B0aW9uYWwuIElmIG5vdGhpbmcgd29ya3MsIHRoZW4gaXQgaXMgbm90IG9wdGlv
bmFsLg0KPg0KPiBBbmQgd2h5IHdvdWxkIGl0IGJlIG9wdGlvbmFsIGluIHRoZSBmaXJzdCBwbGFj
ZT8gWW91IGdlbmVyYXRlIHlvdXIgc2FtZSBJUA0KPiB3aXRoIGRpZmZlcmVudCBzZXR0aW5ncz8N
Cg0KVGhlcmUgYXJlIDIgdHlwZXMgb2YgSVBJIGNoYW5uZWxzIChCdWZmZXJlZCBhbmQgQnVmZmVy
LWxlc3MpDQpTb21lIElQSSBjaGFubmVscyBhcmUgdXNlZCBvbmx5IGZvciBub3RpZmljYXRpb24g
KG5vIG1lc3NhZ2UgYnVmZmVyLCBzbyAibXNnIiBpcyBvbWl0dGVkKS4NCk90aGVycyBhcmUgdXNl
ZCBmb3IgbWVzc2FnZSBwYXNzaW5nIChidWZmZXIgcHJlc2VudCwgc28gIm1zZyIgaXMgcmVxdWly
ZWQpLg0KUmVmZXJlbmNlOiBodHRwczovL2RvY3MuYW1kLmNvbS9yL2VuLVVTL2FtMDI2LXZlcnNh
bC1haS1lZGdlLXByaW1lLWdlbjItdHJtL0ZlYXR1cmVzP3RvY0lkPUsyZFVIU2ROT2tGUHBidmtS
NXY2YlENCg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpUaGFua3MsDQpIYXJp
bmkgVA0KDQo=

