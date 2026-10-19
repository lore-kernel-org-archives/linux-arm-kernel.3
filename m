Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA8DCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32kyFqp+UEKS2yyaJCWR/x/scr9xTcn+GT3SHmACxLY=; b=SkyU13AvxnJJ2jd4oMDH9Z/A2D
	zzW7GptT2MK7uzrkkyHsZ5QtFBdL/8AgaYvCi0YTExM9BXMf/niiWOvzNACVuf7lM5kvxax0GbUSK
	sl7x0LZXWLZ9dLlkuKacdWmLETMKkkcW7Ko07iM/YvdIbl9NUSNCzZrjqGGQgj89J1eOrK9w1NLVl
	sBWlKFGTYVnResO+D7ZtQoyVwdFZJVN7u/gPggAeTmZ1MnXd4Oz18XJKAZF82pV1pDKnxheb1jFZj
	RvNlVasK6qPcKzFivmWccn4URsscPG1A3QZ80l1MpxGGc6B6D60tsko1QF4jXsQVcFLu2aZnbICSP
	KqaVgmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjc5-00000006zOg-0g4u;
	Mon, 19 Oct 2026 09:25:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjbq-00000006zGt-3u5f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:24:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A76FB1477;
	Mon, 19 Oct 2026 02:24:42 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E63C3F7D8;
	Mon, 19 Oct 2026 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792401885; bh=ukRusOcMMasuUt/MwOWYxonH6KR48F/Wx4D6Fv9GpqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BNYAY1Jck3zw8ScybT4oeFNCrm8ZFnrIKBEZ5Yjn7b5T4cHBmLUh6Z4fE6I+Nx1kL
	 tbrcuafotMI669u48d7cHis7Qtrnhf7p1S0P5RFnB6FObocI8x3QSomHrNCyd/ai1Q
	 SBZf82AH2Hg8g+tQ/6yrtfx2l4wqhTnwCzJ9z2Aw=
Message-ID: <c8970dbe-2d37-49b3-b62d-f60d7cd6cec6@arm.com>
Date: Mon, 19 Oct 2026 10:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] perf: arm_pmu: Add workaround for FUJITSU-MONAKA
 Erratum E#030002
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
 <20261016-monaka-fix-for-upstream-v2-3-fc7ede7f9f48@fujitsu.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016-monaka-fix-for-upstream-v2-3-fc7ede7f9f48@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_022447_025717_D408ABE3 
X-CRM114-Status: UNSURE (   7.32  )
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

Hi,

On 10/16/26 11:00, Tomohiro Misono wrote:
> +#ifdef CONFIG_FUJITSU_ERRATUM_030002
> +	{
> +		.desc = "FUJITSU-MONAKA Erratum E#030002",
> +		.capability = ARM64_WORKAROUND_FUJITSU_030002,
> +		ERRATA_MIDR_RANGE_LIST(((const struct midr_range[]) {
> +					MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),
> +					{}
> +				})),
> +	},

Similarly to my other comment, that can be simplified to

+               ERRATA_MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),

Cheers
Vladimir

