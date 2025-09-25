Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8381ACAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 01:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbUhjN5CIGWSt9WkjZTIH5uwxuwIn+CRrMV8Oz+n67A=; b=j1Jg6JDF8T5/rjk/41Gdfzhab4
	c250vAYwvnC0sqKz4DF1cVUUKz4Yh4dDneZtSbylgnLvkeIM/08RtRvqdYPwPvr0Cx/bQBH7GjKOf
	WxNw6LmScNDTUWXDS4UF/QU71gP0rOGPzcOMijBL3uJ4CNKsD8jtdS9hiXBtULZb6VH0CxXN658E7
	b+pDl9XUOk5UJ3G+jUXE6gMkeOEwHs2hb35q7YqTUQcwWwm6FeQuAwmCEdt3TWWcQBDlNHzZ/HhTp
	tJnp5VKFmXj5cc4ItvKvfvuJ842HSKULCTsgHtqf/ALdnQyZRrlU3fjGfycBt4ADltWZqpVMznuYq
	oF0N5x1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aUf-000000059kR-1jmJ;
	Thu, 25 Sep 2025 01:09:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aUd-000000059jn-04Oc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 01:09:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONq6tb021486
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DbUhjN5CIGWSt9WkjZTIH5uw
	xuwIn+CRrMV8Oz+n67A=; b=DZDayiedObjYn5sPShaRMCrXuWpgoG8g83mwdC4o
	zsMM3TiN5iB2yOV0oFbCpRNLPXroSzKuTXbgcMmWMJqqLPYoccmqPXh5S3sdhveO
	90i6UqZUOoLUIzAQIprL4LvlqoKvnY/qyvMPXk15pTbRxpFxu1l703rrZCGLPQW8
	n0SDz0Ysu7umuMbQpcUQIAe6X2HV/rsTvLqCNHocMMTmM907uRrrSY57evXZYmdl
	F7kftmcyzY1f1+wiVKlAHPxZnooiow4/hDHVgvxRNOJzOhausCigu1YJmwAo+F7A
	9rgXQuZXjCdk7eM4Uqm1vmfru1RExeCpeZPjiFmaKBff/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadt9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:09:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ca4eeb9b06so9973711cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 18:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758762592; x=1759367392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbUhjN5CIGWSt9WkjZTIH5uwxuwIn+CRrMV8Oz+n67A=;
        b=vf1hTci+kk6oGR1howD0V+ke4k2nXlL8jr/MTQY3baltCJfK/n2Osugr4W4qpsIyv3
         xzZBMgPT5FB5M0Vcq50S0ELpna92+rYWvc85J4f0LRsn4fA+DPO57E+0QU50ofqOPb7r
         AOTsfXUO7rQ25OBNwDDC7UGOOR0lDIwrdEcvfDVL8b/8BUsV8VXZF71gVREpbH4cXUIN
         N94+ijK8L2XltFO3okCBz1TXUFuZSLP9p9G/cCNn/Fdq5c1IQm8hQmSAbr4mf47WhPIX
         wWqgnbpJqMuReUCcbJ84QMDhbH0l+IeVIWDjh+IZVKolWpkc9NvhJR0bC7Wd4ZdDm9AW
         Uh8g==
X-Forwarded-Encrypted: i=1; AJvYcCV5Pn8WgZVPe8oLCyF7A6OyzBhkF0WOGHde/qvMPGmoFg5ULzeffY0YMNfmMucRFZHAFEYrBlLsehwgLK5T9kga@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhk4+lqEQUSBObWEE82NbqikVgeWvdadFs+/AG6pcfY1TqO+m3
	IBIwBP17Pk9Nu4MinJlAU3PTYKrTziuxsmDjaaUZhARJdIMhCj+P/wG0rPAkXkzQYEkZnttkAVY
	HAMdzFFhAjdOtNEY1YurHG1Vk6dmat2QdN72XNHUEKq5SU9vg6LwasJxEEq8IRolbpTv9GomZzf
	daoA==
