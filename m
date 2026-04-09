Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9B8EA3C23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrCqmVQWPBV+Z0wvdN57Ufgwo67VC1E97vWw1I0hdWQ=; b=Z6IeEVbVZC2WGHhoFFpF22p82M
	sYpPoHOYsyApfNOVVaVoVWxPpNrf4NQpvslTS5pSjJ8Eotn7t7IHusvO6/ytDFma6rITHEjyoomVk
	LozgplGl6jOmawQdar1bfVz4qr8Qwq0wdojLq9SnDbRR36E5+Ry2OPioXgzk1ZDD7o54YUJTsQFms
	w8yTP+b1VNVRAGhMHc4ZBXFoXOYCtLIkOUUvvsTODW47hai+HFVmycu7/JQfiWIxeJX7y1QGWjyVE
	seuU+1Hmo1akuDu/wcXrbxjkkYvgUGTNp3lPvZUvEUcse05X8ix7KX87YDoYPtlUrslqts8S2rHGQ
	G7QapIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmzW-0000000ABxY-3aCj;
	Thu, 09 Apr 2026 10:52:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmzU-0000000ABwy-360E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:52:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso9249885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775731922; x=1776336722; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrCqmVQWPBV+Z0wvdN57Ufgwo67VC1E97vWw1I0hdWQ=;
        b=oD2rl97p9kp/wP/MGfxvvuGSRnPCrJJ4fWQDrurb4PHPpJySRres9LkXln8rFs/UPw
         oipwNHeWL5PDGQe1gvVubCOToViAk0h2Q1gcXrx64f5zQbn8K3LYGoYWMHGur+2qXfI3
         67ycI4UAzqvFI9NTY8eGvIADobqC/+dnrqqkvYmDonCcpN3+fMzrznmHkXTWJa6L+vZK
         ILpiuwyFqXaJ+AdfsqEV/c0jj9hn8/UnXNlXenrDJJoRddL670pbOF6iCLYdQs8vn3+6
         JDoYVwYv1TSKPJbkX5YgtR1JOI4pPVSJJFmqjm2WThiSBvkBeDMifAeUJ5gsv1Q/RU3/
         z+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775731922; x=1776336722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrCqmVQWPBV+Z0wvdN57Ufgwo67VC1E97vWw1I0hdWQ=;
        b=CZlsXX4N+ajwNutml8i9n+fHZqkJpMQPc6kV/hK5aUaU2sTiHlYW81DYNfxX9f9f6G
         tfNH7BPIU4gxuEk4XoWuF0CZ45u7qhhehkesjwnegVDNFXtN/EPlW3weM3C/3D1Ed8gg
         nUco8zGctEF0GMLCyF7+xlRsntraBmVqcIMhfud9btDUTbiYQ0EcfBUlk4pW96/69h8R
         5+iRVFlapHpaPnERS4GgMmSU2WX+RZdwY8geSJXo/xbEnFHvCZIeLoMIAy4M8/TUWsvg
         /m1d8X6x0X7UxfnSMMbAvftInBYcTZQin6DpKEhALPISzGlFQd6D7q4Vv0P7aFgyu4jb
         gNAg==
X-Forwarded-Encrypted: i=1; AJvYcCUOG6iL+PbeTHMuDM9i1Q70rnqRLAx6kcxBomM58hlkJjZLkjfEAK2hzNC04lElw23Az8cjww2FkVvb42R1MPxi@lists.infradead.org
X-Gm-Message-State: AOJu0YxvegSreGDYZUXlCwmtf5v2htFD7XYQn5XmFuwyQba6Lt3G/bdU
	kNTYLOE54t97d3GO3u3zDArtBmI2drhJzao4dyOfbF/28kMgR03y7UqpKuKm8W9V6DE=
X-Gm-Gg: AeBDievunqp/klu3wgdveUBr0GavM3iht4cQ5UXUy0flW8KjXZT1ZWfJzISBGexTjwo
	k2eL41Xl/Ozm2VR4yZvM2o1flmgevm6TGPBr9Q6Pp8EldMKizBYmn9JhjckI54SfDnL5gEg/HbB
	50RxmXNPYqu1fkHbKkod5Sw+x5W00DyuI52XP8VnMc2KDLvJgfWABFq87lqWc40mhjoDYeseqDS
	wdBEmN0l+RNJq8sX30wCwPDXPkb3esU+7yybv8b8TNWpAqW1Pl2IorZt8BdSREyRu1obT99SwGj
	W9fFeonX7X9Z6fEr9VkAExt3RBYWbn4Vtpq/LqX2Cvd6bFDj9b40MN+eiDbldRpgNMTMDxrJflo
	vQOS7JwWg77SnNN/o7hyI6Yz7XRDVOumHiTRgRYVgK3Yeyd7n7007APNaBWE0vDaX6Non0Xl7AQ
	fIeYgIYp7v5Wx7H0jFazdSimb9tuhJ
X-Received: by 2002:a05:6000:2081:b0:43d:33a0:f5b6 with SMTP id ffacd0b85a97d-43d5955bafemr4199062f8f.2.1775731922034;
        Thu, 09 Apr 2026 03:52:02 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm63199443f8f.30.2026.04.09.03.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 03:52:01 -0700 (PDT)
Message-ID: <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
Date: Thu, 9 Apr 2026 11:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_035204_856068_A5C64704 
X-CRM114-Status: GOOD (  37.22  )
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



