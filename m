Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1951FCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoTfqDMQtgNp8uKI6NaCQod1KhD8aF7dBolg9fIYyjM=; b=gbi5YL4/9HpjMlPPrGuFcQwzFw
	MogkO/WTnN6gKoZtDcT4vvsNlKpRn3iqdbPvXhl9Cl/j3OkYsduXtNYNcd/bZpShgKZuqpX6MU/6L
	XZVaYawbL0HllcNjzNCnR21Rvo5UPidMWbmqwL9dSxOryqRLD67NaH9djLnx8DaSPE2iBlptblHN/
	VlW/0X8e0sK/9AHO+mRbtGHdUWqp2NxxYxjUVf1mQ3NKi23FmDcr42t1UoBijK3cooQpun/9JJhvE
	ljLzYn+MT42afUUGvJyweKsNiQH3GaN6x6/Le3CqOf6M7bCLSYUYUKr7L+NL8grsHtVpTyka+0f2j
	8XjHU6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uLM-0000000DWbC-1eqv;
	Thu, 25 Sep 2025 22:21:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uLI-0000000DWZy-3mXl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 22:21:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPiQ0027682
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 22:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aoTfqDMQtgNp8uKI6NaCQod1
	KhD8aF7dBolg9fIYyjM=; b=MAZeOmvkPjKC32lFD2F+OE6mpbrhBaW5mKvBQNe6
	tM1Pb8YBK5DDsvX/hmxhWhhKwV2dKs8/zfyklHHGC7vxhvHBSkNA5ZNThn4lnkBO
	QQh4wUfoh5cKxqOvH0GhMFc2JfSnEEDugaQ3rNceSM/PZ/dh9D+eHrxk2qyI2dMy
	lfU1ku9t0z+gVtbNCWxTkvf5loyw0EFZCSfYty4Q3Pmw4eunLVQYfurSUVBAAp6F
	oxpWWoSPH2Uy/rS84xVRnfUglz0kLWfPa0NK6ajypxVErks1nacawLcwTNtiYdu/
	5kapW/j7H3X9lec6+cztABI+8Ej4CuIDGQtBaexI+Hl2Fg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0j1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 22:21:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4bf85835856so40247741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 15:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758838894; x=1759443694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoTfqDMQtgNp8uKI6NaCQod1KhD8aF7dBolg9fIYyjM=;
        b=BEK0hphRDisoodaQR0thqPj59LJbqqJ9hJ9NyzVX//IPBU4rxyxMFTy0hLWBZsYv4q
         Zf4vIIjO+nA+/4DwwOlOYK1U3u59BM5yhcVT+1gqlR1CbR0RRz+fwAttzpxvsOeZdUTl
         4Rd95nmUwny+KAGloEM1zWE5gtT6xByjHFpHsOg52fK+FxyZd1Ncb/mkiXXZckszEfjl
         W9iZACMsz9CgXcImpdwbQ76uZ7lu7awPkGfm4+14Nchwc9FhMQ2jweK23pwW8CD4TpL5
         TRJVg1qul4mHEM9zmNBe6uZfXE9MQv3Zad4fXVQ2aRcW7q4RhtQqpt8e/t4romtooEEH
         cIVA==
X-Forwarded-Encrypted: i=1; AJvYcCUwcyItxTJp2px/UV5KXPLo6ldFRINiGuxVFncRRoZDRkRDmZnNAA+ueR3SJiIvexRD+Z1aaOcGgXQof4K3Tt9n@lists.infradead.org
X-Gm-Message-State: AOJu0YwWFtZdyvSz3QCzDNwwGdLzZMnXgriqyqh/GY+QcADjKa6klrrJ
	o5N1E0cRz2K9pw6A0z4ibItSEC8oXiaAyHlEIJUPAYPGuSYsWFfarFYOvMCGBAqTcbw2m3T62zm
	riZHEoeEmR/GDzYkdNfJvc9QtmWTb2vTK5fyVennY0xqWY3iXlo17miE710asg988BWpKxJuVfX
	Q+iw==
