Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0DFC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 18:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HnH+gezAwtcN4v9FunMFbv1VtD/8rgA0Ij1AmPfP/uk=; b=ty+sEiQ0zOrFu12dPBsVGRqMTS
	xw1zpcU1YwF4F65rinuw6xMErXMT5uT0MiQ8AlZRuiQs0gTAszqi5H7+QdYvV9e1cf+C6b1QT3X29
	J6Zo6d/uFsbZxdp23dgyQcK8Nd4t0g85E23XVaOrN+0+DHQ9BTED+36UkNkgFg59Iuf8TlD1+x+LQ
	FCa2aFUlg6kIy6SdnRoWs7IM7cPc1dbNmk74q0KZEwJiUT0ET5yD93/+BrxHMXgFHFsbPkc6uyRs7
	+FQf7fmpRZ+FxkmzeFqxYjdRT6oNLUxi53lw1fDLo9WvqZJMpC3pMLSWl37aBVB+zOS5NWxYiE65E
	8KKY9n7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbde-00000008vqR-27ww;
	Mon, 25 Aug 2025 18:09:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbVd-00000008uYY-10DI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 18:01:34 +0000
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GvWlGD7z11rGFqcUWIf6nA/uWoZhZi2wySI47YHCs2dRjBxwPObeuVLicnhi8OpcYBoxpyqiutjuhwsUtB2cJEvCD2fzW+eReS5/X0UtzOcN7cQuLA0rC8Y7Z0Gc+LnQvJ8gUcDrvHYZ2fBWdeC7+5YvUqmD2Bm38+8OOq9B0OqcWfXys+ym1LED5Emh8GRWudH4jYYfWzcDwlw1EbvxnlslEqDP6FmJS0uGg14z4b09U9PQ+yE0VsmReXY2l7lMCJWnFvShvA0scexFITfAGOijcn6zxt7OwEUSzGkSlU32Unei37Ta2lHeUUtzyy/6qNDwdcCR9mZqvqAy/X+09g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnH+gezAwtcN4v9FunMFbv1VtD/8rgA0Ij1AmPfP/uk=;
 b=L6p7yu2Erargw8C2olpNEcXbU4l6/VNpsitcqCnA8j2lN5EMBEO2dPjd+AZfLNvcIEeok3RIzZCyJVsHi/dPKy34G9en1g+cMxxTeVibyJuutVFDQcNFKfaPp+WNg1X2FLYPigAeEqoAnbxgvjY49Vj7E6WVbvu/uvpZO4LEw54Fja45YzB2c3pJRXIIKPnZnHfKRF8Lz/YW8QT23LtPvx2bOpI8t1TbUwBleH0DDMarevuEj5wfDNf/AujRa4EmQVc+wuS6FDev8v8bvj+FOm2Af116BRe/BjDXHmZ36ryBAZ9vBYCFL7/eH8UBKAsMxef7SZ+kkz2ZGb44vygqSg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnH+gezAwtcN4v9FunMFbv1VtD/8rgA0Ij1AmPfP/uk=;
 b=SM6S0KMvC24m2dcDJ787QQFt4h3LFLCNGZrX8aNCjDNV6MZSZWKO/zt8HGwXUHJ5QEiAKRtUtpv7dG3csFNCW9jTtoxA4znfZzjsax0CBF3QV62DddAXNyOR7SXeczab0+5w6KRDUjO0yV7QrtvnhPUz+ZfnV0/Vmr20pq46VGQ=
