Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A02CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJFTJhiN+4hmB6UylAdee9vnnn/inlLMUCHrFPbCUQY=; b=zYMjFKXmGD8g+Jh6zxNEOiYnSA
	/nTq71TEs4I0+iZP47dBMpe50Ppe4SS5loju82lFdgpjE4uCfQqsvHRVdjtWR9euRPo21f+KNGyoS
	mLBHihn2TnlJZqypp6qFp9UR69hU4K5mta/2OQSgRCAiRPxdtpAl4xomNF4EqSNB17r1JqYXNNklg
	Ud7fPAnCrenFgDDGUrjtcJLxfNwEvBbDASQvF0K1eT2Q/becCdIAyKQetHLMPku/TN/F9ghcYwX3T
	z89H39IGlp0Szk1+dqw6p2sx3t1tHd6WYr3dpUoz3NJ/fqs93jp7+bQR6zbnQ/I8LN17942ifsQMM
	AuTvl1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usu1u-0000000AwhO-2TR7;
	Mon, 01 Sep 2025 02:12:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ustzB-0000000AwZN-3REQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 02:09:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VMPUMI003420
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Sep 2025 02:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJFTJhiN+4hmB6UylAdee9vnnn/inlLMUCHrFPbCUQY=; b=pm3wSN5mnW9lMLaI
	66RbTvLssLk0CyWIYOHVGhvzRPbj3mtLll+6fRFFAwNmUslJfGGlnpmmJ4zMAvJw
	fb1d9U6wnZ6rHtTVKaQ2NV5UtP+WWbaGkW766SrVmDhyqGYrwpYT5ZKCpMryQjpI
	wPdrfb9BKhKlo322E4dCNz5xaggl1OhTDOwuaI/Js2Es0b/qOC+c6NDp6L9xdQT2
	oDW0jGdFdGJ2UGF/imVwB8DRXrnkAULUTlAkPaAiStx+wtGK5WolUtakd+rhw7fT
	ZTRLE12IGEq+UB6uIYuFEWHd2bEW8zGk0lrivxRYwdT4wLkYg2SjtLGdls6L4oXR
	Hn39jA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp32my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 02:09:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4e796ad413so2056311a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 19:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756692570; x=1757297370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJFTJhiN+4hmB6UylAdee9vnnn/inlLMUCHrFPbCUQY=;
        b=VLcjOw+s+Ib9jTA3IyHQDOWWJNrmyQXQpOglq24uBsik23knjPk82YZ9JwtumnePwt
         G/8988Iq1YFuTMUX7DfmDdUi/lAOSeMxrtWJYPqhrw9rMlPjEGwLiEjHEHp3su42hpB1
         jIxZG4mPh4DOU/FGpMpFl/TNpUq2tYmTpwjBIplCU/svpYLVkM2udhQ6+OvyiSOCKqB3
         8/vhdUdW0UR+bFkZjykG75TH+w8VIgzlW48l1ANyrmv/Q0x34a2eDyXCW8Dx6Q2NnD+9
         3nRgkFWKJpc4v4D0Lp6jqka8YRAL5gk1dKG1U6VNKNsELGt9Fww3amB1se2b9IJNgvSZ
         t6vA==
X-Forwarded-Encrypted: i=1; AJvYcCXTxpZtbr/3Ob86qO6dv5RVbsc4amQEJGIg+Hq7+DsHy1yO40s3N+G2ao6B5q48HjvQMGMqV2T/RBuoa2wzpzCM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2tDEV5EL9prIEUUz7TcIuk2yHbq/XmdpDivVxulNlftk8+fqq
	6Ln6VL23MJ/GdJf0F1IvP8K3MVDjxss0AjpoL/pz89Y1XCOSR1HQLBOTAjmhB9lsCRETfssu0+m
	j4hgnW89oKYwyAq4nbfqu+kLG0eZsbeAYXmDF0XF/9PW4253mPD1JP5fgh/3GUGAiIPgoQlYPqO
	V84A==
X-Gm-Gg: ASbGncs0FuL1wMw+MAzpwYnLUCrjUJH/NJ5dku/HBBJfsQHVZnEyCstHJc5iAkBE3Jk
	g7qSFNOhkt/ij1dZby3YvZPClOpWEOzsIOyWT3XVVoBKFSGj0siP4XGxwp1A+qKWwQJ6tbvIxYg
	ulwppiyXEEQ82TYrlmfBTtArpvHTub66Q89EMG6ukq0a9Y1Wek2tdw687Et8fXocDpscCc0hdg9
	ETTGDnlybI5i75K2/p5tyFvx/K2sh4cCM+SGu5RhuOYiVQ3fgn6YHDjXdbK4fyrcPF6/S2U64jX
	YxWD8nUlCx0GVjksHXGMNi7nKefkXEgtn3ARJW4T2UHFatrgeDHW+3hQYw2Yaq6aTNXmYBAGHhC
	e1KC+fUMwK+M2hs/tinKgYBdSmPkZRQ==
X-Received: by 2002:a05:6a20:7f8d:b0:243:c081:b4a7 with SMTP id adf61e73a8af0-243d6f85b56mr8491256637.59.1756692569907;
        Sun, 31 Aug 2025 19:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv7jJ40IozONRbSG/trocPvA1w/awpQsGYUiMBvP2awE0A/DyTnHq/4z0XXj5ICaPVOFmkcw==
X-Received: by 2002:a05:6a20:7f8d:b0:243:c081:b4a7 with SMTP id adf61e73a8af0-243d6f85b56mr8491228637.59.1756692569368;
        Sun, 31 Aug 2025 19:09:29 -0700 (PDT)
Received: from [10.133.33.253] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725f9f7b50sm568901b3a.68.2025.08.31.19.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 19:09:29 -0700 (PDT)
Message-ID: <62773a2a-235f-4894-a570-3496bd8c1c15@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 10:09:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Fix incorrect error check for
 devm_kzalloc
To: Miaoqian Lin <linmq006@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250829120847.2016087-1-linmq006@gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250829120847.2016087-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P3dlsKPHcvO1FkFLVNLp0yxOxyZm61Nq
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b5005b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=kMyzGuzSTzuwxu01R-0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: P3dlsKPHcvO1FkFLVNLp0yxOxyZm61Nq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXzfV+sl7xA29p
 ZAURsfyHsaApRI4gX7SNGMkV3VCehwK/FFs+nyXjyaGwMiblL+trGguxZTmLbuyPV4p6jRXD0PA
 YMxEbaVeUFSrylW4T0AZGPRlZn+drqpdcrLpOGro3ycgup16s2j98M1swj1MQHYz7D3pE3XNGtO
 rFUqFnVTerwHvFuZCkddRPiDMWxSEeqHTkzosn8u2gcBB3ZZJb56DeGknzQvCBrrLHES/edj8YV
 +wuFO2tmY6P+y1sNyV8jHNPtfY+0mj4MUiHrrUg6pEwcufqyEO5SLwTayJCltqKOhfwDXehUESO
 aTUnfk1dsi4ckz/adb+cfzqBzxEmHSK4YNHnyIJNLi2lJh5ATk4XAmTRKWxiYO22lOWAFbrR7xI
 AhQHoQdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_190933_987498_928A763E 
X-CRM114-Status: GOOD (  21.49  )
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



On 8/29/2025 8:08 PM, Miaoqian Lin wrote:
> Fix incorrect use of IS_ERR() to check devm_kzalloc() return value.
> devm_kzalloc() returns NULL on failure, not an error pointer.
> 
> This issue was introduced by commit 4277f035d227
> ("coresight: trbe: Add a representative coresight_platform_data for TRBE")
> which replaced the original function but didn't update the error check.
> 
> Fixes: 4277f035d227 ("coresight: trbe: Add a representative coresight_platform_data for TRBE")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8267dd1a2130..caf873adfc3a 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1279,7 +1279,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
>   	 * into the device for that purpose.
>   	 */
>   	desc.pdata = devm_kzalloc(dev, sizeof(*desc.pdata), GFP_KERNEL);
> -	if (IS_ERR(desc.pdata))

IS_ERR_OR_NULL(desc.pdata) would be better.

Thanks,
Jie

> +	if (!desc.pdata)
>   		goto cpu_clear;
>   
>   	desc.type = CORESIGHT_DEV_TYPE_SINK;


