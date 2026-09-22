Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0CEC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 04:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=; b=XDqa+dCx7qDvKEECgLTZTmxT7y
	qz2bAcXH9NOXa2fW924paRSStBY/xQqikoRuTlQjG0b6B5R5ZebWurZLKMFhJp1nCWztLnF3v787q
	fTflvCGwlqvhbONEDIr/gwzQ+GI3Sc5jfIX8Nw4b99/b9ckA25zd0yiMvd4UnxKt1tUbWq/eSJxtR
	Fg56h1rx6Y/vhXL8yYLWTV40c6TDbKgzadtX15DfMhzbIgeq/ZeNpoNGSnvZ6fDiYZmEcPXJDV/Zv
	TJu5/lIvnaCeJd5s7ewDLA9LuhIH+ReToOeREU8CTzqhzdoUVGKjW8C5wnjdpEvBxslwwk/iG0VG/
	tJmTKQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8s5K-00000004B1P-2XPO;
	Tue, 22 Sep 2026 04:26:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8s5F-00000004B08-0FBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 04:26:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0efAI3044233
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 04:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=; b=akvYb8nc/xB1yOJa
	RjvETW+LBi7P8iCn3VFoiP8AvvD7mWrissADOaqLA4VjTzsTYQWaPICW3fOJ0sQS
	noBEAIXzEwIpP7oksvnCYdzASejBwMRDjYXkiTLGqy3OGe2VAGQoFJbM2ag2m6mi
	6e8SsLgdPMviNJbHzF7kmRkaA6wcrJ2Vtp8Ke5hTawahuLTUJ9bq9odf0hYXYESc
	k2NRcpLtM+o6odpMukwVFgS0rBDZTyvfcIjaDqEdwzKEvo7+f9Pkve8sRX94DUdL
	xRnTaOe/zHcJOVONzDD1f9vz8GVpQIWV8wcHpPDQuxYd9o/ckW2Vjzv+GKZ6ZAG5
	nE/e+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbarq2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 04:26:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so50584635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051177; x=1790655977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=;
        b=aEK+Ylh69w+HpboiY6RbXdNiNnlek1N2fZ1CXjn7+z1pGTF7ltJGKeIInkZdDRMg8x
         S07VHHYHzQJqImfk85wRlyX/5smEvhSs/LEvp4q4M3IU2vnAb7ZquaJBmpnM+GmyUxLq
         3JFIZPb/a3hZucxBJXF3cGtovEF0xPRyvXsFFRzukYcfppazBNacsT4hPPpzwnVTt6bv
         K7R8rzMD2HcIJC/H2eW3Rc3AMVv1vhuKrArM9IA1SCVvx2AyhL0BzV17TM6/7AeOtfh1
         D//oo/pwKE0f+8WpfHmrVYIpEi1uT8gDWYknJxRHAZiZqPEilr0clSukyJdvv18sAoCu
         Zx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051177; x=1790655977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=;
        b=Frj21T5QPgHuihoPACcWQac2CJEzYiJrUNZMcc2790sC82kX6a2uFKhJRNGzL5xPQs
         1z3w3W8zfXGbjSHbVXqbx6i3GAvO3J8u86fm74HMUM19cTYcScgoA1xqgFQ8F+VNV/Df
         xvmvR0VxLbWfwK443AwYfgAibltZ6o/g9u1eyG1NOucCKzWGG1rN6HKJASYtx2lhTFpX
         54EZEQapcWL80gJ+C0jtcenYgYybrXmshUU7d6O7TDOzV4SNf+JI+7yzGBH4qd7jsX2y
         dneb17FbwAM1HOzWT6HOQ+VSd4iD8FCDm26uvXtGEqn/hvSscbsY/YRZmhPwL3LSeuxF
         pkGw==
X-Forwarded-Encrypted: i=1; AKwUvBzAhKFt55VkT/BWcriac8OpAKy/oa3k53ESBJdXsJuKKorUMi8uw5NvF3ENJT6Bh+PYbz9yUnEHOP5NFTW3LUC+@lists.infradead.org
X-Gm-Message-State: AFuF++mn+8onugT7Wsa52f8gxXqdD1FI1WjK77PAueXVVKEyiFJzd6GB
	b9QzxAlG6oQ1TSrbmJIMzwVGlY2TxvoC8riz1u/n9DwYI74YvkP9v9ksGXS9rc2VDt72YsPEw3e
	DrbD1PZKH3AC0ETs96QPIJiwYRyJmw7xA0O5vLMMDWkm+Wbsq+2cukxrCZlALbuDl4QSsIz1R1G
	pvCQ==
X-Gm-Gg: AYBFou27PAlCjNiocK1+zaHcZVqOyIHbhFCyIpV2orJix/vJR44AMBRT8WeHedsW1Wc
	r8U5hOTi+UTOvxOSjqyCYUF9mf+NANRihrLfHfIWnsmeWkp3B7hsASeNz6YSuuOWCXm01Q2mFhg
	jq0eqtmPil0eVcscEdkwYeKemPnRj5IVF+Dq+z7jHpg7YNAURAvo7x2Y0XCncd6CBEO+ll8klym
	DNwsVkSEByTl++83JTeoaiDXZZB1g8L5XxIjJdzsySAwwTFoCZOYPBbUBZ9Jj1ufd6CKmnyV8vu
	Wsb2j2Cz9v5aCmprdmSaJz+6xu+j/GB28u/iF5gZCAanyRiQp6TLl96u4BdWT24GzdXsDqwMOMd
	CALJeK2m9NLshK8owD5m7IPwCmtp805/dK/8wsVNkiHWtH6QoWafMdQlPmNdruuU+H2KFQw6z
X-Received: by 2002:a17:903:19e4:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2ddb1ba35aemr181420905ad.22.1790051177253;
        Mon, 21 Sep 2026 21:26:17 -0700 (PDT)
X-Received: by 2002:a17:903:19e4:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2ddb1ba35aemr181420605ad.22.1790051176726;
        Mon, 21 Sep 2026 21:26:16 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0308ccsm2592795ad.42.2026.09.21.21.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 21:26:15 -0700 (PDT)
Message-ID: <641a111f-ad07-4a40-9fcc-6af2f7f98c9b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:26:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: scmi: publish perf_ops with release semantics
To: jaidevshastri@vt.edu, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260921-mb-scmi-cpufreq-v1-1-934da6400a26@vt.edu>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260921-mb-scmi-cpufreq-v1-1-934da6400a26@vt.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MCBTYWx0ZWRfX0+L9aEiJ20ha
 NIOskCOGGw+FJCHxulBpnvkEfKUumQiSaDhSZzAHKJF5w8HEp9wUlHw4aT+4OUkv4x8c0tk3P6n
 V2HrPDPXgFw6iMHmsXcu/hwpRIgoZWrIs8YTfN1/WDHHATbP71Yx2QWeC9JotdJJ+kX6IXvbkxA
 Ay5L/yS11ViyL5kHZ6G6/bW3M1snU64igP9kQweagR2MfW2vZHLlA7DTFkxI1rdyocmixHj4UoU
 YdTEr/Rk/zjyni///7znWY+6edmO2kfTXQ+6Fwtf1FBB+FDiSXL7E4RXTaSTtIsnYtTzwKcAq62
 VE9Okl+2td4pcUhbOWmRozt3leDhNyVvW8x3fvVa/Gd+T1Sfn7sleo1aUGxbrPOgNoneft7FENr
 8KRHInDVCZlNaOKK8XYN6UqykQpLAORPKJhAMeHoxbBQeikmKOOy2HuXmDjorD054fc+0V6/ZMf
 dQ5LO+x9C6KjATdkiCA==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab2036a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cw3u0DvnAL9Q_YTEX8oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MCBTYWx0ZWRfX+6pf36rlsRiP
 bX/Q96fmdOjBPKgg95eTy7B2uOiM9SVQhjwt1+GTgoQ/0zeA+pUS+VUGpG7pK9hZ0zh/eIfoPBm
 tva5SACGzBGDLK2LgEg4T2k97VOy2V8=
