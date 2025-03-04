Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB6CC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFgp7mCNthyHhDZiK3SpysITXq1jVkgCu1u9nB1VRuw=; b=BS/VCArfKot1fthEjFXzAQ0a0e
	LdG4oo1xS9idMyepK5Z1Q09Rh+Uj8ahipGU22lzs1OdT13WkV/y1nAgXQVaMbKZJAH1ao3TmsfMfU
	NJqlYz9p28oP8PTwr5CJpbdI5TdtNNeyo5i4xru+fsoQZlDww8lXPHIxxD8EH0DzRK/JP36QfVkgq
	XGnZl4kw1+/PwZqC53yF8YRfOYo3tYJ6P2ibJzMhiC+z8IiotSTgJSltN5zfgYTGK0/USCTAGPYlx
	b4D0v0w6jsDVLc3A0Y2Fq6YGeiAdMs7oT5x18feNd4Kj6GajKfVpWVjsP802ab5ikcErT3uRGiNrj
	7WpStnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTti-000000058UC-2vom;
	Tue, 04 Mar 2025 15:09:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTis-0000000560b-0jL8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 14:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WFgp7mCNthyHhDZiK3SpysITXq1jVkgCu1u9nB1VRuw=; b=rBBdcoSFwvVseUJp2UcDfkqbjL
	zE2YVt4uK4pWBQDqI5Bbt3uuJiSBSSsPEgkcKYPHoCPSOYIEtMNo8rlEnc2Gn6u5hNbSVwIxOvF+l
	qzdWpAnQnELRj5h2j4oXEXCfToVEHljV4DDezh1DtWJrjJ2BZOb+VvQLPviQkWJt47FNM0AyhnPdK
	SikbaJ2RKwMml2LGlssWXfn0BOvw80v1zTdc7g5QU2AMHB4wc05XdFd1+DQjrAFCbRaLkX3IKMQh0
	htHaxz/QTjT+JEfC2qF5Z17+Ak1KaKr9eDXD+5RIaT2V0BMLYZCVRal2tORCzJzSeQj8bA1jk/wcc
	mcr8yHFA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTik-000000003Jh-3Ice
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:58:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57825FEC;
	Tue,  4 Mar 2025 06:58:20 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60E813F66E;
	Tue,  4 Mar 2025 06:58:03 -0800 (PST)
Message-ID: <8efe6176-44a2-4b3d-b9b5-855b26f00187@arm.com>
Date: Tue, 4 Mar 2025 14:58:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/10] Coresight: Allocate trace ID after building the
 path
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-6-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250303032931.2500935-6-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_145813_729807_A91E9DAF 
X-CRM114-Status: GOOD (  29.66  )
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

On 03/03/2025 03:29, Jie Gan wrote:
> The trace_id will be stored in coresight_path instead of being declared
> everywhere and allocated after building the path.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 44 +++++++++++++++++++
>   .../hwtracing/coresight/coresight-etm-perf.c  |  5 +--
>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +
>   drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++
>   4 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ed0e9368324d..6adc06995d76 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -655,6 +655,50 @@ static void coresight_drop_device(struct coresight_device *csdev)
>   	}
>   }
>   
> +/*
> + * coresight device will read their existing or alloc a trace ID, if their trace_id
> + * callback is set.
> + *
> + * Return 0 if the trace_id callback is not set.
> + * Return the result of the trace_id callback if it is set. The return value
> + * will be the trace_id if successful, and an error number if it fails.
> + */
> +static int coresight_get_trace_id(struct coresight_device *csdev,
> +				  enum cs_mode mode,
> +				  struct coresight_device *sink)
> +{
> +	if (coresight_ops(csdev)->trace_id)
> +		return coresight_ops(csdev)->trace_id(csdev, mode, sink);
> +
> +	return 0;
> +}
> +
> +/*
> + * Call this after creating the path and before enabling it. This leaves
> + * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
> + */
> +void coresight_path_assign_trace_id(struct coresight_path *path,
> +				    enum cs_mode mode)
> +{
> +	struct coresight_device *sink = coresight_get_sink(&path->path_list);
> +	struct coresight_node *nd;
> +	int trace_id;
> +
> +	list_for_each_entry(nd, &path->path_list, link) {
> +		/* Assign a trace ID to the path for the first device that wants to do it */
> +		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
> +
> +		/*
> +		 * 0 in this context is that it didn't want to assign so keep searching.
> +		 * Non 0 is either success or fail.
> +		*/

checkpatch complains:

WARNING: Block comments should align the * on each line 

#65: FILE: drivers/hwtracing/coresight/coresight-core.c:694: 

+                * Non 0 is either success or fail.
+               */


Please make sure to run the checkpatch on individual patches before 
submitting in the future. I will fix this up locally for now.

Kind regards
Suzuki



> +		if (trace_id != 0) {
> +			path->trace_id = trace_id;
> +			return;
> +		}
> +	}
> +}
> +
>   /**
>    * _coresight_build_path - recursively build a path from a @csdev to a sink.
>    * @csdev:	The device to start from.
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index b0426792f08a..134290ab622e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -319,7 +319,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   {
>   	u32 id, cfg_hash;
>   	int cpu = event->cpu;
> -	int trace_id;
>   	cpumask_t *mask;
>   	struct coresight_device *sink = NULL;
>   	struct coresight_device *user_sink = NULL, *last_sink = NULL;
> @@ -409,8 +408,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   		}
>   
>   		/* ensure we can allocate a trace ID for this CPU */
> -		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> -		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> +		coresight_path_assign_trace_id(path, CS_MODE_PERF);
> +		if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
>   			cpumask_clear_cpu(cpu, mask);
>   			coresight_release_path(path);
>   			continue;
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 27b7dc348d4a..2bea35bae0d4 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -152,6 +152,8 @@ int coresight_make_links(struct coresight_device *orig,
>   void coresight_remove_links(struct coresight_device *orig,
>   			    struct coresight_connection *conn);
>   u32 coresight_get_sink_id(struct coresight_device *csdev);
> +void coresight_path_assign_trace_id(struct coresight_path *path,
> +				   enum cs_mode mode);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>   extern int etm_readl_cp14(u32 off, unsigned int *val);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index cb4c39732d26..d03751bf3d8a 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -209,6 +209,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> +	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> +		goto err_path;
> +
>   	ret = coresight_enable_path(&path->path_list, CS_MODE_SYSFS, NULL);
>   	if (ret)
>   		goto err_path;


