Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822FECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnncnEUtS2cRcK13RJr9IE+JtSG/J6fQtqboka4CLiw=; b=vkOfoimKgEkRlhoowYxngjSEE/
	WLo+zFRvR1gYAYJRiIfHgIxvoD5Jd64P//kLMW22Gys5WCFchx4qyyvZOSniJoQyyr2fby79l83v0
	jRr19qzDg6FynKSi4EJVaxotIuI7a+OkPyKgjTkOMgc6ZMngWcoYQVmz+E3ch7c5itmd1rXG7wSG9
	6xMtCMcNyVY6aHhuFdrEMsN6PI/ZGvZzfoN3NxzoNz+jCePMCPDn1nY3cqF+pahIACSwrrmlJDKH9
	w6OQggFl5/FHrYrveRJmhUOwYxUH6mEnuNoD59W956F6mInom7P7zd2b55+0iYqy+wKliIp62TOZ2
	NIXvMlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLoS-0000000CjTG-32uq;
	Mon, 11 May 2026 08:16:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLoO-0000000CjS3-27Fr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:16:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488ba840146so35118505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 01:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778487382; x=1779092182; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnncnEUtS2cRcK13RJr9IE+JtSG/J6fQtqboka4CLiw=;
        b=mJ6O3QROHz9jlIP+tgDlp9kFV+JpNDavCW+UB5+qsqdiCK/JteTs1NgaawgF9lYjG7
         YFV4+AKpgqftEjU3rURIv/Fr5EvgvgDxTvgJU3GBXW15ffekxq0C9CfzuxIX6eIRO2N2
         s+seqxYbTRlGfZ0ZWGpq0BQkvjUo2DF8JbX/ZQe/enaDW+WCzgcGwXJw4jOABBTAW8fx
         l+Ok+m3Z1n2y7VlBofshDdHMZavNS1Y+FgRe1fgGDWLaNPjQe6CQ+R8f24AYkyQV4Qt5
         d842KTryZburpUFMZ8xTrcChianpRhrvN0dd0AjJ1JfIoFt9o+qfRhHrKSfovvXRFFhX
         49ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487382; x=1779092182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnncnEUtS2cRcK13RJr9IE+JtSG/J6fQtqboka4CLiw=;
        b=kaEGKqgUgftdUpngj9cvLN8u8ZR85gknxUjQn951JWQLXjxoNPwgoRAR04x7sET6Wf
         ePffhD13SZe3t8GVcpfMFA76SeYW9LIOQuMIQyYWqjv7ZCsnnMBiM5WLEsj+648Jqney
         dACKOTWF3hZdnhdvhTO7sGaanDAZeMRY2mGkStesom2wqbTBJbx8hT2sYh89RPK0gNE8
         B2hG5jse8jQUzIZ8yqruE2PvhuyIABroeD6VOHGZDsPYal02RZJrlVFy3EmlPJUHGH6H
         qrOs+QiST8FAekv4Vcbd+lx61H++lV4zB0cBWHOiBZok9Dp45Jw6AJQBL7Q5AXb0FZYO
         TxJA==
X-Forwarded-Encrypted: i=1; AFNElJ+Oq5WG8IMKepqg6/dlLNhNK+4GvlK4ut7sPpK5+Y9wHHmjsO6kyW1RgF01CJA8/+t7IE/BzA0XbtXqkrRDrX9m@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9rAm6utl+xYKC3/BkRsA/SnGshWohE2xjiOM7hrsG1baHpAFW
	uKhQhE399G+HA0SOU25+Qqg5YkuIazS/CXhVc28JgTiGhh8ysgwD5o+yD3yvsR2IlyE=
