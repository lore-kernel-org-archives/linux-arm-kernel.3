Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A7CCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 19:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2j25ksHlzzgiJapOxjE0LWoxXkD8fo4E5hLsMP9g7Qg=; b=T0q8TQXN+Tgon/JBbXRwpcrMZ5
	JQZN4itgA8/s6G5zY76+XWP4OqHyB+p2qdgYfeZQNCnJL1hGRDAPlOyvMMi8Qj9gsvXD6fI8zsqbB
	mEf3nxNfAenGzBqmmGWq0NI/0I/0MCX3ySKHK+Siqar5pW0RdI/TaSTt/+ULrrkRsEdOlhZtlmUvm
	vSQLbqP8dKSFTkretWy2M6tk2NyTp1Y82g2CVgo7hqR/Wh6DkbvGr2vmVTN8PEDk7Q1s6aCr/pUdt
	tkU41IDGrOFeRVoMo59nIK5k6TeXOP/H5e5U3f6Y8X0GwdKAIVvOJ6xjhBv0FKeJIj9IkX78/Sfsj
	a6Jv0orw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waes2-00000002ura-0NCj;
	Fri, 19 Jun 2026 19:27:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waes0-00000002urO-2b3R;
	Fri, 19 Jun 2026 19:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D434456B;
	Fri, 19 Jun 2026 19:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AC61F000E9;
	Fri, 19 Jun 2026 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781897234;
	bh=2j25ksHlzzgiJapOxjE0LWoxXkD8fo4E5hLsMP9g7Qg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZjZWeR2B4RDHzs11keZnbEX5GPkDO4ewLXSWIxWl3TtZgmPrYzh/es7rKmPgwLYPc
	 G9/iS15aNLl8yRhv+nscp6GyPkttdugCDo+n+FCaVUJ+BeFCIYtF+Tz1RzU+56fFhI
	 OredVk3jQFGyG1m9pAcuqeECZVannJ2qU5Wst0Xngngfq0xCdq56Jxq14dM30kX2B8
	 gRsKlF7lAAdMILqwQRe9JkuVQEHYr2b2MohI3A2GtWVIyLDHkMeHlNd/PDKS9jbNu9
	 +B+qHCkz1stv2sm/Z5ih0nssJKxSD48jJaDNgnSdRxbHlFulBG38L//Ott12V41Y2X
	 B8d3rWSj0UApA==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, kees@kernel.org, nathan@kernel.org, linusw@kernel.org,
 ojeda@kernel.org, david.kaplan@amd.com, lukas.bulwahn@redhat.com,
 ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
 lpieralisi@kernel.org, thuth@redhat.com, oupton@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, broonie@kernel.org,
 kevin.brodsky@arm.com, james.clark@linaro.org, tabba@google.com,
 mrigendra.chaubey@gmail.com, arnd@arndb.de, anshuman.khandual@arm.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
In-Reply-To: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
 <20260619094130.GU49951@noisy.programming.kicks-ass.net>
Date: Fri, 19 Jun 2026 21:27:11 +0200
Message-ID: <875x3ecovk.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Jun 19 2026 at 11:41, Peter Zijlstra wrote:
> On Thu, Jun 18, 2026 at 05:17:03PM +0200, Thomas Gleixner wrote:
>
>> Something simple like the uncompiled below should just work, no?
>> 
>> ---
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>>  	bool
>>  	select HOTPLUG_SPLIT_STARTUP
>>  
>> +config HOTPLUG_PARALLEL_SMT
>> +	bool
>> +	select HOTPLUG_PARALLEL
>
> 	depends on ARCH_SUPPORTS_SCHED_SMT ?

Probably. Did not think about that as this has to be anyway selected by
the architecture.

