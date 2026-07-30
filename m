Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0675C55168
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+oYZclcsoyBpPMuFhCDB16evoi/Be0njDL+8RrwXAE=; b=lXQyOQ+ISdlVK1qLh3HzWPYe1V
	z0dAXwGlh/bxukGXftMISt/qpmlVWAqI2fxUgb+g6fI9rwUb7guU1eT4qrDSQG0zWuIQwxQhtfXNr
	NHosEL4WptZwQwWRHRvY6xTDvi1kbIkDO5TJpuqVQk/uoS6GipBOUfCGUlyDmhCiZXZmv005f8AIE
	wS9hirYBq7PYqIqLgc4zsFPKqnRaBBp/JZBikdNDK8uzptbzjVPG6GBQYaUdnfT9J/kthQcqdVC9Y
	rUrxRTEMVgPAUo40ivJuLrn4+sJn08ASLDoGkijgS0bbt+kMoEWWL3cd+JmLQfQZXzGxE7raNdzrX
	VGZtYkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRbo-0000000AjNO-347J;
	Thu, 30 Jul 2026 14:19:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRbm-0000000AjM7-1pAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:19:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDbvTT972637
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t+oYZclcsoyBpPMuFhCDB16e
	voi/Be0njDL+8RrwXAE=; b=DyhAbkPLmpDz8Fk6GCx2bPi/DWaEufFRre0P0qxE
	oSMzgKiDTv/oYWO0lZELMQXXGz0x01CutRG/PMREYYomKABL0d7coL7K0wfCO5VN
	zQlRAt63jNpzcvqNuWZWpmMD86Xat2tca6OQwkgRzYoq/wEHhJIjqtMsnpKHi52y
	z/eg6y4fNBGzhy1lr1owiqHBj0y3RCd5PlrHDRMGtyY8pzj/KWtxnw3ZdF1mH0dk
	r2/SaHT4TsR7yHCAqSnDY1lv/GhSEGEhoSw8q1zlhdsrHbfgVvgBgHmh4b30ms5m
	VY2Ag9fqxyMcSa42xaLufu4eNOrAGNzTvB03nuc522NcBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7nv0672-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:19:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso23298541cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421177; x=1786025977; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+oYZclcsoyBpPMuFhCDB16evoi/Be0njDL+8RrwXAE=;
        b=UL9Oach0i3CPSVdS0UpPeVcPC5KVUV7Km+Sqmi6AJDfQ6K7iwLhu6hAzTRbTpiwaGP
         4j+SiVNVSNmoNRrkuOfM/b4gTryrBi85bJ9AWkKXxHh4nc+HJlQBectWcnitKiDhFOjE
         hPUBq/5MUJ808eSocS3pUrdrP/mjh9bhQDEhkZop+tcM50nbLk/CbrpQLKQCoIlREbWx
         blKC3Zg5HAWWSUNMv+w0DwEV+25Fqm4SRTvBigPakxJdM1j038/H1aLtnNYjsSMrpju5
         KM0jPBrCqbI5UtSGkoqqyEg1p6ubpP7JiwQ9pvO+byVNfbGV3Ry8YSb8glzB5RJBP9/+
         lOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421177; x=1786025977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+oYZclcsoyBpPMuFhCDB16evoi/Be0njDL+8RrwXAE=;
        b=N2QRFvEdE5p3yi/v9l90fPZw0LDVlVOZB7RzT7oYzBo5MHCoSMJnRSn7eyLk/veM/m
         L9qdIQxBXo1QutztvaYhEV3OyxzvXZEM8SYbcqbcBQ0lGdMtyk+OxdTEFxROCntItFTG
         Zpy29DV8x9vr2yeJJubR590wzF45cSPLrE5IXq+D4jatFpPZ9XKcR6/GBPf/3VBpYcX5
         QVLnNT6RmVso1b5k+aRbA+PU+jtUAFyY0ghIrMZTto30hq11XLsHgQrgkdG+ik5RAutX
         1PkN1sm3R4SyQ1JrUe6V5K8Tt3ysX8bffhdbP5zcBXgtaYzwIqkG6a0wj9J7nIIk/rC3
         5hAw==
X-Forwarded-Encrypted: i=1; AHgh+RqylCZuOhqH5N7ljn9aZag89M/r+HX52FdfDFSnMhrSKIhb7QVcL2JkS+S5+WU5MTukcH3X2SIs+Jif02IvDLpu@lists.infradead.org
X-Gm-Message-State: AOJu0YyuHGSBcdlpHHhyZP28tXO/MNEJWKbHQHnWBqZyKZEbaasNNpbF
	gThF21Yb8uV2aBPABlrK4bqG9CYKEQcbpSOPKZAgWrGebRUi/TrqfDr7avTINDSwiEzk9A1s0P1
	nfBPPURn1HsWxCAP+b2BEylibTOA/6SCNVGObmWSdewkb1Hx5FdJi+sH9SVJTvtT9xpn+2AHQ6G
	dBQQ==
