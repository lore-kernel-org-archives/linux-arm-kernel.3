Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC94CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 03:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n78nIIomQavWQosZYQPTeoTh4ytOcFS5L4hdEAU6XLI=; b=ZQaESSxQjYQXlTEVYvlbyMqNCw
	cew9VKy/JqQLn3FjjfK3Nxtb9IclrZ6DNdrfIF4cIOR4lhC+lRrKWe3verKjhXxzLWa+ClOiV5XRb
	SgDywPqNRAoeNg9jsfyyrPgXV5hAtN8nWcsICD6PbCCnGv8xwRWRabRBCkG8JVoZgnBWVelAAiCaY
	3S6LujVxEtuhkD+gywpvY8peuMWnCh/jZ8uNL/rMnIKRvKz+41Kn58XolipcEMw/5lKPKHUt0bdDC
	p7ROFF9Wh/H9wDgo498HokTqo9xOqmeGoyvHT/0+h5R7zvyTO2mkB8TyBufiJEXDkgfQDMW6Fi4UV
	NGNbwE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cnq-00000005PzM-3UsT;
	Thu, 25 Sep 2025 03:37:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cnn-00000005PyW-3veI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 03:37:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P100hT019923
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n78nIIomQavWQosZYQPTeoTh
	4ytOcFS5L4hdEAU6XLI=; b=UgTSuc6KmCehqi8ARRkarzQ/yMYshdS5YZXikwc2
	7kEv0mWOqAoVbz2YicphPD1AnKPWlRK1yp+Fmhm3SFLF2E1yvaljAw4k8AtMELg6
	inG7Gz+JOnDV0mhleHIvoHBYxyJFyI7901v6BlbPPK5iouwon9LWTXsbaCKBEIOH
	eimYo1z8/aAmfxm60mIIoxRFz+QEjrkNqCiCRZ+GJ9ejdR8KsVANgS51pb2xPN7c
	PxENgsIhvFIwfVK0cSmGzFd+nlsjppggHlen3kj+tEcsjeH6bQCmWkOlOu5d61Zi
	ArtvXKWsEGrwwYRd1VJG9Jo9uQVCHTZDYJdJP3/srrRK0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyu96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:37:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-854bec86266so169430785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 20:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758771470; x=1759376270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n78nIIomQavWQosZYQPTeoTh4ytOcFS5L4hdEAU6XLI=;
        b=GrDuloxOajWISLg4PQYmfob49ryYbvOwhIgiaBU0Br9E5ahI/Zd7C/Ivh/8Kiq3PRe
         8vFRM2dH/iz0TEcF9loJEwQmpo0/e4n7MUHG/AzKj134twlWtrNjZoQzDWiEh5f+0xIQ
         CQTZQgIuTkAxih884evLvmSS1K3IANUTzKKclj+j6/KJO90vdqu+eRKVF0amXUnlGvH7
         E6lUwr+9hg23wlzYP2BSUVPNZH/X5uLs19grgLVRjg8eJQX0MxUijOP1qbwyF12MYG1X
         MhEf6RlczK14exl8DSAKBIJiPT/Rq+GIulMAmdCFq3ewLOtvUxTRnBxP6Kysi9wTIC9h
         ZnQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9MVfRCCQ1ovnT4S3G2YBjuy3+cfNRYWBRxQE5YRbK1gyHU/XtOWRevXnJ8HuyBt3jdXOzkpX3GQYPaBQpss2K@lists.infradead.org
X-Gm-Message-State: AOJu0YwMB3DqsaGw0HvF0JcyY0X7tqGGGMj0OQ1wlNMVdmbKrGtFOjAw
	Gzf6s/G1AucA/IkqtGDC5SRmuofYahheKI0FuI1S2X69snMi8t3q0WDgjyCZ62JoqRhTiAe95j8
	JovsbZBZqTnuoF068nG1H4Pl3t1RfP39uEGcrr63mq1BkQFzYqSUjw9DuYYUVHBE0bXqFYOpzRa
	9/tA==
X-Gm-Gg: ASbGncvT/IeIP5MQrG0PbPk9iQ9lD0zYTOuttZX5TulQ+NHGUlNrIbZAwCfp86wEd2b
	ZNxJ1v3fgnCId4qz7IfQgoXKra24Wx+hDxREgFUBuf3Vt+aFvvDijThkqZlJig980q8VbbjJA4z
	9nGMidXtecU1cxJo5m3IMWv8ctWYiZzZE69jklucPBzDnBSvI3hmSNEuCDOsRF7CtM13JDqeF7l
	HSGCwOrRsG/QebeVeEAi30r05zBVfwkPl72znJFCBWPPgyTRNqWhxKLifUAm9+dqNcGmIsYJ0xn
	WW9qOvXhWL7fiZ5Vu3jOyktj1ldLjkyn5SWLeE/TvLS9bdBptkW+kxzj36QeTUjak0FZJLU4O66
	SZLq26FkrFLObQLugWjdJ/mylvOjlf3WMKoikb3Xuv8DrhvclNs8v
