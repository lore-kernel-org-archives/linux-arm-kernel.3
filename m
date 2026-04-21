Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACFBF8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=; b=AufUCoaQfgb6wHIJSRKPUic1tm
	3Bi7yGalVpJgNO02bsg1h9Q9DZp8eK+n9WpmZuLTYWE4lNtS+hL6L0ojuH0j8q/LPE3wkqvlgEsdJ
	btWP0Vl8eengqQzDm09bkcaLGPOqznydwDx9kE8XA/CpvqIPElU50wx/8K9RAhJhs1DqUPbtzXXWq
	AfF4ksnYn8Dj075pM+ZOtM39XI0NGxemF76NAzRku0a1cQRjYnd2a8nxPGQ/f1JXsFaoJnYC+enhZ
	9won/SHgdm7G1fybYOH6L2iK1hqVLP0tKzCV0Gm58ZnqvOMSgxZYh3Mm4rThA/KKyU49clCxbCtHe
	/ECG8MUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDU3-00000008sC0-1HIu;
	Tue, 21 Apr 2026 15:57:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDU0-00000008sBI-0Bre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:57:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA2k9X1809748
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=; b=lDFHNou77qSltRFT
	d6mQBV2twhNcfaV3BWEzHvLwNzBM7Kr1tQOtNZtfUAUFioKt1G+wO9ITN72NKDFS
	5UDnm+2ORgJBRVYctxjUSqeXte0QTQI0whKUztK20/S9eDDxSBIKlNzGfG/fTzzZ
	krNDDSq6SqgYvLRhpQAm/le6Ped08gdfIz5V4pBftRdXaXoxVN/KLS6noPl6QxFV
	gnRDH1GOZwh0PUZDpyL5fTxXld3145ylLiprYYjdW/HcbSeUAo6FqsnTbISkgNcV
	Flq5TIjocw4Vyyk0U0euYYEWg4ecfkIQo8O4rKkrzjjubft0Qqaq60D2ufG9NAxB
	IUFJfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp74xs55c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:57:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf01172bso46869271cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787070; x=1777391870; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
        b=hobTYMMCDAzPQPz3gysPmWH+oCTO4HxTxZRmyborFWSQa8++xelSeIDy3NhmNTTJP4
         tpZZhh4c3xrmTtn/wDN/uDbHPGJ5vhMMlf1Sr+P4pCpHshGQq8hNA7rhvkLf5LUAx8KY
         hGcbMaZfP5WEPM9N2li3YRyTLppqBimn4m1+HTxhQyVADCzEh5ZDzyrVIvyiLBB3eHYU
         fKAAaQLYeeMU8zIcEP/rZLk7MQ9/K6j0/0B/c61WJWBanVdN+5KprzuJ4kaeFdAY2OS5
         oAwimBlScRkPZAl2IKHR0QJDyP4yHKEeI85E0EaOg23NnebJpunX1TxH0k28KW3uXCpx
         hlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787070; x=1777391870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
        b=K4/49f3c075mVwAZ7N/y9twRPnhGXWlRaBFU/XjEq0YrMw+rDRTTwHDf/l0v1RFRFY
         sFZ4f58XTWY35IsLtqPoeBPjgeC73oaGp3NyYwyut8DBfi3KaerZlogbfc5n1lhnR7Hi
         2e52TneYzpMCyFEOOSDIn2uAHtK7bFvo3cieG7upJBP+TiEzCFbTqyQ++lfX3dKqObPL
         lkne/NklGb0WTXvezQbwfoUARYSMPSYuQ4Fbw592Oj3p1g78cJgnWyd5RL93pDlCeIK0
         mPz7Sz9EMUi/KJMRuLNRJM0LkfmPcyZGxE5P8kHPFL0FRl8xegcCMyOVYNLq4ZbcI0By
         Oapw==
X-Forwarded-Encrypted: i=1; AFNElJ+QEqpEw3yeBKMkzXC4XW1qMgBbRTUWTlytS9zrRtL1dMZDj8a+D+rv84JOnMqQTICReGZvVB4b5javCMxonw10@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2EauDkouMF5tL/POsLV+LlLbuJvpsn/sbImGLicSCACUeT7Gt
	d7Zl84KmbVi0e+gI848ryWGPoHt41wTgFYK61KYywUhgjOXDy0hvrWxO3L5/pkGOLV+d7/Bhbul
	qzZqqCCiG8q6oNmMF3pAoCQQYWCroVSfYClSv53GyOVTcf2VhveT/1TPpK7ckHNX4by5kuA33lU
	wDhQ==