Received: from AM0PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:208:3e::19)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Mon, 25 Aug
 2025 18:01:23 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::e9) by AM0PR02CA0006.outlook.office365.com
 (2603:10a6:208:3e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Mon,
 25 Aug 2025 18:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Mon, 25 Aug 2025 18:01:23 +0000
Received: from emails-9722785-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-85.eu-west-1.compute.internal [10.20.5.85])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B0B1280368;
	Mon, 25 Aug 2025 18:01:22 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1756144882; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=HnH+gezAwtcN4v9FunMFbv1VtD/8rgA0Ij1AmPfP/uk=;
 b=bRHToQQi8VUm7k6Sn54gTMyUZjdQ1lfYv40vxew4wCMA3sp4OAbMg3ExEfMltaRpjCI2j
 /p4dAMDVfiV63rDIyYD+suxsBcRI9nDJHF6fcU7/RkxVWtmhdPjrY25CqzUFh8xPh/CASPa
 Or+t+mcdrS+bit/h5BbqTrZkKvCHOgM=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1756144882;
 b=ZM9p5jON6fyJhJeARf9vrsjRFlz5OLeijPSj+JBPyRFNKYnsnmtzIipm3pSAXt1p63KBa
 6bXBnEmFa0D2w9lG4KtKX5+pS47aDYlww1+GUfxSMCWOfT1oQ4K+rAYycoFYkc7bUE5UyaY
 7Ih+k3Gvj/CbTKFZH1gP7vswEwtbSUA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qg21FvQJnvGLIBIP7IufVhe1TNepCKgY2POlkuzmgyMc9HTO/kw74Q4R4F7lDzYIYVnFSWCvapW7FuGWPjDthDIHJw61T4v3+bhDf/QWlpSnDGZ5l9buAb+VP/onbaYU/uTaNvlNnTmAbjmEixnos2jiJNjlC+dV9x6vbTob0VnCSCbYyWN7UFHW/q96BRBW07WlHwNQONy7Mv8u/KwRuDLLtaNg0HTTmZzusHldLTatSw27KXJ3+BZCvCX+2JBpYU+biUH0R0HQckpORzct4gxlQShRvZrlxP9p9xDGw/AvLhC8caprpL/iQdX/lvBvstFu4AQNSWu8/M4rOhh6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnH+gezAwtcN4v9FunMFbv1VtD/8rgA0Ij1AmPfP/uk=;
 b=rhBLKMhpBNgS17cPdNArT2liKZCAZ/rm6xnPg1z9WNIJ3GA0TQTpWL0dCUN1WTRvLb55BpzTCek6gki5FuRppe4xnORL09/Y3Mnnu02U7pe39+dBl6p1dvgFzisVs3lmLMn+JzfTagz0Ep/1gwCp4ww+Yr2zT1X4JC3GgnJK36KAmhMWAsINmy9pthMQOqE+oa54fmCWG/MajiKKhEfXWudMoNteQv1h8j33y9DYWf+j6USGy5xau9izNKX1F9MqEOzHimUtLHgx5Ux6D/P+/COpFbafX/LO6L4+BPmUd17IGR3MTern6k5l/g/0zi5sQcqLqhOcvp+J0jTLU7+a3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnH+gezAwtcN4v9FunMFbv1VtD/8rgA0Ij1AmPfP/uk=;
 b=SM6S0KMvC24m2dcDJ787QQFt4h3LFLCNGZrX8aNCjDNV6MZSZWKO/zt8HGwXUHJ5QEiAKRtUtpv7dG3csFNCW9jTtoxA4znfZzjsax0CBF3QV62DddAXNyOR7SXeczab0+5w6KRDUjO0yV7QrtvnhPUz+ZfnV0/Vmr20pq46VGQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8289.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.12; Mon, 25 Aug
 2025 18:01:04 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9073.010; Mon, 25 Aug 2025
 18:01:03 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH 0/2] arm64: dts: lx2160a-cex7/lx2160a-clearfog-cx: add
 missing descriptions
Date: Mon, 25 Aug 2025 20:00:54 +0200
Message-Id: <20250825-lx2160-clearfog-omissions-v1-0-e3a28c0ea55f@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANekrGgC/x3MSwqAMAwA0atI1gbaSq16FXHhJ9WAWmlABPHuV
 pezeHODUGQSaLIbIp0sHPYUOs9gXPp9JuQpNRhlrKqMxfUyulQ4rtRHH2YMG8uHBAtXDxNp6yr
 vIPkjkufrf7fd87zFMzF5awAAAA==