X-Gm-Gg: ASbGncuC9X8wpfLPGB3PWkPnLfti6vbEChiNifHtnDCvpgzEgtockoFPw65X9C3JHpu
	KIcvkMX0qd0XwO/Adz2p8teNWxdVCUIFPhdDywdjJpD0Qn0leFikHiIRcRx/mBpVku3cJ3My9bw
	46vn6UAO82AnN7lma4EPVrRQj09RmHcthQ2VV5S/YPjUXSStATkEFHgHG9eVRUlFLww8G9DHAmM
	E6elXgU1w8sRiDbZR36N6SzE1fQaOsOBG1swt1QLd3w1E+yy183URToKN01xfLNGGIsqtuM0s1g
	vTrJWr4MoRnMmKupXyIoL3KjKoSKA3k+wNUfpkXaWzCi4lr6EzE0B52TX/CA+D7Affrq4skW3d/
	bXcxAzCGJe89ELCM9sj9W2QZh9UPvpkcnCIy7m4Q/XRGrIdTqJoN1
X-Received: by 2002:ac8:7d8e:0:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4da4c39b63dmr22909191cf.61.1758762591311;
        Wed, 24 Sep 2025 18:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHy06/44VJG9y/4ON5huaolTpEddWVJd1dr3xZtLHQ8wyGirA7dIu3ZPD6BlpqavkK+a5x3g==
X-Received: by 2002:ac8:7d8e:0:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4da4c39b63dmr22908561cf.61.1758762590203;
        Wed, 24 Sep 2025 18:09:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a3252csm183105e87.119.2025.09.24.18.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:09:49 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
        simona@ffwll.ch, matthias.bgg@gmail.com, dmitry.osipenko@collabora.com,
        granquet@baylibre.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
        amergnat@baylibre.com, djkurtz@chromium.org, littlecvr@chromium.org,
        bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver
 unregistration
Message-ID: <72pgsr4birfy5wtf5umsfkahr7tplnih5wxoj4x33igapaspmg@7iafkarq4hzg>
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
 <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
X-Proofpoint-GUID: gXjuV-Za8JWFa-jOseMFUhEeLFML_nP0
X-Proofpoint-ORIG-GUID: gXjuV-Za8JWFa-jOseMFUhEeLFML_nP0
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d49661 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=O6Y6ztsS-7Sf4rctI10A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXx726VBCqhlRG
 48vpxRQARfvAJxrHw9P0rDfeX3iYH7nLCO3CJpiFpJo8Bdj3IvehbH3JrIWYSNUynCmjMW8wx5b
 4iB5OtTzLpDEr3k0AzRYJN2HpNWgAYQPIkX58mwwCIQGKgmriXTvnZFImg6x9WCXzS0ZzAE4x5w
 oX+CCz22jIxFKtoWurcGP/LIj18kXcgZCzzCP2eIGvyFFAvjnfQWl4O0RgmF8VcxjvIk6PXq3/S
 NdYoMOCUqkzmSp+JGEevhPx/Q9gMxqLiLBFywIJaFqPyRhFoJfh8wfKQxHvsegjrVRtM/28TCKJ
 B1zELKkeW+wufVRvMaVsI8hQQR8xZ8krrZsQAR7x1zh1EhQP97dKlT/iR8vuUTNf3Ffe9zR3duC
 JKvLayUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_180955_170318_5FC3CDC5 
X-CRM114-Status: GOOD (  21.41  )
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

On Wed, Sep 24, 2025 at 12:37:06PM +0200, AngeloGioacchino Del Regno wrote:
> During probe, this driver is registering two platform devices: one
> for the HDMI Codec driver and one for the DisplayPort PHY driver.
> 
> In the probe function, none of the error cases are unregistering
> any of the two platform devices and this may cause registration
> of multiple instances of those in case this driver returns one or
> more probe deferral(s) in the "wrong" spots.
> 
> In order to fix this, add devm actions to unregister those and
> remove the manual calls to platform_device_unregister in the
> mtk_dp_remove() function, as those would otherwise be redundant.
> 
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 

You can save yourself from all these troubles if you store the
registered device at  connector->hdmi_audio.codec_pdev (see
drm_connector_cleanup()).

And of course, you might use DRM_BRIDGE_OP_DP_AUDIO in order to reduce
code duplication.

-- 
With best wishes
Dmitry

