Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A81DF327C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cesJK1cHlGpwk2c9K2NN00+fF/B3i8r4V2/l72ekORE=; b=zPQskBaylNdLp5+wZnwRRE0McH
	+6n+OuF8XLR4Rxj/AfWXQdYrJJLVBJlDQpB/ndzxmM7IrJHNHGZwmx/mw4OW3u4JO+4wJI1ADbdn2
	8CwmILN+6B+RXOn1d1yoCyH+fDP2O+JjGA+3SMGvbraxfzqVZ3YVN9YwGLyIzrPvrbgzhTwYtZRKD
	AhbVPoCzmHwZSo5NLWN8S+XoIPYFX4Z8zacu7GM478JQ2hSPEENKGn+a3QQfhlIvoCEVQIk1pjSrc
	lyQglhMoPk5SHZiputkObla+D+py0yL0ZX8h7FfvQGLr4NRRZnC798f0xHSGjhHkY6o3aqcpse2EO
	eeb3RDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6m3-00000008Gwh-3v45;
	Tue, 21 Apr 2026 08:48:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6m1-00000008GwK-2Gcy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:48:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FE1225E0;
	Tue, 21 Apr 2026 01:47:51 -0700 (PDT)
Received: from [10.57.17.241] (unknown [10.57.17.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A52A83F915;
	Tue, 21 Apr 2026 01:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776761277; bh=tGHTJO3OLM2tPNvqAneG+wOR1j4TNZT+Lox+5bpZMnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lDGs96Z49uYUZQDLYjWkRtmQTDcjKBu2UzJIA66S9wjCdpk7SkTllYVQ2t1QQuFEy
	 Z6MCQTey8RVl2MojuSsSN8z+8LbvxT8atmenhEA4bA7TIwxls7VYdgbt3fBNkP5nE+
	 50Qr/0P2qI/0IOnjNqCBVob0sAFcdLFPcpCvSSkw=
Message-ID: <d733a0b3-60a6-4bd8-909a-a2ee0c121dde@arm.com>
Date: Tue, 21 Apr 2026 09:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] coresight: etm4x: fix wrong check of
 etm4x_sspcicrn_present()
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, leo.yan@arm.com, jie.gan@oss.qualcomm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-2-yeoreum.yun@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260415165528.3369607-2-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_014801_651243_CF6B3986 
X-CRM114-Status: GOOD (  16.16  )
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

On 15/04/2026 17:55, Yeoreum Yun wrote:
> According to Embedded Trace Macrocell Architecture Specification
> ETMv4.0 to ETM4.6 [0], TRCSSPCICR<n> is present only if all of
> the following are true:
> 
>    - TRCIDR4.NUMSSCC > n.
>    - TRCIDR4.NUMPC > 0b0000.
>    - TRCSSCSR<n>.PC == 0b1.
> 
> Comment for etm4x_sspcicrn_present() is align with the specification.
> However, the check should use drvdata->nr_pe_cmp to check TRCIDR4.NUMPC
> not nr_pe.
> 
> Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]

Fixes: f6a18f354c58 ("coresight: etm4x: Handle access to TRCSSPCICRn")

With that looks good to me

Suzuki

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042..74b7063d130e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -89,7 +89,7 @@ static int etm4_probe_cpu(unsigned int cpu);
>   static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>   {
>   	return (n < drvdata->nr_ss_cmp) &&
> -	       drvdata->nr_pe &&
> +	       drvdata->nr_pe_cmp &&
>   	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
>   }
>   


