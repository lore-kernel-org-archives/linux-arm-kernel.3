Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9AED5B870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 03:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUn0evHQMOaRmLeF6eoaGr28aTNzKDKDtqObF044U4A=; b=iCPln6ZUMaSXz0FIptnItU8wZg
	CMpKNTh+PDkR52mTVBvQKv07LFRndVP/0Rt+GtSpeJXKGhqly/UPgeEZhAS8rlfPsngq6MaRzEwV8
	jbuch5FJyBRakOWzm/wMU3ul7+cqXmm0FHSfvyHIT9QMwHghMq2cNBYblaMm11ReocRwP+h+/zjin
	3yIbWU9wep+6SUzPxU8lfvfJeCile3Zl/JRy6ua8+jG2TxmppsXWFYuNF96pX77Zq1Ukn5T6cD4p8
	DNNO9Kc4/8026e16iy7P5W2oPPdKeyuivlW6myyBlDRLY5ZZoca8Q1FvPhVF8aW65UDLjjDhQ5RuS
	8KVcJHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5dFD-0000000D86L-2eJr;
	Tue, 29 Oct 2024 03:50:11 +0000
Received: from mail-tyzapc01on2072f.outbound.protection.outlook.com ([2a01:111:f403:2011::72f] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5dCh-0000000D7ib-1gz9;
	Tue, 29 Oct 2024 03:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJM39a0uD3jNgwmY5ZF334CHoi98wAj8L5CKaWW2d7wmS1sPpR9TQES4RYrab1lup8IyjjZnFN18FBm9AlpQ9WUzLK770rvKDk9u54NR1hy0XqyW4ut2rQFcpT8c13FoIsLR/maM3Mq1IPmQu8UL05wUSedHurojkZMQ9gaJ5voe2GEua3cwVQCYE/HIeCtM9Wu+Ru3JLQ35taTcLqVGM1+g+Wl/Yt4HhnseJEQr31Sz+GxjgCpUg7NX/cBokLW0G1t1YZUrUyDmLkvqHvSx1ZaI5NyX1wg/cSlEgjwosF+oPEmWd5LpmWRU3XeatwG8Q163/13YtrNQCGjL1zZC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUn0evHQMOaRmLeF6eoaGr28aTNzKDKDtqObF044U4A=;
 b=edP1P7YkQkbS346jt8nFiBwGApVMNRYsaiXlvrydVLJy2BJ4l/Qi/zpikHNMmi7Y/QuKmYJ8YeDTINfTsV30+f6HERl9yQspcf1hvwFiLGjRktHBNafAksWiENj+j5jVEZY2Uw36oqgsCLQPo5+Z+1drbnlITxVYAAnjl6PWXA065SK5UC60uIBCEH8tY4I+1ELUIlTwuNngl/9MunrI84mdVE9Ta2rEGpJZUZRPaBjnqboVDOKPZWscTLmY7QPgizSE8sNMBB7/77HRhNjgdOQIkhYn6f0sPBhRHmSA+Ju8hXsRbyoAi+lUrlBkSAE/TM3m9TYNzw2xGouKeCI71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fibocom.com; dmarc=pass action=none header.from=fibocom.com;
 dkim=pass header.d=fibocom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fibocomcorp.onmicrosoft.com; s=selector1-fibocomcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUn0evHQMOaRmLeF6eoaGr28aTNzKDKDtqObF044U4A=;
 b=CCMkJF3wimytDwEUIGBRaoKK78H4GUJpNK4AmvPxHj8bPFB9S7wKjptD5qd8i4SQY9ekMioIYoqtMHfLKJpOscq76YxqRysgyrXkqqiMp9VkRHgXpApdRUd92Uw9gcVlpemWbXU1EB/PMNEqo8OlMZ1ERmQzdpfwk8GCEl/Nqv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fibocom.com;
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com (2603:1096:400:1b5::6)
 by SEZPR02MB5735.apcprd02.prod.outlook.com (2603:1096:101:42::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 03:47:19 +0000
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b]) by TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b%4]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 03:47:18 +0000
From: Jinjian Song <jinjian.song@fibocom.com>
To: ryazanov.s.a@gmail.com,
	Jinjian Song <jinjian.song@fibocom.com>,
	chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: angelogioacchino.delregno@collabora.com,
	corbet@lwn.net,
	danielwinkler@google.com,
	helgaas@kernel.org,
	korneld@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org
