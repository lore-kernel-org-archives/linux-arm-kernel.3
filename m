Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CEBD58CBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=; b=ULxH6oJAz2C8Nxt9wAdm7zb74P
	2ATFrrRxZjndi4SEH0Tzt98VsfmhPJQaeczTBHboLIAqQFffxre7aKllHAziCrz/yEpu5gmY5efdm
	/+ecKE88YGRe6Ku2/Xm2jmVJcd0OQAXs8p3YoL7wMOLsrKt1wbjP/DCuAWFo7DSYKf99pFSIPLmEX
	kIWW4aolRP0zHh5YubZZGl83n/0/R3LUk7KPJ9tn7y8URKMf7ijJzp1kF7ShUAfDOPG2hRbQpaqa7
	ZbZo6ncrjcNI3oJRPtJ0o8+GJrsmyZlhgwp/+XRyAWcHFT0ZSZPt/Ws3PRKqvRDS6I7fb0RsElnwb
	r5NlzujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaO-0000000FzEp-2zYl;
	Mon, 23 Mar 2026 04:08:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wa7-0000000Fz2s-3FtG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:08:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MM0K0X1317414
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ieE8/etbiGBriPXk9aLuLM0
	adGVcwwwVV2c9dNbcDA=; b=QgFuGqQYpMk/v6+sTtS2E6AyyL6NO3xR8buOH2KD
	I3JgL+cLyjr3rD+QRimtloHVuf84G7DYRVfjZc/Qxf9yfzASQhU9ZBd16DDsgBO6
	vaFOhHq3zID9O+Ha5ORB1e9/Wua7BqsCXQHRipSHX4TG1eXT+w9VP/d1upa2ziJP
	ddhAHSVS3NzQAcUyIA0yvDZM019E1fuTODHJUMC2DRD23C4ba90Gx/VhTxXEv8cP
	Ji0TYJVfBHZR6KCpef/ctsORGlbMTjsWeK4J3pEai57inymGl2dJRY3fK5149XRu
	AA2Xsdw0/jLjQIpUTSqF+CyzbyH1vkyaESJ3DaUDrWCBxA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghbh67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:07:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b5f675be9so69043131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238878; x=1774843678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=;
        b=KXFq4X2E3TezUziayvlwVV/5ylTYo1LFmcmST1SZwWyWcGZ6dIz6igZG50atdi8iHz
         LG18pLMl0hitrnsR1Y9BlGImsgwy85EqvJZEJVtQ5TGCSGC2d95YErh8GgA4/nsB1vvC
         35rjm4XrbmZDXSXIPtuSOdNCpWl+vg0i647osa/uVDcHmx5LNzwJqgJgzyMiLWJfLGgB
         WFI9Z7R11M4tWSmVOeBaVRi24QqQQF2geN9tQq93KKI8vusOKirqDOYN+e2W6/Yp7mDc
         uU/JSI4Vfi0fEtWLWnPmL3peE75DlrBfjrTU1/iuQzb8S1iFdNDbv6GzLih6xmSX+4un
         hhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238878; x=1774843678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=;
        b=GgWQN0kxJpVtT77ZWbjQun/hCgGYaSiVOY6rKjuVxlovtvNjYXI+l0K33d328O80qx
         QZWiapy09IoQxlRPg0q2Q7IEOPdNL49P0+DUNPCEVJ5PoE27SwujGyRpQhbp6PotyKmT
         OtQZ4PLRJe7GfeSNg8HVdjCAwc964lBjL/x3BwzLI2132TD+zcH0Z0nVic9zsytX3wwU
         JYy5OQdcmGwmNr82nXbtsNHT222Z+/NjB42U7jsz41wZ/13zAB4dkfjeP/99zxONsR4D
         Fj5CxdMMJyhhHpePOqP9LZ8meS1B3wV62e9bDeiREDtVViKm6JwS2ClAgX7LbkVHDWUj
         4gYg==
