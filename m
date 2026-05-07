Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8999DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2r+8tONPidRwC+bDiqTgIec2G+NFWKd4YQ4XHysQOU=; b=NCfyH4DOME8XZn3oE1ni6AAqlc
	4H7HfHeUo6PyFgxpRqGQJ5i8ht7esaW/wF3hzV/CO5hkt03raq/pvu54mcH/Zn8iBS0p5JlGMn+6h
	lIwaOWtroebllv1ugqwhHLhEZM4Tm2HXjyMJzcR2rSx1a8Wy6bBIj9xdtVEbqL0NWJaHfzpjjVPCT
	LXhgD7zl+DqqldeyLNnqZXWUl8UtRfctY5NwsIn+/4fJ4n1Ip2cUsYVFsw2qv1R+2qoqkouRbD7qS
	KE6gRx2LU0X81tlo/EUO4uxVeQaSTp6cUFeT9SKis02ZOtg9n8vbiMJDM/3C+rZdjeqUqZVHKJyTp
	JyWr5cWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvOo-00000003P6m-3sQ1;
	Thu, 07 May 2026 09:52:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvOl-00000003P5R-2j2U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:52:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eRvO026468
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 09:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n2r+8tONPidRwC+bDiqTgIec
	2G+NFWKd4YQ4XHysQOU=; b=hk7CjrAbJWAFwoncPo8nXNSnkdWhlPzugC0Vuvbz
	oIs0tE86AQcPzXfDNbxNpJJC2h6m8Kzu3bYkDemd7XS6rc9QehjtbuV9ZL/FxZhz
	V+9VdE0I6Z812O4YAeCm1QCkhhgvRXznAYBODvtx/HrBInLvd9ON/OlZBCRKmYo7
	l/S6DiNpwzeIpQg7lnGhTiRTO6IgvYJII+56JS59usJiElGT3k/oskeLJ0/Tdman
	IZQ+h9pvhK2OYgmUrQjH/DSz4DzKha+cWGlUNod8b7bB3Jfb27siJT2aHK6A84mh
	hdrgVyyxuyMM3C92Ib81826vOMOkMOIUlSep3lVWR5Dqog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t1a97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 09:52:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ed2c173d3bso127729685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778147521; x=1778752321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n2r+8tONPidRwC+bDiqTgIec2G+NFWKd4YQ4XHysQOU=;
        b=XvsHLTa9D4ctJraFPhoXcot5XyYA1GXSb/N070dk4IU+RsAsmhtiLA4+nDhLVkMdaJ
         rgaPcqfSFNMTV6OGr1Jzu1WG7RO32nAnNH0k9FY4O231kNJOGeusTYGxq9VxUPBKNbui
         6RnBe6u6TmwGmMm00JcMjpuC9q1rctDWSUyRVCmuCfq1XU6zfcu1NkgQXT5yeENn8/nA
         iHr3LaxKfyMCEVk/pi8Wmm/j3rLtjbAc8yOqjuLlLbGVdGtTvHmtlPc3VVzlYdGn6Gm7
         M0vq7vDKBuSIhxXygv0mu5Y4tO07bdOos/vj2KHIJIfttxZmE3wUrgKD+NexdkggxTJB
         sMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147521; x=1778752321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2r+8tONPidRwC+bDiqTgIec2G+NFWKd4YQ4XHysQOU=;
        b=l8ip7B8+NvwpXvxHzFVn06ZSumdZS5RlRzlB/5RvCatJWog7STaYEAyXH1KPI6KkBD
         4vQkliquErm58Rcyg+kZ7VB2B0xTc+NuT/nGo1lMQBVcaobq+ww6SjngldAAS2eL71+9
         xQgLWGAsW28Q7cob06Q5XPOil23IPRifwWQSLRJtMm7aNT8KnBOgH82wibd/1OtrzgHw
         YZPxmAkcchAH0eP8TiOONoIk4oTzAEFatbZ8ypEESpg0zTaFhH7PvQaT0bQIq+RAi3jU
         VRJvrSlG0RLHgouoMAoSHqcKxXS1yc9ZggLI3fOkC9JzJwkYf+Oly2dWW5WH7g2maDia
         p1cw==
X-Forwarded-Encrypted: i=1; AFNElJ+wgPMs1jx/YySrCWvmvpx4ALCNCr7aLrBm4/Dv0n+woBUDQpfLUYpfEyxUgfOT9FeZn8hT8VvO2fqKR7Rfimo+@lists.infradead.org
X-Gm-Message-State: AOJu0YyjPGTJw0QCdKk9RE/qbqAGlBI/Nxb2LNmdCum7ydijzjHg8CHg
	eEUyPvLiZATlqngeEeIhQmqYVR3Kcqv4sXZhNyP16WKc9MjFMi/7fF6VTQBSsYrMjn23WIEz3FW
	9NGzapYpll7rt/0T2/4Rpx9LyF3SP/93gyN5CJ1iW3mfGPuIhpDoNzaI3qNta8YRDIscpIyqg+H
	tL4Q==
X-Gm-Gg: AeBDieu+CJnKk9iswiQ3FteRgB++08mW5jGNAJV5kNXLu31EJWzicen8xMNv+lE3H91
	VjSj+BEo/WIfsiV4qweWFUFeqmoGw283dfi4eXLqR8m2IZWdiD5wODOHBnRGl97NXKTXLusHn9R
	Oer9SKmcGHG7TygqDbbdlsFsulpPu5cuZRW7AIhx7wOo4Zsj1PgDnp17whINBvxjr205TQvj9H2
	3ToHKyCxdZQz0/7g6l7Mbnw/gf9g+jd7n1W1gR8RIbGl6XDXtka89lovVmLJQ2VpzQlG0oj7xvk
	IC13S3TQ4F+rvbg5L43hebPYYFmn0W9EhQhvy9PDT2+KFredZOfNjhxf01sutoMue2X+sAsRtFm
	B4LB8x1h1zpIZTseGjH9lwy3WeL9fma96JJqLVKtmvGlt5nc0a+f6YxWhMqIKOojEwKPwAe2KB0
	Sj1GFoiVx/Vmvr0KhaQX+azKAHN7uEPEbagKyHC4wgdxw+jQ==
X-Received: by 2002:a05:620a:1a20:b0:8fc:5e81:28eb with SMTP id af79cd13be357-904d65e1e89mr1081201285a.42.1778147520850;
        Thu, 07 May 2026 02:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:8fc:5e81:28eb with SMTP id af79cd13be357-904d65e1e89mr1081198385a.42.1778147520392;
        Thu, 07 May 2026 02:52:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c33c8a3sm5505238e87.54.2026.05.07.02.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:51:58 -0700 (PDT)
Date: Thu, 7 May 2026 12:51:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Junzhi Zhao <junzhi.zhao@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
 <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc60c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=_OD9tO1ZYgXKlZaMhT4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: nKDXt7nN5K71fY89gS4m6rbQ4-yT1wrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5OCBTYWx0ZWRfX9oma9T/u+08n
 PhUYtO88gAXOch8mwN0MenO5bJI8MbbGC2L0vMOOrjmXF9uXZa2+uZwkS7+U97wEKgWfpDVeeV9
 hBWAr2Feo8v05rGjHeTJE3fCpBOMxhlWTv9N2ERwnPZkNkg0P0Z0v3rfR8UReJE1VSTl2Jgof5a
 KWU+Yz+aZrnKEYR/eVvcAd5r+vzZX5zjSDLHG6/oYmVak03yQUR+NefcJhikEbo+yADo3fb+XYP
 ExK7+8/Guty7bNzTRWsxJPrqJMP5352lQl0rraYkR41VlgiUTxfYHxkcjhQc3d/oVRGjF1EBXzx
 8fpLui9CFTEoFxNO5z34LNZdiZAN/NWNb73cGZ6JBNslgCehmamk+1BiZCCTbOjOxO/7KtojDDd
 DuLGYoqCc73qc2zVTZiwLqDDKhVp+CAcN3dkmBM7nBEE7VqBv9e1W7Sfx5e55rhxMC1RZY3b3nM
 j1KqllOCBdllNPTPC8w==
X-Proofpoint-GUID: nKDXt7nN5K71fY89gS4m6rbQ4-yT1wrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_025203_796466_5AEE82C4 
X-CRM114-Status: GOOD (  24.76  )
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

On Wed, Apr 15, 2026 at 04:04:16PM +0100, Daniel Golle wrote:
> Notify hdmi-codec of the current sink plugged state from
> mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
> via mtk_hdmi_update_plugged_status(). This matches the pattern used
> by dw-hdmi, which invokes handle_plugged_change() from the bridge
> enable and disable paths so that ASoC jack state stays in sync with
> the actual sink presence across atomic commit cycles, and not only
> on CEC HPD transitions.
> 
> Userspace audio daemons (e.g. pipewire) rely on the jack state to
> route streams, restore per-sink volume levels, and recover the last
> used device after a reconnect. Without this, those transitions are
> missed whenever the sink change is driven by a mode set rather than
> by a bare HPD event.

I can only hope to see mtk_hdmi to migrate to DRM_BRIDGE_OP_HDMI and
DRM_BRIDGE_OP_HDMI_AUDIO...

I think the correct timing was discussed several times and the overall
conclusion was that the correct time is when the actual HDMI cable is
being plugged / unplugged. See the discussion around [1] and the
captured response of Mark Brown.

[1] https://lore.kernel.org/dri-devel/cwxmu5a37qaqerpaolohxw57nzerkvlumx4dsqwmqwx5t7xhxo@kq6j63hfydra/

> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 9050d7785f109..565bb72c9b63a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1013,6 +1013,8 @@ static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>  	hdmi->curr_conn = NULL;
>  
>  	hdmi->enabled = false;
> +
> +	mtk_hdmi_update_plugged_status(hdmi);
>  }
>  
>  static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> @@ -1082,6 +1084,8 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	mtk_hdmi_clk_enable_audio(hdmi);
>  
>  	hdmi->enabled = true;
> +
> +	mtk_hdmi_update_plugged_status(hdmi);
>  }
>  
>  static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
> -- 
> 2.53.0

-- 
With best wishes
Dmitry

