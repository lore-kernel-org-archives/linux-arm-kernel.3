Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131CAD4663B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGjfF9nOoMXVWgaH3CvbxOCBrwbxf5Q1sTwVx1J92Kc=; b=kgS/V5+NPH011RPuw7sbBvINau
	TdCRA7jZSMvK+QvOraQwbw95SCXdVDxGKjJ0WMwu2Lkllxt2uzoe9fKBQjIfa9QY41WpcimTsIGEw
	T9rbtqchF9vXKJtDc5eEr2k6gwxM4b1gWu609F1k8wTgVIidlVPeB++U67YXoPRobbM1c4i0YW8le
	mCgeGhWar2ysCn2s2r82QhgJ+/0J1TPJV4zLPEZ3syF6rokhWBeaaqYRLLnjMf6c6WjmkOBz2t68U
	jUl36n9bQNPjE1WwHAlNKRhzLTjWAYBl5XpesZmU2qiF/Su+2WtwVZ+BRWXKmWMGpxDOA4caz1hZl
	mDE3sjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWRY-0000000DIh2-3B0P;
	Thu, 15 Jan 2026 23:07:56 +0000
Received: from mail-southcentralusazon11022072.outbound.protection.outlook.com ([40.93.195.72] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWRT-0000000DIep-0KSA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 23:07:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZe5xKni2t+lEic+AO91T82nBu83cYfFE7cq9w3k4ocBNCWQ2xqHF52EtiDNKAU38yv6jTZHugIzrfqaGCJh2FHuRpSDQol5ejEhFT0gGDjuf1wH0MsqSQpLu7T6Ln/BBV51fqJGYdnkrxl7aEe0U1gB1c966SWVKVURuZAd3k17a3hgwl5TQqUx+zXgMj9bOt3lVRzoGru/7KlLvdjgKHWX3u1PaHfCzvIAoeIcjI15H1GN0fR/pofgaLUlXTYvdUJM2uQVAG/9nvStZmytB7h/Nc8Ko694RgdsHS36+XQMUtXXpz4VQJOGWA1VqegsBWIyq+u1wV/lu5K36ayv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGjfF9nOoMXVWgaH3CvbxOCBrwbxf5Q1sTwVx1J92Kc=;
 b=AwxGcHDe6nVbzSYHZ7aQtgpGH1hOTGzjSz6JWYrQju3DTthv70XwaCpODKWcGg/FCc4dLXhc4SHcVlJaGHisJRNfe1SqdVZhwln1VKnsPDdrJE1sNNgqXdyMerbRomV97Wxp6TTHsKzn2kCqNPEYdO06D2UM4D12hHDz+J+GPqjJCKRH2J6DKr1cNnfM6XztoFqN6JJRRXKzPh6rkzaQziErdBNUWLDTRcKZEv/8kMqTg3UmuCxD2joZG3hbuj5H+X4dPt3vyCXeSgHX56+6Nc+A0lX1JQ33UYYPaWQLc+F+QwOMbjwS11B7pkIZBzF079SpDjDflaNwcnYz5rxubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGjfF9nOoMXVWgaH3CvbxOCBrwbxf5Q1sTwVx1J92Kc=;
 b=BKBV+G+vZOUfoafqWwEtmiXed0PPbNtQivwh/8LH1PAXxiWYg8Q5pERhZgSeon1rMlyVWJeSEKGED39wccUVwgG/cSr+XXlzaloNdUCwdYCaCRdZBH2QmERJRBmG4nCXylhIg3y0LZAEcK0B7kyq+lv+K20MCkyU2qq5tXkqH+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 SA0PR01MB6252.prod.exchangelabs.com (2603:10b6:806:e4::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Thu, 15 Jan 2026 23:07:47 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 23:07:46 +0000
From: Carl Worth <carl@os.amperecomputing.com>
Date: Thu, 15 Jan 2026 15:07:17 -0800
Subject: [PATCH v2 1/2] arm64: mte: Clarify kernel MTE policy and
 manipulation of TCO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mte-tighten-tco-v2-1-e259dda9d5b3@os.amperecomputing.com>
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
In-Reply-To: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Taehyun Noh <taehyun@utexas.edu>, Carl Worth <carl@os.amperecomputing.com>
X-Mailer: b4 0.12.0
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|SA0PR01MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 0694951a-de0f-4cad-7d27-08de548ae586
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2FWVjliemt2T0U0YUdnenpRSmFuZGZ2Zk96Qk5BcWxjMGZBalRkejltNHpC?=
 =?utf-8?B?N1owK05LYkgzN1kvRzNiTFVmaWNyRGVMUEJhTUtkN2szNTV1NzJEbzBqWUk2?=
 =?utf-8?B?ejhBTExrNUEwZ3JHRXNHbHlHR1prb1JKd3d1b1EvZXVRbE5JVnlPUyt4NWo2?=
 =?utf-8?B?dVRpVzZIQzRnT2wrVUxibmZUd3JJcERhUnVMME11QVc5c2J1OTFROXBqNUlN?=
 =?utf-8?B?Wm1idTNJVGl6QjB6VkV4VmdJQUVHaFRTMTkwcXhnTnFtTW9NWWRzU3Y3WWcz?=
 =?utf-8?B?MTZML1JBa1BjcWNOaXdtQTBPWXNLWGQzaUd2UStzVmxaYlVZeHN5K1FvTml4?=
 =?utf-8?B?RC9kZ1g1c3l6M210VmFpczB6bXdaRzhYQWhxb2k4SC9CNVZIMGM2SEgvSmNO?=
 =?utf-8?B?M25LRVRaMXhBcGpKM1N1cG5RWDJBT1NKQzA5WUFNRFUrcDhuQ2dTUlllOGx3?=
 =?utf-8?B?V2FCd3hQdGdyM0lUSlpyT2NkUmwzZ0JMOHVrMk9VQWFtZ01Cb1RPYk41MWtL?=
 =?utf-8?B?MVZoWUxsd1FzdW5OdnNNeDVkUnpkUndGU1FERlRveDN0SjkydXhZL2ZqaE9T?=
 =?utf-8?B?NUZmNGJTeWs0TnY1ZjFKOTZVNmtxM2dpVGhYbVY1bTE3QlRxdk1nYkFJUSt0?=
 =?utf-8?B?UUlHaWllSXE0VlBpWS95bE53MGhhMlE2Q2czSDJUTXh2VDZNYXdwVk5hcWQ0?=
 =?utf-8?B?c3d6cFBBc0NFa1dwRTRNNEZrbmxzMmlDaWhKZ0tIcEhnLzFxME5EdmxSYm1P?=
 =?utf-8?B?UzFWeWdlck93VWZKQXFCUzJ0dEtabms4L2ljV3RnSjBuZWNpRjRFeDlXMVJJ?=
 =?utf-8?B?YzR2RHRaaHNtbXRmNndPUjcxU2YrVXU5VnJyQ1BPS3NjejJDM2w4SEFpb0wy?=
 =?utf-8?B?dWtBc0F5MURneU1TQ2tFS0dIcm5tV1hkNjN6WU9ydFBSdUFzWTFuNU5MOUtW?=
 =?utf-8?B?VXROVzEzSHBUWHFHREZicjBoZnFJSENIMDBhczVpdXdkakZHLzhNMFU3YUUw?=
 =?utf-8?B?RDFtR2FRaGJWU1RGdGxhUGVpSDM3akJta2o0TndpTG52b0ZKRlE1YThRZDRT?=
 =?utf-8?B?QUlGSlhSUVBGN283SmJoY2lpMk8rY0dpYUVvaXRSR3lOTC9KQUJVUjlTRFln?=
 =?utf-8?B?ZHVEd3RFUGRSMUtDWWx0ZG82c2lQMko4ZFAvSHg1cnQva2hrTlg0aHpZV0th?=
 =?utf-8?B?NmhkWStCVmk5RXhlanFjTUxGNGtYTndZc2hMcFB4M0Rxa3lSU1J6T2xFcG9y?=
 =?utf-8?B?YTFjN2lVek4yVGhka0d1c1c1R0pRa1ZwTHB4RlNpQVBxaCt0bFIrcldxYkNs?=
 =?utf-8?B?NUdrY3BPa2lodlBLUEpSMHJHcFNUdUtQUzRIcXRnZkwzWlZ3bDJyaEpndEtp?=
 =?utf-8?B?N0EvSk1FcU1Gem5GN3I2TG1Bdmt4bmNwYTVTbFprMTlvYWRGZlhvRGw5c0lj?=
 =?utf-8?B?Wk43eVZlbGdzc09ncFZublArak1LWkc4QzVRZnhXeTQ0VEYxZVJJTllSWXRW?=
 =?utf-8?B?ZDB0NjQwZjJZSEE3M3o3N1dnQWNEUG5VK05MYVp4Y0NBcmIwOTczNVdkTUZY?=
 =?utf-8?B?L3Q5TldzcVFONW9mWXhSKzdQOERwMmk2dnkvR28rcUQraTZON1ZTMGNtbGEx?=
 =?utf-8?B?aGdFejFDblBQRnVuVkw3a2hiZEJkQnNCdEZpc0RsbldGYW5nWE1aNjhZMnhU?=
 =?utf-8?B?aU5wN1Nhc3ptMExBZU5ESVRSeW5CdWFqWGhUbVUxV00zbUxKRDZVZVpHQ2Nj?=
 =?utf-8?B?WUlFUHJFdEMyS2lCQUdJSjN6OHNibVJlUGtPYWVDcTJDT0w4OSsrTXoyREg2?=
 =?utf-8?B?Q2tib1J2Y0RjcCtxM2diUDFVZnJsNlNlYkRtai85U0s2b2xqeE1ob2JSUG03?=
 =?utf-8?B?TWEyYUVLeVl5YlNqV1hvUE1XZTNjd0oveHdadHQwK1RUMXVBcjlpVm0zeTB0?=
 =?utf-8?B?Lys3QUFpMHhHSGFUZldMUjhUMytDSUlDWERvbTdWT0gzVW00R0pFQUE0dDlT?=
 =?utf-8?B?M0Z1QWZCK2txTXVVa2N2anVhTFZXVndvRDR0cmZYanpOZFNCeDMzSklHbE9X?=
 =?utf-8?B?ZCtRVDBqNVlCalBYcDhyM3pyb0dtV2RGOW9qUzE4MVBSYVo3NE1zejlCQ2I5?=
 =?utf-8?B?YzdMZEFockQ5TURpSlBGNTJqQk5DUW1SRmJyZDRuZVhQaGlveWR5V05DaWVw?=
 =?utf-8?Q?RBc4bOZc7rUfhaDCIb9oegs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDkyaTMza3BXbFdGSW5KNkozdkYvNUZXNnlFVlF0OWJMQVIxdnRCeS9Vbmsx?=
 =?utf-8?B?YkJ5T0FEdGNiWHNGcGE3eXJJMTNuOUN3OEtnWlVvZ1NHZHR5NTkrcUE4RDFk?=
 =?utf-8?B?L2JLTGgrZS8xeWhPdHFsL2pldEtPN05kL1NjZEtEcGkyaG50MVUvY2phNkhK?=
 =?utf-8?B?S0FnZlQzUVlVN3J0Rk5HMTBLQ1RWZ01KUGc1V1JodUJKMmxQSS9XRFl3dUp6?=
 =?utf-8?B?cXZ0OTZoVjEyNkRBdjVGS3M1Yk1OSFI2RnRkUFFhbG1Ma0swZDc5WHBhOVh0?=
 =?utf-8?B?ckRJVk14Uzhzam1MMnhzNFRnZmNLL1ZTS2RnU2o1cVZqblZVR2tXeE9xQXNk?=
 =?utf-8?B?Sk5aZ2hsWmJzNW51QkdVa051ZENGMFBONGE1blM4Y2ZDQ2JoamFSdGtLZnZC?=
 =?utf-8?B?dmVva0ltSGpCQjBWbUNWZExsTVhsaHUvLzY1b2NTOHVBSWlMd1Q2ZjFCYnJu?=
 =?utf-8?B?UVZ2elhlbXl0OHBQWTdJSk5adS9QT0plNXhSTUFWT3RTMzFJd1NnNks1SEMx?=
 =?utf-8?B?QnZnZUdDTlJrK0pTbG1CRmIxVDN5SndUdStWVmgxVXloRnl6dGRYR2F3SEtD?=
 =?utf-8?B?bmJKTFRTSTg2aTUxQ2tDNzlMMnR6TWhOUlNaSjNWZ2JLKy9tcnV1Rmhma1Bi?=
 =?utf-8?B?amF3MW9kcGd2UHh6cnZONXZncEVzVDhDajNvbXJiYkdjUXIwSlFGaEJYUmdP?=
 =?utf-8?B?VWdubFpMdnhvQ0pnSEQ2QmN6aktzMW9vZlFCQ2taTkR2NUMzdFJQK3A1azQz?=
 =?utf-8?B?enhDditIVzhheWNpckQrL3dGZ252VlFha3hwR0tDckJuMitBYjV0M3hSVUFq?=
 =?utf-8?B?S3R0dGlRZVNacnR3a0czQ2RwMFRtdEVsYWFIOUFEeVp4ZkovNzRMaVBEdUhx?=
 =?utf-8?B?WU95dytCWCs3MnZEWVhpUDRhNHM3bDh2MVp6a2tkdC9QWEdxTFhoYkFGWURE?=
 =?utf-8?B?SGdzTDBXNXFiSzUvL1dJelVtZDg2Mk82TXJsNzdKTVVrTWI2U244cDJKZzlF?=
 =?utf-8?B?MWpIZFZqdWEySnUxS1A5amlXMS8xU2daS1pQRXoveTZsUzBGYlBGVmJScWJN?=
 =?utf-8?B?bURFWm82L1V5bzNEd3VhNldtNnVKYnBXMERCcVp4K1Nqa1duaU52RmhBbTV5?=
 =?utf-8?B?WmlBK1RTNndIczV3S0xGYkc1czFweFd2L3NmVTVRVzV5bWh4UjFKNlN0Nzl4?=
 =?utf-8?B?MGpOejhiM0hRakZtejlPbnNnR0xhVlVEaDdIOXIydnU3dlNtbjJtVjVFS1h6?=
 =?utf-8?B?ZTExVzZPU2JJR3pBVnRKb2xlV3dnaHhNREl2RGpsZWRZaFQ3UUNSQTB1MUlt?=
 =?utf-8?B?dXZqbkIrZXdwNDFyZWhHdW42dEF0RGQzY0lEd0FQQ3gvcEtuWTdLVnI2eE01?=
 =?utf-8?B?Sks3N2ovRXVrckJYY0hXWHhPdXBKd3RLMVMrSDdPUjZHajRxcEVWbW5wS2hy?=
 =?utf-8?B?RDB5dGQ3ZmswTXBBRDJyZGVMUnFMSjI2QkFGL1dCTDFQYzRiUnBDaXRTVUNp?=
 =?utf-8?B?MElnbWRVT0g4d2NBRzJKNm1xQzZrRmU2S21LTjFzUVMwL1VTWVhHN1p6NmpE?=
 =?utf-8?B?STg1VFBvYXZmTGVMMDkzcnZrQlJPTVppQ0FtMlVOYURQUndBaVQ3dlZBdkNY?=
 =?utf-8?B?WWZ5SVJUVkQ5VVh1VXZBMzVEcmlsYnNicWVsN2sxbzY3eGlkc1dkb053Wmxa?=
 =?utf-8?B?YXRndkZydzB2d2R3NlZEaVV1eXpZcHlxTHlVV1ZidndEQXBwK0ZDRmhKd2tK?=
 =?utf-8?B?b3RqRlJyalphSVZaZVMyTzd4L2M1cEpSYUJLYm1kaEZmRlg5cHdDMmk2VXRR?=
 =?utf-8?B?Wi9qU1R2cmpoYU9kYkNOMGtpVVdjZXB4SmJ5QVliM3RGWnJQdE14eldWWEtS?=
 =?utf-8?B?d2F3bTQybXhaVnkraTFHU3Nvc1Byclp2MlovbGxKQWFXaUVvbHNiaDY2bnlk?=
 =?utf-8?B?WnBnS3N5SldSWjhPUWprVWNhMVIyNThrVnpUTjcxNDFuT2JEbmk5akJDTEZp?=
 =?utf-8?B?VEkrMlZXS1ZEbm8xL2NxbkFZMGI2SDlJeHRRZCtqT0dHQXo4S1VMamJCdkhU?=
 =?utf-8?B?Nk0zcjNCMXI1NklSRGtpNEVBcG9iUVJMWTluYXR2S1dpOE0wZkFHUGdseHc5?=
 =?utf-8?B?elFiTldaRmFkNlJOdWxFaVVkUnhrK3VCUFdVUWJjVCs1MHc4anRmeTkwNU9Z?=
 =?utf-8?B?RmJsYUNQSWVEOXdrU2FoRGFVa3VESEtVMXZoNkNtWHg0V2tnNy9yVTBVcWha?=
 =?utf-8?B?bUtobWU3V3NHTGpjempkaHY2a0I2Z09GWTQvNlVCSWJQdkxFcWVtdGthOS9r?=
 =?utf-8?B?akRaa0UvV29VQmFiWXRuVU9YMWVpQVB6aDFESXAvUWh1SlNzblVGZlFlcFdh?=
 =?utf-8?Q?wSaxNXTNJlWOy06U=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0694951a-de0f-4cad-7d27-08de548ae586
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 23:07:46.8894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPgi9pqBXOo016WbNK1Q98m3L6GIHVMqkbcT5TxyU+g4dBYFKBq4NpndM7ChFD/Lk9FeSq2PFNxfUhkMSQxKWUZu2JGzMLcOlExlTgdmmRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_150751_128238_8CDB221F 
X-CRM114-Status: GOOD (  24.23  )
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

From: Taehyun Noh <taehyun@utexas.edu>

The kernel's primary knob for controlling MTE tag checking is the
PSTATE.TCO bit (tag check override). TCO is enabled (which,
confusingly _disables_ tag checking) by the hardware at the time of an
exception. Then, at various times, when the kernel needs to enable
tag-checking it clears TCO, (which in turn allows TCF0 or TCF to
control whether tag-checking occurs).

Some of the TCO manipulation code is unclear or perhaps confusing.

Make the code more clear by introducing a new function
user_uses_tagcheck which captures the existing condition for testing
whether tag checking is desired. This new function includes
significant new comments to help explain the logic.

Also fix the confusing naming by renaming mte_disable_tco_entry() to
set_kernel_mte_policy(). This function does not necessarily disable
TCO, but does so only conditionally in the case of KASAN HW TAGS. The
new name accurately describes the purpose of the function.

This commit should have no behavioral change.

Signed-off-by: Taehyun Noh <taehyun@utexas.edu>
Co-developed-by: Carl Worth <carl@os.amperecomputing.com>
Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
---
 arch/arm64/include/asm/mte.h     | 40 +++++++++++++++++++++++++++++++++-------
 arch/arm64/kernel/entry-common.c |  4 ++--
 arch/arm64/kernel/mte.c          |  2 +-
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 6d4a78b9dc3e..fccb51b2abb0 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -224,7 +224,35 @@ static inline bool folio_try_hugetlb_mte_tagging(struct folio *folio)
 }
 #endif
 
-static inline void mte_disable_tco_entry(struct task_struct *task)
+static inline bool user_uses_tagcheck(struct task_struct *task)
+{
+	/*
+	 * To decide whether userspace wants tag checking we only look
+	 * at TCF0 (SCTLR_EL1.TCF0 bit 0 is set for both synchronous
+	 * or asymmetric mode).
+	 *
+	 * There's an argument that could be made that the kernel
+	 * should also consider the state of TCO (tag check override)
+	 * since userspace does have the ability to set that as well,
+	 * and that could suggest a desire to disable tag checking in
+	 * spite of the state of TCF0. However, the Linux kernel has
+	 * never historically considered the userspace state of TCO,
+	 * (so changing this would be an ABI break), and the hardware
+	 * unconditionally sets TCO when an exception occurs
+	 * anyway.
+	 *
+	 * So, again, here we look only at TCF0 and do not consider
+	 * TCO.
+	 */
+	return (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT));
+}
+
+/*
+ * Set the kernel's desired policy for MTE tag checking.
+ *
+ * This function should be used right after the kernel entry.
+ */
+static inline void set_kernel_mte_policy(struct task_struct *task)
 {
 	if (!system_supports_mte())
 		return;
@@ -232,15 +260,13 @@ static inline void mte_disable_tco_entry(struct task_struct *task)
 	/*
 	 * Re-enable tag checking (TCO set on exception entry). This is only
 	 * necessary if MTE is enabled in either the kernel or the userspace
-	 * task in synchronous or asymmetric mode (SCTLR_EL1.TCF0 bit 0 is set
-	 * for both). With MTE disabled in the kernel and disabled or
-	 * asynchronous in userspace, tag check faults (including in uaccesses)
-	 * are not reported, therefore there is no need to re-enable checking.
+	 * task. With MTE disabled in the kernel and disabled or asynchronous
+	 * in userspace, tag check faults (including in uaccesses) are not
+	 * reported, therefore there is no need to re-enable checking.
 	 * This is beneficial on microarchitectures where re-enabling TCO is
 	 * expensive.
 	 */
-	if (kasan_hw_tags_enabled() ||
-	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
+	if (kasan_hw_tags_enabled() || user_uses_tagcheck(task))
 		asm volatile(SET_PSTATE_TCO(0));
 }
 
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3625797e9ee8..ab02840ef449 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -41,7 +41,7 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 
 	state = irqentry_enter(regs);
 	mte_check_tfsr_entry();
-	mte_disable_tco_entry(current);
+	set_kernel_mte_policy(current);
 
 	return state;
 }
@@ -66,7 +66,7 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
 static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
-	mte_disable_tco_entry(current);
+	set_kernel_mte_policy(current);
 }
 
 /*
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 32148bf09c1d..5ee74bb60ce7 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -289,7 +289,7 @@ void mte_thread_switch(struct task_struct *next)
 	mte_update_gcr_excl(next);
 
 	/* TCO may not have been disabled on exception entry for the current task. */
-	mte_disable_tco_entry(next);
+	set_kernel_mte_policy(next);
 
 	/*
 	 * Check if an async tag exception occurred at EL1.

-- 
2.39.5


