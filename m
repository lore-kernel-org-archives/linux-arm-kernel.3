Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E1CCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 11:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=; b=paYtChCiD3OPs2+lMqnb46t6UP
	2cBjtpYxCTxDU/TB91NhbUWdFWAJh6zGt+w6MYn7c7Rf1ZS4JfJbNhXdTd4ko063xKktG+JlTq45m
	3hvDqsBDDMnEHBnPebmgGKql8HsNFJiBJ80YgFJJ9V71q/EbtNBJBh9ufwzBUfiayed0XLbooRbpb
	yvgodH/VgNB6dNqIpOkPaBS7B/dNahDQXeUAjQV1MVWe25RFcQnscvTembxltwSimdHFgCOBzjfEa
	EvHyGfNk1j7XrwU2ewKSsD8Z6fg8xW9GwcIfC0aCumZnAZFG3AEs4cU58nU0euaZll306resFVZBj
	1bgl3HiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26Sw-00000000j6i-31K0;
	Fri, 26 Sep 2025 11:18:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26Ss-00000000j6D-1bnu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 11:18:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q9k3S8025866
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 11:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=; b=BSUQ5OO1IXahVIuV
	Vn8Ku/wW88M79HlafbRzhLbeqlgfbsYTcgba0hO3JM4RJGdeUy59wHOEI50o1ePw
	9bWfmr1qmXKbOyzPbh7Nhf1oybSp49g36xYPjfD1H1bQqUs4D31V1sqdumkbJREa
	7xDKdPmo5XjjMS+ctOvkrYZqJ9SbwqEXiIY5ILTqiKZxxBPD4dAg5fkRhV8ZFhWK
	iGEZnV8piOhPbPhu5gsQj8W/Kk7HhuJAnLWKzXAHEQk9YWtRtpNGIGAEc0Ok/G7y
	vSjaSUoeWIV8kARA2y/DZ1FoO/wDPRK9sDHrywxChABlyRLNAsXA1jkNFW9Km1gu
	S5kp5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwg8rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 11:18:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-819d2492a75so86379285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 04:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885492; x=1759490292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=;
        b=C75l3hzV5tBkhfwZCWlyua1gBt18O7nRf22YJNGgbOBm+7uQQUIKCId3MXMeEd1yvY
         RT7I59gEqIq6qQi3d8u6+DZVVBtXO8vtInb1bcZ5/6dT8i/LOb1eSNGlM5huLU5gle8i
         azGQuwVUHoNN+EPZ28gAtoOhm+/4AW/2vGUa0YCXlvSO8KWnOeWfVccShIb9Khhr71hE
         pzg64tDT0sSMBv7RK443i0fY5RPcKa/dNTf7w9FMsLxt0RP+pUmdq2nls06COHm92wpL
         o5NZd0vQenGCkSWBxLQ4rrmyNbS5TJatHv5rWIGxRu0FP16OsbiyIKeW/eQcgds1/JWT
         7Xpw==
X-Forwarded-Encrypted: i=1; AJvYcCVDiJirzW7PEGvrCLrgz0N0kqvUxoRnXdBYeLYX/+cZG2y9mSbuvQKyOX2S+YljE3gxEEayFb08GUdZYDkmWbdy@lists.infradead.org
X-Gm-Message-State: AOJu0YwkUQLJxgIGfhSOKzXC7Mr32g1b5FhdvpJtfwqixNKQDvqF0f7d
	R4SoUkjU1PVYVRK+KzG+T48r6PtVVvGnJGWZP6QYNwOmjtGbiKoEYrbPMFlAoOTn94v1y2cMqA6
	FQ/lMBdM8iplVkeQrBl6G2OyvLpq44Vl/rqE+AUoLHE55qwL4+l81wkPn6pJl0mb2zoC1S0y3Ei
	/5rQ==
X-Gm-Gg: ASbGncv3+ZhnuGW9QSpWLBXcOgkJYevFkq4g5zVhkJU8OXfO+fhPm9s+ZexkYBfcsb0
	+YTZYTfLS6AVRg9ng6D5k9bOZFnQQfpspqJJx2GQLilv1HkZRKPQqzj7s8Rrb1SkS5nEg6UacfC
	I/ZLLOHE8ykPvOID4vA3crKVAfeMgx9kw/lTajA+oP3CgkRsfd352njzgU8w77HX3SWFpx6uliA
	2eAaM0NiwTt5s96NPpJEqne+vzJwkuPVGU03l9pVfyaAQcPIZdj9f5t0+AWdA+ap471foknT560
	C4XnoTp3iXhWhe3tDKd6zHpJi5wQMpVr/o1ktZwW3TI/fONLpwtY1rPj0VvAGXFSpzNuyqau8Z+
	Zxq/FZu10adUtoqo8pGnjCA==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id af79cd13be357-85ae6d81db3mr601251885a.9.1758885491721;
        Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTjabHhK02b9oVhzoCCGFrlmQKMMkgWl8q77/ykLbuE2cCJPi3DSQKHtmGntFz7aUmVpFMZA==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id af79cd13be357-85ae6d81db3mr601248385a.9.1758885491079;
        Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a983ffsm349631066b.94.2025.09.26.04.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:18:10 -0700 (PDT)
Message-ID: <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e4ijYdAT7Khdz0u9aXgynGzzG2NlCDO7
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d67675 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tFSzMcqD3SoeBU5fSnoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e4ijYdAT7Khdz0u9aXgynGzzG2NlCDO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX5Lvl1K5uhgWJ
 GQ7jUoOvGVHR6pgj9IVo7j8JxUwdlbKnwyDrNWaE/ym8G7JGmKvYx8uM9LakKDlnNMnixr0z1cf
 1inRZN3hEUz0SELdzCoNfMuVZR9qKcstun+/wbQwm9AKvz3Ilx82zOaXHrN1ZskfqU7htyh6Es1
 b2aMK80z53qybHAV2MHphYZ3mnAl1HrAfULjxyentQehHQ54Gvba4b0i1WB6zUew7pK0o53yIoF
 tj7mT8ispsnor02TjUZyiBqJsLKYnKvMyaUaWjIqXj+2C9YkWwuvw/m6nHCI10pKliPV+DZyHxD
 HkeBb4+edxu09VI5CThUNzGOdJ/4P/udouZXoSixPxkPhunQZ/G7kucI66sF4jhqfV390gfibeF
 htY1nzZuMBVR0UD3H0PJ2by6se+/RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_041814_432656_49E6EDBD 
X-CRM114-Status: GOOD (  18.00  )
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

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..f247aad55397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },

Well, did you see what happens when you try to plug in a display
to a controller on MDSS0 and MDSS1 at once now?

(memory corruption)

Konrad

