Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C510F6FD7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIveiotkeGlE192c9KG+dumBiPtlgN2ju7yaOPdld0M=; b=g53TL1aTA6aJeexEftUXh9+Jio
	VJAGswbYirSefg+flXxCPhE6VgWdgi6RE1BT/MvPc85LvjF7l7ewlWhzJxcODYATfKs1QeuvOfwpD
	WAuJXoPQ/YWFPPWFXnj8KFR/h4UqNehqIcIVGveaboKg17CPsJhDx/MtBoDSKvFIM7JAAyEUbij3s
	6SI3I1eqkFHOeIYskQF0QfKUEFtjoCPyOmeS1/XtHGHyQeYQU7qeiViTvU2YhlKCbgySfdy7biG4j
	lbw3bHZwAt6kK8uFThJJYH5ZoqRVMuRG93Hq2UJzG0jN330UK0hxGSb2xSHEvr7Gvclgf0BM92Tx+
	prhdOPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xHl-0000000FbsZ-30ID;
	Wed, 01 Apr 2026 15:15:13 +0000
Received: from mail-ukwestazon11021122.outbound.protection.outlook.com ([52.101.100.122] helo=CWXP265CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xHk-0000000FbrQ-0O0E;
	Wed, 01 Apr 2026 15:15:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL86eoyHSdG3dJwxvbvs+i0QOHpFmU0EgAsBjQ35GUrSAuDrdds1+L5WBJms7ImyPuZbFXp33a+We9pTSudwAkBv2Zx7vW/JgT7tzLZ5UzLurpCYgOYDtwZUQYhv17A4SRqdkRWZJptieiRnTyG2Tl1SfpWnlecEPGdkgBjYy/DDYdygGQKBkdxnZxXacGYn3yp6ZE9oLp0thGs1XGS8Rc9EavY8qdHrobtc35ABhUr/fzacqDo+ExXPiqXR/vLhpkoahnG7JNcWlG9RN8zIl6bZcD37R15SS7ReYR2u8xyYpFNDVBkWUEUhwaPsiWrTQS3/AhhblauyFHHDsabLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIveiotkeGlE192c9KG+dumBiPtlgN2ju7yaOPdld0M=;
 b=ZMGkUlXrQSz7GPEHTqFapKwyaZ5E+eUbm/QFOyuLvZqiwCtC3/f2FC5tg/iwgzt3M+WY+cHK2mQ0u3hUqyGAEVSwc+7FX75TTtXE04LO02Q2HF9x+OpKVLS2+04Hu9b8AB9+mHSyIiXtr1lzVpj9kUbmsZtT78cRxscrK2tihULTYRp1jRl4Bl0jhjxHB9aodc2m+cD8L2gUy4YpTXZfkB+lNclWV+X+l3O099siFNEcCmFA5fd/77rYRfExGGqgAjLXcDqrDA9p5INIV45xH01I1QCvp8n/5mkLn7Emkwlhd0G0tsmqqdeLXpSkjos5Oj/5y99n9BNlliPRH/WX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIveiotkeGlE192c9KG+dumBiPtlgN2ju7yaOPdld0M=;
 b=jYXDi7P7W0SYPlxUPzvKi4vktHuqnu1f9Nkr4YFU5PmuPHwMeHJHAPjL1qV4P+l0OVPkFXvWcHbi9ok93ntuiQaq8mXuB8Rt+3PnIcIvNXX2RKTbq1bLI724Ib+YFHcJqFdiBYVQxe1Tb2nhHYQ/3i1naEV8W38CL5cnzUTFxB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5651.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:158::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 15:15:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:15:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:15:06 +0100
Message-Id: <DHHX0LG9K10F.3NNW0OGTARLLK@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 28/33] docs: rust: quick-start: remove GDB/Binutils
 mention
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-29-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-29-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0323.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b00ac4-bdfc-4313-0636-08de90017539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: OYr5ZvfguCLkWwH7cRnSLnKVQ02OwxukuobmX820gGDbWFv1hdkRoFF1TbqYHusSuMcsA3sAJdG8EhXwinS01u0UGaCSg9XsJxVCu1f57XJnfL7wHzIyZDIHmHJJtDTbUEEa4jOQDvM7aXWJ2MjGIGoYRojcZdTgthR9pYgDhfnS42549v79xDSdUM1Cfm1QHAD9vM7eQ7ZvpfiUYlRXM1oyOA/dDhrcMMfimrhkPT6yT+0CVwoRTyqroUIQJB2anBpaXO3vFQCwMZnEHQLdZqjbLnnQ4uYGPlRT/oldrotTw1aLyU0xJOd7skePyQ8WLGrygmzgK9ViueXYU6bsDkFmHex8ldpMW4iJCsnrNRyZfuZWX9FQBSbLygZ0nu9R4uYhKaC+7mJrloDqadmpyxsz0O0xfjiV4OkOc36Gg48R+14sgVysYTyX+ZCQP84BS43GGgYjI2tFAz7pguTNQxmFKZkA5x8RoHOLqrMmc1eNcOZhCmR1WTDsCsitkjeZgBmx/WPnAQ5iwVEQiygQPSKbU1Ca9RUDhjd1wIS5lGv0Uf+bRI7niedrbGGNSZ80C7Vr3oTyRlDpFgkRjwXVZ+5fzhDA+1xICEawJTtLjaEVix7UtDPlQ9o27ovf24NRbP40sv8Orlxl3/bC66Mo2hj3YItnqPNwnNFCY0jLyt73G3BfiOvHAanLWfc913u6wpy+xwB+g9F2GA6+fzBxc+VXCeSWUp5bVIqZ5tO8Gc7lezzMohreoB9HHisGE13jzKu+4AQgxAWrfqB7qhSbhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVN1WWhsZFl6ak5QRzU2RExaQnpqQ2ZVTkxrU3k3Uy85dnk2cy93c2tidTlk?=
 =?utf-8?B?NmE1cFovcU9MMGlwVk9vV0hEUURabWxSeWxHanFpWGZLMEZ1NlB3UmVUOG1q?=
 =?utf-8?B?ckZLNjZJT21UNWhzR3NRalE1YnNFeDNCUGNTdlFWNEw4YUNRTEJzd0NyYWdy?=
 =?utf-8?B?QU96bjkyYmZra3ErSG12M3JIMmFNbnlzYmJRVlBQSk9qd0pWWjVVVy9zci9w?=
 =?utf-8?B?djdsS0dwemNnbHNTTnFNWFV5VGl0YUdWYzFrZGtPNURyNWxGRjBzbnRvUExz?=
 =?utf-8?B?dVBMR0dYOXdXTm5Gbi9OMWNrSWtEdlpHaTRienUyWHNpT3kveTBrcEltRzl4?=
 =?utf-8?B?azRJTWR1aDlaSGdUQ245QTB2Z0hrRmVTMWR6N0lRTndRQTl6RmdncWlNQU5Q?=
 =?utf-8?B?dmRpbVJqTzVpdjVOZkYzWEUycEpUQzNhdGJzUjcyREw2T0JEVTNiMzdjam5s?=
 =?utf-8?B?YlF3U0dXNVpHTmttSDA0ZkJ0Q2VTbTF4b0MzU29zWlhUY0g2a0s3aWcxSjYz?=
 =?utf-8?B?b1Z6b2lHWUdYME5KVzZUWEt6cjZySE1pUjNxWTF3SFBDeEpLMG1UTXdQK2V3?=
 =?utf-8?B?NHdaNmR1bHAvSGhxcUpWZVJzY3E5NzR6ZE5YZXo3N0pTRktTZ3FZSFBQQlZD?=
 =?utf-8?B?OU80M2E2TVlCOEdmS1JrMmFidHRVQ290Qm94aHJCRm42em9UYmwzQnQ5SUMw?=
 =?utf-8?B?bGFvRG9rYjJxRFk1Zll5cEMyeTY4NjZjNDlwRHlUU056UHUwQlQ1OFZMbGlD?=
 =?utf-8?B?bmNIMWdGdGswaHFzeGxIejY2RmtobHRXUUg3K3RONDFEcDZFZ1BEdnpLc1F6?=
 =?utf-8?B?Zi92bTZ2cm5CRkdIZXF3MXdZMTZmQTVIVjUyUGhsTEh2d08waWtaUWRsQlBZ?=
 =?utf-8?B?SDBGaUYzSU9FUkFQdEgyNW1ma0NMd0ZLZUU2Q1F6UU1YNmU0ZGRFQWRqbDhz?=
 =?utf-8?B?RmlUMGJrVytaR1dGWEtoOHVNYjVNRnU3aEl1Z0RYQlk5OUFxYk1odWc0WE1n?=
 =?utf-8?B?Yzg1VG5NT1BYU0RZaTFUL0Ruakd4OVFlZS9aYW1aaFE5YVpOdmdlSnJoVUVF?=
 =?utf-8?B?V3RZZ0dUYlNpN3NCelRTL0ltNnN2M1pxT2hTOElUS2ptUkVJbVZ2aElXMWRX?=
 =?utf-8?B?SXZUUkVWVlZJbGtGdjQyWW5HanUxakxYWnNUZXc3dVBXTlM4ZFFDT1BnY1lG?=
 =?utf-8?B?SGNxTjRrUjVoZDVZT0psKy9DL1BZOGF1N05aN21nVTl4ZzV2eUZzNzdibXA3?=
 =?utf-8?B?eFZMTFMrVHhtaDNObXdMSUpuKzZKL0FvRVFjZTQ1dFN3MjhFM1JJQ3lLM0Nw?=
 =?utf-8?B?SGg3MWQ3Z3BqNDRmaDBYV0ZPeXlnOEZYZFZ2dmtrUjlBVlQ1OWM1dmRMZkkw?=
 =?utf-8?B?d3dzR0NiUXNHRHp4TUlhRU5rc1ZiUHB1aTR6TkhSZDVUUWtLTUpVbmlKY1JM?=
 =?utf-8?B?VGlKa2hzYjlVUzZxbmxxZ1p1SGNzRVBsZHNCWE54T05pMHZ4NXdUWnZEYXda?=
 =?utf-8?B?WmZCTXNPR0cxNER4a3NLN2lzSElxS2dMUkczdDBTL3hTajh2TWpob1YrTEdv?=
 =?utf-8?B?dmxEL3lwRkhOcnhPak9GdUkrTlRDTHRCeVBsVm1WaGhMWHBkbUIwdWNSU3B6?=
 =?utf-8?B?U0Z2NUh5NXFFMS9XRmEyOUJZZmpVOUllSTVFakdydWhSeTNheFdySjZnRnJQ?=
 =?utf-8?B?RjJPbE9OOHVmbGNWTE5tNHlSajgyWG11cFdZd2lpUmsxYlVNa3JOenlzSXEx?=
 =?utf-8?B?Ny9zKzFLdFZKZWxUVUhzc0dwSllQdlZhWjN4WFJpWVhVa3JGVDdJb1ZjS0Nj?=
 =?utf-8?B?MmY1VUZnejdiYURSUEs3enhPNkRZZmFWQ21pZkpITkpCY0k5K0hBMTJDUE0z?=
 =?utf-8?B?MW1OODNmVnAvb0pLVFBUT1IvS0IvRzQ5aG45aDNJQjB0RERPTDBZMU1xZ1J5?=
 =?utf-8?B?ak9yUWJoWTVNTE96cmNtUFk5Um9wN3lUQmtoK3gweWdNZTZkY0MvczlJNlVi?=
 =?utf-8?B?QVdaM0FTVkNCajRnUmY5TFRWYmZ5OEdwdGgvQXlXOTI4OUlaZGdEcXV5WHE4?=
 =?utf-8?B?OVZrUVpMblRjVklmbWRCbzMzMFNDTEh4ZVlxZlRpem9YWm00aU04S0Vsc0tn?=
 =?utf-8?B?RFJwQlNVMVU3c0d4RUVWYmpzd1NTcnBhZ2cvSGhxQUZuQnlTNVZDM3FzSEt3?=
 =?utf-8?B?cmN4ZWl2dkNNaHREQkMrb1B3c1M5ekNabjVUTUxEZDV1c3BQTG1YVlFuM3o5?=
 =?utf-8?B?RUp3WEFrZDJXaklrUkdpL3hjVkR2NXJRQzU4OVU0YTVVdUlUNk5VQmdMbUdN?=
 =?utf-8?B?L2N2S0RLR29yWFBNOUZKeWhQOElXcU00aWJpWmdVaU56bVRVSWh2dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b00ac4-bdfc-4313-0636-08de90017539
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:15:06.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lHflWd9u7AoLIoFJ49pndNMlb5mo4KUN7L4Yv+bYf3FuKZ7e2r+1U5oqTt9AQtzsC76N53PD3YPfie7Ht+YmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_081512_160457_0730DB82 
X-CRM114-Status: GOOD (  18.39  )
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

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> The versions provided nowadays by even a distribution like Debian Stable
> (and Debian Old Stable) are newer than those mentioned [1].
>
> Thus remove the workaround.
>
> Note that the minimum binutils version in the kernel is still 2.30, so
> one could argue part of the note is still relevant, but it is unlikely
> a kernel developer using such an old binutils is enabling Rust on a
> modern kernel, especially when using distribution toolchains, e.g. the
> Rust minimum version is not satisfied by Debian Old Stable.

