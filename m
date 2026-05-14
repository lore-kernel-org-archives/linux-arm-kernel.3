Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3E9CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=; b=qkxlw2K04GTbGMWKPsgARh4xa6
	Rp9pxJgDIiE8X2dQV/Rp+M3aVD4qAx/DwQbqNDheDpXyluwyBXNTMcOFoD4Tsz3Y+6nbB46NgaGur
	+lP4DAg2Xg87QJKRykgZHCuZ6PSIjBsRJhyw2nhA2S9FIlgWtPIPVxilR/T5ZX+arxQLGqUKZSKXO
	l7GPiNvu2EReRwoqlq7Y6lFJzc3fSXLR2MrDFkJgyqdDSzMJyZ0/e4yDDb4LhsTwwNToTLs6MPvpF
	k0URsSgMQfZVVpAS0qGF3u9XPYvspMiF0+S4Nj6frMUrWx0khuP92JIROBw7+lX0w3veknWwLgkwq
	OFAzMkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVJP-00000005Tf0-3wZz;
	Thu, 14 May 2026 12:37:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVJK-00000005Tdp-0dho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:37:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeWoQ3891410
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=; b=o6BClnKN8yNiDEuw
	15R/KC3bxZmX/hC1mXf1z8Dh5s6PM4cmyZrMI4iFZdld2n/t/5ip0XnoJe7IK0GX
	/Ped4LO/MlD30gfNsw3sartjimlpcsF4riH0Ci+x5i609eZ2gLU/7gzp6XqdrY12
	OhZcHgp99BhB8V3uf5PZJUXiUzlKJrJocWX6yVIIXBOatCb49LMnlNL76iv/n+WR
	V8URCkO75sWKLzekMwaXkX/zuA62A5SJm+AWg+JvagfgMIfH7xFoyVQ1X2UOw0NT
	gVZ+lm8GbvFZ9q/n31hEYFfyMkV371Op1xqqTgnwDHV7Kt5VMeMAk2fo4zTYT4NH
	zJf+Qw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tuycx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:37:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5751990b248so700374e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762224; x=1779367024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=;
        b=YJDWCoDy/+GeIaIkxCrSvZCbl9C7IH/1BelWG+zg764HmWCpL11I/afKLtXFsVHEuq
         ly2nRW4EZmODOiXBcJluO8X1tpBHooOAiRoWVep+jzuBJVf9RYWEyvc87Tgp4IU12+Pf
         jfbO9UM+2F4iZq1KxVEgS4hz07uEmaGinZo6HEsHetwwnys8blfWboQYj5nrOIt+3/up
         k1oQSBTZM7hECN6y2Kdty9tW0dUk51flXNLS4YDr/YdhQu9+NQjMNiBgQ6bWHg7DljdH
         xRujglk6zt7x0sbnHscuajDuXPIczfGllZmwGE4jZCZaQCBeq0RYAUZV7sW+kcaje6p1
         Dcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762224; x=1779367024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+8jz1452moL9rt0kxt71VhJYhsqDj3vIbzLL2VrkF8=;
        b=N9hBbnrx7WJnEGg9TsdW0vG0sQ8iNkPAsWfJSSvRBcUYuVqXrnvu9/aasRlZ0Yyxe4
         tZNlmi8g0F3hVF0V3aaG0OcOTTLg/sraWV+RD17VMooKZIna9yVSdnsZOE/SMX0PjQga
         4kHgz5cbz99/CkGdS64ChNtMjemwmjf0QhiazxXLbLPbFIxkIFVpreFdffmqT2pW0U07
         FbOzChdseO6Mlw3ZJIfeyQq/GCS2n+oHgdoHQT8XqdRJpDDZOaOh1VlbQzVLI1EJ4+xP
         MzL0g55lJdIPhAa6Ij4IlJOElpYpmLE76bj43ojsw5jeJldzHRfz7Ouv3ZLl7/EfxGVr
         62EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eOHiYefJL7nv1kNlYrPrugnjClQ/uLmlTgd33K6DFs0Uor2VcW+cJnx69H7ztOybZu5qk0m93bOT1dzi/OF5G@lists.infradead.org
