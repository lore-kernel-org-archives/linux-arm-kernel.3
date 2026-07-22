Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB5EC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YHKBQCRpdF6ioKDZRp1kbK4J+GBA3HywUvyPdCcLww=; b=uAsQpxonSreIMBLuwfwnQ1qVQR
	3gEPwWaPKSwTtWkqorHDwVVCOEImyNBgZCjPNS8QBh2NJqY2eRzga7rB8JBcKlgqccpVZQRnw6u/i
	/H6EyuZqbkmOAqNpHbGDVdZA+Zh4vUg6mskfjls6bHIri7vnBzZHef1VjA+3to6TgT0UtsDMTlhrL
	tTslgBvPhnIH9G/FxbZLG8/tt0yYnoKjkFQrySDJvoluoVKmXoQOAMnXQGasIlQTJegtqaMclj+4g
	pqM0lKF++jcu85+bQIyHXl58+sottDpQW3+P8agta9DM82m99BSVEqJwoyOYKAl5RDt1wHvmdxG81
	t8FJOUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQnn-0000000B0JN-34zC;
	Wed, 22 Jul 2026 06:51:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQnl-0000000B0I7-0qFl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:51:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53iqm3787189
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/YHKBQCRpdF6ioKDZRp1kbK4
	J+GBA3HywUvyPdCcLww=; b=TbXG+6ospDyHRNKxSuOUqRRzVIszrahUng7O5E7z
	+lze8I1J1fpXiOrHDJvgwqX8aoQcXZZWJDC5aMV5fx5XrHt9ukn9miswexldl4Ia
	N8inbgJHWLRjuAceZWrbLvF9ZeFSU6n8IZPVwExcojK/cplsYA/z0j6g4ZwvBEKa
	AaelhbA7vF9XGAZZzY+2j/1ioE96NwmARPPNZG3zBfBLNA1nre+10hg6tGAjT2QO
	P6amxJ6wmCalzkZJZih6mwn/JnjwUVj9jpFrWA2DmhPm8PF0En1N/ebURZmtYZdh
	zE7MXoZXdontGzgL1QaCK7D9hyUYk4HCuM5j7qjFh0NIGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aec26p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:51:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so182007061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 23:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703091; x=1785307891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/YHKBQCRpdF6ioKDZRp1kbK4J+GBA3HywUvyPdCcLww=;
        b=X7odxdSKhq79D4rSF638YIQ5C0sdAX8l2hOwnIVnOaQjVHAXJppeLAumh465CoY5CR
         XnoVovHe/273SPoEDFIeNFfzKkXzV4ZtMM7gtheLYq1iTmGwj9yaIiQzYArJMOcI8+ma
         AEvfOH2eGj1U+e35WE+7LF0ZzAQ5xNXh5tBZgDdMcwPoPg47Ujc2fhOw98HZlrXuFqbs
         Fu3BWnGDvmcTmOzxd5Q/KtZKOmC2jLTxjjA5hkxKE5gf0X/+JFBW3xwonBCVcZjLtfcp
         Dm/H2Z1ta6YmCujcxSv+51osBg7p/HMyFQ6WbU/bK9U7yHtgdiBVfqjUn+MMG+At4CBQ
         GE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703091; x=1785307891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YHKBQCRpdF6ioKDZRp1kbK4J+GBA3HywUvyPdCcLww=;
        b=s56gZnn3YxZJDfPcPY3A47xs6B+AKVbPxbqWIX46vuzOZ1FxSje7qyUlY91my4qX5g
         /htSQAvMO7gZZWP0gsFAREDTU/zGbCtSIr02cDji0JYCghdqQhKmRx1chDQslLYt6D/x
         3fV/YflYmi2FRqOT3/VKeloYpX7iF7V8sxTmGOba6P449Vza9ZJnXzvZZ/X5ZIW8K8Er
         SApLAxIPWt85IDXY/zSlpFQR+kgztpeM3G+158hVEAr8ec6ZZHI1v9UB3LGbYgLwAkZK
         /dXF4GgLOi87VCMRaHe2ILB3Zwv+10vgkV47hBWSb6mpoxdx2mMXFMDGh26DMjWO8yNJ
         XdEA==
X-Forwarded-Encrypted: i=1; AHgh+RqTzsXSRS8vP8I7HdB8SN6nTCl9dTPYQLmHEkZfERNWqoADptFvmK/L5tE1EznT0+qtMkq1KuGGb7p4aXnee76r@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+EMcYnWnBuwOLmeHMNLLq/S4DaSfbsqsfL4sL0Jb2i5z+9ifx
	Sx+xguimWgpkJjUcM8EK8LHT2zrxxMbbslWNF0DUKkNi6WKFI/0cBz056FNRRiyu2decJzhywWD
	bjP+HyDUNbvbotfvJCi0mqq8JYBJunut/trCCw2mDTMAjLIRV6bVhoWLdnAAKWOnBjlZhw25s72
	tXQQ==
