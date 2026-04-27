Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17562FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SX13csyuB/QEm6z97KDEVCbw9bOnr8oHQXxFaeduZ78=; b=0ehFP2t2iDSuPgfXQna/DtztIK
	66EkNG8JTmmgbPLE6c3KT5JaHCJoEneqA9kGlVH1chQ8pdnmofi/DuESxge2Y7WSH0qV2/iiQQSHN
	zEe/bXsla3KBI+SPw9i+Jwah8I7T/wHwNZjA2E/k6chaFLrj7xuNB7km81XVbMwL2Tt0H/8/G5QQF
	Lvyqs96T0YshCwA+Cfi6IR3wySnXLoGT14myU80blV5B7Pi/36PwE9jkkkgNW7/kIgvT/P25AU9gF
	CfwsFfS+OT81myvazuyf3TeVQSbxg9LDXj67HDHx4hhij99ym9GVztgmh3tokpivm5/N29ZE8T9oC
	XPxPrAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTuH-00000000D3C-2ZUU;
	Mon, 27 Apr 2026 21:54:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTuE-00000000D2C-0rWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:54:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHc5LA1238182
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 21:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SX13csyuB/QEm6z97KDEVCbw
	9bOnr8oHQXxFaeduZ78=; b=H+CIdJUBMILCMgyJ144jJwXAlvJV5yyaVBS5bJjy
	GLd96Tpw25a1OY3u/a9vsnIY4fbi8YxinUX3lFNLIIW4R78bA4hrgGi/5Q23OwKq
	Ti8TKZOnc30BwNixB5AYfNJJQHGCgddB9MNAExtOqk3276v5ESpiJ4LVz4ZRWaqj
	CGJoAU5S785kRqJXd3qu8RFpADqji41R4+pkQz1hhrY4hBXbX2jX8LyzTV8jXa6u
	61HItosx+npqHvAyu4KogzTV5dkH8TikuDmNE8869YT+95phmdzB1K3cVdVJ6uas
	82+9QSqxHtzNjsUH9jKxdnMzv0iCG660R6DR237VFdVKUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4jbs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 21:54:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50df4c130dbso184131811cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326856; x=1777931656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SX13csyuB/QEm6z97KDEVCbw9bOnr8oHQXxFaeduZ78=;
        b=iwUgQ7NutiBQmaBaHyiiyL4q8/yJKNQ62JpVhsUjIDhQ/sPAF2WVYLIuulq/vZ9Vfj
         GwonLK8VzwihxvhkMtb+hu+XVR5TNvAk6cZ+iFJ6jUf2PqbqXZQsdW2OKrlg/iD/R381
         Mh/PlNqEx2aI1SQyKH90wZG61mODEl9EyjQankM1aLmdhnEEktb8utxlUYgWt9kUdL2c
         x2gpZq04Ajgdi7zuWty/s3sly5+WF4V1NXGwCbdcn04CCBmSaHG6dV/xsubo7nFywXxn
         DULhk1e83ClzZnuNe7HO1PU1zDXCg1Eo9Y1paTa05B0+43U7P5qxGKaoT0HI4tme4h+F
         4YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326856; x=1777931656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SX13csyuB/QEm6z97KDEVCbw9bOnr8oHQXxFaeduZ78=;
        b=S3MS0UJNStdFoGJ15o9cJkotjOBZHhfLv/9seazQMOUykSOZlWVfb306Qnfl9Kb/Zy
         HxzUiUWY+i30KJt0yX+uq5K5DBsnB3cgE7hbdceij0cqBxJ4r9ooyRfDRrgrz5IgbqN2
         jcylgz3rhbhiFSIE4JG1G9cHOi7H2RJylMXym7V7Imx2Ysw6t/2M1YjH6NovVVtQ6mut
         Fw4XRsDvCbIUsFqLIMR5abG2lVm4iRgSmXdUE5E/zp5Q1kIFNQNDCCVUiLvOR5zXY+Dr
         9SuKyjh27ZoAvUPQcDmfqAh2jrjvZ2vziDmhmBfy0FsVIjJLZe7MFq4umoPIklzrtcew
         cJdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9PZZImdRJftQY66Pm/b4N3SWfC/YkuvkpnAA6CHWd5bfyFcO+/3lFHECwJTtnc1Dq4uRFCC4OEW726Zf/A2IA@lists.infradead.org
