Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC05C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QQQfdy65;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyPqbkGU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OxqCDFNDcVrCibYsLviO4SvUbmAgApQDj/6HsjdxJ9k=; b=QQQfdy65Us24Ft
	SLspjYt3PpiYQj5R770gqFH7cMqVJbQ7i0GJaNUrjjxK6LTl964OAx9vBq1tYN8BAY9AGcHazA3tX
	x/Sdamyyff/VZBjRJDn/XT8y5CAMgs7jRsxRVNy8z8l6UBBWG1O86r2OtghbhbVJQNsu33UHZIhN+
	O/YaPojPOwQwk0gOfLIrcP3xHUL8+ZXFWFrhd42kFAJaE/k3QtKUwn7isWZcqjOvVxP0G5Urg0rSU
	ndW0ehAVBJy9gJMQL1VoeR1DA0cAiuA2bdz7BFa1LLOdZG+b3F+pt1zHd+YS2f90Ol1kqRKEy+VLg
	nnJueBd/2AnQN8BpQ+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHGi-000000026so-1Y7M;
	Mon, 26 Oct 2026 09:45:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHGg-000000026rS-0wcQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:45:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48df54150dfso1463458f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007924; x=1793612724; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxqCDFNDcVrCibYsLviO4SvUbmAgApQDj/6HsjdxJ9k=;
        b=hyPqbkGUP0KCMbvf0AVcO+w2tmR9Vt8SmJ9CcStoH87L9dQIfB8jRftiCuWUgtbsMZ
         FGh0ds7PhVFb7dkkpdRRQ2WzvNFjieAT0DDVTsdOdUB+upecTLV9S8YvH9p7LP2d17Cb
         3IduoiK5JqQs3aT7uTD8zSQO7IJS0qrE0kC+CkRj6iLGR41APBjYFwfsW0opx8kqsq4W
         ek6aPhoLR/ddTVkN2Ek373JObWa3eesPG1S5ts9VXiNh1MV75LvVqKU3OGyfbfbgIEcj
         /vfbV4rY/ujB5ZAHSoPBbhLPFY8R5fg/X3Q2QuGfbA3LeX2diob7KckXsYK/90f4sZwI
         X8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007924; x=1793612724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxqCDFNDcVrCibYsLviO4SvUbmAgApQDj/6HsjdxJ9k=;
        b=CnuNVDDGVGQyGlqHkIq4I6sdt3sJa7YQVGFLhjSV/FPapR5+N3k3ap2jDa0qMfDma2
         QRiImzDNskoTW782T+VFmfKCVPtygZ8EBwUVPIkd1LaOXiqw7JbEUJX+NFU3IgudD4dd
         oiiZSPbc1BRdg7MOehLiYHzxo6ZZy3k7+RGrudmk1CchkVyFkcs75ihF09S+JVyRv2Oj
         L+Bp5tCPyNBZYzTYrcW1wQowvLHWfxu2T+3XiXM9Ih/QkhYr+mmgBNbb3eSw9gt61hFH
         nDdD8L1qIL9GRT2VsynWNoK2lUw2HKZpaYc5B/jV1ytEI6r7uyYTAe56/aah93qaID8F
         h08A==
X-Forwarded-Encrypted: i=1; AKwUvBwR20AUx/IcCx0F6gvCPF80aZLJ5c86iw270mfwnhPPeIfUFQjUUIuKB3bn0aA7LimZsNEEyiEhm7VckhK2GniO@lists.infradead.org
X-Gm-Message-State: AFq9FYIfsh25WfE7RIhD69ipO/UfC4tDjYDHI0Vlu9xWamZW/m693D8w
	hh3ttDU+EwLA59TJG5u5lIdHtvm9XRND+b08Tr/ciHyhhuW4Zha1NAWK7KIyEyj0KEw=
X-Gm-Gg: AYBFou1ktoCpYht8p1kmrxATA5ljPRZPy4hklRbZYVAYUKx0ws4fUyi81bZWhm06afO
	gKkMkzFrCJEqHZLggu5tvKJYrt3XpKPIBM7iZjp2BAZSsbPI9kQV/K270xkZABOJ/VR4NMmDT6A
	k/i1FmajslPUO1+RULGVFenCvUoMiuUVo8kNqZGny5vbXLcWujvCMpMJPiCDBrp+c8JGhYfcIyv
	SWWcxDN0T+O0QKwCsA2I6hUmneU8pVMLODjRQgpieHaRanQ3HZLgi/I+2NmT0CVenkZjv84kEsr
	epb1ubxb2N4cjLCZIKHmFzfCYaVyaUWDPqEVBibXVEwSeLV6rB8KAXyQKyC89KCthnPQ1nxsxU3
	RI3wSTf7xJBHAe1hwcU1+e/ZC9c9M5PjLilmt23NEyMvvku8zZK3QJhKF2i3hXYsiMbt0JTqeKt
	Zp21k305viJnoqbJyD8FTrzuB3//BoyAMCGfNORUqCW0Bh0L88NcKNMxEF6DPbtvm89O+2PEsJN
	0NRWbEJV81eZveba/nwInD8RunMgo4FL7bW6UmqvUfO9bmdBY2/8uqDiN+8
