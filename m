Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E786F459F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT0K7FLt+Zhfefcwjh8TNM8Ulm3GkfpZBXpIRPWoslk=; b=n+Fdx6dQrOidhQun/z/CrA5mrB
	tThixVTMvf5NlGQ9x3iJBtHR00GEvjp2geeMq8flWfgAebDGfjWD7Ya8PPC9nECkk8Oii+RfP9aHR
	n44tYo8lHDrskjGQ+fmv/xX/7dKf2LuokwOZx8BzbRsdKgAkfYECPUnkZxWHRS0uc/0fDAUIDczcB
	djB7dIdd6Je0YOG2OlggSh3r4FfLcjFtbmHFc+d7tr4eP0Rle35ZeFKQifhL7X4v60fjpF1GZzHGe
	J4fNkP9sC1ewFaKyqpnIt3T6T64tOdh3mDpuBTKH61YX79re/Hc76J2+UfurEV++HpJQusEEfZgOD
	lszVNg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFg1-0000000CcfC-3olL;
	Fri, 10 Apr 2026 17:29:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFfz-0000000Ccer-1Hqi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 17:29:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9E447E0;
	Fri, 10 Apr 2026 10:29:42 -0700 (PDT)
Received: from [10.57.33.82] (unknown [10.57.33.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 607A53FAA1;
	Fri, 10 Apr 2026 10:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775842187; bh=68EttHSuBTvmLxeXriQ+RP7Xq9ZoI6ZUP6P0w0joG+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VjlCxRJKY7aIjY3zhGWk8kHsu8Z7Am58i/GeTPqDfNRaTOVzTjpboaeM0VK1SXJwj
	 lPqv2uoe8dfTYCwVZJh9gfaWRMlM4v+qcgjwPrNLiJiZYvZhQdT56u7+YrUVbQJFfY
	 stGX1hwafN4UUTVVYohJ0X2/jHoPBVMmBgZBAmBg=
Message-ID: <57cb54cf-c5b2-4735-a104-a4821096eb0a@arm.com>
Date: Fri, 10 Apr 2026 18:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] virt: arm-cca-guest: fix error check for
 RSI_INCOMPLETE
To: Sami Mujawar <sami.mujawar@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com,
 gshan@redhat.com, YeoReum.Yun@arm.com,
 Jagdish Gediya <Jagdish.Gediya@arm.com>
References: <20260410163636.259443-1-sami.mujawar@arm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260410163636.259443-1-sami.mujawar@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_102951_422913_905D409F 
X-CRM114-Status: GOOD (  18.01  )
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

On 10/04/2026 17:36, Sami Mujawar wrote:
> The RSI interface can return RSI_INCOMPLETE when a report spans
> multiple granules. This is an expected condition and should not be
> treated as a fatal error.
> 
> Currently, arm_cca_report_new() checks for `info.result != RSI_SUCCESS`
> and bails out, which incorrectly flags RSI_INCOMPLETE as a failure.
> Fix the check to only break out on results other than RSI_SUCCESS or
> RSI_INCOMPLETE.
> 
> This ensures partial reports are handled correctly and avoids spurious
> -ENXIO errors when generating attestation reports.
> 
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> Reported-by: Jagdish Gediya <Jagdish.Gediya@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 0c9ea24a200c..66d00b6ceb78 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -157,7 +157,8 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>   		} while (info.result == RSI_INCOMPLETE &&
>   			 info.offset < RSI_GRANULE_SIZE);
>   
> -		if (info.result != RSI_SUCCESS) {
> +		/* Break out in case of failure */
> +		if (info.result != RSI_SUCCESS && info.result != RSI_INCOMPLETE) {
>   			ret = -ENXIO;
>   			token_size = 0;
>   			goto exit_free_granule_page;


