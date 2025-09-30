Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE2BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1prKZ4v8aUicNJIrRPB93Z2qBSZpWbI16ikZz4dczC8=; b=URBbbEFFHQB6Ft5ZE08WuEO86r
	cz0DwKutp8nNf3CMUzsSaWE4m1P2wXnjjg4CPh1ZoFNJMXzwmj/YxrXiC1SHMNG3+FZsDGbZCWyj1
	6zaMx9VLhhQsU2egv+ta+ntAZIc0VZnSFHAWm++Me5VWcOv+Z6WASiZBcfBFcpMVDWGhnBrDoUbOZ
	e9FXNg7nShcqVyWgZ1MsyhDwxcfNaHhYp+OzlTBA94FtTVhw3M+q6ytbSmXHJ7DRF2iiqyI52kTCK
	hC9I000e0fh2ZRsDmvZ8fNK6EPtnWziEvIGjOSWLMUnc3pk97NUv4BIznpdZ+Ngf8QqQhvH4cCehA
	pEM6/5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3go9-00000006A6d-0nf1;
	Tue, 30 Sep 2025 20:18:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3go6-00000006A4i-3YmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:18:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCIn2I016331
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1prKZ4v8aUicNJIrRPB93Z2q
	BSZpWbI16ikZz4dczC8=; b=phrIoJPh//YjDsPd6tBBkta/NYufyjsIgztdxLMZ
	AZvqOF5x6Cq7k7hO3vWlIFKi/Q2l3CWCZ11YULAuW0t0OZ2b3pl1O6nmoSAG/bwC
	CtM3r5IUdX/w8EzIqd8MAT3aJxZEMkPVQb1yO63P53KW7/XTuzgjHBdgQP4bqgRg
	cfd7QNe1bDajr5SObgGIQKwRT8CWlory66hqslK3qw9GPJaZUJa7kxlc+Jom+3Lv
	JEt1iGDAxu74RjzeriRN0JIGkq3+4tnjVbc9ygx8n83DhmbX3WOnWKfDb+7IvjPz
	xDLpEU2gkmxtKgNCeVzbUsmQvgS762iIdaQf7uEdPYnU8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr2b6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:18:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de801c1446so103409601cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263521; x=1759868321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1prKZ4v8aUicNJIrRPB93Z2qBSZpWbI16ikZz4dczC8=;
        b=FGW6qPp2Nqwyj9MkYmxFpjB30nWEMGvZmJNeeZ50RaEouCy9Xo8HTgumWQc7eFNsQs
         gJWWDzPRZ9zdIthuS0Lg/thCQRJYugI/JS9WSKs8aySWVF2CYMkdoq5r5/bzPCWrKKqc
         maItrpjAwjxoAW7XXIakSdbA4nwdvtFU9vKJjUU2vou2eiYJKX9mM5zkxSicqTOWGMyO
         FW2IjkijuInxsGcogVy1LumiJbYy5/kDxqpd9UR8l75KvyUslzJ4E36TC/HU+PcwcLWU
         DpQwGyOF9GEpo+YZlmXRfwUxZU/3PaNNvXNE8GxiSgOB4r9PPR73wMmBzC8derf1SaZA
         OP4g==
X-Forwarded-Encrypted: i=1; AJvYcCXbygzxUkY/yewkUu6tHI8dY/JyrCKQBjGUUJZAzZWoSzeNqSzPlPp8gQ8nfY4yblJwvL4v6Ys9agzXoUmE2RhD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo+PUMj5ktnb+5hBI/Fu1dnENN8lEvZ4K4zm85uyIOuWEMwsHV
	Y2bgStI3X87TmW1l4nPUqzgW6uvzHu/pyv4idZwaOxB2nCPi8n7YkRyWVOSALX9lnfCFcsjzSaz
	UILrOQCE2XJo9eNLnGg1jnAO1CwHDqR6JCuJcEpvIVOCerY7ndBnktFESdgs+tFOvhaXl0Trg3i
	fK+A==
X-Gm-Gg: ASbGncsSqLMHXY9k2Eh9e2BlNCCzkPVYl8/hglGfUoH5b2CMSV27ogqcRnrZVQv+0n0
	Ljx4xAZw1k+mXsNJ8EwAzcKAK9awwZTHF0mV1/ARQ9ppbwmjsvlX1ICQkBqLJaPUZWRAzqHDcyJ
	LjIr5kDTAOijIOUfTCAyyanlkwnBs4hkWbjB4jMz8k49PEhBcatGW1rQumfFsYzf4CvU+0oUzpU
	mABbnEAL5Unad1FDKCj2D61JnRTFN7K3r1XIpxKQzeq6EIvadrugDgD9iD1/m8XG279rMpMnW+k
	BPb2qaLDYP/1isS0zDhZ6F9CvmEi85S6v3A/5yx0wqSwS+u+VYOYUR3+gU/Tu4IWDn2u17xaEUI
	cajmugKhi8ID7Y8ZRfXOYQDHQN/IdndC9gE8hLOftUlyMkcOChEW4ABKfkg==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e41c54839bmr12914561cf.11.1759263520692;
        Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxICdUQhJwxyOP6ey50e51aF0tOi4+IPIxh6uK7udyhkmudoTzU3ziqUxuPBP2Y+j6k4Wbw==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e41c54839bmr12913881cf.11.1759263520062;
        Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb528259dsm35069431fa.31.2025.09.30.13.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:18:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:18:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 10/18] drm/bridge: analogix_dp: Remove unused
 &analogix_dp_plat_data.get_modes()
Message-ID: <hh4kn3qmwdbfev27xrs7eng7adfyli5xt7oiy7xgmviz2pzyql@rgggrhqckdjy>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-11-damon.ding@rock-chips.com>
X-Proofpoint-GUID: VUFvHZdZh11hFYHm-zWg-cFXu6b0jO-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX0zgHG+aUmpP7
 8xpYaXypUVlkqJFtgUE/rYAeI+xx9VIz8LGCB5/aKlBVFs60YUxj9PP8p4tZNLzy2HVWzJYOeqk
 KmiXagFqFAhehbudPjTHjj7u2Osa0wBDllmXTg7kK8xanhBHXaa72zH0fMMaOH1wCoYQiyg4PHk
 RsukiRvKRA1kmeWYcXy75SeKz3StffjA0flOdCoTHW+mbdEyC8WCPOxqb0VzE/FMObrE30cYQ8r
 Gz2yzOrL3209+kN3NrVv62glzohZzD9PZTJI/9lxBXgFVme7ZPJSCmMOh4BEBcLlM9iMYZxX53+
 EcfIwGTZMBCPa2Be6EKCbYz28H8W7+KC5YC86lyCFTXb67h3gsExmdVUOzB2TP6qGkBJmLwf4Ug
 ThL+KzD/33tn86vrP8e0VHWtja8O8Q==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc3b22 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=eBbjTLbptxnSh8XXWekA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: VUFvHZdZh11hFYHm-zWg-cFXu6b0jO-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_131842_883732_382E7B41 
X-CRM114-Status: GOOD (  15.20  )
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

On Tue, Sep 30, 2025 at 05:09:12PM +0800, Damon Ding wrote:
> The callback &analogix_dp_plat_data.get_modes() is not implemented
> by either Rockchip side or Exynos side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
>  include/drm/bridge/analogix_dp.h                   | 2 --
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

