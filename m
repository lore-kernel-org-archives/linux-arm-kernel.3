Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B607F531C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thMSOyRCtxX4mnV8s8UastfNC+eBisw9LHuDPQy4Nyc=; b=tBUMZtBmRYa9s52n6L3HVNNaiV
	EMqOLFXeNGWio5b3N+d6bNUVW33ab4+ofXFhq0v7vy15EpccUZsHeGuBG9Oti/FhSnr7e2lwt8B1y
	oMNddH2wnaMgQ+Oba+SlnzV1JRpJmL9zuC5DJZgkCKt8HYb6VxmuX5fseBsuS/4RbHGlg0MouYp9v
	hrAGpiWPyCyb3lpsr0d404U5xsYacUx9Vl1WAnGSai2bzqqEt1sPscLe4xGe+GkVv9YveH+xzNJhz
	ZWjNQVGSvb84j4DkDvnm2wsSOLjydPHPHrfuVh4kXRvkNFgX5nSyOfuiGfHGaBnGtXKFBDehGYMZt
	KVOrJvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLkS-0000000GAds-1e2g;
	Mon, 13 Apr 2026 18:11:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLkP-0000000GAdW-3jnE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:10:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DF5Jop3750379
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=thMSOyRCtxX4mnV8s8UastfN
	C+eBisw9LHuDPQy4Nyc=; b=Nxr7YDE+Ulwbsxs0uQJ+5XFCFHQ3rs6D447Ui0he
	QKbSdxMt2HbxlqcqFyVNXKv1cdRJlXe5AjvPaa3qvzOBv3Wyyz5eXJaZFfPxKhIo
	XTOdfMeDJploU2cL4J8PvpeUbbTzPpJKx9XQu2igu5lSzFPLjR9m4Gay+zyDts6g
	th1flOoNgEstnMsA9vem9nKRS36CbA85DsT6PE6JkFkzaqxewn/zKahWRwkdcgtu
	5Kx/4cOfY+LMvgE2CgE1LhX8YoOJ+lzwYkqZaHLefpYEkyGjWEnfHx+cXJ3QpFB6
	ulBzEUNTB2oRatIaHovicUc4itXNbR9YRqMkh6FAinqO1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh2tu8nf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:10:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so104755431cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103856; x=1776708656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thMSOyRCtxX4mnV8s8UastfNC+eBisw9LHuDPQy4Nyc=;
        b=L11emDLzMjZNaFooqImCXoHaBDBFSFyr0awpp/eZS+iCZ5k+E0MXj1BhNdPHdS2cTm
         qpJOInUa696FUYdOsu52YN6kY1ON2/2Yn3kE0yoKFLL0EkdlRKPxWd04xCcdJKHa2w9W
         lUzjcdPaj8gQ8krDXWPebukDe4mhlYDPLlUqya/OWt2YdPN2CXRAAEbHCu5tTMq6WhxX
         Yq6cIgJH1HW4IVY8LIzvsA38btasXcgJwBugp2xadX5veuV/xNqbX85ktt+BEO1+AvsV
         2J4CuFXt1N4YRLd34uW2yHKAh0hiPEmgrvm5408oAtUTzbhPga2fNwGMPbWFmlpxszg0
         yCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103856; x=1776708656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thMSOyRCtxX4mnV8s8UastfNC+eBisw9LHuDPQy4Nyc=;
        b=lq3ynQEJLPHtk8Msv+bSkYBPh4W/2oC9YPBgL3gXH9o+kOEnQK1C1uT80Ahy8W/V2y
         CKrIKmICPaXv4LNwa2FpbpzgDYMD63Sw9xoRIPpCLw8DBVejgYaqAgeWKCy0lkXgIrls
         lDfViuRkcQHY9hdoNluFHlixMpv2ch5r1bGs9CZdN7tQb+kquvha24mJdanFGkEQA90u
         4WXn749XvPdLhAlmVzvo0jvUJecXp2rTsp/0fH8bmREKiHh+xd9O6Az8gaTjiB72f9dv
         sf7go/y+aFP/snCtGLQIontFT4iJ9trMcyougwa/pVc55Ji9LKgBbPNa37v7oZw8mMhG
         Rg1g==
X-Forwarded-Encrypted: i=1; AFNElJ8D23xjMxzYeA/paFlQvK7Akzx/g4cbLnht8aJKIlcD+rVFr6TIU2bgTEOc+2WChChp7TpKCwSt+CX2ASnNh8Vv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/QB5U4d0v3zlaJdYJ0KlaJXYnO4zmkB0rF/IJYudgqdvC2Fp
	QKXGgJOZVXgZKnIqpRqi3BwzJXIu4IHDhjWDeNK/JqjNaKyhtZdtCW9efI77o3Qo/6EcFWp8LaB
	RJOcgZRcJKc/+vN7k8iWolPYo+cugADbtWr23M0kVqyRIY8gwtDpEmYqpXD8hdKzqEIkTofL0xJ
	0SwQ==
X-Gm-Gg: AeBDietVHFyU++260oO7qLcFNlvPjwtawEHrxCvqqP6EW+sNnCl+pNeIHwEKqbMLw/h
	eNyxSvkg/SyAKqR5HfwP+hbcQ8N3ZwshfPtBcbh//A1ts1xMeOQfGsRnJaCMp3Xl9+1HXXu6nBX
	QKVVL2SNltiOIYBuZxh0CL3TY1jpq2tOjlEW4LH0xWCA6pzHbvOmzcdm7HBO2p9L/ShsnX4yweT
	TXU5baAGaezN2z0YvXSB5K21PUOOJWx6Kli0do/ZwMHFodUkThN7uvFEJJ9tdzwTx7C66D+eWKa
	f1+KAZbqMQCqv4q8AjMBkcEIgrblh/tL5AE4lXWhrub/R+zdx6uFvAIJ5im2XTlgW0KgdtPL8Jq
	+73s6KV7Ke/FKWfpxT+/0X8YSxjpyyEF2xCkWmrCzETKvjimRNCu1BZ6epKD51q+d/pH3mX9+dy
	vS4OJXkjzK+Sia756zOf9gO4wRSUP5f/jS/551ZEFVNlnLRw==
X-Received: by 2002:a05:622a:1f8f:b0:50d:736a:624a with SMTP id d75a77b69052e-50dd5b95bafmr242460491cf.1.1776103855758;
        Mon, 13 Apr 2026 11:10:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50d:736a:624a with SMTP id d75a77b69052e-50dd5b95bafmr242459651cf.1.1776103855207;
        Mon, 13 Apr 2026 11:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee12fesm2704689e87.40.2026.04.13.11.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:10:54 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:10:52 +0300
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
Message-ID: <kie3dnybc3ycjcotnlxdanffv3hr6emaafy3xuhc3x7wsi5s5q@dqvqkm5fidof>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-2-acd01cd79a1f@bootlin.com>
 <t45cmunr6lhxrvqgwa2mrh765zmjjderfpd32islrbg7jey4fq@d5635guivyla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t45cmunr6lhxrvqgwa2mrh765zmjjderfpd32islrbg7jey4fq@d5635guivyla>
X-Proofpoint-ORIG-GUID: 2kJORIpabPum5HNVN9IIOvpNmCrH-zXA
X-Proofpoint-GUID: 2kJORIpabPum5HNVN9IIOvpNmCrH-zXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3OSBTYWx0ZWRfX3DxkfBF+cv6B
 t5nEdsPc3EcMCQA94pzKf6b+Cx/4WPLmc5XIKCUMU0LvLwtryrcCi5fzNXuYXKu1taRg4GhrJxK
 O7ARgNSJ9fdSyu4AgPEf+vKFn3VHgY+tdJ4PnPdvxrsEQfwrbgiqHTLpLA5OfxUn1H/pkyBlWh0
 QQqAgAPGMksmAKLowBwBKZTmIGJ0IZkz6ICppOPgiiWLKswStoFy8lk1oJgJqyCwOBf/zdeAO4Z
 n+mEGW9CUAWwff5d3NsFEYWBkRBQFZqHUB78Fy4dVZCAABPlZzJVtliM9BoVq6BuROYVMJIz/M+
 PQ1cNXCoOJlJYy5rwDX2f6R5vWuFJBR2ANI5PpWRKkyotdI4rp7uRkYj8rcigQ4C2B4ELJhA95M
 C8LAm+ok6t+r1Oe8iOc47IvTnEw+APX4ZGzT1L+Fh0GQYLa6xaMjVoljOO8KWKSxJ99t0Ycgwhj
 K0D5sfRSnu8ssDGUgkg==
X-Authority-Analysis: v=2.4 cv=RJ+D2Yi+ c=1 sm=1 tr=0 ts=69dd31b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Z46hioPf_zsqFS52ZJEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111058_052984_5B9F0A7A 
X-CRM114-Status: GOOD (  22.87  )
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

On Mon, Apr 13, 2026 at 08:57:42PM +0300, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 03:58:34PM +0200, Luca Ceresoli wrote:
> > This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> > @panel parameter, thus using a reduced feature set of that function.
> > Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> > 
> > Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> > returned bridge, ensure it is put on removal.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> How common is the probe / remove path? Would it make sense to have a
> devm_ version of the function?

And probably the best way would be to change the driver to allocate the
bridge early and follow the rest of the bridge drivers. I will check it
out and possibly send a patch.


-- 
With best wishes
Dmitry