X-Gm-Gg: Acq92OFBelJaJpbyySxOMngtKY272mkoXD1E3+XjYkMNz0YTA/XICq6GLwZn2OzQmwT
	X5rwQ+yDR3lxF1bNv3xFraNN+lnQXBzvV1YGzx8oLvzU+yFX9ozKRU9RArCMJ2a9hfvqytGOMNC
	0ZuYJ+jdbDi2WpGT7JfKz5J1Hykh80V2y/ZJAGgpYmxJ9p5AqwPjktisxW3qhxCQc+e8FekLdkh
	7KLZzVarpshNwhOZ4YvUgetObA1mUi6qKIxekZumy+3lxWoiCrBtaQAMIA1KcD55cl/V4DFGIXT
	+DrY0j0W+56Irhom+Qq8T9E4bJkgBtC3uxaHfRhQlZDKvGkZwT5Ef/K8a2urB9g3OIwipBKY87B
	BHg0HDdZe11vdgLS/cZw3MVw4jgQpIm+JLESdYH55TVJjYB4qSJnS4Poq8LVSbtystuANZiXXw/
	4xFu1LKWJ7z8lm1DhsAeRhhaMrpcjL
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id 5b1f17b1804b1-48e51e0a620mr372835375e9.3.1778487382274;
        Mon, 11 May 2026 01:16:22 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8946a5sm96643435e9.0.2026.05.11.01.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:16:21 -0700 (PDT)
Message-ID: <90d86e62-1116-4daa-b557-fc86c40a0e69@linaro.org>
Date: Mon, 11 May 2026 09:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: fix missing error code when trace ID is
 invalid
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_011624_581215_C146DA11 
X-CRM114-Status: GOOD (  28.77  )
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



On 09/05/2026 1:58 am, Jie Gan wrote:
> When coresight_path_assign_trace_id() cannot assign a valid trace ID,
> coresight_enable_sysfs() takes the err_path goto with ret still 0,
> returning success to the caller despite no trace session being started.
> 
> Fix this by changing coresight_path_assign_trace_id() to return int.
> Move the IS_VALID_CS_TRACE_ID() check inside the function so it returns
> -EINVAL on failure and 0 on success. Update coresight_enable_sysfs() to
> check the return value directly instead of inspecting path->trace_id
> after the call.
> 
> The other caller in coresight-etm-perf.c discards the return value and
> continues to check path->trace_id via IS_VALID_CS_TRACE_ID() directly.
> This is unaffected: on failure path->trace_id is no longer written, so
> it remains 0, which IS_VALID_CS_TRACE_ID() rejects the same as before.
> 
> Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - Refactor the coresight_path_assign_trace_id function.
> - Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++++++----
>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++--
>   3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf6..cabdc0c72f38 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -739,12 +739,12 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
>    * Call this after creating the path and before enabling it. This leaves
>    * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
>    */
> -void coresight_path_assign_trace_id(struct coresight_path *path,
> +int coresight_path_assign_trace_id(struct coresight_path *path,
>   				    enum cs_mode mode)
>   {
>   	struct coresight_device *sink = coresight_get_sink(path);
>   	struct coresight_node *nd;
> -	int trace_id;
> +	int trace_id, ret = -EINVAL;
>   
>   	list_for_each_entry(nd, &path->path_list, link) {
>   		/* Assign a trace ID to the path for the first device that wants to do it */
> @@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>   		 * Non 0 is either success or fail.
>   		 */
>   		if (trace_id != 0) {
> -			path->trace_id = trace_id;
> -			return;
> +			if (IS_VALID_CS_TRACE_ID(trace_id)) {
> +				path->trace_id = trace_id;
> +				ret = 0;

Reviewed-by: James Clark <james.clark@linaro.org>

Minor nit, but just "return 0" here is a bit simpler.

> +			}
> +
> +			return ret;

And then "return -EINVAL" for these ones.

>   		}
>   	}
> +
> +	return ret; >   }
>   
>   /**
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 1ea882dffd70..34c7e792adbd 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -153,7 +153,7 @@ int coresight_make_links(struct coresight_device *orig,
>   void coresight_remove_links(struct coresight_device *orig,
>   			    struct coresight_connection *conn);
>   u32 coresight_get_sink_id(struct coresight_device *csdev);
> -void coresight_path_assign_trace_id(struct coresight_path *path,
> +int coresight_path_assign_trace_id(struct coresight_path *path,
>   				   enum cs_mode mode);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index d2a6ed8bcc74..b6a870399e83 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -211,8 +211,8 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> -	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> +	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> +	if (ret)
>   		goto err_path;
>   
>   	ret = coresight_enable_path(path, CS_MODE_SYSFS);
> 
> ---
> base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
> change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1
> 
> Best regards,


