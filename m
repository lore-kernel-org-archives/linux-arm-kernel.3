Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E77DCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBNoX/Meqdbif041retDcNWehJcXmgAAGm+bCdn/H9I=; b=xAZMKJtKpy7IXeRlvKJrT+A7u2
	OSu0MY3cnKjrvKOxmOkEKX2LaQhfWnaeMXtRYYykY+U8LARne/phqaLF99NU3DM1h/uz8Zrs0/ML3
	vQdCPeJIPlcHV9WtrMVhfVNAhvCpAtjsQGX4ngUchtMCc+21VBEtJhoGwG61yoPVDhlMpF5jncr5E
	sWeG9e/feTj004gXsLH2WZxn3/LcjHzh3S/R9r4bkxEZF5GSTCfzMaIgi/Ftcw40BuCCmNNYEfzqi
	Td5VDBwco+0wDdaWrn7XBUhT10FKUuT6a07j4ycjlb9F/+sLpR8M2NGaCsyo0EYhb1O8D6Ou+5k7O
	jkgpCpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYD1-0000000GHUX-20Bo;
	Thu, 27 Nov 2025 09:22:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYCx-0000000GHT0-1fGO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:22:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55FD91570;
	Thu, 27 Nov 2025 01:22:26 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61E463F66E;
	Thu, 27 Nov 2025 01:22:33 -0800 (PST)
Date: Thu, 27 Nov 2025 09:22:31 +0000
From: Leo Yan <leo.yan@arm.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Message-ID: <20251127092231.GN724103@e132581.arm.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
 <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
 <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
 <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org>
 <aSgPhd4u3Oqi3Ymy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSgPhd4u3Oqi3Ymy@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012235_488909_37DD256E 
X-CRM114-Status: GOOD (  21.99  )
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

On Thu, Nov 27, 2025 at 04:44:53PM +0800, Kuan-Wei Chiu wrote:

[...]

> I don't feel it is my place to say whether the etm3x driver should be
> removed entirely.

Sorry for confusion.  Your fix patch is welcome, this is useful no
matter if remove the ETMv3 driver or not.

> However, if we decide to keep it, I agree that aligning cntr_val_show
> with the cntr_val_store behavior (using cntr_idx) makes more sense.
> 
> Here is my plan for v2:
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..77578885e8f3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
>  static ssize_t cntr_val_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> -	int i, ret = 0;
>  	u32 val;
>  	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	struct etm_config *config = &drvdata->config;
>  
>  	if (!coresight_get_mode(drvdata->csdev)) {
>  		spin_lock(&drvdata->spinlock);
> -		for (i = 0; i < drvdata->nr_cntr; i++)
> -			ret += sprintf(buf, "counter %d: %x\n",
> -				       i, config->cntr_val[i]);
> +		val = config->cntr_val[config->cntr_idx];
>  		spin_unlock(&drvdata->spinlock);
> -		return ret;
> -	}
> -
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> -		val = etm_readl(drvdata, ETMCNTVRn(i));
> -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> +		return sprintf(buf, "%x\n", val);
>  	}
>  
> -	return ret;
> +	val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));

It is not right to read register at here (it cannot promise to read the
CPU (cp14) register on the target CPU).

Please refer to the same function in coresight-etm4x-sysfs.c. I think
we can do the same thing at here.

> +	return sprintf(buf, "%x\n", val);
>  }
>  
>  static ssize_t cntr_val_store(struct device *dev,
> 
> 
> Given the upcoming merge window, I plan to submit this v2 after -rc1
> is released.
> 
> Alternatively, if the consensus is to drop the driver, I am happy to
> submit a patch for that instead.

Please continue this patch.  Thanks a lot!

Leo

