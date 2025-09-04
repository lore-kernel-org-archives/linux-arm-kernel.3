Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A873CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rie4NtT+lhI/VU3pftqdPT332lGA5fFGRROI4ZDW40c=; b=ty3BIKBDAgEG8l6GuWtnVrK1FH
	JAxln7ys/OryR/5r5l+f7W5qujhXr2q4MHZ61Su2W/I60KaMUIoanB1QiVYeOmzh9ixpy6z5BeezQ
	emwKit4X9y6jquGPlWWsazY+NUNTlDd/5SBQ8czSUGFSjOAJlPo3nf8Uw4mf669pYyMdcWhVw6VQ3
	rTh75wHYVBS8QNkhNX2J9uwpzvKhyu428VkAPGfsQA9re/1sF0NekGQ1vVFcP/aMIJTRtzfryIDBH
	93jN3o4cW9gfeKa0tSNc7vAbcKlKbQBA4cwFB2sv+0BNJuCefis85YYniS8NUBTAi5oKD+0iK+6RT
	CvRf1ZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG0S-0000000E2dw-1LV5;
	Thu, 04 Sep 2025 19:52:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBEW-0000000CJo4-2vit
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:46:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so776438f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756997199; x=1757601999; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rie4NtT+lhI/VU3pftqdPT332lGA5fFGRROI4ZDW40c=;
        b=KL9NtMwCvpYVD/aUDy4k9yGwPkupuWR56B0TNumtaNyuFucNyxFEQLdLVpEYsukWWZ
         TrDo+9PnrKQETOCaaLPbsgVJa5Yni85FMgq/x4+1q89oBqqHOXSiaydNJOtN3snBVyRY
         xrP2PN1VwXECrsGS3fp6YXQkrmKqetVtyTNDVrlLRiLkKSMsqCIx3Mh8KvW+lquyzhPs
         e+4mZWPlRx+7eOmkYJ8ox+lnv7G7sfUIkkDLHX0GagSwltU06nUcUS+tmwt0xbbFCeFU
         S03TxhYYT6ZZhTmoQuF6Fbe0yWIVoHtBg+YgJkupkJo9Zy3DwLGL97EEQyXVO9WNuxko
         HOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997199; x=1757601999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rie4NtT+lhI/VU3pftqdPT332lGA5fFGRROI4ZDW40c=;
        b=eiIrp0qulMH0dGsVFEOKfhOCbCwP/GBLn3chTOzcgSrB2+hv1t7cIw9cFnyzOeBdT8
         mfd0E70y4lH67Xp4/rKzdi83Hkr8J1PJ46tlTzGN0z3ekI0YS86cKhRSSJywoBASkQfs
         iAv1dm3M8hfqc5XP4WfLBI2M66TzQB8CTnVfEPuFacLP640GpBiT0m2JXEqDQLRX122X
         EvNPADqbPzp4saySiPQIIdbi+67w9P4YAbOTvaif2Tzdx/XLKx5eNaEKHiKP/kwg0XmZ
         lKEGwjQvxxU8bTVhMUhu1CcZhRbAxKfp4oGrSqsMXvlD9vswa7aBLeHY8dFC/9XCVHx2
         +T7g==
X-Forwarded-Encrypted: i=1; AJvYcCV88bwxCkzOLJJ8nLv93AvURdlhe9qDUr9km9pfOow3qop6hfoU5ShddTefEoBIFoI3/j0Ju0AKIDt+h5XILqMR@lists.infradead.org
X-Gm-Message-State: AOJu0YxAMfRfybncosdilmaj1zcWV+9uGo5TTfgRWzsSevJJiQtm7pLr
	+IlKX7hl71KhlO80goSK9r3t74HIc7oo4YTPqOxZHMJ/rJepAXqd06lF89OI2U/FtX4=