X-Received: by 2002:a5d:4fd0:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e3eb9fc55mr7288327f8f.46.1793007924239;
        Mon, 26 Oct 2026 02:45:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm16044979f8f.9.2026.10.26.02.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:45:23 -0700 (PDT)
Message-ID: <c89d4824-eec4-4330-a700-65b936d8fac4@linaro.org>
Date: Mon, 26 Oct 2026 09:45:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] coresight: syscfg: Match feature capabilities
 separately from device class
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <6fd94860b3c13c0ddc1a5184d5d9331edc27d9f0.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <6fd94860b3c13c0ddc1a5184d5d9331edc27d9f0.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_024526_312221_3EF9AF33 
X-CRM114-Status: GOOD (  27.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 26/10/2026 05:48, Amir Ayupov wrote:
> A feature loads on a device when the two share any match flag. That works
> for device classes, where a feature wants any one of them, but not for
> capabilities a device may or may not have: a feature that sets a class
> and a capability would still load on a device of that class without the
> capability.
> 
> Split the match flags into CS_CFG_MATCH_CLASS_MASK for device classes and
> CS_CFG_MATCH_CAP_MASK for capabilities. A feature now loads on a device
> that shares one of its classes and has all of its capabilities. Check
> this once in cscfg_load_feat_csdev(), which both the feature and the
> device registration paths call. No capability flags are defined yet, so
> matching is unchanged.
> 
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../hwtracing/coresight/coresight-config.h    |  8 ++++
>   .../hwtracing/coresight/coresight-syscfg.c    | 37 +++++++++++++------
>   2 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index ae6295e308131..f04e73b91d9a6 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -7,6 +7,7 @@
>   #ifndef _CORESIGHT_CORESIGHT_CONFIG_H
>   #define _CORESIGHT_CORESIGHT_CONFIG_H
>   
> +#include <linux/bits.h>
>   #include <linux/cleanup.h>
>   #include <linux/coresight.h>
>   #include <linux/types.h>
> @@ -30,6 +31,13 @@
>    */
>   #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>   #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> +#define CS_CFG_MATCH_CLASS_MASK		GENMASK_U32(7, 0)
> +
> +/*
> + * flags defining device capabilities a feature can require. A feature loads on
> + * a device that matches one of its classes and has all of its capabilities.
> + */
> +#define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
>   
>   /* flags defining device instance matching - used in config match desc data. */
>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index a816c22c87bc8..3ee104e94a4cd 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -171,8 +171,22 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
>   	return feat_csdev;
>   }
>   
> -/* load one feature into one coresight device */
> +static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
> +{
> +	/* The device must be in one of the feature's classes */
> +	if (!(feat_flags & csdev_flags & CS_CFG_MATCH_CLASS_MASK))
> +		return false;
> +
> +	/* The device must have every capability the feature requires */
> +	if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
> +		return false;
> +
> +	return true;
> +}
> +
> +/* Load the feature into the device if it matches, otherwise skip it. */
>   static int cscfg_load_feat_csdev(struct coresight_device *csdev,
> +				 u32 match_flags,
>   				 struct cscfg_feature_desc *feat_desc,
>   				 struct cscfg_csdev_feat_ops *ops)
>   {
> @@ -183,6 +197,9 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
>   	if (!ops->load_feat)
>   		return -EINVAL;
>   
> +	if (!cscfg_match_feat_csdev(feat_desc->match_flags, match_flags))
> +		return 0;
> +
>   	feat_csdev = cscfg_alloc_csdev_feat(csdev, feat_desc);
>   	if (!feat_csdev)
>   		return -ENOMEM;
> @@ -212,11 +229,11 @@ static int cscfg_add_feat_to_csdevs(struct cscfg_feature_desc *feat_desc)
>   	int err;
>   
>   	list_for_each_entry(csdev_item, &cscfg_mgr->csdev_desc_list, item) {
> -		if (csdev_item->match_flags & feat_desc->match_flags) {
> -			err = cscfg_load_feat_csdev(csdev_item->csdev, feat_desc, &csdev_item->ops);
> -			if (err)
> -				return err;
> -		}
> +		err = cscfg_load_feat_csdev(csdev_item->csdev,
> +					    csdev_item->match_flags, feat_desc,
> +					    &csdev_item->ops);
> +		if (err)
> +			return err;
>   	}
>   	return 0;
>   }
> @@ -739,11 +756,9 @@ static int cscfg_add_feats_csdev(struct coresight_device *csdev,
>   		return -EINVAL;
>   
>   	list_for_each_entry(feat_desc, &cscfg_mgr->feat_desc_list, item) {
> -		if (feat_desc->match_flags & match_flags) {
> -			err = cscfg_load_feat_csdev(csdev, feat_desc, ops);
> -			if (err)
> -				break;
> -		}
> +		err = cscfg_load_feat_csdev(csdev, match_flags, feat_desc, ops);
> +		if (err)
> +			break;
>   	}
>   	return err;
>   }

Reviewed-by: James Clark <james.clark@linaro.org>


