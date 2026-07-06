Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F640C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 04:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYD6MPNhjaepPf2j/e7u1phNicmKefuDIWGw2TPtec0=; b=2XdXSCc2IacKpxt3pDfm+ABZ6h
	kbAiYsbB8qgMJFYyv4Pfw794rbY6iWCFXPQ4TW1a9FYiZwM+15TjA1LCpeRg4SXo2W9bmfZEUQEXr
	t4i9jQjNe2/Mk3S4seCagms0Rlvn1DdFHZrLmMFso/8jRAeOcETAw6n4vQ0lwBIdZAOC7JshFA+QP
	JyCQ8W+3c8aTaXyF/FDxXJMdRTDkynO4uLBLZiSLXsU41UoSZN927PWMZwIZ8WpZLs4RLAEeidrcX
	1Xrr8e+KJGi4yPQJm7m3A47WmLbphhA6OY4e7s1247E4xnHltxbAPxbAGuSwUMqKWOPd3tyQMIYc5
	8lDuS3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgaXH-0000000BTv0-25IM;
	Mon, 06 Jul 2026 04:02:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgaXE-0000000BTub-1xHf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 04:02:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TAj3615451
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 04:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xYD6MPNhjaepPf2j/e7u1phNicmKefuDIWGw2TPtec0=; b=l+8T7Kr/uK4TBVTU
	Pcq2uNQWgznHCUVF8Qmxsw67O2OAN+nsf6KRaiPXzLCONsxvRKUZ4vI+yl99aJrq
	tVpZERs5rRgBWlIROjEBXbuTDLMgxDOn7H8npFh/Ymse+K3bomTsmztmn5Rwk73j
	nkyY38gI8nAyl94Re7RikK+nYVm907iR3A8S+vxeBgIVmbRxLwnTWT3UVB9nurhA
	4P4qYnZntKBVE33u8YDID2KTUtFHPJuU2RCkYlyO330kFpDeq5ismBB1OysQ/ATg
	xEZe5gS8IrSeDF7jyPn64X5Lcbnp9BsHTlpCyvFaLYHAXYdIEBsBBSbK8Ggkm2Bl
	gsaPcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3c88b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 04:02:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9a700dc0eso19875245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 21:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783310539; x=1783915339; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYD6MPNhjaepPf2j/e7u1phNicmKefuDIWGw2TPtec0=;
        b=ZDDNYqypT2oBaR5gT1tUKSYjpFIf9ZzrLn9G8VZz+rqBk09E68xFeX/HsQzu90rhhm
         mRikI0L6O92EPKI5PYClQJqzRIMtxn/bWEhXvLaNGyhTD+N2Gcrz8ITCVv/hLlQM/YOf
         fvYM2/3y1v1NUk+jJDF7M4p0JvbomLxISlC9mtxWiwNvkmPXGbDnMaRgTRoEYVon25lQ
         /FLRcl3hCVKBTl0agiIvUeBKqLM8a8RVRhGNoDZXCVy9BZLKQWVA2U17Zg4r12NyCizj
         U2aM/V9Xvkl8HdNL7CJ5A01aFSHI3pWuKuCleTRI7+BG98mDiQPUEGNjU5tWnIf/KPw3
         w6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783310539; x=1783915339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYD6MPNhjaepPf2j/e7u1phNicmKefuDIWGw2TPtec0=;
        b=dHTVr+mxthejmx/7g5ORMSEbY9yEM55iStKbncTZ5nclm8frXjPdTvXpFIhfmEW4hq
         U13tmy8IUfSB5gxzcyRnV9pnBdvaXJ/4TxeXXfKrF1tzbmeBa+szxxSRddgxmTGSf1Z8
         SoKyMafrdvZSi7Uj9Nh+X5TLEEPnOVg3AkPOqDCk9EKiuIwL/l4t25Eg/z3g4MzDXOAJ
         BYR4JTlhXDYJBE0Z9Rh81rEVl5xZT5aT5bey2yhsp7nBZmxswp79k+0QAAsz9mlytCvp
         cFm2PKK98iiEBvbYc79Nolg2HQoWcxRlKgN7uX0JnmJzvJF1qkdSbMuUJpG7kqHgUWSr
         dMZw==
X-Forwarded-Encrypted: i=1; AHgh+Rrb0Sr9UyqH8TVTJG/r/zPAfqq/PgmBPmMkA45k2ZZxZo63o89O0HXnD+kOzPzkdxHy+py5KzbU3wMQIBlrOolf@lists.infradead.org
X-Gm-Message-State: AOJu0YwpvEkMRr0tB3Cczsq7zVa49OB6p/CN2pGXnn846ONa8+du08gB
	XFdz/psAThsSUJWYI4XQpHU9MeLk9DDg28/N7cvOPJeeI2vo+Z3d+1Uxtto9BlLdsJOqzmwi/tK
	zQYUCmSGD+CUSvYyN1zsK+BuIlceFrAc+ljKkveR0LUnDcaP1p3FNaH9s5NlgYi6k8ZEWjNrKVB
	olMQ==
