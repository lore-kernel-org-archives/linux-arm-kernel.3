Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87248CF8864
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOTf9S7xHymk9oIXZecJskRLDNVQtFSMZQm1V4Y013k=; b=Lx8ArVkFGivOZmcpyCsBrHgnS6
	Ee3fx8Y095dP94CNRQ26xNNx4GLuZms2UymO6z1w9m64BI61WQA7+bbKMtcmUo0RRaKRTLuSxt/W9
	0iMGTS1g2nCg13xPr9noWpzzcNIlVPkxF0311/Afx2PutcTPbpJQwjqUgF8UoCRSiAq4lmHlVCrdL
	NU8t+yzKSCb36vOf73Rx348fsqYtvG9oScC3eWx+KcZVwrBcXB7htgDiOzzxMN4YAhYlOwG6tNDVQ
	gEUmTAY/9GB50nJPkzFcF704Y7rRzJU9a6qvHLoJjPoCGF/u6nWmY1EmUXmMtKVENGOP42AN/nIRR
	CJ8fZ1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7D8-00000006yVE-16W8;
	Thu, 20 Nov 2025 16:08:42 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7D5-00000006yUm-3doM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:08:41 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8b3016c311bso122989985a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 08:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763654919; x=1764259719; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uOTf9S7xHymk9oIXZecJskRLDNVQtFSMZQm1V4Y013k=;
        b=qTRHTBibpJdL0NEI316ZCpZ0hR3GO/5Wek7h0ifBtMeAFjRtTuZUJ6fJYMcITl/vDp
         aWoBz0am43YP4uuySXLU8yZU3Hbf5DnU3qX9dj3CVJd3fiNaMYZ1X+Vwb9nNv0fLOQrP
         iOuF+d0ykiTJNhK9pLqs2XQxhPjQfZgBZ3s29RE2fFn9HFeRa1rf02sbLJRJcerMv4gn
         SZuptXAmR6nZ0mccFXCGoM0YP+8Mx2PzTUm80yQlXLIUT/UKDv12Mu7+qhyipp2vqqty
         7VghHc20GFOhmPrLLbvMz37QgMdlnrS3PDKjU5jATPqj1VdhRU5RZYA4S757mrjrcCNl
         UHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654919; x=1764259719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOTf9S7xHymk9oIXZecJskRLDNVQtFSMZQm1V4Y013k=;
        b=B5GB2Rwf3V0/SENy5viY1VLaSKyQmy34IsfbPvtLMX9p5L89c4cYBtce+XWat/TCXT
         CWXqzkB6nbQY7wmN0ZdOXN8pcu9xNpup/LgiMoXW/EwjkQyPQ4aOw7T6JuYGJWlxYqEV
         8owPfA6s4Hu/TntZpT8QeWNwSJg7h+02bKitE7d+f2T/7UTW7BzptFyTelaFQSlL5XL+
         9epL+R7zcbqRdSefAPKTOpzMd25VYny9WFL7z0X/u5vh4mWkl+9fd2rVpX3PyEkfzafj
         9C7LOnjNCLeXKV8RyBz7ZjU0BJCcVoVeflhRmtHIioEYpoQSqcNKJ3ieXYivsHwZgIWA
         NLPg==
X-Forwarded-Encrypted: i=1; AJvYcCU6A+pcJHI92QbO1ETfytI+DX4+QYisDtvTuAQfd9iRsISA61our4aGoBXs4MIW6o/Xkvh2K/e4YJ8EZa+ZzJG+@lists.infradead.org
X-Gm-Message-State: AOJu0YzydE/gK81eZRyeHHX3ejdm/R9cDkRC1kxqQiBpsxH82fQBdmD/
	5dSxAGxFg79ObS693GM+fano7u3IwMbhvkaPUd24AEXbWRbqdj5qmM1/7b5yS2JISSCnnpjF6r/
	4ZyGuhOkYHC1/FRgKoe+SW0aTxJvkT/tYQyN7f9bjLw==