X-Gm-Gg: AR+sD11ADmGND/6he3yfLNKoxqZ7H42seJWIT+0HuKb0SmSuqdYQ4sj0N6heRsVS/FR
	jsVWh872FJpL+mjsIXj17T8sblxFqSkeHGTIC8x0zoUFii+a9+Vd6mITeYg3LY7lFDejYrESNwW
	GV/X7TyyhgxuhYtqoGw0+lfhMUnAfJxyz4LFs65vk3YO/NkldH29e+DiOuJCOq6qBMsf1ODwi0r
	vdUozXHP56fG6GfHFg7u+PKq/nFs+3YvfHTWe7XwT26Q6ntrvD+IVU2mBokGX0fZO2ugSujdels
	EoU9Wpdqv9biZTPF86wp1z1e84PiZCM0x0H8YDl4wG2MiIqZhPPBz4ExpakC4ENYO8kB66x6ghd
	SpNiSyhE+YSqFDVniovzCIBQWzB3qpGhK5tLkHYpCGhBwXvtJEZ7gIapPVd2/iriTTB+CJnxe30
	yjVn926Z22NBF9Qw==
X-Received: by 2002:a05:622a:e186:20b0:521:987f:bf34 with SMTP id d75a77b69052e-521987fc2ecmr132874201cf.61.1784703091190;
        Tue, 21 Jul 2026 23:51:31 -0700 (PDT)
X-Received: by 2002:a05:622a:e186:20b0:521:987f:bf34 with SMTP id d75a77b69052e-521987fc2ecmr132874061cf.61.1784703090691;
        Tue, 21 Jul 2026 23:51:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bae7d0sm316678e87.34.2026.07.21.23.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:51:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:51:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 04/39] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
Message-ID: <62b3bsa7ucgo2g7w75wudt3aundl3hv57qgjr6kqfteve56rf7@w42tah2fnvml>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-4-d79890d00b6a@collabora.com>
 <tjsidlnvswo2rdhqa6jybxrnb47lxgmxdlfrfbasuh67wjbqoy@3a45n3zawvnf>
 <17753a1c-824a-4835-ac2d-8b2796bba1eb@collabora.com>
 <534b921c-638c-4fc3-b89e-5dfc1f269f96@collabora.com>
 <20260713-statuesque-nonchalant-seagull-b9c39d@houat>
 <91c3a825-3344-4ff5-8ea0-f8f057665b3f@collabora.com>
 <20260715-ancient-zealous-eagle-b13e94@houat>
 <dfca9032-98ca-4c61-b1b1-85fd05283d77@collabora.com>
 <20260716-astute-nippy-moose-bd22b5@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-astute-nippy-moose-bd22b5@houat>
X-Proofpoint-ORIG-GUID: Wv-G37SGLqbKjJ3VeV1F54Zo1xIYpojF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX9Wqx4nOOHLcJ
 FBuiZxIc0jwAmGs1TTCrwDSpM8a2HQVNQOpFCzqhed/ex5xMGfI8nxV1KmkKp3n0+GTutwPRaZZ
 WWLHZSU1DgXmJFBaBPbUPrq1C16Wh6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX3YUgKt/+kWox
 mSdu+aFDloB3g+FDl8Tgo6bLtxfSiCkTCsXGt92fpp8iPyOyPaRrskeVDlLgRUXMR5D82Nl0Ady
 Tm6yo0Eq5MyMzHBB18HZgo8Pxmh5L/DH18PFDCo0jzdxDmSrk0wuxA6llcE9lSDwzzmkKh8ST1S
 zQz700/o5lsD8ZIXmIeUEGtPpY+sSGvteFRUBBL1vDl6/QDEJtL5e9zytJsaN4TIaDLwDdyjU4W
 zb9Xp7hc1Wz8yHzwPUpip1B8QpwJTjyJwNIk0PyrKGoWYjG7QItursbFXvOf0mZEVnjSyRAoWXO
 suftGt1RqZ/vWiXK4G3EalZPw9OzWZaUE5zqTvBGuh75NnztzLobXdvxNLBa6fORZkKwwJy62iJ
 00vFFb+nXpQqOgCuZOwUliieW0/BdXetAQ0GEgfGnaqAo6bvJLFcyeutSyD1P5WXcrgbIHFcU9O
 6fhQYorwqkYCZLsJpyA==
X-Proofpoint-GUID: Wv-G37SGLqbKjJ3VeV1F54Zo1xIYpojF
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a606873 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=T-56vAx3aY-Q7tpFFuUA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_235133_361034_D76D1C19 
X-CRM114-Status: GOOD (  46.80  )
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