X-Received: by 2002:a05:620a:2907:b0:80a:72d7:f0cd with SMTP id af79cd13be357-85aed8cbc11mr225515385a.56.1758771469814;
        Wed, 24 Sep 2025 20:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Mkya6v8AWWGYf6q1L7jR77pkQxfEZnuvWyLMjPjoG8YIV9rwp0IrPi1ugpz+EuhpXNM8VQ==
X-Received: by 2002:a05:620a:2907:b0:80a:72d7:f0cd with SMTP id af79cd13be357-85aed8cbc11mr225513785a.56.1758771469267;
        Wed, 24 Sep 2025 20:37:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7bfb413sm2245821fa.56.2025.09.24.20.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 20:37:47 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:37:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 10/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
X-Proofpoint-ORIG-GUID: DLaSQiTFrPctMggL35b6Ce-KyvY8VY2y
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4b90f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=e-wIutcIwHs2mBw2ZVAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: DLaSQiTFrPctMggL35b6Ce-KyvY8VY2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX5pZ3CRlUH/gn
 Z5ahh7oTHnLqsyyYQMZwxGwWnzSYm1TrnO8TZLw2UWOqC24UL6FEiYABgNvLKQHbcbdAudKA0o6
 1Okg9HeoExwNOtv/xw07g06W7flnFoSr5AISNvuMe9Ie+RK/vESpxIQwqRXrik/4gM6zFZuq4wk
 9AwnVyZz1zo3sHMP2D4zAnT2mnmW3jwHn03t3CD8TT6n5KkhzN3QmJG3ibVCOSRzkhcnvk+391D
 Hl/dNsfreyljYdS5gYYpRMKEdI3fK2oQU2tvsi6y68Mixf8/Q0QGbfLO8spqYDHXStlNded1p6i
 j6q3GDRbaMmOArrEBz3dJVPfzlcKIkZzNJh7oQD8N76EeMFNjsCkg1pWVgWz2bMGJ2jqrhPdbDH
 IiH8Gtwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_203751_989350_454ADF0B 
X-CRM114-Status: GOOD (  41.13  )
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

On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
> > > Apply drm_bridge_connector helper for Analogix DP driver.
> > > 
> > > The following changes have been made:
> > > - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
> > >    and &drm_connector_helper_funcs.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - Remove &analogix_dp_device.connector.
> > > - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
> > >    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> > > - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
> > >    &drm_bridge_funcs.edid_read().
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ------
> > > 
> > > Changes in v2:
> > > - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
> > >    DRM_BRIDGE_OP_EDID.
> > > - Add analogix_dp_bridge_edid_read().
> > > - Move &analogix_dp_plat_data.skip_connector deletion to the previous
> > >    patches.
> > > 
> > > Changes in v3:
> > > - Rebase with the new devm_drm_bridge_alloc() related commit
> > >    48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
> > >    API").
> > > - Expand the commit message.
> > > - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
> > >    bridge is available.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - In order to decouple the connector driver and the bridge driver, move
> > >    the bridge connector initilization to the Rockchip and Exynos sides.
> > > 
> > > Changes in v4:
> > > - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
> > >    &drm_connector.
> > > - Rename the &analogix_dp_plat_data.bridge to
> > >    &analogix_dp_plat_data.next_bridge.
> > > 
> > > Changes in v5:
> > > - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > >    for next bridge attachment of Exynos side.
> > > - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
> > >    the downstream device is a panel, a bridge or neither.
> > > - Remove the calls to &analogix_dp_plat_data.get_modes().
> > > ---
> > >   .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
> > >   .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > >   drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
> > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > >   include/drm/bridge/analogix_dp.h              |   3 +-
> > >   5 files changed, 95 insertions(+), 96 deletions(-)
> > > 
> > > @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
> > >   int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > >   {
> > > +	struct drm_bridge *bridge = &dp->bridge;
> > >   	int ret;
> > >   	dp->drm_dev = drm_dev;
> > > @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > >   		return ret;
> > >   	}
> > > -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > +	if (dp->plat_data->panel)
> > > +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
> > > +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> > > +	else if (dp->plat_data->next_bridge)
> > > +		/* If the next is a bridge, the supported operations depend on the next bridge */
> > > +		bridge->ops = 0;
> > 
> > And what if the next bridge is dp_connector without a separate HPD pin?
> 
> This case was indeed not taken into account.
> 
> If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
> return connector_status_connected in analogix_dp_bridge_detect(). This
> ensures the connection status remains connected for both the dp-connector
> and the bridges without DRM_BRIDGE_OP_DETECT.

Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
to stop preferring OP_EDID bridges over OP_MODES if the latter one is
enountered later in the chain. In other words inside
drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
and vice versa. This way you can always declare OP_EDID here (after
converting to panel bridge) and then letting panel's OP_MODES take over
mode declaration. Would you please include such a patch in the next
iteration?

> 
> > 
> > > +	else
> > > +		/* In DP mode, the EDID parsing and HPD detection should be supported */
> > > +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > > +
> > > +	bridge->of_node = dp->dev->of_node;
> > > +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> > > +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> > > +	if (ret)
> > > +		goto err_unregister_aux;
> > > +
> > > +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
> > >   	if (ret) {
> > >   		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > >   		goto err_unregister_aux;
> > 
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry

