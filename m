Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5C3CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo+AxuGslDkd5fbnQiWxgtbbd7E4IX0SMnEbBhI36a4=; b=Nqz51CTys3plfVTFupLUurLK28
	izytlT69Z9rXHnNZT0hqZat7qwprJSoEyrHY4Fnjk0tSJSr01ghENXWVIVqkyCviuUY8AQCDIPxSQ
	/wiLIfHot9RZd+FUy0n6fi3wxHarO1Z0MWaDk7z4YNqxw6j9LqS4BUTsGW/9ewKoeiez1H8jbnXea
	XmaJ5y8MXIoPsavj9GtMfWRLWC5evYz+H7Px4OmQEFKd6UQcuBU/nqIiSEaMmsk3Oz5ZAO9V3bZkB
	IeKQWvByD1W4jZEcv8w+2xTONC+/QfOfOvB/Et+VOKNt77oAucC14vJTvOcAUNlPJGq65ytNybzxG
	jD+xxw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjAP-00000003rko-0JkN;
	Thu, 11 Sep 2025 15:24:57 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjAM-00000003riY-1Eih
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:24:55 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-72374d6a6caso9175136d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757604293; x=1758209093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zo+AxuGslDkd5fbnQiWxgtbbd7E4IX0SMnEbBhI36a4=;
        b=nLf/ZunIcIdoAZ524jlHc/JzSMx0vE/Jtvy+CtBhw34Fad3j0pJLeF23K+6SiMSfSf
         rNReBcoEH5iyKCyPR1UvymCMd49NKY3AYbQ48bCqFfJw8iQItQkJ/qcrfXlg16sWZScA
         GKs616cBAlelAIzmTfaT6RsBdTlR/rE1gls3ks3S6Q2wEEdiPoLpy2I+ZQaB/MEZ7xxb
         1pgzFC+UDkhBO4jZDuMQ82wphpyqaEc20ngZ5btSS5o9I8PZvY0s1cxUkKQFoLJb3Pv1
         MBb4mCzQXv8CKkPEG9lHyLjDYzeIrknIW8FMKvAWmY7RMdEAfDuB9KIJU2KkN9l2C7kA
         H9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604293; x=1758209093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zo+AxuGslDkd5fbnQiWxgtbbd7E4IX0SMnEbBhI36a4=;
        b=CUU1Iy33+eOopxrp8nvplXEZt9oNBFrr0WXBo2945qE0UiGz9hYiNjJzJuas1IQRFl
         0YB9pxUL96czLKIvIJnKfHhTEPttbSv0kdoyM2PjL06O6ERn51GABSm3dDuZacinLyQR
         +tE1VOqZLN3H0m3QJ6X8jWnIOyG4m5KPzVsuCp8HPsMe8lTiSRRoqAhaJt122WrJnAL8
         bpu80lXgMxE5oUcN8+lmNINiG4fdhKoUtRr3B+SheLRaiJQqXEN4swQg36AEsGLhaANL
         BtIbsotjvm+TKSrv3cgFygdrIq4Kdc7sI3oE/kboonLxE2yX6ZWwtS8qsvlzZGpJ1AJa
         WzWA==
X-Forwarded-Encrypted: i=1; AJvYcCVbm9Hvkb1gREbD0HvQTTViy903v6lQh/kZm7uSB64xlunOJSCuh1DSeqUFHdHaLnpLo3c6CGEuRo4UzmmHjR5g@lists.infradead.org
X-Gm-Message-State: AOJu0YzDUAq2w1nIkfNWP76+Yp6doLPW3zBru1Ie9NYRe6oz4DMJHe/g
	5tdOHMyzXUdOxdSPKQHqJAkGOzGJIALxe/4WzG96ZNHUQChzHoqANnPo0DOL65jaR1g=
X-Gm-Gg: ASbGnct9eRZZUgCOUq9Em/wLJHl11GTZGWYlUBO3nTAvNkvSIx5Nol0KwrFOzD6j72R
	5e5/w3Umgs3LF5K1GvBhYM1kukU/lzs9QYm9MiIQuCPPJmNOmp0rdszHIB4zLYD8D0mj6n3es6w
	BvxzgyyBhO9CO8s/JHoY0M5NVjxPkQsoKp5isk78+lRBi0Z/hngAcPkmAuO2cgQ9NEEAq9k9fr4
	5adYJB5kLVrIvaSm3lsLo2zulyXKeCKIgSnhYXaOQ1GB6rJZ66hOddSymbxuGlRDNdUWujOKoYh
	k8AefDF5+F7/HA4rQaTGcHq+TI3Go1uXlITofumX9IOY2FTx0VsoBA9hvBdE3Nxc1NYdGy7GVvv
	V51cgzvSXzDK+zbwXJ93/LjquLF8=
X-Google-Smtp-Source: AGHT+IE9tYO8ouJst9OcD7maW1rdkSEF6jg7RSes/lxL3wo97/ZLhXjCjQhjWkuTW0RobiHij/g4Tw==
X-Received: by 2002:a05:6214:c4f:b0:714:6e57:5517 with SMTP id 6a1803df08f44-7394040cd65mr236155426d6.55.1757604292596;
        Thu, 11 Sep 2025 08:24:52 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b642265bsm12389066d6.27.2025.09.11.08.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:24:52 -0700 (PDT)
Message-ID: <c818c25b-eab5-42a3-88f1-e190fc303ddc@linaro.org>
Date: Thu, 11 Sep 2025 16:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] perf arm_spe: Correct setting remote access
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, German Gomez
 <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
 <20250731-arm_spe_support_hitm_overhead_v1_public-v4-3-58e5677a412b@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-3-58e5677a412b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_082454_358308_B9154610 
X-CRM114-Status: GOOD (  16.31  )
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



On 31/07/2025 2:25 pm, Leo Yan wrote:
> Set the mem_remote field for a remote access to appropriately represent
> the event.
> 
> Fixes: a89dbc9b988f ("perf arm-spe: Set sample's data source field")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8942fa598a84fb70f8c66649395bfbedcd42d380..8ecf7142dcd8705c13c27e0cbacd69647dc4fd22 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -839,7 +839,7 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>   	}
>   
>   	if (record->type & ARM_SPE_REMOTE_ACCESS)
> -		data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
>   }
>   
>   static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
> 

Reviewed-by: James Clark <james.clark@linaro.org>