X-Gm-Gg: AfdE7cn87pxW71MnADL/vllM5oY7uaW7fw+RzBzmipYDN7Rk9WRgesXI54gEC613AW1
	Q81ctyIcse5Cl5gmwN9a45Tfe+6yMuEaVqCj1x7AfnBn/R4mqnbakwOT/wUYsfBctO2QE5chhBM
	7bNFKW8u5KMrhcTnm3stU2qzWs/TkV2RuyIYmrL4AJUn5BGKS7TdmUMnKJF4kUt4gLPYrxEK/I6
	0wqEAdfyO12T5ACpoSH3K7QqTpm3Gw38Rgrd+FmJFFSxFQxFPU0hX19kCBKB5ev29FrxnJ0qu3A
	pVzU1D927RKePp3jn18F6w47vz4a0ZXHiAbHLH8mWEVIMIVrWZ10C2E5BudLrwT2A0HqSAFRiPZ
	yHSEmem3fCOzgO0hEfP2p8V++TXlN2jq4/0jhei75xAOrdrWwG1JJwB194AmfBa7PVbxDEefJNE
	VIaw==
X-Received: by 2002:a17:902:e78b:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2cc98b4e9b8mr26412625ad.44.1783310538597;
        Sun, 05 Jul 2026 21:02:18 -0700 (PDT)
X-Received: by 2002:a17:902:e78b:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2cc98b4e9b8mr26412065ad.44.1783310537847;
        Sun, 05 Jul 2026 21:02:17 -0700 (PDT)
Received: from ?IPV6:240e:45b:7f94:5e4f:58a7:34e3:be58:6dcf? ([240e:45b:7f94:5e4f:58a7:34e3:be58:6dcf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765773sm42121215ad.40.2026.07.05.21.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:02:17 -0700 (PDT)
Message-ID: <70ef1fd5-ec5f-40e2-b5fc-f8e1978bc87d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:02:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: apple-soc: Calculate frequency as a 64-bit value
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzNiBTYWx0ZWRfX8dWk8IDzQknB
 kxcZNpjs+hFhrBvgTefhs26KxUWsBOWUwAhGH3iqjoDnBkvs3AsROFzufby0iKX06FG+5w8GEm/
 Nb5ulE27HqL8UwkXoXlqLP/SJeXkUYc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzNiBTYWx0ZWRfX8mFg+Lk1HHR+
 WoAhzVLnq7lefHzkRM+NnbPR2GK2Tm34SEfbVi6OVNKkYDXHxUFoecDP1awh1oEk8Xc9jsNJU/k
 HzOokv2pyZq3XtEt6ZV875rlVtNcsmWI8x4+JHQdeJH9l/21DMFRgOEoDas79h33J/Ukk5bZaIQ
 n3/x5POJIOiwqT4cbZP2HCcEe/Hs9IQUEZ8wfTK5Vf0GWjY5mJvGhqU2oG0bOG9dCNbpehOSwwK
 K8OUgRZpVZMRv7QnjJsj5jBtBUJMhVdu4I7rh3DYkezzjMcfWflF2GlkGnW5gGMtILad69jc7+l
 LeByHiVfojPDC4uFMe9HxBJY+kRMtg5mUf0VseEYwDEVTY1+clLVYd7XZhzGUbHVeknwsoguNHs
 E9zEfKO9Tp0+WvTaTF8TjMAx47bz6xp4rSrzEO7eOUSbIUJGqHsF150oQXbVHG1z9w1RV6d+NmT
 xiBq4j/L5NaHg+cp8xQ==
X-Proofpoint-GUID: W4abzcQykNd8u7E1XtoaQScWkaZPFkAA
X-Proofpoint-ORIG-GUID: W4abzcQykNd8u7E1XtoaQScWkaZPFkAA
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b28cb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=xkNotnLeK6pRB5HCSP8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_210220_514797_99FC37D7 
X-CRM114-Status: GOOD (  22.08  )
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

On 7/4/2026 2:52 AM, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz.

Hi Sasha,

> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>   drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 638e5bf72185..6a0f1d36578f 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>   
>   	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>   	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate = freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate = freq_table[i].frequency * 1000UL + 999UL;

A couple of minor comments:

1. The `999UL` doesn't seem necessary, since the multiplication is
already carried out in `unsigned long` due to `1000UL`, and the
constant would be promoted automatically.

2. David's point about using `unsigned long` for frequencies is worth
considering. That said, the type here is effectively dictated by the
OPP API (`dev_pm_opp_find_freq_floor()` takes an `unsigned long *`),
and this driver already depends on 64BIT, so the proposed change seems
reasonable to me in practice.


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

