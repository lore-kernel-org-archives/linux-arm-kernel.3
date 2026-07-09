Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA96C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ROxPXBQ91YEteN34Jnna2ozV1gz067cxXFbUj2fqoY=; b=k4PJlKEki4jI7zYpX4+IY1h2zS
	cT+yn42EJeZLz8RLfu1nfsI0r7xSilCfRP0EZ8S8ynTGpbPEXgmuJ0bvRaAzYVmxv2dXNezHsv4FV
	5WU/veIXaR/VuAd2xKGRUvMbjp2aV+AgIx0N47uij4oInJQgwtgp9NU6NQkVWZFnPAM2K0hn+5n50
	lh057ZOzXWydTecjp//9Fo0NMOdrbAZnPOOJJ4Bj37BXa5uQRKrV9MJrdUFQadlLlMz6GetShlf9v
	Yd4TWXvEaqNtW3sdUQSXQiekRNJkm8gZTqUyeCE+2RGMqA62nuNa9I1zqYWQUBDLZPb4m5rcHakNR
	ZiI/H1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqiR-00000002vUE-1M1c;
	Thu, 09 Jul 2026 15:31:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqiP-00000002vTo-0oui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:31:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EC481570;
	Thu,  9 Jul 2026 08:31:00 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFBC23F85F;
	Thu,  9 Jul 2026 08:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783611064; bh=LGskLhmxYfvHzHuCkKOj7Dy/A6cwneAsqkt5alVmAzI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=FCSV/iR7WdzNJ8q/yUAXRNzxwp9D4CwI1WTaNrC+TlkDFXavtgvXkcrnyIlB1e69f
	 pHkoqAoeEgd6f7iDa9lTzLCa3FXz5nKErmi8YY0ZAa+EYHvujBHZIpFNBjyyMiEN7Z
	 dD2iWqsc4bXfsNedkgJ0oF5ci98ZA2jFQh0yU0a0=
Message-ID: <2a1ed630-3f88-400e-85cc-596b4dd5f5a8@arm.com>
Date: Thu, 9 Jul 2026 16:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ACPI/APMT: Use stable device ID
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com, bwicaksono@nvidia.com,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>
References: <cover.1783605641.git.robin.murphy@arm.com>
 <c113eff51124250fc5798589ce905052046b43b3.1783605641.git.robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <c113eff51124250fc5798589ce905052046b43b3.1783605641.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_083105_299310_0F7B978E 
X-CRM114-Status: GOOD (  16.09  )
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

On 09/07/2026 3:39 pm, Robin Murphy wrote:
> The APMT node format includes a unique identifier, so we can use this as
> the platform device ID to give userspace stable and identifiable device
> names, rather than auto numbering dependent on how the table is parsed.
> 
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/acpi/arm64/apmt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
> index bb010f6164e5..ba48fcb26d52 100644
> --- a/drivers/acpi/arm64/apmt.c
> +++ b/drivers/acpi/arm64/apmt.c
> @@ -79,7 +79,7 @@ static int __init apmt_add_platform_device(struct acpi_apmt_node *node,
>   	int ret, count;
>   	struct resource res[DEV_MAX_RESOURCE_COUNT];
>   
> -	pdev = platform_device_alloc(DEV_NAME, PLATFORM_DEVID_AUTO);
> +	pdev = platform_device_alloc(DEV_NAME, node->id);

Per the Sashiko comment, while I really wouldn't expect it to be an 
issue in practice, I guess we could explicitly check and truncate 
node->id to INT_MAX (probably with some degree of warning) here just in 
case.

Cheers,
Robin.

>   	if (!pdev)
>   		return -ENOMEM;
>   


