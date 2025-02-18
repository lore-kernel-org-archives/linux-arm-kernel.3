Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D378AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxKAj0sLnEa1X4vYFQ6+lRJ/Ra6QHruKzPb2z06YWIc=; b=vFoHv9hvfsD+wtR3170ifA+Bn8
	Wzc1+yXk+nsFiSvZtTwg9dr/RVe51kwQgIJoqZ3dfPTznAGqcihyps+GR0tdE8PWp1yCPE26h7hqQ
	X8jYtbOEdG/EgmdGPlKuRX6s00fyTsT8I1Ts/yHobBAfsKWjZvb5RoQgfXT5zN1IVPJTW9Ng4SC8D
	7u6fLaaAHV4fdz34A93MqRwE9IVR+ipzODa6VvanmSNF9gu6sgb4/7kKHbJuhJTFMU1yGx/SVgRwe
	Vd4kwu3mG+oh9Jy7hYYg5jRkqpYQ/qGR1kGT9S1xeUhg0FerY+FssrskH5nfWv2zbtr09a81WLqr9
	/f+fyYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKzb-00000007nYb-2i5k;
	Tue, 18 Feb 2025 10:38:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKtJ-00000007lj7-2LeX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:31:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82F5C13D5;
	Tue, 18 Feb 2025 02:32:07 -0800 (PST)
Received: from [10.57.39.83] (unknown [10.57.39.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDB23F6A8;
	Tue, 18 Feb 2025 02:31:46 -0800 (PST)
Message-ID: <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
Date: Tue, 18 Feb 2025 10:31:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
To: Yin Fengwei <fengwei_yin@linux.alibaba.com>, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jie.li.linux@linux.alibaba.com
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_023149_654360_33324B2E 
X-CRM114-Status: GOOD (  18.10  )
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

On 2025-02-18 1:21 am, Yin Fengwei wrote:
> Currently, arm-cmn PMU driver assumes ACPI claim resource
> for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
> failed because of resource claim failes when ioremap() is
> called:
> [   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
> [   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
> [   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
> [   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16
> 
> Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
> work in ACPI env.

No, the CMN-600 routine is a special case for CMN-600 having two nested 
memory resources of its own. CMN-700 and everything else only have one 
memory resource, so that is not appropriate. What else is claiming the 
region to cause a conflict?

Thanks,
Robin.

> Signed-off-by: Yin Fengwei <fengwei_yin@linux.alibaba.com>
> ---
> I am also wondering whether we could just drop the CMN600 part id
> check here if ACPI companion device claimed the resource?
> 
>   drivers/perf/arm-cmn.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index ef959e66db7c..8b5322a2aa6e 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2559,7 +2559,8 @@ static int arm_cmn_probe(struct platform_device *pdev)
>   	cmn->part = (unsigned long)device_get_match_data(cmn->dev);
>   	platform_set_drvdata(pdev, cmn);
>   
> -	if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
> +	if (((cmn->part == PART_CMN600) || (cmn->part == PART_CMN700)) &&
> +			has_acpi_companion(cmn->dev)) {
>   		rootnode = arm_cmn600_acpi_probe(pdev, cmn);
>   	} else {
>   		rootnode = 0;
> @@ -2649,7 +2650,7 @@ MODULE_DEVICE_TABLE(of, arm_cmn_of_match);
>   static const struct acpi_device_id arm_cmn_acpi_match[] = {
>   	{ "ARMHC600", PART_CMN600 },
>   	{ "ARMHC650" },
> -	{ "ARMHC700" },
> +	{ "ARMHC700", PART_CMN700 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);