I suppose people could have been using an old LTS distro + rustup and run i=
nto
this issue. Albeit it's probably quite unlikely.

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> So we are at the point where keeping the docs short and relevant for
> essentially everyone is probably the better trade-off.
>
> Link: https://packages.debian.org/search?suite=3Dall&searchon=3Dnames&key=
words=3Dbinutils [1]
> Link: https://lore.kernel.org/all/CANiq72mCpc9=3D2TN_zC4NeDMpFQtPXAFvyiP+=
gRApg2vzspPWmw@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/rust/quick-start.rst | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quic=
k-start.rst
> index 5bbe059a8fa3..a6ec3fa94d33 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -352,12 +352,3 @@ Hacking
>  To dive deeper, take a look at the source code of the samples
>  at ``samples/rust/``, the Rust support code under ``rust/`` and
>  the ``Rust hacking`` menu under ``Kernel hacking``.
> -
> -If GDB/Binutils is used and Rust symbols are not getting demangled, the =
reason
> -is the toolchain does not support Rust's new v0 mangling scheme yet.
> -There are a few ways out:
> -
> -- Install a newer release (GDB >=3D 10.2, Binutils >=3D 2.36).
> -
> -- Some versions of GDB (e.g. vanilla GDB 10.1) are able to use
> -  the pre-demangled names embedded in the debug info (``CONFIG_DEBUG_INF=
O``).


