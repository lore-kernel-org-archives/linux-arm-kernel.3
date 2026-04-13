Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C674FF34C79
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PF56oFFcY8rN+D6lGHMuLLpmLnPKi9sPdMQpQo/0PDo=; b=ehfSf6rVtuGhtUJbwxhQv1U1LA
	Qbp/eIweOVAp0sXbLaOKkm4kjeUNzoPLHzZaaD/E8QhG+ZziKsXL2apuuiKj3mKlT0DUomZQrYDG4
	S/+SCu+y4/1P6UUzDfxXDpsou47XOjmnGLaWD4rpATJ/84o9+hi0bmAqyMtP7gbaIN4Jo8j57Ceur
	bj1YxeBWiznPu9igCH/Zqdpnov1SqaIp2cUbNQ6hH4BrFSsZDFjiEuFzFfLJqhK14KsKy2QEZSVl9
	iVnXMwG7raPQfBrv3ayIYkWQMuuPdNPIIKLzq53IJk/oKeMwkhZhiUEFSAZqp7bZJMkvYzvO4dOIZ
	TOwQnhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLXl-0000000G9oc-27yU;
	Mon, 13 Apr 2026 17:57:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLXi-0000000G9nn-49c2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:57:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEJNsn3539422
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 17:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PF56oFFcY8rN+D6lGHMuLLpm
	LnPKi9sPdMQpQo/0PDo=; b=AYJ29elX0COrAWmTaSA254ZqAugCQ02TUvSX6j9e
	ssKVfQ/ZKRvjBAzIJDC5cWaKwIS9ppem1QmqpoEWaItL/4uVXHDn0waVbxJ7c0y7
	1mw3q0Qp4peLxQWVyALDwhLVQLnnRa/4c8YDBGNfdqpXTcf+STwKNlk5QcgM/CRN
	sNkUUe6MJNAiPTMDR4sSE68TT9lwq61YWWBjXyh4EXe0Qjxe8GeI4FE1JgQw5Uas
	Q0M7K3L9uEv+fUxXLek9I3wgvCOHXzjihMU+jwCTjVYPhHMrbjx6Jsd5pwWColgm
	4pgTSV/WiA0hKsWpvaRNzpmDJn9lwIbUE+zMOb6PP2mQZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh258rrw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 17:57:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so55038901cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103068; x=1776707868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PF56oFFcY8rN+D6lGHMuLLpmLnPKi9sPdMQpQo/0PDo=;
        b=NlpafKufRWMC1y0iMPIMsrtjC3Q6+zMhXCyPnq0E116Qmi9BaKmxrGeaPuRHuIjL0G
         Nu7QNDGfvjA2Zc5xKM9gz9WMNNoCgGgtUIf0CgmYsPwNVLLEUegiyNRG5ld8hXkZc09B
         ICkhlgKsE3CNboZkawaeks4FHI3FTSoEwNOg627mcQHgk60pRTdDbvXMHOUXvTw3TRy/
         8CWWQO5mI5xwVA10Cb7xdOxM5Uo/WWolQu9HJFGmEqE53RmHYmxoH0ZLSe+o0iTU67Vg
         AraDXO1YlWKTjDnvwwzr6ddy+pEW7ONkmbTbY/geFSAbX4LwYhj0KdOFIXAwEXq0qjma
         F8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103068; x=1776707868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF56oFFcY8rN+D6lGHMuLLpmLnPKi9sPdMQpQo/0PDo=;
        b=lvuCrE56gtgSGTZqoXHx2yAaH6QYgnGe6ky47qQS8E43p50GjoT2Q1G5C4vUZKGJaZ
         hrP7LYtgXXD7GKonVAdzW+B5dNHUzB0e2e0UzxPM1OBYzei5cECTkM3DRbmPibGWSL0j
         GYj9CkENQkd2jVTn7rHPrx58TcrLG/E05+8GCbc02EgtYZuJKG5syZ9BgcwXdkp5RoSi
         fPsbM/gt1Ro61DI+/VSINX6jaZdQJvu3Pi3Y4qzjBYUNxFWqzX3uP2a8CsVSGD7uBG57
         yUXMpdSS/KzZk+6WFHCGgDbVXbN2zN3QEwsFjxizj5dgxEYVEgbGxXd52hVTs8FfGTMr
         33sQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jEzjqXLKSQ+A7faq6OdV4sv3OqXLpLZr7EWD0uc9ygJrFOi+GGNVlFnunpU9RpVsi/hKFPopVelOIaQLmcXIg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4K43T26Z+Sb/blEahrQa3qMYR8Ha2//KY23kaS94Dj6e6nz7y
	wCSip2HW1t4Mwq9jaqV2u5AMt3zWcbGIU4XDGM222YFiIZB5XGaTcT4AsPbhK5j1ihGkxC+cUz8
	ZGbMa5RSDInraTn01yS3Rm/Hf8IyMgE4t1CWpV7pgMoc43NzAz2Nt3QQvEq+ehuxTIraUN4lG6k
	mEwg==
