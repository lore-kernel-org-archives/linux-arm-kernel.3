Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8706CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 02:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=db6MBYMeaLLjQbyT/qmzmilITcXd+8Hta+wA6TquVnQ=; b=nunA4ynW2mFcofzZIU5XrOolUK
	ooNEN0CWRtXKGy0djeLozRCpcig042iKEL9gLtV9wI5cKQk979kICdSv28eiXthBt9QEHQVV66Bzi
	2X73QHQuOIPaKH0zdgf4pGXFCQePkML0nETdLoibHBXA8reMYwHUb8fI4aqWibQEr3/fAa3Y3Gltj
	fVrcagkQjWMrEgvixz97ZNuKbM4Yttl/00Pl8n1i+PU4nuJTSb2tekctZg4jBXZs5oOsSYDw8RZ3L
	z+XFG2s7MwqXgx1cP1otuAhlAIKmvuk02y1JCaXGURKXqACTTMQYEHfv2lDFy0p0kN/odrk6v04Bo
	/If2JVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrOR-0000000AHZ9-42MS;
	Fri, 12 Jun 2026 02:13:11 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrOO-0000000AHXx-1QDj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 02:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XR2yQnMxNhXyw//81mK9Cgs/eZ3cKVd1XUQ1oaHJkMJI7+nX2u/FnE5ww3O1Z3a7ttw4WBGu09lBnc7Z15MKfzF2iNuIEB0yxDf2O23eXUSKalbrioTYstMe+n8kERcVNgtbDXdosyXZsZjLMnzQTUiwg3taU8ivMvaDXXIqKZW1dxvT01Ne3wIA3FPoUDKPtGXLKJzTjTQoq+sCnTdAMlRYL8UZYjkAsBBR5wjg4X3Z/B/U/w1mwRCv5tsmxHszger0/dtNtaRAAhcV5FltGtjrsO1Vqj067/4FIWPdOHcQ36lIXYxE0MKMEfDwFR5SKadCkHYsmvGjkSSFeGAR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db6MBYMeaLLjQbyT/qmzmilITcXd+8Hta+wA6TquVnQ=;
 b=s7KLDd/G6cGnIiBhyHuxsoVlXaVZwqsz/cSKi5s9nXuD8uOiQyc+3AL4azLt5l/Sen/76IRy+3eYs4VQxMQQwrxLqfo3xW7ZUD0Ub98+iUAdIDKns+LUjI092xnq57c639FE+mXeq01/WNS2zUdM5qpZmnW5Xbyn7Xz7QwV5dQccKylS9W4kzAJPxlr7sbgXoZgVorrKJyhnBEUTN5g7lz6NzuoBvmVYn2k0Yj9xDR8l/24gQrJjBBVg6mVQ+oi5INBO4qCpa1EcpczyXo7sykyxahqXM4Ezv6KNyJgzj5D4MDTq5E6NmGIxereubJiR1eNh7o2vdWBAi/TK7qEfow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db6MBYMeaLLjQbyT/qmzmilITcXd+8Hta+wA6TquVnQ=;
 b=p6R3XxQpe1xCnqfIUi/OUGv4GD6dIy8rvKO3vqk+BPYLCLzqiNOBEUs9KlshHtGQa8K9Wd40bnl9Wu3T4IjdXr3OPujQkEV6Ouc8yVpKMF5IwoP8kjXmDOd01ltUoTAf2SBn/o/Y5QdaRr7u+vwEgP5qN+INCmBnJl+tsflVZT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by MN2PR18MB3480.namprd18.prod.outlook.com (2603:10b6:208:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 02:13:03 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 02:13:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From: gordon.ge@bst.ai
To: arnd@arndb.de
Cc: soc@lists.linux.dev,linux-arm-kernel@lists.infradead.org,yangzh0906@thundersoft.com
Subject: [PATCH] arm64: defconfig: enable BST SDHCI controller
Message-ID: <178123038058.455092.2553110009023696912@bst.ai>
Date: Fri, 12 Jun 2026 08:42:49 +0800
In-Reply-To: <178123037729.455092.8454252669856079676@bst.ai>
References: <178123037729.455092.8454252669856079676@bst.ai>
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|MN2PR18MB3480:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d69056a-1d89-4083-a336-08dec828223b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: dWnIAULyuaUMxAk1hTkPN9MSeGO/WXTtsmn6DqfPCEglldNZpyVe1HDTokFLOHRIPsJQJr/SgWx1ls4P6j52uDaTj9j0bIILcEpMzPHMRQ0DJQbne8IdSbOyTjaByuRz3DLuoZKSiuRGNUB7s5ZH62Pywvfv7dNQ5l9fJq5I9O+hAIp9e+ZwP/Rbj4qa2a8f/v3oc0zZn4sqYYjH5flb2gcF0wcGBY2sy7iy9k0mFxnofO2M7ZX/POfXB6Sr3TstuK3l62cxD3kIwnRZrt0nQGinyP+BAxxKm13br0Eqk5ggZDkz1AXQfqdfyctDOp0dPChW3N1pZZDElw5vVH1MyOBzKjDnRMnQt0HRXpqyuy7J4R+JFV3oE4LPPUvb/ExND1WEQx3RkqpNtboG9rHcB1CKufXzH1dUjYv4DGD7Bm7GgfOgK5iCozNJ5feHbDO8nnV2/PX4r5upEsQMAXXzk4hOUMArGmd+3xtbEYI8zt8qMAz0uG5Gc9RT1LXeqVsM8NFvBMCE8njtJmpW8Opn4uSCUg3nHp1shWnpWrPl/GdNXlfkTRupTpG0V5Fzv0y7mvB+JZLr1EHFxj21iCFbEfNrH3GhH5SdnYW/WjIoa0PYPkStEAiXSBrhCMHGHMRV6ag2XoiqDs1rSKmrCwRhUM04NIleEl+udDQZDQOIKGIquoozYzoJqMDFlwLXu9EF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTdzeC8reUdwL21mMjNSUmNsNGorM0FvNWFhQUc0U0RENWVtam9CdEpQaVlO?=
 =?utf-8?B?NjJpQVorYXhLV3dXZ1hVcHdlWk5JWjkzbDlWYUdsWFV4T3pJY3ZWUUVXalpM?=
 =?utf-8?B?T1I3MmNEOGVRU0huU3NTa3RVcUFuYXZMSUtxV2t5R0RlOUpOMHRlRjN0YXRq?=
 =?utf-8?B?cGtHa0krRWxzZXo2cEJMOXZvYWdhdTNBdVZCK2cveWZpSU5KOW1KSkJ6T3Ix?=
 =?utf-8?B?NExsK05XRnVUQXZuYzkyQmJWOFpJU2JobUJGU0dGczBQR2syd3Q2cFlibUli?=
 =?utf-8?B?VXpJckQ4UnRhaDRLTEFJUlRmTzFjMHBRdEx3dTJrTk5obmZDSkUySVN5cnVV?=
 =?utf-8?B?akUzcEVmRFJVV2VqRUttdGFUTlo4MW13MExpRXlURGdCb0c1RGdyYnEzZlBI?=
 =?utf-8?B?MGFWZWpBYjdjRkliYTRlZFZXVFI3K01sRFhraTA1Mml5L000dVNmL2VoVXAw?=
 =?utf-8?B?UHJ5bklHNHhxNWxLSHVDV1J4Y1dQTkhzTkhxdXY0L2t2YkM0ZUdIY3NCOS9s?=
 =?utf-8?B?K2p2S0MvNlpweTVBVjJHZWpoQ2tHQkVnNXBVVGlIYW9XMk1hRVFyVERHMW9p?=
 =?utf-8?B?cFZmcW1uR29MaVRKMS9xemhCZ0dTY1gvbThscVhrcWJ6Z1JiejBZR2RGYkpB?=
 =?utf-8?B?T0VuZ05oOER5NHBaWVVuc3NJVk9IRi8vWmYzV0VSOHkwbmNIelJtdHdONUZQ?=
 =?utf-8?B?TmZXaFpsaCtQbEdLYTVhbUlBbmt2QnQ5Yys1c05QSE1HQk5sRWp6azh5bmlW?=
 =?utf-8?B?bjJPL2drVFJhRzI1MktCSFI5eFBZN1dNMDBPOUNMclIrN0JJZmthY091Q2xV?=
 =?utf-8?B?QWZic1JqUTRtcW1XSXlrVG1CaHM5blZlckIwU0p2MWVibjVueE82WEpyaERz?=
 =?utf-8?B?V2JIMXJ2S3NFdGlnNGNHdEN4ZTFDWllLeXp0bE1wYlpWa1FpL2NmdFFtS3lT?=
 =?utf-8?B?bW1PMUw1Tms4aGNWT3Y2OEhPVnVNYXBmRXprZXdHZHIwZWNnM29ZbHBCQU9u?=
 =?utf-8?B?Q3FIM3dJMnZ3endMK2pZc0ozemtoZ2dlVXJFVC9KSGNHTlcrQkRXaVRHeDlx?=
 =?utf-8?B?cG9Lc3ZMd09xMUc1R0tVZTJQQ2xkdmRHczh0Y2g4UXRqUWl5OHErdEtGdm9p?=
 =?utf-8?B?Q2xFUGVaYUhiVHFEWGt1Y0M4SnEwbFhDa0NteVhwSC9WRW85ZXp5c3hqeG11?=
 =?utf-8?B?Y1dLdFY0SzEyKzZUNHZQUEcvdVNmQ0l0eCtWQVlva1ZsdjQ3YVVyR25jUVJx?=
 =?utf-8?B?U05GSmtuVlRqbURzSnFNcU9CNld4NzQ1dVovZGxrMWN3WnVDZlg3ZGJLNU0y?=
 =?utf-8?B?SEU1MCsvQTN3WXhUcUhhUXliTU1INVJESjEzcEJVZjV0T3dCQUUySE05alJ0?=
 =?utf-8?B?RmRLV1FHdVRwNVhqNmpOYUFxQlY4dHFPTWNlak5rZVJzanRaUlVsaHpKWWZF?=
 =?utf-8?B?QWFsZXc1TmQ1T2phYzI3bnBsaDZTMGdqTStMRlpGZzRVRHFvbHhVWkVScTlP?=
 =?utf-8?B?WUdWZE15L1hOTXpzRXN4ZFdvN1hLY0JsZ1o5S3VIbHl2Q09ndnJZYmI0NHgw?=
 =?utf-8?B?VUVhSTdzczlFSUw5WktJaEQzSXV2Znl5SW03ZVRzRmMwZEhjU1o4RmNRZlp1?=
 =?utf-8?B?OUwvK0lSYkNSYUVPaFlDcWFxVW1JVzBGcWZ3ZzVhYmhseGFMYnFNanhjOHhk?=
 =?utf-8?B?RWNoYlJMWWhUK0JSQjZGaFRRUHdSVG0vVHdXNUVzL3I4KzdlNnpob2tRd2Fh?=
 =?utf-8?B?OHVYNW1qWFJCN2JVK0NUa2JrQ1JyekFqVWNKU3FycHgvOUFjb1hUK0kwb0lC?=
 =?utf-8?B?V2FWdVUwTFQ4UjFVNVc4OVA0elZRWCtvbmdyNmpWNGFzTHV5ZFdMaHlIbGo0?=
 =?utf-8?B?WnRxOXd1S1R2TVNyZDVZNnFLMmFZOW5NVjV0bWJsTWRmVFJRMWhQSnRtbGJL?=
 =?utf-8?B?cTJSaGtFMHlLNlloMlBoaVNxTzBHcDJJRVRvTTlzR004cmFacnFXSFk4SUpU?=
 =?utf-8?B?c0F0YjNrMXJOQTdKL0toRlRjRVNydWFmQTh5NkNQTURXQUJjM2swUzNUWjA4?=
 =?utf-8?B?NENjanQ5Z2prVlVDeWRZRm5mOGVWSHhQNmU5Y0tKTmVNdnhJZW5hTXVTUnpq?=
 =?utf-8?B?b0NlQ1o1bFhPTTRNeFBQSkhnRlFBUE5TSzM1Nm95Ymd6dzh0MTJXOEtmZzlX?=
 =?utf-8?B?aHhzcG5lUlduVElXVHZKNjN2b3Jxd1ozWlAzYmpnWGZOZHp3NHZrcUhvUXZQ?=
 =?utf-8?B?U0hna01WMWtlbWtKRC9LUzAvcXNGeGRhb3FyU0cxNTB6WEVzdi9mWHc4RitT?=
 =?utf-8?Q?kq/e/05Rt0Hjmufh1z?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d69056a-1d89-4083-a336-08dec828223b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 02:13:03.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+Ooj7DFXCwNC8DXoIyUGJNp/Pa4rscOaAqkEVzxKO96dhecJNsfM1c+yP3TeRuQJHmGQ94OYs3I2Ubl5EOyDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_191308_391107_FC1C7964 
X-CRM114-Status: UNSURE (   7.12  )
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

RW5hYmxlIENPTkZJR19NTUNfU0RIQ0lfQlNUIHRvIHN1cHBvcnQgZU1NQyBvbiBCbGFjayBTZXNh
bWUKVGVjaG5vbG9naWVzIEMxMjAwIGJvYXJkcy4KClNpZ25lZC1vZmYtYnk6IEFsYmVydCBZYW5n
IDx5YW5nemgwOTA2QHRodW5kZXJzb2Z0LmNvbT4KQWNrZWQtYnk6IEdvcmRvbiBHZSA8Z29yZG9u
LmdlQGJzdC5haT4KU2lnbmVkLW9mZi1ieTogR29yZG9uIEdlIDxnb3Jkb24uZ2VAYnN0LmFpPgot
LS0KIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcg
Yi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnCmluZGV4IGQ5MDVhMDc3N2Y5My4uMzA0ZTEy
YzgwYWY5IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnCisrKyBiL2Fy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKQEAgLTEyOTIsNiArMTI5Miw3IEBAIENPTkZJR19N
TUNfU0RIQ0lfT0ZfU1BBUlg1PXkKIENPTkZJR19NTUNfU0RIQ0lfQ0FERU5DRT15CiBDT05GSUdf
TU1DX1NESENJX0VTREhDX0lNWD15CiBDT05GSUdfTU1DX1NESENJX1RFR1JBPXkKK0NPTkZJR19N
TUNfU0RIQ0lfQlNUPXkKIENPTkZJR19NTUNfU0RIQ0lfRl9TREgzMD15CiBDT05GSUdfTU1DX01F
U09OX0dYPXkKIENPTkZJR19NTUNfU0RIQ0lfTVNNPXkKLS0gCjIuNTAuMQo=

