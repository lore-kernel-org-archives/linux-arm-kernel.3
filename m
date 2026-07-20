Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DA4C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdHOvi6op9PZsp0dCdMAIUCpZ6ygglE1WyUlQZxnVkw=; b=E438VV1o6hHzl7qSjFqvhPoakt
	yTDBcGUkf9OHleciN+L4/FF65jg4efliH/uiNsXq239ODAWdTkVl5wGHCnRpoXb1djyQ8Bl0Uc5ga
	7ItDJzQ9xqnBbaY31mvX1LPGAlfXMgsoX8PE6Bc2LGVYbBMu3/ffe1vLBb6hBCHYl/f44dHIIZYK6
	RIAZ3ksSUSoy0/t+k/Q/eEKlqKq9EJXTUIEbMNVZOXPeMpOKqDSOSlFmjrsIDPuHDTiMlctkU4h3x
	sDT/2A2s5WbSWoWNzO1l1DEVC4/QyjZaStPAiIFdU3aLZpWZpqGhe/ZnWt8pR1oki1hZesPc0kbmA
	ZEZ+ASwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljHU-00000006BVV-193r;
	Mon, 20 Jul 2026 08:23:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljHS-00000006BV7-0whw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:23:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RY9t1420324
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdHOvi6op9PZsp0dCdMAIUCpZ6ygglE1WyUlQZxnVkw=; b=CkVgk1Ih0dV7+IyQ
	Es3Q06Bw345082P7HpCeFPGlxI6iZQDQQyVeO2wnFJ6nEWLotxuEAEs1C0mpygnJ
	WDSE+pcDLL2q99BpBfrvlPnVUoHF5kWXq1Jd+qpwnNy2V2zMhQHJDLPh+MaYNT1L
	cMtFPa1NZD/3n+P/mlyacQ94Cx7QYgDtd/SGZIaVSPg7hiQ3v0VQG0ZQ9e4bsnMQ
	Hvz5h0eKO6KYdrEmsIOtkFVmeOgw6HD6FoIwruXrj250UKIjPvJqL53tJydBXNzh
	LwPyWkT1+gGJTvsvhgIs5zb0vI87yXpy4L3W3n8VeZWo1wPFRcvselcERU+0tt0F
	/9NbPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7w3uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:23:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so17030851b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535796; x=1785140596; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdHOvi6op9PZsp0dCdMAIUCpZ6ygglE1WyUlQZxnVkw=;
        b=hwnMIeukpwSQJAVmy9gd9nYdbQ4VJBN/t3y7DPYPasu4R9pV+EsO9NeSrx+CavgJ2T
         jimh3exm3Zd1p7n3wDRvORlEGrCSnjf/42+ZxBd3UX+w9xmjFmdF+eGpyuRhC9Vlx0Iw
         UzSQefOevIL5LuEBldjTkoCkHER63KEPdRGEdUNqbsiVQyZFiPxw3Uy/Nt0Nbthb8sJ1
         SO2127nbvI3h1OxgVUh1jPOM3K19w13Tdz1hU29xczgIgVV719+nWTNS0LbMgYUoW4pa
         dq4aX9EzSc55UeolZXAE3N9i89i5L/MjDmKDKOoGykW+HmjJI/uvneKnXddnt93Ktq0t
         QezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535796; x=1785140596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdHOvi6op9PZsp0dCdMAIUCpZ6ygglE1WyUlQZxnVkw=;
        b=n/uXIk6leOi+6SceeIzwhmK57GYnFmix+dk9k/FSgdSxmJS+I5w35maOjFodCpSV/O
         cpI0+6B+txfuBXH1rZp4s0ix5n+7kyHArtZkJKqdyH16ASmV3iCfDXrpPXqAzvSHNHTA
         u6D/piJPD2WUm6lWxtHE5IG/YD/wdV+mNv+ostCNYAkM3QQlQ13Sq6nuCE4jRsa8GbVW
         nF5Kt1ZxZnkjejMyLoJg/0y+MfDhVARvAIGqCCy8xPCPybNpH+i8zpPl2xXUglXFathj
         V6CA6WpKlZZLO5piaKCQ2IEnwlT2Sih7qys4ROaEWc67aqdv9l81dIa0TZrl2ICmVy2r
         H9+g==
X-Forwarded-Encrypted: i=1; AHgh+Rrpn1rBNRYvolfhFMGCtf3klRSrSByQtrg0ybsDSSqyIr3dt9CddShvPtMPenLadetio+AHws0/6sFjVVide5sq@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxyNsjB3WH58Z+4m1IFrscOvnu3ekH1a/v6yT8NNrOqeA5uTj
	NzMTGGbut3Z7SNyIXrDFuZTypceug1u244A4gI8f3iZjVfTp58ugKQg6/6JB9v5mv1zNW85KfVs
	MaA8OqONW4V6VtaADkFo5e5dUbpm5Dncv4JcvR5es38JHfeUwCcB3kNZwmdGh28BMCUW2uy7rVu
	pz2w==
