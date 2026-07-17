Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBD8C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 01:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Uble4eKSJ85c3t6x1O5pOpNQXmBoa/HjvVuLqjsAGw=; b=eTSISPEdEZ+hbayyiM6QdNIQxC
	GhbOVDDzw+/4sU6e3xHW0nIxYf6aHdVW2TvwNTElk7hxnHv3BvUwLCCzSH100Nuv0Y3onI45M5JkS
	uWnvHVuCbRo+tJ10REyAy8o0JWxy04Tv5M0Qwe+wCub/pUzLQ73aLfAriBdTsLq07CUMpX/q2ZLhr
	ZtrzCsIFkL6O8llyn4WmmtLU7ToDTfJ1xl+uu48c1BHkDkXkraXbnxyUzPssu99s/6CHNJIFtIjMj
	aX0Rizea782lC7g6JyY1RUj1NGsFXoy4cPsl+/PIgvsBflbYlCHsv4VECEofbSDMstN/Kliyevxf4
	5AkAMCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXQT-00000000uKp-3HMR;
	Fri, 17 Jul 2026 01:31:41 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXQR-00000000uKK-1yjT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 01:31:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2Uble4eKSJ85c3t6x1O5pOpNQXmBoa/HjvVuLqjsAGw=;
	b=LV+k9OLpQRwIJszukFxoni9lA8wRHWzF3x34dv6pDh+/+Yd7Fw8xamvZN2xb/8Hr2dzcIjn1G
	Y4QO6lmRLEUhGHjLnn3V0F22aCbQJXVZwRhohKbB+9OqR+GOFboQq86zMZCfRY0ZKjsmk/9OA4D
	seNVJGRI4yBgHJY6p3tbcKY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h1XF71wtkznTts;
	Fri, 17 Jul 2026 09:21:47 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B2D54057C;
	Fri, 17 Jul 2026 09:31:21 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 17 Jul 2026 09:31:20 +0800
Subject: Re: [PATCH v2 1/4] ACPI/APMT: Use stable device ID
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <catalin.marinas@arm.com>
CC: <ilkka@os.amperecomputing.com>, <bwicaksono@nvidia.com>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
References: <cover.1784213435.git.robin.murphy@arm.com>
 <f7eb9a4cfea4cd6f8d87f3c2501438d484807d27.1784213435.git.robin.murphy@arm.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <330cb52a-2277-81c5-10ba-9e049e5562e5@huawei.com>
Date: Fri, 17 Jul 2026 09:31:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f7eb9a4cfea4cd6f8d87f3c2501438d484807d27.1784213435.git.robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_183139_683298_98C10F4B 
X-CRM114-Status: GOOD (  15.32  )
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

On 2026/7/16 22:56, Robin Murphy wrote:
> The APMT node format includes a unique identifier, so we can use this as
> the platform device ID to give userspace stable and identifiable device
> names, rather than auto numbering dependent on how the table is parsed.
> 
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> ---
> v2: Handle and warn about unexpected signed overflow
> ---
>   drivers/acpi/arm64/apmt.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
> index bb010f6164e5..91fcdd289e63 100644
> --- a/drivers/acpi/arm64/apmt.c
> +++ b/drivers/acpi/arm64/apmt.c
> @@ -76,10 +76,12 @@ static int __init apmt_add_platform_device(struct acpi_apmt_node *node,
>   					   struct fwnode_handle *fwnode)
>   {
>   	struct platform_device *pdev;
> -	int ret, count;
> +	int ret, count, uid = node->id & INT_MAX;
>   	struct resource res[DEV_MAX_RESOURCE_COUNT];
>   
> -	pdev = platform_device_alloc(DEV_NAME, PLATFORM_DEVID_AUTO);
> +	if (uid != node->id)
> +		pr_warn("Unexpectedly large UID 0x%x, truncated to 0x%x\n", node->id, uid);
> +	pdev = platform_device_alloc(DEV_NAME, uid);
>   	if (!pdev)
>   		return -ENOMEM;

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun


