Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07352D68B18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69aZun0GtiasFSLAFi5iK5p51tzghc9vHnuyXGjV69o=; b=ss28cAn21mg83DVBrn+kHaEdp2
	FuiYuE/dZd5fNNO6HDex8hDE6vugw1+gFD/subo54aujwvoVMhEauRun8qMJ7+iGJTzjz42R+XzVI
	ok+hfNlMtq9s8c6Tp73rnC3yXlOmon7WLrdBbUWS538ivM2CGqhmdhjosT9TG+Vhz1smLb068FRnO
	fj3nEhKSM6Jx1q/pdKNTrtc+F8Dv5JsVgOQ31q4U5sd9pjA9StzG8AykSAPH7C4e3ED4Ieo9Cb4Er
	vBaXyeykt9LQqAmIjx3qku/DFvp+xNW6ebzmynwdWlSzn5eLuGt9SZ8svc8gvzBnIXOOFbzKYqQnD
	CQdi1kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBa0k-0000000A4d2-1lNC;
	Thu, 14 Nov 2024 13:35:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZxR-0000000A438-3Gpf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:32:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6cHse026884
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 13:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69aZun0GtiasFSLAFi5iK5p51tzghc9vHnuyXGjV69o=; b=FZhoFN8XHTnQqamd
	/nxIrUWsU75YE7NaNRGWURwc6SNDOr5O+9kglMUYMyC4G2JfngQE+6DSXgnneyQx
	ToQABXWo1khb5dnCT4ZMNOt4pK9t0NYqqzpZDRN7s31+vGRu/Nh55lSv29qWZbyA
	m+DaHkvTGiVGsfquypdYE7OOQRSMJweOXjaeYqIgBxMILGAiIkoO90X3goz/I3BK
	2WaEnki10k9bbEi7uF4+OFjRYp0AEoM1+SliwDUDeGPHxY+0npHMRTk/rz/WxvMM
	RJ83NoV9htJbOyz86YgWTkgz0GoYHs0/bU9dPb5A2acbEgZgHalEnH0gqRmuB8/d
	LRUO+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vt7350j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 13:32:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cda6fd171bso1380826d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 05:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731591143; x=1732195943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69aZun0GtiasFSLAFi5iK5p51tzghc9vHnuyXGjV69o=;
        b=ZpEU+FJ4UYWis0AjjKgZHthGz/+Yg+YAECwpPm1ZMQsd33ljF6CHyVE95+hOG8eH9y
         plIzavKKSbktaQ/n2Fv2YwYgw9YydrgEwNidktmlqYCA4KGOS1JH33j8DG/e796l3Cn8
         XpHq6HgcMuSoKORsYrwl3ZgBCgEZCsL2zuv3XhCEfX6Vb+vU17QZJujGI7PemSgisn3P
         FWOujlDQPIecHBArEWBcUMrP4qtrT05isZ6HzBhFW34gr2XEN4tMp05dbf2kFDk9eViC
         EwuOOwPqi+qx2RUSM4gAmpuHEzAdT203QNSGnkkDRvBs/u9+qflpunBUxXYAykgQkvTz
         6CuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbSl8KFWFITIVp67ypbnqb3P/FqaM4kVfScobidnFCWOfjN7zchOmY5tOx7queAk8aUtwjaYzoQu5F0CiF+Hj3@lists.infradead.org
X-Gm-Message-State: AOJu0YzWUMpqg8L/zVAdTElzJcCVjF+jiuFium6gkq/ej1fN1QrhUEIY
	Faz41agTp97ClKNJzljg4TaErlvpXzA4YZUpKm/Aba3gxytZJ8BXYMYj/61Hi6+ECIc9/V6qd8y
	mT+hMysEvh4aFI3lvhEtRrk8EbTNwRwFmSV4TPMdt9RZlps3UiVC5LvH5O9s65j0AagW9rLOliQ
	==
X-Gm-Gg: ASbGnctiWi2LePJP9YLdfAwt25qwEYcDM1ye5gSkVBYXK2JFpQyjD+k/rVewu3Z5RD6
	cTwMui80QQyrgxnuCWZCNmaDP3eaPSB5W4qFyfVzhpCNzEJCx3T7X2SrZ5xswjP5s7ztLnU4OW2
	FdNQ+oM2TsSafLwrd4XyIJJAola6f0QXpeOoaZiDlVNzPfNGpl6HEIFiSUo9q62Hi8hQwv6xKld
	1igTzfIRFkLqZQQ2daTBfA3O3TJA09iygoXS7p8goIxfzFlBVJkaVN2qJVNXD/ZqyaOu6K35bcc
	3LZQjTxuUyCoqwOILuuZa1B5xbNsPTI=
X-Received: by 2002:a05:620a:4415:b0:7a9:c0f2:75fc with SMTP id af79cd13be357-7b331e4ee53mr1277583285a.12.1731591143577;
        Thu, 14 Nov 2024 05:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnnkk58laYKQusb97iyKgh+0oqbjf7UMfJRyrL+TYbBL3HaTdZUyxFrlTIeOPllvNOALq0Jg==
X-Received: by 2002:a05:620a:4415:b0:7a9:c0f2:75fc with SMTP id af79cd13be357-7b331e4ee53mr1277581185a.12.1731591143140;
        Thu, 14 Nov 2024 05:32:23 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e080a90sm63884566b.174.2024.11.14.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 05:32:22 -0800 (PST)
Message-ID: <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Fange Zhang <quic_fangez@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QQt3NeEkMj_zmqgnHF-rxhuxTPRD2SIO
X-Proofpoint-GUID: QQt3NeEkMj_zmqgnHF-rxhuxTPRD2SIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_053225_996317_CCFE56B7 
X-CRM114-Status: GOOD (  19.47  )
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

On 13.11.2024 12:51 PM, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for DSI 2.3.1 (block used on QCS615).
> Add phy configuration for QCS615
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>  5 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	},
>  };
>  
> +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 21800 },
> +};

I believe refgen is also present here and you can reuse dsi_v2_4_regulators

Konrad