On 05/04/2026 4:02 pm, Leo Yan wrote:
> Unlike system level sinks, per-CPU sinks may lose power during CPU idle
> states.  Currently, this applies specifically to TRBE.  This commit
> invokes save and restore callbacks for the sink in the CPU PM notifier.
> 
> If the sink provides PM callbacks but the source does not, this is
> unsafe because the sink cannot be disabled safely unless the source
> can also be controlled, so veto low power entry to avoid lockups.
> 
> Tested-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index c1e8debc76aba7eb5ecf7efe2a3b9b8b3e11b10c..a918bf6398a932de30fe9b4947020cc4c1cfb2f7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1736,14 +1736,15 @@ static void coresight_release_device_list(void)
>   /* Return: 1 if PM is required, 0 if skip, <0 on error */
>   static int coresight_pm_check(struct coresight_path *path)
>   {
> -	struct coresight_device *source;
> -	bool source_has_cb;
> +	struct coresight_device *source, *sink;
> +	bool source_has_cb, sink_has_cb;
>   
>   	if (!path)
>   		return 0;
>   
>   	source = coresight_get_source(path);
> -	if (!source)
> +	sink = coresight_get_sink(path);
> +	if (!source || !sink)
>   		return 0;
>   
>   	/* Don't save and restore if the source is inactive */
> @@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct coresight_path *path)
>   	if (source_has_cb)
>   		return 1;
>   
> +	sink_has_cb = coresight_ops(sink)->pm_save_disable &&
> +		      coresight_ops(sink)->pm_restore_enable;
> +	/*
> +	 * It is not permitted that the source has no callbacks while the sink
> +	 * does, as the sink cannot be disabled without disabling the source,
> +	 * which may lead to lockups. Alternatively, the ETM driver should
> +	 * enable self-hosted PM mode at probe (see etm4_probe()).
> +	 */
> +	if (sink_has_cb) {
> +		pr_warn_once("coresight PM failed: source has no PM callbacks; "
> +			     "cannot safely control sink\n");

This prints out on my Orion board on a fresh boot because of how 
pm_save_enable is setup there. Do we really need the configuration of 
pm_save_enable for ETE/TRBE if we know that it always needs saving?

It also stops warning if I rmmod and modprobe the module after booting. 
Seems like pm_save_enable is different depending on how the module is 
loaded which doesn't seem right.

> +		return -EINVAL;
> +	}
> +
>   	return 0;
>   }
>   
>   static int coresight_pm_device_save(struct coresight_device *csdev)
>   {
> +	if (!csdev || !coresight_ops(csdev)->pm_save_disable)
> +		return 0;
> +
>   	return coresight_ops(csdev)->pm_save_disable(csdev);
>   }
>   
>   static void coresight_pm_device_restore(struct coresight_device *csdev)
>   {
> +	if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
> +		return;
> +
>   	coresight_ops(csdev)->pm_restore_enable(csdev);
>   }
>   
> @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct coresight_path *path)
>   	to = list_prev_entry(coresight_path_last_node(path), link);
>   	coresight_disable_path_from_to(path, from, to);
>   
> +	ret = coresight_pm_device_save(coresight_get_sink(path));
> +	if (ret)
> +		goto sink_failed;
> +

The comment directly above this says "Up to the node before sink to 
avoid latency". But then this line goes and saves the sink anyway. So 
I'm not sure what's meant by the comment?

>   	return 0;
> +
> +sink_failed:
> +	if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
> +					   from, to))
> +		coresight_pm_device_restore(source);
> +
> +	pr_err("Failed in coresight PM save on CPU%d: %d\n",
> +	       smp_processor_id(), ret);
> +	this_cpu_write(percpu_pm_failed, true);

Why does only a failing sink set percpu_pm_failed when failing to save 
the source exits early. Sashiko has a similar comment that this could 
result in restoring uninitialised source save data later, but a comment 
in this function about why the flow is like this would be helpful.

We have coresight_disable_path_from_to() which always succeeds and 
doesn't return an error. TRBE is the only sink with a pm_save_disable()
callback, but it always succeeds anyway.

Would it not be much simpler to require that sink save/restore callbacks 
always succeed and don't return anything? Seems like this 
percpu_pm_failed stuff is extra complexity for a scenario that doesn't 
exist? The only thing that can fail is saving the source but it doesn't 
goto sink_failed when that happens.

Ideally etm4_cpu_save() wouldn't have a return value either. It would be 
good if we could find away to skip or ignore the timeouts in there 
somehow because that's the only reason it can fail.

> +	return ret;
>   }
>   
>   static void coresight_pm_restore(struct coresight_path *path)
>   {
>   	struct coresight_device *source = coresight_get_source(path);
> +	struct coresight_device *sink = coresight_get_sink(path);
>   	struct coresight_node *from, *to;
>   	int ret;
>   
> +	coresight_pm_device_restore(sink);
> +
>   	from = coresight_path_first_node(path);
>   	/* Up to the node before sink to avoid latency */
>   	to = list_prev_entry(coresight_path_last_node(path), link);
> @@ -1808,6 +1846,8 @@ static void coresight_pm_restore(struct coresight_path *path)
>   	return;
>   
>   path_failed:
> +	coresight_pm_device_save(sink);
> +
>   	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
>   	       smp_processor_id(), ret);
>   
> 