X-Gm-Gg: ASbGnctg4g009NIVowSgM85MIjz+4xpt+QdU0iG8NSFziUgLuiZLj+pqtY9hoL1YzKe
	5KgXH+mkQUS+jk1/gZZ0VcAQ/1ki3XGw1Ayz+daXRnrbBJFRYFXCyJ+Yyr0H3nCZR0Hllt1cTwP
	yYG93IkJA+xN7Jnc/EL1+bxJQy3XNhTZq+IYlnRwz2SgLSXfAn5VyvCxgPWudyM6oXaSzDkN2dg
	0Gi6KnqYiQu8Vj+pecqBK7sG4yOVai3GDDe/Ry/ur4nU0Si1IQWiZIo06gawnckpCEzd0rkpAXg
	lcy+Py/ZJQ7PpImFlLhjRuRnDz8hOrsODbEif1dncODW5SZUxOtZVI/eIvWubcPv0587GxlXWjc
	Ls0XJgybUp8aU9zVNwVBj4+d0p0uqKm0o2mjjXg==
X-Google-Smtp-Source: AGHT+IFI/E5qAIKfXdhNEpKBbEZViYZqEL++gyAmn9sf9BLf2v535PWLf+n1Md00yBlgDCzJA4lVmw==
X-Received: by 2002:a05:6000:1a8c:b0:3cf:74e0:55ac with SMTP id ffacd0b85a97d-3d1dfb108b2mr16861958f8f.38.1756997198893;
        Thu, 04 Sep 2025 07:46:38 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb5693921sm86639035e9.0.2025.09.04.07.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:46:38 -0700 (PDT)
Message-ID: <fabea1ff-cff0-4496-ae82-40c38f293ad5@linaro.org>
Date: Thu, 4 Sep 2025 15:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: trbe: Return NULL pointer for allocation
 failures
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250904-cs_etm_auxsetup_fix_error_handling-v2-1-a502d0bafb95@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250904-cs_etm_auxsetup_fix_error_handling-v2-1-a502d0bafb95@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_074640_742506_CF8BEB80 
X-CRM114-Status: GOOD (  21.39  )
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



On 04/09/2025 3:13 pm, Leo Yan wrote:
> When the TRBE driver fails to allocate a buffer, it currently returns
> the error code "-ENOMEM". However, the caller etm_setup_aux() only
> checks for a NULL pointer, so it misses the error. As a result, the
> driver continues and eventually causes a kernel panic.
> 
> Fix this by returning a NULL pointer from arm_trbe_alloc_buffer() on
> allocation failures. This allows that the callers can properly handle
> the failure.
> 
> Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
> Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v2:
> - Fix TRBE driver instead of changing coresight-etm-perf.c.
> - Link to v1: https://lore.kernel.org/r/20250904-cs_etm_auxsetup_fix_error_handling-v1-1-ecc5edf282a5@arm.com
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 10f3fb401edf6a00b24b38cdaa7c2865e7a191ac..8f9bbef71f236b327d35a288689df9b0dd8ff3f4 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -748,12 +748,12 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>   
>   	buf = kzalloc_node(sizeof(*buf), GFP_KERNEL, trbe_alloc_node(event));
>   	if (!buf)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>   
>   	pglist = kcalloc(nr_pages, sizeof(*pglist), GFP_KERNEL);
>   	if (!pglist) {
>   		kfree(buf);
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>   	}
>   
>   	for (i = 0; i < nr_pages; i++)
> @@ -763,7 +763,7 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>   	if (!buf->trbe_base) {
>   		kfree(pglist);
>   		kfree(buf);
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>   	}
>   	buf->trbe_limit = buf->trbe_base + nr_pages * PAGE_SIZE;
>   	buf->trbe_write = buf->trbe_base;
> 
> ---
> base-commit: fa71e9cb4cfa59abb196229667ec84929bdc18fe
> change-id: 20250904-cs_etm_auxsetup_fix_error_handling-cb7e07ed9adf
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


