Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12116C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzb6tRJHrDVJQGqbEkCo5jb01Nj4kloA91RfnwZIyDU=; b=LA4E/A5tmAelljXiNjXpnnacSr
	IvbkTI+7bbie6GwYNFfdJX8yk3Hr92cjfSBmUPBQNryWX9XDWcSK913c8Xo4mHmXO40Un/m8YUUMm
	XNZZ9/CA026mln+8CbkAv5JwB1peqYm+NDoDnj2JIorEn/P0s/sEw9tKvmrNzyngo6qfLQrOn3sYI
	/02I7GEMbkXV3pYboJF6qhPKUx7MwX8unfVXTypD4x4Bkn4Ol/xQtW1hKzOPYVBhas3gPu7ceYzA4
	y9venrafvx7mLm4qxIkOTaLz4tgo3fItZXjPKR83v8siQtTrBMiNAxm0Rq8IpsBNXzBnNkQAH7mRh
	s6BGEHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRNy-0000000GLEc-2aOJ;
	Mon, 24 Aug 2026 09:54:34 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRNs-0000000GLC8-20l5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUqZm6o5P8rS3uTMmNniau+wK1AHWnd9Rj0cIKqR/ghKC9N8WNGEZw8AICsBC4HPd3k0cJHyC+azpMTaZRqYzL7fZFBtVUrUCSQ4+IWCn9yrqQtr/MhAEwYngPaEUebeO++6HEyuN+bxhag5MrWnPEuBiiz9vBySz3lVosR8daXvuaXwLYRWD0Egplp89akNRixjKvhQQlfyPZdt/vkUHruM0PtMeJUK/Ez5fHDISzuWq9LR/w5mVONlCQdHAnBpKiTxEHNnMY68htDuSnfcGsFulgdQnn9m0adu9KJeGZ4cJ85bnuAi33LD1TBqsuWmxzKG0ynlShc55dz/WpRJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzb6tRJHrDVJQGqbEkCo5jb01Nj4kloA91RfnwZIyDU=;
 b=RQADQwIOinmpw5FmgJPf4Tpxdk8P6Uo1GaUhXOgm1dmZHUqsdUkejZiipTBg6bGUwXTiQq9A6g17/3WuDkeIRPdW3QRsmjRcSt1lvMy+nGNcSFVzR1tcfowtYu6CTnn+EbTGF18NKblbLGEaBtQlyTdL//uf7b+1yipT2NSsBCAC6C1gxxTZ6yqblkjSOo5Bjg9ZHWmSC3IG5bZhtTQ1qSh2qCWB+9vO2W/kFLUkGDXlWnkVayKUhcE+7MvROVAO/ptnyqpnl4Tnwnuz+p6MDGBrW0ktv0eNDL4aaN4O1wLHHLkVHWuWyxz+o/CVS7WiWGbN0eGgc7oWAdrpe2PHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzb6tRJHrDVJQGqbEkCo5jb01Nj4kloA91RfnwZIyDU=;
 b=IVdiyYjYhXda3lbzW81gBJvtlapT4hIRdxG/5g2HbwGVIMBpew52LANp5xJUQz5amb4fQfcolP0IqXKMCCY0x3sZNtyWQu57IdIZsw8AwPg+yqtGEHZDLPYKMZmcxnSoEK41x7lTbuNpwdBTMGDn6BULFCzxr3RcWBgOxyHjUJa2IfCxOj4hpdPyKqkIiM03PIzKhQHpmoOJfJXJja41FifLa49Dka2gZiRhMkrLlkkf7jopONVCzw+zUyM91d85USNpxnAr1a9fjv4QDyHV4t5Ec+K/wH5uDqYlxdt+JE2XXc76oK4iuSaoxESZOD2Gz/MTB8m/YIFrPQASDkMAlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by DS7PR12MB8275.namprd12.prod.outlook.com
 (2603:10b6:8:ec::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:54:23 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Mon, 24 Aug 2026
 09:54:23 +0000
From: KobaK <kobak@nvidia.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Rupak Roy <rupakr@nvidia.com>,
	Mohammed Karamathulla <mohammedk@nvidia.com>
Subject: Re: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation sysfs interface
Date: Mon, 24 Aug 2026 17:54:05 +0800
Message-ID: <20260824095405.3-3-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aoXEBXXvTDBimnHi@gmail.com>
References: <20260817022335.3-1-kobak@nvidia.com> <20260817022335.3-2-kobak@nvidia.com> <aoXAdSY_EyPlOOnK@gmail.com> <aoXEBXXvTDBimnHi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: b828092d-f06f-4e3a-f164-08df01c5acd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xaNPL85BCvYArdTfosugma9minjTzoB0iNWK+haPhiJ5KXWya3C0knRILsebmbs3lVZqsOkctb0eJAdK+XD7iWFkK6rKJSL7GBMnt3Yue4fLBRt79FsS//8XwHkauGlRGJXV0jLmcn1LGoUJqGA2hfwyQQGM87m63BN9EwySG7GZ6w938BrTX8y9GhY5taDeJZzxXxClCRlzUBrcCUVkwykz2iAoenZ/PbAL+Q8a4q4ruLPk8kuWr13Ib1D0W+1g+294Y/R+2XsX6hBmHRrS8y5CbCXp6m8S92l/hnrJxd1Ksz1JDGWKpoxxCRV8GLnqtYtiIODQkdJSQC0tEzi2GdtjNKhN/+3pcLj8rvpfjrt/JZrfNGNCxqsGyWMuserK9RviPWl5xuXHlYLJ3q8J8z2HOvaRcwIldInUR7FWFySJE0NrYFgmn5iSwd6GJvJ+QLLasuTgBfjwMH9PiZ6XR5cLAVPljHdVzHLS/PVXQRvlMmJfnkx/GXUpFz+ZkUUaDqU7KQENRbv7n5OnAy8Htx8SByDvAqelZ4m/QUR509sjruApEIecDXauqsnDvapLdTRUmYq3bUSC1gZOqN+XnaTZqK2iE61O8ZUIbcgHQQB1mypiq/oxg+5qBMzuDiYoTJXWCjl4RlULBmRodXXf7S/UF4nR79P4PugHvCTqUM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y09rK09mamJyKzMwRlo2cmhHRHpvdTE5MEp0NnFpSFBnSVdGMEJDOG1rUDBo?=
 =?utf-8?B?ckpCZXpPR2V6UkNRcndqMDdaUTgvSjBVQkFJMUo1Q05scW1nVFFFbVAyUEl1?=
 =?utf-8?B?VmFiWVBublk4MW9HL2xjcitXakpPdHJtc2YvWGMwNEE1VFMweEZRQmlTdHJ4?=
 =?utf-8?B?QzY2OFdlYWU2SkowTUZWVEp6OEczckFoYUQ0TGtkaEVjWEF6ejl4cDZacU5l?=
 =?utf-8?B?ZnVJQVhOd085ZlhBNDdpRzZvd282NHUyYUFaY0VVZW5WZXRIM0NOZEZVSngr?=
 =?utf-8?B?QzgzeDY3L1B0R2xvcXZORGQ2dWJvdkloMHNWSkNFTHBsQTBEdmhCeEhZVkw4?=
 =?utf-8?B?V09GSmZTZEU1SkNaNE1QSXdGTnBVOTlwNXNzNTY5WTJ0c0hIWUhwU3NLQkkw?=
 =?utf-8?B?YlNxZVliWjl5cFBmdGFCcDNEanBCQnpHTU1lVDNSZU9BV3lBdEJnSXFHbStR?=
 =?utf-8?B?M3FRVjkwbVBvRFpYVmlDd2g2MTFtcjJkZmJPMDU3UVNpYkZCQWdaME1zVC9N?=
 =?utf-8?B?WHV1K3BqbE9vRk9oRzVVcFZuT0w3bFBWU0k4amExQkhnK1dtNWNIKy9qN0xq?=
 =?utf-8?B?Wi9pVkhPVzhjS1Z3VFBKY3JaelRtNWdSdDZBY1ArR1Z2YmcxcTRMQnN6T2Rz?=
 =?utf-8?B?ZGxzTFgwMk5HQjZWMzY2c2x6YXM2SWpVNkQ3a0dwczZiZVMyQ0xXeE5USDcz?=
 =?utf-8?B?b3l0WFl4Rzd0dVY2aENkSUl6bmNXSzdvQ2Y3NlB1S29veTl5c2lIN2ZvU1cv?=
 =?utf-8?B?Vm5aVHlyOTF2dWlvK01sVzJnd0xGTTYxdEpjTmtScG1DbEV6L3BkRjlYZTVC?=
 =?utf-8?B?dzNHVGxST09rc1NFNDJ6UWxoaGc2U2NpYUVuVkt3YTRJQ3Z1WWdTY1pmQTRC?=
 =?utf-8?B?eDBrN3NoV2piaUpzUjZTcUlpbHZSRktDYlc2dzlJZkt5ZXVUMGc3eFlMbXNL?=
 =?utf-8?B?SXNMVGlDSEJnaWJVQzBJRHI3SzJ2M3R2RElFSW8vL2hPQytkcFlOa2NCM002?=
 =?utf-8?B?a0N4VWVlenJkeW9CVEZkY1BXMGQrb1dXREMwSC85ZWgzZlZaZHdQSENWWDE5?=
 =?utf-8?B?YkQzM3VWNFN5NWo3ckxPb2lDbVdtbVhZOHAxTHFxanlydjBKYWpjLzRFU0hp?=
 =?utf-8?B?RXBHb1RPdTdGOHZlc0RZNzlBZE5TMGFWVE1yTEswc3pBSEdnYm5tTW1RbEtO?=
 =?utf-8?B?MUs2U2VXVFR3MjFOU0JjT08wZyt2VVRITis2dEVCZnNLcTFTQlo1a2dyVFpa?=
 =?utf-8?B?cEZhbTBGR0g4cmhjc3hPTlhOYWt3RXRXc2hKMGk3ajg2c0hFM3h6SFdnR1hl?=
 =?utf-8?B?TVMvcC96OHJaYTBkM1FodlVnSGlTVzFHN2xEM1Jvd0JneUt1Tk5Nc3o0eEth?=
 =?utf-8?B?Vk42eU9ncU1mdGxyZkdoY2tzZnp2Y0xDTlF4RDEzTnFBdlpsQlhWaWtkT0M0?=
 =?utf-8?B?b1VGVEd0R3ptOTVaKzdXQVRXMHBOTmlzeXJxd2FBY1ZOOEtOZVZQSzNjMUxS?=
 =?utf-8?B?Q2FTL2N5eENUNWpUdGhIcllHYU4yN2Z4TUt2SHB3WHlZZ25ld2tEaS9ZU3N5?=
 =?utf-8?B?eFdHNStQUU92angxZkJMQnJkZGx6NHZuRzVYUnlPQ0hVcGtySDNyQ2JTei9u?=
 =?utf-8?B?MW0vcnhNYk13Y0wwcGcwSmxKMThScXlFRXNZa2tpZC84U1pya01vNi9OMDdH?=
 =?utf-8?B?c25uSWUyaTNFdjFqZTdYbzJHK0tCTGZHbVBNQ0xBbUo0YW9qNTFmNWpvZmFM?=
 =?utf-8?B?Y1hBcUFDUCtBL1IrOU9iUTUwR3JUTmViYkhjb1hldDRzdHNHckIwK0hGb2pL?=
 =?utf-8?B?VGdKYjc1TFVTZkdPWFhEVytFN1YvOXI0QVl5d2xEdFU1M1RMblV3UG54eVFm?=
 =?utf-8?B?Uld6NWhqMFN1OVI5QXJQSlRnNkVsWW1TczZEQkRDZmVVWEI0azhRa0VIU3d4?=
 =?utf-8?B?UnIxU2Q3b0NCbDcvcHprUklCWTN6ZnIxbi9CbHpQUXlFWFN4Y1BFUm9nR29O?=
 =?utf-8?B?ME9pdWRIU0FuVU1Nc3Nxc1RWVmNQM3V4em5JWTM4ZEp4Z1U5MzBocWxOVWNG?=
 =?utf-8?B?VlRVOXlJaVVOMnlJRDFZTDZQam1QL1hWeE1RaCtwQ2lxN0pQUmFIaHpraW92?=
 =?utf-8?B?S0U1SC9aUDFiRElRM3ljQ2ZRekl0L3U1Yk96VG5PNm5aSFpIMFRybXpIeCty?=
 =?utf-8?B?aUtKdXhSZVI2K1RVRXpkNkhXUloxQ2p2Q1ZZcnNVa2l5QldSZWU5YjhlSU9k?=
 =?utf-8?B?SnRQN01teitWY1YxS3NVWjl0TWtlYlYxa2NzQTVYZ2ZvcVIyZmhQczVScUpy?=
 =?utf-8?Q?44hYZNGKwcLQ8meGV0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b828092d-f06f-4e3a-f164-08df01c5acd6
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:54:23.0615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG7+CZOFFrYqvNAmmxEWsrdGllUlRf1eQM3SZBkvm48CCZMUKpXSpiHyAeyQiLhCbRLljk+XhdPohIKSOjMJug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_025428_549345_08FC57E9 
X-CRM114-Status: UNSURE (   8.71  )
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

Hi Breno,

Thanks for reviewing and testing this.

The current read result is consumed by cpumod_attr_show(), but you are right
that the persistent cached-value plumbing is unnecessary. For v2, I plan to
return the value through call.value, emit it directly, and remove the cached
fields and helpers that no longer have a consumer.

I also agree about the permissions issue. The register-backed reads perform a
synchronous IPI, so allowing unprivileged reads could generate a steady IPI
stream. I plan to change the six register-backed controls to 0600 and retain
affected_cpus as 0444 metadata.

I have recorded your Tested-by, but I will confirm that it still applies after
these changes before carrying it into v2. The resend is currently on hold
pending arm64 maintainer direction.

Thanks,
Koba

