Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD412C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1dCaSUFPX7oQSPWUSDqY5AXt0JKnOLYr89WvUXIZxA=; b=m/+9Bbb9bffeYTjoH2ckk7qtxE
	z/tnjIBDNx3rjy5kELXDy9coFSyCDDshSFMyjFnYX9ZDwt1XEBd/xyCulVQyEbUgNSzazUnsCTg2B
	bukn3NQ5DjFIKYCfDmizxc5ECArwQcY7xaW2wlQNM1iTbcZm6ZE7qoBbuXT8uszYo/441CNxSpLUC
	twfcGSCDyirt14STCWKEwH5oEwMlI2aMxggNLD0GWrlf9YLjOf6Euz14HvHdK8c889BBJDy2sEePf
	w073cTRbJWMKzaSbEXodnGqebtfjGK/W9qwmKReY+wwOOnC21o7ha/4lf6Tk1zGe1OmjOmyCiG+q7
	fYW7ujmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEiz-0000000CSvx-0Euz;
	Tue, 05 Aug 2025 10:16:53 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEQK-0000000CQk8-30I9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 09:57:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-af949891d3aso414106066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754387855; x=1754992655; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j1dCaSUFPX7oQSPWUSDqY5AXt0JKnOLYr89WvUXIZxA=;
        b=Wbb+OAmOEHwnK80uQPftxtFxjKB2wpSwDby7THSMGs4WOgRgG5SJAtHewcYAoot5CG
         qO3GFSiPz5ZVc+rU6X7YLvyzIecGeV5GbdYNryuEhpyNgWnrD0D+dFPUVHF5+gVlhRx1
         ohYpFcDajOLwliQvjlAuzWWgCYfktk4ZbrrdkcnC/yMzSzpD3N8skC0u0UvhXXbfxPPm
         +uU6wu1e6Y0u/41fuBRSDsNVP6vhvc0EaDIyLnu7PhAltLO6xmZVFY4RKd356O+To0h/
         FjDJ3DSAwmfA2s/BBxwERzlvPmorl7BTE/xw2bslcOH/lVZAs+KO4QlkImwdTdJYJEKb
         YL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387855; x=1754992655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1dCaSUFPX7oQSPWUSDqY5AXt0JKnOLYr89WvUXIZxA=;
        b=Bb6kD2vWs6CKkBoy+UtLcn9kFLTsDY8SDVYe/Oy9BC9xoPUlWi+1ORdgENiEW2VLYt
         P+BXuKB4LKeIfHm5UMlVluPGFLIUt3T7L+VfMRHfyIQkhKWgvs02sU4JUczMS3hmwioa
         bUhpPtoBwTAe7FDArZIcuD/9Lh2z2zoOKCqcVZeELWuRmDYtEclyngW9LLgsc4w7lU2N
         iZa6cI1CS6lO9Ft/RVqVmU97D/CQ7uwyqUXZDjNcWoY0qR+ELSscYhNI/IwMPMI5xsds
         KrLeX47BWmfstRvo9p073AQzsFee/csh3/VTS6JITzrOEg5xZgkNeuVnPmmKpVBn1Uou
         eOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV9YhAy/IauzgAx1bfwgLfzMUFgRMk8IKGjU30m4Jx55aC7yJgRC5IjgQxjtorUJVk9KkFKg8w+aJJJ3C7Ob/5@lists.infradead.org
X-Gm-Message-State: AOJu0YyVSRMJYepLQogxthyyecJxKvULMpKnWqCA00XL6RnaMtjhYyFf
	JeY7bk2t0vqJYNeoKGuw4d0TXxvL7NZteUZTbV31+iYjVMSfkKjY2kwc96pHYK0wq7oG7e4UVD6
	fJv7KpUXauzSE85jS8W7eFYbyLLiE8HN078kNw86OtA==
X-Gm-Gg: ASbGncsqVt1WB350tDtS7Kw4QhBZwdggMQKJbWDHMNalxztYVYwg6AuQG7s6tSCljET
	84INMBvlVRqc1qbELxqVzb7yHz/5BuY+8IYXh389ZymWPOM+EgiYh6XEQREVZ0+aZk3bN6hrdca
	7nv2eWvwjbG88dmvLBYzVTHOY0BO2Pn+TL0j3u3qYCj4P6VJy4m/aY6weg+C1DFko7s6niZgZIa
	YRCU/BvoBs5ndpg
X-Google-Smtp-Source: AGHT+IEvlZD/VNvPswq0qzkpyciOynRy9pE1gT8UV2ru4XRiYUpAOjQYu8DTa6uT4cfV47DRtaNWt7ED0s8P+D26+iE=
X-Received: by 2002:a17:907:7245:b0:ad8:9a3b:b26e with SMTP id
 a640c23a62f3a-af94024886bmr1366527166b.56.1754387855072; Tue, 05 Aug 2025
 02:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-3-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-3-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 10:57:23 +0100
X-Gm-Features: Ac12FXwhss0vtHGe63PDzi3zRWIbat4Yyhpujj7U8lZ6-d_UJ9BvOPDeSE-c_zk
Message-ID: <CAJ9a7ViT2BAw6t65A3bbyzQd3Tr6qT_yTa5EGwhKarEipaO=Cw@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] coresight: core: add a new API to retrieve the
 helper device
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_025736_762521_9F9BAAFB 
X-CRM114-Status: GOOD (  23.48  )
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

On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Retrieving the helper device of the specific coresight device based on
> its helper_subtype because a single coresight device may has multiple types
> of the helper devices.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>  2 files changed, 37 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 042c4fa39e55..018b1119c48a 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_sink);
>
> +/**
> + * coresight_get_helper: find the helper device of the assigned csdev.
> + *
> + * @csdev: The csdev the helper device is conntected to.
> + * @type:  helper_subtype of the expected helper device.
> + *
> + * Retrieve the helper device for the specific csdev based on its
> + * helper_subtype.
> + *
> + * Return: the helper's csdev upon success or NULL for fail.
> + */
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +                                             int type)
> +{
> +       int i;
> +       struct coresight_device *helper;
> +
> +       /* protect the connections */
> +       mutex_lock(&coresight_mutex);
> +       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +               helper = csdev->pdata->out_conns[i]->dest_dev;
> +               if (!helper || !coresight_is_helper(helper))
> +                       continue;
> +
> +               if (helper->subtype.helper_subtype == type) {
> +                       mutex_unlock(&coresight_mutex);
> +                       return helper;
> +               }
> +       }
> +       mutex_unlock(&coresight_mutex);
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_helper);
> +
>  /**
>   * coresight_get_in_port_dest: get the in-port number of the dest device
>   * that is connected to the src device.
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index e51b22b8ebde..f80122827934 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>                                    enum cs_mode mode);
>  int coresight_get_in_port_dest(struct coresight_device *src,
>                                struct coresight_device *dest);
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +                                             int type);
>
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>  int etm_readl_cp14(u32 off, unsigned int *val);
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

