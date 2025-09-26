Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6DCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mr5aJwW4wAI2vyKBRO1R/nq3zNdsUd1leNYk/2x88o=; b=3MvBzfklmnMDKAhMGWU4EwaqMu
	mlfrds55kJMe7gUhbFLEfwojTNqHSe2l+s6U92BnTqA3Y5mdIYc6a/+rKc3VLg+ofjML+SY+/ptt9
	aUQucuW1Nfhv/qhFV2CHkh5dvdjGXVR4KZe97T4zpgqD0C+gTS0hAoIVPEp/bzukMsAZiXbsgsIAk
	PUv/xYY5k/mGjFM5scVwMIp4evgTpFseVjw/IZFM0QRW0RNBzV9ynAjMi29eFlRJJ6xqa27qkGHQ6
	G1SsMRK0boz9wVZ0K+1jye0i2R+X//XJpNiX21mJnHWCHq4SHAKRt9etei4G1wTQpYQFC/UaT0yG7
	QPrkm5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Zr-00000000MEt-3qY8;
	Fri, 26 Sep 2025 10:21:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Zo-00000000MCy-3F0v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:21:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3307de086d8so1834124a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 03:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758882080; x=1759486880; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2mr5aJwW4wAI2vyKBRO1R/nq3zNdsUd1leNYk/2x88o=;
        b=B1wrIOCEgLJ52Dlu7YlD5A6wgKRWxs7VAi0Y9vYXDX+vLEydIrduEKDrZjWdU7xvog
         5gIBPRVUGaYzf8Mrd60YiGWNJh0tkClLXCuXEqXW411RQ5BShDTJqs5mSEKNH0a0QgSA
         FDeESQ0HfbQzTHie7lupFfPbo1AEPcl0ny4TsWDpHO7zamNX7YMgQ1JkZnxEl9vwXLBI
         AytbQbaIf7QZo5cMo4YwT5Oxw/bWaCWCsCFzNm0qoLt/O29xiwT7zC5HE0RYZjDF8a0I
         ScQGVQEv35FhzFyAEK7oA1ojXP1/UEjFDx4vB+A4lW4LgqVDotjmz9ZUGloQ+sgAR8i8
         UbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758882080; x=1759486880;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mr5aJwW4wAI2vyKBRO1R/nq3zNdsUd1leNYk/2x88o=;
        b=W/f6YGP8VMrVznohmNfeRig+sOJz41BeSbwsM+24eHPzP4RpH8g1aDIuCi4ja7hsRv
         4Kf7k+TrQGSlyDctI/mzjstdf1SuBn1JjLXIMItdt1wd8kLQEwWqxIJ/3yDAruYPthiy
         gnxAgK10PoMZiVgEIlVJcoqbBUyJIAmpDP+snT+2QOcweDp2Y3jT1Ei3VM79s43qUWlv
         1vJMYcD2HHOiMPCkYRqRiH7+/4bzcR3SJBeGVUf3h4/o/chKBab7uUcHWs6egFrdkdSx
         qAeLcR+TbJlXMgZ0xl93AF9YSejxpaOMK6Ib0yOIlI7J2ZfAtg8EZlOA9Je5UAqdXC9H
         /4Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW1bFJNO1PNQ+whX3CFSzQi/CC/koBHYn608C5kuCQDH4eb162RiJrkT0i2YveQzQBtQDs1wtk7O7gVe48AyOHY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyffr83dqBNg440ypyt58e+jfq+KsZ/57C/zgBFwzvhQ1Epu+Cp
	aQmlRFDxiseLwMGG+5SuHJSnH6ES8YOEW5ANsxnHn71pg+V0xoOs2Si634toKVdul/5s/6zybnx
	ltteQ2PKI2/GmfA9LnpiFEftTJu7pfiWzRcmSdjWZfQ==
X-Gm-Gg: ASbGncuOYpfz6NO54hyttLQxLON5yVqmdAL3izb72eDu5KdjLO6F5gqgWdD3Ibq2lfL
	E/hDafJmNsVi7ApOWGqSOGQijEM0GEu7T8TwAwU8ZlQ/kKIyxj14OCW2sZnQFSp2cacD4gftFXG
	b3mnI6llc6rVjo6VDCktwZTVQiT4Kt+J3L6pFnALkGQextU9vvdxJuTW1u0wKqOUXkd+axE1vZe
	QB9WA6M
X-Google-Smtp-Source: AGHT+IGx5TQff80QO0H+uGd5EVhVYxJCBwFurE7WVV2W6BaaOB8VqMiaLcn0gpb/TEw+CJaxPeEGQwapz1T31R+d5qQ=
X-Received: by 2002:a17:90b:3d0d:b0:335:21bf:3b99 with SMTP id
 98e67ed59e1d1-33521bf3e0dmr3939591a91.32.1758882079945; Fri, 26 Sep 2025
 03:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250925150342.1845615-1-sean.anderson@linux.dev> <20250925150342.1845615-3-sean.anderson@linux.dev>
In-Reply-To: <20250925150342.1845615-3-sean.anderson@linux.dev>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 26 Sep 2025 11:21:09 +0100
X-Gm-Features: AS18NWDJehMnriuMz3z_2Gkv2PoEZlCnJuZatZK4VbOhtcC_WJxBmY3Hkz6rCyo
Message-ID: <CAJ9a7ViB1GC4d9D01KPdJTtkxc4EfvQgHAzh8uDU6Dwim+zGBA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] coresight: Reorder coresight_device_release to
 match coresight_register
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@arm.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Linu Cherian <lcherian@marvell.com>, linux-kernel@vger.kernel.org, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, James Clark <james.clark@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_032120_818440_183C5EB0 
X-CRM114-Status: GOOD (  17.14  )
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
> To make it easier to determine where to add new release actions, reorder
> the actions in coresight_device_release to be the reverse of
> coresight_register.
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
> Changes in v5:
> - New
>
>  drivers/hwtracing/coresight/coresight-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 022c8384b98d..305b1773cfbe 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1046,8 +1046,8 @@ static void coresight_device_release(struct device *dev)
>  {
>         struct coresight_device *csdev = to_coresight_device(dev);
>
> -       fwnode_handle_put(csdev->dev.fwnode);
>         free_percpu(csdev->perf_sink_id_map.cpu_map);
> +       fwnode_handle_put(csdev->dev.fwnode);
>         kfree(csdev);
>  }
>
> --
> 2.35.1.1320.gc452695387.dirty
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