X-Gm-Gg: AfdE7cn+yMMVMIfoN60nuLhFEYyseDCOR9yzGJRN46G/oxI2burovlD+kYeOzqek+kk
	L+0Zn53izNJ4IhiNzNVJTTGWB+I/bFA/FcVEj8O8BCN6JNy7oM/UJAVmps3AAFmIdJ+VBgIb0k2
	HLl61KzTkrQePWydBagaSeuGlC9ut4opbwzdJ1flr+llxYMWvn7tzuFQ/Vdd82jXiJA+jqZT3+j
	AIXB8+nTZWxf+ePaUHikweQKJ83l8DRkj6q47mhUpWJVD4qt7XSCRH7lpN+P/rtTS+2nnBRbRW4
	kj1B1DTQg8DdoqhnLfGOPMyEQZjds9lnbdezt13aTS/u6BA/unWHHopL5hT/xkqyStvNUEb23Pq
	6ekxYvROIXx+ckGibMzjzPgYpie93yXr+hMyMbZPq5NB6sHdlGXeC2olw8EYHUJyg9psMiQKv
X-Received: by 2002:a05:6a00:391f:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-84c2927e709mr13775021b3a.17.1784535796239;
        Mon, 20 Jul 2026 01:23:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:391f:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-84c2927e709mr13774994b3a.17.1784535795785;
        Mon, 20 Jul 2026 01:23:15 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9f00bsm5233431b3a.56.2026.07.20.01.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:23:15 -0700 (PDT)
Message-ID: <cefa6f15-c20d-42f0-a39e-6582a841b595@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:23:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX5sT49aSIffVf
 AWiTHYum01jKUA5+HGWb4LT80uvHjUTqKEdCNvrwITXlBp7ukG46ZV6V/nbTU8xqogBGB137RsX
 FEJ/o+o7ECKcQ4/xgdMG54SQS1cEGRdvzA+RQuSehn9vYi5UhFgOqNFrNONiTKJ2RdAwrhbv3pn
 geHNYN5CKx7SqXvXDjLUqrm0e8Sib2TK0mTmKSeLbU6ZbIm5zLeX17ZRHH8q3Z45yWwvGIiOQW1
 TWwv7gzDxom/4Dgl+d6trHm43xIWMd3S96FqKeKvqVuSstuzwXqZ0dIhi2gW6RMssTWjjvQYe8J
 0VZoGwDznV5qIgPY9eMTYWgzoLmjPvMYd4AmEL4hv+X+Jq40v2auxGmCzHqjA/V1hWDdukzPty0
 zPM+8KkK3oSTYubzM6aDQwK/EJIOJbgVUTmy+vhbEfxXqTrY14Cxzkqp30az4gIsc1BdCyH0CxY
 yGoP8opUAQrPPJmqhgQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5ddaf4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iQvuD4D9eR7FdX2dW0kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Wo2v1ENdv-xXs8XCrlPjuDO4-W-76nKa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfXxhOlIJx6exP1
 vxHomBGLGqd49Eaa1LpzmlizinZqx7iIu9cangvPJ0MMSPj0R1ewn8m6Ox7ETM4pJkeM8f/Nka1
 tp5qvmL2rwi6bdUrqQIcuwBKQRXYoH4=
X-Proofpoint-GUID: Wo2v1ENdv-xXs8XCrlPjuDO4-W-76nKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_012318_310839_ACC370AD 
X-CRM114-Status: GOOD (  23.98  )
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

On 7/20/2026 3:25 PM, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz. Ideally, we
> should use a true u64 instead of unsigned long and "knowning" that this
> only runs on 64 bit machines, but the core code uses ulong everywhere,
> so this should be good enough.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - Minor style fixes
> - Link to v1: https://patch.msgid.link/20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech

Looks good to me.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 638e5bf72185..5ad274a1e6ae 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>   
>   	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>   	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate = freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate = freq_table[i].frequency * 1000UL + 999;
>   		struct dev_pm_opp *opp = dev_pm_opp_find_freq_floor(cpu_dev, &rate);
>   
>   		if (IS_ERR(opp)) {
> 
> ---
> base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
> change-id: 20260703-cpufreq-64-2a23d7261e09
> 
> Best regards,
> --
> Sasha Finkelstein <k@chaosmail.tech>
> 
> 


-- 
Thx and BRs,
Zhongqiu Han

