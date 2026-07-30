Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACFFC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeJATUx7ljVkLhlZlRGhQEAKTzXhPv+shwk0WDPgUfI=; b=wxIiv+eoiCfn6KrxxGbXdDTqJL
	7YlmL63o9LY2Kuzc4jCjrt3f6CNNIzVqPAd/gfUnaWNL9Sr/Pgn7aD0y6xmVtJn6RgRyZo16qHk9X
	SCHXEhrVvydyApCELkXy5PY3XZQsHoHu2Vf4Ldk7YhQbnEBXIX07gH/mTkriCk83JJWpFsxRMSFwk
	Mt2xrN0Zi0/4OBk66oPukqazq979Cxb0DEklYLATfW07Twzr27MdIXgnrmkpccgKX+4UkDPM48dCi
	hdcUfTWC7T8pdI/gHEvJlf9TIVtbfZiWzoyB10KQx24E1oRiihRkqk2UIlaHunlPIuf4s5eKKIwkh
	i+xYyJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRkb-0000000AkJG-1bjt;
	Thu, 30 Jul 2026 14:28:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRkZ-0000000AkI7-04n8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:28:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDxHOW944518
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TeJATUx7ljVkLhlZlRGhQEAK
	TzXhPv+shwk0WDPgUfI=; b=C2YalGhSDICS4YRAXU2U+L8xwNORatJmUHoMwofp
	qqN7zufjbU8P37qCC9v/oSfnJTFw335fRWqFZRwWTwZvPjssYqUAJH1YqlvTybdY
	RaMXj8bmjYW1YnKlr2SmwhSDNWQAqe9hTkQ1ouKGjAlvZ1ILcJ6Oaw7hjjgJARMB
	RNA3nYnnNLijiCCoufJFiKBoc9YGo/+ghAfKIv7Eb3T53vJGWPAhiLUHIdEH1D/V
	fmyI8Sb4jwi5K2KRQlg1QS3hDE2hrTc7hC9bRyN5teYGXrmbUtmS6i/lRRXXP3vC
	OqsELm+b+ksxIjy1qcgPuEKkXGtiVd2YIRTyzOiKKt4uGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7yt84gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:28:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso7656971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421721; x=1786026521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeJATUx7ljVkLhlZlRGhQEAKTzXhPv+shwk0WDPgUfI=;
        b=jaY80kRGOC+hwu2Caadux9NbbOj5fLw0sgzOUHleDR70SZoEBXDcOL5nOId9f1Z4Xn
         V/gKx9v0NSlzzlSAStJ7uWXDaIsMhjuJnggNxG6FmrpfYP3iAZecZD57ryUDeDwF+JnV
         Ma5AFc1njVnqDPtDZ6kbaVqoSIX95KiCc1fS8DyRB7JE5Nv62pjh0X6hafKf7rOSlBvW
         5jE3zLWd2eSVfdRsdcyJLYL4XZOg/02UH/nRQrwNyvYZej9PynPrC3Hu8N4eDP6NnVVh
         RC/oCmi6hXOSbNDOC2vXrtJbDaVCB20ozLFspja5CcTbFK0dj5oarDlvc2RR3PedKibH
         K5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421721; x=1786026521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeJATUx7ljVkLhlZlRGhQEAKTzXhPv+shwk0WDPgUfI=;
        b=OJ7+5N6XB59yIT6MmV6tWmTkHdeZE8rCb48TBGzK6QBnjANURuJu6UsUKc4bqWNeRM
         dFkN5j90lIN9VIy35EugUkZ8e+iBK9lo7Wjj8NuArLcXWaXmjV37Xt4yFJICDrGi8L2W
         bdwGDSAGi/MlXmsAqLDeqRzp01hTC5YEMlTTEgbO/IgEFka2012axjyusU6+8z+NXmw1
         wc6w/eP6hHeUf6iLOib3juB7X9iO9eZ+TTMHO5x2H/eRPDQa7YF2Z4EosmjQ7MA2NMmg
         QQsf/LGELG2SrgHDPQo06/C60qnoDLAQRIcdVayXChZTIDsKeEJKwoNx9LEcZKOeEmc2
         vuqA==
X-Forwarded-Encrypted: i=1; AHgh+Rov3H4jzWrFZkFEM1lQ0Larnr/uGH6rONL8K34O9hSMAmELWDfLlRwYSaeEsVmUVjxkJ9hB2F0U8tE1WEZE7RC9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9U+w48nzEwqU2EtBqB053d4jRrDhNGIRfWmHo/Y6ggZZGfNhd
	U480D/Smq2eJeb4mxzCK1jQLuONmKak1R1TeMB4shFnG1LObIv+RfL6DmRZuu4ZvNWAPV23WYBz
	GuWc20YixIub6FIRDvAerZS8O4RCKtc4nnJMQAtRLfHSDwJmqEngJ9sVR73AuzleMQTzj9yjApi
	DNMQ==
