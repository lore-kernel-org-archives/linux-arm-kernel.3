Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDDFCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yERYZKAmasuZ/BSavJp6xCAb/h6Db5ozQC9J2oDZci8=; b=Fk8s0+sChasH+WzyjY90u2Neyw
	ZyeFUCAtXT2YZqKxUnQoV9S4w3O7xJRKHJtMPdgeF5gOnVJY5oje4xukE4MBZLQNCKdjCWEoq4/F9
	VgF1uIc//lmSSdzDTF7TT+0XylPutqf91gX9qMbqcpgzzLctdEcsQF7UDscD+/1DXJvanIWpII50O
	ZopYflOLTKNwOTXviBG//22W8d6DizgM8VA1EHIIwvHylbk5RkcqbUboMlKnDYxzS/CUV1iFwDQyI
	MvLUIVqviZ1npUYslj3ch+19LwMOcgTyvBKShBBmwgGEfgdRdBH1PhhwzqcGXPTd7kNjW2mHO8blk
	T3/0W6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2923-00000001nNk-1W9Y;
	Fri, 26 Sep 2025 14:02:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2920-00000001nLq-26H6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:02:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so2574980a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758895359; x=1759500159; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yERYZKAmasuZ/BSavJp6xCAb/h6Db5ozQC9J2oDZci8=;
        b=KvFp7M/OsWam8oJBiNH66r3eFZmKRoIYUaZYLRD4NztbhW0Z4Qs+AVNFHqcSePFwNs
         49rg4reyGQc0s5TMR5AQNUc00eU0FWP7K8+zUzhipl4nWDb84IY/yJjS7hYKlrwq5WvR
         O3mGopzKjgnYsiMMItnDKmZiHVVh0jMthy79CipeNdg0ao9To4z81hpNjkbqPIUZG0fc
         fy4aIhxsAKA06rQa7AKQtjeZN3Df5wU15L3Yr0e0wqpD2Xk3M7CeSQK62l14pHj/CRDb
         phhYwx3bASseg3Q5NfksLSl9vtVDG7Dk15Ga2m/OKtclPjk82zH9AzS3GtOja2uh5GDE
         OTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895359; x=1759500159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yERYZKAmasuZ/BSavJp6xCAb/h6Db5ozQC9J2oDZci8=;
        b=vP9O4Fry7jWHHaCl/FwAQH+CjNcwDbaVtZQd9DF2fWfGF39ef6xiQSUmpS2np+rodc
         EwXWKq2Uty470m+M4ZlnCHcI+GcVtpJSiWxLxTBqXwWN/xE7YG5k9+mNJSqHv4t7Qkh+
         MnOXdrq+4EVvsKf825Vr0hJ2GrVGM9r5MqKko4AgLVGwUdCTF66xVlzsJUohjlyXXyKN
         qghhewMiZFXC/M1Bf+ZChv2BDTIYKP1V/Hkhx/SKprVmf2woNVf1NMaSpj1H/ifvPeMX
         QfXKYAllHptsFMS04og0pujxqLmSEcOf+L2ER1GKUeSx8Ngv8eN4bh2VrWK6ewYITPpE
         DgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAvHRx4FB3pvgC+8CR+GGAm/Ohqsy6icNLeOOr+bA4IBvz++w7h5746jgTl8mn7yU6t+CmkmL+oaVuFCHurqHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwyzcNogMOyaLllNU9FPT2dUdw+xViOtkT4YpUyQkLLrnBScL+S
	xZqRPPA6tu+eYK7JSjmSa43q2QoOAyDJkHdJfwDHy/JxWGZ2jjZDSKBfrTaeXJ62GeVQYqGDSwM
	E0dS6eWlSytsRQ59Cy7Mg4iEOWP8bgnsTwpC2CwvONQ==
X-Gm-Gg: ASbGncs0jR7Cjcjjw28o+kb/7XYbtxouE+aBsN2CiIjCtbr/eg6Yp0U7yIxMxnq6MRh
	rN4Mn/2iNWtVqE6jWYpbDb97NF9Mu0jrZSr37t7/yMWzf32wBVauGZjAQ64XKq3QbAPzC29YLGg
	XS412CDg6RWiJquJLOc8E0Rg6NX3m6NxJLrfUFI3cyPH4ZVW5tNga9qyc+XIxcPswD+D9rko2eo
	Zi6Mmni
