Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AE5FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuIbxZ4UGkr2MNHoHHNNbGJqU9tVlBHwrX/08rcaVp8=; b=MaJs7gww3gyVz+dbG+Hy2BKYuI
	hHYpnrlc49qHdNplzLjLqSt/MjCuEY5bEhFLdJY5JPWrtYqaAHp9gY88hKBvviKdOJC6qurkDraqd
	gtJlp8EO6m87oy9oFfvAlIyMTZJf9H/9Yzi2vfGeG2Ez1o72x1xaxpudqTcy1MJP1OQKuuEFGNL1k
	ITWdJvYRgBsaV24l/zV4j7ZbDKQSnyO29TENGsmYE2pfNU+G9I/3dVX5+NaRPPig4/UtK2Zup/CNV
	oA0mRD0Jxd1Ww4azrjeBBcVQJMD8LWEmFqK5S4FwqbuXWOuBoUfr2GlOaEKtJjKBscZYswU7kEKuj
	248kCMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGamQ-0000000EN0s-39Rv;
	Sat, 25 Apr 2026 11:02:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGamO-0000000EN04-1ucN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 11:02:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3L8bn944555
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LuIbxZ4UGkr2MNHoHHNNbGJq
	U9tVlBHwrX/08rcaVp8=; b=HQaWP/zUUv16lKqJeof414zvjCEHqwtLTwHORYrc
	uuNXKoXfW5xGdbfm7Ul2EKQS01bgJCvGTn7tFrXPUj4NBCTi90rDrtl3v8QyNe50
	DtQQN7s1AB4G21yOz+YImxfApS9x3qvQrARYn096MMbdRHlaPG/xoinPcHGIKf1E
	tmgDhWBQPAxLVP1SypmeoVoGibGc1VCqey3Loy4wTxCvMMvPDs/U99gKAHIOz7Gr
	nZCj7rWqTMAhcuLCqlUsZzsm3E9TEDKRIyEkHrEZ51znwV/lYgZDnpM02rejVviM
	8MXPjmeovoPfg7Q6u7PSJEljEZglSRT34jMwkCOUNjnZEA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr0s06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:02:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9539bc7e2d0so13276657241.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777114949; x=1777719749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LuIbxZ4UGkr2MNHoHHNNbGJqU9tVlBHwrX/08rcaVp8=;
        b=NV8h53JCG2AiYQEd6lNe+UiwAPkj9tAQ46m9qnz/+JBnFhweME+brvrhKTzYG9ZGIi
         g5DgttHkX9tHyu3YmD0SasN7T74GxjFlL+uD3BUV/RIvBEqYBlOVaqmq55oAWn0nJ8V9
         Cdbc4r/dVRU0ltCkplHJJTOH2EY1522QvqBL46a10D5JGIUBbWqrGsLm2xcSwgwgYZzf
         oIYROAtDP03I0to0NiHmr6GQcl9SkupiJWttXj8GEBHhFsIBPxdhq08/xbBJb8UhjWgN
         Ednj9jQSlbb+ViWCvTRi6/ahCU+eAVNqttgA1yl98MmJQEhL9Y3ldgQ2vfFF9ZgCN75V
         WKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114949; x=1777719749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuIbxZ4UGkr2MNHoHHNNbGJqU9tVlBHwrX/08rcaVp8=;
        b=KuQOwMe2EyGrBgy2TVlnbNtlIYfCNiGrfWO5sAJPUqRrfPeZ6CMKg8FO5Bq9RABEPa
         CU1MMuBCcTEas2kjUcI4NVkErmc5XaBKRXPjsuVc0PsJTf2AgfFPkH5FtoHflBZlK2sk
         QT/YP8x+13HhBtwBoSzyf7Ty6e4d/qyafvPh8JItO1+wcqWurqbGzO9dBE16ufj+jrQ/
         us0bFC+y2jxEyogsSiK5KYCBRRhbItsc/+bb96xsSF179riwEfKb4c0T2fNGlJrGQUnZ
         fso++FiMaMOaSnrQzV1S0UniEm0Fz3DJ2NKov3YRjEXa/DT3UKqotJKQT4bIPTDADLVe
         IH8Q==
