Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA77F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAqSCBsmg7LkYFKFwxiSbG+2c8wiA0mcTIFPmjOUECM=; b=xQFnjNp98ELxLWJ1+M9lfBfacR
	4h+7Z/3aM81wdEEphmdOwuRd0L83uIz0BSxBFgmbPDAsIpLzgzoJKMDgmI47ELUHTQUKNV7OSukEC
	Fc6GIvEMic77KREL9pqYEu8RxXXzOVpCeYIVOt1nwNQZQ9D8COEdYVGBrrcrRjw0voe8N3sYqwP3p
	7rrTPdVfs2VRASjzlOKUbthEdiF0IacXUendNUhqbGzhk9G2/pmdGawwGgrfU/rKuR/zp2PfKw8J3
	sqLqboeDO3nhCFihHyRDvbgYxlyRkhiUg4iDAhLY+pOI6E9ejxqALwQdxHELyPqkClSh2/3cMW9oZ
	OeFqGYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeij-00000003gRx-13qw;
	Fri, 17 Apr 2026 08:38:37 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeif-00000003gPu-2CR7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgItVUeeQba2a4ddVEj+e/K7rewQSr+SqAw2O1Z6HzGoSG/+FIZH1OmKX24P4kshnsqMGADhguPZNWMf2xz6oTe07AL4wo0EXEgDIVDtrAQXDFfFZF2R3UdUJS8AjxKE+lnTK5GMlrfLS3ShTFsiOCuOKMtJ58wENhAuTt11bknrTfRnOTxVDWgC0rHRv9kBb3f/eCmdzD7InqjSbuRO9ui6Rzi+7QR3TeYj84Co+8tiXdXYT14Ys64jyQ7U5r/wv+XC/Q1VxBSwZICHQel5xjgPvqZ7+vSkXyZ2j5aodJX9RsqqNxD0BobB1m5SFJxzHoBOMhm5+iHBQBOPLSEVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAqSCBsmg7LkYFKFwxiSbG+2c8wiA0mcTIFPmjOUECM=;
 b=YSceuajwu/9ssJOM//4axKqaqGHdAiMZW+R/4veBQsJd4eEW/m88FKEYruWc/HcFuF6vlvu+CPgidmxv7djXpuYKQ9qlqHtWSWVFoOcrKsxY4z9LbbMPxqNrZNXb+xAif0rRMNeWjHozL6HPSQGoYQhSLwMRS+u+A3CfGNRXsIPwu3NzBMvAsT62vmhie8fPbAS5IRnEOmIgXeFN+lLMubWdikXVksXch3La5F72yzKZSdOvC578AxokcWBAgc8rjvgiMRZC8/Yp6Qb9J5XKUcGgPPdVZ+QoQILUQyo4Umnb2eCKytvpSU888ldVfZhgqPdpYjkdrQWiHhKEbMQNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAqSCBsmg7LkYFKFwxiSbG+2c8wiA0mcTIFPmjOUECM=;
 b=AnMDUvNVBcJ8f8t839/DpfhPW4Aq3qFOwGTizvmUwNLIm7Pw4zK+K5EF8EBOVykZUYdVRTN6GNppiZShbI/sGUbxo2iEXLJU665aelSp5/8yQ7hiNsNfsKTMZsB7+bAlYzXjwtzLEpdZQXoq3LBNcIdaEa95uw13Vq1kJPKPpKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by BL1PPF77D3D6046.namprd18.prod.outlook.com (2603:10b6:20f:fc04::da3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:38:26 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:38:26 +0000
From: gordon.ge@bst.ai
To: yangzh0906@thundersoft.com
Cc: krzk@kernel.org, arnd@arndb.de, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, bst-upstream@bstai.top,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: defconfig: enable BST SDHCI controller
Message-ID: 20260417.163754-gordon.ge@bst.ai
In-Reply-To: <20260310091211.4171307-3-yangzh0906@thundersoft.com>
References: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
 <20260310091211.4171307-3-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Apr 2026 08:38:23 +0000
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|BL1PPF77D3D6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ae6a15-d07c-4b70-7745-08de9c5cb17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YBwVAU1nfS6QCE27/AfF4egAhgLFtFoGIJaYRnLXtmp+NAX7SW291erD73bGsMggHl+7CmFLdjJdac2qoYzlug3XQZCg13oev92kUna5YTzcUcSBbbYSLZdjgFQFIN4WfPJki8nQz3Jmj6Nh5HqCe8Yu+0E4RKi/j+fA9lmWBADORoHKs5LkyiL+QCjr5Jr8vq4cnyqZn+EB+IIDAQab6MOI4l02ufohx7q/ukJjvG9J8NPu0j6TjPPJGFwNY3ajtvunTvi/Ga03/4Z68qLdXEplZGgcfmZoZm9t3xWSM9p3yjIv9yZVDYQ9xUIVqSrqCOxHN4liaS3BTfmrBo7I1LLUPpiw6q+mbqm05mPGsaS2fqbjnKdK2njMbTQnSHLK3AEy8adWSceLLoTs0VDXyl/w+9d5C07mGhBBm1kY7DyZRM9mPm8XG0zeeMdVskcg8pkwYCSrLaSKBlm5dcSha11PSKdXPR2tCYJ5fMz21sGfCrMm9XeTmYDa6VKR8HufdSyh6ATXQy1t5bamz2iixEkOOPNEnUkgFvAbpg+7nTYPFkfXCNwkmfIKhM+e9tMq+CILfvRkQZfHeM/nCppVHfB9mgSK+DBlJyqdevx1nt0ikYYZvE7Ukt1CX57XM2F1jQrYeJX7wQF27P3CYqMMTPcupZxwH5+Ngm9Jm9KosCXfCDk7VVnIJBK0gY83cYUTRo/0Bwl2Nt5BDN68Hk6VtirI23LzBYBxFI8jo39IcXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDdoVk9qU3BTd0NNamlXNTRhRGpjK3piWUc3NDBuZXpTY09UUkx4blBOeTJP?=
 =?utf-8?B?ZXozd0NteTNodUZvUkZ3RTBDSjhDc2R5Z2tvSUt6b3FFNkFacFpHV0daSU1K?=
 =?utf-8?B?WFp5T2xhQWdSNmdocjRCRGNKNythVzliOVNNOGVhUGlGN3Rwc3R0RmFka3lq?=
 =?utf-8?B?am95c0JzdXRMcVB3MjVBczhTeGZSeVdqc0hNWGFiNk5VK1ZDeFBTRVliUTFW?=
 =?utf-8?B?SkE3OWQzdk9CcjlFV0xRVFVqbS9yYm1DV1BKdXhtNXc1cUIxK1V1SFZCaktS?=
 =?utf-8?B?WkYrVmZJelJuVm04bldlSGFPZ0l3dnpOWXlxVnZpeWl3WlN0aGx4UDM3T1oy?=
 =?utf-8?B?NHBCd0xJR0tjMlo4cWJYbWVERDFFV3hxTFNhWHc4dGpoYVk2ZUZ0cU0yR2V4?=
 =?utf-8?B?OUdnT1QzMlZhOWtIdmFNQy9wTnRIUjNEL3BUbGJQMTl1NGFZaFFHREdzeFhH?=
 =?utf-8?B?ejgvTjlFYXRBVlVhNkJrM1Z0bkV1dEFLcmZiTjM2dzgxZUplVWJ2TFprMDUy?=
 =?utf-8?B?NUdSN2M0Y2wxeXlRbzRTZDFZQ0RJNXozcm1ubTExc2hkU3owSlY3MDF0bXlD?=
 =?utf-8?B?T1Fpelo2UVZKMTUwZ0VVSnBtd2x6TW1ESWFsVTNpd3lwdGpjOVR5UzkvaUQ4?=
 =?utf-8?B?TEMxcXF1VGlHSHY3dzhLcGNpV20xOTFzZlliVHQxcXRXck54cG5nWHMyeWZY?=
 =?utf-8?B?U3R3b2FoVTNSM2kwTXU4YUtRT3BFNE5lWGZ3aVhBbnZpeEIxZTdUR2ZpNzdQ?=
 =?utf-8?B?WGhPc200UkFCbzlua0RPVU9lanh4WWZTZlNudGtTY1Z2SlRLTm8yQXBzUnRN?=
 =?utf-8?B?cVpoZ0ZPNmtZTEZ3LzVIanVCZXRDZzBWT2N4SEtIQVJKa2FlRWM3dXZ5eDVB?=
 =?utf-8?B?M2J4UTNoai9GbWNVTWhRaVU5QXhrNVVhdFFVdjVEajc0cTlmM1dYMktrZGJs?=
 =?utf-8?B?cHBQT2dKcGNLSzVIYTJFazBVZjFITU1TVlJ2ODFWSFhNTDZjKzZnUGJMWGRu?=
 =?utf-8?B?bTNPN0VvNjUvU1NyT2JuQXNoVXo0SlF5Vm5vWXVXVHpoRkVKME5pbTBXSjhz?=
 =?utf-8?B?Mjg2T1VUSTlZT1JuclpISERtUEo0QWoxS05JdnpxNWdCZW0wQ05FbUkybjMv?=
 =?utf-8?B?Qzhxa2lNcWRROVRxSEVSZ0h2L0h6VFBTd1BITElpcTdQSWJiUElWWDRPb3lO?=
 =?utf-8?B?Z3JKNmo1NlJTWUJiMlFMcEJzVXF1b0JiQk5jc0w4ejBiTnBBRTNDMlNsWk5v?=
 =?utf-8?B?TWNKUUZIeGc4REt4MENlS1FKV3Z0ZzltNCtWdlliM2ZFVUtmT2Y2Y1F3TS9x?=
 =?utf-8?B?Q2kydW9LMlhnNXdxOWc1K1UycUxRZVZKd0FjOCtRbzFFOTVSeU1FWG96L1A1?=
 =?utf-8?B?c0VOaXpJUUtaUGNVekV4NUM3WGNUYUNYQjRJZy9KZzRkWmJxZGlmWjJ5MW1G?=
 =?utf-8?B?RnZlLytoNForYlI0bkpQWktWS2Z4QjBwbmhteWltREhSQjA1VlVWaERDUyty?=
 =?utf-8?B?ZzVPU3VsYUxidXpHcFNGUUdjQ3RjaWhEREl6TGs3YW5XeVlYNC8vMTFhWDRF?=
 =?utf-8?B?b2NJZ0p1ZjBLNlVCK3BVY0Joa3g2ejg4WElyek5aTHNLVlZmZmd2My9LVitB?=
 =?utf-8?B?alhEVHJiZUQ2VzFzSUtzbjQwQTFlVHpBdWZVY1RoSDdYQ0ZMOFNnK2FEakIz?=
 =?utf-8?B?YTg5SlpsZFlPYW5KMGlzL3p3TENjbzNXWStteERTeEZHeUNRZFkvSjZLakJt?=
 =?utf-8?B?a0F6SWpiamFKbVh6TVZEY1NJQzI5YTd6ZkZUbjcvVjlleFFTaU5od3cyVks4?=
 =?utf-8?B?YlFlRWFsSHh4bkNxQUU2elRTTGk4RlhKdTZkOWZOWkQ1NUFPODl3bUN2QkY1?=
 =?utf-8?B?WklGQUFQbnE4OXgvRXR2ZmI0N3pOOXJsWloyUXhFWUpsNTdVNlhobmljaE9X?=
 =?utf-8?B?T0tVbmkxelIvWU5ZdngyRUR4emtpWUdicElaYytTaGJJcmJGY0VmS09BRW5r?=
 =?utf-8?B?RUpxNnhHUC80c2UwZmZnRXIwTUpOaG5wUGNhcmE1RmxmK21uc0VFYk9xWnlj?=
 =?utf-8?B?VTdYS0QvbnpCWjNhb2psMFVHeXM2STJNVjZtVEphaFVlL01ldlNzRkZTSFly?=
 =?utf-8?B?Z2NVUTgwMmhnMUtvTUMyRnhSUmgrWXk2Q1pKRFNKTllPUTdsU1d2ZmxrMWkz?=
 =?utf-8?B?aGxnUlpUcitWYkpjN3JDUGJsSTdDNFZZcXAxbVlWK1oyWTVJVE91YzRiejZE?=
 =?utf-8?B?VFhYYUkzYjRUQXIydjNDZlBiZjdMYUVsTHFSdTIvQWU3aGJZUDRVdTZuZ2M5?=
 =?utf-8?B?Wk5uNnNoYVhJRXdaRTROS1NOVWJ3M3pxRFZMTm9GVnNMV2hyMWhUdz09?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ae6a15-d07c-4b70-7745-08de9c5cb17d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:38:26.3791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcu9AYlloZOJwGAJJyTKcPUhg5jKGZ9O+buP4J2P63mOqVfqcFHSOXRxrcUyp1sxcWeRoaSZRFHa08rDAsySbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF77D3D6046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_013833_595735_F52CE548 
X-CRM114-Status: UNSURE (   3.64  )
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

Acked-by: Gordon Ge <gordon.ge@bst.ai>