X-Proofpoint-ORIG-GUID: HB0mucDkB7IlIWth6SYlrSNqABDwdYZ1
X-Proofpoint-GUID: HB0mucDkB7IlIWth6SYlrSNqABDwdYZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_212621_691078_E2395DD6 
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

Hi Jaidev,

On 9/22/2026 9:19 AM, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> scmi_cpufreq_probe() stores the SCMI performance protocol ops pointer to
> the file-scope perf_ops with a plain store and then registers the
> cpufreq driver. The callbacks read perf_ops with plain loads, starting
> with scmi_cpufreq_init() on whichever CPU brings up a policy.

This doesn't appear to be a real issue, similar to the case discussed in

https://lore.kernel.org/all/495a47a3-ac6d-4002-abe3-23b85b2f2034@oss.qualcomm.com/

> 
> Keep the pointer in a local, publish it with smp_store_release() and
> read it with smp_load_acquire() in scmi_cpufreq_init(), the first
> callback invoked for a policy.
> 
> Found with MBCheck, a static herd7-based memory consistency checker.
> 
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>   drivers/cpufreq/scmi-cpufreq.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 4edb4f7a8..c394f63cc 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -197,6 +197,8 @@ static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event,
>   
>   static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   {
> +	/* Pairs with the smp_store_release() in scmi_cpufreq_probe(). */
> +	const struct scmi_perf_proto_ops *ops = smp_load_acquire(&perf_ops);
>   	int ret, nr_opp, domain;
>   	unsigned int latency;
>   	struct device *cpu_dev;
> @@ -252,7 +254,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   	  */
>   	nr_opp = dev_pm_opp_get_opp_count(cpu_dev);
>   	if (nr_opp <= 0) {
> -		ret = perf_ops->device_opps_add(ph, cpu_dev, domain);
> +		ret = ops->device_opps_add(ph, cpu_dev, domain);
>   		if (ret) {
>   			dev_warn(cpu_dev, "failed to add opps to the device\n");
>   			goto out_free_cpumask;
> @@ -293,14 +295,14 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   	/* SCMI allows DVFS request for any domain from any CPU */
>   	policy->dvfs_possible_from_any_cpu = true;
>   
> -	latency = perf_ops->transition_latency_get(ph, domain);
> +	latency = ops->transition_latency_get(ph, domain);
>   	if (!latency)
>   		latency = CPUFREQ_DEFAULT_TRANSITION_LATENCY_NS;
>   
>   	policy->cpuinfo.transition_latency = latency;
>   
>   	policy->fast_switch_possible =
> -		perf_ops->fast_switch_possible(ph, domain);
> +		ops->fast_switch_possible(ph, domain);
>   
>   	policy->transition_delay_us =
>   		scmi_get_rate_limit(domain, policy->fast_switch_possible);
> @@ -443,6 +445,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>   	int ret;
>   	struct device *dev = &sdev->dev;
>   	const struct scmi_handle *handle;
> +	const struct scmi_perf_proto_ops *ops;
>   
>   	handle = sdev->handle;
>   
> @@ -451,9 +454,15 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>   
>   	scmi_cpufreq_driver.driver_data = sdev;
>   
> -	perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
> -	if (IS_ERR(perf_ops))
> -		return PTR_ERR(perf_ops);
> +	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
> +	if (IS_ERR(ops))
> +		return PTR_ERR(ops);
> +	/*
> +	 * The cpufreq callbacks read perf_ops after cpufreq_register_driver()
> +	 * below. Publish it with release semantics so that ph and the ops are
> +	 * visible together.
> +	 */
> +	smp_store_release(&perf_ops, ops);
>   
>   #ifdef CONFIG_COMMON_CLK
>   	/* dummy clock provider as needed by OPP if clocks property is used */
> 
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-scmi-cpufreq-cabfeb548027
> 
> Best regards,
> --
> Jaidev Shastri <jaidevshastri@vt.edu>
> 
> 
> 


-- 
Thx and BRs,
Zhongqiu Han

