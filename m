Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8742FCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBuYWmN845KzXqm8EouS+GqPS0z0pBmk0fzQy4dI/Ds=; b=cyyt/QUDcRZI7N/K1rlKmJdIMG
	jPibcd4FsfIcCz6Kjn4pJI7DMpDgvhUnPWBQCyZtCe3R9bNsnVCMmrmfI1HNWzHq9yjxijWCgMMx9
	3ZKygqG1/aodeqGMrzWcUZ6+L0EADF+g5wrhMXECaymTvMd+vrvBdzwf8pSvtXHNmTsa5HPWQIf2q
	xludr2PAPKUj4hP3XPU+r55mOEJMl2Srs6VACh6tA6xvPqIg+dujeTKbpaNObPlBUsZzB0qaMBl5f
	fHwCvG/JKIlz/JYIr1QARujgAfKml3c5yKIzi7/vMuyR+rU4I32cWWDzRQ17L4zm101SUf5josvpW
	a2AC/pOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rrP-00000006MbF-24EZ;
	Thu, 09 Oct 2025 14:43:15 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rrN-00000006Mao-37qs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 14:43:15 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-781206cce18so1186658b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760020993; x=1760625793; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuYWmN845KzXqm8EouS+GqPS0z0pBmk0fzQy4dI/Ds=;
        b=goiQHeh8575U6ChU0pxsfylKmTYQMA4ZRUTsZ4uFrHoq7vPPDZI63d9JPTJzFn8ZwR
         JnvBMMz9sk/N62VhOfmIANiYL0qMFz9wzTdmd9vyPndSAQVKbJFnO00y8fEPgYNhsxMR
         2nlfVpFFhkjRMXmaitezcQJSJcYrkLh5Gn9Hho64A82oZ4Iz+pDlrwD7XWKQe2nagHVq
         WANoQ/ftCjjCz/6YUrIu2zPmIXo9RAvpWj4WBZc0fmwtjaWTPXXafg2Ad8dd49BkxCSB
         ES8NtPvU37s1Jx5RRDLQNB74yY9kmTKdUG4qOtQqlqswpXMC+BxpKtbDdXbx6pWsaV8Z
         /P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020993; x=1760625793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBuYWmN845KzXqm8EouS+GqPS0z0pBmk0fzQy4dI/Ds=;
        b=IOy07wwyrwfe7+l3rnswoSin/KOmwDMiLuDqBcAKmHUyZj+tZxDBYBYzoGwX1JEWlp
         t0m35zX5GA/rua4lbMAX1RBlQaHJ8hpOHiUuWcCgvdLv1+xHip76+qvTAElenvbrE197
         UQwQNeFu5qUcHLIk5Qizel0+4+TqZ+8a/PpwdOzDQFcNUPlda4MzMVc4lKHJ8HUyWpS1
         bFQTzDY2VGKQcJtbzwbPFmcD8E2qV8p2eWoZCR/W5ioK3udQXd72mVL7Ye1fhxOq7yXD
         M9DkaXWmTZc2O0NkzRVd+KDre+CinrITiFlEa4Aka5G42u6eu2f1Fy7QksOTLZFLoDZp
         RaVg==
X-Forwarded-Encrypted: i=1; AJvYcCVFTPMXhTa/PYu19JT10TgJhqovKVysVpBidl1FW7cM9+ERFxrXb7/y569W5dHyGusLLMrJpllpM9153dOLEMDq@lists.infradead.org
X-Gm-Message-State: AOJu0YzOZsCz84cTI4LNvH4m3A939cWkX9Sg2DNwo2BCor95OaaWABKv
	rDSlAhogZu79q90+G/S64GHhLB3XqGWAyUiU2WymdLmQokxUxJjpFPEAJK8Ro+RAIJ3kls6WqNM
	vz04fQclhDxslIVkWpdtPE+U8my3FRJrU6oFMBrOxTw==
X-Gm-Gg: ASbGncsIZe5P4iFvpUgp3wDQ9D6F3a6H9xGAoP30qhDd+GMjeTeP3G5csuyTqvVaoAs
	Kt+lqNmUMfwrTEZkC0ir3Qac3V/pgfs/ilpG9zL3eLcROTLWYt4AzE4EvDmmGJUCv3++Xxdbcqe
	zZ/J8u/dPaGnE+voUhMu/Djglc0MUDZZqKhMPyoP9dpCX0rEMaxAWypfvVK+qi8t0vP3h4IK6md
	A309/VWrhnnAiU8OXT2kbcuvZLcN3rLpRjK
X-Google-Smtp-Source: AGHT+IEunQlJX63RRYRtSnbcqvA/nThaxmg3LM/Wg/qUN5XoyVXwmlx1x6HIDkeVcb27jelR7RW1NG5t3y+7VCGwa9A=
X-Received: by 2002:a05:6a21:33a8:b0:327:957:f915 with SMTP id
 adf61e73a8af0-32da8fcd0a3mr9718293637.24.1760020992691; Thu, 09 Oct 2025
 07:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org> <20251002-james-cs-syncfreq-v3-1-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-1-fe5df2bf91d1@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 9 Oct 2025 15:43:00 +0100
X-Gm-Features: AS18NWCyJUsxXav1BCEdra0zmZObN1mWhTpmYCiev-5sNXSTBfqKeCdcvl0rmhM
Message-ID: <CAJ9a7Vjw_4ZwEBriS5836YdnxMH47e9b_6LOUWEaTxX3RkNtXQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] coresight: Change syncfreq to be a u8
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_074313_787367_7DD5E30C 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, 2 Oct 2025 at 11:09, James Clark <james.clark@linaro.org> wrote:
>
> TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
> has 5 valid bits so it can be stored in a u8.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 13ec9ecef46f..eda3a6d2e8e2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -825,7 +825,6 @@ struct etmv4_config {
>         u32                             eventctrl1;
>         u32                             stall_ctrl;
>         u32                             ts_ctrl;
> -       u32                             syncfreq;
>         u32                             ccctlr;
>         u32                             bb_ctrl;
>         u32                             vinst_ctrl;
> @@ -833,6 +832,7 @@ struct etmv4_config {
>         u32                             vissctlr;
>         u32                             vipcssctlr;
>         u8                              seq_idx;
> +       u8                              syncfreq;
>         u32                             seq_ctrl[ETM_MAX_SEQ_STATES];
>         u32                             seq_rst;
>         u32                             seq_state;
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

