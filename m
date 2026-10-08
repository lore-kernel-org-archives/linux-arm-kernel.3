Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93EECA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6/W734l20vSRm7iGS5nauwlAEkH0I0vAYkP+aZ0uIg=; b=0hAeelAwHxKs3CWLB3M4SQKSlZ
	0gIPK3kQo9zMVu6W3V3JZ0k9UUTMg5aMdMH8d067SbRRSKBpT+LhkdDyX3qxkRHli1jrfHfrPuHEI
	R1EX0GVBQYbcWl3tI67QyI5tz4JKCMcQMqaW8Xf1EPA7ZNIw4YaHP3At0P6yPTF0LN68K4gQjdvjG
	tRtcyE+tzJI35J7FekXW0g8AsdjGf0jL/s1e4A53n/5YcmIH5A6lAwcM/NMDwHh5YI0hZgnD9yGSD
	qlJoDnR+P2RE9SECB2VLqkQ20bZfOMvD2nPyG424x8QRhG32TY7t2clD5pEkcUZM3WvhIUcN+PVVY
	ih09GbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEk7d-00000003y72-0K6X;
	Thu, 08 Oct 2026 09:09:05 +0000
Received: from mail-uksouthazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c205::5] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEk7a-00000003y6d-3RgH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prsQtAixPqDQRwzRAr9K5g2u3VbiI7AmZs3XCXcZf8q1Gsrffdj+GQw82b7dQpWkzSPqrFVJ+L/qvsJl5dM9/i3r/64zw5JAk4Pzikg1i84WcQxdvD99ZLvcec8A7BjnL5Hx07vYWyjzmRig6iu6ctyyyy8ELSD+d8kYCpGb+65St67PirVeGNgLiaWYCK30Du/Z+C88R7CNOE37XhzdEq5nmVZsTVIWV8KJwTYvRWoXrlbq7o6hpCq3dG8CuiMuW++sy2bQR62CKKs6d8B3HLkvVomyFnlGajaNyGh/Z8yKU5TYhBUmWFAKZ2TdSlDlVeqGotjNWvCu0ZTLO1RUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6/W734l20vSRm7iGS5nauwlAEkH0I0vAYkP+aZ0uIg=;
 b=GJwLHEmiKHLQ3BvykT0NXtBKbVhgHyJWQZW7TS6tpfc2hBcB4blL7uneUJk1WdgVfoU+NlrhgToH2shFCvUs0Ru6zTcdb+/OGbsKT5M2kqCgLRm+8jkkIkVjm/Oh5bMmYAN+boAgMS7th2qA9Rcpv1A4tztgv4MmG/j00f+GSh43cmcXhg+/6ssdsA1ig5b08o3MV7DaeA7bjfq8PyYxIKkIEm89P12nwCBnvWjjuEZ+zt/ZAbd4dceUdmOnFhnr1eaIuqfl9PzmmYqH0FtFInNdeGeBb0gDo/C9fxKeHusw0JEQzeBJWlg3Vt+JtiHyRKRcBqi+iojcuZhnbSyMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6/W734l20vSRm7iGS5nauwlAEkH0I0vAYkP+aZ0uIg=;
 b=If/oS1UHdTys3jo5HTFRqEszJKrIdaaeOfOAn8UjzwEa4lGXklOYpIkHG+Q4L+UciCuqz0h/NEoCYIQhma0LcvJ3RnMneMg+tW2+VBHnpS5dUR342EJSLzYZBNCSCsZdVUDG101aVvDWn5j3+hFMHQ1Q+2EGe27I3TQ++pBg+mE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6089.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:293::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:08:56 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:08:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 11:08:52 +0200
Message-Id: <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Arnd Bergmann" <arnd@arndb.de>, "Linus Walleij"
 <linusw@kernel.org>, "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Bradley Morgan" <brads@mainlining.org>, "Paul E . McKenney"
 <paulmck@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
