Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB4CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxiNADN34Bn3hCov2PhV3feq5avacxCrZr/2GuhWpv0=; b=oguxbS3tvZUaLhmI+/vDEsm9Os
	ULJ6mmC0vT7ob74EqRus5OUVQZd6q2sPqFgfdcnKNsWz7C21J61doO70MpN7wSLzabvIxv/nP9b3j
	6W15UXTBOYFk5bIYuAmvuFpAXZE7HXpHhZ4zlaTTloflBYHevmFunGcA2Wq9D5IpshZidbnHPCDiV
	vT8SQ4XO5svOUS5ymGSGgx1mVsM6z8/n0KuigG3I7BFCs7TwHvODMLd8yOBdlz3blZlplaHB7zwuh
	x+GmnPD035zW8WlONG6CdOdt0+1+FevkNXE6ZttVDlOGnUoSaDRpDEqZz2X722H7Vu2G8ItkN60Dp
	uhuHlzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFK9-0000000AU1w-2lmP;
	Mon, 12 Oct 2026 12:40:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFK5-0000000AU0H-0qdv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 12:40:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AFR802084
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sxiNADN34Bn3hCov2PhV3feq
	5avacxCrZr/2GuhWpv0=; b=ByZxy/6Js4fHnxneBjxYjCUubPTr79h1A+yP9Pzg
	x8aFZntUDX7xs7KWuK222xsvzmdMQfW+qUbHbQ7CWDCsD1VH4BqX5WJCwW4xbRa9
	tzn64/nsBHpz5T+kfovaDhZhfWmnb992bOu5BpFDyZbKnhFVj8IJdefp+0Kcgqbe
	ffMAraZ80Ib8x+iVMtSeUsM2A8yi5PBa+TzUgUCvCku8Tyx9LeNck9+lHyAooxgq
	2+xteOC7CZgqVi2OYDRFgDASD1WeMIIunxutO27PxlL0FkDEKnruNp3WohNT0D1b
	YCSARZkUwmRC1pugGI3OSCp1uh5waA3k+EK7fw/7ENANUw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrps9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:40:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b529a8610so44524236d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808807; x=1792413607; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxiNADN34Bn3hCov2PhV3feq5avacxCrZr/2GuhWpv0=;
        b=HrRfgBqZQnHsEKGzotdoadv2M7yjSB+VjKSD9AlJRRGlSWQ43ZcQwUCJQZK6ACNI1n
         JCr+QaSnKptdbOIq58fSkYeUugPL6C5g6Nyntrgaszs9UNVVXkeRdjviM6bb60jLfhDy
         yPkvoRIvKYp2LfV6r9uDyVsivnD7pxUcvgjfMoGOhWNnBNODOpZRJSd3tNQ9YojqvkdD
         g8LGHdmI3K9l4Hgx9BKoa1WjrkMvyLnpHY9+rFjC3osBy7MfmAoyZMv5kr4zzn4Rpwy4
         5CXLIyDlpzuWEwInyE5ffha/NEQ73uOQa+nxdfgZyNUY6PP2arYKTVpbvZUHSvcpX8yH
         NsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808807; x=1792413607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxiNADN34Bn3hCov2PhV3feq5avacxCrZr/2GuhWpv0=;
        b=ViLiTGzhy33ii+aouC7f1dpWvcwL8A2+5ZXHaISRp1kPA1eU5jvJ1c/V7UDOlo88PM
         zJjcDeLjM3PAI5z2gDszow1C02z+nFbzr81YpEen4W+VMoWfenWUwYv+7zjN0wxupRHr
         ei02msguU/4RH+BEDhjdm0iAyl4QI9eLTsSryKWhPnOfnQ4oyqG++xq26jrJuSyqfT+B
         UM4HIV1FwTo76aFiOT+xM3OxBgpcHjG+nIVYUTrw7pTAa+IdOERBFkpBGN12vko8Bmye
         cNhPwBhKHC/cbZ5syj7Kr+pHvyhCdcfG4AVAhKJZET6hAVpP5qtoET2iDzlaTwBFSLMA
         JU9g==
X-Forwarded-Encrypted: i=1; AKwUvBwYuFPV2O2UOKKtslIn4O5Y9BMdEiv0uMHSCmxa0D1lJdlfr8aqRKM7oKD8fqUOL/uftoej/IkysUtBqTQZmUZZ@lists.infradead.org
X-Gm-Message-State: AFq9FYIiBrx2ZQEaakYmy1nncbMFFOV+prpXPtWCe0AVGcmq6f8IQ5SC
	958s9TJqG9KvLWn6ypvBl+T3642eVg3iatDfGfkITLoMVXK6UTfkYJYNKl6PlMZVHrlFX1r4CyE
	BeK6DiE8tcQSAdjIlcUtWgg1P2vzKQGvtX3QLrNYLjtVDUVwtzMDhNdQ0AAT7K77TzZeBIZ11r0
	LLkA==
X-Gm-Gg: AYBFou1KiiYrQ+3Lv829x6eZ2qSwLYyReRjgV0hB5PNX3ink4LmuILNZocht37ncs6f
	ytLmLfwyeQhY12HdLaVrMtM9EdLPdinSvEBK4NQ4FtQ46nMw6GgA6xP7t4oYQInbH5Ps84ot8VV
	uZNihgGh0e/OyG0X3752DcTmIOPQOhhWU2y4nWb+Mx3JndPHziJRfyXAEWp6G/tKBVf6scDp4AE
	H3plfrGWPoO8oYA//jE6GE6I390j3XO1H9SQ5ELIJvz/O5PdtOyAox2ahx24MdcGSF9fVlPx09O
	4pXqWOy4DDltheauB308K0SaZVOMMHw/9mG+FJqCBFUvOp2DR6TZ93NOnB83x+SiJDtxFH9+0vr
	B7vpFWno+bgQPIzBOiGfvGiALdkZBCGiWTrkTUJplLSsne8lYhXcxbBUQwnp0aIIBZDZetYdkha
	b4V5iG6j3MwEO4
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93ec12c9f75mr1287528585a.71.1791808807241;
        Mon, 12 Oct 2026 05:40:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93ec12c9f75mr1287525785a.71.1791808806759;
        Mon, 12 Oct 2026 05:40:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5136sm2762212e87.61.2026.10.12.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:40:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:40:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/20] drm/bridge-connector: Attach max bpc for
 non-HDMI bridges
Message-ID: <hh2nn5eazfxpulmtvrugkjujhsspf7wlr64a65smmzxtlb53ml@6wynyytdaued>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
X-Proofpoint-GUID: eFeKJWiymxqi40mfQkjLYj2EamwGysJY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfXzE1Eks5oEoQr
 WmjzNigUfvtnlnGlpbRORMVzakIRWd45GEtJbzTieN1Y6shZVmJTKKAbyBc6jXyMZfFJAbflAs0
 bXnBUznYDEa7tnSkJkFD3Qz27GAHtkc=
X-Proofpoint-ORIG-GUID: eFeKJWiymxqi40mfQkjLYj2EamwGysJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX52p6tWGWTacb
 8wG0+77J4BGEEFCLtgWprAHZ4iPlDTe+s8HCoJLeWE/vxeFUq+DYxHBF1NFqjoNkTJA0cyRrkpr
 pHofv/jM+FL0Tdabswp275PQgg1EXewn16SqvkXzUxhXHWGB1Zec51hQn7ce++IN1LCmmXUsKsa
 lAvSYVunHNl+gcnrFGw3YFFrJ9YkiKKfZ460ZZ4Bc5CDwoBaQxcUp0tivBZpgEL3TNwNmA0+4UF
 pSxM0t9EvPJwtfzK+QkZc/NiBiePs31uaJD77DD94A7f//RVG7DVvobSqz+kQPBIrR/C6smFLU6
 f0+8ykZjutIvt/2pF4qoUUtrzgtQroHI0g/+ODCSojF2iK8iglKbdH0kX5c8vCCAMXCsubFTw2y
 vcDSmx+CWCecMKp/exlL64I6zZ2OSq9TRQ4l8KgK82fwgUB5uM5dKW3QrhrFHqhbDAjMdRLmini
 Yrp9QCDk5gxS9Nm+11A==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accd528 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=4AZdoXe02SclfKkZrKEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_054009_252185_85ACF99A 
X-CRM114-Status: GOOD (  24.20  )
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

On Fri, Oct 09, 2026 at 11:15:55AM +0800, Xilin Wu wrote:
> Allow non-HDMI bridges to advertise their output bit-depth limit through
> max_bpc. Attach the max bpc property when the lowest reported limit in the
> chain exceeds 8, ignoring bridges that do not report a limit. This lets
> DP drivers expose deep-color support without attaching the property in
> their connector initialization code.
> 
> Use a lower bound of 6 for DP and eDP, which support 6 bpc RGB output, and
> 8 for other connector types. Keep the existing HDMI registration path.
> The property can be attached before connector state allocation; the
> atomic state helper initializes its default when state is created.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++++++
>  include/drm/drm_bridge.h                       | 11 ++++++++---
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 8b54069fa53a..be2e08a3694a 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -825,6 +825,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
>  	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  	unsigned int max_bpc = 8;
> +	unsigned int chain_max_bpc = 0;

UINT_MAX?

>  	bool support_hdcp = false;
>  	int connector_type;
>  	int ret;
> @@ -985,6 +986,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			panel_bridge = drm_bridge_get(bridge);
>  		}
>  
> +		if (bridge->max_bpc)
> +			chain_max_bpc = chain_max_bpc ?
> +				min(chain_max_bpc, bridge->max_bpc) : bridge->max_bpc;
> +
>  		if (bridge->support_hdcp)
>  			support_hdcp = true;
>  	}
> @@ -1026,6 +1031,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  					  connector_type, ddc);
>  		if (ret)
>  			return ERR_PTR(ret);
> +
> +		if (chain_max_bpc > 8) {
> +			unsigned int min_bpc = 8;
> +
> +			if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> +			    connector_type == DRM_MODE_CONNECTOR_eDP)
> +				min_bpc = 6;

This opens a can of worms. Consider having host -> DP -> HDMI chain of
bridges. DP would support 6bpc. HDMI would not output 6bpc, but would
the chain be able to negotiate 6bpc, feed that to HDMI and let it output
8bpc? What is the resulting bpc?

> +
> +			ret = drm_connector_attach_max_bpc_property(connector, min_bpc,
> +								    chain_max_bpc);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		}
>  	}
>  
>  	if (bridge_connector->bridge_hdmi_audio ||

-- 
With best wishes
Dmitry