X-Gm-Gg: AeBDieu1+XNjbWGyGUkZvSB1A7jrJbsS0bK8hs8hCpnNMuzdajlsEbjLoe1s6ho2940
	oa8LIo3A5+SEkj5beljqRcYNek0jOU/L0I2sa1GAKiXLdS0VbuLEHiv67vbD6oZKhUlQ2ROhmpK
	zd6GiG4Rwqnv4bB1ThhUe2q298nTxyXfuJesWk2YBf3WL5EH0d/cBbKPOu17f4PvgLd90/3jH4R
	ohy9XlJcRX9LrKB4aNK33lIVAJbMZo3HbzqKEJAMP5VrNIFq2Zwiecv7UnoRiyPKVwpmDsTgT7k
	oX7Y7iuMbG5eoM4KXCV1LWOPLunsd3/px0fI9+3fF2MI4NcHemXYvaBlyyrqkPExkORgD3/Qm0W
	BjIznpM2b+RC7IXClVdygrmWhsj3gIexkUEUWownCcxpB+C4uIzzEy5klsTL4DoOoMorTa6Pgmf
	KgKXrx5wlC1+YcdpyOIMbRsiklna4xm2JVJYZSRlonWsmuZA==
X-Received: by 2002:a05:622a:a40c:b0:50d:6b77:4c06 with SMTP id d75a77b69052e-50dd5baafadmr176516671cf.29.1776103068190;
        Mon, 13 Apr 2026 10:57:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a40c:b0:50d:6b77:4c06 with SMTP id d75a77b69052e-50dd5baafadmr176516371cf.29.1776103067734;
        Mon, 13 Apr 2026 10:57:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e8cd635e3sm221471fa.8.2026.04.13.10.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:57:45 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:57:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <t45cmunr6lhxrvqgwa2mrh765zmjjderfpd32islrbg7jey4fq@d5635guivyla>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-2-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-2-acd01cd79a1f@bootlin.com>
X-Proofpoint-GUID: QMSNPiHZ0HYUjUynhkM3B7ZYJGPWpnnl
X-Authority-Analysis: v=2.4 cv=Vo4Txe2n c=1 sm=1 tr=0 ts=69dd2e9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hXVsb92WUBna0ZnZifYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: QMSNPiHZ0HYUjUynhkM3B7ZYJGPWpnnl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NiBTYWx0ZWRfXzA9UghzhCY6d
 LynYAcqr4ORmPyFNWWuUpRT19Rq6xeOsCujIFHwOQWxcBeKoG20J72hect0nij59XbnXoWhL0fc
 HsldmKndyRywIEsDVSILZVh+9nuPmXISVj6j4KUQNbKPgyR0vJsobIs7C/nqrQMUE/4ximBn8F8
 cW/N8cmyGlXH7eA2e7ABeNd/TTwbc6OA96p8eagQlsBn9dX79aE+3CZCkNS61Q3wS4owqEVEQBP
 XxT17sPmA9qUPNPL/Ske/zvIdcFo0R8XjA2/QFbx+EbB6kxVVqnX0Ub7Z2JMZxm5r+W0hQ6vV1T
 /TT88avPR5jJoCdBRSHrGg/21CEuKXZDIuYMSHE99qkZYTzhtbCq3IdTV6cdmu5ACXkvIfO3Goe
 Bf2VQgTdEqFEAwFVQpt+u5fl80RYNn5LliSaMrCk1LXSzNPXAmhYILZJAENnvkjVGn9YxPQu48i
 bjnGgTUetHXKCBsKEMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_105751_141204_7E226B74 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Apr 13, 2026 at 03:58:34PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

How common is the probe / remove path? Would it make sense to have a
devm_ version of the function?


-- 
With best wishes
Dmitry

