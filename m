Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBF0C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcjqAeTgLsiht+7guJ7zeeOBF1xXICcGZUBcywGzczU=; b=E41+U86YLVOAl5rP3N6LgnylkV
	gUm55sB5K79zmD+g2ySqiLKUd0jwXYdsPz9G4nAudfrQUKAaJmO1GjoXT0rqksAFRS1XXt0iMc+MY
	7u3EZ5Av+1TryVm9xBcRsyxETTJWnVoyyYobBipYyPVAX66FIXgGziZ2cnxf9A6pxNoZb/zn6ZE/3
	gJH+h0v7GIP8/ISWt+v4UPFg4jpE2U2retRBWMWO6fqxcpLSdvUMt2ZBY7Csa3pmp9ppk5+jnXDO9
	JCZJbkotikz8jg9jLJzh64ndIDO1WQgGcSNc6oyzmW5vdyHhqThN+UraW3PpjMoSy1CdZ+GIj5wYc
	NyWclvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRX9-0000000B5rK-059S;
	Wed, 22 Jul 2026 07:38:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRX7-0000000B5qN-0k55
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:38:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53g6T3917546
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FcjqAeTgLsiht+7guJ7zeeOB
	F1xXICcGZUBcywGzczU=; b=GuOcay4k3SiU6XYW1TYKYeaOIB1q6iMvGt8XxwgE
	163liQqUGE2TrlEk1nkbZ6ioNv5JA5t3kPcOO9JfUwmLE4sEaLhjj7tVXQjcm7GW
	IJ1ZAcYdoD2IzEIQdjg/5dKsxjrkZpkASJfp511nIVGX/JDPxpn9aQr3sz6iWMuF
	hcqiKhFfWbruZPaVbhWij2HD1vIHZTD1PHgz5pHFzIHlgNztZ9iya0Ty/t1yMAVs
	2iP4Wa5DN67DBVUHMGeMQqL+bFV6A4FIns/X35qe8Mv9ZuQfzpiRFuR3tn4yOkWj
	yfs7oUzk0Ts+ZvG6DVp+bWQVf7Yq4qs9pJCqvxdtWaxu8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aat1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:38:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so144865071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784705903; x=1785310703; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcjqAeTgLsiht+7guJ7zeeOBF1xXICcGZUBcywGzczU=;
        b=H0bmNdhh3gViWZoY48NkRTyDaP8zL3JQGkw5ub1WFl2zUFCOgKk5jyQBLXMSe7F0lh
         bUKcjz/FU+gwj9DgDCIvEIPia65Cx7q56TPbsc4n5g/y00g7Tt4Ps9+7w1HQiVEz1c+g
         s9Ueo5kx+ug+ocvj9bkZuR/Olhca7tbzT6OcSX2i9rF++fh20bJGvHCChU3KSv+C+1fR
         SBgO2fJSosBpl/B3xG/MclgNZMPa2njGAlBXluthgiJH/iL4I/UGUniZbwXXjq+HSDNf
         MKcXpAhy8LcqFYRx9qqjyCR/0zyXbdzd5BQmrRiP+FwAfpsnRZe3YZl+pVClUMLpEQz1
         hl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784705903; x=1785310703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcjqAeTgLsiht+7guJ7zeeOBF1xXICcGZUBcywGzczU=;
        b=p3CNQ3J32+RjHMdIbe3rd3PJqQchJphoF6Tf2RNk5sHuiganmp5qqnpE1PdDYIXVX+
         Br84qK/jhVDVeaEDHOzJF5Z5px9HPjAjCDD/L6RJS+llUTApmPTVnieZGj2Xgu7ltv1g
         PRFIvxQF9gBz6JSDrF0GBf/IRKTMvIvWIFq3gri1+TCBp7jn97i8++wWdpVrSTtQ6EEb
         Tk7fWvWEuJAZO1z3C31zxPNy22HMQDy8yVxo77+JmMmyG5q0WLwjtjl89J3dGGqnRwI+
         7zjZokeUCnVwMfBX8PhHna8u09i0mf69uBfk8B2vRB2MXTnbTBsfl0I6AyDAJ8DODKl4
         aYtA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+GU4RqNhz12qahjWrmyq0HzCtf5atTCPdT3hPH75Z/U25Mspcd6GoLXXQfkr9UB8cAwtD018dwRcUY1bDyPos@lists.infradead.org