From: "Gary Guo" <gary@garyguo.net>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-6-kmehltretter@gmail.com>
In-Reply-To: <20261008053746.49631-6-kmehltretter@gmail.com>
X-ClientProxiedBy: BE1P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: eaeb9e78-3b02-47c4-94a0-08df251bc7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|3023799007|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: isCRE0MZbKpsU7LaFZLzkqBBk3PFGA7ZB/HeOfHW0tJyWNRnZ6AnJYslcDYRyFXd++jD/EjUG6Aby9GZ149qQ19S2AmshWNWP1qVkcGKa/Ulkv9d+Zs7ECU+dOy0WdV8GaotrNTFwdyjsWOh1C7AiFv021Bvv6jg+FktD4ausezTvkKx6hz4r33UIYrbK3dae5BPvg3iOziN2SA6nBNGzcIgjiAuthTsV+PcHe0lK+vooodUg/sQc+xex4aR3ki/s6OPLKdm4Jny8VWlakZFHRLs2qwP7ZZSa63cnysJxP4G+Qa5GI8hoBfCl4YutyqxBf1xjUZnWZYUOErgmMq6ooa+jK5397F+iaU99PUHiq295544ZFFLKU61WHIMQ2MvvYKfHeiUvSJY/eM1CzuOL1kwFrdwnWqZq0J0kjsP0nR6CN7aCDXCj3G8JZ6vKSY3TuJ2Oj/2VpvTxTThhaqnyDuSDwju2L5xOu2hJYZPECldt5qQ7HQAn5mDHjuM3vWUHeBea4XZUGOCJ+150ZOmcC7F/VS3Sj5anDNZHyGgnqar1kEimi1lu/5PRZVx5/VkcBepd8SDSZdiLTdQT8eAHIXQbCz87CBN10LZWu6REizcEnxWsVjlnrXpmRO0KBnQ3Zbk2dWiPgJNj4YOJ2IUS/xAQy5z8pqkTHcOaBewLkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFR5NzhqaWN2QXJzNmJoYW5yeEFaSkIyWGxsdnlhQStiY3FCbHlJclQxTjRX?=
 =?utf-8?B?Yy9aSlZnRHQ1QjgxVnprQTNrUm9ZdDZnTEgrV2xRakZxK1NnaytpM25sUVhm?=
 =?utf-8?B?OVhhZWhrOGNoQUJxamYrdjdOR2RnVks3WGJ6M3NGbzJ3eDZacDl1cThmRlV1?=
 =?utf-8?B?UVZUY1VFSUdKZEhpVUo3ZmdZZVNYZTZLVGZudHJPSjdEM05nNTFFUzZVWlpW?=
 =?utf-8?B?MFkySjNYeTI4NDl5ekhTcEpiR3JNMW9rSWhsVTJ5VXFDVVpTZUx1eW5adVJl?=
 =?utf-8?B?VmNXRFVqVlgrSUNTbjhDZGRGcUFjYjVpMU00T3psSkpHV2UrMW1KeW14VllT?=
 =?utf-8?B?ZUFoa3RNTklTYkkvTlZEK1c5amJFREV0NE81RnNzMndkck8wNktVZWgwL0Fn?=
 =?utf-8?B?MHUwdWJ1NTdwTVREQXJoL0Mrb09XV0VQRTBiRWJkYzJBNHp4emFIc0Zlei93?=
 =?utf-8?B?c3ZJb2tYRzRCOHZqVENoZGV5UzBpdlhLV2VEKzJ1WDdMNUVsQzd3T0dtcU12?=
 =?utf-8?B?VnA3MjFzc0g0aEE1MU1lQlkrcVNkYkxSaTJyMmZTaVZrODdKUmJFZzMvaUZp?=
 =?utf-8?B?SzkwcXZwQTVBalR3a2Q0aEptazFPOXFOUTdCMEYxT2k0bVpXd2ptOW93THB2?=
 =?utf-8?B?VGQwMGJSelM2K3QvRG9lTjBjSmFMTG1yNEpQUUpUZDZXL2NLZG5KUmlFY0s1?=
 =?utf-8?B?c0c5dytzdEdiWFFhYW9NL0RBQmVqQ2Z4dkg5V09zTmtmU3EzZ0xwUEV6Vmgr?=
 =?utf-8?B?RTlCckJBbElBcTN0M1IvRDdKemYxQTczNGZES3AycFBtUEhMZGpEMElvaEk0?=
 =?utf-8?B?SHRNdjBQYUpGVGNBc2lHdGlRTWtlbzVCRDc2aUZacXUrTXJXMW9VTmk0QXha?=
 =?utf-8?B?eHo5OUFNbGplSmV2aTJYOC9jRDN2V1BIVDgyYmFkanFTWmxUTmRzdVZSUDRl?=
 =?utf-8?B?S254ZGQzUjlVOE1aanh4cENLVTdqZTB6MzF3MS9Qckx5MlNOSlNsK0hyckNX?=
 =?utf-8?B?QnhkOXEycll4TjBlL1BaalhNakVtNGROSVVLeDhQUng5K0duQ3Jqa1VGZ1N5?=
 =?utf-8?B?RFRRNWlMYjVOSWprMFY1U3RzQTdFUFEwQ0J6Q2YwZ2l2QWlVbEZtQ3BaVmJu?=
 =?utf-8?B?K3JSWjZPaHIvV2Fpai9LbElRcHVtODEwYWFqVmt4MExVOUdJWFBoMHRKVmNS?=
 =?utf-8?B?cEJwNlNYZ000bzU0RC81OFYwVkV0eno3ck5VMGlWcDcxV0N0V0dxdzl6T2Rl?=
 =?utf-8?B?YUg0dzZaeDVSWXE4eHdpcjVWOGFLOGVzVmFrWFF0NVAxajJsTEtwL2VZYm8w?=
 =?utf-8?B?SUZxS1dFL2oyTHVvNjNpZUlFVnJZRGlnNUZaR1RGNmFmY28vM2tMSUpyMUxN?=
 =?utf-8?B?MUJXdGVvZkFnNHcrZUdlOHdxME4vbyttNWo4SlFxVFd6Y1ZzOEdaaFVjekVX?=
 =?utf-8?B?bURzT0lSNnpWU3Z3K2xmejJYVXNEOGFhQmRhYUNONGo4R0RNN2xyL1F1TU1Z?=
 =?utf-8?B?K0YxallONFBNRk1KQkduMFNxZE1PaTg1N0ZzUGFPbmRjUXhFVzgvQU1lZnVH?=
 =?utf-8?B?NXc2SXBqcnlXL3FsckZ6eE1BUEdiblRrN1dBQlNJeVhmTWZ3MWtNRDlWUkJn?=
 =?utf-8?B?VW1uUUl1a0pwL0pneGtDVmE5aG1BVGg4bUF5ellBVW5QV05MWkxpWlFpU0hM?=
 =?utf-8?B?OVFaZGRaK1ppWEdXRnF3YjlZRnpDUnlaNmFnTlhuUU52YjJnVGtKdHpKbDhs?=
 =?utf-8?B?UmtCQkVjSnY1aGdLQkpzQmN2a1RPSGMrdzlKTGVDRVliVTcvaWZhcHNRdEdX?=
 =?utf-8?B?YlAycndxdUJCQ2k4aFJHWmgvYjUycXlUc0RwaWorSGZVUTNzdnRiL1Zjb3Rw?=
 =?utf-8?B?blQrVVdnbDdDTk5oc3QweDZTVUlEdlV3VDE1L2NNUWViNm42RGd1ejAwOWxo?=
 =?utf-8?B?RGU1VnBwZmpncUMvdVNqM3M2ZXkwTEFubVpUelRITkF3MmN1bkwvYmdoeVBE?=
 =?utf-8?B?Q2R1MDF1VEpIb0pyZUIvbldtVWthQ29WTjgvQkU4YXc0Qkxwb2tFVWNmYzlM?=
 =?utf-8?B?Rk9RWmJDK2t5WWkrTEcyS2NSbGV0cDFvRFpJTmRySUcyaGZTYzdabUdIeW9E?=
 =?utf-8?B?R2lzQSt4VVZGUGxNcmNuckNENHA2bDVKcEswV1h0Y0twZENDZ0tCejdhemdL?=
 =?utf-8?B?VXhxZWFlVHd6QjA1aFM3WGc3L2VSclFObUJSTjN6d01PSG1IWlBadEloSjVQ?=
 =?utf-8?B?RUxaSTdTM1pSbVpqd3d2dkVVOGlMMzBxczJjVi84UjJDdk9sdUE4Vmo3UWFa?=
 =?utf-8?B?aWw3YVEvajdVVklEYXlJdHV5MEd0NDI4WWtHZVVXek9lS2ZxUERFdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eaeb9e78-3b02-47c4-94a0-08df251bc7e5
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:08:55.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuX1oJNLI0BiR9qjmt6h8RlAYg3j55qm35vmW7gB3cwZ6z/Ek6Yw8ycNBu5ENCCWiWN4BD4fXzlygE9fM1T5NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_020902_868273_18E5A24D 
X-CRM114-Status: GOOD (  19.81  )
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

On Thu Oct 8, 2026 at 7:37 AM CEST, Karl Mehltretter wrote:
> The armv5te target emits clz and blx, which ARMv4T lacks. Kernels that
> contain an ARMv4T CPU are excluded from Rust for that reason.
>
> Nothing else in the Rust code depends on ARMv5. Use rustc's
> armv4t-unknown-linux-gnueabi target for these kernels. Like the C code,
> the Rust code of a combined ARMv4T and ARMv5 kernel is then built for
> ARMv4T.
>
> ARMv4 (StrongARM, FA526) stays excluded. It has no bx and rustc has no
> target for it.
>
> Tested in QEMU sx1 (OMAP310, ARM925T) with omap1_defconfig. The Rust
> samples, all Rust KUnit suites and the doctests pass with the current
> and with the minimum tool versions.
>
> at91_dt_defconfig combines ARMv4T and ARMv5 and is built for ARMv4T.
> That kernel passes the same tests on a Microchip SAM9X75 Curiosity
> board (ARM926EJ-S).
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/rust/arch-support.rst | 8 ++++----
>  arch/arm/Kconfig                    | 2 +-
>  arch/arm/Makefile                   | 1 +
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arc=
h-support.rst
> index d6d1bef44c8f..3f39cf55b6f4 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -12,15 +12,15 @@ which uses ``libclang``.
>  Below is a general summary of architectures that currently work. Level o=
f
>  support corresponds to ``S`` values in the ``MAINTAINERS`` file.
> =20
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Architecture   Level of support  Constraints
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endia=
n only.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Litt=
le Endian only.

Can we say "ARMv4T or above" or something similar?

Best,
Gary

>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
>  ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``s390``       Maintained        ``CONFIG_EXPOLINE`` must be disabled.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


