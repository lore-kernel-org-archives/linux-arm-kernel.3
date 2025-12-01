Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC59D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 07:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8UhSLsvfeHffpLkZZHWNLNy69t73h5EfIzj4Vw2xOU=; b=Ms/6vLRXlT4zpdBH/7SuvB1p4r
	CAEBg8iQNCgrwXqBfkxnnFPApjo1yogIyL3OuV1mEfrNYO26pGwB+5UOIFJHqEFgLSVcLZUEbxKex
	KKAc4tE4vzgbxCVz9T20NNUf2CvXezt2gZbDHh8JpzVDGB4B7/oQlbv2xN3okwJg9nNaFqTryNG93
	UHWJeLEBRaI6X/UdFSxHAXlKIRgbaPwwi8WLHCRxLZ7Aq7duJxq1qbrFIjBlvPKt2yWu/4Luw0qyX
	ePEDFh2Mwp4IkmAVIDVVH3khifA4b+FX2yIAiCyY7uFSDIpvwQbDo8DizyinQpw3sqHkr0SMSWFNP
	qygkOYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPykX-000000035EM-1foX;
	Mon, 01 Dec 2025 07:55:09 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPykU-000000035Dp-0pFZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 07:55:08 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B14vU8L549409;
	Sun, 30 Nov 2025 23:54:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=M8UhSLsvfeHffpLkZZHWNLNy69t73h5EfIzj4Vw2xOU=; b=
	l1qUM2ARwLsE6dKNoARKxwIQwjitvtLDR9J4JdfZgtrL2WmX1+UnQ2bcQHiGLP8G
	bFb4oI/lynMjXI0dXt6xZm0KGEw0kMa0moQgBIy04pnSReYEyk9XNV82EfPMAKsa
	k8MC8a0SLsVubfpGfZodJzR3om7gjyG5kaJdaOl2zyxD7PzRWEwVs9JvW/Xxi6Ha
	aFV6as2/i/1nc1g7dWrYeAiZMNLeO26hLKowwyPvOLjd1ml0+gZZ2vLxCbfWlQEK
	EBv5fz2Z9JGOFM3Kigk6j8puDlLlnpeGCzqXmhT4DkkL61fC6ukMdc5dEJv4LO9O
	Z0qY6LAYnlVBLwrG9MjjNg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17ms9ec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Nov 2025 23:54:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMuk27QT/bhKaz/Fnes5hToy8m/9wyvBK+L+hR3OT+KMF2CXA9aYFR9sUG39zGneA/wxT3N8uplaiKTRRyyjvQcBFWak8vOQAS14MtDckZVzkF8ZRD0MPn1bJpw/s5S2orxpaS9uiIMKqaOFwCZWIiseqQK7rUwUtCyJy36VGgkAy5/Bx+lyLQzHYfL3GzLDEWaUF5m5TgPHodwXvJHc4bKHFGtI7GYdk4xahqbu4Mt3k2F27liHukrL9kOWPYv9cn8bT/Nejw3u17bQrLM7Mafxn3Ih8VWlXdS3reGJU1C06XiXf4Cg/EAmFYYFvnVNfZP/vNMBUBfK8/TAzp5GYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8UhSLsvfeHffpLkZZHWNLNy69t73h5EfIzj4Vw2xOU=;
 b=QoYx4s+QMcWUIcxhIk7O7gLsa3fWrozrWceYFrFqlzCa+DQXEfoXh7naMC5h04ZcqZZ6es40fzbEJzsCa7/8m4oRx2wYy82NPS3jjntWrFjeErI9j8hH25yLydbbHHAh/c82kwuxKGCmC2S8OfwHQkfFolH7szZper9udpxs7syPCE9rSVyEPFKEgaYhYe4N0Q59tNCENisF5BUI//w4zjW6eIgIRkEjaLCJyiRIsyc5NaYPwmjjBsyJEA746kM57K6T04uZtp+Zhu1UuvW/lRJA5auUpb8vJj64IChuPjKRlQQwujLS34S0o5oDvjPJNulXgEjod/cXQoma+KjgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) by
 SJ5PPF867D7FF5E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 07:54:44 +0000