X-Gm-Gg: ASbGncsZMTrVVcxZSRYQ9fFyQHX4aYnjHlC1JiKmq+V/QScMext6qyjkL8MF503bRD7
	UpWR3lY8AyBU14twtfTlWLooZKezAVCzREXptuuiLRmikS6Pin7PI4ufBsvqM1czEtGIshrD/0S
	yF4QY9MQuX7U8kmJrfYVZh8Wq29NkI71Oe6v+0i56uwN0kL+6OjP21gB/JdRdbsqs1gelXfQ6tH
	phylNoe3mKbFFxfWMp2fuQCklQR9yVmneArZzb2SGX8ZzQwl/KdKRTqCEWVQZn87sogZ+3mgNDT
	xEBSS7+T0XxtHsZYq/4VTfWLMFke6bmfTPjzm/qTVui4Z05zseFdWwnVvtQjUfGfsOAIGam+S2v
	UgIY3rmteAKs90RQ6pQds8O1fAa4LRrJffqqDzyR84E8+VvkFgONS
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id d75a77b69052e-4dacd2444dfmr53076001cf.26.1758838893905;
        Thu, 25 Sep 2025 15:21:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ndE8As98QEszHZ6NDkq+zsmIILHZCa3+sexpBqWme3ZRaECjD3Wj4Ezi0fMLWu39g+sHHg==
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id d75a77b69052e-4dacd2444dfmr53075521cf.26.1758838893328;
        Thu, 25 Sep 2025 15:21:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a3304fsm1171495e87.122.2025.09.25.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 15:21:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:21:28 +0300
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
Message-ID: <jzy37mcxvonlnouvsyepgyld4uxcsvlgxyj6upm4hek3fmavll@api4pfbjzi33>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
 <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
 <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX00ZjO1j2dF4u
 wmv03P7zF65Ejhd3Om5Ytno/7lcNzm24Bzgt1nyVagXBY93RSOf2L+bgwdDRRGoRD9/hnBcCbzy
 JNFTEIUYpyZAPFYwhw8UZWVp64YuA5ADLtqEh/O4pc1bwkta0AHGnB8GcmKVyt1leJy/on/gvLa
 kmgB8ohc7kiHIU3Fx49LPmcYosPoceICyrr/N1mkiTUv8WcVUcaiNn/lTbAundI8gcCjRjudjd5
 86aP4c+TITmSinN8M08rTJRaexeMxUnnqO2+ujFFlwYwzY0bQa4jufOeYYi22OYasGtI36VJAOJ
 OpMjd6MJoh9BB8Wy1uniVwSsjYn3UiBKmw/mHxEtLlf+kwv4fpF0e6z3eCDCY3Y+3ymeoioiEJA
 d47yH4LtMgAWjssH+9VIjnMExMhn0A==
X-Proofpoint-GUID: uBE6YLaDs7VvQY2WBIvWpZGS-Vh8PArn
X-Proofpoint-ORIG-GUID: uBE6YLaDs7VvQY2WBIvWpZGS-Vh8PArn
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5c06f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=ZqRDvNvAEryDotfT4VUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_152136_946527_98B13A64 
X-CRM114-Status: GOOD (  46.08  )
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

