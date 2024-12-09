Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F4EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 05:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gn2sBj7bIrZnFiYv4+EAHu5AMgw02NJanhY775oe6ZY=; b=XA1afrWEzDg2mdYPREPMRwJM1E
	OKse5/jHp+myR1RJaG9C5gfT4op0RrMWxR/zLFrOeWrUyEfb2EKNE9x3LzFx+xid56TEtfCIxs9Gs
	QSlUOMdaZBvK1yPXRIbQmc7qSB4uvqrpnpEPaaXxZ8bt7nS2+u6SyC3ZFu9IpKdMlL6RbWtys3x1f
	Zttb5wLIHg9W7RRG2r9sUsD0Z/uwRmxbakR2cP5gQ/rcA4CDnGoVJYmlaBzl91gxc0aLo020MhHb5
	5FZBB4vYNL8HRZTfjSLefMBrM0KdBD+KMnR1XCJcURJ4YmjPIXy4uypItgeJbaZ4U0yF/9YZ8vxY1
	dEkbiIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKWQQ-00000006Vh9-2PEN;
	Mon, 09 Dec 2024 05:35:18 +0000
Received: from mail-dm6nam10on20713.outbound.protection.outlook.com ([2a01:111:f403:2413::713] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKWPO-00000006Vbw-0RFb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 05:34:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9ja6JUmZJHjIgl0QlT6YIohCYXCrVoy6m+/hacsgFEXknkHhSWLdOe9fI7OFR/0VwmkdI2irPykeTfl/W53ngnVo1q1x5ib5Vxc3YCKzn3XAwb+WVHaco1IYOi+xhczr1xNk9RLjjbBC8IfEwchoXEVFO7FKxvnn4Ld4S/8fQ/vwVn1jJKiZN3sjH+xKhSNeA4XFrDoH8imooBHBBxl73VlpbrF8xwJ9ykwRoOXsAnnwZLY5w0BKogLZ5OsDx4mro3H/6AlsIV+9Wi4v7aoofjU32x1iytgzxtYcVNLysFcfAdw2NvnhBdSHw5tY1/Hbni/inwOioCNLtJi/HH1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn2sBj7bIrZnFiYv4+EAHu5AMgw02NJanhY775oe6ZY=;
 b=YhzQYibIumbmYIvYUlddfH5k/1Txuan9aCdj1g7Lyt/XBGFhHoz95Ed76Lfptt2rA0Pc+NGfIFLJJjc2NJeIRk83q5OV9N4tZabAWwX+z+VMYzrn3F1w7in66LdJvO9xUJCCWgnpExyvGFcrPRkO58ZouIqZwJYmckQGa0pXUb2JFPiCzq3fhQFX41TIaOqfmRus5B7RNgXSWXo5f1+ylvzVCZEaMEy7CrVp3rcWrctp68U/NQAzcEaKFEJIqJjtnfM6pUUlpjPZ4enwzzBPtUo4XJEm5vybMqzzw/AGJxXPXPnpz10A8cEeKmTtMZge5Re0ZDCVnt7a9lND81xGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn2sBj7bIrZnFiYv4+EAHu5AMgw02NJanhY775oe6ZY=;
 b=gYxF/KaCIdAjpJtWBQWM6UVKE5Hl/Y61e2lBtGlUjbF/qvu+3w5GZ5B8LzccsqP+hkyi9RcwGUs1OgK1+ElaZ7Q5I4Z9aAqYwUFw46maCTtz9yULNAVEKqLSEOuO8/NKrcPdFay37Vr15Wes0itijbqsgy1iX8HrvXINetocygM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 CO1PR01MB6760.prod.exchangelabs.com (2603:10b6:303:f2::9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7; Mon, 9 Dec 2024 05:34:06 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%5]) with mapi id 15.20.8251.008; Mon, 9 Dec 2024
 05:34:06 +0000
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
To: kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	christoffer.dall@arm.com,
	suzuki.poulose@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	coltonlewis@google.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	darren@os.amperecomputing.com,
	gankulkarni@os.amperecomputing.com,
	vishnu@os.amperecomputing.com
Subject: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If timer expired
Date: Sun,  8 Dec 2024 21:32:01 -0800
Message-ID: <20241209053201.339939-1-gankulkarni@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::27) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|CO1PR01MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: cca4a4d1-7f56-478e-8807-08dd1813193a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzQ0Y2xxWU4zbnNORlZXNFVGQy8yZWJTNHhBQ1dNcjY3YUhLUmQ5N1VrNUlG?=
 =?utf-8?B?RGt1b0xCSUdPZ3ptTGdhMzlBWlIvaWJkb0ZrZTNXa1VuYjhxWFYyZlRsamZr?=
 =?utf-8?B?S3J1ZWl4S0RWZ2liUG15NlV0eXA3TGRmVWxJOGVDVFJONDNudWM0Wm96WUw4?=
 =?utf-8?B?djVVb05TdnN1V1hqNHlySXEvbUlrdmxZNHVkSVplZWtYQkNWdDg2eHNVRmMw?=
 =?utf-8?B?a1BtbEwyQ1hHR3lUMk9hTzBSam5xeVJHNVBEQUc1WTB1SVkxMmZ6YTYyd3p0?=
 =?utf-8?B?Wmw2STUxM1FpeVUyNWpBcGlMYXhaaDRrcmpab1htS0c4OXJyTStZbTJxdEpy?=
 =?utf-8?B?YmNhTWFzSDRHWC9SZ0tUM28xREhwQTBlbnVMTFNWSGJodEF1ODJpSFYyVW5G?=
 =?utf-8?B?QzdPTW9GVis5anlWVS93L2pDNkhGMXJTcTNKZUJTeTVnajcrbG5kM0hyQXpj?=
 =?utf-8?B?b3BwQUdzY0MwNXN3cFB2SzVCODB6d2pOTlRGYjJ0bitBMmlNNDNjNUdSc21H?=
 =?utf-8?B?UnJuc2IxYlhhckxRcGhzZXVCclc5QzJXRVcwc1h1OGJPODdPVGJyNVFYZjZ2?=
 =?utf-8?B?NEFOQmRLSzFtdHJReGdYbzltMTFDeURYamx0Tml3SFJsKzBmU2c5RnZZM0dl?=
 =?utf-8?B?ZUNoKzdjdFFMZWdOTEQyMS9oaTZZMWFVbkdUczhTWWl6MlFRa2oyZHlSS3pG?=
 =?utf-8?B?NFM3eWZ6RFhha1Q5bU1nRDlEaXZtMGl1Tk9qV2xlUWt4TnBydktON0ZVSVZF?=
 =?utf-8?B?NWxhbjFPZkFRUjN3by8rTW96WDU0RGtuRjFIdnlOTnVmYi9VYk1KcTlOVENE?=
 =?utf-8?B?YVZmTGJvRkMzL0x3V3VTSjFwTkNaanoxY2UzRGlBRktoS3lvcytoTEE3MFh0?=
 =?utf-8?B?Ly9veEZISEl5MHRGOHBBZW15N2xKUjNhejFXSW9ic09nbFpNN21GQWM1NHRC?=
 =?utf-8?B?TzJ0YVNtSWpkd3dXVFIvSUJhWFplSzN4WHNreFg1L1R2QjZCbmtNNXBseXpC?=
 =?utf-8?B?b1Y3R1hjTFhBVHFOeEZQKzB1UEdPeGpaZlREOXN4OThqRVhkdmY0aHBSUHRI?=
 =?utf-8?B?K2F2a0N5eWNURm90VjRweHVsdW5ES2grWmRlKzlvUXJUK3poRXJldHcydVBB?=
 =?utf-8?B?ZTF4ckMyRmRELzRkdjNseXcvSFJhYzk1Mmhsa0xFR2FiMit0OGZiMW9Ma29s?=
 =?utf-8?B?OWg0SlR4QUIrbCtwWHdpNUJsT0ZpV0Z0cEpDRHZ6Z0FSb1k1VUxTbkQxZEla?=
 =?utf-8?B?eDNHM3pCQkNhY1MwZkVJNjI5bEtDbEVpVStvbW4wREk4UVBkeVFlZGdrNVgv?=
 =?utf-8?B?Y0F1L21reVRETHRuUUI4L3o1L25PQnM5RmRVZmh2Q2l1SDcxYVQ5azVkOGdx?=
 =?utf-8?B?WG5jUEJkNVF3YkhOT2xDRnM5blN1NCswa1V5NjJMbTRSRW1ONmpmUklSdmMx?=
 =?utf-8?B?UnR3YkY4aEdsMWZKYWdLYWFJMFA1ZXIvVWEwalhRTldaTGtMKzZHZksxSjJU?=
 =?utf-8?B?Y3k2OFVkZUJuTGE1VTc1RldJZEFxMmlGdmFLRlVGSEZUbk8wVjlUbVJ0U0Nl?=
 =?utf-8?B?bHdrWmtlTGt6N2NSdmZRTnZNeC8wZjdxMHpCc2ZvM3NWYlJOWnhtU2FuNDQ2?=
 =?utf-8?B?a0k3MC8vRkFiZVJ2bWY1WGJlcVdERjRzY0hDZXRXaEhoczRqbUFUbzJNNkNU?=
 =?utf-8?B?dkpVa0ZhTjY5ZjJOUWk1YTVNTlJkMk5QL0pCZkszMHBOVTNQK1Y2UUF1QTBk?=
 =?utf-8?B?VEJhWExEeHBLTXE3RGpwTzA5RTVNRktkWFNUcWtlQXFVSDZLYVZkZjdVcFNl?=
 =?utf-8?B?WEdoVmk1U2VNOHU3eGRMTHlRaU9sZmNIK2FaVFEyM2lHVTRHYkJCM3Q3UHRi?=
 =?utf-8?B?SUt2RFAzQWtjQUYzdmovM1Fwb1JKNWpOWTlSYjlpT1JyYWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnF2eXJ1ZXdUZWVYcHY4MUl2bkZjUlJEWUtDMlc5c3F1WEhBOXlYVFIwa0JO?=
 =?utf-8?B?cmk5T1pOa0FycnRramRVWENJMEIyK0VMMStRRUJzTk1oalVHS0hwbmczdGVp?=
 =?utf-8?B?QnN6b090QmVpUmdEZjNFY1A5Q1Rrb0ZCSWRBT0ZUeGx6QjBrWGEzWVlLYUpq?=
 =?utf-8?B?NlR1aGUxVmhrR0FjR3hOWlRrSWVvQ1JaK01lYXMxeTYrY0x5MjFDOGh0dTB5?=
 =?utf-8?B?amo2WlhZbXk4eTJnVUpyVW9qWHRoNkpwcnRPYVh3amNnQ3BvY01OTFhPMEdP?=
 =?utf-8?B?bHhqTUx1aHowWU5KNW43S1M4eGlDUHV3MFhFS1dreWlpV3Rja1NyN1U0SVVW?=
 =?utf-8?B?d0hDNEJYNnZzVlBFeVVZZFlqb3dqVUNHNUk1QXlxVVc3MWVJaGhuSC9ERit3?=
 =?utf-8?B?YUxRUlpXUk95eEg0QUI5NTVxdVBFSFBMakxSYmhQL3pNRzBkL2R4OFV3UEZH?=
 =?utf-8?B?bVlhZmF5VExVU21iSmJZNHo2M3hOTlVXMWxmOVpwOW1KMWVNKy9MTlpteEUv?=
 =?utf-8?B?UWUvSGh4eVh4Rjlocy9XQlBvRm9BdldqOU5oNmJCOG5zK1BIb0oyTXV4aXdj?=
 =?utf-8?B?andXQXoxbkp6UERoVXJZS1RsRzl4aWFpb2FVanZTRlFBNkloL3lLWDB6cTNO?=
 =?utf-8?B?TlJPbHh0MUsyOUwrdzIzRHBZempGdExVTnkrVjVIVFFCLzlCK2lERHJtcVBI?=
 =?utf-8?B?SmJqRTMwTFJOUzd5dVNsMkprN0hlb3pDMHdZMXJrd0FjdjdKMVBtcElXLzdm?=
 =?utf-8?B?OWw3bmZlRnI5N2c5MmQ4cDJTQ25mSmJSVHpHRlhnZnBVMmt1RXRvWlcwUWty?=
 =?utf-8?B?V2ZuYUxqZTBTWHhHb2Qwc3k2TlJxT3ZxSEIwbWRiSTVvTFJObW5ZMGJ6NlM4?=
 =?utf-8?B?eG9pYmZsZGVoaVlqUldRbzBSRXMzZGw0Nkt2aVRqcGlQeEpHOWxGU0RUTDFa?=
 =?utf-8?B?R1dMZ3NRTzlKRmxVZ2hlU0Npb2xaTHBwYVprQUdwdEh5MVV0T0VFa0FJZGlJ?=
 =?utf-8?B?UXZiWVlYd0w1Qld5NitKMmF4OEJLQXJhNG5mckFFVnptUnk5MmxiZllsNWE2?=
 =?utf-8?B?aU51MkhncXI4RkVmMXZhMlkrbXVKRktKMzNmYlpSMnBVWkNndkZsODNkYXh5?=
 =?utf-8?B?R0dWVjdLejlMcVE5TmN6U0dQWjRCODN6OTlNYU5od0xndW1rVWpINExxMVFo?=
 =?utf-8?B?RGRpM3Y2U2dUTjZKbjFSZkFGUHIxRWVocVl0MWJJZHJkaEZtbjRwU3U2ektU?=
 =?utf-8?B?QlFiQmJlaE0xK1BqZmludmk2SnZWeHNYOS9nOXRWRTZwMVkrTU0zWGZyRmlr?=
 =?utf-8?B?R1R0d1Z0azRuK25Pdk45L1YrMEVuY1ZZVE5HaFpiWWNidE9QSW1nLzJXejVW?=
 =?utf-8?B?bmQ0NEpWL3ZHSE9HSGM3eTlQL0tuZDFnZjNOTkQwblZPbVBLUk55WEY1ckdG?=
 =?utf-8?B?eE94eXpoa254ZjZXYXZFYXdaUFVBU3RFeVZJUDkweUZTSG1nTEZYWWxkVURU?=
 =?utf-8?B?and3cVh4UWlPQzNJWVpoZlc4bk8vTEtEUlF2a3JMZ2ZXRU5FMUllZGtHZ1lI?=
 =?utf-8?B?dlc3MXdlWmhSK2IxTDFKTnpJWFpDVElYaXhZZE4vUWl3RkQyaG5RSXA0WXh0?=
 =?utf-8?B?SWhHaU10VWJuY3hqUlhzMVNaZTBrbmRGU0RxSEhCR2dHTXhvdjN1MDM0ZCtZ?=
 =?utf-8?B?OFFtRnhCNE1FbEpTSWZEN1VzNDZDT09yVEFwWGJZalorcXZ4WFlMclh0Um9G?=
 =?utf-8?B?aGtWRW51T3M1VlFTM2crM25mMEp5Z3A0S3ZrNklzcHJ3VktNZDB2WnQxMmhn?=
 =?utf-8?B?N3JsQ3oxU1Q3cFkzYUtHcTZ5RXREeXhxeDBxZGYvTmRKYzZieGRYSDlJNWlj?=
 =?utf-8?B?bEcrcHozVnRoeVV1Q01ndEU3Nmttc25DQ2tkVmdIRVMzcHJvTWVrWTFvTG83?=
 =?utf-8?B?S0NMY2FkeWFWYzkrZGk3RWZvUEp6VXFQVDcvNzVUMlFteVI1MnpQVGpHT0Jn?=
 =?utf-8?B?WmQ4Qm1UaCtWSGVjeGs3aFQ0ZkNIMWJpdFA0QnIzL3BkYjlVK3dRWjM1ZW1F?=
 =?utf-8?B?SWlSdk5KOUpCRldEU2VGVTQzWGxqUnpvZnltN3BrMnZoVzh1UjNSZ3gvaGF3?=
 =?utf-8?B?ZmRLZWV0bVBPZzdQRXFNVVJVV2FTREI2L2hKeTNQZTgzdWV6YUlMQlNxRWcw?=
 =?utf-8?Q?lyuyT9kdexO2PcKfIbFmPb0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca4a4d1-7f56-478e-8807-08dd1813193a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 05:34:06.4869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYz+5LBYrax4wqabKUCIyZLSkt/AnSqw9QBjwl/PgsuHdgtm+dFm+cFhyhSlv4b16+pNVGOsAnxH2AbNuEXR1rMRiDipIJny8arOE8gXzlM6/H4VSaXUjCkj6jPktAlD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_213414_158406_1C28F90E 