X-Gm-Gg: AR+sD12+iGpA2q2S9PkhXWSdwORAhZFzxM449F1JqD+lAEh1s5SkV7+IdqHR+kT9YDW
	Zq0c55rLvUh9C+H3WoCvJ5mgcqf2OtWqt4vjQAOo71/tMOjWf+F+JLThlAGV7C/KHAkoiF/X04A
	rOSfv2WucwW0oiwtzBf7xdrgPqVvAOBOIWUOQkHKf+XD234iUO7qLzW0txxgcPONUiwNCmUnQM5
	yJkYynD5sWHYaZWiajYBofjTRNXcp5Lzdh1uLA6GLvPsGVLzakD//5er/XaM1prt3XCnB17woYN
	MZDtM2wjdJvogxXl5xt7DIhMjln1x5jTgE6tzIxfLyjae+Kpk0lTKYZ8+gnAu8NxS+hGY08qb3i
	a36pIbe6TKVYYf8idfO/vyatDVwrc3RMAtrSyzutZqhXrI1OC2jiNjESNnHv/uEY5wJnCkBrDXg
	8c/ikbcb8iXLN/yQ==
X-Received: by 2002:a05:622a:a10:b0:517:9407:5c38 with SMTP id d75a77b69052e-52b425c7cfbmr6250111cf.24.1785421721139;
        Thu, 30 Jul 2026 07:28:41 -0700 (PDT)
X-Received: by 2002:a05:622a:a10:b0:517:9407:5c38 with SMTP id d75a77b69052e-52b425c7cfbmr6249781cf.24.1785421720708;
        Thu, 30 Jul 2026 07:28:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9c518bsm369768e87.59.2026.07.30.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:28:39 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:28:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Algea Cao <algea.cao@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>,
        Phong LE <ple@baylibre.com>, kernel@collabora.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v9 06/61] drm/display: scdc-helper: Add macro for
 connector-prefixed debug messages
Message-ID: <y5776gxmfby42d25sp4zxpevhuj5s7zs5sd2i4d5xe2dodlbwh@ovrkyvgakd3i>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-6-4fb12ea22ac9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-6-4fb12ea22ac9@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX5/GWqQQCorHt
 0GW3eIZwpwk/5hT2J+SivFR0WvP+rM/JHgkb86oa2vJ0emdmLVpyRhZbpDi2dwcbtib5F9TiYxv
 3cYAjdEv5PTV9u9RAMxJ6pNc0GMW3do=
X-Proofpoint-ORIG-GUID: ueExVE7Wn3JCL6WBXEUdZ9UMzsVLLWUd
X-Proofpoint-GUID: ueExVE7Wn3JCL6WBXEUdZ9UMzsVLLWUd
X-Authority-Analysis: v=2.4 cv=QNpYgALL c=1 sm=1 tr=0 ts=6a6b5f9a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=69EAbJreAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=1j1XXGRfLVQr3Hd9viAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX/dyogr6mNBBx
 p85/ftPyqb6jWe4zdcKtf7/Oahcf15DSHoxg/3XxpdVqKD0GV8mzA1ct+bULhKpBH+nYfrbUfhK
 Q2ps43LEOgXzCus50NdtD7hYPQ8mdUqf+6Tj1vWt5iWehA1SLyMFA+nq3Cf2vUaZg8dOoqGvT0n
 iAxocEkX6qYvKbwo8smIsyn7VYFwDqBh8qpxD85yqlGDz5srLb+/e6Xaiy7M8LIA1LtkAxp8IUh
 dbRxULjBQ3smNB/Bey8lS67nXGnxAnO2mZkl616VHklN1ORZsTks4mjzGMv2a3pA3Nf7wRfq6Ty
 HbKFJOQoMAtURfsZswDjgiaQwqAzUM6KEr+vZhJR3NDIgZEg+iAvuQQNzybfve2Pkt27wWYZprn
 ZGYD5bMlLD3Vl27cpZyAy3mHoLGzsFYYlgyuuQo7VZDhV73M/GRzkAf/UUzeXapArvF6Rgr82R6
 Rh2dT27FWYXvN0mko1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_072843_060114_EFA7698C 
X-CRM114-Status: GOOD (  15.10  )
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

On Thu, Jul 23, 2026 at 04:34:55AM +0300, Cristian Ciocaltea wrote:
> Introduce the drm_scdc_dbg() wrapper over drm_dbg_kms() to help getting
> rid of the boilerplate around prefixing the debug messages with the
> connector information.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_scdc_helper.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