X-Gm-Message-State: AOJu0YxvAYkAyTnp8sawBfv3RlXn0HErO82CrBWPrADCQMQR3rMUcVOF
	ogG7UkJsvWAhCUQN1SZkf1meaSpbdfrCK7XXDC5DhGsLXHPMZrugChlcfejdtCNgkFtonRt1tVm
	FWj/mGOjxU2Ks5qiNiOcii9zS4vo8mUaEzg3E7dBbQXRMWQaxcPThcMYJ37Jonb2M3ysb0S4dbQ
	dDUQ==
X-Gm-Gg: AeBDievapCEry8udQSA5eYK2Dc0JusT9tYi7sgGFInOE6VmmaeKfm/lBl8EtYBjCwro
	/J6ZFhiUhSMaXWbLldWADJjkIh3IzunxquZwa5+uZvwGAixWcIkKYJJHGhwK9mxvJ0SDMmsGd84
	OrPSzfjkqvBKWDtnRyhUdnTHhTkb13dyJw6YFi7l0d4va/KTVKBk5eE8qSUgbadxDaSoNcbJva6
	P/+Th9gzK2Bw2B6Lyi73uKUJI2ygTb4atBf6TpjoyQQVQ57wKjTKQ/ejYmNf5pkvU63e7zCdGbR
	XV8ViTP68Mqt0MVKBtdBbsa8NFXvTFiOFviiz3ztSKBHYFQl1w/2LH2igjdinQ/9rUWOI5INPLh
	sq1Nw92jHNkC2368I9tV6kCEwKHDfzf4afwCfKcWAsaQjgGGFsJL8QFQOFYiV65UpAYoIIC4n6Y
	9IKbGCRFLJgJ1KjM96lZ44jbp8OiqJf402MRYjH+TgLuhVyw==
X-Received: by 2002:ac8:5f12:0:b0:50f:b427:7525 with SMTP id d75a77b69052e-5100da98d86mr8185841cf.42.1777326856488;
        Mon, 27 Apr 2026 14:54:16 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:50f:b427:7525 with SMTP id d75a77b69052e-5100da98d86mr8185521cf.42.1777326856041;
        Mon, 27 Apr 2026 14:54:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462d588asm105499e87.34.2026.04.27.14.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:54:14 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:54:13 +0300
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
Subject: Re: [PATCH v5 04/10] drm/bridge-connector: Switch to .detect_ctx()
 for connector detection
Message-ID: <znjgxzoyavxctvmec4j376a5cjg4s2oqhn3s3ubkbkuiluguao@pve7siqulhxp>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-4-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-4-d778e70c317b@collabora.com>
X-Proofpoint-ORIG-GUID: 86ykNlGlP1VvoUO-Ld6NRB0oEE8TSZJ3
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69efdb09 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=MTERcTr8AAAA:8
 a=69EAbJreAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=5Ozh1E2pZYoiRNblH9EA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=1w2Y23rLpnaGpkO2nlKf:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 86ykNlGlP1VvoUO-Ld6NRB0oEE8TSZJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMSBTYWx0ZWRfX8WQjM8KZkI+s
 SBx3a2RMQBUKSiJ9TdiarEoorbnFlLNIZhytQR2SNbEUnGBVQ/0o1W6uVBBiGF2STQAAxWWRTNx
 konmY8iZoIF760wfzut9B7C1+rLHfmyVlrIR5GDZsg9/SyN6mSr+9MAvmKWNvdydtqS+H57Xf7D
 rzboJ5Vvc/MeuaHwJXG/DuQrSxx82Q6XdChSPss3RpBBt1NslHoBQsm5BuB3F7Yq5z0Cn5cWK85
 /oMeSOZ3tkIW1GhUaXQQLr01/Q54EIzvaT9DNXhZhFqcbX51VeFPzw1EzZEidJxUwD+L59lBiQm
 tFzZ0LmKXPSKrfBF29iJSS9fUEr9Qzz9g+EdUQ4lJhw09aceIZ28wqMSqJPzBi8yyqgR4mR2p7L
 VsNRw6HuOB4jHvf9ZyWlmTLpVeQYhgxnIMqYN3zerU1i6TLXTyBQxu9yPR4Ce+4AedfQiKgHdLs
 Xx5zlgQrT9F+FT/oNcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145418_383272_65515052 
X-CRM114-Status: GOOD (  15.15  )
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

On Sun, Apr 26, 2026 at 03:20:16AM +0300, Cristian Ciocaltea wrote:
> Use the atomic .detect_ctx() connector helper hook and invoke
> drm_bridge_detect_ctx() to propagate the modeset acquire context to
> bridge drivers.
> 
> This enables bridge drivers to perform modeset operations during
> detection, which is needed for managing SCDC state lost on sink
> disconnects in HDMI 2.0 scenarios.
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 71 ++++++++++++++------------
>  1 file changed, 37 insertions(+), 34 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

