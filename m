Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCBCC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zNtlF6EBgMK54ivwKze52avmGMNXevbSu+B7Qp9w/Q=; b=COy+xN38lVtNsI8HlOq7c+bSi7
	lblaiXkeenXLP716e6oDWiT0DXl8qwOnsrIGNhNAkuWjmgVV9kB+IzMe8sK1cKY5s2Zmmv6TZ1rBl
	JfuGZ1T76qddH/cJD5seUr845dh3Fm6Q/kYURVPpgQua3+h0iQo+qxbcZTMX9u9b9M7KIq30Z5mAp
	HO9ZKCwSBdt5NlJqGzDhkbWJdhuiqWwMiTqx254aP8QhFzdJ9qiohvLMOVZxOwjP0I40hdSh+P++P
	STBQqs/17wEnjCxZPWgfv7zu47uAL1d5j/mHce05taG10QZOsgzlSzOOTMl+eyLlP386KRYvJJuxU
	Dc0vFVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRcB-0000000AjWJ-0iuR;
	Thu, 30 Jul 2026 14:20:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRc8-0000000AjUy-3O42
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:20:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDxFfF944316
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6zNtlF6EBgMK54ivwKze52av
	mGMNXevbSu+B7Qp9w/Q=; b=hKdDpD6xOn8RXByoH/ONerRf5R+Jo27skbtrQrx/
	ss0wVqgwcl5ckE1d84Ql7bRz6BmWViAJZK3nv9m17ZeZ7Xebh+3tcGRbXYN4Eq0k
	+7XkjZs/zVIlzeoi4tiAxCQGXnaLA8SGAtvhW2mh2tWS5lkMgq02Ck9cCuCiTDjG
	fOqrzIK3IALpgKVpZjCeCL/TDiBzH+bQS6aKn9SMPjhabvys0NWyeqrr4KDrCNqB
	McOpVlxw6MVkaDEnj5amYRoYtllfnp9mAwAwg0jtS3LmqI+zLL1wSOxM70Bhcuae
	xbyDj9wTnO3em5nLep4STve3Fsez81Z2VW4OJUVajB936Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7yt83c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:20:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283fa0656dso10845691cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421199; x=1786025999; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zNtlF6EBgMK54ivwKze52avmGMNXevbSu+B7Qp9w/Q=;
        b=RLk5Gt78ZuAfwjwuJ5i+8H1DR92ywpAslRj1sW93UzDMdJV1QXSf+qi1UrwikSLf7Y
         k53rxtLBK76b5noYsTxEBfeioHrVxU0D3IK+SmN1gQiAkmX5YrKq6GZ9gaUEItoFa+VK
         dYN+ZX18/0alzsHVmT/YxqDQqZXPTf1UmKqglwA1N4NNOMreENDEkeKMpiWthis9Yb1u
         SJZsfcRnJw/2s/ESxxfvimwTtD0h2jAEs4acZ2PAP8/7lsbiTnV1xtDa5OdnAcxVtP8W
         Qbcrm6nTrqVQJ+piupeJS9Uid33c3bfm/XLHMIKPZIc5lUMw7s1xvIOWlxhHNYc1IUBe
         0BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421199; x=1786025999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zNtlF6EBgMK54ivwKze52avmGMNXevbSu+B7Qp9w/Q=;
        b=p0hihHF5scyUyqwtYVGc/HI2XM9Gytg6eysAocBM87thSXNkEzGNlkqwU+6iFKrAf7
         naZIrkbmxneuIIZsXg2rLhmsO3ZtiV2uEDN3sO/6y5tVaO/m18skQwTGzlsklh/9I4UO
         cVLYI+UuHVWXQbebhCxZyOuzilrkPyr3qx9MFPt6Yie0jdMGgCHGT7icYAEjCZC9TgKW
         3Rk4XdZIXL3uKTS5ADQamsAIRDwZt5S/qqUAB9mN8YBMnNsgEtyRvMOrSnvRW0SnGNPq
         aJvScYcj7UA7/evjwAaVaC0QeeWq/s+aYzL4w9t7TaxZYLphloJ+S3WICGbCxzQHRuu1
         opdw==
X-Forwarded-Encrypted: i=1; AHgh+RquFeUggETMx+JJvdVM72Lm96R2HYE9wnSi10T3UsjWtT3BqRb/tbx3lPGFgIpLkiGYdXl4wQgHztxVYe0GObJS@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCb5Q2hWKEZJH9gp7XN6oD/bSPisyMfChglYu93LKdbz6qR3g
	1RvJt9ViZRbT0Uq/nD27oDlbCKKSEdNzQDi65uCR6j6Zt9u9pwFyzXdLZ+6/Qn4UrxhKL9dX7Bm
	9bgodgg2wHjr+/eu4tkLq8YcidTMUUui6dPsGPf26H4ycRRXRRWDCYS6PphDcvRZzG8tLjPRUgY
	w/pQ==
X-Gm-Gg: AR+sD12nmnp3mufbFpe/8I4d78XN+W16wp5ZuBHbzy7XjMTJynL3WP4RQD/osceVcdj
	otOfCCm2YxlDr1SazaQrA2LyiFpBVIfpTijW/xj4MhE/inL/lI+3BWCoi6rhvZIVUOWp/rO+Mrl
	UjA144l12l0jaPjh50S6Btlulm7qtwjHz1tO+t2zuRTV78qQJHIcZf4B3BYFBE8e8obplw0SovM
	kSBrYmPFBq3ceqCB+q0E3+10eZngPwNxbOBIyJTIPP+f6a59aTEVNfHQDZet26lQpmAHR1xjX9T
	6R3p9qJw+WIVrKENAe/gxC5hJvqAaoLaMMFDnNNT4Y3cUjmoq9aW8j86njXDOfEsWZosICoPB2l
	zhYD/A5Nf/lCF9Eh7ZPdhrQ7iY2IVu2pmhteyobwrgWVnVZ/nsGukP6JsCSuJ2uGhMC1J3v+sMf
	xsOQSv6obPIYtUWQ==
X-Received: by 2002:a05:622a:4c0f:b0:51b:feb2:3827 with SMTP id d75a77b69052e-52b42618677mr6293181cf.32.1785421198928;
        Thu, 30 Jul 2026 07:19:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0f:b0:51b:feb2:3827 with SMTP id d75a77b69052e-52b42618677mr6292761cf.32.1785421198521;
        Thu, 30 Jul 2026 07:19:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6ac5ed84sm3374311fa.25.2026.07.30.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:19:57 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:19:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Algea Cao <algea.cao@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>,
        Phong LE <ple@baylibre.com>, kernel@collabora.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v9 02/61] drm/display: hdmi: Rename
 drmm_connector_hdmi_init() to *_ini2()
Message-ID: <e4miagjzyvyxxbhbznze3ht4vvnqx5whe24dl3w5sdgasafdmw@gblajrkqr3mc>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-2-4fb12ea22ac9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-2-4fb12ea22ac9@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX3tQBhR9fENfh
 yUT3Tb32eMQWqI3hLYhaidGbN+mdFcar+wqfudUZ9vnll914SteaM/qdklOrZ594KYmAgz6DOE8
 1bMCvR1vbHRyNNQsCyN/GC5q1O5GSVI=
X-Proofpoint-ORIG-GUID: cPOb1QEtF1BeJu_oWlexW6XIto-6H747
X-Proofpoint-GUID: cPOb1QEtF1BeJu_oWlexW6XIto-6H747
X-Authority-Analysis: v=2.4 cv=QNpYgALL c=1 sm=1 tr=0 ts=6a6b5d90 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=uf52Jz-x5RUOtouhqywA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX6RCR42X5yeyw
 pTm2ZKU1Y1iAT/1+tmChjuZBuxkrlaQEr/vP9Sk115Mvjg23+pSNCfxfKR74Ac+pwtItVM5f9Kh
 V6jgXcYWznZcIwO1zDal8cKfztKh5HmZXxAo3A1b98jvrTm1SZKX2fd6OOBdziwuyeW9gNZhgOf
 pUtogkTeVR6pDNr8Vk7UBXrS3wDkxsEjC/jc1LQvLVDhBM1XjcE/3AtNeoN0HLvOjmuEV50Pb9J
 ismOZV94qiJB1CoFi+5dk6QZeXUEU6i2znciAHx8GQOFYenLewz692KQJpL7YkUdrF1B5A8EQMP
 ItJNHXGnCncHhT1rW2eqpze85g0AL1QVsVOV2XU0f/wXSPl+jk2faryRCAdmlGaV8I1tFJ+umhp
 yVrOzBqjxIVu1h6vePJEQ3RXGduvRzv6ormvyli0YnIxVKPjTiu6/MSrvzPIR+G77zWRr6x3IMO
 zeQD1boIkbzolE4nqBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_072000_848362_C138A799 
X-CRM114-Status: GOOD (  20.22  )
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

On Thu, Jul 23, 2026 at 04:34:51AM +0300, Cristian Ciocaltea wrote:
> In preparation for changing the signature of drmm_connector_hdmi_init(),
> i.e. dropping the vendor, product, supported_formats and max_bpc
> arguments, which are being moved into struct drm_connector_hdmi_funcs,
> temporarily rename the helper to drmm_connector_hdmi_ini2().
> 
> This lets the new signature be introduced under the original name while
> callers are converted incrementally.  The final patch removes *_ini2()
> once no callers remain.
> 
> This is a mechanical, same-length rename performed with sed:
> 
>   $ git grep -l 'drmm_connector_hdmi_init' -- '*.[ch]' \
>     | xargs sed -i 's/drmm_connector_hdmi_init/drmm_connector_hdmi_ini2/g'
> 
> The transitional name matches the original's length so continuation-line
> arguments stay aligned to the opening parenthesis, keeping the diff to
> the identifier itself and avoiding re-alignment churn here and in the
> later conversions.
> 
> No functional change intended.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  2 +-
>  drivers/gpu/drm/drm_connector.c                    |  6 ++--
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
>  drivers/gpu/drm/tests/drm_connector_test.c         | 42 +++++++++++-----------
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
>  include/drm/drm_connector.h                        |  2 +-
>  7 files changed, 29 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

