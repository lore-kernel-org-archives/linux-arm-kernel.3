Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C6ECAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCkO+D9kDGCy/+XSUswKupu9H0vZnu+FUXkBu6uOVwg=; b=Tpr08+6OWrzH7Y/ZFujxrYDw0B
	kXVx09MfilhAPJGblOjTxPgnTo0QGBGch5mV5dc4B8TSlG4OhlfS334FkS3KLXjM50LUbnOSwPeSl
	ku+N8J2QMgk96GBYyYU7/1jlBbsd9cHdUY33k1OwRjfjzHlTuyt8TuprG9hX1VD7l7sOvMLyQ/pKF
	iEFm81Ty1+skeL8Xnvux5RsDtkgr1/2ltMaryS99juE9RqfiKJquxs41Arn0IuMfz7L6frUJ/XWsv
	nIHYV4GhT8SjZd0U65Ih5W4HWx0kQGCpM814fR6eCKH2s7mqEfIMnwNCRVzyesj/vvqXL0aQLoWQv
	lKtq5Slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25VR-00000000KPQ-26vA;
	Fri, 26 Sep 2025 10:16:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25VO-00000000KMZ-2w2l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:16:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso1953885b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758881806; x=1759486606; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cCkO+D9kDGCy/+XSUswKupu9H0vZnu+FUXkBu6uOVwg=;
        b=o2CYSSazGKXIK2jTEEw/9F9Ml9Rur9TOFHufr0epGgDugHf8KrlP1OV4YoMbaRzLkw
         ir7neM0ZUA3gUgk557/PhynKTlRjkWhFQbXKh3c5vz7+qnzXrBWFE0GKXC6cmOnhOZ+D
         /VibTb+xmUf/lE5qsC9FPkMKWcSn7YAOUzPHSV/e7C39FaiWyytDbn6xSQAtkd3DHUDQ
         x/0EOjrwP02RFtJctidD9noXfEtVlW1m38nrdOnCuBC87FrEfEasP1alfOlruONX2fWg
         YztVBL5L5WcjJDw3Ac4y06KHy5pr/cevxXtwjmDs4HZLwxAGEG4bLe0EvX104jWC+GCu
         av2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758881806; x=1759486606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCkO+D9kDGCy/+XSUswKupu9H0vZnu+FUXkBu6uOVwg=;
        b=MmLYKYGhf/bHKGZOoflH3WuTMq2XiN5a0X57G2/sJhxnHIToiPbSOwY+Ot1DsylGtC
         Q2oZHW/uslHiMqRnLM8Ka2F4TbRrA6mPnemQztwZJPQtaV6CF3z3oSFdySX2EZnFuBv2
         kf/POWyKU8JM/4TRNjpE1cIdgj89mmjaELhOLXIk27Jq6VAsDfPBdKELSBsq5yj/gk8c
         VLhGPAcA/2EgSrxhaPByivswThR3v7qBpjPCqHYr87zlsDzY/qZt8UEoi5OWgS1FOVx0
         L1B7+MZBsMkElPrml/ZDFQaEpQm6phLtm18ury+fvuRlch10dg6hqdlZBbsqiRL7PS4t
         DBpA==
X-Forwarded-Encrypted: i=1; AJvYcCUyz791tTJiHXhVdXxjxqilJkLnQYDV/eTHwwCQ1UQda9MqmBGAGe/yO+5Ln9RlIZQkn+L0DeU/zFuQn1auzPJA@lists.infradead.org
X-Gm-Message-State: AOJu0YyTJYF2mGAZ53+oUTGVajZVxWJ+7KK0XCOPV2le3DlUhaqWkS9n
	LgQcJseui3BCb3UMJ8w7VqZu9uu+vjPDlbJoPHMztusLfprFaOHGiLYqx6vyweazdnR8MJIoR55
	0m91h1h3BIdOaRj6GuRDwppZiEWGjTH9NwMszWIUssA==
X-Gm-Gg: ASbGncuYCBL+ku36jwEIQjbhB71FxCnw2SBPP0VmfikJlUAXje55kNmA8TP0cWOpDE5
	Wj7wsR/wpjZGS7LjNVPVjU50OSDC7/7MOKoxO3iMTxNM7XiIjAhJV22tDbRlHYTrBo/8EzEDvvz
	wLoayPEm0JuzF09b+BhqrDaCDi9KD5/up4zYcN/o8PDRiNU8VRzEfkEfr4gGaQrpimPTUS32Xjp
	2EvKEB4
X-Google-Smtp-Source: AGHT+IGzJlxVn5fvoyaE5bTUyWB/9v7sczw+G/GMyXP2+K7YbYeP/z9Wa8AjIVmPF5mdgTCRh5nZo7e/gi20TgvnbRo=
X-Received: by 2002:a17:90b:3b43:b0:32e:329d:3064 with SMTP id
 98e67ed59e1d1-3342a22be07mr6857155a91.9.1758881805764; Fri, 26 Sep 2025
 03:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250925150342.1845615-1-sean.anderson@linux.dev> <20250925150342.1845615-2-sean.anderson@linux.dev>
In-Reply-To: <20250925150342.1845615-2-sean.anderson@linux.dev>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 26 Sep 2025 11:16:34 +0100
X-Gm-Features: AS18NWDTsCHFtCAPW1bDwfDXkfQeZu6rm2BiGOisJ47um5m78Fo0JSROz43i8Ck
Message-ID: <CAJ9a7ViDJKRCMn6wqHC-F+ohU_gRa3BzgaFoGzcd0TeDmNLKVg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] coresight: Fix fwnode leak in coresight_register
 error path
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@arm.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Linu Cherian <lcherian@marvell.com>, linux-kernel@vger.kernel.org, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, James Clark <james.clark@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_031646_741980_D7AC1816 
X-CRM114-Status: GOOD (  17.67  )
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

On Thu, 25 Sept 2025 at 16:04, Sean Anderson <sean.anderson@linux.dev> wrote:
>
> If registering the CPU map fails, we need to put the fwnode. free_percpu
> works when called with a NULL pointer, so just use
> coresight_device_release.
>
> Fixes: 5ad628a76176 ("coresight: Use per-sink trace ID maps for Perf sessions")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
> (no changes since v4)
>
> Changes in v4:
> - New
>
>  drivers/hwtracing/coresight/coresight-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827..022c8384b98d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1352,7 +1352,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>                 raw_spin_lock_init(&csdev->perf_sink_id_map.lock);
>                 csdev->perf_sink_id_map.cpu_map = alloc_percpu(atomic_t);
>                 if (!csdev->perf_sink_id_map.cpu_map) {
> -                       kfree(csdev);
> +                       coresight_device_release(&csdev->dev);
>                         ret = -ENOMEM;
>                         goto err_out;
>                 }
> --
> 2.35.1.1320.gc452695387.dirty
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