X-Forwarded-Encrypted: i=1; AJvYcCVsu0SMTAiFN+5ooeM/6OKoa8VyHPLqsRZNGQuDH0/TdmrpPcPMqCKuJPhwfk0ZblnmD4xZv8IYOaSSL4uyNf0B@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvf4Y2gdpS8X1506P8vPmW8n+mPCIEXKocdo4IaS9vgsRxbqT7
	ndZpU9Y81Gl1D/vyf27AzIF9debgIcSXnouqcdN7PyRfuYaWIoVdxSopjAb2UjIOeOPU69Z/8W7
	ZsE9qg05p8fW/pA+JFr253a5oOz4s+3/Pw4iMXMMzhkNjhdsxDLTAhGS5wmujVzoYbjrJXvThB+
	nJUQ==
X-Gm-Gg: ATEYQzzc8touVb3a+nJM8rcnjGv7DAcY9RVFsoQOtOVMDniMrdB/CCW9ZjpFYip/k+m
	1qbSMElMR07a8QDfGeWvS+G1M0g3YW55HGsX3HyFS66hhgwN4S/oiKpLq1HMMilLKpbbti/62GC
	xSxuzWW2WAPAuX54u+bYXxSP78N6AwHmU/hQyCvGgZMFv9Y4TNh2QXDpxSr/8Vqyf1o3V/rHQ8A
	Me/2la+KsyZ1YZVFLur8ksqigIs914m2Q10VwhCWlKzLzSmTMQbcwMRz7wQ/2WqLyQehVsAL8D4
	XXxkKtJxf09rgM/LpbT1j62GBrUagpSuE/YxNJZLyrYop1EEJuCEwYaBZDM8ZFYpke9Cun77xkF
	jnebHkpTH+078LkNqashEbMnzJ8P32IvpKKWCnLTr7kqal7yZIRKAzTqxMt0mz0WB43kG5hrELr
	vD8EGTXd+Nc2LYSiyApgAHGOrBfZDuuwJTYU4=
X-Received: by 2002:ac8:5813:0:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b4e6598f9mr88670851cf.64.1774238877901;
        Sun, 22 Mar 2026 21:07:57 -0700 (PDT)
X-Received: by 2002:ac8:5813:0:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b4e6598f9mr88670581cf.64.1774238877393;
        Sun, 22 Mar 2026 21:07:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b5esm2239889e87.16.2026.03.22.21.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:56 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 05/14] drm/bridge: adv7511: Convert to
 drm_output_color_format
Message-ID: <orzixmg2drbnkygv4wz77ddlvbfbkmhg3hydt67b6xittdx3qf@2hghjym3ggon>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-5-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-5-f3935f6db579@kernel.org>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0bc9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O2P03feSXV0Fh_yUmGcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LYeUYEaekdNps0_7vMdx2UPwAQIHbhBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX2aNEH+zhZsoi
 /Z2gJtilrdvGxw7s2dEPxAp9I78U6jSc2/Tjqnfo5dUgtMESKsfv2ujAaXXpP4z43pRMo9ssK1F
 cOfQBs9kYTVhfhruQoK4R5uXD/SOJHaN/jx9dx27wuVk0o1Rw43jGOo24Of8UJiKBA+iuko1Dms
 B3PNg1A820WtfCyFw9hcBK6VQ5D5MPtzBbp/T9WCV1rzaF8TV9tebT5xpB/z0TIzf3BbNb5UruD
 9SXTwtivNaSbxQugw/dLug3E+3Yi8rvH7qhWOlW1/mzA1YNt57pcUxBd7fCFKpFvAQspQ0/89J5
 hLydga1eJ4I7+2l5UawMv7C8/bPH89bMfAd0UYp2oUK5S4etrre4WminBn5fmNpkg3tzBPlBqc7
 NMPe6wtkMD89/hNrwwm41uMQDiP+gWB6R8w2LTjn3lB2Xn0GPgaZmHYUll6pml1Md0V11WpoHFv
 7REW9zBn/10QYYQ/TlA==
X-Proofpoint-GUID: LYeUYEaekdNps0_7vMdx2UPwAQIHbhBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210759_817569_B8BB8BAD 
X-CRM114-Status: GOOD (  22.66  )
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

On Thu, Mar 05, 2026 at 10:04:57AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