X-Change-ID: 20250825-lx2160-clearfog-omissions-379bde1578f7
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8289:EE_|AM3PEPF00009B9B:EE_|DBBPR04MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: ee629f2f-ea51-4ce5-b11c-08dde4016726
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Zzg5R0IxOGtYMldHU0hqbU0xdXE1RXlQTVBGTU5ZeWVKL3I0MG84cE5PTFV3?=
 =?utf-8?B?bkJuSi9nSTBHRnlVdUtGb01LdFdGUTd2UnFHc09zLzVwSS9nNnFsbHhJQmlo?=
 =?utf-8?B?c3hQOTExcTdobERLYmp6WVhEM2pYT1FveTF1UFJrSGhhUlIrVGRTVGpPQzYr?=
 =?utf-8?B?cll4ZnpTMWQyZFQ4MXNBbGoycG1wL1ZraVI3aDZYYUZOdFR6OXZYZzZGV1VO?=
 =?utf-8?B?K0VXTEFFODIzVFR5L3hha0RZRXV6aTltelUxaDgwZzVIMHNKc3E2RlRUOElP?=
 =?utf-8?B?K2l6dURZZ3NvYktReXQ4cDVCV01VNDVEU1RyQXdjdyt4c2JDQ1NOL3pVcDlQ?=
 =?utf-8?B?Vko2OHRuZFE2VkZDWjBBSjJOYzduMlZXUm0yOHR5ZGlZOTJkK2Q2Qy9QZjYv?=
 =?utf-8?B?Z2QrdHBTbjd2T0xYekdScldzRnFMR2VTOGwvNXd0a1FoYmdIVDIyZXc5MzhT?=
 =?utf-8?B?MVdsTTVNTXlabXRzZC9Xc1haeUVsN0dxMk1DbDI2bkxBd3c0MEFPeHRQTnZn?=
 =?utf-8?B?TzN6cmM1czljLzkyZHNaSmFJOHU1RTRkazk2OCtrMXdDNklJdHdkYkpHTkEv?=
 =?utf-8?B?MzRYZTc4S1VQYXlwZWwrcDd0M2ttemZJVXNrcWwxcUZrZStFNVk3bm5ubElL?=
 =?utf-8?B?eDhFV0FiSS8wNVprclhZaXpKbEttSy9uQVl2ek51dXBWdUFWbm5NaEpMYWJv?=
 =?utf-8?B?NW9JeXNINFRDZGMrQTVZTW9JSjZoNFQ1dVhReURQenBWMmhLbm8vQkk1SU00?=
 =?utf-8?B?WGc3WjZTNHplaWV6NWNsVlhTV1daNk5jNDJXK3NpNkNpaTFhTlFnRXJhOTdy?=
 =?utf-8?B?bGlyUVJsRGltb0VscWpUR1E4OTJoY1RBTVpvZktVbGFsUXgzMndqRUtyN0RT?=
 =?utf-8?B?U1E0Q0xWUnZwS1JZRmlKRkgrTGlKTUZNK2dTT1ZGSlZ6N3VxMEZraVlXVXZm?=
 =?utf-8?B?NzFJUHlXaktBNE5HVnMwMS8rVmdzVlNmcjdNZnpvcmx1aUFmNFBpWmxZdzF3?=
 =?utf-8?B?OE02Qmc1UFRoZXhrUWo0ZnNvNjVuWWplTGJTMXNhSXp2STJrQVlFSGNMd2w3?=
 =?utf-8?B?TC9pcHJRZjVpMSsxZ0Q0UGc5SUowaU5rRVlNY1pZL2NZQkdJeWMzazgyTmVl?=
 =?utf-8?B?elFmK2t3NXRlQVZGWFpsVUM5emlQWXZ1MkNxdTR4elQ3SjFvc0FwOTN1Qmk4?=
 =?utf-8?B?VDBybXlQaXdHaVl3NmxOcklBRlJYZWRsOWJWRXY5c0FkdXpmaC93Tys3TWg3?=
 =?utf-8?B?VzdId0V5elAvTDVGdVc2OGZTaTg2TUt0dzJja1lEcTBNbC9mWEowOWNESGJ4?=
 =?utf-8?B?bHh0NEhuaHMyWVBWNFZXNkxqbUVvVnZqZUZhS25vcnpTK3BvMHVqc08rTEdx?=
 =?utf-8?B?YkFyU0ZpZGM0MDBOai9SM2k0NlJiM0pxWUM4cGFlSFJIM1VsMG44VThtTUlz?=
 =?utf-8?B?NERuK25rU0NjYmFGVi9lK0c3ZTI3YnhMWlVQNjB1R3hvTUJYYkx5U0ZCcnlZ?=
 =?utf-8?B?bDIzWXRtZmtqSHVPK0p2TlZSSkU0dFBsSi9GN2NYdWU1aDRrSzltUmhWdmN3?=
 =?utf-8?B?bWk0ejUwc1VmSnVGMGdMYjljK0dqN1BJUCtzQmZNTnJ6ZSs2aHBMZGlpRDkz?=
 =?utf-8?B?ZEdmZWNwVHpsSm1kcHJZRHI3L1c4cHk4Zk9Db0Q4ZnkrY3NvZmZNL0tjRHla?=
 =?utf-8?B?dlZ5NGhJRk0vM014V0FITDQ1WjBXVVVNdUx2OU5sSUsvTGd3dTk4NEhqUTdz?=
 =?utf-8?B?eUo1Z1NFZ3puTnowK0RmbXkxRFVYRzBvWjhncXlhYW5ZaG90UXF6c3JscTVH?=
 =?utf-8?B?MnJtT2pFYnVlM1NHUU9UVUJIZFFxMnVvMFhCYzViVFI3NXljc3JFZGlTYXZW?=
 =?utf-8?B?KzEybGRPQkcvUDVaVGNaaFlCMWxuTnFBSk9NN3JuWWxwei8rZlQ5T25heFky?=
 =?utf-8?B?OWZjZkdkclRHaVhjVDR1VVh2SE1SYWRRYkR1bjRmL28rckhGcnJYai9vTWk0?=
 =?utf-8?B?QTZ0dlFIMThRPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8289
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 057e86bd51a141d19536d6e99bb89364:solidrun,office365_emails,sent,inline:b7f6fed3d82496f51e06eac14cea92c1
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ae5f6650-2b73-47c3-e868-08dde4015b7b
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGU2RUV4bzFPMm5sTHFFR0pGK0RVMGZ4aVV4aGV1enlSeUFKcEl1QThrZzZo?=
 =?utf-8?B?d21hNlBzTHJ2c0pBd0NIMEZDSHVuR25lYnFvZXNaV2orU1U1OXdZSVhHMlJ4?=
 =?utf-8?B?bExVTWxodmpJUnFZNDJ0MXVEMWU4UTM1aFMra3cyNitBNWdhK0phWFRRQjl6?=
 =?utf-8?B?RmtnUGVFVS9Wamtra2Uvb2tUWUFIdFJTMGdvR1FKV1hhOHc1bjlRODAwRWl6?=
 =?utf-8?B?WitRcHQyenlsSVVRL3R4QmxrUUc4dFB2dnpNOW1Idy95ZCtqRWZ2cnZYcy9M?=
 =?utf-8?B?UWVyWFR3T3ZYK2Y0T1NBMkx2bUcwTkJ4MTQxbzM1RTlqTm9Pay9KcmRSa2Fa?=
 =?utf-8?B?K3VUM1MzV0trMUdCekZZeDl2VkRYam9rMVBqUXlQQ2tuRmVyK3JHL2RhSWVY?=
 =?utf-8?B?OTAzTTRMdVhSVU42OHZna2EyRDhrZnY2WEdiZ1pOazZVMk9hZjEvbE9VdDlZ?=
 =?utf-8?B?SG1neWp5Nk9EdWdZRGpxanJTcUxwU3hMNkJjQ0pvOW5PMHFpTi9zUVdsaFJw?=
 =?utf-8?B?MUVBMDFieEI2cGlSeHJ0NVFyQjNLNW9MeGROUHpGSEVVbUd0MGlCRTFRN252?=
 =?utf-8?B?ZFdZYWpYSEtRQUlNQUwybzZzUk5ZdkwvQUhpUE4vSWo0bkxRZk9aRFdVd2xD?=
 =?utf-8?B?RzRGRmhRRGI5R0RsOUdTN1Jpd3ZWVmFPMXRhMzdBY3phdU5ZMC9HR3JweVBv?=
 =?utf-8?B?ZnJwcWF1ODBxN1pYNlJSMmkxcndoRXJpaE9wNjFRMzJQNElZN1RjVWZWQ0NZ?=
 =?utf-8?B?VHUyUEU4MndKd210T2VTRjFiS0tSLzV6ZTd3eFNiVXZJbys5U2hrTjJ2b2R6?=
 =?utf-8?B?ZDZSUVcveFVnQTBNRzNzVTZ2VjNMM0M2SVdEZVdUUHNhczg1akhjNkhOaFhw?=
 =?utf-8?B?ZmdPNGVsT2syWUZHTU12bFo5SmJQb2lTZXlEYnFaRkpXZVZvQWlGOHd0YTMy?=
 =?utf-8?B?VXBrOWNaT1NqdDVTZmhVYzVrMU9kSzhUcUhhMlNNei9HZWV5RnhxMGNsSmpQ?=
 =?utf-8?B?eFMxTTRoSDVzV1VaSm9jTUNjcXZ1Sk5GTWl5cjY3TlNLaFZlUTh4MTczYWJV?=
 =?utf-8?B?RjlRZ0xOQ21kVFczMm5TVVR4Tm9lRTJ1UUhDOFppWlJPek43WlpWVGNLWEJq?=
 =?utf-8?B?VUVIUVExYndTQmgxSitMRzIrN1YxcXdvYlJxbFNlTXorRUtXS1QwRHR4bGlS?=
 =?utf-8?B?WG43MklXYzBrY0hHeUw1Ly9LYlFlNjB4R3BBL1hsSGxmOVhpbHpNTm1DMmhF?=
 =?utf-8?B?T1lMbHR5TzlKbnI3RUR3SGxOeURnRSt2dnpPY3EyREdNdXY4R2lIbUplR25L?=
 =?utf-8?B?NXVOWU5zV21yb04wclZ1V0hjMzVNT1FVTW5ObVhnUktCYXdFVCt6SVBYZGlX?=
 =?utf-8?B?a2ZVcFErQVQ4UGFlMkJPd0tHSFRWRllyeUxUZlp3WTlENUN5NHFzZFNkRlJ6?=
 =?utf-8?B?RlVwbEpmL25Ic2VLVWxWVCtnR1NTV3ArYmFOS3RiaG9UNHBUbm9Fa2k1Rzl3?=
 =?utf-8?B?aG55TjZVa0F5Wkt1M0ZTaUtGcnlZeThBMTNlSlJrRG9hQ1dPa25MdTc5OGxV?=
 =?utf-8?B?YVVPNnJHbFZGWG5zeEIzUWRrNy9yV201NThzQzJ3bnRGbkZralg1UzV3NjVl?=
 =?utf-8?B?UlBDdmxCVUdaek5Ydm16d0duMzA0dHFIM3ArR096ZDZMQ29WdmdXeFpVZy9C?=
 =?utf-8?B?cXdTaElwbUlseDIxTDZjUHFHYmlDLzR1QndvM3NwUEc0OEZqZjRIRFJ5Nk9k?=
 =?utf-8?B?R0pKQVVpeTdyd3hSTHg5NFB6SFhjSGl0RkxERUxhRExFS2xCRmFrSXFZbnBs?=
 =?utf-8?B?SFN4aVpuMUdRSG0rQ1IyQm8yVjIveXkwSmh6aEJXM1o4UEFxaFkxYm9QbmY1?=
 =?utf-8?B?b3Z3ZjJyRXpUbUZUOE41T3NibXo4RisyTEVPQTQ3L1g4clJOUG4zKzI1MDJp?=
 =?utf-8?B?VGs5OFJUNXFqVDk4dU8yc0x1c2h2WGRKMi9vWEx0SDVieWZ2NHN2clV3QWov?=
 =?utf-8?B?WWVrNDQ5azNSRklZamZER3BXSHN3ZTdNZ1c0UFZ2Z1N0NEpHTE1UejBQRUp0?=
 =?utf-8?Q?Kjm5Tt?=
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:01:23.2250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee629f2f-ea51-4ce5-b11c-08dde4016726
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_110133_432254_CE59CF90 
X-CRM114-Status: UNSURE (   8.10  )
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

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Josua Mayer (2):
      arm64: dts: lx2160a-cex7: add interrupts for rtc and ethernet phy
      arm64: dts: lx2160a-clearfog-itx: enable pcie nodes for x4 and x8 slots

 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi         | 2 ++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 8 ++++++++
 2 files changed, 10 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250825-lx2160-clearfog-omissions-379bde1578f7

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


