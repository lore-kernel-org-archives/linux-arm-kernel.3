Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729C8D49211
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwrVOismUmLZnOKe8mn5G9TiQjJySHN79V870JBkWgA=; b=jmQQtiVNZKQ/uq8YzmPdN3B1kO
	YkHAmsJcrfYPa5qgzxRq6OpgfbXFLEKBrrbsBJ9mDJlankRNYGo/AtpXyJ49n026IYxEvcyUkbi9U
	8tcutroRyI8eJp6FCvGpWoyGsPu6W5g8ZTgl8483HXUUARzXTQYVbWj8jb7QvpT0jOFi/aswo29I0
	UuyOIwXXEXBZMAwZiqDfouXbAwhC8ZNjUzOkOhbD6QWO7ZSD4lUbWcIPp3kUedN4blICGsOwn/YHB
	4qSuEe/E7opiFUPn+TwWkIfqtaojX3lpw0mc+s21goMG1MJGas4Fq6l8wd/P9f15x/1NNOcp+wbqO
	MdincuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Me-00000009KZx-3PZb;
	Mon, 18 Nov 2024 11:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Li-00000009KUC-1joP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 11:55:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD21B1682;
	Mon, 18 Nov 2024 03:55:49 -0800 (PST)
Received: from [10.57.91.28] (unknown [10.57.91.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7F253F6A8;
	Mon, 18 Nov 2024 03:55:18 -0800 (PST)
Message-ID: <fc308d9b-9b8b-4932-9f24-1756f5c089db@arm.com>
Date: Mon, 18 Nov 2024 11:55:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm-ni: Fix attribute_group definition syntax
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241117-arm-ni-syntax-v1-1-1894efca38ac@weissschuh.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241117-arm-ni-syntax-v1-1-1894efca38ac@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_035522_493314_43815572 
X-CRM114-Status: GOOD (  17.44  )
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

On 2024-11-17 10:20 am, Thomas Weißschuh wrote:
> The sentinel NULL value does not make sense and is a syntax error in a
> structure definition.

What error? It's an initialiser following a designator in a structure 
*declaration*, and the corresponding bin_attrs member is a pointer, so 
NULL is a perfectly appropriate value to initialise it with.

Of course that is redundant when it's static anyway, and indeed wasn't 
actually intentional, but it's also not doing any harm - the cosmetic 
cleanup is welcome, but is not a stable-worthy fix.

Thanks,
Robin.

> Remove it.
> 
> Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Cc stable because although this commit is not yet released, it most
> likely will be by the time it hits mainline.
> ---
>   drivers/perf/arm-ni.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 90fcfe693439ef3e18e23c6351433ac3c5ea78b5..fd7a5e60e96302fada29cd44e7bf9c582e93e4ce 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -247,7 +247,6 @@ static struct attribute *arm_ni_other_attrs[] = {
>   
>   static const struct attribute_group arm_ni_other_attr_group = {
>   	.attrs = arm_ni_other_attrs,
> -	NULL
>   };
>   
>   static const struct attribute_group *arm_ni_attr_groups[] = {
> 
> ---
> base-commit: 4a5df37964673effcd9f84041f7423206a5ae5f2
> change-id: 20241117-arm-ni-syntax-250a83058529
> 
> Best regards,


