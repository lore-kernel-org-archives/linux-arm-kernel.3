Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F75F531C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cvg9O/QkoL6L++yjzZgvdyr7NcHvlP+82mqh/kFxhmE=; b=qM/fdP79R2S49wxqlX2Y91/J4r
	7bTjMFdVZSqBmUWbSxCzd4WPlOlN+P5e8rL7mq1KZXOzDXoL+fBoH3hXc1NeNGfCN3Cyy7tqzFwHY
	DOqg3v/ChwtIkcXDDKFGKUry0rYhXpk7TrMkGTQvvEEHyuR8LGtQFlFHNL731NPchaXFVUGRfkWNI
	dncsV2s1TC8Eehhl54z4AhgatQow3CtWxWbnuw2soAmDmAZzZk24MbRFk9z1EHEASR3VgO8FeIgOn
	Yy+iMBmfMltjQMD2AlD4vmN1Oggymr1NDhvHoav7U+5ox5uG3vjxyyA7a7zoX5AbsyZXei/fWELmT
	sJa+F44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLru-0000000GBSf-0hLF;
	Mon, 13 Apr 2026 18:18:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLrq-0000000GBRF-1txy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:18:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DF6QQ93752203
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cvg9O/QkoL6L++yjzZgvdyr7
	NcHvlP+82mqh/kFxhmE=; b=pRKkzj4eBCLt7MBIHrvfMDHA8m40GRD33k+hBScN
	2Ygbk73IPzEDe5rG8ZQVNp8xBORszviNd5JgeNCOkbvUnUKjd21Wk49Ec2c5jaWp
	ZuFeKcPeVikXiC5f5XXRfMKFA3nc2UtOSWQeAxW7U6+2nIKSHrkRkL1O7jVf5MJ+
	Pclf8y65gFhT2lcawQlBhx+jbhrc3dT4B4OZEmPqWu5IFEwCz3xMcaRHUpqu/OHE
	5YdK3FVApL2VjsE7Qc/RzlpqDsG/Xfz7W7golo5D7kaxCNwer0pxx9pFrNarWl1S
	o57bOBJPnO7cOv3F+q6PLIGpZjy9Tks13KdMF9PWNA2ELg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh2tu8p5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:18:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso114303881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776104316; x=1776709116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cvg9O/QkoL6L++yjzZgvdyr7NcHvlP+82mqh/kFxhmE=;
        b=giPxfNq6RjGqJ0XKymc7IZr9NMDDVd4UaNIvXNgRN1B2A/pev8G153fHF/J/Vpcxu7
         ja2n28YRHOOdgx41rlIS7Lt6NFCO4SJPeF+YfQ7c0Sx0c2ux17K5iUKcCudpQNOHB6kW
         /BdEk4dUXEAJqZvsd2nhyIeMNum7fhtMcrrclsl7SFBsm2M9XgXLVFok8t5kVmZUBJ7P
         m3/+XpLuSfxG/6lufRXyYiHw8Z90O6bc8Sckepx3aXIkCfMOldJMQPNy+H1V/FE+MvNk
         XW/tMB02dZisOXMBc5RevKK8V22SUl4SVqELA2cMFBNkkqzdtA/63aEXcOZS93u+eExH
         pXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104316; x=1776709116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cvg9O/QkoL6L++yjzZgvdyr7NcHvlP+82mqh/kFxhmE=;
        b=ebs2sh6P3DlAOxrEvt5o0aZ3kRRkXWDqyfrBhzyExNekuyXqeTTTJ3DlB/UPzg2aaG
         Znc8AtWjjMsyOCnBarxykh8GudF4TRGBzJT3svU4YsQTpTMBuA1I5YUhJVNbCPsWPYCv
         DUStaapwJyUI0uhIR0CvnQxRYxTPkmNWef8vHLsw0OaJccCfjdBTvSvWHHMM6rWejFul
         KblBadw20E2+EsOsemGuMSj7Z9yjm+GkZlELZhH2f9YvvnvHRJajeu2+gKH3Su62sHRA
         DOsNCPOi81XJQm/ebqb/23trtLlkgvTmGf6Zsi5YSKAh4sI2XfxkRTjJkjK0c2cOIuII
         l1rA==
