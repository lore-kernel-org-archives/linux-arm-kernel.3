Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69286CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx9sm2SG/XPK/zOHzWrJwHUPoT7scPpd+/H8+WI3Eu8=; b=HamR9OXUGJ7i7AGH/uzXV38hE7
	doeAn7saTJYSCZMfY3hDZeanrtDc9bHOQ6Qwdfu8wwBN96YgGvW1p8MTFqMTiX2RNjZCtFU9L9Iq5
	Acby8YlTtfdnjaN6SV23hMnHjrrhth0uKJu6oRSN7EaM4E19MWRVt1TlExmiQ3xsJ5YLP4kMK2Nqw
	Dw7mvmBnJ079k6w8Rf882RN7/kpZMJJY52VQijGwqKPvYNCvjGTDxMsxYCPqEeorsure51ETyv25Q
	/ecsb8X8zbh4iKL2rtJyzEBz12TpGVn5LdN2fztqH0izbs6X2aCzrBWSpIyFgemp04SEadUstQlEA
	L6ugv5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1m9F-00000009Tqb-2tmE;
	Thu, 25 Sep 2025 13:36:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1m9C-00000009Tnf-2sL4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:36:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso788920f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758807393; x=1759412193; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fx9sm2SG/XPK/zOHzWrJwHUPoT7scPpd+/H8+WI3Eu8=;
        b=y2fAi3SDIZga3tXluwyiU0hyDNaHhxT6MR679YoEWZnR2GQ2sv1V+CMZUxALQos4oC
         cx8XYXm3GMeZHUSHZWi8ovCRk7or4EBde9xrpB3JD1F36+LgzvWrrtzn6HqUS4EhpdOx
         i/JMT80xL89ZLU77qfZiro0G9qnMuxvhOMPcSKOAAxX8oWRMJF8KRIy6gvtKf6XJnNwv
         lVuCqkqmN7pZ8q9CS4v2EpS5X0fkZVBnMzNU56qytWaQodO27TNuEXOG8Uzg4MzRbpNx
         2H9Ja0VKTC5hg8VqI+bHYv8SK5urvTXAszqttosCvzsQxP1GE1RKMq5rVRtcIBEdx1mB
         HsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807393; x=1759412193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fx9sm2SG/XPK/zOHzWrJwHUPoT7scPpd+/H8+WI3Eu8=;
        b=McnxF/vyhd0xftTtKKPPfcW+q5FRPwqqijAYqu6Cx68ARb9tezgBn+Voonndqo/z16
         /HqeljPW0e7QBaVPv1/fUo94Uu52CAn+Sr/RGBJq9MeJTvqbTmXDfTDriUu3235CZ0aV
         BkXg7nz2FT+AvdG8bDs+zJoU9drv9iS+3zqFU6QV8aYx+jqPKk7j8Z8vel/mquFACnux
         zNGNciA93HRDV2ZGmplsnpqQlnAjxUvJk0Js/vqvfnMzKRyjsne5MfaIzillQlS2Mw0w
         5DddM+kyedurG1pUKPWP3JFgmNI5SCR6acwJPtXNHfXC7z2sEvhy/J364LARla4iEQwl
         5NnQ==
X-Gm-Message-State: AOJu0YzFC/ZGII36Kp94k5TomcEqKwuGT47b07lm91yArSIDOO1bGvek
	GEgW9xOz33IeU9E3NRjfFlgJrYgj6JqG8oI2BP120OEjL0Sl3LTOel8/LJBxUXEgaGc=
X-Gm-Gg: ASbGnct59wH7JzYeh1f51DQqsoLbF1pIJU/VlKDpIzpBJvHt+4WWqSnSMWGKUGF5ty4
	ZG/KuVqRaY+nVhVNMuzpkGvqTkwSHJSvxZkTL10DB6mXdWPhVjsAC+qffWksEbrQiPpwHQbvVUy
	hfj5oJj+uq74CrHymM51V/BfUBhXqasjbAZ7SZOVxburbdBb9YZDLzyYhs6dQ/+YLnjeykMhyWq
	RMEbig0K9g223wpOUD4cX74MOmSrVxypO3ZUYL9YPSIKaz6tZjN7LxqXBjXRXpWAkmybbBGrPF4
	jMUiCpocPXNRIqQYUYxFGUtV8ymntMsz3GAkUxbQWtSSsLWM82Bwu1Gyye3iAfsLgV959qxTaao
	WZ6DvvjL/IvnK5g6pVh0vTgtTUfk0
X-Google-Smtp-Source: AGHT+IHR1VtsrqYdEOR5yfalGbybkOIcDKOqLqd1M8rHZFAAkkevuzTqFI72lGmxMsSzzCv1aIizeQ==
X-Received: by 2002:a05:6000:290b:b0:3ee:154e:4f9 with SMTP id ffacd0b85a97d-40e45a92e7emr3845371f8f.20.1758807392860;
        Thu, 25 Sep 2025 06:36:32 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb2eesm3203962f8f.12.2025.09.25.06.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:36:32 -0700 (PDT)
Message-ID: <4d5bf14a-0465-47b2-88c3-1bf85b008707@linaro.org>
Date: Thu, 25 Sep 2025 14:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/12] perf: Add perf_event_attr::config4
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
 <20250901-james-perf-feat_spe_eft-v8-8-2e2738f24559@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-8-2e2738f24559@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_063634_746039_3824F3C9 
X-CRM114-Status: GOOD (  18.10  )
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



On 01/09/2025 1:40 pm, James Clark wrote:
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Ian Rogers <irogers@google.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   include/uapi/linux/perf_event.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -382,6 +382,7 @@ enum perf_event_read_format {
>   #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
>   #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
>   #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
> +#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
>   
>   /*
>    * 'struct perf_event_attr' contains various attributes that define
> @@ -543,6 +544,7 @@ struct perf_event_attr {
>   	__u64	sig_data;
>   
>   	__u64	config3; /* extension of config2 */
> +	__u64	config4; /* extension of config3 */
>   };
>   
>   /*
> 


Hi Peter,

Did you get a chance to look at this? Patches 1-7 have been taken, just 
waiting on an ack to take this config4 change before taking the 
remaining ones.

Thanks
James


