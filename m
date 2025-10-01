Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88BDCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sk9/01sjLhSDKrsz2vI2OXUeP/F7c38Pwscg4TdgVDU=; b=TJfg/taUWlheT3htl9WnzLzHkh
	p+ipmJhVhART/qIVhlQ1DaC7qvnQcykqyijYsK948l/r1yriBSPDUwqL9KNuDPi8/1clWiWj6QzjB
	c9P/liRyGgXP0cr+VW0pPr8prHEDPCqp6qymY7L+rYHDZnxU6xh00ePpHy5OzQjXtIvXS1aM5e4dh
	Fz3Rym6jIfTD3hlUXG26Yaj4bWckE7qBNam0mxEBd6fa9KtXJWfpZpKF84kRbnwWSq7J9kiQW6JIv
	ZxaSvZbqTJpkpI/rBb7+xNk7Hi+BGeC1+/RGySRlxo/qb9e+bB7Hx1JD2R2fN++w1r9E4zj1DJEME
	AtaoMN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x7s-000000084BX-3B0c;
	Wed, 01 Oct 2025 13:44:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x7p-000000084Ah-1B4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:44:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46b303f755aso63942205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759326247; x=1759931047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sk9/01sjLhSDKrsz2vI2OXUeP/F7c38Pwscg4TdgVDU=;
        b=L/pVdOfvp6TyPUap3W6/yVTT2P2a9XS2hHonfxDq6wNwDeUEt/Pjs5q2VZ1wl8DafO
         XVQ92XfhrnfeuWt6n0zjqYTLcNPt9Mk7A9q48X+dTWz+x1avVlsBjR+Sr04W/3/k6zEj
         vsGDM9/bZuI4xMk24xe15g8rbNFEV8Ne+7YXcig2TUmDhsSyvdKHx5dD2yT11qJef1SB
         HgHNRtPTjfqqLwiWiETwhCud0fF++F4m2i6bpHm0gzEX+XhllxUkp5kSHwdkkYKtt4gG
         I3fyVZipx+sZrmcmClXr0WhFM3uHYlt3axJVy0VVC23LVS7spYAjXWDRYNCTt89AKTeh
         iq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326247; x=1759931047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sk9/01sjLhSDKrsz2vI2OXUeP/F7c38Pwscg4TdgVDU=;
        b=tSQYOWjX7bwXGvIIYQTtBwqha0vmpF5hUS0QxXZPiZtJXQkYwmx9AW4mA+KET0HdbY
         eiPypoXvqO5wY0TlCqsQrDTxqpjjr/9lsn3pHTH7a4/GFdYSDTerEOQTHI7pyqwyZe1e
         cRYFPnoSkFqFReFKHC1boVxZCfGVcfjkCptUGm4y3TEOjeBda9y5R4iNUIuIHzFqhA3y
         /BK3qx2jPHgC45Wj+yvy7SOy4MbgT4cgp1yNW4jMyyKBTvnc052opRJBuO82Ylk1Nl3Q
         c3vvOa2I3ImzmYLeRZaM1y2LAJFkzC3w5VEoH/9V1FW5HU2YI04TIGweqrXnpgGUXzwZ
         0Rsw==
X-Forwarded-Encrypted: i=1; AJvYcCUh678sQt5FHKgdxnh0MxqDfVC2vv1YiiaSOYvAHuovNaeygn0e1UPQOK8sjl3uX5QZxQu2XoOfOOecHFtunygu@lists.infradead.org
X-Gm-Message-State: AOJu0YxJtkviQTn2AsI4u5PUcYtnVDv87OxCDEtuHd5G13IDGfrj4pVx
	4rent+RctLXzfhomn5hLViczRZEuKbmsfIVi5r7TCJXSRqNFk889lT0tqDYJuPIMqw8=