Subject: Re: [net-next v2] net: wwan: t7xx: reset device if suspend fails
Date: Tue, 29 Oct 2024 11:46:57 +0800
Message-Id: <20241029034657.6937-1-jinjian.song@fibocom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <11e25027-6987-4c88-ac06-c1ba60c0d113@gmail.com>
References: <20241022084348.4571-1-jinjian.song@fibocom.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To TY0PR02MB5766.apcprd02.prod.outlook.com
 (2603:1096:400:1b5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR02MB5766:EE_|SEZPR02MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dde31b2-eb93-4734-ddd3-08dcf7cc62e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWxDYmczdVViMGZlY21QRjErZkxQMW4rcnc1QjJuaGVSRTFMTWs4TjVHV0Zp?=
 =?utf-8?B?NFdWVm8xZElrM1ZJK3R2dXhyQWFrMksrTkI2Ym5aVlVsVW9tejVialh0YlRN?=
 =?utf-8?B?cnduOXhnK3k5Q2tDM1lhYkN4MndqYkxMb2xBK0R3VkpMWnFEWnJOZU9kVVR6?=
 =?utf-8?B?bXlabkRmc2h6dXF2d2VtVGZFQitXdHJoSE5CT29mTzFzREQ1ckRvSzc5b2l4?=
 =?utf-8?B?SEpGN1pVZXVWdXhTRlBvWW1YVzdDSHBHcFEyZG1SSWEyVCtCTW16NmZYaXBp?=
 =?utf-8?B?ZlBJd1RNR1oycUJpcXNyRloxNStQdFY2OXFLdUtvdElzRElKZXZNMkRNYVNx?=
 =?utf-8?B?bzRPYUM2T3dnT1E3MjFqY0hIQmp5d2lUVm1FMGdoN2t5b3hnRmh0U2JTazh4?=
 =?utf-8?B?MU9OSm9OaDFod2svSFdLL2lVUDFzRkJoOFNMak00TEtNbkErKy9uWUZVendZ?=
 =?utf-8?B?VDVJalZibktTZ01CeTlLVE5MMHBOTUlTdTd3T3Y3cnlDSjlUT1JabnlBRWZO?=
 =?utf-8?B?VEFzeTBKQ2RsUThpQ3Mza3pCN2R5ZXNkelpheUlMeXNwQXRYSGdXdk1qTDEy?=
 =?utf-8?B?OWQydnhNUy9PY21vTXo3eXZCdGJlMGtiUWhqUmxkSjN4cHl2azE2bHFKQ2lu?=
 =?utf-8?B?SHBja1VZa1BwNWZ2R3NtbEJ3MlVaR2M3UU1ENHA0QUZ4TXM2TGNZb0toWi9N?=
 =?utf-8?B?TXR1ZlRhYklXZGhhY1ZvQzBWdUdZeGVXL0xpaWFMZEZsVDhNRy9MNjlNQmdP?=
 =?utf-8?B?bVVSdjlIUFp0RkRrV1FFanRwLzlCTVNvTThWWloram9sV2xNcjlKVWdFVkpT?=
 =?utf-8?B?ZTlWVlJ0Qkx2V2MzVEh6ZmN6WVVZSlJINGUvN3o2TENyKzduUHVUNEdXamd4?=
 =?utf-8?B?QXcwMUgzSmdFdFF4a1dSOUlOTFhnUEZQK0FsRDFTZ2t2NmZwSzQxZTVrVXNs?=
 =?utf-8?B?dXExWllwTVRvUTZaKzRUTThQZTRsdzhYVS8xMW8vSVhCQ3dnU2t6NGhJNDFF?=
 =?utf-8?B?TmNDd0xjTzdydFNNdytzQkQzZGlYV1FvbTNHY1I5akg1TmpIeDdrQUE5bHFu?=
 =?utf-8?B?NlZLeXdxdlExdUZYUElkREkwd1lQOFY2c3RTWlhBSHJKZGRPeHBYaW5naUJG?=
 =?utf-8?B?OStiZWNnVkpCdUZkc0UrblNaMUtjZGwvbkNvbW0vNFpMN3VhcEFzeHVRcGd5?=
 =?utf-8?B?SXB5UW5qNHl6ZFBGMzUxd2NCaHpkbUF6c1kxU1VGQUlXOEEvYzMvcE9SeElq?=
 =?utf-8?B?VVBmR3YrTEkwZWc0MVNvUWhkQmNaS2xpOWpidUh5NzFwTUhMR0w2ZXc4L3p5?=
 =?utf-8?B?eTZXcmE2M1grWHRHNUVBTncrL1dQcTNudW9NWnhmYXZ2SFpLWS9XWlI1UTFx?=
 =?utf-8?B?ZFdOWGRlYVB1MTZaMXpRNmFNZzl3MlUrUi9vbmVzVENBVVAwdk00YThicWpa?=
 =?utf-8?B?M3hTRDFObHdxaVBDVkc3ckdxTE8yUEZlQWgxRGtmRnpweFp0ZXdYOUNHbTFq?=
 =?utf-8?B?QzNML0ZEWDdIQm5SUFlJQXNJRjl3UExCM21CNTRvYlJuSmpRbUxGSDErbm9p?=
 =?utf-8?B?ZzlqQ0E3YnhaL09YbUNJTFZHbXNrZ05UUDdjQ0tFSGVqR0dFODYvYXlZV3Yv?=
 =?utf-8?B?aE83TlFndzZiQi9yeHVJLzhCRityaUFhdXRuUDFnUCsramRlOW1LdEFOVlUw?=
 =?utf-8?B?ZkV3elNUTGhQMUp5S0dvdVE3alJsUzU1cXRIeDVTMzZyMjIwemRMYlVWaDdO?=
 =?utf-8?B?TFN5em5GQ2xRM3BjNERpeUJpOVJIRm1QZnlKNC82Ni9KTThSQmkxdWZvbmt4?=
 =?utf-8?B?K2l2aDIxcHJRMXlZLzBJSjVuMGNsRGQvbCsvQ0x4TnovOTNXWk5hdkJCWUhi?=
 =?utf-8?Q?h1QJ7by4VwHg3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR02MB5766.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVV4Qnc5M3dJMVFzRVdxenV0Rm5zVHhUcXQ1N1I2ZjJuN2dldUdXK00rQnR6?=
 =?utf-8?B?dyt6MHdMN29HeFQ5NnhQcGlPREdJZVJXK1gxNTNPRG1hMUVZemFScFkyQXNK?=
 =?utf-8?B?aDZ3bGt0a2syWCtqV20vdU5BWE9rU1QralU4cGtFYlFxWDZjS0lnQnpRYXJr?=
 =?utf-8?B?eTBpRzM5VyszZTJSZVA0bnh5b3ozSUtSd3p5a3NwNDNRZ1ZUbm4ySDRCenhv?=
 =?utf-8?B?eStYdldFcHYyU0lva2RuWGxLb25NQW8yQ29uNE9ubitnRXBiTzROb0hxYjlL?=
 =?utf-8?B?clQ1Sk1OQ1JyU3AraVRYbVlPcnZRcEc0S2tiZjlIQnlYVTQ0MU9IaGY3QlY5?=
 =?utf-8?B?cE9YdHJBTExUK2RjRWIrRk9iVWEwcTB6K0dGbjgyQm11ZExFM3Y5REQ1R1dh?=
 =?utf-8?B?M3FyaDR4aXpRZVR4WGwyRUNLZzBTTUFQOVd3R2J2SFBRYVBDY1d1S2tBZXg4?=
 =?utf-8?B?cjhhc2lVZzE4T1hKWHJDYUdBQ0NKTERKbFFlWmkwRUhUVDJtS2dXYzBnaUx3?=
 =?utf-8?B?MVlYaUY2dzduZFdrYmxMcnFRdHRHMnRiVEVyZ1dXSGg3VEp5SkQxZ2RSbHI2?=
 =?utf-8?B?L2s5emhHMTB0ZkFSU0xkSVRsYmptang0Sm02T1pjdlozWWhrcEoxYTNha0p2?=
 =?utf-8?B?czN3M2YzVTlrZmhBcEwwZFNmYmkzNG5sWmNWREQvT0V6dUFJa0o3TmRSY3Rm?=
 =?utf-8?B?QktXN2NRRlFTOFhlNGlnQSttejF2L080RFJLK2VoSGxFY3Q0bVVkR0l4RHNG?=
 =?utf-8?B?RUhmRy9LZGVpZlhsaEUyZm1keG5yN3E0cmhoUWg5emJpeVpqQThUMVhuZkZl?=
 =?utf-8?B?K1hZL2hTYzRRMVRUSGRSRTloRGI5cGh4YmtVVlVGN0dHakhnaDN5K09CS1Y4?=
 =?utf-8?B?a0hSaVZTY2U0TEpMZXVYdFBNd01lZFRXZXl2eC8wbXJoQXVLTTd5SlFxY051?=
 =?utf-8?B?Y1VFeGY0Z2UyZkZNN3pRVXlIa0s4VTFoMTlydzZObHJESzU3TThlaytxKzBr?=
 =?utf-8?B?TXJyWVJ6bU1oSTRhVlZ1L2FDZVRBMy81R2V4S1dFSDJzeUhwblRpZVY5cjFx?=
 =?utf-8?B?WkNHRVR0VTREK2YvMTdRNHJwYm1lbVo2eW9wUmhrOWY3d2tYb1R4KzlyZHVX?=
 =?utf-8?B?bXFRWFN2Rk8wTnI3S0xrSnhpMXNzU0JnelZIYWFIVjZ0aGZpOWNvWHFTY3NY?=
 =?utf-8?B?SDFHOVQ4UjcwUEt3OXhnNXNIODhLNkNoc2ZIdURXKzluTXZmTzRBTHFsVWR4?=
 =?utf-8?B?SUZvaHFJV1o5eksrb1Bmc2g1ejNSbXBSWm82TXBIZVYvUzQ0VW0wV0lTWG9X?=
 =?utf-8?B?bnMyQ09adVI1bkpFS0hzbm15b2N5ZEYya0Nnek81a1hvLzBWZUZkOVNJSE5T?=
 =?utf-8?B?VVFlMGI0dHhQUlFvVXRKMkFFS3hYZ3hTNXd6LzJGeFN1OTFLRzB6c0VWL2Jv?=
 =?utf-8?B?eHJnNHdObmtaclNEUi9VMWo4N0RVU0VaQnZ5S2RnM0dmRkczeUUzZFJnUFJK?=
 =?utf-8?B?a3BxbUVsb3pGNDRLd0JCL3g4MEdTUHRmM3FVR0JqTm9uU1U3bWl2Yzlya0Jp?=
 =?utf-8?B?OXhrTm1iQ29GcTQwRDhSKzdtMm54cmVlbmI5N045M0cwY2FzcDUrbmFnRG1J?=
 =?utf-8?B?Z1BzL2h5bm0wNFVzcjlHY1hjeHFQTlQzY2RPUDN1NGR2OFAyUldDS2FPdURO?=
 =?utf-8?B?WUc4THc4eEh3dXkrMGNPaTBUbXdGNFE1SkdXQVpjeldHWFZQbjNFTEFyNlpE?=
 =?utf-8?B?R2ljblJrRnJRSHhmUHBpL1RQL0dQcS90dVYxZU50aWZ0NWQzZEUrMG1hNHVr?=
 =?utf-8?B?aEZyTFhudjBkV0JEZEVHcERBVWFiYTBuSkF0YlUyV0FiOStYcW9NNHdyM1FD?=
 =?utf-8?B?bENOeUtXVG01bjcvckpMZk9BT2lkYUt2QzlKRGVCMXVCQk9ReUQ5U2lodWpW?=
 =?utf-8?B?Yk9OdW9SRW5PbUxBWit6Ui9nY0VrNUE0MkpxendpQjNMdGdEbGJKNER6Tzhq?=
 =?utf-8?B?bWQ4RzQzTThiekJhUUU2OU42STBqVE9jQkQybHFSR2RuUk1od3o1UU80cWI4?=
 =?utf-8?B?QXJPV3ZlQnBheWJsd2h1ODVzcGdmRk5pK1BEQVJxemQrdG4rcE5XZDRpZlNw?=
 =?utf-8?B?eXZ1a29Zd256NzY4d0FSaHhUUjdrdUNISjVkam9Ga2xROUNGcDZFaVQvbHdZ?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: fibocom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dde31b2-eb93-4734-ddd3-08dcf7cc62e5
X-MS-Exchange-CrossTenant-AuthSource: TY0PR02MB5766.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 03:47:18.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 889bfe61-8c21-436b-bc07-3908050c8236
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnNhCZLDbNG0dOG2bfO22lYJPYfBM6V4Y0gpqH/Lq5eY6S1dqZ4TU3MeV2F8aRlmHxaZi9QYDNLVd2CV1xBJtjxgtgxM/UYL7QAmW6yiE1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_204735_497496_A84BD953 
X-CRM114-Status: GOOD (  18.08  )
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

From: Sergey Ryazanov <ryazanov.s.a@gmail.com>

>Hello Jinjian,
>
>On 22.10.2024 11:43, Jinjian Song wrote:
>> If driver fails to set the device to suspend, it means that the
>> device is abnormal. In this case, reset the device to recover
>> when PCIe device is offline.
>
>Is it a reproducible or a speculative issue? Does the fix recover modem 
>from a problematic state?
>
>Anyway we need someone more familiar with this hardware (Intel or 
>MediaTek engineer) to Ack the change to make sure we are not going to 
>put a system in a more complicated state.

Hi Sergey,

This is a very difficult issue to replicate onece occured and fixed.

The issue occured when driver and device lost the connection. I have
encountered this problem twice so far:
1. During suspend/resume stress test, there was a probabilistic D3L2
time sequence issue with the BIOS, result in PCIe link down, driver
read and write the register of device invalid, so suspend failed.
This issue was eventually fixed in the BIOS and I was able to restore
it through the reset module after reproducing the problem.

2. During idle test, the modem probabilistic hang up, result in PCIe
link down, driver read and write the register of device invalid, so
suspend failed. This issue was eventually fiex in device modem firmware
by adjust a certain power supply voltage, and reset modem as a workround
to restore when the MBIM port command timeout in userspace applycations.

Hardware reset modem to recover was discussed with MTK, and they said
that if we don't want to keep the on-site problem location in case of
suspend failure, we can use the recover solution. 

Both the ocurred issues result in the PCIe link issue, driver can't 
read and writer the register of WWAN device, so I want to add this path
to restore, hardware reset modem can recover modem, but using the 
pci_channle_offline() as the judgment is my inference.

Thanks.

>> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
>> ---
>> V2:
>>   * Add judgment, reset when device is offline
>> ---
>>   drivers/net/wwan/t7xx/t7xx_pci.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
>> index e556e5bd49ab..4f89a353588b 100644
>> --- a/drivers/net/wwan/t7xx/t7xx_pci.c
>> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
>> @@ -427,6 +427,10 @@ static int __t7xx_pci_pm_suspend(struct pci_dev *pdev)
>>   	iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) + ENABLE_ASPM_LOWPWR);
>>   	atomic_set(&t7xx_dev->md_pm_state, MTK_PM_RESUMED);
>>   	t7xx_pcie_mac_set_int(t7xx_dev, SAP_RGU_INT);
>> +	if (pci_channel_offline(pdev)) {
>> +		dev_err(&pdev->dev, "Device offline, reset to recover\n");
>> +		t7xx_reset_device(t7xx_dev, PLDR);
>> +	}
>>   	return ret;
>>   }
>
>--
>Sergey
>

Best Regards,
Jinjian.

