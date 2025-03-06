Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AE2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8jLHb9XLeLkNd1V0M5mOG56gSst9YbUJm3BRxiuGvM=; b=ed+hd1UEuXQyUaNpGuQrjSrpm7
	Psj7WYCYrA1bOBBiGuHR0ABnfHVj5akq9mmWNX9FWIpmSwM3nol/YWvoiXBjjdj990vmVgzC16TXu
	cJAq37TEeXMV6EzQhDgZOb64uU6frkWMXtdgP5Y3yj66Gg4DQcYyVTxTI4OJ9Wg846zVnrmVJoJIY
	ztjiK66I+0n+js9JqrQglsVUVc2mKalIpZKIciKoqaz8ijCJza7PdmD+Ai5gXb2sZPE2KSuEKjW7K
	UsvIeKJtnkpz4E8wJdRyeXK0tUAudP7JKvipkDvnxUlPAEQ1J+eKLDIg5qO0hBv26Ygt+v8eBVSQq
	MNLgWlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7cY-0000000AV17-3hju;
	Thu, 06 Mar 2025 09:34:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7aw-0000000AUs4-3oNQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:32:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3912c09be7dso234168f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 01:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741253565; x=1741858365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8jLHb9XLeLkNd1V0M5mOG56gSst9YbUJm3BRxiuGvM=;
        b=GmILClQzeHJf7uS1Axzo/zAaNRiFg+5H3YPBP4kbCOrpUXRpHlsydxcLErwOyr1rxp
         rBJ33Rbn0R7SW0rOTEFJOHmKUvbjnpddTyUxBKTTPZF4OU7VZGTYrJvriTqwRF9GZsyo
         E9MIDbW71313Gz7Hf5YU9h8FdWQBzlwunbYlCcRE28g5QlbBzw39sQeSZYelDXNlgCxt
         Hi5uFNrNIOCINtH7JP88ox8UwTf739Y4EqLAgCVuVbPBaf5yoHUsaL20hg1ybBr50VM0
         Cnb3vyKfxESUi837RwZru3HnMBRRv65Ff2gJ4OsIN9zSHDTTm26AVvawZx6iDRSZCbHO
         YUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741253565; x=1741858365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8jLHb9XLeLkNd1V0M5mOG56gSst9YbUJm3BRxiuGvM=;
        b=IKnEpwMqE6/7RpuJ+m4+0mfaRdbckFhrLbN65unjLr0OIP6WjXFA/Jqxe2Rbq39ghm
         TnYlmPDm/JqAfr3DfWY/tgjxlejWY67j24E0mOf5nuapx1Se25k6cwdrj5EPyRWb8E2p
         AYJGNcFkjIjmbfvqBPVoCx2L9+yKC2W3eJYQS9YbSln6KE714MEDjN5rVcx0XkqeHHGg
         VYLnkr+H6rdDXUwVb0C7b4arpKLYR9RsDnrfpNG5Cj+5WlRB20uWXhxa86UPLaYoyTZ4
         56xys4GeMCU409M66/z4yXxCcYw8y2JSt4JaiKfpvNrC2fKiEVzIhHafxaXw3+Qv96I3
         z6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOPKL4LCc5BtBjPL5tLd42KQcu+e4R2cRGQyFbMPsP+JqgrxDX7ahVauVmM9wmb3kosWZMu6iP9SFnxiDOC086@lists.infradead.org
X-Gm-Message-State: AOJu0YxrxMnq7IW1DrG8BYA5PJaadc5HQydK9F3QpAT+6C7u4e/lhvq9
	1ozPXfTtrTVnY3LM4hJ+r/BspiETbLjDBHshGuIhKOGrjsvzByJBtGyZqKQGzHc=
X-Gm-Gg: ASbGncvZauFxaRNvPc0BNIgoRMme6IXK3R2WAMFwq4epM5vzKiD/REyRZvjAcHM2Yhr
	kHGvEWa1XZKpiQOpUPvmdVjQv11BiQwq6+yNK2KDAqi+b2dWoTAcc6cET87CgSpzSaJEhlLi3qm
	JvodVS3kapQkCOIdCwHB15uOBNme2YvbOQoZOEl9pfF/r3HgE74UmvY9ypwX5k3dqu6PUqZkJGA
	s3D39nzq3/T8BS6Qmuu/nvyYSi/ESV8jk6iwT7AvKSNZhd5NWlfqUgNBpYo7+0LhgqAy0ceh+4g
	/3xmVBTy6mMkEH+sOXHHMYAmAdnbRYTv3/MzqHVuNf0UR/ceiU9jBQ==