X-Gm-Gg: ASbGncsRxWWWqRhIB+3kGM14evjvkcmJFQKtn1IjyPrbicrlcV+G+IysLdci/cT2yxl
	a+7z1DxTrh0YcRqV99zDP9lGvzeePO44+mm2c+PY36/zBxzkFeFLY6/4M9JJyj3paGW8R7lVvg4
	vFh1Auw5pkBbPTPEj1Hd75hXAw0qj6jB9bf6YRs8TbrjhYhnux/fpAW3xxw3jfGd56f4pj6RQVZ
	RkBzwnXUOko2IgT2X4Dlwz1Zvdw9dzQmB0EUcCcPYIzvqI7tBf/UqouBvaKAzmJ+T8JSfTFitug
	SSaiY+eatLlG6Yz64wRh7s1eS3jCL7rA6fCxVb1zW4QzUbLVcEWMgbaKcxNRzNJfDefEnoVwXwi
	Hnt9f+/xkychb+qq5UsmgHJzngvVQwMnDBjsj1L+87Fbd3pUOwEZmFsTYWGuQZSU=
X-Google-Smtp-Source: AGHT+IEWE5njzkAVMh0iSC7VPEQmyUpucrPcJT/AcJg5bY23uL7H8GGcf4J5p6a5shSngpQ//r/sAg==
X-Received: by 2002:a05:600c:c162:b0:46e:49dd:525e with SMTP id 5b1f17b1804b1-46e612bc070mr25722595e9.21.1759326247407;
        Wed, 01 Oct 2025 06:44:07 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199250bsm41317945e9.3.2025.10.01.06.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:44:06 -0700 (PDT)
Message-ID: <708a5bbd-2bad-4f94-8fd1-6bd10825ba71@linaro.org>
Date: Wed, 1 Oct 2025 14:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] coresight: Add format attribute for setting the
 timestamp interval
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
 <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
 <20250930151414.GK7985@e132581.arm.com>
 <3a731a9e-0621-42b6-b7fc-4b0fd9b7da6e@linaro.org>
 <20251001132815.GN7985@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251001132815.GN7985@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_064409_346030_56598763 
X-CRM114-Status: GOOD (  24.60  )
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



On 01/10/2025 2:28 pm, Leo Yan wrote:
> On Wed, Oct 01, 2025 at 01:40:37PM +0100, James Clark wrote:
> 
> [...]
> 
>>>> @@ -103,6 +111,9 @@ static struct attribute *etm_config_formats_attr[] = {
>>>>    	&format_attr_configid.attr,
>>>>    	&format_attr_branch_broadcast.attr,
>>>>    	&format_attr_cc_threshold.attr,
>>>> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>>>> +	&format_attr_ts_level.attr,
>>>> +#endif
>>>
>>> By using .visible() callback for attrs, we can improve a bit code
>>> without spreading "#ifdef IS_ENABLED()" in this file. E.g.,
>>>
>>>      static umode_t format_attr_is_visible(struct kobject *kobj,
>>>                                      struct attribute *attr, int n)
>>>      {
>>>           struct device *dev = kobj_to_dev(kobj);
>>>
>>>           if (attr == &format_attr_ts_level.attr &&
>>> 	    !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
>>>                   return 0;
>>>
>>>           return attr->mode;
>>>      }
>>>
>>> Otherwise, LGTM:
>>>
>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>>>
>>
>> Unfortunately that won't work because you'd have to always include
>> coresight-etm4x.h. This file is compiled for both arm32 and arm64 so it
>> would break the arm32 build.
>>
>> I could define the TTR_CFG_FLD_ts_level_* stuff somewhere else but then it
>> becomes messier than just doing the #ifdefs here.
> 
> ATTR_CFG_FLD_ts_level_* is only used in coresight-etm4x-core.c, it is not
> used in coresight-etm-perf.c. Thus, we don't need to include
> coresight-etm4x.h in coresight-etm-perf.c. Do I miss anything?

Yes, GEN_PMU_FORMAT_ATTR() uses them but it makes it hard to see.

> 
> A similiar case is the attr 'cc_threshold' is only used by ETMv4, it is
> exported always. It is not bad for me to always expose these attrs but
> in the are ignored in the ETMv3 driver - so we even don't need to
> bother adding .visible() callback.
> 

I disagree with always showing them. I think they should be hidden if 
they're not used, or at least return an error to avoid confusing users. 
It also wastes config bits if they're allocated but never used.

Either way, this was done because of the header mechanics which can only 
be avoided by adding more changes than just the #ifdefs. There are also 
already ETM4 #ifdefs in the file.

> Thanks,
> Leo


