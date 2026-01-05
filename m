Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4FBC2A088
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0SqZm2rTQf7aYLnHpjeZ3uUc/0TZQ7AHNvMsL2zsQc=; b=hhArDEY9qcE7MA5xLTidnBAH9/
	MmcnXCFdBqKcOf3EoBsKLSPutmD21/T6uwboQkIlVT/kzp/3pJkkAr+VKMJw9vS3DDbzWD1SgqYo/
	4Oa+aOxG7bFFskLQOiytgEg962QBY7vqtlH+FfPodre3M2kViwSNAm7fMtcVHNAiaH+e7TaQHFy8L
	SB5SYmASVJ3LTCAsDvnLOT8f6wi0rxPquVOatScquxDOycFC6jhnC9mzhUlReDXOEGFI6taxzriOW
	5nZ9c1FMVJ92XEYtVzG49cknIkmegTuBV0y6KiqQIhSZHRfg2Quh7z+PwwqJ0LRXWQzO6DVy2Kcgb
	h3TuELcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vci1u-0000000B8Cb-3taB;
	Mon, 05 Jan 2026 10:41:42 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vci1s-0000000B8CC-1x1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:41:41 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9p42jYGzHnGdM;
	Mon,  5 Jan 2026 18:41:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A79340539;
	Mon,  5 Jan 2026 18:41:34 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:41:33 +0000
Date: Mon, 5 Jan 2026 10:41:31 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: samsung: exynos4-is: Simplify with scoped for
 each OF child loop
Message-ID: <20260105104131.00005693@huawei.com>
In-Reply-To: <20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.146.88]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_024140_648124_13631148 
X-CRM114-Status: GOOD (  15.14  )
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

On Fri,  2 Jan 2026 13:49:56 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Change is fine but I wonder it it is worth going further.  See inline.
> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-is.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> index 0827fdaf455a..14d84cc96831 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> @@ -200,7 +200,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
>  
>  static int fimc_is_register_subdevs(struct fimc_is *is)
>  {
> -	struct device_node *i2c_bus, *child;
> +	struct device_node *i2c_bus;
>  	int ret, index = 0;
>  
>  	ret = fimc_isp_subdev_create(&is->isp);
> @@ -208,11 +208,10 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
>  		return ret;
>  
>  	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
I haven't checked how frequently this would help, but at least in this case
I'd consider adding a
	for_each_compatible_node_scoped() following same approach as
other scoped loops.


> -		for_each_available_child_of_node(i2c_bus, child) {
> +		for_each_available_child_of_node_scoped(i2c_bus, child) {
>  			ret = fimc_is_parse_sensor_config(is, index, child);
>  
>  			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
> -				of_node_put(child);
>  				of_node_put(i2c_bus);
>  				return ret;
>  			}


