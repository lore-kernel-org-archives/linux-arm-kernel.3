Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A89CD342D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqPrrYoqAf/2+zzIvZt3a4GzlBjB/S+t5/xUj1Nd9/w=; b=srb5CI2x2UPsxRaNzZXiS3AIrW
	Fup2qV+kqSPeYxhIsGWaay6fhkm0n62Qgms5Lc5Shy0aVdGwN/m07Eomig/2ZVnTJrUml+jyjFJac
	AZxOTPlUcEqkQYeN7GK9dBWbtHQsjKEmc116vfFvrujUhg7XhVSgk9W1CsYyJrKnmkbshqq1aNrqr
	drhXQuXeoWEpxLv28iCiza2W5C594fhX2UTSjsof9GVQPwKiKs82VLUWWW4XNZTDxjNDYv39Zb9wc
	Q9NhMwmZB/aNrjnQYtH2O5dVTban6HKiqOCS5iPoaA/2RFtS5lVpi6q1Lk1k0T+Us3RmhqeXiU9nu
	rzPAnheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEcv-00000009FYd-1Jne;
	Wed, 12 Nov 2025 17:27:25 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEct-00000009FYD-0RXD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOXk0cb+OHNXuBU/W/pmuk4fTQwhJzYRCtTf66CVkiQEh+3IoJ8f9weVXn0IVTIODUq2HaSfsVlZiIGIVxBQmEVjmPaDD6wRN2JddPkL+cqGWAB6Sg3VKZeckmdwOPuvVIBA0d1/Y4IhcqOyA4e+Odh9AoUk41Oe5Nt1MkZMEfM/rF5AQVTlBrTVV5ixhtYGBCDO4jnYYzm0aJpu1qixs+oFDAsFOuNc+MRuKKZBs7Uh2ilnOSXLLxf7e9qUj0MhQasiWheB1reRbhjC7UovK/muKHWwxAlW7+FMduzZsEYf2D5NjVZFLRhy8yuJbcBnprT+ygHCCxOlQ4Ew/sWgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqPrrYoqAf/2+zzIvZt3a4GzlBjB/S+t5/xUj1Nd9/w=;
 b=cYoxIa0UkUCCAHC8GZWkwmujCXVcquspBtEWqajJSQloGydEVQb5OOjX+kzaISM9t9dClxNSWq01mUbcrzmtZKsNKg4YT6PO+SG67tRsGTFDZeH8eqV583JqzjQYzG8zZl86Z86V9VFon5wpduKh+OzXIZC6E+R45n8oKUeElevvl+7pKX4l9ehuV/hmfPygVGdSkouldl2pyaIVCfZP1tLsEKepoFUECM9Jzd+EkUYO7lWbRwgY/YFmu2tLUksdaV613ySG/P3F1n4yAFSmSRBJnvizPwISoWcaghT/YYMvQBQTJ8nVGc+/xYKnNjmgs6MG4M/CyxAJcOWF2rn61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqPrrYoqAf/2+zzIvZt3a4GzlBjB/S+t5/xUj1Nd9/w=;
 b=i10CzqR8a2kNGp2qpKpqPUAMgEd7EZqHwh3IfmqeVsZiU+oQOrvAuOQpCWSTrR35Jyn+F28QM5OigZHdbFTtyMwCBubCgeo7rEY4V01iZSJBQZ038jr1y/+Pz98eycNJrN4Y+NcgX3S5kIGYlPEIJ/5Zc/oiQzCpaK3vEdBzWGxj3P68YdRpyiqxSr4bgM0o6niXoqApSxKSu5YL42NiCxcE4ykylJF7pOxsJ0G0PajoNuwwMecgVWJKzd8ydP53h2a632I9u5OXf1UZlqKz2BTukQ71jE+UTZTlaSabj3gN2QJq5aqp1C4stwx/pRkhVxvgMmAvzAoD7QMDqoCiAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB11084.eurprd04.prod.outlook.com (2603:10a6:102:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 17:27:18 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 17:27:15 +0000
Date: Wed, 12 Nov 2025 12:27:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: "robh@kernel.org" <robh@kernel.org>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add
 supports-clkreq property to PCIe M.2 port
Message-ID: <aRTDZ1lU4V5AxIQ5@lizhi-Precision-Tower-5810>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
 <20251015030428.2980427-2-hongxing.zhu@nxp.com>
 <aRLhko0h1OZgvo2o@dragon>
 <AS8PR04MB8833D099959C62A97AC8CB868CCFA@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <aRNf3TUTawixqGR1@lizhi-Precision-Tower-5810>
 <aRPn89vIkmije-Ks@dragon>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRPn89vIkmije-Ks@dragon>
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB11084:EE_
X-MS-Office365-Filtering-Correlation-Id: 1539c0c7-08de-41b7-e54d-08de2210b782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFdyNjJSbTVrUEllRzZFN1hORllPb1dna0liV1JPMk9JZW15aVkvQS92QXJG?=
 =?utf-8?B?TnpId1l3d1JnVHJrWkhvUVZYZE5hVlJzUTB3bHZwTGdXdlhvamhtSmNRekpl?=
 =?utf-8?B?WFNlQmwwSWFmQ0NUaC9HaVFJOHBJSTZLdjRnRHV4dmhXem95Z1RCYzBha3NZ?=
 =?utf-8?B?VlRDOW42VWRVaFhyclVXSS9OZnorNDFHTStCV0hsSERBeW40dWlrZ00zdXIr?=
 =?utf-8?B?U1BUUTZWSEViWUVGZjBXN1BPQjFoelVMVzRwSkQxNEJ0TmkvZ29KdERIV1hw?=
 =?utf-8?B?cTNUZklHQldOMmtGNjUrUE1SVzlQVHRIazBMQ1Vyd0dTZE9DZFBwMWhwNnB4?=
 =?utf-8?B?MWowaGlwNWx2VG1DMmRVa2JMT0tpS0k0a0ZsZ2NiVFMzdGQwUFRHdWEyZ3My?=
 =?utf-8?B?R0h3c3RWTWlpaHVURlhpOHpjNHBlU3lVS2Q3L0VhUktzcUdXazhRS2pVVFUw?=
 =?utf-8?B?dVc1Qno0b2doKzdvZENPQU53UGxyYmFtbjRjSmlYTkhoeUc5dVN3UytqQXNX?=
 =?utf-8?B?OGdIWmNabldYeUpyM09tS1VDRi81STNMdTZWeU9pM3lvRUk4Y3RZMFdZZHdI?=
 =?utf-8?B?YTVyTlF5dkllcVphaXlpamNlVE04YlF0VUYyWm8vVDE2cGxvRFFTSnkzVGJo?=
 =?utf-8?B?dkMvVnB3SXhmWHBXejRlUFgzQlprcjEya0h1Q2JxUUY4TTVKWTdBNlU4dktw?=
 =?utf-8?B?aEpvZVZ6RzJNbVR2dVhBZjhXMmpkODZvUHoyVWVSZzVSQWZWNzRNZ1VrbUo0?=
 =?utf-8?B?cTZlQmNyV1RBUk94YTFoYStVOUZuYkd0bzdPdk1UZzlFaDFJZEIrMWtXZkVs?=
 =?utf-8?B?VmduQ2FMa0FlblljSndsMktFNm9Ic2RTWTF5ckZWbzBKQ3RnVXVyNVBFdDM5?=
 =?utf-8?B?Yk4wRW5lc1dqRGlZaG04amZwemsvaGRrMkw1b1JyRVYxQ2ZRRmRQTmpSU09G?=
 =?utf-8?B?ZWhWT0xQQVE2LzVjdmZaN0FUbUxnMmtjTHFoUkdaWmxUN1VnQUpsV0NvMVNl?=
 =?utf-8?B?M0c2ZmNyaVRHVHFjRUFOL0dsT2hkVU50a1plOGlhNXdqK0NRcDhLZkdSVTVS?=
 =?utf-8?B?RGd1YVhJRUZRdmE3Ukh1cGhYTTdoTXl6Ylc3eksvYU5DbFR3WC9YeGYvV2tx?=
 =?utf-8?B?d2laVFlDU1piaUhCUmQxb05sYTVpeEIycGk4VFQrRU1xSFN0UUNwdkZCV2RV?=
 =?utf-8?B?VUxkYkYyNHhmaFFQMVZMVDdjRzNYSG1NcVB6aE1KTzR1U3grYmNnN1RvVWlq?=
 =?utf-8?B?TUg4YnB3N1dqMk9qMXVCaXlNZVg1TWpzZDlBYXpTWDNhbFVHUVZNQmhJYXJl?=
 =?utf-8?B?U1lJa3dLbnN4THl2Y0pwZEZLTXNOT0hmaSs2dmZZYTZGL2J5NnZ5Rmt6dndG?=
 =?utf-8?B?ZVZKQnQ3SVVvU3NqbmhhcDdjSnB2RkpZK3Q0UWdzcE00RDNZVDU2VUJOZjVN?=
 =?utf-8?B?R0NxK2N6TURCK29QRVB4VEhYMktUcnZDVzBHYjY2dUtnUVBLcWpncFdqcDdM?=
 =?utf-8?B?ZHM2MTh0Nm5qd2VCZ29VbnkyZUpla1pTdUhOSmUvd2dJUlF2eW8xbmYvdG15?=
 =?utf-8?B?eGRZZjFEU0FiTHNRSEZhWXIyaDdTallqYVQ1ejl0clVhWHdJNnpxcndKdVMz?=
 =?utf-8?B?MndoajZ0aG82QzBJb1RYUEVuOVZWY1VmdHlrSUF3cFpxMHNxN1JSalBZc1p3?=
 =?utf-8?B?bHpzb25INExOcWR4ZFcwdGFQTDF6Uk1YTHFQUndMNy81dkdNZG51MnJIelAr?=
 =?utf-8?B?Rmp4SzdWMTNZRUJ1K25JUWM4TTJFVHFDc1RmWUR1czJkb3ZoU2FmamFqdGNB?=
 =?utf-8?B?YmxueDBkemtpdmo4aUo2MkUySnFGdlRuYTY4MnByZS8zVklVbURDdkM5Y2hr?=
 =?utf-8?B?Z2NzVHRyY3FzaFNxczdCaEtWMHlFSzVWRjkxcVhVRDlQVzRMUG05K0hYS2hr?=
 =?utf-8?B?WDQvQmpvZDZlK21pK1Y1TWtqbEMvOWZpTWg3OWRxYS9IeDlmQ2pWUjVXcVp5?=
 =?utf-8?B?Qytpc1lFQVZadDlVNnhKZkJSU1k2NTJBVVdBTExWM1hkVDZZUkZka1VQUTJP?=
 =?utf-8?B?QmZ6RHpBbW1YcE9xZXBjU0VaMTZ2ZmoxNlR2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmlNdTlISlZvVnU1Tmp2aWNGZWIzbXZoVjVzNjg2SHdORDZyMVBqcjc5cTM1?=
 =?utf-8?B?MVRYS21NeU1zN2pjaytKcmVEMWsrd2ZwZTc2eUtpaWRCYi8xQmVVRDVkTFJx?=
 =?utf-8?B?M2xBMlJJMGowUXBpdFVWbSsxbDB2UnhBYmpISU1Zb05IK0d3a0ZZK1JHbCt1?=
 =?utf-8?B?d0t1Q0pBSnRaYUJ0YTEvNGpRS1kwdGFRZlZ1YzZYVjNrNVYvQVl4ZWJ6R1cv?=
 =?utf-8?B?RW5SRk5mbUhXNkkyRmxONWJlRlM3djFDSFBjTHBkOVlGWGdKK2Q3QW53NFNy?=
 =?utf-8?B?SFAwbUNHV2tXYzZCOStVQlNPVWVLdWpoeW02MUpaN1M5WmlJdmpnZ0hjMEF4?=
 =?utf-8?B?S0hHR0RMUmxHU3BtUnlyeXNPaDlhS0tzL2VrenhzRjhFTkNRNkRwdVdod0JX?=
 =?utf-8?B?RU1BeUo5VWFaN2dNZVVUcVRmcFZYQ0JMai9NMXRCTmZ3U01LTytXVVJKY1d0?=
 =?utf-8?B?WUlETS9RWE9LV1Z6SmNSbVJ0ZlQrbldzdDIremQwZE1UYllhRkJlSCtOT3hG?=
 =?utf-8?B?ei9WWVpRRE5lT29WOVFkaUlMZm9VOFJnS1FxMndBVGRXUHRsell6YkhyR1Mr?=
 =?utf-8?B?TkdWdjJteGtjS1lHaFBOQTdOUHR1MndCUDc1b21BM0l4TmFzNDBydE8raTB4?=
 =?utf-8?B?RkQ1Mkw4Y1c1cU14NVh0aWFlUlV3NkJXQ3M4ZVdLZGdtanVXRCtXZ0FRUDRQ?=
 =?utf-8?B?OUJhcXBRMTlaOTZaeVFyS2E3KysxUktYNmNScUF6Sks3OEtSNHZiNzZpVnJU?=
 =?utf-8?B?amRlMzNvWVhvRzVNd0lVZWJwSnRIMXY1WHJzeWZBd3lpRWs1cENzYVJDZE1T?=
 =?utf-8?B?MUhQYnZoU0p2WnZieFpZUjFYdG5BMmNBbGVOUnRmaEZOVmlUWE0xMWdQdUJM?=
 =?utf-8?B?ZXVuLys2ODdpamp6ZkFIZWI2S25EUlk3dEt0NllCQTA5RWJyS2szRWI3T0w0?=
 =?utf-8?B?RkFRUk10TC9nMys0L25XRXVDTFdGUUpvcm03RkpNRnArd2J1clFhV3h3N2x2?=
 =?utf-8?B?RU4zNTNBRmE5TXVOUWtidkhTOFIwOXhUN1ovY3I3Y0xaY1RZU2hWRkxuS2hj?=
 =?utf-8?B?cWk2NFJQMUJJZHNVazhnWXZzRitITHk1NTh2MVdKTDZtRmxoMThsVS9rMExT?=
 =?utf-8?B?TDRlaVpIL2xnaUJudFRnRVpUMXU1c1hsTkdlWk9nY2NzZXRuWmVKRlF6Zllm?=
 =?utf-8?B?OW45aUQvejFhRHB3QWh6dmlmYUpKZDVxaXVHby9JQ2krWHpJeTNYWEhlNytS?=
 =?utf-8?B?R1hYY1dBWHR0anlJSkNrYnRscndTdHFlZnVGc1UyS21jS2lUREVaU014by90?=
 =?utf-8?B?Q3hjNWdaWUNIT2d2TkRIdDZFTzg1RkJmR3dwNU43M21saFI1cG9MR0I2MDlZ?=
 =?utf-8?B?UGszNE5OSGYyb3VUYTJFZ1d6NS9jWEwrZy96bXAyU3g0eHJTTkdXOWpaVG1i?=
 =?utf-8?B?MzJucHVmY1lpMngyUXFSZGZKdDc4R3BwTWV2b1JlRWRBbHBtdGtCQzZsYUl5?=
 =?utf-8?B?UHZjUVZzem92bkpOcjBlMmNkK3FrM0R3MndaLytvRnlsMkVMRTVwZlZTb1B4?=
 =?utf-8?B?b3c5ZkpIZUp0bjlmQWFleWowdVE1d01Qc3ZjRXBSSDNKMUZnTE02bWxsSXRF?=
 =?utf-8?B?K3FJanhOcGNlNzlPSUFsaEVpazFpTnJBU3J3djR0V3g4MzdMR3gxUDJzM3Yw?=
 =?utf-8?B?aDJlYmtsTC9YbFR3L0hDK3QyYmpSNjZLdDM5RU9HaVZRTzYzSDd4Y2cvVExZ?=
 =?utf-8?B?M1JIc2J6SUV5NXY0c3BDUWNTUWk5Y0t0M1pGUTdtVmdQZVZGUzJUOXNKdkJ2?=
 =?utf-8?B?UDlCb3dvUTJndlVHL1VtVmtBN1drdzlGMlg2R2R2bGYrOWY2WFVtMlJaRmUr?=
 =?utf-8?B?enpXSCs1MG9ERWJhUWcrTnNhNDNFMWFqVzl5dU9qNktscm9RcVBXTnpBUjI1?=
 =?utf-8?B?ZThGWk5LVDd2bGE2dWNoS2MyWUs4SHdhSGFHeVZxdkVrRGo5Z3dGVS9NaUdW?=
 =?utf-8?B?OHFCZHdqQVowOXRQeW1FZ2M1VWxzRGJFbmptekVYdGY5cG00TDRsZStyQ2Yx?=
 =?utf-8?B?U0o5cHMyOGlNdFRzcDcwUlY4K3JxNW9uTjVVQVA3TVYrcjR2QTViN1FuRTJM?=
 =?utf-8?Q?XIMcbqDEw30Y31omhnq9++M6R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1539c0c7-08de-41b7-e54d-08de2210b782
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:27:15.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4G8jhyVo4fXl6u4EicA8sytNIUfEfBiRafZ6J+BwDA/HaVOYlydC0MM1gtzV8OOekWVwxC2eGJ8r1yQPn02sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_092723_326726_2F16B832 
X-CRM114-Status: GOOD (  33.94  )
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

On Wed, Nov 12, 2025 at 09:50:43AM +0800, Shawn Guo wrote:
> On Tue, Nov 11, 2025 at 11:10:05AM -0500, Frank Li wrote:
> > On Tue, Nov 11, 2025 at 08:02:35AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Shawn Guo <shawnguo2@yeah.net>
> > > > Sent: 2025年11月11日 15:11
> > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > > > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add
> > > > supports-clkreq property to PCIe M.2 port
> > > >
> > > > On Wed, Oct 15, 2025 at 11:04:18AM +0800, Richard Zhu wrote:
> > > > > According to PCIe r6.1, sec 5.5.1.
> > > > >
> > > > > The following rules define how the L1.1 and L1.2 substates are entered:
> > > > > Both the Upstream and Downstream Ports must monitor the logical state
> > > > > of the CLKREQ# signal.
> > > > >
> > > > > Typical implement is using open drain, which connect RC's clkreq# to
> > > > > EP's clkreq# together and pull up clkreq#.
> > > > >
> > > > > imx95-15x15-evk matches this requirement, so add supports-clkreq to
> > > > > allow PCIe device enter ASPM L1 Sub-State.
> > > > >
> > > > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > > b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > > index 148243470dd4a..3ee032c154fa3 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > > @@ -556,6 +556,7 @@ &pcie0 {
> > > > >  	pinctrl-names = "default";
> > > > >  	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
> > > > >  	vpcie-supply = <&reg_m2_pwr>;
> > > > > +	supports-clkreq;
> > > >
> > > > Is binding updated for this property?
> > > >
> > > > Shawn
> > > >
> > > Hi Shawn:
> > > As I know that It's a documented binding property as below.
> > > - supports-clkreq:
> > >    If present this property specifies that CLKREQ signal routing exists from
> > >    root port to downstream device and host bridge drivers can do programming
> > >    which depends on CLKREQ signal existence. For example, programming root port
> > >    not to advertise ASPM L1 Sub-States support if there is no CLKREQ signal.
> > > ./Documentation/devicetree/bindings/pci/pci.txt
> >
> > Shawn:
> >
> > 	This file should be removed. It is already merge to Rob's dt-scheme
> > as PCIe standard properties.
> >
> > See: https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml
>
> Ah, thanks!
>
> Rob,
>
> So it's no longer the case that kernel Documentation/devicetree/bindings
> has all bindings documentation?  Or it's never been the case?  I used to
> grep a property in the folder to see if it's documented or not.

Many common properties already moved to
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/

Just need run CHEKC_DTBS. Now imx6 (ARM) DTB warning should be around
1k line (after applied my other warning cleanup patches). If narrow down to
patch touched boards, only few warings.

imx8 (ARM64) should be below 100 lines, which cause by recently binding
doc change, suppose it should zero.

Frank

>
> Shawn
>

