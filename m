Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2A5D4662F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 23:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/t+lZdwfaT1sw2WWBwOsWm3/hqd+BFrQehj/qsh9Qc=; b=BjOAbCtwjhGUcP8N5mDb2e3K5T
	hFiAfcqx1B42becKo6JSNxzus82KbQQ0jW+QhYA2GHbqkrMaVKJ4dtHSDgPgyjHLPIARRzgy8egEv
	3vNylR3e+WlUckPgwyeALi1V0m25eO/437azT1cMqVDNirZHExkD+9f6EdnnDq6TpD9I8j5p+nbCT
	SnZufRM99SgXNrEirjgTSqepE59wdPQKxxC8CrcrRWXpUhrfFMOooyw8KxvZj7SZl6KPLS8GrmRkX
	2aOyFQlMTC4l73Yxcn0V9vhfElWiPB0rjk2j9iPm9QYA5v3IlRVC+TwF+rNKTPH3f8Ya0kEQ1zI/N
	s0ux8GPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWRe-0000000DIi7-0JAm;
	Thu, 15 Jan 2026 23:08:02 +0000
Received: from mail-eastusazon11022136.outbound.protection.outlook.com ([52.101.53.136] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWRY-0000000DIgF-06nB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 23:07:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b16V5InRiLGyk0ZH5URFeJ7mEDsjZMVV25gA35mRi1ODjhd9phjoi3svcMOOpcaHdwv6ndc7NPWiLXCFtPSlsfjUCB1+gN3J87ivNCDQ0q4KCH8IjGxoabDwl7RxQzL/M1AJoy/mB6nvaRzBFtzueDscMGh0HqDPDyKbBDuhU8xUf+3TYS9lzXYHOMirgXKZEnhj5KxxhQa2dtPOyC+kE/doXa1r08vgGTXUMtZDZHvYrl5aNT+wzYxdyggCoSDDKGoO1J0CgtVulem//piz/8BpQKhgkChZhTSAhcYSpL/OeoASmex/tGBBCPK1KjMtLBedaFeW6xbaxlhWqkezig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/t+lZdwfaT1sw2WWBwOsWm3/hqd+BFrQehj/qsh9Qc=;
 b=LqsIksmQRlEXDEc2ykMkjW8O6cWfFudbuJFMnO8Nwchd2lCXxISkjJG5f2Qc5Dolxm6bdOyzVUhZqmICsdtu72XAnb4eJGXHgk3liD3wMVq/hcO27SNbU7Q/oxbsCJwTAoHoGPCYDy/88OAYOFuLjl9fUdEb04Cgd0tsxIEo8/wX2CR7/Tp+GA2OlXJDY57GW10uXjI5orFMPbQE0+gdAY7zanYr/BqZCYAGbdOMot3AuXFDIh39cXyMUkoQKCu8WHjEk44MIhdUKrbWaGglJtTZJ7IW5jMQZ4/ora5HaF8Uk9tT60OA1fAtMIEKvTVVj1zNcDqYzSeh6mUWnFX4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/t+lZdwfaT1sw2WWBwOsWm3/hqd+BFrQehj/qsh9Qc=;
 b=XvXMRR9Jdl7iKZxC3CgWsD2c7bWe9GIWC/IsUV/S2raPGr1BNw5hl+w3b/0SuSQOnx8Wj9sN/86spRNrzmvBEVl8yNEHTHKuNCD7K8T5Ah81G4PzjCbNaSXfV/3grPNuP/qOWL+5+nkGJR/4sn8gft+9C5Iu8TRNuQ2xTkezlMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 SA0PR01MB6252.prod.exchangelabs.com (2603:10b6:806:e4::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Thu, 15 Jan 2026 23:07:51 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 23:07:51 +0000
From: Carl Worth <carl@os.amperecomputing.com>
Date: Thu, 15 Jan 2026 15:07:18 -0800
Subject: [PATCH v2 2/2] arm64: mte: Set TCMA1 whenever MTE is present in
 the kernel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mte-tighten-tco-v2-2-e259dda9d5b3@os.amperecomputing.com>
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
In-Reply-To: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Taehyun Noh <taehyun@utexas.edu>, Carl Worth <carl@os.amperecomputing.com>
X-Mailer: b4 0.12.0
X-ClientProxiedBy: MW4PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:303:8c::23) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|SA0PR01MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbdf8ed-5760-42b8-fcd6-08de548ae809
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHBmV29oWG5FRjQ4S29oam11a0I1S1Rob0R2SEhpc0pqWUVhaWVqd1FxdTAy?=
 =?utf-8?B?WlpQN2FqSVUzank4Qjc2bHlPaTg0MGRHQnp3UzY1dVI1N2V3RmtCaEZ6MHEw?=
 =?utf-8?B?VlgwNEFtemU2SjV3M24rTlZlSnhQK3ViMzlFUEpyU0wydTNaN29ESjBPeGZs?=
 =?utf-8?B?b2EwUHNUZDdIbGVFNm5IcW9vZ1ZMdlBBRTg5WGZWcUJMNXlJb3JGaTBVcGo2?=
 =?utf-8?B?RU5ZclJjZ0JCc0dqcE44bHRjR2RUOURLQy9NWXZnZXhZZkljNE94UDF5eFhD?=
 =?utf-8?B?VVM2UytnaEdpUHk4MzlPcEE4QlpDQXIxMXB4djhlZXpnN25ieVYyc2tseitt?=
 =?utf-8?B?Nm5wYkQwWHNScitlYUdPUjIrTUREWUNQMlZRZnBzRXVGK3NqTkpvZXlsdkVP?=
 =?utf-8?B?emFMOFNDYy9nKzlUcG1RN254VHBicS9YQ1c0aU5RQ1diQ0NnQldreUFiR1I2?=
 =?utf-8?B?MllQU3lKaktIZGhwa3ppaGlwVE5qTEdqSk1tdjZGcnRzR2lMVDNFa2RwSzJh?=
 =?utf-8?B?K3h6NVo4WkxlcUFxOTZ3MTJHSjZ0SmMxdDlIaGNTNGd4bkNlNEZwZzBUdUlq?=
 =?utf-8?B?Ynk1eDBocGIrb1piUmQ5SHJPRXpacFNWamhXR0Z1YTlBT1pyY2tjSHVwSVJB?=
 =?utf-8?B?V09QbENrV3NxeXV0SG9PVXFNZlpuSjVwWTdiV2dudUFZZnlya3Jjc2hYL0V2?=
 =?utf-8?B?Nm14TWVWOS80eXgvcDhuc2hTaURYcHc2d3k2N29kQTZ5QXJpSEJKeXNaVFJi?=
 =?utf-8?B?a2IxSzJBWXo2MndwL1Y4c1pyMkI4NDR2U0c0dnhlRm5KdzJ0Y3djc0tZR1lI?=
 =?utf-8?B?T3ZLSlIwUVlwc3kwLy91TkxLUHpmM09wL0pCQngrU1dTWk8yQlJYU2czWlBR?=
 =?utf-8?B?VFpVRmpMc1pPWkNranVlZ0M3QklxaWhVZmFpS3c1a0l0SDJzZEhIWkFjVm9N?=
 =?utf-8?B?a0l3ZFExTVJLeFhubGwzOGszSlVPaHA2elJacXA2SVRPcm9RTjMzUXZyV1FO?=
 =?utf-8?B?dHlPcjNXaW1jTWtGZnBRSDdEUllpQ09Vd2l1WS83cFhhcDZ2UlJ4S2pQQVpK?=
 =?utf-8?B?VGdoNFBEMzl2cmJNKzhPbm9DeEN4cVBEQnVKYktBdWpkRTV3WVl4bmF6YkRa?=
 =?utf-8?B?V3JZU3pobXVZSDl1ckVKRVdUam9xR0szMVlmZlQxZENGRzI3dm9nYVhTUjNC?=
 =?utf-8?B?SFJOU013bFdyUktHcFZkZGdRdXlYM2dNTFFVWm9SQkFGYXd4cWN1SUNzazYx?=
 =?utf-8?B?SGJ1UlI0WTJvSzdreU5xbVl2NnA1VXdzTURMZDllZFJlZ1ZDcHBvdXVBM2Fk?=
 =?utf-8?B?SGNJVXVybUtwOURqUmR4MEhFVG5YNTNaVHJIdFpiVE8raG0rMHBKMy8yZ0ha?=
 =?utf-8?B?cTVYaEl6RVAxcDlSN1ZrZlFBY2NFSXEvN2cybEUrRE54bjdLZTVMWkVYaHZX?=
 =?utf-8?B?MFRjV3VCeEs1WHpDU3dndGVnNld4MWphbVhlcXBGN0MrNUtLZmZpTUJDSWtu?=
 =?utf-8?B?c3JBVUFsNHVzdlZQK1QyZTZVMEJweGV6SHNMc2VPR1RSV1I4TWhhREVKVlBF?=
 =?utf-8?B?d3Vub0NLZENsdFEvYnF3NHJmcTVlNzEyMGpLK3BzQXdtSGczenYrZm5Yamk3?=
 =?utf-8?B?TytxVXoyVzY2RkdsZWdpMXVSR1owSWI5cngzWVpTblRNdzhSSXFuK3lKdWlB?=
 =?utf-8?B?MzdhOEh5UDIwUngvZWprdTRsT0NRTUx2U2o1Z1FtTm93VC9waml6NmY2MlUz?=
 =?utf-8?B?eHpkcDZJS2wvSjlxbnJ0cXEvWXNXd2hsdjkwL0dYNU5ZRUtsUnU2TlF4dTE1?=
 =?utf-8?B?VStHQ1ZIZjVhdnphYTVQYVdRNWtQQnA4YmhrclNBMEsxbGlpV2dGVmpuVDlm?=
 =?utf-8?B?TjRPdGJwL24wRjRlOCtwQjEvVHcrMFJ2TEdodEFjNzBMbGtlMTU1YWFOZTVK?=
 =?utf-8?B?dGZidXRyb3VKL2JXSVdOVy9McGhabEEwZjRpUExESnJtZkhPQjBSMnh3VkZn?=
 =?utf-8?B?dUtodHNIQ1hib2Y0MHdZUkZtQW9vNUQ5QmdhTGZYLzkrdWJTcHFmdGhKY1hP?=
 =?utf-8?B?NitOYlFZWEF2YWZKd0Zxbjg3QUgwVEl5TWExOWcyMTdWbEo1SDlhaEFYdGpZ?=
 =?utf-8?B?R2dBRVh3a1NRdktGb1VTT2VNUWFmN2svVi9KTEp6ZFhOZnRKV05HOU1MMXBR?=
 =?utf-8?Q?gj8xcgVznY1p1VenVk+tpgQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0YzUGkvbDFmRjNYZjNlUmZEbVFjYjRoZnBRak1YYnNyRk1iWFdLTnRYTXM3?=
 =?utf-8?B?ZGwxcXNTSnB3V0x6QVFDUXhhZ0JyZjVEMFE4QzFuTkpDMjgyeGJuWUVNcXN6?=
 =?utf-8?B?enhjOXVSRW9sWDIrdHMzdW1SS295QzBIQm1KUERaNnRGMEN4YXM2dVBhWDZF?=
 =?utf-8?B?Nk5ub0ZZa3pGSlkyNDZxcElNeG1NQms5UFlhTEYxZGdJREozTTNGaWI4NlF3?=
 =?utf-8?B?ZksvbzdEc3FMU2dPY1dtbFYwa1Jxb1FlUzZNOGhGZFlhMmdPOHJxZW9CWEZy?=
 =?utf-8?B?SThCemttKzB2b2VSMFI3SjNZWXBWQWNCczRqWFYzUldGUmpDa0FqYmdoYmlJ?=
 =?utf-8?B?TVNhT0J2b0EwVEh1UjMyM1U5UDZ5Rk9vSmNNNTUzbnZuOGpDNnkyQWJKOVJU?=
 =?utf-8?B?UGxvcDgxRk1NR0ZUOFNrOHNDWTE1eGltVHA0OFAxbVBnMFA5amtrT08vNmhj?=
 =?utf-8?B?ZVZ4aGJJSTFtZHMrMGdYaTVEY254MENTQVZiaWZzMkxSTnJBZGNzSW8xd1NG?=
 =?utf-8?B?TDNLUUxQc2o1NnJKaGdMaExmWko0cC94QTdxd0ZwS3BYcmg1TlJMcjBrMXYr?=
 =?utf-8?B?N2l4MDFjZlQxTldjNlNFSHFSNmRVNVpvbWU3ZGdXWitaYnZUbzEvODJWeTFh?=
 =?utf-8?B?Z0tGNzRaZkdEamYxMXEzTFlkVmN1VElVbGhmbkdJdEw3VDVqaW0rb3dKb2FK?=
 =?utf-8?B?NnBaTS9HbjRJbXg1eDl3c1l2YUFCaXcydlpRYnZDeGdrNCthR2I1dHRzT2M5?=
 =?utf-8?B?alJJMlpoc011cGxBeGRXR0huK2NpQ0E1ZE1rblkvWW1FUjVoY0phMXVPbG40?=
 =?utf-8?B?MzJwVGtNdWpNUFZYcmU5QVhwdjBMWG53dnh6UzJPU3NsdDMxSjUrNGdIVXhQ?=
 =?utf-8?B?SkxkMzlYQ3JicFR1c1poYlFuUThKdy9EWFkxQS84dFpwV2dsZndwZCtBb0Rp?=
 =?utf-8?B?QmZtOGVPRFBJZStGZVFKT2lUUFl1SG9pRStNQzRGM0VsNWFLVG8zUGF0ZTQx?=
 =?utf-8?B?d3plVGRZRUw2Umxvb2xxOEJRb2lKckh2amsyMHMzMG5JaGZKSE5rSGd2SVor?=
 =?utf-8?B?cXBYQ2RWYkswT1ZvTWhQZ01ZY3gwbkFZUG1KelplUjlKZVVyR2M1SU5rejVK?=
 =?utf-8?B?WkVOTXZ1SUE5RmNManRpbTRiWk9EYmdINzk3ZjQ4VWNJc0tBaFNGVkR3MSsy?=
 =?utf-8?B?MnRMM09HVVpSR2luTnlraU9OeVZyQUNIdGcvUFNEYUw5Y3psaElMV1AybEEv?=
 =?utf-8?B?c1Uzb2NtNVg4bHRWUmg2a2RRb0pyZGdFU2pRZ3VacVZOcUpjZEYwWkZ0U2Rn?=
 =?utf-8?B?a2JRZ1NJdVRTNEFLdWUzOURFS1h1czBleHVyMGFOM05ub1g2cmZYZ3FpRXBo?=
 =?utf-8?B?OE1KRE43SEtLNW0zNVN6Si9XbG5samlaZlhGdlJUbDJKVlArRS9tSmYyQU5r?=
 =?utf-8?B?NE9seFFhQUUvYnZXaUNvTUJ1WW5rcHFDQWhxQVBiZWRQcVkyQnpOMWN1cXcx?=
 =?utf-8?B?bmdycUhDSElvdTFhNUNRaHVWL1J0RnI0OW1SU29xQW5ma0FVWnJnSFRqYUhr?=
 =?utf-8?B?WDhnVjJqd3RGZHdnSUpqVTRpR0NUK1UrRTd1UHl2MGpiQmNYS0tDM2dJV2dY?=
 =?utf-8?B?MjdSRXEvNXVDV1B4Z0lHWUpncE9HWjJ5RDNCbTNRSGdBOW9xUWF6Qjl5U2RN?=
 =?utf-8?B?Q1ZmeFVRT1VOUTA0bGtzYjltRDI1akY0NFZTSDhBRUR1aFBOY0hiVzBrMW1r?=
 =?utf-8?B?aXllZ1VaOFlmWnRvRmdPMDYrU3RrYjlvL1RoZmFPKzhTSnR0M2w0ZmIvclVl?=
 =?utf-8?B?WmhKL0NYWnFHMCtBYmdnYzExYmc1TlB5M2pFTGZicGhmR3ZGQ1BoYlJDM0Vw?=
 =?utf-8?B?amFSTTdSYngxelRvdkJxQyt5cG8xSEpUb0FaZGZHZ2RoSFpOS25CeVRzMjEw?=
 =?utf-8?B?UmUyb0QxWkJpNlQ2aE12YXdzQmZBQjdNWk1PdTVEVUoyZElFNlpHbnZoL3Jl?=
 =?utf-8?B?ZGFXWmpPY1psaGs3S3NuOXNxclIyWEhEQ1J2clAwT2c5MjdycHdVaW14RVBy?=
 =?utf-8?B?bU1uVTJIRW4yRFVSV09sbkhBbDVJNmk2VXRuaEFJU1IycEl0STA2dEVlRWUx?=
 =?utf-8?B?cEdQdXpNRDZ0QXVVZ2VBVWQ1akRHV3QxVG5yalFCTGhsc1lHbFQ1eVhuL2JY?=
 =?utf-8?B?RUJQTFlOS2RnQWtsaTluYUtFM210VHpwbEZEMTdMKzB3dzFqTUp0MkhIck5M?=
 =?utf-8?B?T0h3enA5ZnFMaGNmY3U2UTFIdmc4L1RxMFpJVHRSdWRkZWg4YXEzT3B0b1JG?=
 =?utf-8?B?WmU5SUgzZGdwLzJDMDFHWCtIdjIyWXNhS090Q2RqQ0xaNkIxQWppOU5CdWQx?=
 =?utf-8?Q?VAjM1QF2cjrq2EjQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbdf8ed-5760-42b8-fcd6-08de548ae809
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 23:07:50.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ91ZPIQgXfP7pX3mKZLxt/TUBHKCBiIsC3jnjZxZz0lifDH5FMKrLGwyGFlCU8NraF2C2jvhO3VeJ0j9/Kzlu5CbF+vmuUWxWXKVEnKsAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_150756_076774_6DCCC92F 
X-CRM114-Status: GOOD (  13.71  )
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

Set the TCMA1 bit so that access to TTBR1 addresses with 0xf in their
tag bits will be treated as tag unchecked.

This is important to avoid unwanted tag checking on some
systems. Specifically, SCTLR_EL1.TCF can be set to indicate that no
tag check faults are desired. But the architecture doesn't guarantee
that in this case the system won't still perform tag checks.

Use TCMA1 to ensure that undesired tag checks are not performed. This
bit was already set in the KASAN case. Adding it to the non-KASAN case
prevents tag checking since all TTBR1 address will have a value of 0xf
in their tag bits.

This patch has been measured on an Ampere system to improve the following:

* Eliminate over 98% of kernel-side tag checks during "perf bench
  futex hash", as measured with "perf stat".

* Eliminate all MTE overhead (was previously a 25% performance
  penalty) from the Phoronix pts/memcached benchmark (1:10 Set:Get
  ration with 96 cores).

Reported-by: Taehyun Noh <taehyun@utexas.edu>
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
---
 arch/arm64/mm/proc.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 5d907ce3b6d3..22866b49be37 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -48,14 +48,14 @@
 #define TCR_KASAN_SW_FLAGS 0
 #endif
 
-#ifdef CONFIG_KASAN_HW_TAGS
-#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
-#elif defined(CONFIG_ARM64_MTE)
+#ifdef CONFIG_ARM64_MTE
 /*
  * The mte_zero_clear_page_tags() implementation uses DC GZVA, which relies on
- * TBI being enabled at EL1.
+ * TBI being enabled at EL1.  TCMA1 is needed to treat accesses with the
+ * match-all tag (0xF) as Tag Unchecked, irrespective of the SCTLR_EL1.TCF
+ * setting.
  */
-#define TCR_MTE_FLAGS TCR_EL1_TBI1 | TCR_EL1_TBID1
+#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
 #else
 #define TCR_MTE_FLAGS 0
 #endif

-- 
2.39.5


