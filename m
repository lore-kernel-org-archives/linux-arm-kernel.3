Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB040E9381D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 05:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wn0sIr9yCom2rvv8mSHVfkBeSZpSznvlMdervP3XAs=; b=oVcvPaBPeRRnY5pKuqsxpJUuLh
	VTXwBO/ujieRYcFToduv+1RElGFHdkMhFKj487jHdte9a8svkXT8j0QrzqA2B3Rc30eRUdKCscmzN
	dqK4g84Qe2bS5C4hLU/KRyuJ2AbxMITWVhoLXqTT/bt01y3Ay7J86+Df9Q8EdkrOuDRP3xy8bd2Vo
	+9apXpdS1Wgp2hV9f5io7m6Sha3/mPp8CcBPTHa43yIa8BN+sRz7XjgHH5IsyHo571Bgor7/gSJgh
	vtYQswOjXCdUgeLZwtvFCJnu4vWc653JyC17qIsxIqn4Ol0JmVoBtvlCsCKPsE8OqAyuL1SwHfxEo
	jdtcmBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCA7o-0000000F20D-0TXw;
	Mon, 13 Apr 2026 05:46:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCA7m-0000000F1zp-1d5b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 05:46:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D51nFV3831147
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 05:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wn0sIr9yCom2rvv8mSHVfkBeSZpSznvlMdervP3XAs=; b=iRMH2efBpNVVzkKR
	FhFj5FnhZ76uotMkqI0U+NXN9VqQTbZj7FcdFLdCuSOQlXmK7P6IiAS5ftxR0xeP
	k3898mwa3KVL476mdmA9CqI3kJuxOrvROvteX5kr59WKFN61Zx+pU3SbL5DrLPc3
	EbQJ8Tmhc2Sb7PcTlaLDdSjQZfn2HaLXGD4leClOIowU6KlmOpZAmPEjJbcaIKCW
	W9op25NFI5+FNty/JhME2nXPEbCOM1GU8c1H/5AWQDgNMV95Qh/EhzKs8vcTLEBV
	jUOEMBq7WaGh1xYMW24Kt2ZLr6sh/gtOdiNEOCoqqi3ynzA0z9bC4vAL719ycdjs
	v31OEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew03x74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 05:46:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242b9359aso37019735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 22:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776059176; x=1776663976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wn0sIr9yCom2rvv8mSHVfkBeSZpSznvlMdervP3XAs=;
        b=cvOf5z6E6DZJRzmfAm/szwykQk9koQTMqbW2xRJ92PqTrrHhZXqDV27oAekzpDDLXx
         dJ2WKw0LIA1VR5nig9gGf6A6hIBmJgBcUXwtmkZHqwK2CGkvxU6Q7QWtWm8v3Tx5BHCK
         VsZU3bLmHGZQykcCt9DgcKJpvdIgLuq1bK6RlHsITv6V+iQ+icCrAeHvc65T67lIXusE
         kv5UVtgztlPn/sNj6+rpBL91ePRxmC0nOxZHhyEbQDVSi9tUZwTr5JF1SbJCKohTRtV1
         QigvHpTdNk3vJXu56Zb8cKvH0yTGFgUwamc5n3GRAqT5hB/B2Ys0Z0iuoDugx/7nLrRh
         7Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059176; x=1776663976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wn0sIr9yCom2rvv8mSHVfkBeSZpSznvlMdervP3XAs=;
        b=tORluCbmVsSaKxeDG4Pm3PcHQX/Qh1/1szNDTbp5ob8TmaT/E3tyeV1Msoy48rGhH+
         i1PFOdPie3oghwOQ+5M8nbJu1jXDi7QMhvRvV9/aQV3NaZR2gtEiBKUdQCYIn/ZDiaTg
         smsTpcSJzIocv/VVNGoURWWMlHCK70Lif9T1YRK9d8yuD1Dfs3403NMA8eDz27tSp9vL
         eCdxmVdo0/ArgIaNcmzw7zQwh0aq8+iYB6+3Zny4Pn/GBm00u+qJ/9h0WrWLzpOK5KZw
         g4kO3C/drJVWS8mgLSEHCHdeCnAvDwxYzgUtac9UPoObXfS1wZo3fa9wnj8ZAmy0eUY+
         PEhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EMFCot16K0CO8uBf7I45BeeIqUll5NyslqqeBwOTKeeqN52glx2sFosFSVfrhGPv39J9w/1PpZLwLHFeJrXFO@lists.infradead.org
X-Gm-Message-State: AOJu0Yymbf3eZdLay8be1hOOAv0SzNh11SPbm2DbZC2XiJ5XYGdPb7tf
	OuramkEfZ1NOZH6AoEsUzPXJ7TscnVaM9q3DOTwXVRSbG77ADh2c4k+ulGMvZQNyOzR5G5u4zoQ
	dKOA3jVqIwrUWS5e3L7bS9QVTG8+QXmAvPRvdUTwDFUdB6iwoELiNloRl/6Cw+hDfXwIMK16W9L
	cxxQ==
X-Gm-Gg: AeBDievFMJLtylTQ3laQQmUC6xJzuNBT4Ld8P2e+m3Oh0q6vwWXGi4DQv9TFv8PNFSA
	YoZLopAY090/8LmO00qng9XHq+uqecpTnQ5K7IygvCPwKwJhvPQsI7b/hwppxLMuA6sKMZHH4Ul
	7wVIwBiBX69RO43L8PcqVOvNSSlbjEtt0pRLuJz3V9RuBbsap1aRXvgXkZOi3p5f6/QBljjQhn/
	/uZK1DxPJpsLNw9X1HVGX31vGS42C2molwDQi7o+zM3m2eIMWwdZrgLdz8TiudNoveWAg7SpbxA
	NPKnV/wcWR7RIqgBUDvpjKLIQyyI47QNB//h8wcSXk8H8grNDAuNE5lShEZZOfOqciXGIDCZn7d
	+joxUc/I+NIz/4gw+jftYmX3dCbM+wm9iJhyWufNLhGPP6cPO5rf1J1GqZbV1uV6mHHfGFkiRSu
	JsJ0FLgjS/Jw==
X-Received: by 2002:a17:903:3843:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2b465f6e3eamr1736055ad.4.1776059175752;
        Sun, 12 Apr 2026 22:46:15 -0700 (PDT)
X-Received: by 2002:a17:903:3843:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2b465f6e3eamr1735735ad.4.1776059175266;
        Sun, 12 Apr 2026 22:46:15 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f25df6sm105647345ad.56.2026.04.12.22.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 22:46:14 -0700 (PDT)
Message-ID: <227b77b9-5232-4cff-b26a-458477e9eb32@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:45:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
        Keita Morisaki <keyz@google.com>,
        Yuanfang Zhang
 <quic_yuanfang@quicinc.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA1MSBTYWx0ZWRfX6+VoCauaKSgW
 nm6HYVa5VXGZtHG6z7tpHT6zX3OO6qP1nMyiXczWoJesw0fgM8H+MTMtZhgRv9C3NypjUVMsryh
 bZv901txGE5XopKMETl8LHFW6d8oZkKu1wQ8wl9GCszya9BNWL+lKt92OIwaKhBLyDSmwED45EW
 7ddFPkk/clNkjhtdwezFIslRFUQnjlDn3oDcNyuYu2HMtyQIMhhoDIj4rdW3nYfHlNAkBKBkPwO
 EnDAPQkV0KAz1STsxBcri5aCp/+Lfx0Xt14zGu2MPHveOtDtR0W/HvNDAFNHPpTYL+MwBhwmwR5
 Nq3e2NVFb/m/GvohnfCPnXiXZ4wdewDhWmbuzMVYmfJXk/3Qnf8r0TQ+GSeXlNTaG80tmPQLRRx
 UXTipQ/xqMzxj/uVzSkH3HvKsbKTkgEAlN/Z7MTOPfDWGVLvyNESO4BKUrLelgCOhc3jw72emmd
 EDRCaXlqz12gPAN3n6g==
X-Proofpoint-GUID: -P-o75XOZB7uDvw5OAaWAp_UKmLHspOa
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dc8328 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=i0V9v3Km83Zjb9AMHTMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: -P-o75XOZB7uDvw5OAaWAp_UKmLHspOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_224618_612704_B1E95850 
X-CRM114-Status: GOOD (  31.46  )
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



On 4/5/2026 11:02 PM, Leo Yan wrote:
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
>   	return 0;
> +
> +sink_failed:
> +	if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
> +					   from, to))
> +		coresight_pm_device_restore(source);

I have go through the history messages. I have a question about this 
point here:

how can we handle the scenario if coresight_enable_path_from_to failed? 
It means we are never calling coresight_pm_device_restore for the ETM 
and leaving the ETM with OS lock state until CPU reset?

Consider we are calling etm4_disable_hw with OS lock:
etm4_disable_hw -> etm4_disable_trace_unit -> etm4x_wait_status (may 
timeout here?)


Thanks,
Jie

> +
> +	pr_err("Failed in coresight PM save on CPU%d: %d\n",
> +	       smp_processor_id(), ret);
> +	this_cpu_write(percpu_pm_failed, true);
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


