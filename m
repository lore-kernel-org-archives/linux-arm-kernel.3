Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FBDCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWhAI0VAdx5gJX6gdXCdFadp6xIz1oz4Ky85VfVuHlQ=; b=rOhue3RXYIndxkThBiEfRzkH7T
	nmL/ygARj3ni7A73ovAE2OtA6HN1JbgGvwiQPB7qkP11fTG1O0B2o9qzDqV5IZDJ68OCjBFUyomiU
	eallVLNnsrDZv89jNBn5LnyUWfTMySMKDrSCglbdkifogso1yDPbq7lvMkcDUEHsMxfRA03fJgqRw
	ZK20LmkDxItDkR35wTLsoFSXJ7osIjZrqo6qwHAdVcTF3ERkwz7QhObT8JZPMvbP+lLieg6VEMsBp
	QYp70EQy1xj7y34aq/xTziajEs0jcSVFYRK9ACS5Iti3gTmf2RStrnI9LwLsBNCFB7IcYmG2e6A0g
	M8DvJsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28re-00000001iGN-0eP9;
	Fri, 26 Sep 2025 13:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28rb-00000001iEa-2IP8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:51:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q9k7cc025875
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oWhAI0VAdx5gJX6gdXCdFadp
	6xIz1oz4Ky85VfVuHlQ=; b=neWq3WgV5JI4jS54Rti1aBWRVmSsHiLpjdENlaOy
	aiev+6faw8XbnAb+BNkJ+ER+6bqiD9s7T1ZBkdHvP4xpP8xL3xv3AN3RU2GFU2hu
	NW9PtWZ/XK7Dc3Sq8PyMcubuolAHywNeg08RWb7yCjA8y/NmXxp7cSabAnuqU7Xc
	iSAjSRaF24g0R5qpedkpEfRI7VNKHGCnToKMTCcwQjK2hpCrdo2mWjA9wnHTqYud
	u+/LWL2kQPkggfppnPMnFgwlfaTCrS+jGjhHCir08k6A6NaN4F54+4pRoQJg0gOo
	etaN2og3s6jxRj2amO6wS91ATyezWhsrzEXmBDmp6DM9Hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwgnx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:51:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d413127749so44818771cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 06:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894714; x=1759499514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWhAI0VAdx5gJX6gdXCdFadp6xIz1oz4Ky85VfVuHlQ=;
        b=MbQ+vdRnXzrycUMEZcK5b+BkXTOHE6zgi2NWfcD/xYRx6/rfj77ClfMSmtCpvcY0B7
         Z7/Oy/7OGXNJTceY2HEvgXnfJ+tuyT9NwFcTpZhKS/2EHgETZ4NWxiETwCEvYkOkS0hR
         Tuerut/r+TWnDveULTUzmfKKUrt3tMiDJIMknyo2pMQB+8c+phXqxDaEA4gcxNbhM9F0
         Oy2oQULgEnppFvqyKDmV1lwoQwXj9KQ0bpKTfkjIIGSc56c9fqT5+aRM3U70KOEzsXLC
         +9jJODXQb3AxxZnEyfJAt3hwWjah+E5wQI+/wI6ZrohH5ma7wXX2T4ML6KqRxKooZNpe
         9EYw==
X-Forwarded-Encrypted: i=1; AJvYcCWlZZlTQxmMxKaaauvEPC6bFktLFDjsJyYT3Fei4AcBdHzTuvAr6XkFXxuFBIjBScAdmbQSr5i+q3DOL1jcSvDB@lists.infradead.org
X-Gm-Message-State: AOJu0YwZnkp4gADUviiPFw45IZ7F6ittxZaM0gAMIVuFT/IJXQDvgWm0
	G7dWrt02+qFH86aHRQuF/wx03q3AZrIlcNKroH0r+IXJU1z6FLy38rqCdfsYyzsIet9G+fpZBjm
	eMSPMfydfwRtGvDqRNLd6J7ZHdbHn0mk83tBVVBeXLnelYn2W4CS3tC2HtFlLs7BdgknGEfBKba
	116Q==
X-Gm-Gg: ASbGncujLa92kGR23n89HU/7xVDzJvPx87ZS8SUkFbsvwJmsbxfzB9xBLhvsssUb2BW
	C0kAUWQrMqloyaAaG5osXidygjuoG6XTZw+qhHQEK5x6kxt5zjtOWYxbiCj3REmEHwoQwSHtcjQ
	+UJaQu8GTNCX74Vx1QH+g3VmLk+ao4y2+o7DFA/cEv3ZAYmVW8otKfIHdXJTmWhcpFilZVqR77h
	hPkDmHUNbh/pEkMalQ1i1euOvXYoO1p3fi1epdFB3ROuBE+K6qPious3CEV1qxkdU7c5qU8HrFD
	VJDRF74gBcztcLfHhGW63nrDGthKavR+Na56RYKrCi4X0bKAaeWwSt4eIs6AGUbyH/6tJ5UjfGo
	M8gAOIgWJBH2VdBriOzNiBHQo7cLfIfGDDEH29b5XXqFLJU4ZCLPF
X-Received: by 2002:a05:622a:5a85:b0:4d7:c9d3:cbb6 with SMTP id d75a77b69052e-4da4c96e753mr94986131cf.72.1758894713499;
        Fri, 26 Sep 2025 06:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8YkJGYw1+CDemqZBbYI88MpytkUH1UcPY/ucGdfsLVPLTx/bR3Xx/PZiHi0DE/0nYLVZtkA==
X-Received: by 2002:a05:622a:5a85:b0:4d7:c9d3:cbb6 with SMTP id d75a77b69052e-4da4c96e753mr94985671cf.72.1758894712878;
        Fri, 26 Sep 2025 06:51:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb771029csm11547581fa.38.2025.09.26.06.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:51:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:51:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
Message-ID: <c4o6bcvl7cgmvklvnwj7togokawvaiqmiye3sgdlugwftz45bh@g7vfktowo5hj>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
X-Proofpoint-ORIG-GUID: h5eyf9bl3j5HyJAxm-XOzugHICKb8bbS
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d69a7b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tFSzMcqD3SoeBU5fSnoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: h5eyf9bl3j5HyJAxm-XOzugHICKb8bbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX4ohF13z4/qgd
 yYgG9ICnP5ETLRSmsuSPqqLDeNwKTOsriB0TR4Qga2Ypo4EGy24KVwBb7ME51LJBt3skssePlZu
 Ny580CgBQ3zMs+YoKZbgAdU0cw1Ffl7wXLLZt9eXxYzPYXH4k/Ri00W6HckLkfJJpFVZe0K8eOj
 CSaPURvsO7sCB4q8HnCXfZ5YOhwBDDBoVckwHCRijIXfxuAMPwIoJSIoflpg1bY3zXeqs8A4tZa
 uYX2oKinmFzdped+vqd/2PhxACOw2iaT/oL6L6BQeteZuYT4OQ509RjxTknzcwvvHfXTBCFvd1V
 G3qIUnsiyax72EUJ9DluB56DpzYG/DGNi/SGceD2CXpy4nBgHurbKgbNts8ScmVgDGzInmO2krY
 XKgp/dKoUK9s3+rZhqzQ1EjU6XgVrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_065155_588368_F74DCC63 
X-CRM114-Status: GOOD (  19.73  )
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

On Fri, Sep 26, 2025 at 02:29:53PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Missing Fixes tag.

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
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

