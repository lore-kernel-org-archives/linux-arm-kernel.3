Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C2CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+pzSiIjVBnWxA/hQntIwuWVdEB2AAtnUsGXY13DWPI=; b=UIw1OZcfBibMwMcGgQRjg/ds9l
	Ve2wugUiLmTVzSRC9kptjSfT16QB81Vyc+D17yXzfrJdIyAYy7KV4t5seqrQw2knz7NkV7XkUtfDE
	8WM8ySPeRqWst3NvXcSTzOYpeyJuusPlPoKNgzFZQVWxblsZibYfkh7DaHuaTWv8/tsLjq/DMxMcF
	lr0wEopSZhEF+FWqzQzKyVX9grzoX9B3FZXW/A8I4hN0GV2j7DGqkCMKCwbmD15KVHbUoyaL4MaS6
	vyVdu1uE8c7Q1Mk+bIgyu8ts4+dbmdt2qJzscRvzUbRlYE/WbHEnKhViylUZoOkOZxXnQbYI7Ympc
	HJ4Jp7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ehS-0000000AWx7-3bUJ;
	Sat, 11 Oct 2025 18:52:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ehP-0000000AWvT-34cR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 18:52:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59BHfXFp000476
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 18:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/+pzSiIjVBnWxA/hQntIwuWV
	dEB2AAtnUsGXY13DWPI=; b=SVdsgXu+Dv9XNolVHUB2L3Cuv0aSMuggEYDMC+i9
	6k5APB5vDU1bJiw9zKOgXB+sCZqw8MNDqdi1wl+bbjsaYb1xX5y99eqorLOmFN9/
	En7o9HnNswuxn7OzMK5UmryBhtbd/WZZPtur3trLWlPfz2a6rPezyR0VRrn7yTM8
	ZoZzBoI7ojkheJ/5uAaGE3yTASujDDp4UPtmiCMEcfXAtzyk3SZC34Udr6jJhuJ8
	2mCaEtTfuVKF/zpdBVIx7rCX1A9TAz82niaGoknye/d/Npl0auFXVvlaAJ/qQHH7
	KI3wuOvexIohrqY0k2X7OHrD5HoBqN2ByGjcNNG/jIPAwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfry3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 18:52:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-871614ad3efso1647859685a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 11:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760208730; x=1760813530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+pzSiIjVBnWxA/hQntIwuWVdEB2AAtnUsGXY13DWPI=;
        b=w2/SGIvUY/3pFrwUP2Di6Ys4AjRoU+ivyvTZ+cCYokqjUHwOuRwON6i26spG0XVJTj
         6T/RUte4E0ZJ+ndyDmFSJJSncNwKkTEeXc8/pJ29zmrPRPuTEUgc9gz8TKTtVMRR651G
         exRITEqOZ6i2pXDhhmAfhPC+9rndS432s3eAcyJ9JeyV7L2dnw09ya5HtOag0494QZA2
         PHYPnFGgOZsXYZKtyTWqhEGtmd1Cq9nf7HKPmiFrb8+CQG6lQCCHQ/Hr1rq25/bfv2Sz
         6XcPkOhX+PKt2uOlCJQ5455Cz/EQUXRH1PraNTVwHp9PpyYrT3GszgIXsyvkBds4iwUb
         kLUw==
X-Forwarded-Encrypted: i=1; AJvYcCUVfKwe481uqiTv5DOXOE4E8O6irwPJvmm+51N5lEaQ6887toomotjnhmb9VOd9yJ62vG8ffUv/7e8Ku8Pon23f@lists.infradead.org
X-Gm-Message-State: AOJu0YyUrcXRWRNnc/zSHWcoBW+bCzEwOqIwLeww3VvkY7VhfBCH1gsM
	mqpGWdSe074prwzj73iJ3NepTw47QhUcfArBmfRvyJuIjSUAARgvDQvxpEjjRhRDk/IQqBQgst7
	Z35krP21KuivX1c0GfbCuhPmbuWD6IkvyGMfjCMaHN5FHGpgQSQ6s1JxVWYpm8FLH881jRhrbbt
	kXWQ==
X-Gm-Gg: ASbGncsaLv3by714N27aBiQZ4KdPPOzLqZGuTvQ5RQGR0mKkxIgssWgz2qZiIlUd+Hv
	jyt9SpbQLebefhzsL0wtIIDhqpXqow35B1zgnBQDYNF//90SYyXoW2c5GQNB3rylaRwK6J7m/Mi
	yknxCxhLtFnTNttkDs1cYY0uJe6jWENhIopRd5rWmKpUZxcvw3lkJ6v/wb0lfq0vF+BEZ8UnyC8
	dmO0VUJdGIMSNeCgP0UrRk41/lDMikquuuShpLTqkDwpwBaeAuDH2wQtBA210SLkv/imoiQcOG1
	S+TooII5bD90UU6rmK1jqGXe6d5SS/nrz4edZ8RS8GIMeo8GbxmpEBfVuvTrc6Ay1Qyt30f6CKq
	l7QN9IH/IqBC7KCtpUUlgtYGaabiEZor0aPzXCKcRm79gQw0liV6v
X-Received: by 2002:a05:620a:400f:b0:85b:a906:127c with SMTP id af79cd13be357-88353558d25mr2318571885a.54.1760208729768;
        Sat, 11 Oct 2025 11:52:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/k0JIMwDDe8wKbfoitr+GmGj4WmEClMNGgNYD1vA6WxUaESVw6RtRzEdEu71iz8UzlrWicA==
X-Received: by 2002:a05:620a:400f:b0:85b:a906:127c with SMTP id af79cd13be357-88353558d25mr2318568685a.54.1760208729193;
        Sat, 11 Oct 2025 11:52:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f88ddsm2167029e87.31.2025.10.11.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:52:08 -0700 (PDT)
Date: Sat, 11 Oct 2025 21:52:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 6/8] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Message-ID: <qzcdulyj2enho7l6vyvad7ln46zk2u4z7rnsjv2nv4tbw5j6jf@6oenbixoh3sp>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-7-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-7-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX6tdzspN6v/E8
 twFC2Zggc81Nu8j4a7Rdk4JvIWwoSTSnfUxER4QHHj35LOjF05XwA6BhGnRU4E6cuTN4gChOM+p
 kssjm1l2uI/OiGMMlQfgYIO48J5dUtuche6p10a5c5lhiiBQ4HxR+KMlbF88/YKJcrsL023oPhY
 9lCqiyo8LIOPmmWHGo2F3SwSWX6ejiU769DMiuut8fftfqlFqgrjKT72S2Eg3j18DUPICra/uqq
 WJ/6DTCbDYn4qAxp4VmNVhGNowMRL6/naSKruJFUZEX1RoPQq+kBOzezR5L9Hz4BUr5LZQO3dNb
 eaD97rNLcnOthliPcoKRbr2jp3w14NlorZSNJ4t7HKsJd8Ld+8JgVXQ8u0VHaXkHrZS2yKhJRTL
 Q09uNVJU+rzmgqnI7IbbfxpPW3K/BQ==
X-Proofpoint-GUID: rnVOqRvb_QGZvyrY1Qtl6wTGMNvEVy0i
X-Proofpoint-ORIG-GUID: rnVOqRvb_QGZvyrY1Qtl6wTGMNvEVy0i
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68eaa75b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=Vq1njTOzTen_YWzSrCwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_115211_780721_D5265F5B 
X-CRM114-Status: GOOD (  47.30  )
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

On Sat, Oct 11, 2025 at 11:32:31AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs. If both ports
> are plugged into DP, DP will select the first port for output.
> 
> This patch adds support for multiple bridges, enabling users to flexibly
> select the output port. For each PHY port, a separate encoder and bridge
> are registered.
> 
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the first bridge in bridge chain and DP
> controller. For example, the bridge chain may be like this:
> 
> PHY aux birdge -> fsa4480 analog audio switch bridge ->
> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
> 
> In this case, the connection relationships among the PHY aux bridge
> and the DP contorller need to be described in DT.
> 
> In addition, the cdn_dp_parse_hpd_bridge_dt() will parses it and
> determines whether to register one or two bridges.
> 
> Since there is only one DP controller, only one of the PHY ports can
> output at a time. The key is how to switch between different PHYs,
> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
> 
> There are two cases:
> 
> 1. Neither bridge is enabled. In this case, both bridges can
> independently read the EDID, and the PHY port may switch before
> reading the EDID.
> 
> 2. One bridge is already enabled. In this case, other bridges are not
> allowed to read the EDID. So we will try to return the cached EDID.
> 
> Since the scenario of two ports plug in at the same time is rare,
> I don't have a board which support two TypeC connector to test this.
> Therefore, I tested forced switching on a single PHY port, as well as
> output using a fake PHY port alongside a real PHY port.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v5:
> - By parsing the HPD bridge chain, set the connector's of_node to the
> of_node corresponding to the USB-C connector.
> - Return EDID cache when other port is already enabled.
> 
>  drivers/gpu/drm/rockchip/Kconfig       |   2 +
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 355 +++++++++++++++++++++----
>  drivers/gpu/drm/rockchip/cdn-dp-core.h |  24 +-
>  3 files changed, 324 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index faf50d872be3..7472ec923cfd 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -55,6 +55,8 @@ config ROCKCHIP_CDN_DP
>  	select DRM_DISPLAY_HELPER
>  	select DRM_BRIDGE_CONNECTOR
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_AUX_BRIDGE
> +	select DRM_AUX_HPD_BRIDGE

You are not using them in this driver, so this is not correct. Please
declare Kconfig dependencies for the drivers that actually call the API,
otherwise the LKP or somebody else can get compile errors because this
driver wasn't selected.

>  	help
>  	  This selects support for Rockchip SoC specific extensions
>  	  for the cdn DP driver. If you want to enable Dp on

[...]

> +
> +	/*
> +	 *
> +	 * &dp_out {
> +	 *	dp_controller_output0: endpoint@0 {
> +	 * 		remote-endpoint = <&dp_phy0_in>
> +	 * 	};
> +	 *
> +	 * 	dp_controller_output1: endpoint@1 {
> +	 * 		remote-endpoint = <&dp_phy1_in>
> +	 * 	};
> +	 * };
> +	 *
> +	 * &tcphy0_dp {
> +	 * 	port {
> +	 * 		tcphy0_typec_dp: endpoint@0 {
> +	 * 			reg = <0>;
> +	 * 			remote-endpoint = <&usbc0_dp>;
> +	 * 		};
> +	 *
> +	 * 		dp_phy0_in: endpoint@1 {
> +	 * 			reg = <1>;
> +	 * 			remote-endpoint = <&dp_controller_output0>;
> +	 * 		};
> +	 * 	};
> +	 * };
> +	 *
> +	 * &tcphy1_dp {
> +	 * 	...
> +	 * };
> +	 *
> +	 */
> +
> +	/* One endpoint may correspond to one HPD bridge. */
> +	for_each_of_graph_port_endpoint(port, dp_ep) {
> +		struct device_node *phy_bridge_node __free(device_node) =
> +			of_graph_get_remote_port_parent(dp_ep);
> +
> +		bridge = of_drm_find_bridge(phy_bridge_node);
> +		if (!bridge) {
> +			ret = -EPROBE_DEFER;
> +			goto out;
> +		}
> +
> +		dp->hpd_bridge_valid = true;
> +		dp->hpd_bridge_list[count].bridge = bridge;
> +		dp->hpd_bridge_list[count].parent = dp;
> +		dp->hpd_bridge_list[count].id = count;

This looks misnamed. They are not necessarily HPD bridges. There can be
a random chain between your controller and the actual output / connector
/etc.

> +		count++;
> +	}
> +
> +out:
> +	dp->bridge_count = count ? count : 1;
> +	return ret;
> +}
> +
> +static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct cdn_dp_device *dp = dev_get_drvdata(dev);
> +	struct drm_bridge *bridge, *hpd_bridge;
> +	struct drm_encoder *encoder;
> +	struct cdn_dp_port *port;
> +	struct drm_device *drm_dev = data;
> +	struct cdn_dp_bridge *bridge_list;

Why is it bridge_list?

> +	int ret, i;
> +
> +	ret = cdn_dp_parse_dt(dp);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdn_dp_parse_hpd_bridge_dt(dp);
> +	if (ret)
> +		return ret;
> +
> +	dp->drm_dev = drm_dev;
> +	dp->connected = false;
> +	dp->active = false;
> +	dp->active_port = -1;
> +	dp->fw_loaded = false;
> +
> +	for (i = 0; i < dp->bridge_count; i++) {
> +		bridge_list = devm_drm_bridge_alloc(dev, struct cdn_dp_bridge, bridge,
> +						    &cdn_dp_bridge_funcs);
> +		if (IS_ERR(bridge_list))
> +			return PTR_ERR(bridge_list);
> +		bridge_list->id = i;
> +		bridge_list->parent = dp;
> +		if (!dp->hpd_bridge_valid)
> +			bridge_list->connected = true;
> +		dp->bridge_list[i] = bridge_list;
> +	}
> +

-- 
With best wishes
Dmitry