X-Google-Smtp-Source: AGHT+IHXnqoMg81n1oZNyu6iZPivIXwdopJ8n0yiICX3kvwf6T0B9tedJFN2SuTVNDEPDP3oxSRPMHBonvsas5kZm/0=
X-Received: by 2002:a17:90b:33c8:b0:32d:90c7:c63b with SMTP id
 98e67ed59e1d1-3342a2c9fe9mr7941641a91.30.1758895359124; Fri, 26 Sep 2025
 07:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 26 Sep 2025 15:02:27 +0100
X-Gm-Features: AS18NWBa88fxNXPYZZLmzDj39yPWJeoJhvSdhWngZdt82FlkYkX2khplsVuffq4
Message-ID: <CAJ9a7VhAkpH-K62bB5bb9neyu-bemx2n5wROUQVA2e+QRebwBA@mail.gmail.com>
Subject: Re: [PATCH v3 01/31] coresight: Change device mode to atomic type
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_070240_724674_85B2ECF5 
X-CRM114-Status: GOOD (  26.28  )
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

On Mon, 15 Sept 2025 at 11:33, Leo Yan <leo.yan@arm.com> wrote:
>
> The device mode is defined as local type. This type cannot promise
> SMP-safe access.
>
> Change to atomic type and impose relax ordering, which ensures the
> SMP-safe synchronisation and the ordering between the mode setting and
> relevant operations.
>
> Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  include/linux/coresight.h | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 6de59ce8ef8ca45c29e2f09c1b979eb7686b685f..3e5e5acd0c7fcde7d312d440da4355faaf682c7b 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -251,15 +251,11 @@ struct coresight_trace_id_map {
>   *             by @coresight_ops.
>   * @access:    Device i/o access abstraction for this device.
>   * @dev:       The device entity associated to this component.
> - * @mode:      This tracer's mode, i.e sysFS, Perf or disabled. This is
> - *             actually an 'enum cs_mode', but is stored in an atomic type.
> - *             This is always accessed through local_read() and local_set(),
> - *             but wherever it's done from within the Coresight device's lock,
> - *             a non-atomic read would also work. This is the main point of
> - *             synchronisation between code happening inside the sysfs mode's
> - *             coresight_mutex and outside when running in Perf mode. A compare
> - *             and exchange swap is done to atomically claim one mode or the
> - *             other.
> + * @mode:      The device mode, i.e sysFS, Perf or disabled. This is actually
> + *             an 'enum cs_mode' but stored in an atomic type. Access is always
> + *             through atomic APIs, ensuring SMP-safe synchronisation between
> + *             racing from sysFS and Perf mode. A compare-and-exchange
> + *             operation is done to atomically claim one mode or the other.
>   * @refcnt:    keep track of what is in use. Only access this outside of the
>   *             device's spinlock when the coresight_mutex held and mode ==
>   *             CS_MODE_SYSFS. Otherwise it must be accessed from inside the
> @@ -288,7 +284,7 @@ struct coresight_device {
>         const struct coresight_ops *ops;
>         struct csdev_access access;
>         struct device dev;
> -       local_t mode;
> +       atomic_t mode;
>         int refcnt;
>         bool orphan;
>         /* sink specific fields */
> @@ -621,13 +617,14 @@ static inline bool coresight_is_percpu_sink(struct coresight_device *csdev)
>  static inline bool coresight_take_mode(struct coresight_device *csdev,
>                                        enum cs_mode new_mode)
>  {
> -       return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
> -              CS_MODE_DISABLED;
> +       int curr = CS_MODE_DISABLED;
> +
> +       return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
>  }
>
>  static inline enum cs_mode coresight_get_mode(struct coresight_device *csdev)
>  {
> -       return local_read(&csdev->mode);
> +       return atomic_read_acquire(&csdev->mode);
>  }
>
>  static inline void coresight_set_mode(struct coresight_device *csdev,
> @@ -643,7 +640,7 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
>         WARN(new_mode != CS_MODE_DISABLED && current_mode != CS_MODE_DISABLED &&
>              current_mode != new_mode, "Device already in use\n");
>
> -       local_set(&csdev->mode, new_mode);
> +       atomic_set_release(&csdev->mode, new_mode);
>  }
>
>  struct coresight_device *coresight_register(struct coresight_desc *desc);
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