Received: from DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e]) by DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 07:54:44 +0000
Message-ID: <ac172927-1475-464c-b925-5fec2cfa1b1e@windriver.com>
Date: Mon, 1 Dec 2025 15:54:37 +0800
User-Agent: Mozilla Thunderbird
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Subject: Re: [PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
        anshuman.khandual@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, "Shenhar, Talel" <talel@amazon.com>
References: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
 <87qztiec4e.fsf@DESKTOP-5N7EMDA>
Content-Language: en-US
In-Reply-To: <87qztiec4e.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To DS0PR11MB7736.namprd11.prod.outlook.com
 (2603:10b6:8:f1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7736:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: d34449d1-8d30-4052-5f72-08de30aee417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXJRWC9nRURpZ041MEhhWVRMeTZEM0hGS2ZONFZucThwVlpXUEdSWjBYem5p?=
 =?utf-8?B?NVFJdlovVFZka3NrWUg4OXJZcnNtLy9peFNNa2VHNE4zSitlaVFKeE1reGxC?=
 =?utf-8?B?RXZDK0RGSElxRWFmNEhoZ2JsdzlJZDg4R2p6dnlqVndOUEd6MVNUYVpTUDdk?=
 =?utf-8?B?UEs3a0VYVkFwQkk1UTZyV2lrZ1E0LzFsQlNTN3hsenZhaWVoVE1FRmRlRm92?=
 =?utf-8?B?MWlmMzJVVTIzaUt1NzR1bDlwU3Z5dVcrVDFpdkNPYUdoTlkxQ2N0VC9nOWM3?=
 =?utf-8?B?TTRhbTZ2RXUvUm1nVXJjdytiQmJTeXMxNGdhZUdCS012M09GaElPTUtmdkRJ?=
 =?utf-8?B?WWFsRGtWa0VFQ3lJTWY2bEx5a1gzTWdsQTNJY1JwazBIL1dTMUJUZjZTamQr?=
 =?utf-8?B?ejRhVStieGpOckpscHVXYjBhT3VzMTJBWEhuWHhFV0g4UHl4S0szL1NxNkpw?=
 =?utf-8?B?dE5PNWJMN0t3VDlEaEtpczJEOGxGS1Azdy81bzRTaFl2UjBLSFNPQ2lCdlBI?=
 =?utf-8?B?dU1uNGxOMnNmWTVtRkhqTTdZTlR5UzVpU1N1UjBTazVuWWV4bi9vVjJrWjdl?=
 =?utf-8?B?dlZ0NlJXQ1d4b2VOM2ZTbUxwTTU0UGNiSHVqcURVcjBQZHBUZE43bThEZzFv?=
 =?utf-8?B?SThsVW9xY1FiRVNwQ2ZJY3djcy8rOUN0Y1BYVDk0TkJ2dkRvRUcrL09rRlBH?=
 =?utf-8?B?Y0pvTmdrSWRDaGkrRkVMWHdPU1N0NUlETUFzeWdGQllseWo3SUpkM1BBUGZ3?=
 =?utf-8?B?RlZYcnlCeFlKZ2NHenRHdi9XazRkN0ZvazZxTzVxQkduR2dkdVg1R0dGLzUw?=
 =?utf-8?B?dkdjY2MrZyt5ZktYY0dRZDMvWHBKS1RNRE96clM3YW1DREF2YjhWU2E5bXgx?=
 =?utf-8?B?SzlTZmtLZzlhMHpUcERYYlN3bUxNNDJ3VU15RkxMTGVwSHdVTFVMamczYTBp?=
 =?utf-8?B?NFQ4UE5qeWFNRWgwOUducWJ5QkZNNnJFK0VtelQ1YU5PaXZNS1FvbHBMeVZW?=
 =?utf-8?B?OG1pR1dvL09nQzUwazFYUVNnMk54aUNvVHN0L2RLZE1XZGhEM1hrNXRpK09C?=
 =?utf-8?B?NytjK1kxeDViNVNHaVlNNXNVM0piMXJKbEltZS9YMWx0WnVJd1VBQ00weDJs?=
 =?utf-8?B?d1k3ekZBcmV5QUFodG9LREpHeHQ0VEw1Ukloa0JMa29aNEFXV2NjUDcrTElN?=
 =?utf-8?B?V0NBc0ZLTk15OGdtMkhpNkxHdXNMT09sVkpqWkhWS0lzK3JuUzNmamxuZWNj?=
 =?utf-8?B?aXZKaUR1NWtpNUZOR3FXbEVoV0trRGxrZFZuQllJUTZ3d2RRN251M0V3bVhn?=
 =?utf-8?B?OHZnbGtJaFUrZFRqWklmK25JSWg0MDNPQllTZU95ZnAydGVSSDB2KzVPMUIz?=
 =?utf-8?B?UllOODBvUVZiYXI4cnhkVFJQck5YckhQV2JQWms2dW5aYlA2TE5PQnNxbkFS?=
 =?utf-8?B?a3kzMW5La3ZkYlBNL1FrTmFGOHorQmh4ellNNEJaQUhsK1ZadDBIK1p4OEkx?=
 =?utf-8?B?SEo0M1hucWlQSVo1YXhBcWNTdzU1bXJaV1JsZm9zbEFPUnU1TjU4MG9UNGFN?=
 =?utf-8?B?R2tNUXh4anROOC84TDhSTlZVbUhjdExEb1NCVlViTksvMkJRdDBWaXlvOU82?=
 =?utf-8?B?V3V3QnlKaGVIZ2l4ZUlMOENyb3RHN0VwZlRxZjk5NXFTak9NaUR3Z2RZL2hu?=
 =?utf-8?B?c1gxSDdiYk1yM1dRY2ZIaHptYkQ5YnZrZkV0cituNCttaER2MXZQczN4VXBj?=
 =?utf-8?B?enprRUxjUnVVdGVNQUJhcFdaYmltWHVtMmdtR1dNNUgxRTc2UHRkMWQ0YnVW?=
 =?utf-8?B?TmdkN1dmWmpKNTVDQXBBZ1ZrMnlyd3JtV0k0dnJyRjVCTkZpdVZGbmtCSnRM?=
 =?utf-8?B?N3haY0lZZEJaYUIvRVRHdk5vTHdBYy9VbitsR0JiL2R2RGNVTWVWbU44QlM1?=
 =?utf-8?B?U2NhRjd6V1pGQnNGSElPdkFqaVZRS1FxYWI0WTM3Z3ZId25sMU4zQzJIM2lY?=
 =?utf-8?B?cDkrcWxaemwwVDBVcUpxNDZORkRkZVN4a2daM0NNT1lUSERRdUhqeW9qTUtp?=
 =?utf-8?Q?FcKlU7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjZGNk4vdDQ4SkI4TWZnT2VDWWY2NmR0b2U4Z0xSSFdKbE0reE9nNldkV0Zn?=
 =?utf-8?B?TlhKTm94SFhlQnpCNGUrYWlkNGRGTnhvUUtmU0ZONnlmZWlYNUNqQW9IZ3cw?=
 =?utf-8?B?WXZrbGJMd0pLN2UxS29aZ3VXaUNsWDBTOHJjMkl6ajA5V1Voc1h0V3dXeTN6?=
 =?utf-8?B?V3BCOThONzhFelByT1JIVmFsaUlqQWtaN096U1hRdXg3ZE5SMUVDWU5aclRY?=
 =?utf-8?B?MFEvNFFsM05SbHUzY0dwOTRkWTBMc3F2WUllb092TU5zYkNET3pWL1A4S3px?=
 =?utf-8?B?Y0RZTWFUdFhSNGpydS9LVlV1ODdkTXhaK2w5VysxY0ZYQ3p6bG54OHp6YUEw?=
 =?utf-8?B?TW9SbmRHMldnU0dSWWZqQXA2a1FFVHpqNG1yNjNRRnRHYjcyR0hrSTdYR2g1?=
 =?utf-8?B?U1VtUTk2bTk1c2N4K1BCeU9YRjIwU0pCSGdJVXRQMEViOXRIQmt6MURXVWpa?=
 =?utf-8?B?MUZiak1lNUQxSXVlOVJiWkhqSlFXVzBtdVdSSjg4dTRHK0NhWVR0cE1aNEJk?=
 =?utf-8?B?Y3g0YkhvZUNSNVgwS1lCQ0I0Vm1PcjFkdU44cXZHcm0xZFdvcHZsdTkxNEox?=
 =?utf-8?B?cGloRWl4amZ2cUJhS3M5b3dTRjNXU0Y5ZlZqVmFVVkpMSzBLS3gvNDlsNGM3?=
 =?utf-8?B?b0dKUWNLRjdzTXd5SGZ0M3VqTVlHK01SVW1OZVpiS3VuejlTbldiNWhHU050?=
 =?utf-8?B?cVFUZ2VkQnJNdUljZWJ1a2xkQjlOd0lROUpNcG9tR0tRMGJYR2VSS1QrdjUw?=
 =?utf-8?B?YWRWRUxzWFdBZFM5NVl0d2hEVzB3TGhyTS9PeTh1WXFmQVVTUXFUeVFzUzU5?=
 =?utf-8?B?MEJJcXhVSGpOekhVcVova2xHOG05c084bldyUmxTeS9xWUlCc1pMOU8zYWww?=
 =?utf-8?B?YVZYb3NLOWUwSGVpOWw4RnByOUQvaEtSMzMrNjJLbFMwLzl2M3dDRElQNkwv?=
 =?utf-8?B?RzI1SEEyRE92T0VPbDBsWWxnZjhBZmlnNFpKQW0vYTNtbElROXFnZzlYMTVj?=
 =?utf-8?B?bUJNUmtBaWp6VVBxS0l0RW8ycllyVVpQdVZzVjl3UE5FY21ESmRONlFOdGpG?=
 =?utf-8?B?QW1ZRmJjZ3BhVTl5M1NkbHo5dnoxU0l5bFNRa2lBd1dkTng3MmFmTFNxRVlV?=
 =?utf-8?B?dFJrMGJnNGg4SDRUUWhFZUZLTGFGeTJxekV2L1BLNVVZL0plbGtZckxEZVlF?=
 =?utf-8?B?Nkw2MDFtK3RuN2JUbzd6YTF3Y2xvRG5uM2FLNmdnaHJ1amJ6dXVDaVZlK1p0?=
 =?utf-8?B?bXFTeVFveCtFc05JNUh4REUzT1hkbHZXN2xMc1RqR0FpWlphVnBNby9wTjE3?=
 =?utf-8?B?Z2lscU5tMFhXSlhQakkxWlRXQVp4dlc0b1AwaytMeVVZN2tvRkZOVzZOcTJI?=
 =?utf-8?B?R1M0V3NQM0JmVXJqV004dWFyd3ZrblN2UFRLSXgrTzc2MVI0c3pOZ1Q1Wmpq?=
 =?utf-8?B?aHNaNmI2Y3RvR0tmU0J0VGJsT09HK2J4REFoc0xiVDRWOFV4VXJWQkJxazNK?=
 =?utf-8?B?UndSREhNRVoyK2NPbzBZc0t5SGRMVXlDUmpFaHExUmF1bWZpWFllUkVhMVhB?=
 =?utf-8?B?WXZqQmE4OXd3Q1BOT3pyMEZ4N1JudzkrdW9NYzd3TWErUXlLVnBteUlBREV6?=
 =?utf-8?B?SmpyM1FFZjdFS2FPMVE5S1FNeVVtcE00ZThYc0drTkpwNjVWVVFIekNDNC9S?=
 =?utf-8?B?NGcvc0dMYkJESTVjcHVyTDhVVVE2NmswWTRPT3RlU0hzY3RvREhEdVIweUdj?=
 =?utf-8?B?TUdEK0J5QzNzb0xudmd2RUF2V2hmNXNselN2emVwMGlxck9FMFAyU1ZON1VW?=
 =?utf-8?B?QTlUdHJXNzFTeHRFckE5ZUx3VHJzYThkOTdZZ1FMU3FQdWFMOStFa2lIWDVD?=
 =?utf-8?B?VHNjNGNSd2JRekthQzZXL3IvMzFhdWpzWGxXVksveEVTOFlIaWxhbGVpSEN0?=
 =?utf-8?B?bFdBOVN5TG9BYllqdkNGa3FRQTBXVi9oN3VPMXlDWU1hdWxkdlRRa2puUWtQ?=
 =?utf-8?B?ZEZoVDVXZ1ZjSjdPVlhHQTRLWmptOFFJcmUyT2JSNy9rMFF4bkxQTGt5NzF5?=
 =?utf-8?B?RS9DQWJySkFMeE5UdkxmODRMWGRoazlxYmRXSFRFZWpZSWhtdDUyOFFydzJQ?=
 =?utf-8?B?c3g4TkdKTlhNRDZwMng4dG1oM29TcS9hd25abHVadWJOSmxpbWhCYWFMNkc4?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34449d1-8d30-4052-5f72-08de30aee417
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 07:54:44.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8m/9iTgMX8ZFav413lvLGzmE5tuxSSgdVugN5/k3It3mXTL63g7xiq+4/GXtyYMWh9kusl2FtHjMJMhmbNbHxTXnTT6FFKW8KbEZ8Ih+cvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
X-Proofpoint-ORIG-GUID: j_aCwndy-ACMqGSrdLQQyi27gRkGHgpn
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692d49c7 cx=c_pps
 a=+LMkLzjU88PdHoliF3eHPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=is8BzlB-PNdUrDiXX4QA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: j_aCwndy-ACMqGSrdLQQyi27gRkGHgpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA2MyBTYWx0ZWRfX64MVJXS+JN63
 Km+bgANZM8bO5Z6E3ou2XkB8UMjgac14z4advFwV1YnSL4e0DeePERKhETKvHZ+DTqw1Oc9fPk8
 /aJ2CCWFLL6guuLjCpjdQyOda62fGZ0bjeUkDuSnSG+onxfsqZjmxNf3P5tQjBej3Md/fB88BUn
 86PqYbBU/0pKqOCYvoqhwvGS5vq60keX5V8sKSkrX+6MauWDN5hAHt4tmzQSu4LeviFK0QTrDb0
 MEWTT1Fn/RtuEYxyFo5kEoHibFp0PAjP3pFBvCEQvE0tdB8HVCW8AokWwDnyETTsUGHa1VR9M23
 vvNs4CorvEgUsHdw/7vRbQQZr31bl+JHCyKeR7wlYHNjSO1r6gs+TZGWBHayjZ5EcNXurgol11V
 LPm+FB+jFS4dJD/GFyvaxfMD10Sr8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_235506_340754_854B84E4 
X-CRM114-Status: GOOD (  25.38  )
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


On 11/28/25 5:32 PM, Huang, Ying wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi, Jianpeng,
>
> Jianpeng Chang <jianpeng.chang.cn@windriver.com> writes:
>
>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>> when the page is already dirty (PTE_DIRTY is set). While this optimization
>> prevents unnecessary dirty page marking in normal memory management paths,
>> it breaks kexec on some platforms like NXP LS1043.
>>
>> The issue occurs in the kexec code path:
>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>     writable copy of the linear mapping
>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>     are writable for the new kernel image copying
>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>> 4. When kexec tries to copy the new kernel image through the linear
>>     mapping, it fails on read-only pages, causing the system to hang
>>     after "Bye!"
>>
>> The same issue affects hibernation which uses the same trans_pgd code path.
>>
>> Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
>> kexec and hibernation, ensuring all pages in the temporary mapping are
>> writable regardless of their dirty state. This preserves the original
>> commit's optimization for normal memory management while fixing the
>> kexec/hibernation regression.
>>
>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> IMHO, this isn't the right "Fixes" tag.  The original _copy_pte() code
> should be the fixing target.

Hi Ying,

According to my understanding, the Fixes tag should point to the commit 
that directly

introduced the issue. While _copy_pte() was introduced with 
pte_mkwrite_novma() in

commit 6ecc21bb432d, at that time pte_mkwrite_novma() always cleared the 
PTE_RDONLY

bit unconditionally, and kexec worked correctly. Should we blame a 
change that was

working properly at the time, or am I missing something here?


Thanks,

Jianpeng

>
>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>> ---
>>   arch/arm64/mm/trans_pgd.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>> index 18543b603c77..ad4e5e4fcc91 100644
>> --- a/arch/arm64/mm/trans_pgd.c
>> +++ b/arch/arm64/mm/trans_pgd.c
>> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                 * Resume will overwrite areas that may be marked
>>                 * read only (code, rodata). Clear the RDONLY bit from
>>                 * the temporary mappings we use during restore.
>> +              *
>> +              * For kexec/hibernation, we need writable access regardless
>> +              * of the page's dirty state, so force clear PTE_RDONLY.
>>                 */
>> -             __set_pte(dst_ptep, pte_mkwrite_novma(pte));
>> +             pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>> +             pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>> +             __set_pte(dst_ptep, pte);
> Why not
>
>          __set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte));
I agree that using pte_mkdirty() is indeed better, makes the 
modification clearer and avoids the helper function. I will change it.
>
> ?
>
>>        } else if (!pte_none(pte)) {
>>                /*
>>                 * debug_pagealloc will removed the PTE_VALID bit if
>> @@ -57,7 +62,10 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                 */
>>                BUG_ON(!pfn_valid(pte_pfn(pte)));
>>
>> -             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>> +             pte = pte_mkvalid(pte);
>> +             pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>> +             pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>> +             __set_pte(dst_ptep, pte);
>>        }
>>   }
> ---
> Best Regards,
> Huang, Ying

