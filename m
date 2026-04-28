Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F73BFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsYf6auyPCvYiUhWs9qEQr3EnNJRMJfao1u7g46ap5c=; b=ReMfI24vQetASWjwWG9oLl4gmp
	ZYNIW+4rVV08nLeZ/pL98QWC+IcRFN7scOqBKmUw9o/kBdG7IuleriANgnjrb/p9JKE1cBAWdnGU0
	zbSbhhl7jPE8Dj6Ql4+twGJWxNvZHS3ZySVzcZ8XcEsNCswSMiYCaf3qfk8t+A9eMVF5RtyTbJLPP
	pPIlSwAKw1bSkKQez/QsMLbQgBAny+/94Mxv9rf2weioLl2OSpoGuJAjqvLyLwHYorJnV1q9OOurS
	0rhfQveDsnpzN1Gij3QkiKFDt83KSsyuQzuvEcvH/NdpmEroDd70UOlUlXodjP4KPW1r6t3oYPTM/
	mBqcy5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXdo-00000000Pft-2ctn;
	Tue, 28 Apr 2026 01:53:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXdl-00000000Pf4-3e4Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 01:53:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ3HOv2111945
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qsYf6auyPCvYiUhWs9qEQr3E
	nNJRMJfao1u7g46ap5c=; b=YHbhxU7dPRkCfypPX1k6IzmiUAXi/D0aFgIvztv6
	uWLPPelcDF7ODdPrh3x/UOhzSjuGoBFWLpcAlIPn7qb7H9wKDNtagMwuqQKhxqgO
	f9V8R7wtj2mL/51uY0Ys/J7WOh/W68TPRUEyD7dsHMHMz0Eo1Whoj4zB346YfMsm
	MOCRxxzIcwqCQq4PjqOh2+6SfjZyCAedlKcHedI++RySLsTnWjMWLQewwe1vWbz9
	l5NBfavcgT6p3iV/zzMR3lOR5k/fjZ0fjMLEawYYsfifPQJDyzFFgpdrPRzbyW85
	DarZXcATaQPn7pGqCqbZ7vgHb+4g8uKerkgjmFhtuAcI4w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbh8xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:53:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56efe2b00daso8870541e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 18:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777341212; x=1777946012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsYf6auyPCvYiUhWs9qEQr3EnNJRMJfao1u7g46ap5c=;
        b=f2H1hv3M8I/YiTbJ9MW39oxurOig01ZN/zRVOd/FfhKudRhCVTVqpR7sFBT9XlIU4I
         v9m5sv2yzJ1op8OaIZkZMKDTbuL2F0x6eW+6Uv99I+h5M/SW3+8N+D1uyMaLAyUA3NdO
         nqHfvLi4VINYxZxrFawO9CD/3S4nSFn1SH29+GDdNhW64ABiaG+yjOcmSqoPvKJgQl3O
         x0dFhCCBEOWEo74N/xUaLiPYq1kZaRteDar++/AfOLCJo2TikM+wrVGNaXDLIoRcWiWn
         7vyX0LgU2V/gX1OCObVGoUVfvpyAgg7zsrKficdGNRxQtvr3TvPHqjLyqYltknH4KKOb
         s4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777341212; x=1777946012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsYf6auyPCvYiUhWs9qEQr3EnNJRMJfao1u7g46ap5c=;
        b=XlfZk9EBaAgOiMytfy9ygC1KrAt2QXqWGcctDhKloSEIQFQXRFXTQK0hp9NlpPyhQk
         eStcwK8GWWk198uLUsclRSCKtTlTTep/N3IBfooR1IBLYz2uQEp8474QyBslNe0YhL6h
         niuCCtNhx9FhR59C/sv4Uk6rEKz8CVV1rUovAm0rjKjy7lROS2HL5EJ1ZkrhImcj6yVF
         zv9cv481CYnjNCOP0lM66sH9Mr0bbEtaqf+D4zLVtWlsK3GiRG3MaE6swKtfDvaUwfBx
         k4SUfQ3nipRyZnjyJJjgyZa15PZIgbj96wgeUBrideQv9wkGRQSrutfZKvpRU+zk9b/u
         hJsg==
X-Forwarded-Encrypted: i=1; AFNElJ+cjl3B9EHdWhV3GklntYrqec7pZfBkYoSItCjxVOwwRxNluLNSQtCDzYpRBo4+V1K1HXGLx/oVQnObnc9Jo2js@lists.infradead.org
X-Gm-Message-State: AOJu0YzFC+vSl2+VUFjbY4EvDyB2u/zdLntOgmGLNe5OyyIqK7necf6x
	csmQISM0Ys6/mLMHgqKowRMC+SWCBiPQSEY3SQ6zxOiETfZ28adMWpaG4MLv4jCnaB9QSdV6UHF
	qKK2sg9+7//a1vjJzuA1jEpqJAL8qbTM5APtIEhX/ZAxMarmvFOoGxnr69wuE9NrjptVCFRkEX9
	nGBQ==
