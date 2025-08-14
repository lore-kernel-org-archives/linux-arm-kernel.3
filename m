Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37293CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/SKouLfB4Dt96a+piQ7gJ9WekR4y2KBR6TTQHeQMIQ=; b=k/k5Tqabf6FHxg7DnNg7h70A59
	6C35bDdHswrSEQ/vP4mK6UbHu1+OQeVRyumq4bgKoe8qYszhIwyY1ePnpocA4udtuKBIJkTp9EoLa
	H2UbIjJfpm0F53sNARMKFwCIbjln3B1ThKJlwITE/iuaSSa0aX+8uisrD4RlFhSUl/k3R7vLyobqZ
	ShykRMxBtuYdy0uJgjMfrdNmPJCGB4pYBte6sI0Sz3az9TpxENXEsLl5qXsxlBvGvOpfrGlMRyWGI
	YMMEUQtZUkycSRrUP9EH5LLIG6Z/VrQFc8jAgBI66zX4esTCVSCb6wUNCftlKxOAcXpVLPi/5fjDm
	lUr+NFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umY7L-0000000H4K6-22lC;
	Thu, 14 Aug 2025 13:35:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXDu-0000000Grf8-2fkM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 12:38:27 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-32326de9cb4so796557a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 05:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755175106; x=1755779906; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/SKouLfB4Dt96a+piQ7gJ9WekR4y2KBR6TTQHeQMIQ=;
        b=VqpyLIMC7oQPeqOBdownRIIjkOqCgA2Lb4xx3Ddq7W2bZLR3VKLq6F1li8i0QLvByg
         vUSRVOOm2MGS4ux11MSd3VDKjZ6V3zsnghxw5WX9DQVnaZpD5W0TWZbZjJFqj+2gGutB
         YLqxBk0XOnkJekuGwOxJP+H6zjNod3f640Ai+bSVlvpmz/phSYI4C35t0dzzdsNeOaxr
         1mfaTv/FbbVvep+G2VukEAV8HWUuE9ggR/D77uVKW+Vh11WgQeUCARMWVTjylIrTaObQ
         XvT/Gc3bRj/gUFQj76ERkooYzJYaVha9ofWrpSaZ07uz/tmkyfK4+4EaEX0V6gN3eR0b
         gWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175106; x=1755779906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/SKouLfB4Dt96a+piQ7gJ9WekR4y2KBR6TTQHeQMIQ=;
        b=SAi0G/gOIzeP3SYyPg0RakA/dc7ZEloBXzHcJx195j/28Z/pn6ICKL9qnVjmOUS8yH
         89i5Md6aficdWcNo5eX9TX1QIk2zxIy4hR3FVBd9+hIM/rVVvRyUm5eVtFxi0SPuPQbH
         bL8rHAsj89sBrgYwHT9e5G0MXus/pBViGz4kD29doj/z1xfCBdKQlCUtvnwE92WSciWA
         FWWYAg+iJ+JjHhgRt+xy2vgKkmmytPH6rWIEMfmfANuYWWYvqPyKyS1zPKnTqiGjb57U
         IoeLhRXPvgNqjW+x3YVvglxzPmT1G+uJD332cAkGC0JOitN/9OlxydYYE7PjvFX5Kfvs
         vn2g==
X-Forwarded-Encrypted: i=1; AJvYcCXIhoqKVAH6ctaouRvTTnKvfh/IEXjRQe/QU3QHJ58mayPi2epKzp0sPrQh1HPAIessEu45q+jBUSAmGvL89AiF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8bViBW8PQwX28Fx2TflGFgFTt7vzUt3qNvh/D6Cg820P0HiCA
	UvAPCPeA+wk8VI9UvTWfKCjhf8y3c8QKDBFLCi9FdhNhQi6r38B5t0H1p0cUNwK5hxsJnzVOPnn
	Fyi3Dc6l3TKi4gjHIJ/j+x9Xqam8yeFE+pjdC0psu8w==
X-Gm-Gg: ASbGncsaOttQOmOC4MNRbe4rQVKgFntpTrneuSO5IFQzxbp1rDJtJs+YXGibt1rsc32
	+D/mHbuh3d5qrYZs7EObFM1uxTeaLho3PEk9eF/iaLB+Edcih93Gt4tuiRGI137lULrTYgvUm5i
	zUUWnbe2GI8SJTXNiXRrqcOag9sBnAJOV5PcYmSNy/bvwr1M2DPxmYQ0FWdWVsqVvoZLtRjX0Pr
	Selzht3
X-Google-Smtp-Source: AGHT+IGSclopDnHf9B3zonnvXINSROJBoUEpQ4myknxB/jv0JOS4+2qsCtwFneFqnIPDyDUqajH3gvHZEPoUUbizmJs=
X-Received: by 2002:a17:90b:3e8e:b0:31e:c95a:cef8 with SMTP id
 98e67ed59e1d1-3232b7b7707mr2940353a91.32.1755175105752; Thu, 14 Aug 2025
 05:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org> <20250811-james-cs-syncfreq-v1-3-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-3-b001cd6e3404@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 14 Aug 2025 13:38:14 +0100
X-Gm-Features: Ac12FXzyxxKA_BOyrBNq7M0owGv4_wTgorvEm4dWj6LYiHxzxFQ-EPbV7AZ31P0
Message-ID: <CAJ9a7VhXAhDHkpyA6gHWPfr+HAEFLEPa01vx0n=b+82TrEMUTQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] coresight: Repack struct etmv4_drvdata
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_053826_675629_FA577E96 
X-CRM114-Status: GOOD (  14.65  )
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

On Mon, 11 Aug 2025 at 10:32, James Clark <james.clark@linaro.org> wrote:
>
> Fix holes and convert the long list of bools to single bits to save
> some space because there's one of these for each ETM.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 39 ++++++++++++++-------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index a355a1e9606d..1c67b263b01b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1020,29 +1020,30 @@ struct etmv4_drvdata {
>         u8                              ns_ex_level;
>         u8                              q_support;
>         u8                              os_lock_model;
> -       bool                            sticky_enable;
> -       bool                            boot_enable;
> -       bool                            os_unlock;
> -       bool                            instrp0;
> -       bool                            q_filt;
> -       bool                            trcbb;
> -       bool                            trccond;
> -       bool                            retstack;
> -       bool                            trccci;
> -       bool                            trc_error;
> -       bool                            syncpr;
> -       bool                            stallctl;
> -       bool                            sysstall;
> -       bool                            nooverflow;
> -       bool                            atbtrig;
> -       bool                            lpoverride;
> +       bool                            sticky_enable : 1;
> +       bool                            boot_enable : 1;
> +       bool                            os_unlock : 1;
> +       bool                            instrp0 : 1;
> +       bool                            q_filt : 1;
> +       bool                            trcbb : 1;
> +       bool                            trccond : 1;
> +       bool                            retstack : 1;
> +       bool                            trccci : 1;
> +       bool                            trc_error : 1;
> +       bool                            syncpr : 1;
> +       bool                            stallctl : 1;
> +       bool                            sysstall : 1;
> +       bool                            nooverflow : 1;
> +       bool                            atbtrig : 1;
> +       bool                            lpoverride : 1;
> +       bool                            state_needs_restore : 1;
> +       bool                            skip_power_up : 1;
> +       bool                            paused : 1;
>         u64                             trfcr;
>         struct etmv4_config             config;
>         u64                             save_trfcr;
>         struct etmv4_save_state         *save_state;
> -       bool                            state_needs_restore;
> -       bool                            skip_power_up;
> -       bool                            paused;
> +
>         DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>  };
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