X-Google-Smtp-Source: AGHT+IH9QNZRukaghEgEGZYND9m5AIVeLbN9y67lK4LiB7hdnUt2gHh3F53IatBFd0ysdQ2ADR89Lw==
X-Received: by 2002:a05:6000:154c:b0:391:275a:273f with SMTP id ffacd0b85a97d-391275a2a0dmr2505803f8f.4.1741253564880;
        Thu, 06 Mar 2025 01:32:44 -0800 (PST)
Received: from [192.168.1.247] ([145.224.67.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c102b62sm1410454f8f.84.2025.03.06.01.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:32:44 -0800 (PST)
Message-ID: <204e94a7-24e1-4dc2-b6ee-8527510a275b@linaro.org>
Date: Thu, 6 Mar 2025 09:32:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] perf/arm_cspmu: Add PMEVFILT2R support
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, bwicaksono@nvidia.com,
 ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <cover.1741190362.git.robin.murphy@arm.com>
 <b11be3f23a72bc27088b115099c8fe865b70babc.1741190362.git.robin.murphy@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <b11be3f23a72bc27088b115099c8fe865b70babc.1741190362.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_013247_020011_617039E8 
X-CRM114-Status: GOOD (  19.06  )
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



On 05/03/2025 4:10 pm, Robin Murphy wrote:
> Architecturally we have two filters for each regular event counter,
> so add generic support for the second one too.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/perf/arm_cspmu/arm_cspmu.c | 7 +++++--
>   drivers/perf/arm_cspmu/arm_cspmu.h | 3 +++
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 053bb7920df6..efa9b229e701 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -183,6 +183,7 @@ arm_cspmu_event_attr_is_visible(struct kobject *kobj,
>   static struct attribute *arm_cspmu_format_attrs[] = {
>   	ARM_CSPMU_FORMAT_EVENT_ATTR,
>   	ARM_CSPMU_FORMAT_FILTER_ATTR,
> +	ARM_CSPMU_FORMAT_FILTER2_ATTR,
>   	NULL,
>   };
>   
> @@ -767,9 +768,11 @@ static void arm_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
>   				    const struct perf_event *event)
>   {
>   	u32 filter = event->attr.config1 & ARM_CSPMU_FILTER_MASK;
> -	u32 offset = PMEVFILTR + (4 * hwc->idx);
> +	u32 filter2 = event->attr.config2 & ARM_CSPMU_FILTER_MASK;
> +	u32 offset = 4 * event->hw.idx;
>   
> -	writel(filter, cspmu->base0 + offset);
> +	writel(filter, cspmu->base0 + PMEVFILTR + offset);
> +	writel(filter2, cspmu->base0 + PMEVFILT2R + offset);
>   }
>   
>   static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index d59040d6a7e3..19684b76bd96 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -47,6 +47,8 @@
>   /* Default filter format */
>   #define ARM_CSPMU_FORMAT_FILTER_ATTR	\
>   	ARM_CSPMU_FORMAT_ATTR(filter, "config1:0-31")
> +#define ARM_CSPMU_FORMAT_FILTER2_ATTR	\
> +	ARM_CSPMU_FORMAT_ATTR(filter2, "config2:0-31")
>   
>   /*
>    * This is the default event number for cycle count, if supported, since the
> @@ -72,6 +74,7 @@
>   #define PMEVCNTR_HI			0x4
>   #define PMEVTYPER			0x400
>   #define PMCCFILTR			0x47C
> +#define PMEVFILT2R			0x800
>   #define PMEVFILTR			0xA00
>   #define PMCNTENSET			0xC00
>   #define PMCNTENCLR			0xC20

Reviewed-by: James Clark <james.clark@linaro.org>

Minor comment that the doc linked at the beginning of the file "ARM IHI 
0091 A.a-00bet0" doesn't have PMEVFILT2R, you need the latest version 
for that.


