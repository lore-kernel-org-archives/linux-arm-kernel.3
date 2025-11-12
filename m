Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D483CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/T4Ozi2mOS33VKynHD2AOjCruDQ9QppjMMIG3UFo+o=; b=WH5b4D/LKHCkwyCTxQ4zBTgWlW
	wepAJlfZ0C98WgBq1YZvoh/kC7htNWVaHI/2s0ePS2fQQ+UilYBmdMYC7y++ubT4jJrKDptlcc7c+
	V57g3PHzZeXHSyhrKXsCCRLrYwr3WbtMDfRnG6SP+C53D1sA7D2XMK7Ny0pq3pjSTyygvz/hMHvOz
	HE18AryscKGAu9wif5OPkA/ihgnfYcp4qPevOxroq3Pkp29B+xFbDIV+RUxG+iPbKt4Z2gNdc36XI
	WJA3MZLdqDsNzLh3KWVmZ7yjDxbjLDxvfOJRYHM3Dba0c5CVZYyKeKv3tfcVtPTSPEKJux8GGxQol
	Tw2rSuZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCZy-000000091gu-1bJP;
	Wed, 12 Nov 2025 15:16:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCZw-000000091fv-1FCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:16:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100A01515;
	Wed, 12 Nov 2025 07:16:03 -0800 (PST)
Received: from [10.1.196.87] (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34D2D3F66E;
	Wed, 12 Nov 2025 07:16:09 -0800 (PST)
Message-ID: <197141a4-bbfc-40df-8860-1291b810f676@arm.com>
Date: Wed, 12 Nov 2025 15:15:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: etm-perf: Fix reference count leak in
 etm_setup_aux
To: Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com,
 mike.leach@linaro.org, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, mathieu.poirier@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 stable@vger.kernel.org
References: <20251112012405.11731-1-make24@iscas.ac.cn>
Content-Language: en-US
From: Leo Yan <leo.yan@arm.com>
In-Reply-To: <20251112012405.11731-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_071612_412252_3981D4C3 
X-CRM114-Status: UNSURE (   6.91  )
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

On 11/12/25 01:24, Ma Ke wrote:

> @@ -454,6 +454,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>  		goto err;
>  
>  out:
> +	if (user_sink) {
> +		put_device(&user_sink->dev);
> +		user_sink = NULL;
> +	}

After searched kernel, I prefer to put device in coresight_get_sink_by_id().
Please refer acpi_dev_present() how to do that.

I would like Suzuki's confirmation in case I introduce noise.

Thanks,
Leo  