X-Gm-Gg: AeBDiesz/zjZHqoxh3o/hCMSIOnL5m27ARZHbBVvqDRama/SHQt8/1jwDyVWk32JmRZ
	QYDElAENgMF8SdIp8jABirpyggLECHE3tfyFtta7GjYB3124BmgYwEFkif8KvSdnkgx2pvOUlSF
	KSmaMlPsZ63W5JymaumcRLX64q/3wB9OIxbYAdbMK/P5EHrzl0YeM2n0/SoELMKL621DJn/PSPl
	sSCrC5fhy4LEURpgCuQ5uIaM6WbFIQvwrs1BpBKZb6xRkvHfBvyKesIhTJMX0445eMGrtbdaHGb
	Op/8qVnQ6XAsM3HChbcxqqPAnEVHfVjvU7zR/y7ziGW0ItjpLVAZeIlbKVnRjRHlxsxGKnFmFEb
	2LioIF23MZU4f0lzPPBuCutW1olTK2ANO2yhCNd8WaHxMvhU64PTHsoVAb6IXcMdL6Ama7nwbWZ
	xqeLH8RHlHDUS1OtE7lqLWpL5ZAbrlEoD3HxGE0tPvm/IuzA==
X-Received: by 2002:a05:6122:e20a:b0:56d:8493:d455 with SMTP id 71dfb90a1353d-573a53222d2mr525618e0c.0.1777341211449;
        Mon, 27 Apr 2026 18:53:31 -0700 (PDT)
X-Received: by 2002:a05:6122:e20a:b0:56d:8493:d455 with SMTP id 71dfb90a1353d-573a53222d2mr525613e0c.0.1777341210914;
        Mon, 27 Apr 2026 18:53:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f5b1b3asm2780951fa.40.2026.04.27.18.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:53:28 -0700 (PDT)
Date: Tue, 28 Apr 2026 04:53:26 +0300
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
Subject: Re: [PATCH v5 10/10] drm/rockchip: dw_hdmi_qp: Restrict HPD event to
 the affected connector
Message-ID: <xwsnwqk2bqixswue7ajy5tfzxn6u7sfuqlpquywsrdj3bs6nmb@pv6szzdjjuzu>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-10-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-10-d778e70c317b@collabora.com>
X-Proofpoint-GUID: c1s7TUwTzGtdFGp9ZWKfE4nBzcYI2LlD
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0131c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=MTERcTr8AAAA:8
 a=69EAbJreAAAA:8 a=QX4gbG5DAAAA:8 a=PsTfIz2H8riIsuG6cnkA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=1w2Y23rLpnaGpkO2nlKf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: c1s7TUwTzGtdFGp9ZWKfE4nBzcYI2LlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAxNSBTYWx0ZWRfX4i5o9QiIQ7Bf
 P1tH9uVjdISMaKbFiYzkSkrlrcN+nUtYAQyOH33RsAcAm6zkbxJDcHRLFYX4yoxHUq/q05yLQei
 UETCYaYyfDK6jh/z6KXhJ60MQhy0yVbdJmSvLUButRTuXpaWUvVBQyLHc0DBqPkjZDhmcg7Si0W
 PGWrZjl2IlYeRJjFl04f+mJA1G1kcp9tIBQ5HRG4OR7wBS7lDuKIbkJERuZbM4oZpZ/aMn/qi1q
 XuMnDhmF9ik1qE4qXQW8gYZdkUXjpbxvwyztebtiLf3MAXaa222EP2C6YegfrCJbRUYM67/ckZY
 EUvuJwzerELus7YW0iygsXU2fKls40oLTL2KgCf/KcZFfduhsIoIxYFA88jx5X1DUrOjwuaDirg
 OZw4/B3A7ZvaM7Md1zaefwzW3wVUH/9CwrmQnFqwpY9K0JaHm6ev3YEsOvvNFZv9pIf4hGajXGu
 /vSPa13XqurqgjQU6mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_185333_943053_5FA32C95 
X-CRM114-Status: GOOD (  17.25  )
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

On Sun, Apr 26, 2026 at 03:20:22AM +0300, Cristian Ciocaltea wrote:
> Switch from drm_helper_hpd_irq_event(), which polls all connectors, to
> drm_connector_helper_hpd_irq_event(), which runs the detect cycle only
> on the affected connector.
> 
> This avoids unnecessary work and redundant detect calls on unrelated
> connectors.

This also doesn't feel correct. The dw_hdmi_qp is a bridge. As such it
should be using drm_bridge_hpd_notify() rather than any of the mentioned
functions. Would it be better to add the a corresponding wrapper to the
dw_hdmi_qp API and call one there? Also consider implementing the
.hpd_enable() and .hpd_disable() callbacks for the bridge, which would
remove the necessity to call enable the IRQ in the bind function.

> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry

