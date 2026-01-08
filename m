Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622E1D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l+XshHzOOBnnNLyY+Z4avqlo8hiC76Kf3HoVMu/Nb8=; b=OeMNxeXUxEkd67y2GB47cU7ERK
	Rw/X9n43D0lmNXNInjEDinjxnYsodOKuyPQuswSzkFKar/699uegCWnWDNq7+ezHrg2X5UysMv+RO
	JljsgbI0ni52vp4dQpodcj2QJu0nvevYnsRFO746GJhqmu6YAnr45ykAUwaihPo7coq/Q4BKIK+oj
	3CQathhPJNB6UKCZ3/FAj9lFNhG11p1wngU1O/qHhC4uoMcbJtpZ5+Hv+pR3wT7mHy1DHU7hZVC9o
	xIE3Scv5zNM2yUZuXyPd15YWBkGdD5eNcYol66g0S86YD9j8RzLzKHSSN+mkUGtn5+DwcnIwzI0jp
	0QzxzHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdstO-000000008ex-2kOq;
	Thu, 08 Jan 2026 16:29:46 +0000
Received: from mail-westeuropeazon11011068.outbound.protection.outlook.com ([52.101.70.68] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdstL-000000008df-394n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:29:45 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bOMUHaXZaArsxwGtP/xJXgvn2JxJ608hHIiZult/JN++zmJFxJz9xGoueSJAqzW5yeUjHP2wJsXvNRrOB55o05t9jp+jsaD6HU4tvlZeUNoxW/FoyarrTGXmhDlNfwRJAisZs11ZDab0gtl0slbrH2bEYaTqLVPdTnTzYJ/7u9m5/bH5xfudPdVN3/1e0MqKeosli0MAuUzS6x1ppSQnN87ko6TcHzoW3ZX/uHUR36LU4Xtq6zDQGBPguo8AwDy/0i3HVe1QjG2UDzPBINmqEv7ZsI0ykDRt+TVWcUeLpSPjGKvwP4hCNNNquCsw8SFpMwS1D+bh21crDZp13mfbtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l+XshHzOOBnnNLyY+Z4avqlo8hiC76Kf3HoVMu/Nb8=;
 b=IyJnzaLb4dR7zEzsKiWTTYF8+dLGummFtk2S5x/hv9ez5Rh0wd+KON8t2rcvswlcEjybc5JIEBC6VbHhu+1KS9ix1fZ9vfBt7ndbhSQ4pYMTLxKqmh+aCaKO8M6rL3v7PUes8wD3hH6gnpzuomfnJ6Z8smUKz2AmIW/akiWhScgdnahUTMydxf1PElTfbeYhxJbCHVhVhZVhyoqpk8/gUhqfOEztyAg5eo1lmMvMmPVTGT2/gejAshGKVpD5hU8sNVZyvErch42AI/dm+L/VGGaopDhW7AxZP7LIAwdeAcIha2iicKgB2d2MHoVKsCacZI0Kxa65OLgK6UEE3a8ohQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l+XshHzOOBnnNLyY+Z4avqlo8hiC76Kf3HoVMu/Nb8=;
 b=VtYwyft72ww7c9rn/7slP5BGJFwGI/dgxjgpxMQri4vmu9UjygRHJ1HueLNXO25QWcePDXENKFMlLbC0HsIAUh8fDNkcM1vnlcqTDRcIKYNNkIGPe4YsB30L1twjdjGan0Xgs5EPTb8sfCXo+m7cupXhEMr/3XwojmKsI0GOGb8=
Received: from CWLP265CA0427.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::14)
 by AS4PR08MB8046.eurprd08.prod.outlook.com (2603:10a6:20b:586::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 16:29:35 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::b6) by CWLP265CA0427.outlook.office365.com
 (2603:10a6:400:1d7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 16:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 8 Jan 2026 16:29:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tG623M3uMPiBXtsMyqh7nDppn0lqV+nZCRWHFiU23r0glyzPfKgpBial0hm1nMUqByH/5/SnHk387MPTm/zg1t3nyB+rJsdJWVE8BL9FUafuwrmH5imEWv2n33FUBamPXT1IcU393jQb3CRu5zIuzsvsRrMRpoGYTY/D/H0RduUh0Vepc0bmBFX4jvWUwfXnwMU1R6YhHASuCi2gqu9gAdy7p6Hl/GD13bn/xOLGbB2dL84FyZOjkjt2y6Vkip+DihkEfEr6CTnMSVvABFxS4EyDf1IUud358p7vH3uTUCOIOm31dbbNjHiujbJEQqV9cTZUcpCLK93bGKGKXwlgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l+XshHzOOBnnNLyY+Z4avqlo8hiC76Kf3HoVMu/Nb8=;
 b=AJL9GEqqve8YgKdgpYoW9uaIimuys9e5wx4HyocA0yIQQ64WIpikYGWWiV+mbX9fPXdP8CzZQOdWNsgAbGdbqyxwu0XBC50H+NRpf7FK62H05nrpg9VBeprCwSKZUeIz2UHCAgWp9wI1yEJeeFesfDLewevoDfwVeFIgytvLlS4corv/UpRRMjU1AmeQq1cg66oJdAX3K3Qrj81RkVKAGH7nn5r+d4lCmJzuS8zMPchbqiz1qiJa+ibFvVr0UUb+LaJunlURzxuRD03TWSDlv3XSLW7rFwJkWw0alz0t9weymNsYjgPX23ebdz0567UnUuZj6UfxGOqZxCh6HV3UvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l+XshHzOOBnnNLyY+Z4avqlo8hiC76Kf3HoVMu/Nb8=;
 b=VtYwyft72ww7c9rn/7slP5BGJFwGI/dgxjgpxMQri4vmu9UjygRHJ1HueLNXO25QWcePDXENKFMlLbC0HsIAUh8fDNkcM1vnlcqTDRcIKYNNkIGPe4YsB30L1twjdjGan0Xgs5EPTb8sfCXo+m7cupXhEMr/3XwojmKsI0GOGb8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU4PR08MB11291.eurprd08.prod.outlook.com
 (2603:10a6:10:61d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 16:28:33 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 16:28:33 +0000
Date: Thu, 8 Jan 2026 16:28:28 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Carl Worth <carl@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Taehyun Noh <taehyun@utexas.edu>, andreyknvl@gmail.com,
	pcc@google.com
Subject: Re: [PATCH 1/2] arm64: mte: Unify kernel MTE policy and manipulation
 of TCO
Message-ID: <aV/bLBPVoUcum9d2@e129823.arm.com>
References: <20251030-mte-tighten-tco-v1-0-88c92e7529d9@os.amperecomputing.com>
 <20251030-mte-tighten-tco-v1-1-88c92e7529d9@os.amperecomputing.com>
 <aV_HtIwNqabq16BF@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV_HtIwNqabq16BF@willie-the-truck>
X-ClientProxiedBy: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU4PR08MB11291:EE_|AM4PEPF00027A5F:EE_|AS4PR08MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd29549-8bef-4654-f730-08de4ed31c3d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ei9zVVZWcHBOZ0NjWWU4Y1ZoelVoeXdReEN6aGtOb1lMUVoyRnl3TVk2TlVq?=
 =?utf-8?B?S1ZlUUFTMTdYQmVVb0RRSTBpczl4S2d1NWhBRlR6L3pkRWdETWZUSmFZVysv?=
 =?utf-8?B?dlF5b21rZWVVbElNRXFsOTBtTjBBb0dVdmFsT0l6cGlGRGtMS3pWNVpxRkh1?=
 =?utf-8?B?SG91TVFKQmJ4NlJhR1JLY0k3WmJHS3o0V09JOHhzamVzQktoVDZTUWFLaldh?=
 =?utf-8?B?RW0zaVJzdmZlajk3Vk9ZcGM1NmphaWdTQ1FaS3J5T2R3STJ6aytLbWR0UERi?=
 =?utf-8?B?R2liOWxscVRqMndCZ3F2QkFpQVZ0N284NlVzVnZ1M2ViYlB1S3RWVVpSdXRj?=
 =?utf-8?B?Z2dUNDNDSmk4MkRaYmFXZUtvTzEraWhkVGNpeHNHZVpNTGJuRE9BVVhPYzRD?=
 =?utf-8?B?UFE5SXkzYXY5ZUpKK1BLYTRNWjFYTEpWdnB5SS81QjE2V1FFSFNsQVR5NitX?=
 =?utf-8?B?YTgrQnlIQW54M2hIT2ovd2pwcEVvQVB0UGVvVDhJcGRPdkJxY3AzY0pZaG5x?=
 =?utf-8?B?eXVUcCtRdDFhOFBQdWVaUEQ3eTZLcVFzKzdDSzlnUVFRMlJPSVJ3MVFKZ2g0?=
 =?utf-8?B?cEljTHI0ZXgxTDJnQ3E2WS9iMFZHMFJQS0dGRlhqSFBBcjRrbnlqSmRGblp0?=
 =?utf-8?B?aXFpT2xvNlRFcUt4d0tVemZlYklROHd3azV2SllJNWRmeEJWSEN4T3RpNmFw?=
 =?utf-8?B?dkxwSHk2bTI0bGo2Lyttd2lSYWFUajJ2Y29Na2ZpTzlvMHZDM3krT28wR3Zl?=
 =?utf-8?B?dm9MYUVoekZ0L2x4WkcrdEM3TzNRbzNhOE9JbW9oMFNsMWtEOHJleUs0SHBn?=
 =?utf-8?B?MHlGNCtVV2lnem5scnQrLytZY1hxT3lOekkwVTB5Ym4rUGRrR1RvL0taTWFq?=
 =?utf-8?B?dGcxUXpFYnRIbkdibmZYenBJQWYxNTFCNUJ6TCtObkV5MjlTZk56Nlg1U2xM?=
 =?utf-8?B?UkVYQ09uMVZ2c2h0ekxDcDFMVjdhSGp3aWJlRDlBVE5tNzFTSWU5WllIU28w?=
 =?utf-8?B?ckFzcU1DcEtOdVpiUWFVQ21KekdUNHplTENCTldsR1cvK0x6VmZRcHF6QXRU?=
 =?utf-8?B?N1NLNXQrMnJwZjFDS0JROTBHRXJiUlRQN1FBbFJwaTVPK2NrMzVmbDZ6OHlz?=
 =?utf-8?B?Ukg5VkJDVmpGR1VSSTltdzhDSzdiUWlBcWlNb2JBTWxKWnJmV3d6M21MU0dn?=
 =?utf-8?B?Z1haaWdyVDV6WGd0RFpwdWRkVWI2UnlyelRKbUxrSUdUb0htem5Kck9tck94?=
 =?utf-8?B?RnpoT0lnT3hoUjVuSjU0WERySlNTMnhaY2VQRXdMZFVtRFFNRmdSa2Mwa0w4?=
 =?utf-8?B?MFkzUGx1citZS3EwY01qUVlkQ2h5T2d3UGR2NVc0TFZqRTFLYWdpRGhxUnBZ?=
 =?utf-8?B?LzBkZFArOUNiQkJJdnc3d21pZXlaM0tPcGFyQzRRdjF0SkNPWklEejd4MUJL?=
 =?utf-8?B?RUtvSEh5WXdHUGs2Z2NDMndzLzZJelRWYW5VRElsVENHb0dsZkdwVWY0eGt5?=
 =?utf-8?B?WWNKb2QvTWFtYkdUV0ZjbWo2eGJxSmpaOU1nMnQyMmg2cG5iZ0lQK2hLL0xB?=
 =?utf-8?B?dkxrRkNzZlFIeXNEUkFRcFpjNFJkU1E5NTJIdHNQQVd3L0grL0kwN3d6Nzcy?=
 =?utf-8?B?NkdSQm1LWmlhalJSNm1OcjdlU083SGJqUDZOSzR4c1VkdUNYM05uVWt0YldR?=
 =?utf-8?B?Q1FLRGxhQ3ZYUXMyVGRwT2N0d2ZaTXBnV0xJc1U3SWgxT2xzNno4TWZTWjdN?=
 =?utf-8?B?RkNjNzNhQVFMTzZNcjROUVVSbHRSTk1CcXptM3UzOUszTFBCQ3pSUTBySmpF?=
 =?utf-8?B?NHN3UFk5ak1aSXNzVmUrWVdnd25Lb2Fadk85NytOSUVjSXZtdUlQU1BSQVcr?=
 =?utf-8?B?MFQySFllYkxiUE9IWGJ2OUx6dS9ua1ZOWmxldWZRWVQwajRWSlVMUlhCV3FG?=
 =?utf-8?Q?1g0JE6ryRxXoXhACxIuX65HhrBuzaMSb?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11291
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f43032c3-1754-4c99-87f9-08de4ed2f714
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|1800799024|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGFxcHk0KzJ1UDZUSUhCMmtWRnluYlRwU2h1UnZxcTZqZnZTdXVReW9vWHJi?=
 =?utf-8?B?dklQcnQyd1k0K3NSandVeEtoOC9tSG5FRGQ0MUZ5SGkrOHR3ZVBmaHc2TUtz?=
 =?utf-8?B?clVtcUNmdzExNERaM2hDaHU4d0xzNEJKMmVXUFVEc0xmbkwvVkJ1UG4vS1RN?=
 =?utf-8?B?SkRlQWUyNVd3NHRNdTk1aEJSREtucWU0bzFXelJMWERaM0pNeFdoRFZYNi9B?=
 =?utf-8?B?anRKb2h0WFdOdVY3TjBXdHhJV0tHc3R0Y2dITHl1eEFHVDVXRkQreFpoMm5B?=
 =?utf-8?B?WVpJdkFJaVQwSzV4MXpqejg1dzE4NitJZUVZTW45d0NLL3JEMmNkUFRGWG0z?=
 =?utf-8?B?Y0Y0SUx4Ulh3eG02d3I0ZnRNaTk1dlkwemt3UmxXOTNsaUtGNnBMdVpVSXFK?=
 =?utf-8?B?UzFnK2poc2lrajBocUZRZFVNeWxQY3dYM0I5QTE5ajBaeDJZZDlZNjhOTlQ0?=
 =?utf-8?B?Z0ZwSjJpUU1SdXhuNEZKZWRMQUwra1EwZnJqTml4YUpJWjcrTFJlWkluQ1kr?=
 =?utf-8?B?R1lkZGpsVVcwUW52SFFwaHU5Nkk3cWtYOXFnUDNaSCtBMUlrdDBXWlFieUhn?=
 =?utf-8?B?SHFJQUJ5c1RjaGpOVUU1R0lyNkF4Yk0xWHY1SjBhekkzUzBVQTFIdHFnN1Rr?=
 =?utf-8?B?blFJcmQyWU8rd0hMblMvMmJPS2xRT2NCYVFBMTVJSW9uemliN0lGYitVTWY2?=
 =?utf-8?B?a2E5cmRSMER3cFJpR0Y2cndaMFVVQSs1WDhTK01BWFFxeG5odisxZmtzZlNo?=
 =?utf-8?B?KzVRQVRVSmdCN3JHTHQwV0dPdWE0RndkU0g5M3E0K1NWWUxXZUlwbGJpVUJV?=
 =?utf-8?B?UHJaaERnRWxDaVVKRDF0Zm1QMlpwbTZNd0dLYTR2Zk9GTmFqNGpwN291VURt?=
 =?utf-8?B?dHZvMUw2ZHZhMVErVlgzOXpYVTg2YkVKNXU2MDhYZi81ZUVqVHRiY3JuTkdq?=
 =?utf-8?B?Rm5MWHZKVDNNRUF1N09IQytKcktaK2JTRTRWUDVEcm1rUTY4Vy9ORHNWVFZ4?=
 =?utf-8?B?Qy9qRzNETFFyVFRQSmxCOFVrRzBDRGlhY1pxbVlVQ2FsVDcxejM4aGJKUUNk?=
 =?utf-8?B?a21NWWtDOHM4OERSUjEyZHFDU0phMmZUd3NIZldGdThqcGtzdjZQbVhDbFVm?=
 =?utf-8?B?UFZpSER6RkczWlA3bmdUeFl3U1NnMFFnZUs0dWpZcUhxalhvZWYraENzOGpW?=
 =?utf-8?B?amxhZVZsazcwaHkwRnBOcU8vZXhRUjZ6N0l2ZXlEekRCeHV2Z3Y1TExmMEhD?=
 =?utf-8?B?ajFZOExPTU52SFBMSlRYVFdWdElwalBzSUh4TlFXZis0WjhiOEtXOEVBZm12?=
 =?utf-8?B?dkttNHRhTVk4MXAwejZPSjc4ZDU3S1JjU2NhQjNkZUtPbE5QZThacGxWUHds?=
 =?utf-8?B?ZWVtbXJJOEJ3V0RvbERQdUk1Nm5JbUsyVlBQM1RrVmdFbGZ3YU5sNk54OTVE?=
 =?utf-8?B?bFNiVzlnUWEyRys5aEkzbEl6Q25yZVIvYXZENFBDS2ZyZmc0NGNRdW50VFFJ?=
 =?utf-8?B?OUdyWFErSWNuVTB0dzI3UmhTN2NiazZ2ZVQ3V25jSXJTNDJ1TkRCdHNoTEth?=
 =?utf-8?B?djFSU1VJdEgvc0x1RXY3MnZrc015NjhMQkxVeDdicHptem81QmFtcXpNTFF2?=
 =?utf-8?B?NHZWQWZKa3lMcTNCVi9GS3ZzYUdUM3lyTk91RyttbXBvWS8wWXFmU0dwNFBF?=
 =?utf-8?B?U3psOUxlYkxLTUkyNnN6OElCZTBrbTNFZ0V0NlRrMnRmL0E5M2xkTGlsTjQ0?=
 =?utf-8?B?UWxTaFRhZElhNnRzRktmRmtIMnEwQkdKUmhNMVFKZXFXVjl0bC9RN1lxa1l4?=
 =?utf-8?B?NDVTQnpvd0hqWFdZNS9UbU9VYkdQN3dnbi9kQUJUeUg4ekdIdU10a1Q2MTBY?=
 =?utf-8?B?Z0lReWltRnorcVJwclFVSFY3U1AvQmk4T280eWRlNEM3Q3djSlpYdEtUQkdM?=
 =?utf-8?B?WVZodXFPb1c3ZUM4aHdqamZ6amFYQnB1MzE5RkE4cmRrU0hqM1dWY0ZWQUR5?=
 =?utf-8?B?NkdSNi9VSThNa0toeW5LaTExTXRia2ZSaUxHbFlVN0pLSFpxNkF1OEVuRTdF?=
 =?utf-8?B?VTZZamZGQTRMMnFzQ1BTMllUcXQvdE00TEJmWEtITlZiOWI5RVkwMVRaQ01j?=
 =?utf-8?Q?mEkY=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(36860700013)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:29:35.1025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd29549-8bef-4654-f730-08de4ed31c3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_082943_942256_65FB5661 
X-CRM114-Status: GOOD (  24.15  )
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

Hi,

> On Thu, Oct 30, 2025 at 08:49:31PM -0700, Carl Worth wrote:
> > From: Taehyun Noh <taehyun@utexas.edu>
> >
> > The kernel's primary knob for controlling MTE tag checking is the
> > PSTATE.TCO bit (tag check override). TCO is enabled (which,
> > confusingly _disables_ tag checking) by the hardware at the time of an
> > exception. Then, at various times, when the kernel needs to enable
> > tag-checking it clears TCO, (which in turn allows TCF0 or TCF to
> > control whether tag-checking occurs).
> >
> > Some of the TCO manipulation code has redundancy and confusing naming.
> >
> > Fix the redundancy by introducing a new function user_uses_tagcheck
> > which captures the existing repeated condition. The new function
> > includes significant new comments to help explain the logic.
> >
> > Fix the naming by renaming mte_disable_tco_entry() to
> > set_kernel_mte_policy(). This function does not necessarily disable
> > TCO, but does so only conditionally in the case of KASAN HW TAGS. The
> > new name accurately describes the purpose of the function.
> >
> > This commit should have no behavioral change.
> >
> > Signed-off-by: Taehyun Noh <taehyun@utexas.edu>
> > Co-developed-by: Carl Worth <carl@os.amperecomputing.com>
> > Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> > ---
> >  arch/arm64/include/asm/mte.h     | 40 +++++++++++++++++++++++++++++++++-------
> >  arch/arm64/kernel/entry-common.c |  4 ++--
> >  arch/arm64/kernel/mte.c          |  2 +-
> >  3 files changed, 36 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> > index 3b5069f4683d..70dabc884616 100644
> > --- a/arch/arm64/include/asm/mte.h
> > +++ b/arch/arm64/include/asm/mte.h
> > @@ -224,7 +224,35 @@ static inline bool folio_try_hugetlb_mte_tagging(struct folio *folio)
> >  }
> >  #endif
> >
> > -static inline void mte_disable_tco_entry(struct task_struct *task)
> > +static inline bool user_uses_tagcheck(void)
> > +{
> > +	/*
> > +	 * To decide whether userspace wants tag checking we only look
> > +	 * at TCF0 (SCTLR_EL1.TCF0 bit 0 is set for both synchronous
> > +	 * or asymmetric mode).
> > +	 *
> > +	 * There's an argument that could be made that the kernel
> > +	 * should also consider the state of TCO (tag check override)
> > +	 * since userspace does have the ability to set that as well,
> > +	 * and that could suggest a desire to disable tag checking in
> > +	 * spite of the state of TCF0. However, the Linux kernel has
> > +	 * never historically considered the userspace state of TCO,
> > +	 * (so changing this would be an ABI break), and the hardware
> > +	 * unconditionally sets TCO when an exception occurs
> > +	 * anyway.
> > +	 *
> > +	 * So, again, here we look only at TCF0 and do not consider
> > +	 * TCO.
> > +	 */
> > +	return (current->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT));
> > +}
> > +
> > +/*
> > + * Set the kernel's desired policy for MTE tag checking.
> > + *
> > + * This function should be used right after the kernel entry.
> > + */
> > +static inline void set_kernel_mte_policy(struct task_struct *task)
> >  {
> >  	if (!system_supports_mte())
> >  		return;
> > @@ -232,15 +260,13 @@ static inline void mte_disable_tco_entry(struct task_struct *task)
> >  	/*
> >  	 * Re-enable tag checking (TCO set on exception entry). This is only
> >  	 * necessary if MTE is enabled in either the kernel or the userspace
> > -	 * task in synchronous or asymmetric mode (SCTLR_EL1.TCF0 bit 0 is set
> > -	 * for both). With MTE disabled in the kernel and disabled or
> > -	 * asynchronous in userspace, tag check faults (including in uaccesses)
> > -	 * are not reported, therefore there is no need to re-enable checking.
> > +	 * task. With MTE disabled in the kernel and disabled or asynchronous
> > +	 * in userspace, tag check faults (including in uaccesses) are not
> > +	 * reported, therefore there is no need to re-enable checking.
> >  	 * This is beneficial on microarchitectures where re-enabling TCO is
> >  	 * expensive.
>
> The comment implies that toggling TCO can be expensive, so it's not clear
> to me that moving it to the uaccess routines in the next patch is
> necessarily a good idea in general. I understand that you see improvements
> with memcached, but have you tried exercising workloads that are heavy on
> user accesses?

TBH, I don’t understand why toggling TCO is considered expensive.
PSTATE.TCO is set to 0 by default, and kasan_hw_tags_enabled() only
sets SCTLR_ELx.TCF to a value other than TCF_NONE.

Based on my understanding of the performance results (IIUC),
it appears that mem_access_check_* operations occur even when SCTLR_ELx.TCF == TCF_NONE.
It also seems that the observed performance impact is caused
by an incorrect check of user_uses_tagcheck() in mte_thread_switch()
pointed by Will, which ends up enabling the TCO bit.

If that's true, I think somewhere set PSTATE.TCO as 1 default and
disable TCO bit and properly handle this bit at the enter_from_xxx() and
exit_to_user_mode()...

Am I missing something?

[...]

--
Sincerely,
Yeoreum Yun