X-Forwarded-Encrypted: i=1; AFNElJ91hCeAQB/J/WLn8quqczcqrhbZNpdX5RiauvVtlPy6UJgFD38y0IwsF7PK3mi9BOnlRK8E/qKCY4kT5T9isI0s@lists.infradead.org
X-Gm-Message-State: AOJu0YzUPMdVTO4yuGpED7T51T/rffsHJFkxU98IuDscg0+cmFG3/Nml
	RBJ1DgunE1xQnkGt7L2c3CIfgKA9kBTMuJJphojnrbQtLCnvb6rZT/44WRNYw/jY0XaS8HWsDKA
	GX29wsX4ZjJZrlAOmbtqMJZyvWn9LmgnMsdlKLEfyMGmcJFntItvXI7HOgKy7eoZ1J4uJbiy67F
	YQMA==
X-Gm-Gg: AeBDievPeGAlGUrcVM9OCEJJnxk/pKMNucxnovNsVVDm8nWrc0XVnIleLTFnKasDkrB
	iZJweQZvrYgJvbEEHsp9Fc2aFiIX4z0iSUMayHY2oiwwhORPnzps3sf524P+2MvaQOM6RRzQwII
	bM/BlxlRP391oLrXsdo/dCVB4SCZMgwOhcZYLCtuf/Z9do9AA75TiJWT7n5fuROmmB1QWgQWtoY
	1O3d4L+HmmX8DwSI+LXaZKYGi0ds0ScRrun5mVVmgc0sT1C5RwfZQRT1U8CqRWqBaYZrsrUVcWi
	PgkFrlcfnLcpxOUdv//tDIJcA2P7zBQKjCRvmYenx3l1XdJiUJH6CnCig8IfJGtTirfnD/qkmOt
	nb8CXWs4RtXWd3OKnMRtb5ZfubBHcz6D5f9h5S88yCDRY3Q45QdnT9ypO6eXBpI+iVIY5ZUI5rh
	crNBwfTleN92oo4y4Wp7vd4qpPQ0KjYxUoZl8VgRLvKVI5Fg==
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id ada2fe7eead31-616feb7be9cmr12845708137.21.1777114949275;
        Sat, 25 Apr 2026 04:02:29 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id ada2fe7eead31-616feb7be9cmr12845654137.21.1777114948825;
        Sat, 25 Apr 2026 04:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebfd6sm6609501e87.78.2026.04.25.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:02:26 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 05/28] drm/display: bridge_connector: Use HDMI color
 format for HDMI conns
Message-ID: <uwmhvmgnhge2vez5yussn3swgkqb4scfir7ls7iy35v4ewifmp@br3ynryrptzb>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-5-449a419ccbd4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-5-449a419ccbd4@collabora.com>
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ec9f46 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=gN0RDaQLg4mAccs6Ca8A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: YqPzABHJQWinSgMWkmwWwykv3zNOd1c_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMCBTYWx0ZWRfX0P5Y98N5xwxb
 9p1OS+AB3VMaqhGOLG+s/ClK0uttafd5QflALyqO8XPgCKdiHAtsppAikDpVUhoQfMYQQlyfmHZ
 fzzecKDzunIRD1ptgyfcOXh++BJXMgSQeYhtil3U5D4nelDRRphFzrtjtnDYwY7q2A1ODwqYjKG
 BfEXmDjRnNpjaNHFVv5ztrJqYTSkxEVu2kQh4xdI6wCmbTi9bNi/VJQ3RLhifaRE4T9GG5DKt22
 TxPAMH8TUq33eIAA5wRjqrjLAHNvat85pmgLnkGRGIvYGYjX+2AtEDoFV8XHPEz02ensLutm++v
 4U5EU8svj40XGsrlbFfR9sesU6T5E7lN6uwsReHHTKHRt+3Kg1PEPIoCM8QZ926x2PXI8FXmxYm
 mwccC9RAxBngf1IHlCVoAHs8NE9kQJF81Gk6JpW1m6/yIac2r4jHEYwsCrINn99TohW3qvSHY5W
 bIxj02MV/H6CUjKmrrQ==
X-Proofpoint-ORIG-GUID: YqPzABHJQWinSgMWkmwWwykv3zNOd1c_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_040232_604220_3397C71D 
X-CRM114-Status: GOOD (  15.75  )
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

On Thu, Apr 23, 2026 at 09:03:28PM +0200, Nicolas Frattaroli wrote:
> For bridge connectors which contain an HDMI bridge at some stage, the
> HDMI state helpers' format selection logic should be involved.
> 
> Add an implementation for the drm_bridge_funcs color_format function,
> which translates from the HDMI state's output format to a connector
> format for bridge connectors involving an HDMI bridge, but return the
> connector state's color_format member unchanged otherwise.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Thanks! I like how it ended up looking.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