X-Gm-Gg: AeBDietSgOptyAWbyVYRzchBVDr4Id9xPq7xPHCvBRO9hWk6/EOMLyqugIa5qOQurOM
	zRgXyzWtQJJM0lHXUHO2c8m5kfzXvGAa1TSn4tSwSAwz3PiwKHdosKXh8Pqe0GmuRjRmSFMB9zE
	gruAjfTes/Mj7e8q3io148yIpS4n/Icp+1W77JoxNNa0XzFOjRR2SGKEHIE+T7Fm024fVxW5EIY
	qigNvaiZY9ek/pVAaPfOO76euYGljZTwHNoxZJ+uWTTLwkn82mf5RAzlYhHiG9iezm9IPnIgHUT
	RvxzBZYug7a48t0Yoyyk4qnXHGeKzeXlNV2OdCzSHBMc4KI0YBbKsrMp5ruy9R7Azq93/udNvEE
	EmM4s6+JJ4zWcl9S2U5I6EogR7Qrqsk3HbGzoqWNx0agTdc9rTZcbkXDwWRB59HHYduH1UVpWqH
	4rRZSLjqinIfnCXScEWo/bwpaPL0gBsJLkikiULPA6AFTp6Q==
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50e36ca52aemr279020791cf.59.1776787070030;
        Tue, 21 Apr 2026 08:57:50 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50e36ca52aemr279019841cf.59.1776787069503;
        Tue, 21 Apr 2026 08:57:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a5241f6583sm1444371e87.39.2026.04.21.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:57:48 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:57:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <rkrhykm7dcttupn3plthf2m5sshtnnojib3f4pj4lxwrswetai@ncxm7oos35zz>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-15-c63f1134e76c@kernel.org>
 <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>
 <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
X-Authority-Analysis: v=2.4 cv=Vq8Txe2n c=1 sm=1 tr=0 ts=69e79e7e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=YNIvkKx5IWywne6YJjgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: jcETPcc69IGHdvGZdGv7zNioxjlIxhu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX4SFuuR3iDZP/
 QwFNr22LteB91GCxjUaBJiqNtJ2+TpWmqtHxeY4+KjRNzzOSHnbIyu0zW/tYIQcpnwhbdPMRKbX
 DQCVZR0XDEHRYQv6/hAGO/dOeROcJPqI6ub+qMBecMCIgskn1CqkDxip4lZ+LYYEKPa4lfRtvCQ
 NSE4eFScMl6Qcs7zPMtgtn2YHA5jUD/PJeiJUlX6locaOpeuMvGtwNShwSx5aSBnVZdof+uY6u/
 piY5bejxTLwrA68SNyspaaTyMxM7Cwn80JU/RbD+cXhzOB3GvXXhj4zx65+74paC1d9fflpr0ts
 7CIqlfyozA8R4MNo/15cOhZyKi/+1ISfUdG4/xPNlBAPcarQ6RceifxuJ20Lvd3am5rrH6B6SyX
 rXUMwXBFNolbxjjz9ocUNjJkzt1Grw8CrjxS+Rol5KsJwJ0SZ68100nCdbTww4wMUn6/6C/f3l3
 snyiMn1qKTm6qFhSISg==
X-Proofpoint-ORIG-GUID: jcETPcc69IGHdvGZdGv7zNioxjlIxhu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085752_206483_AC5D3F81 
X-CRM114-Status: GOOD (  32.79  )
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

On Tue, Apr 21, 2026 at 05:33:12PM +0200, Thomas Zimmermann wrote:
> 
> 
> Am 21.04.26 um 15:38 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > > Almost all drivers, and our documented skeleton, call
> > > drm_mode_config_reset() prior to calling drm_dev_register() to
> > > initialize its DRM object states.
> > > 
> > > Now that we have drm_mode_config_create_state() to create that initial
> > > state if it doesn't exist, we can call it directly in
> > > drm_dev_register(). That way, we know that the initial atomic state will
> > > always be allocated without any boilerplate.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >   drivers/gpu/drm/drm_drv.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d98662b5ddbcae8ded
> > > 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev,
> > > unsigned long flags)
> > >         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> > >           ret = drm_modeset_register_all(dev);
> > >           if (ret)
> > >               goto err_unload;
> > > +
> > > +        ret = drm_mode_config_create_state(dev);
> > > +        if (ret)
> > > +            goto err_unload;
> > 
> > Way too late. Lets rather go through drivers and call this where they
> > currently call drm_mode_config_reset() for initialization. This can be a
> > single-patch mass conversion IMHO.
> 
> On a second thought, can't we modify the suspend code and leave the reset
> as-is for now?  I'd still be interested to use reset as a means of
> initializing the hardware or loading state on probe. So keeping the _reset()
> calls in place might be helpful for that.

But isn't it the expected behaviour? The driver can reset(), but if
it didn't, the default would be to create empty working state. In the
end, the drivers also can call this function to create the state, don't
they (and then perform the readout logic)?

> 
> What's the long-term plan here?
> 
> Best regards
> Thomas
> 
> > 
> > Best regards
> > Thomas
> > 
> > >       }
> > >       drm_panic_register(dev);
> > >       drm_client_sysrq_register(dev);
> > >         DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
> > > 
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
> 
> 

-- 
With best wishes
Dmitry