On Thu, Jul 16, 2026 at 03:50:29PM +0200, Maxime Ripard wrote:
> On Wed, Jul 15, 2026 at 01:46:12PM +0300, Cristian Ciocaltea wrote:
> > On 7/15/26 11:55 AM, Maxime Ripard wrote:
> > > On Mon, Jul 13, 2026 at 01:23:00PM +0300, Cristian Ciocaltea wrote:
> > >> On 7/13/26 11:50 AM, Maxime Ripard wrote:
> > >>> On Thu, Jul 09, 2026 at 10:25:54PM +0300, Cristian Ciocaltea wrote:
> > >>>> On 7/3/26 11:54 PM, Cristian Ciocaltea wrote:
> > >>>>> On 7/3/26 5:34 PM, Dmitry Baryshkov wrote:
> > >>>>>> On Thu, Jul 02, 2026 at 05:46:17PM +0300, Cristian Ciocaltea wrote:
> > >>>>>>> Add the connector-level infrastructure to support HDMI 2.0 scrambling:
> > >>>>>>>
> > >>>>>>> - A scrambler_supported flag to indicate whether the source supports the
> > >>>>>>>   scrambling capability, in which case the newly introduced
> > >>>>>>>   .scrambler_{enable|disable}() callbacks in drm_connector_hdmi_funcs
> > >>>>>>>   are mandatory
> > >>>>>>
> > >>>>>> Do we need a flag? What would it mean if the flag is set, but the
> > >>>>>> callbacks are not? Can we drop the flag and use the presence of the
> > >>>>>> callbacks as a way to identify that scrambler is enabled?
> > >>>>>
> > >>>>> The flag is intended to be set only within drmm_connector_hdmi_init_with_caps()
> > >>>>> when drivers advertise HDMI 2.x capability, in which case it also ensures the
> > >>>>> callbacks are provided.  
> > >>>>>
> > >>>>> We could drop the flag and instead have the init helper clear the callbacks if
> > >>>>> they were provided for HDMI 1.x.  This might slightly reduce code readability,
> > >>>>> as it relies on checking the presence of individual callbacks - especially since
> > >>>>> we plan to extend this further with HDMI 2.1 support, providing four or five
> > >>>>> additional FRL-specific callbacks.
> > >>>>
> > >>>> I tried to replace the flag with a helper that checks the presence of (one of)
> > >>>> the callbacks, but it's not straightforward to unset those for non-HDMI 2.x
> > >>>> cases since the hdmi_funcs argument is immutable.
> > >>>
> > >>> I'm not sure why we would need to unset them. If the driver states that
> > >>> it support HDMI 2.0, then it needs to be there, if it doesn't, then who
> > >>> cares? it's not going to be used. We can log a warning that it's
> > >>> inconsistent I guess, but there's no need to actively remove it.
> > >>
> > >> I was trying to address the use case where drivers provide the scrambler
> > >> callbacks despite not supporting HDMI 2.0.
> > > 
> > > Scrambling got introduced with HDMI 2.0. That doesn't make sense, but
> > > it's not a total deal breaker, it's just going to be here unused. Hence
> > > why I was suggesting to put a warning there if you wanted to.
> > > 
> > >> If we replace the scrambler_supported flag with a helper checking the
> > >> presence of the scrambler callbacks, then we would need to ensure the
> > >> callbacks do not exist in this case.
> > > 
> > > Keep it simple:
> > > 
> > > if (hdmi_version >= HDMI_VERSION_2_0)
> > >    if (funcs->scrambler_enable)
> > >       hdmi->scramblers_supported = true
> > >    else
> > >       return -EINVAL
> > > else
> > >     drm_warn(warn, "Inconsistent HDMI version");
> > > 
> > > We don't need anything more than that.
> > 
> > I dropped the scrambler_supported flag and introduced a helper:
> > 
> > static inline bool
> > drm_connector_hdmi_scrambler_supported(struct drm_connector *connector)
> > {
> > 	return connector->hdmi.funcs && connector->hdmi.funcs->scrambler_enable;
> 
> I'd add disable to that test

I'd make it an error, if there is only scrambler_enable without
scrambler_disable (or vice versa).

> 
> > }
> > 
> > Therefore we need to ensure the callbacks are not set in the HDMI 1.x cases:
> > 
> > int drmm_connector_hdmi_init_with_caps()
> > {
> > 	...
> > 	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0) {
> > 		if (!hdmi_funcs->scrambler_enable ||
> > 		    !hdmi_funcs->scrambler_disable)
> > 			return -EINVAL;
> > 
> > 		connector->hdmi.max_tmds_char_rate = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
> > 	} else {
> > 		/*
> > 		 * Scrambler callbacks are only valid for connectors advertising
> > 		 * HDMI 2.0 capability. drm_connector_hdmi_scrambler_supported()
> > 		 * relies on their presence to report scrambling support.
> > 		 */
> > 		if (hdmi_funcs->scrambler_enable ||
> > 		    hdmi_funcs->scrambler_disable)
> > 			return -EINVAL;
> > 
> > 		if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3) {
> > 			connector->hdmi.max_tmds_char_rate = HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
> > 		} else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0) {
> > 			connector->hdmi.max_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
> > 		}
> > 	}
> 
> Drivers might have a lower limit than the max allowed by the spec. It
> should be provided by the driver, possibly optionally with a fallback to
> what the spec states?

Yes, likely it can be handled with the if !connector->hdmi.max_tmds_char_rate.

-- 
With best wishes
Dmitry