X-Gm-Gg: ASbGncut716DOLIoRmrYn7DQ3uJt8kjQm8jIDcRath7OS55ChVLuCaS7l/NZAhk4ANV
	id6IrxvEPQv7c+PpoRZQCqvPJhSN+okUnv9uHQyJr9YnlUduwZAeN3CZXgIIbBQ4y1BWsutE+C+
	uPtFxZJ173dUq5IiiYUbEmhKglq4PDyDAGHQAiF4cP6FZvODtTC/F6GRks5YlCzxIJy6oFXqxXl
	KiHw/uUw6YGcIPTywvpANIlvoRmD5G7OBKTFsr0rPKbWsIZF8XIrBZnZEbzGn5SzQwHD3zE8Wyd
	IEdNOaB8AI2atPR17hvR0NiNwnvP6f7lvdF5DFA=
X-Google-Smtp-Source: AGHT+IFLx8E2F5La98nR7s8PPS6EeikU6vEKSuMTJWEatwPG683yA3+U62ygZBdk3b3M+a+Rn3jIeVdPgQ2Gb5q2WsU=
X-Received: by 2002:a05:620a:458f:b0:8ab:58d3:6030 with SMTP id
 af79cd13be357-8b327375be6mr523446785a.57.1763654918545; Thu, 20 Nov 2025
 08:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-6-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-6-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 16:08:27 +0000
X-Gm-Features: AWmQ_bl9M1ynp3JPBXPP442GDLu0IwJ5Tve9fK-Dv88s5Tw0-xLU4rwmVWxOX88
Message-ID: <CAJ9a7VjKrCJf6Ec6QTx1T91KSj-ihpswDqJaS0vhz0joqV6CNQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_080839_918569_66A13761 
X-CRM114-Status: GOOD (  26.08  )
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

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> Currently we're programming attr->config directly into ETMCR after some
> validation. This obscures which fields are being used, and also makes it
> impossible to move fields around or use other configN fields in the
> future.
>
> Improve it by only reading the fields that are valid and then setting
> the appropriate ETMCR bits based on each one.
>
> The ETMCR_CTXID_SIZE part can be removed as it was never a valid option
> because it's not in ETM3X_SUPPORTED_OPTIONS.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 24 ++++++++++++----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a5e809589d3e..4511fc2f8d72 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/clk.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <asm/sections.h>
>
>  #include "coresight-etm.h"
> @@ -339,21 +340,22 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>         if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
>                 return -EINVAL;
>
> -       config->ctrl = attr->config;
> +       config->ctrl = 0;
>
> -       /* Don't trace contextID when runs in non-root PID namespace */
> -       if (!task_is_in_init_pid_ns(current))
> -               config->ctrl &= ~ETMCR_CTXID_SIZE;
> +       if (ATTR_CFG_GET_FLD(attr, cycacc))
> +               config->ctrl |= ETMCR_CYC_ACC;
> +
> +       if (ATTR_CFG_GET_FLD(attr, timestamp))
> +               config->ctrl |= ETMCR_TIMESTAMP_EN;
>
>         /*
> -        * Possible to have cores with PTM (supports ret stack) and ETM
> -        * (never has ret stack) on the same SoC. So if we have a request
> -        * for return stack that can't be honoured on this core then
> -        * clear the bit - trace will still continue normally
> +        * Possible to have cores with PTM (supports ret stack) and ETM (never
> +        * has ret stack) on the same SoC. So only enable when it can be honored
> +        * - trace will still continue normally otherwise.
>          */
> -       if ((config->ctrl & ETMCR_RETURN_STACK) &&
> -           !(drvdata->etmccer & ETMCCER_RETSTACK))
> -               config->ctrl &= ~ETMCR_RETURN_STACK;
> +       if (ATTR_CFG_GET_FLD(attr, retstack) &&
> +           (drvdata->etmccer & ETMCCER_RETSTACK))
> +               config->ctrl |= ETMCR_RETURN_STACK;
>
>         return 0;
>  }
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