X-CRM114-Status: GOOD (  13.79  )
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

During automated testing of Nested Virtualization using avocado-vt,
it has been observed that during some boot test iterations,
the Guest-Hypervisor boot was getting crashed with a
synchronous exception while it is still booting EDK2.

The test is launching Multiple instances of Guest-Hypervisor boot
and while booting, QEMU monitor issued the command "info register"
at regular intervals to take a register dump. To execute this
command, QEMU stops the run and does the register read of various
registers. While resuming the run, the function kvm_arm_timer_write()
writes back the saved CNTV_CTL_EL0 register with ISTATUS cleared always
and resulting in the loss of pending interrupt for emulated timers.

In hardware based timers, ISTATUS is a RO/WI bit and gets set by the
h/w, if the condition is still met. However, in Nested-Virtualization
case, the Guest-Hypervisor's EDK2 is using an emulated virtual timer
and losing ISTATUS state and the interrupt forever.

Adding fix in kvm_arm_timer_write to set ISTATUS for emulated
timers, if the timer expired already.

Fixes: 81dc9504a700 ("KVM: arm64: nv: timers: Support hyp timer emulation")
Co-developed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Signed-off-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
---
 arch/arm64/kvm/arch_timer.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 1215df590418..aca58113d790 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1199,7 +1199,16 @@ static void kvm_arm_timer_write(struct kvm_vcpu *vcpu,
 		break;
 
 	case TIMER_REG_CTL:
-		timer_set_ctl(timer, val & ~ARCH_TIMER_CTRL_IT_STAT);
+		struct timer_map map;
+
+		val &= ~ARCH_TIMER_CTRL_IT_STAT;
+		get_timer_map(vcpu, &map);
+		/* Set ISTATUS bit for emulated timers, if timer expired. */
+		if (timer == map.emul_vtimer || timer == map.emul_ptimer) {
+			if (!kvm_timer_compute_delta(timer))
+				val |= ARCH_TIMER_CTRL_IT_STAT;
+		}
+		timer_set_ctl(timer, val);
 		break;
 
 	case TIMER_REG_CVAL:
-- 
2.47.0


