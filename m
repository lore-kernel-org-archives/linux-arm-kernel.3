Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3616BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIzFsdcYyN8fh9Dr6f1zWbDdAxpOUMKtzzcmuXkp7Yk=; b=V09N43awpkjgPVm5jpPulrTixj
	wb+f945sWnyMug2gkEnF8V0MqaM2xxTA3/gV6ouakXd9OLcoACdAofvXtArTnXSuGZnRbwXh4pO2i
	ZxqJlDmM/gdnm4e18PxeSmmu0fDRXyor3/j9rrwnW/H2r5EES0Wk7OtijCRrGQGWjlwl6+87JeuxI
	y+o1w0ael3A4oBIsJ6Armv523nFYCPZ+DKFvnxbDRUz9sREQoXS7tiszbB974JBpRJuhTgTaKiP04
	Cm7ebQivlJwNWyUtb7QahJqJwZ2WhMYh401DSJNa58BSA0AZzqffa/uNfNH0MEIsJ9bXFrgCevJ47
	dnyhBIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWtOh-00000002Kix-3zjf;
	Sun, 12 Jan 2025 08:32:39 +0000
Received: from mail-am6eur05on20606.outbound.protection.outlook.com ([2a01:111:f403:2612::606] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWtNP-00000002Kc0-47x8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 08:31:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OokQhtAs6fnapX6UaxF3NsncJO0dr8VSwQvEmPUlKDSzHKL/jo7qkTriVDVM2WqnHLHJoEDExWPdKSOOIR7M/b8dmIuYMuUexdZENxgEhVJMB839FWUnMqXdjfQuUeUq2uexTLPw+BiA5ksyLFbkF7wXCcPq4+OyuOqgIg/jZbpcepqlasN7wjT73uAXSjzB3ebtq5uRSPGnTXAX5+eWaEWTaoh1fColwy/CZqOE8zbhUkL0UwJxewgIN33wxHmwBidYCog6ExvXt/9GeUHbUbpsy5wCohESjwfqVighTiozQ0/ziazdGrWha6UH3c3L9X7ODyaju4D6pTgzbSb+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIzFsdcYyN8fh9Dr6f1zWbDdAxpOUMKtzzcmuXkp7Yk=;
 b=s3kxBa4jdWpAtgmL1fa8T2tGrA1jFUANlkhOm7Ab4PHNjW9kxcW7fRBUhDwdtaw2SfyZSJl7g1kA8A/lhjtIra7XP0AWSqxXbTKcXfvJI6bXRZ3RyFF3kJCu+YVSFg+8lX51tmwfah1ebvSRGuavtV2BGELiiyuX2WmeJko15Mobeq8TT2yZSAITqrP439H9OFfhlUmhrHeXrSqzdjuq+JS1nUvwbAK9B0GtGI7zTp/ZJwHKLxhIit/p1WryY9RjIAbdZHRaHPgO07AbvF+JvvFb/js8XFRWOFKrfAYGkJqWGaTVILdDiGPcAQu3bAOg9TPtL7Y00MWjqWm4np60iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIzFsdcYyN8fh9Dr6f1zWbDdAxpOUMKtzzcmuXkp7Yk=;
 b=lFpti3qm7D3EXRxC51GgwyRE7vEs4tVF2h8djthvr/NIbI41gGdgFD4JfksJoNnS1hKKycRn3DJAuyzEih79AmUxC3dsQBkWNZ6rMPzBjsJvTiNQjfN4G3gge5z2hC35frL25M2sT9AR3ScAZu30MbKlk4gAsRqizWiotrUpXZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PR3PR08MB5867.eurprd08.prod.outlook.com
 (2603:10a6:102:87::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 08:31:10 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8335.014; Sun, 12 Jan 2025
 08:31:09 +0000
Date: Sun, 12 Jan 2025 08:31:07 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: 1534428646@qq.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: kprobe: fix an error in single stepping support
Message-ID: <Z4N9y8XpblDoI5Jp@e129823.arm.com>
References: <tencent_4B60C577479F735A75E6459B9AEAB3F54A05@qq.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_4B60C577479F735A75E6459B9AEAB3F54A05@qq.com>
X-ClientProxiedBy: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|PR3PR08MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 5976776d-d4ad-4b78-8f66-08dd32e37713
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JQ8b0K2loAyVB1NwgK1d/tCIJwO8l7rfpuFH5DkPUyk5way4n2xs8Kpjn1q7?=
 =?us-ascii?Q?UQj+sMc30AmjuqmtN1fIwY4606X2QhB3rf3zDZSj71ZEd2Vf44Gh1ZZRsEcG?=
 =?us-ascii?Q?aBRHJazVt8MWqvXKWZFpjyUMC7Ig///RrcYY4Ueo/eS6EwPAy4znWOI0EBpE?=
 =?us-ascii?Q?X/Dg+4qWtMkO5iNMsw4ImAcIveLSP3/DPE4cH6q84+yPdqCjSP+JUWDjClP0?=
 =?us-ascii?Q?6H/XZ6vcrCQIJ4WxdqPwc/n1ZA0t+tD8Af2wKSbNtO/OrlG3XasvRavJZEqN?=
 =?us-ascii?Q?NjXNgjG4k+MALT0WiJta/BvQKEFOSEdCQftGBddu0Y+25EDJqEnw65iEcbUL?=
 =?us-ascii?Q?Yz5FUpe0vwmXm3xZazLJjTFvKeaZwTDRGHcK0+o8Us41L3kIei2mUt1pZ2FN?=
 =?us-ascii?Q?4xrMnPFy0wBkJMCKYin6hhq3V1Pghc8mhb6HrvRU/SZMNRYC2AnGyZTsRtdy?=
 =?us-ascii?Q?iXyHM58C/80QaqM2JR4MaRJYCqtCaxM7sEObRFC2XvkWUrPTlbw8iEA6Qu7Y?=
 =?us-ascii?Q?3ZENd+0MdXzviZzaxpxCTrQbvT3fMJEPEjOAFp9LusQ64BrrwCT9cAGZuAX5?=
 =?us-ascii?Q?zZ+TdnBegYB+y+C5jiRwdAHKYwwAkqp+IEgIOdSUhwBSMINhh7JsUXomJJ1X?=
 =?us-ascii?Q?R9mY1DsbN8QldWaRdH13L+NZjWsooAKCA1Gu7dQ/oU0tuTyBlnMGvCrvvIQz?=
 =?us-ascii?Q?JqpODK6/6QufGZCcaBmOrx6wXT5iN2ohFR1MrgADxMVSHD9IG0lSEJ+xQx8c?=
 =?us-ascii?Q?uTUSZJK2O32YA9SgQfMwrt+i4j5FG9Vc3gzfBdjyUMJ0AM4TyOLHJ/4UtyNC?=
 =?us-ascii?Q?alVZB66GwfsHYpgMpHNT6lrFZf84w1U8J9RAOSKix+0D/Ox2K6vc7IO9EnvF?=
 =?us-ascii?Q?n/cVskRjoJTnCxNofomxiWVQQbfYdD3wYEhf8BllgGg8eOTmKhl2oW8Mod85?=
 =?us-ascii?Q?lCodJFQHU2vulX5k6klftxEy2txkgc8b0OqFocB2C866OSdpfh6ukqzx3TxP?=
 =?us-ascii?Q?ZWszvEdOjqNV1V2yEgMY8vObG262r73IKokV9+PcmQJlNICtE6pBafSSbfPN?=
 =?us-ascii?Q?wEj5HkOt/gPhfD2W6x+dDqno0Ffk5SlM77DenEeKbmzIuukzaf1OnB9DSzWK?=
 =?us-ascii?Q?HDvTQvVQLSpA4oX19fHUfCG+oNMsryQUyNre3sH9KdADuuhy3EMoqqD4hlD1?=
 =?us-ascii?Q?c/2aYi0AgY7OfVl/F3mGBWr3t+bAABq2Fy/jIf4Kw2EGrzg2f+/GgdnTjkm1?=
 =?us-ascii?Q?HTJZBirLoF69d+Qc531iUhEXt+WvutHNd5CDFlmBc8Antk/+1n3QQ0iSAliP?=
 =?us-ascii?Q?uC8h4RwQ1jN6ZvhfNDqWCq+ROKY7ee4tH2Azg4pCE91+s/5SwXarj3Z4yAKX?=
 =?us-ascii?Q?YaPe73kdgQDmUAVQdgk0yI1HsC3L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z02IJkQfPr62SJphtxSX9zPJt0+NGGWKjbAD3FARBldeLTc0AuCt6XcOOa9E?=
 =?us-ascii?Q?QUAuAiFTLeIVf3VeMKp3u93ZnXSpIE1rDTQRdCf/qD08YGs9J3fidKF6VHoc?=
 =?us-ascii?Q?N9RZAqo27VWYmD7RJKgwuxYqLYGBGLLOUIGJKSUoOPK2r2P4VPfa8l96ZOcE?=
 =?us-ascii?Q?Ov9k8w1+W+DLz4G8su1vA4PReBV2LXdOvGJ/VEofKFFhVyKD06wXq+H0HI6d?=
 =?us-ascii?Q?m6A5uo/d+SMhRQla3YujWzo7WJCEW6M7jjXbHqtUdqkvzEJPS+RWBws9O6SV?=
 =?us-ascii?Q?7xHQVWFiF6u0ECyeAnnVxo/o1l9XSgx3R9Dz2y7oaxxrd9Pvte+HiTpaccCZ?=
 =?us-ascii?Q?GNmU130fnlkQYQY894S6QapznaSfFpgj0TnwgdOjVKhOsyfRIzmZOEwBozXy?=
 =?us-ascii?Q?qz2bNuDa3+daPgkSIZaYBRRdWXX/uWiZDOwiXqXTYm7r6euuWDsPaX4Wy+R9?=
 =?us-ascii?Q?GgBl29DoTGT7ghCxBVugwYPOX0duPFQFtsJ1j9TNgKBrhlBXgrAWeBY4pve4?=
 =?us-ascii?Q?FJtm+I2JNzznEhAV9CnPJWRU68CvfKIkpbtqmA6BjXQubGFiP072yw4KPnXx?=
 =?us-ascii?Q?frLmfZFf3MBnA47px68ssjRpSfrU8ygZpSRIhRpPZnCLIdrjTPEc/1lxMnF6?=
 =?us-ascii?Q?H2ksk8ttaxHU6t9HDTsdXO0FK2jB3TyZglC5F4J40CogQS/Gt66UkZthmeGw?=
 =?us-ascii?Q?+/IR8eyH+G/UvTyLZ5XItBbXCN2Uiuc+iAGDXAK17U6PW3WptA4ZQ1s+cf2J?=
 =?us-ascii?Q?vMLeulaegnerpM5ffoK5vcFcsO3MDuRdn6wGgmmsAS5+axNe9ZwowdL7YWpE?=
 =?us-ascii?Q?uIGqtDus7klKG6PrhL7b5+7tV7bBqm1Cgj0uV3hJZ4Fixcv/OQTTpkcjPw2H?=
 =?us-ascii?Q?PZwFh9ulqXEU606rC3a9NihVy/pPCMOVbF/7ihxTbOMwb5451ZI2q0wxCnDV?=
 =?us-ascii?Q?I4YpDC4saxND98Z+LH5ThGkao1DxGgamjd7ODSzYd9sIWr5jor05wRifOMg5?=
 =?us-ascii?Q?C/R+gs1EwvgC3YMZRIENWWwxB1Um8KN1c5NcxijH+x1RNeYg+0U4gjqYElIh?=
 =?us-ascii?Q?xbCfU3M+k+7/JFF3V/XTpc7kj9SS4YeFaLGsltBFC7+3U3JMturEKXcm/e7A?=
 =?us-ascii?Q?wQ2RUK+Y+clR9GION1j/83Yltd2nR1XSVR/c5LM69cgaY32IR1Eu5Ai5hMil?=
 =?us-ascii?Q?2isvjxQudrQ/7nNqDN+J+P194qufwngm7qyLYSdKK/JMHBmlkXOPiatcZ42/?=
 =?us-ascii?Q?fWcUYAirvYoD2RioUBwZ5uYMWHypaT6cPipqJtHXa+o358ngxf03eaZ7ef2k?=
 =?us-ascii?Q?vjL9QWRqf/vVXwbF1Q0uvdCa4kKdch3YwBIoj0a1DCBTFY8LqzBx7nWDLHCp?=
 =?us-ascii?Q?SW7CjxlR1mRG/XE2/d09g5x1NMbpyqnLuCBXC6IX2GFv5fkvHDjmhB6owG8W?=
 =?us-ascii?Q?FqwKRWqPUn7ptT8nEgwSosTymArkN5TBH+louhjUf/L8aCNvXP0Qg2eSlEj4?=
 =?us-ascii?Q?tAkmU7c10egMI+LeJMKPPzoT0KmVbWzApahFe4yqFtuDyANH/OGjpUpHs53w?=
 =?us-ascii?Q?Us63VKywMbK1WSmPwE28grfxcJs42ksOlovkt7nu?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5976776d-d4ad-4b78-8f66-08dd32e37713
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 08:31:09.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wk6oqXsERHhbnax1Q63QDqLFJwQhs3jy8Bwnc7GSlyIpHCdQQHgpNEpf2UC9R1nllEHMeVAVH0D2zeNWv1h3aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_003120_146703_170980E2 
X-CRM114-Status: GOOD (  16.10  )
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

Hi Yiren,

> From: "Yiren.Xie" <1534428646@qq.com>
>
> It is obvious a conflict between the code and the comment.
> And verified that with this modification it can read the DAIF status.
>
> Signed-off-by: Yiren.Xie <1534428646@qq.com>
> ---
>  arch/arm64/kernel/probes/decode-insn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
> index 6438bf62e753..22383eb1c22c 100644
> --- a/arch/arm64/kernel/probes/decode-insn.c
> +++ b/arch/arm64/kernel/probes/decode-insn.c
> @@ -40,7 +40,7 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
>  		 */
>  		if (aarch64_insn_is_mrs(insn))
>  			return aarch64_insn_extract_system_reg(insn)
> -			     != AARCH64_INSN_SPCLREG_DAIF;
> +			     == AARCH64_INSN_SPCLREG_DAIF;
>
>  		/*
>  		 * The HINT instruction is steppable only if it is in whitelist

Nit:
When single-stepped, the DAIF bits are set, in setup_singlesteup(),
Reading a DAIF via mrs instruction isn't correct value as comments
describe.

What is conflict?

Thanks.

