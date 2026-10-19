Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B183CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3Wz+YB5dfxnzJ3YmxnQmlqV+U/oXF2Di0EHxgux31U=; b=E9K9EIqzDeZz1IL2Gaa39LuTF5
	+HAKpgYXdi418QKhg3b1m9JTrkpxoiKb6hbGRDzF9o6UVJbK+5UsaxdwAeE7yxprjktG0N9o/YNDi
	plFyQPUneHqFkVuTH7y4ZYmz6JZAnRwcMQKD3XsMDwijbDbo//KvpeLTp6hRW20sl8Ot3bDjle91q
	3QTIS5rg78taHjffvkg//BC1bK8gxYa0B481P1kwZ3tnqldfpiPjavbNvLvuBXzI5hdSnPNDoe5em
	CvCvXtQrmwN7pNc+D5dOeDYJfQlZ/1l62Ax7WdR8PKHpMmxwDijrqO/klzFN4f/7M6tOFlct7VONM
	oaWix65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjaU-00000006z1H-2CEO;
	Mon, 19 Oct 2026 09:23:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjaR-00000006z0X-2nm2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:23:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB0351477;
	Mon, 19 Oct 2026 02:23:12 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BF463F7D8;
	Mon, 19 Oct 2026 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792401796; bh=9PebdIH/SVuVj9MRbPB/1J1o0shLFs/Jpdx34TKGXEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C+Y1yTcoKKTeRGxeqTyg1bb//zBo/34B94yQoPCY8Z3TFTWlPLYAqR+kfzFP/WUTg
	 wcMt2ARDZEf2af+mvA9gjVQuj5IIGdx+Cvs/7LSXLhe70k4TcVAJprfzM2ozRDBJKM
	 AD6JEGRA9yLKmyScnBGv/fMHzUKKr7+ir8KeI1Cc=
Message-ID: <494fd8b9-b7cc-43ef-af0a-218c6afe0fed@arm.com>
Date: Mon, 19 Oct 2026 10:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: tlb: Add tlbi workaround for FUJITSU-MONAKA
 Erratum E#030001
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
 <20261016-monaka-fix-for-upstream-v2-2-fc7ede7f9f48@fujitsu.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016-monaka-fix-for-upstream-v2-2-fc7ede7f9f48@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_022319_929957_CF1D1D3B 
X-CRM114-Status: UNSURE (   7.41  )
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
> +#ifdef CONFIG_FUJITSU_ERRATUM_030001
> +	{
> +		.desc = "FUJITSU-MONAKA Erratum E#030001",
> +		.capability = ARM64_WORKAROUND_FUJITSU_030001,
> +		ERRATA_MIDR_RANGE_LIST(((const struct midr_range[]) {
> +					MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),
> +					{}
> +				})),
I reckon that can be simplified to

+	ERRATA_MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),

Cheers
Vladimir