X-Forwarded-Encrypted: i=1; AFNElJ+7zGS2OZrxMzStndr/t1VoUndDFH4aYeI6T5f7VE8VjrF6PPATh1HSJTMxO3JrxW8+bvOwWprMUAWrd+GODRCe@lists.infradead.org
X-Gm-Message-State: AOJu0YwPEFA9CqSyXeO6Proxabsw9DfdR6F+uh4ynt+fdNKlAkpilCLz
	M+PkHfTv1YkIqWPztn94A7ehZ6F4Z6CE8HK907qElxHtdx1L+u35rSQtJdOUV7ddVFY0AV7Tjsk
	6ZIo5L5yAABmuiq1MFM1VrSLXQq0U2s6U/KRBm6yNmjEHi/sAyCjm7Ns1xGQ4MiGx2UFEcSwEHY
	RyyQ==
X-Gm-Gg: AeBDiesjlxQaDNyH2FeNYAvjXo76/BiQ9oDnP8aYP57gmEYJdVE/qBuB7rJdZeBDYPY
	JqdSdKGW+T3UQjsKWfCR5erZUrTMF7Mdwgp3jVD1iJFVSfTZo43mV9nDyIArCCbXTOVntcxjlX0
	K0lTKM/tiiGIxNOC6DuOvWJsEy2Irhfbo9I967X/lLPvGFnVq7B/R4KtUYkcuvZ6q7zfm/bHFtf
	GtH6mRYJO9PtNCekCeCr89ky4lfstD24c+xtYLMAcclLtS6/rCUQWGgGgDTpwam7szl40ddj9RN
	oZDKihXXJQjk8ILw1Vo4ypLfq28kWjvyCm+s0k8zC9y+9agRZiZyfUfsMsmvLhtObkEbwqASoyU
	eX+jtMf97tlyBlVsqb+XKqPUqYex4e1GaPRYMYeXlhT6nnnOV7UtWTpx9nq5jRauI1Sw3Wzo3TP
	N/rXvX4F7yl7phjUU1yoL5t61a5OUyBfAFm029hUeaLLFtWA==
X-Received: by 2002:ac8:5916:0:b0:509:348f:bc1a with SMTP id d75a77b69052e-50dd5ad989amr232216181cf.26.1776104316422;
        Mon, 13 Apr 2026 11:18:36 -0700 (PDT)
X-Received: by 2002:ac8:5916:0:b0:509:348f:bc1a with SMTP id d75a77b69052e-50dd5ad989amr232215361cf.26.1776104315794;
        Mon, 13 Apr 2026 11:18:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298f1csm24034161fa.12.2026.04.13.11.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:18:33 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:18:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/10] drm/bridge: lt8713sx: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <5d4juwqjm2wxxzd6vf3rjrsrp3xhg2spklukvocwrdenuepk6v@a7mdfn27fsgt>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-8-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-8-acd01cd79a1f@bootlin.com>
X-Proofpoint-ORIG-GUID: yRJFeMws295iR0yQEYKzO20Yd1IutGyz
X-Proofpoint-GUID: yRJFeMws295iR0yQEYKzO20Yd1IutGyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MCBTYWx0ZWRfX77Xsn/VhZE72
 si46r/0+GhgQ+sjxUkYhroiKz8kMcNLfjYY0jjEGaf4nCSGXi5Cv22Z5aWXcpWw0gfS/Y688Ens
 n0oUyZoVjQO3jXn+d0wPlbEr4bQLTYpHO3vc6+Fz2Hg1vjAAGqSj8HtI5Xzm3i7uoQQRYGmr5mv
 +E4QRAm+BT5LrCZjUi/rOFA2pYQ8xAfVB6sHGND+VFrI3zCgxXTMqiDUNmbxz5dhR1m3c6LhxKF
 AWVIy0qyuuZXA21Eua8K4nHeXZVotsMZ8uPa14lRHELx7E/30YfTjNyFt5gyZzaH9Abf+9UR32/
 OYYdM9jbahg5YGj21jGRyQS1pqiB54bbg0MAjEY+cldN3KZ9qwkDUsWHyUL667cW6cO9XchvQwV
 +O12g2wkCz0HcRiP/1vF4OdRC9FDyyQzQ1mMxvJf4q3D4yJFtDhzgtsDabF+d5GHpc+Ly0DDpfV
 4mdw37VJ7q0EqL5mJPQ==
X-Authority-Analysis: v=2.4 cv=RJ+D2Yi+ c=1 sm=1 tr=0 ts=69dd337d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111838_610212_0ABC9464 
X-CRM114-Status: GOOD (  17.84  )
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

On Mon, Apr 13, 2026 at 03:58:40PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