X-Gm-Message-State: AOJu0YzdXf96zRJ2NRpFmPN8FC1NGSArKc5Uj3sEjXEdI5o6R4RmDDDM
	wnUy3odTy4P1hU5Y3XbyDecf6gLfnd4bucL3TxKKAQLlCiR6I5tvMBgjAdUonHruDUkvStMhcHE
	PmeVVM0chL3EsHgTrwReuquoZH3jvFrHxYsd2JLZrhfLZRm9/qVXRjJjnpEvAfXEPsrRaQWf+dl
	S+/g==
X-Gm-Gg: AR+sD13DoJQt8nkh9zKJ0KjUlct8nx23tCXGqiEofk8GWyn09MPyTlzj8FJKYwKKBA3
	85Va0OJm/cc6kNW0x+u6Jk/aGBgYpFKIa41Ud3hOiPVLZeNqYhjElIq8K680+vkliD6G7uaHix9
	kY28zcWyzPFUwsyvA5+PN6vBRAQqg29HyzaBVCfmY3lrC4oXjI0CkMF0qvJjAmEYpPGQtXyiLij
	SH5MRXqMTJrAOo95vADSJYo8fBxzUTTo23pPjPazpOQc+9ZIA9gX7VKtvCo6W5o0SmzSNytbf/3
	0XLwU6+zfUExQVYAiCAcwS1RfMaugGPb9VQsnJ+1HBcXn+ZpIGgpwPcSKXvYguTPzFNew1G7lkq
	aYMParxhbtj2iyE+pbU/q8ARZvf5BNcvComHJVZ9ZsWMwk+W9fi7GRIZEZ0xllbwzdPSeH/idYV
	AUGR4Q17xPHB5LPA==
X-Received: by 2002:a05:622a:1b9e:b0:517:7b6c:445b with SMTP id d75a77b69052e-5213c5f1d1emr190722101cf.20.1784705903315;
        Wed, 22 Jul 2026 00:38:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1b9e:b0:517:7b6c:445b with SMTP id d75a77b69052e-5213c5f1d1emr190722051cf.20.1784705902886;
        Wed, 22 Jul 2026 00:38:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e44b97sm324394e87.61.2026.07.22.00.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:38:21 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:38:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 08/30] drm/bridge: Add HDMI 2.0 scrambler bridge
 operation and callbacks
Message-ID: <wvkcamiigekyjdmlsngeccjzkjtfetnmb6aavikvhqk6ave464@5fs2g6uc7axx>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-8-445eb54ee1ed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-8-445eb54ee1ed@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfX0QT4uJjthpyb
 IsTXD4ECsTuIfpOrAcuAsVLjb16wgVmpi+wQtwzsQwuBVMcVeoFYdAzQ/calLzGSacJExk8Oekr
 qbaYjUxldkLtWJlf/soq6zkUixqAJM3jiLdkNA+pYA2Kdj4jxJafOn+HamRSbQojq6ZPZl0uCL5
 jrGXto9Qn3n38h9oYafNWETfBkYnosmW/vhoyyC8Qaik993+FtW7Jb8/OrP09AGg3uudzXs55kh
 g/R7JmWhSl4Qd80acFOV11/Kyz5ktO5yagQ710epJXplrTBZROlHLSAcjNowWBUz6yLl4TTuC9J
 F0q34O+5Lju9aY5LPVzHlci04xgYPoVjF+kBuWO1h/Z6K/8SOb9nE6+j1XZ5ATyf/lOb2pY0UoC
 kyXI5ujN5LRKtBzSgj8qXRT+vah4pXpyE5+xvI8g3GL5eOTASi+wZBykfAxWZupuxNQr42daKsC
 jt+/KGteQpRnTOn8ofg==
X-Proofpoint-GUID: B-Ua0INsWRyA799edOpog9vDpI8RXGDz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfX2ZGcmAkgDC1I
 AkaQ01A3gY//fhHZCYqzZqc9DgtwQ73sQriitJuL2M1cpAEnNZ1l46NSOdYwPQrIzGvDdOlbfw3
 wCj8vF5E1ZjIrUCL5xQxuwUx54lUDbk=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a60736f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=PX8HVTZbq2s29_-t98EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: B-Ua0INsWRyA799edOpog9vDpI8RXGDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003825_349150_4B2EB04F 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue, Jun 02, 2026 at 01:44:08AM +0300, Cristian Ciocaltea wrote:
> Add DRM_BRIDGE_OP_HDMI_SCRAMBLER bridge operation flag and the
> corresponding .hdmi_scrambler_{enable|disable}() bridge funcs callbacks.
> 
> Bridge drivers are expected to set DRM_BRIDGE_OP_HDMI_SCRAMBLER to
> advertise that they implement source-side scrambling control, which the
> bridge connector layer uses to wire up the connector's scrambler
> callbacks.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/drm/drm_bridge.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