X-Gm-Gg: AR+sD11Y7MTTq7/3B4ddoSCdQjHuwkVtxuTbIQAAMsfug/JSiIhHvUM9Q3AyAgs3atb
	G7wV+oeOfLr4OAg8htLejMgGMazv5+s5mKPl29vEhYFMqfqgRnkgMTQvnLbSOktV4s3YbzGDV32
	NT/0uTfw7twF/d5xVO1BnDeYV1K6t/ubZY193iXXmWgUg6XYI4UwcmtEXLUcmTcfzpax0YAMoC2
	pMv84FG79v56EDYQjR2GAINCP8axSXxRX7NyjVckXv2Ywun3/JCpStbXlMYXHb83d0mfYRWZFN0
	IpTKKGW8SJ4tmmZ/aIU2n+E5GwhJMTDOqQ+VPNIsr/8ykIAKwycmlSWHJkRmUXhTxVxqgvavCE5
	GiPaEvuB5zOqyrXxi+Tzq6eeIVsGwdJGyrLdZCQ7W6wTM9uJQOHneDvUD0Smn3TSRKWcZCVhVVA
	JU6jJi8y5jYVqiKA==
X-Received: by 2002:ac8:5955:0:b0:529:bf39:f1a with SMTP id d75a77b69052e-52b386be80dmr27854471cf.71.1785421176025;
        Thu, 30 Jul 2026 07:19:36 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:529:bf39:f1a with SMTP id d75a77b69052e-52b386be80dmr27852851cf.71.1785421174000;
        Thu, 30 Jul 2026 07:19:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba882sm368911e87.43.2026.07.30.07.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:19:32 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:19:30 +0300
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
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v9 03/61] drm/connector: Add drmm_connector_hdmi_init()
 with new signature
Message-ID: <exkyukl6jnkwwoap62v4n5j4obyhoks5ysbo7iqjdhzhb2ltsu@nyp7csbmzott>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX0+NIwiF+s4UB
 nIE9h2aiVOoHaOIxRnovFXINZ1jCi52tLVvAgvzmCH768YlqbxQxOuzSnj1VmbDcppS1VFZJeac
 37yDMqTsQGmVVJckV/3cV3K2wK0RTfDUsDHJGwUB4pi9ud/XeJWSC/KLe/qZXiLGOnxthTwAT+M
 FLPIqX6gxMASlE49JhWDbm0xf62JaB1afHxqolb2YsEygEyWMf2ZcXbZJhKK2IsnJGp9J7DqV3l
 OOdQMsY1ZDjuXy6tOv8ZO+0Uupgn/PbcnCuTJgmLc0R6QPHSRU1wMYyfSIkXTURGIkIsa6WDDEU
 22UtYqlE48pH6GDiQpPKeIt0MgBe7gljHeCh2kWfYv9d+Xs6or1sf0zPnzA6nuEZP4mKuitEpL9
 ruECWWgBAoWnmvsQP3a7XlM0J9AfPlP5fy23aTL33aMLuKVyA75wfy/CsajQ98vSoYjT5coQNFG
 hssq5kwHszR8nCB1v9g==
X-Proofpoint-ORIG-GUID: Qq8dE0GgiGs_CcPoKiNEqzkFNoHam83M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX/ABARAmiHnHG
 TNnEAReHqPtqF1vgLFFY7nWMmdUjLdZC0JQ2Aj3LJAHJhCgAccnxMAZMMG7gLDKXdHE+xHjYJ/c
 Ity74Frj9imbnFWSZpp18qgy5X9+VrI=
X-Authority-Analysis: v=2.4 cv=Fpc1OWrq c=1 sm=1 tr=0 ts=6a6b5d79 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QX4gbG5DAAAA:8
 a=L-MVhf8o2HZ0jOEqR2wA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Qq8dE0GgiGs_CcPoKiNEqzkFNoHam83M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_071938_584561_B93C904E 
X-CRM114-Status: GOOD (  22.79  )
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

On Thu, Jul 23, 2026 at 04:34:52AM +0300, Cristian Ciocaltea wrote:
> In preparation for providing HDMI 2.x source capabilities, move the
> vendor, product, supported_formats and max_bpc parameters out of the
> init function into struct drm_connector_hdmi_funcs, and add new
> supported_hdmi_ver and supported_tmds_char_rate fields there as well.

I really don't like the idea of putting data into the functions. The
data might be mutable, it might depend on the particular platform, etc.
while funcs are typically static. Even for the drm_bridge case we have
two separate structures: static funcs and changeable drm_bridge
instance.

I'd suggest populating that data in the drm_connector before calling
drmm_connector_hdmi_init(). The only exception would be vendor / product
since they use strtomem_pad() to ensure them being properly initialized.
I'd suggest leaving those two as is.

> Appending more HDMI-specific arguments to that function would not scale
> well, hence introduce drmm_connector_hdmi_init() with the reduced
> signature.
> 
> Additionally, add the max_tmds_char_rate field to struct
> drm_connector_hdmi and use the supported HDMI version to determinate the
> maximum TMDS character rate allowed by the specification.  Some
> controllers, however, may support a lower rate than that version would
> imply.  A non-zero supported_tmds_char_rate lets drivers override this
> default with the actual controller capability.  A value of zero keeps
> the limit inferred from supported_hdmi_ver.
> 
> Callers are converted in the following patches, while the old and now
> renamed *_ini2() helper is removed at the end of the series.
> 
> No functional changes expected for existing callers.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 134 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  62 ++++++++++++++++++-
>  2 files changed, 195 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

