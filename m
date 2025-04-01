Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF50CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpToXH/D7mcemrBPvEDBD+zGKfIrbgj5Iu8d+BBBKXs=; b=RMWtFKNdbpQRJrNlz1cdnrlyvQ
	Auv5LEvvhjpfyIsza6RWSOL3+G04maegM5lnRXAdUMwThC3orDyyo5VJhggHZrMsNl3gInF2xfLAK
	eyLGC3nYhPjJVU5hvHO/ciLazF3pfIkfC2J2bpduJm0iGq/HGZSTvw1a5bzW9y7MkdroMvYIYkwpg
	oFkglOXBEySo7SDxfOts/Far495jeF/mcQuR9HH2pZDi0w0J50mKCKhMAOzXBdH72WeUkPA8kUG4l
	gq/c/lVGy51MmhUc3sumnVwoT5/jPt0thOq8AplGz25LwqQOiIJSHk1Z5bgVEqxQp4LFOGcasj1su
	eI1kibTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcFo-00000003Xby-1bxo;
	Tue, 01 Apr 2025 14:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcE0-00000003XIH-0vnw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 14:04:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A945D1424;
	Tue,  1 Apr 2025 07:04:20 -0700 (PDT)
Received: from [10.57.67.199] (unknown [10.57.67.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A48173F63F;
	Tue,  1 Apr 2025 07:04:15 -0700 (PDT)
Message-ID: <d6ccc357-85fe-4b3e-95d0-127c2784ae85@arm.com>
Date: Tue, 1 Apr 2025 15:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm-ni: Fix missing platform_set_drvdata()
To: Hongbo Yao <andy.xu@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, allen.wang@hj-micro.com, peter.du@hj-micro.com
References: <20250401054248.3985814-1-andy.xu@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250401054248.3985814-1-andy.xu@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_070420_307234_F097512F 
X-CRM114-Status: GOOD (  12.09  )
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

On 2025-04-01 6:42 am, Hongbo Yao wrote:
> Add missing platform_set_drvdata in arm_ni_probe(), otherwise
> calling platform_get_drvdata() in remove returns NULL.

Oops, indeed. Not sure how that got lost...

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
> Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
> ---
>   drivers/perf/arm-ni.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index ee85577e86b9..da1907b7391d 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -666,6 +666,7 @@ static int arm_ni_probe(struct platform_device *pdev)
>   	ni->num_cds = num_cds;
>   	ni->part = part;
>   	ni->id = atomic_fetch_inc(&id);
> +	platform_set_drvdata(pdev, ni);
>   
>   	for (int v = 0; v < cfg.num_components; v++) {
>   		reg = readl_relaxed(cfg.base + NI_CHILD_PTR(v));