X-Gm-Message-State: AOJu0YyVJKYewCwh5J44WfqnkQk4w4oIaXG/l5TsGaK6dTt9Efz8CnvT
	j9EgjhAluPjx9Z/LEJabbERGFdh8ZhGv/5066J4Qtw8GVBxjiO5MZVKwtpal6aKZGZBOnJrdYIc
	66JusTG4lyR0VuFkOEgLMoDwJr9lySs0rmW+AbONQjwS9PIFcbdQgKkncDe6o8MJPtfCIRMiPQH
	PjHg==
X-Gm-Gg: Acq92OEf7/7QLV6d/1uqG91LnScqTJePjXf0goA+9493Pm2j07egbfGguSroDNSa7bT
	AP3/L9KOgSDEWOehcOs7sNbxUj8Yr1sNYuae9GCfFPAcj/whHw5E6W5tpcyGzjwhorZH7xCGXro
	l2dznTow5sUR92MKTUi0kA3skTWBtKnzrXmzbfW2syfqaR37zmsWELq/cj0gZFnAffiI2EcW11f
	5kju3w+V+6KR90kf72K/Plu794/hkNoBy+2IbGCjjsxIokJpKGavICIF31/gzoC3XN+qjdKz6AH
	U4M+V6OO1/DRKjA/Tz64aC+o6bh4PwxSsQ7kJHMX94K5qi3rnZGqLAyiowdxvZdpsMFQieJHTkQ
	bBL83DhbJgD6uotZoyyaXmSXUIFRfTDj00gfVk9RX6ppRWI54ubpsdDMrCrkAnyrkkd8OZHM2KH
	GnrVs=
X-Received: by 2002:a05:6102:1150:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-6377667b9efmr1125952137.8.1778762224451;
        Thu, 14 May 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:6102:1150:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-6377667b9efmr1125947137.8.1778762224031;
        Thu, 14 May 2026 05:37:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm84302766b.1.2026.05.14.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:37:03 -0700 (PDT)
Message-ID: <6efb980a-1d88-4d22-9ed3-1cb420317b71@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05c1f1 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OwxjEWw48HTU6ZCEJDcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfX8ZqeWucKY8ik
 1WuWM6bqhzU4HV/DCpcSJVc3BBesZsnIvIxG2q9VZGG399OXRsg1v53gz1IUfshf/Grq0G41bKD
 Leeuj94t/d47ZhJzzhZ14ldwiwBV+Z4rltZx4mrkUPXd2cjo/rtTWRIzswnwNe65qOwZzclYlxm
 E9kuziDzJg3f0pO/U32QEOEpjAjkOpkpvILWICNncwAtX4ss7i7PgWio/f83wV+ideenDrjM3RQ
 eiJAk2uRs/5CJPiE/gQi7Leirnx2BTfltbKdy8DtUSIfb1zu3MTxWFxf3MDPNcTq7W7paRQuxQQ
 dvVZdaXlHOkGyClp3RYwCbH76QSc2qxvlHDHHHs0JoB/jnAeMT+533g27Gtk/38Z+g75M54MFJ+
 n5KxiMyV0Ig3DQyhYBYm/soumnnAZc7BhAWD2UDyVa9zs1aX9ClcUfUT+vMdcfA8DNqN2Uus4ev
 zagYPFruIapbqGc99TA==
X-Proofpoint-ORIG-GUID: -r7PqGaGWWbHHpyy_fWHZyvOPs_zsDog
X-Proofpoint-GUID: -r7PqGaGWWbHHpyy_fWHZyvOPs_zsDog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_053708_552647_1D68509A 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali MTP device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

