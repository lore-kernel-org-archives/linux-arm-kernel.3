Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQSUkQFLaxvlcc8RZA7/n7JM0m7BFdTCUNhiufZcHuA=; b=BeQsaT9EKv8U+hamSvNewh1q5m
	hykgLeKRz4k5l+Jb97ira43xowRo1X51VxRAG/82XslvqAX/LkjOF+bEVcyMNnEVinLSxgFyjU36O
	JEWeJuMv0Wb3wEuDJGX28SI5/dmy1EXKmsuI/Iu3fHxlTXRx5TmPlKEPuONq0RoBRIogRp4/bnx4b
	FZwkYDrSpuCNVV6O1ywtTiFxjlcBAxB2v9cDPdsZAwNECoeeWVqVmZjwYF49XwKDZWo2jvHlUNxeZ
	3xNnr1pOJIuaXKG+e5tsM7KS2keM+cklJrqcLra18thmfs52lUNnucYD/SSR68S241cevcIcD8x6F
	r+++ayYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT0M-0000000HFQr-0XdO;
	Wed, 08 Jul 2026 14:12:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT0K-0000000HFQ5-0GvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:12:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3J7s2738495
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 14:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQSUkQFLaxvlcc8RZA7/n7JM0m7BFdTCUNhiufZcHuA=; b=YXTLac9YvfDngvya
	j6WfSfxyWvA20J098KPI88zaXozwUIFqTL3FcUNEt+QbnrQSfudSAwNwIcPGbNOh
	9a3NuPzGu94NT+FvRA7LRTqBwx/Nh6I7bX3dA2ue459TXOrV5W/kHBwdvxsjHCeR
	wsMXvTGmSmo4ny1u2tzLkrWFPQYjH9lX4RM9JtEPaA4ycDf807ZC9Ctz6gJdYJwW
	T958Xjee47h4A5OTL6w07VX+9JZpUuN6V3LeZBcRETmnOB1k2yjYbjFnBlPc1bmu
	wVRO/NDtqRIuEeP+QSR7BXcMYPW2WNYhAk3VdpAUZ6svz4XKEJV6EIvWaxqU87UU
	O0IKeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv1nty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:11:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c2af04aeeso9556861cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783519918; x=1784124718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQSUkQFLaxvlcc8RZA7/n7JM0m7BFdTCUNhiufZcHuA=;
        b=XW4aeh242u+deTuQq62KK6sUevZ60i71S5tHSWtx22Stf4sym5dKE03MdfaCC7oHIP
         5Mwuoa3WNVB7pRlxKPrycpHq4TpKLh8VGLzFx4pTouO+qHznTVjvIHRXA3v/GoxGJqGF
         1WZX+mioqGqw9DVU4JhLsnqpOWVtzDTy0p3pL2/IhK+2hziVO+5y/Btqm8ohgx4xq/tn
         84tRfm6jWGJLNstxFYAAL/uPZvjOiC8JtFRdL2Bpo201+uqsNwHF2zkM1AY5PSOz1xiz
         Qz/5y1aAExUkzpJSEgAQTXZOvrOoGsQfR9eG4vlkZRvuYuMMyOLApYWv23hR6rnvUldZ
         Upmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519918; x=1784124718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQSUkQFLaxvlcc8RZA7/n7JM0m7BFdTCUNhiufZcHuA=;
        b=FSvcUUX7u1/mhyDlOvp+NGbXM1gmYKA6ZtSePJ7GFmrO4eRdDvbSNSLFpyA/CgtlTO
         FhGHGiVl7jfpTJB2JwImGZ86xoPfTfVEEPYjiEdGZPYcSHGETwHLg89Wvkp/hOuMpdIF
         m6iN87AiL+aGquMz6EmLqJMhv4bn5Ry4ryPjEEza6725LvmDrV//GrMDT3/9ncdQGjhY
         SRGfjKlxSCkkRUJFTVQl852lOkyK51z5Sw+cyQjwzbjqsZhNsG0ZdkdE/33EFt05qLiw
         8d/cOOcLfta3/4Zso8ZcnaTFHX8DjbSBfQvx3F/62bAJRaRnTFkuXHufYQ94ldf68bF4
         rijg==
X-Forwarded-Encrypted: i=1; AHgh+RpwsAFnNDIguPAsU3HW3o3TyWifSAdyqBc8LRvo/xJ26fMlZ+DzgHkT7stAffzRL9BHSStJM1qvRVRs3K9t0dyl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw80C7DQRRsqSM7D85SMnZdzaIWmG9BzqGcKqE603fKv5/W7X+M
	hBscIJ7J++zDquFPyiUdinxYQYCDrWALhrF5uRWzZONQYFUjmgXevrX3E4Et9xoIq3GiuMM7Vho
	52z5zQ/1JlhxVAnQPRUp+76yY4MlXAJV0ArVKlBbR+bs1rbd48y+WfMjv8C59+jdm1vUNDdAy0z
	O0FA==
X-Gm-Gg: AfdE7cmlkvlv69vJ/atOBr9G7id0QMfBft/9xn2A2PiiGHELwauLRhpiNHSOoxlu2Rs
	AJnIK4jqAaZMD+9G3NMQcKILrhFB6n8r6Zcc7r02i8b1q+xsqiYYLh0knKGrlfTkuwtPZ1C1Dcw
	BNm8ehT/sCt/Z7qlOdID2Wm4Kr5JMNbAnPlsWHox6vKnDVN9eKVYeQ9rqTrmtmfwuZWov199vzG
	/qdqRAA59ISlej3dsqRAzbRwfkBAB3dEv3FoTrzLKozuSDi5U+HzSTCjBHmoMWzyqMURI1iIWR3
	UfPFD+NkudqlRY2Z32IvuoKwQWda+zN4l4xTjDrW+ZyVO+pz4F0FRXBflnb5kGlbWJZ4wJ8Tk66
	tyHZ76it9IK107wEmOdwWFVdX35ECrRm8keTi5ezGxuwyt271OXO/qAHUFnO+ESULwsxii27Ctg
	==
X-Received: by 2002:a05:622a:53c5:b0:517:91e5:1086 with SMTP id d75a77b69052e-51c7a78ffefmr78627351cf.38.1783519918543;
        Wed, 08 Jul 2026 07:11:58 -0700 (PDT)
X-Received: by 2002:a05:622a:53c5:b0:517:91e5:1086 with SMTP id d75a77b69052e-51c7a78ffefmr78626721cf.38.1783519918016;
        Wed, 08 Jul 2026 07:11:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2110:e352:d7b8:8bf2? ([2a05:6e02:1041:c10:2110:e352:d7b8:8bf2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm43780774f8f.26.2026.07.08.07.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:11:57 -0700 (PDT)
Message-ID: <53b7b25d-bd24-4231-a43d-6740dfd84162@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20260705164311.2273-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260705164311.2273-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e5aaf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=LDBv8-xUAAAA:8
 a=5uWOEY44YF13KFjEAh8A:9 a=QEXdDO2ut3YA:10 a=xtd0hNyKXt8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzOSBTYWx0ZWRfX93cGKZQUUaT8
 HobTxNr+xQvuCmDArsC8/qAbdDYv/0Vrb3a7zhs8c8BKXumKhhSvPl7juTtMbTa0d3Z4o0ylfoU
 twpbyVzX5SHUIGENdY1zGbRdW9KOtcs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzOSBTYWx0ZWRfXz4b3Vyys6gbS
 jhk1yCd1Z9SP6CKljJ3zT4XLrNmyn61Wi0ngWRqVOrdoKGEWZsVxPes69jPM2TNAoTxgkC9v+J4
 Um/jg9mfldGnCP6rzpYLkLZw2GaIf6fVZQBwuWsOCZ9KBoQtnQDHvydCrI8++RkB1szKSJy/UjC
 uG1HwFB4QZT7yIyTdIInQpb3mQqWH48QgZhWE5GQI32soCPItJuVDqYUiucCEb3X+0rj8N4lJvQ
 cO2NM2nfzKyikntXE08MMxfTuRGiuKuU9crVD7J9J4E2eKfk+PB79AvQhmKQf3YjqT/wRrozS2h
 5HvlUjOr5S60+CDXQS5f57/0o0RwGXHl3MvtiyJ960CjLafuxWq9x/+qrWnDwOQVLXCiRGG6tt6
 8SfjdzdpEfLzndkOeZOQyCNPnEzJaXX7BCAdlN+l+FutnjnReOlq+r88nmdtTySqiFM10CRxfCb
 afqN0QLlnz16Wv1Nlqw==
X-Proofpoint-ORIG-GUID: swIOF2nc3qHdJF6QwPdpSi8IQno5-LKf
X-Proofpoint-GUID: swIOF2nc3qHdJF6QwPdpSi8IQno5-LKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071200_109773_551DE031 
X-CRM114-Status: GOOD (  11.01  )
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

On 7/5/26 18:43, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied, thanks

