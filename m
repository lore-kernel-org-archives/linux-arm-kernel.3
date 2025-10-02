Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2C7CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFW91oy4iNeP+LhOHuzGL1AC4jDdEQLn6CXSTnCj1PU=; b=1qxrFxEdCTs4QHbyW5lXnAxaE4
	MwGcw6kmbd7fIoLCvE57Gzn1SpNBrlTUiXRBD4LViUEH6BXMXr51bmM2guGmbCe2JtM0ZFQzTLuwL
	NMmA5wBBKfKfS+NgkBBEnHYy3yOFn/KK8v0BWbNc5m3w0LD2MmrRMEj9NcmpLqcj6qXgpnAOcskta
	KWZZMMvhHsMWVrLhcZAKP4L/iHkzBQQvlgIIuginnXlM8pH6byb5MqCVo0KhZQmRprvw8xaFRGeOO
	y7rsQ2XSuG0n8dbyf7X6A9feWKkrvmrGwkvZcV7RfkNID+aACDs4P1tz8F8UeQxcVAWbSF6faNs+8
	USGyd/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ige-0000000AT8B-2Jfc;
	Thu, 02 Oct 2025 12:45:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Iga-0000000AT7l-3fkO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:45:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-781251eec51so952175b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759409128; x=1760013928; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFW91oy4iNeP+LhOHuzGL1AC4jDdEQLn6CXSTnCj1PU=;
        b=WRoi3JTrJxiW/wiY4syz2gXXMr4aYaDU/9U/QjgePtmNketwpg+uo2NmuicSwZHeNF
         0TgExHiYXVL7HNdhJjg0vrRIHrYb75Z746uZ4hgIn05+h/t3rFwdB944D48vCYhCIh8g
         VcdT7dNmSsEoBJbRZUcheyN1ywScrL5ndYoLMieeVVBb21dX0taqMEHnK9XDGswCICJ4
         Hsdcv5WG7J2fVLjMAP0RYGYlMTdhgYxOo8Ieb1aeeF87evZNdGLsHvImhNzSSfEYnkGb
         PdNF5wD9Ar+NUfxM35YV0EU5rxfZ7oQy+32L0aOnue96HR/hSmFqUWj0g4LJwQHZNRxO
         QMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409128; x=1760013928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFW91oy4iNeP+LhOHuzGL1AC4jDdEQLn6CXSTnCj1PU=;
        b=cyK3/I79QsccvEI05SxLQn9WW3ZpA2gXTOK/hzFXllOWdZmCPbbDrwhsr8DfPM0vyC
         YRTiWQ9cU+t7azDwcmdzin1zxY6H/pW033+Q1UyYKU+WYyp6Ku2mnqBx0lsPPmpJrF2J
         Xtf5t7B70pHMVd0hNxW0dKThgqgtS5NZIWU242giDkwTwKBUMugDtGCkDWViO3GRFdYE
         MHH2gR79AvGYQa89YEOhOKxkpTJwtNoBS1yXhlNyZb5bzvfzgHWRRUHIB72yCHIIV/7R
         fBtKBgX4WRRjOUOC5nq+p9/iv+jnjqhw9LpUQEyuSc+N+saPoKXqsqAziaJjjRAhsVwN
         eybQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs+AF5hHfp3QOFI8Hpp67syj3tpaoMZqfzRg6Zukr+olK9iNEwjr92hk8Vsx1bQ3A0GamPHfASpPmKWkHmIfJz@lists.infradead.org
X-Gm-Message-State: AOJu0YwU/ISt8jpYHfJ2A7Sofgm7/8ikdyBG/1JtHUswMFdMBgD3VfJ5
	apxaNic6VgEQUGCv4fIrSHhFWqryUh0vNQ1Gq15rXmO9IdxeNfZQOZu4iZPmsADGGe240RZKqSF
	8WAHqP1E0QdcIWag1s9iNO04SaETj6Bvqqv/R7QCgEg==
X-Gm-Gg: ASbGncsM3xeKUi9TSHoDUe7o8sbrCrTC5xbSLB/Bod42bkRQQihBWd59zwAQMqeMtcT
	AJmffZUcYVXeeLZ/WiZMPfAGjqkK3B9DTJ1z2WFO0LJ91RC7Vs5Ya7QENZDFpXAf05LxELs0VMn
	AsKPWLOiBvBwMG5OGT3YfD90giXR5gcVpyzyDI9xG1gYRgI1TIWAwGyWzDqpVMQXe9OM71tzUlf
	JE5TvYnehBZPd6DwjpoJjEJd0wb4WWWY1T/
X-Google-Smtp-Source: AGHT+IEtVhmoPlpmcY23WcGeECAhQ2YeZsvtdCyAKv4bZ9YCD1j/DNgSJWMdWYBBXMImS6YQn/uXlGJghUsbaWAavjs=
X-Received: by 2002:a05:6a00:2e11:b0:782:2b62:8188 with SMTP id
 d2e1a72fcca58-78af4171b08mr7986059b3a.15.1759409128029; Thu, 02 Oct 2025
 05:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-12-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-12-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 13:45:16 +0100
X-Gm-Features: AS18NWCxsRcNQAx6i28aC9p4VC5s2qE6xqNu10YRRKfvFwFGH7Q0NOY905q01KI
Message-ID: <CAJ9a7VgJV0pZVkW=z9EseMDDgAz5ippkOZZ_Pm5Z8VvTCQ7Z4Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/31] coresight: sysfs: Validate CPU online status for
 per-CPU sources
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_054528_920345_04CA4F3C 
X-CRM114-Status: GOOD (  18.80  )
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

V Minor issue - could this not be part of the previous patch
introducing CPU ID to csdev?

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> The current SysFS flow first enables the links and sink, then rolls back
> to disable them if the source fails to enable. This failure can occur if
> the associated CPU is offline, which causes the SMP call to fail.
>
> Validate whether the associated CPU is online for a per-CPU tracer. If
> the CPU is offline, return -ENODEV and bail out.
>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index 5e52324aa9ac7b3de9379bc3f2b349a2cdea83c2..cb02f1bfaf068ec3f50f997bcb94f7d5215ccea8 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -162,6 +162,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
>                 return -EINVAL;
>         }
>
> +       if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
> +               return -ENODEV;
> +
>         return 0;
>  }
>
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