On Thu, Sep 25, 2025 at 03:33:45PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 9/25/2025 11:37 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
> > > Hi Dmitry,
> > > 
> > > On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
> > > > > Apply drm_bridge_connector helper for Analogix DP driver.
> > > > > 
> > > > > The following changes have been made:
> > > > > - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
> > > > >     and &drm_connector_helper_funcs.
> > > > > - Remove unnecessary parameter struct drm_connector* for callback
> > > > >     &analogix_dp_plat_data.attach.
> > > > > - Remove &analogix_dp_device.connector.
> > > > > - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
> > > > >     &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> > > > > - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
> > > > >     &drm_bridge_funcs.edid_read().
> > > > > 
> > > > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > > > 
> > > > > ------
> > > > > 
> > > > > Changes in v2:
> > > > > - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
> > > > >     DRM_BRIDGE_OP_EDID.
> > > > > - Add analogix_dp_bridge_edid_read().
> > > > > - Move &analogix_dp_plat_data.skip_connector deletion to the previous
> > > > >     patches.
> > > > > 
> > > > > Changes in v3:
> > > > > - Rebase with the new devm_drm_bridge_alloc() related commit
> > > > >     48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
> > > > >     API").
> > > > > - Expand the commit message.
> > > > > - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
> > > > >     bridge is available.
> > > > > - Remove unnecessary parameter struct drm_connector* for callback
> > > > >     &analogix_dp_plat_data.attach.
> > > > > - In order to decouple the connector driver and the bridge driver, move
> > > > >     the bridge connector initilization to the Rockchip and Exynos sides.
> > > > > 
> > > > > Changes in v4:
> > > > > - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
> > > > >     &drm_connector.
> > > > > - Rename the &analogix_dp_plat_data.bridge to
> > > > >     &analogix_dp_plat_data.next_bridge.
> > > > > 
> > > > > Changes in v5:
> > > > > - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > > > >     for next bridge attachment of Exynos side.
> > > > > - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
> > > > >     the downstream device is a panel, a bridge or neither.
> > > > > - Remove the calls to &analogix_dp_plat_data.get_modes().
> > > > > ---
> > > > >    .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
> > > > >    .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > > > >    drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
> > > > >    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > > > >    include/drm/bridge/analogix_dp.h              |   3 +-
> > > > >    5 files changed, 95 insertions(+), 96 deletions(-)
> > > > > 
> > > > > @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
> > > > >    int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > > > >    {
> > > > > +	struct drm_bridge *bridge = &dp->bridge;
> > > > >    	int ret;
> > > > >    	dp->drm_dev = drm_dev;
> > > > > @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > > > >    		return ret;
> > > > >    	}
> > > > > -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > > > +	if (dp->plat_data->panel)
> > > > > +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
> > > > > +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> > > > > +	else if (dp->plat_data->next_bridge)
> > > > > +		/* If the next is a bridge, the supported operations depend on the next bridge */
> > > > > +		bridge->ops = 0;
> > > > 
> > > > And what if the next bridge is dp_connector without a separate HPD pin?
> > > 
> > > This case was indeed not taken into account.
> > > 
> > > If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
> > > return connector_status_connected in analogix_dp_bridge_detect(). This
> > > ensures the connection status remains connected for both the dp-connector
> > > and the bridges without DRM_BRIDGE_OP_DETECT.
> > 
> > Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
> > to stop preferring OP_EDID bridges over OP_MODES if the latter one is
> > enountered later in the chain. In other words inside
> > drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
> > and vice versa. This way you can always declare OP_EDID here (after
> > converting to panel bridge) and then letting panel's OP_MODES take over
> > mode declaration. Would you please include such a patch in the next
> > iteration?
> > 
> 
> I see. Following your suggestions, the logic will be:
> 
> 1.If the later bridge declares OP_MODES and
> &drm_bridge_connector.bridge_edid already exists, the
> &drm_bridge_connector.bridge_edid should be set to NULL.
> 2.If the later bridge declares OP_EDID and
> &drm_bridge_connector.bridge_modes already exists, the
> &drm_bridge_connector.bridge_modes should be set to NULL.
> 3.If the later bridge declares both OP_EDID and OP_MODES, set
> &drm_bridge_connector.bridge_modes and &drm_bridge_connector.bridge_edid to
> it(preserving the existing behavior).

Yes. And then the get_modes() will defer its functionality to the last
bridge that declares either of those.

> 
> I will add a new commit with necessary code comments to implement this in
> v6.

Yes, thanks!

> 
> > > 
> > > > 
> > > > > +	else
> > > > > +		/* In DP mode, the EDID parsing and HPD detection should be supported */
> > > > > +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > > > > +
> > > > > +	bridge->of_node = dp->dev->of_node;
> > > > > +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> > > > > +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> > > > > +	if (ret)
> > > > > +		goto err_unregister_aux;
> > > > > +
> > > > > +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
> > > > >    	if (ret) {
> > > > >    		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > > > >    		goto err_unregister_aux;
> > > > 
> > > 
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry

