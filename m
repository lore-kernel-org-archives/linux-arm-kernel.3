Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DFFFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 01:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYLhrY4KD15wk36W8v+cBLgX+4JBrZDZkrOmUImGT2I=; b=HiUy1tCi3p52ER97xAKW2runvu
	eMmEwdmzK6+Tz5sm9r+aglvWKMV96ndD1Ck2mAXHmv+RhY2pGwo3Qq3fMJtsUz/agYtqDrGLNMeP0
	WGF3BM/SXPOm5d53EZ6vMUneQZpTNJ4RYuYUsOd8FLfbKPzgh+/GuOyqWZ4bWv9ZsSpMOpV/482d0
	0gj68Za5Fn7yfncZIFwrX7y8Wbxa3/AvIKRlZJCNSjORmYtLCgrk9g9D/tCGbknOPQk4AbicfaI7D
	0ebrEJWO2bVV4ffxvBd6fCZLebyqBeG+xC/9PBMk6dsTxewGQpX26FWMkixvgiFzkrJJZH7lDrgqy
	Kf+ihdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXSe-00000000PC0-0mia;
	Tue, 28 Apr 2026 01:42:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXSa-00000000PBA-2UVc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 01:42:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RM7Kw9241140
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mYLhrY4KD15wk36W8v+cBLgX
	+4JBrZDZkrOmUImGT2I=; b=Ny5n8i94X4j+0BqT3Ik9x0vssW/x3lKEpDe777Yf
	EO/XPk774Sw2g97FxpflCcGYVYPpik/neEh2B5XkPRJF4Xc/FGXSfLO6Oy1W4uRs
	JXfgPTiy9qUGA1fbCHfZJfanK7QLX3gt9oPmv83rHRaQmWLJQ2CgBP0bo0Mqq5Z/
	W7yZXHb20L53CKu4cDBjqADb8+9o3GhMguqtRI24DZow00sTjyGW9e0DKz743bkC
	2gGaRByjePdSER/Y4bHJdrojPDs8Ew9wZ+JXStw53RGtFSdcvLwtTGOEr8vMRbGT
	Eu+pN2y2ODW6IK30ajqyBkgV125/vaCyz5Gm1qywJrMO/Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946td9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:41:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56eecfd79e7so21509669e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 18:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777340519; x=1777945319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYLhrY4KD15wk36W8v+cBLgX+4JBrZDZkrOmUImGT2I=;
        b=NAWL+DoN3EUn43TVzhtcUjdeMJPJiQwb5KOB7pMAiMW7wsZBk5cfEwBixLKc/FC6IM
         b7gSvaKJ54BpO4l/rkh0bZPge3tcX4LB55l0IXWPkEb+wmSfXlOv/xGajclOuAg4opHO
         iCveuQvShsxqz5ITjir8FjIEchBjWNCI0SLfK9V/SbLpTXmmGbUkOlJ9ZYK0kkB7FPLH
         Hqxi9JGZ2ylcF9FbaBcSoLWsfk+XTngigCQsZANCotDNBgUmhclGUuODJYm/8qUlxdwV
         bfXqli4DZs6pBPXTpSWxhUIlFkMMK5kHbPnskqfgd5g2C9K5FgsX81vmovrwJ76UOgjd
         SNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777340519; x=1777945319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYLhrY4KD15wk36W8v+cBLgX+4JBrZDZkrOmUImGT2I=;
        b=q1itziYcCme+Pd96CCYwWbKH+VA+O5avbpgTvlZ/NUl92gVOrpjiplaCNP/YymJiYa
         Rr24cn8KXuDBubwxM7tRdhqf2RPVvcXjxgNGDhQE8sgGygtAufHE1GYOCSbbIgRUe9DD
         yEE03JyIXjgWKHWaIIunhPxdqiW3ao5M53pHQYuLrU3P6KnwmvDTaQUM1IOFGF1gWV5R
         ZGtiChenKS4lFUPjLH+3Z6bjGuqRi77I9V+k698OPPwuBdTixECshgBvpgyQyFA4b+4S
         k8T/giCke9216w1wQvkQdpYfJYmG4eUzTNoSIhnU7wkJ6dobH4DiKzc4Cv8Bk6OTS3fF
         Ok6g==
X-Forwarded-Encrypted: i=1; AFNElJ9SUTnfzKD9gBQNZM0GFYQtcQVW/vIdHWxXODTG2uSQPkElP+SBqxZFe5B8fV/jJeRK1uVc1HkHY+G7BRisNALx@lists.infradead.org
X-Gm-Message-State: AOJu0YzH0mRiHQntpV18CXmlJa5EB52M7Kwp4MXPJbiaEn7P8FOrxtaG
	YXSTlhdug4vtulybZ68t77RCknblHf4rXIyXCm30sGNqnijod14xAZACUnbPOWVkwi2nN/gWDtK
	K2/to/CMqaO4h5L4q2T/zQOgesgNWQyNCgU7p7iK9nBJtx6Ai6Kp+8K+uYHmV1sP9DKCYolwWUC
	7C1w==
X-Gm-Gg: AeBDietu6/9bY/DDGqfsIROpiqCpOuKKCTkUxnQAuU/uHSgWWRNbJbnlm5/8xniKDrN
	ZotnQFBipNb4sP0uqsWwrFePptnSHOF4Tel8OHY4QxkF+Dxd8Nzv5aQgrqNZ4aYGGXiCzHoeQi/
	re7z2gtayDo8WT5jDBbe9REQgg8fu/MjoL4az+EV5gNfp8DJ4T6RbIKKyerfqR7JwbU9DgcfKhd
	YOxUon4NWRW6/conJ+95ICiGrH3MhDvBiFd2hwe4qfoXngyOV2jgOPwaJrbJ/PJm88prIeonsB9
	/MmrK9t54QOKnrllWACNANF86zPNKFQAQN9AgDwiX3egglcgafxiaSzLzfjlDAcBsaDcxiSn/AT
	j1FS1Gi+EVw0XgHswamgVyqu3C8iNvjCnDTMkuYoltqghKeeZ/KnatF0dOrXWG8qy8JHEiiCMXO
	pGJMq87QYM/cKmoXBj9GxXfqX5nUgX5Qdog3AxQ/afBu80nQ==
X-Received: by 2002:a05:6122:786:b0:56d:b337:4709 with SMTP id 71dfb90a1353d-573a555926bmr542832e0c.6.1777340518703;
        Mon, 27 Apr 2026 18:41:58 -0700 (PDT)
X-Received: by 2002:a05:6122:786:b0:56d:b337:4709 with SMTP id 71dfb90a1353d-573a555926bmr542820e0c.6.1777340518195;
        Mon, 27 Apr 2026 18:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f58cc6bsm2697611fa.37.2026.04.27.18.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:41:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 04:41:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Diederik de Haas <diederik@cknow-tech.com>,
        Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v5 09/10] drm/rockchip: dw_hdmi_qp: Register HPD IRQ
 after connector setup
Message-ID: <hnbecmgviu7jl4xrsksna63sa376gpcaa6ate2qp2o5lgg35ot@wdthrayons3k>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-9-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-9-d778e70c317b@collabora.com>
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f01067 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8
 a=MTERcTr8AAAA:8 a=69EAbJreAAAA:8 a=QX4gbG5DAAAA:8 a=XxVGwUkuwzZ9F3MZWY0A:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=1w2Y23rLpnaGpkO2nlKf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: dOMunXNsNiVn9LlIcPOwQZtXA6L45vF1
X-Proofpoint-ORIG-GUID: dOMunXNsNiVn9LlIcPOwQZtXA6L45vF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAxNCBTYWx0ZWRfX1Jny0vPFZ0VY
 QrWjN4D1fPO5HBPfQP0qAIDqfh3S3lbAYDVdvebPqtKtOyR/IKOPVXyJeYxEyXBszWK5zwgsz5J
 QgwMP3R4jWvIbpAHha/9GCZbqusA/yYeuth84Nhpd3ngycPZHa1DsQFFuQXa1WbIfbWHHCWf8mp
 LIPUA0l8Q1ujWUJA1OGeVFW+bnVpv1BVM68c9CldMg2Vy5DVzUtAJf8VOmKHio3LostnS7WpOxK
 6Kp5/blADMQkT4CqIbnpEezZ8mOr2/qpXHLMsxrUZw7Auh3YiwDZZ0v5G2ZTJUAeX9vYeP3i9T0
 yoZ6MtyFF317ur/0duKFSYUu5niUsdJEep6ks5L7XZ3K0iHeZN82hNXYjVitTUNdci/sjncDLFt
 qj3dkmY0MM6+HX5xOWufBNTFt6ihmu4ajQVIoOhIgYa0ZOj9T38Px/D4tAkfSVI6nvKgMIPCgNG
 D0uASRjI1Ch6gQWJBDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_184200_775892_A311242F 
X-CRM114-Status: GOOD (  25.70  )
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

On Sun, Apr 26, 2026 at 03:20:21AM +0300, Cristian Ciocaltea wrote:
> Move devm_request_threaded_irq() to the end of bind(), after
> drm_bridge_connector_init() and drm_connector_attach_encoder(), to
> ensure all DRM resources are ready before HPD interrupts can fire.
> 
> While at it, add error handling for drm_connector_attach_encoder().
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 618d2aaa5c7d..fbbe26f8730c 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -577,14 +577,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = devm_request_threaded_irq(dev, irq,
> -					cfg->ctrl_ops->hardirq_callback,
> -					cfg->ctrl_ops->irq_callback,
> -					IRQF_SHARED, "dw-hdmi-qp-hpd",
> -					hdmi);
> -	if (ret)
> -		return ret;
> -
>  	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
>  	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
>  	if (ret)
> @@ -602,7 +594,15 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  		return dev_err_probe(dev, PTR_ERR(connector),
>  				     "Failed to init bridge connector\n");
>  
> -	return drm_connector_attach_encoder(connector, encoder);
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to attach connector\n");
> +
> +	return devm_request_threaded_irq(dev, irq,
> +					 cfg->ctrl_ops->hardirq_callback,
> +					 cfg->ctrl_ops->irq_callback,
> +					 IRQF_SHARED, "dw-hdmi-qp-hpd",
> +					 hdmi);

And if requesting of the IRQ fails, you have a lot to unwind. It might
be better to request IRQ early enough with the IRQF_NO_AUTOEN flag and
then enable_irq() here.

>  }
>  
>  static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
> 
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

-- 
With best wishes
Dmitry

