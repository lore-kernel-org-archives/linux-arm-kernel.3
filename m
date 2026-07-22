Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B2C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vleywJjGQkVO0x510PGIAoh5WqM/nmE+oyHx2voXORI=; b=noBrrcmVaYPPAF4CA1tgEfL/Ir
	FSLzaH65T2smqcqF4b2nnELOYoixh2FEiQTKJlr63O3bN3udgHgXdZp8mZF45mlyWrj+RueN5eB0p
	BeatxDBxMfCUMOPAyKaa+R6WvkePdq94iBrDzjbPhSKYZdbmeAG0c1zkDPX8ly2+5AznCVEojMscp
	xSqSjx6ECH53KXrna093PP8p8RrzCOVgN4+RNZtyoRKbWAezqIzAgYQvexWlzWoh9I/FuY+KU5LAu
	n4UH6gsu1gjqZokwNIvH5i/6lSbzZ+2RsysWCJA1tvPEvxNyKRbPV9wIh139grDB0u4J2inKJCpSq
	QdITi6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRgt-0000000B96Z-3gJV;
	Wed, 22 Jul 2026 07:48:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRgq-0000000B95z-45CW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:48:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gCX3473627
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vleywJjGQkVO0x510PGIAoh5
	WqM/nmE+oyHx2voXORI=; b=kyiAT1D8s6vwKDeBtT+U+vIjL16dCKJ1WUr8HNGy
	S13OLvv/kphwJgtrfaBooHWRW67+M13EudLaKKn1yKG25JTPjBmI3U9u6OSARjcp
	Knt5FuBXlkKa4M+1RLrS8KsnrCYtfwjaAjgQ9cS3RFl27Nwiz9z6gpVhrPF5fTTx
	wW8SNi47Ojw2Dv+Zi1q5ehlUCOW5uldWy4smVL/AHxOuOxbEgh30aJuRJU+OwUB6
	BJmEaaJYvTyhbSdo40mMsT/8s8OilhJlRWamSKnZqWxwH6BkoAQc/XBkqAySx3s6
	3dDm532rp59N6bcvVnuUDQ0P1Q8TNxh4WaULc3V1p5QBAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftx5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:48:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so26836521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784706507; x=1785311307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vleywJjGQkVO0x510PGIAoh5WqM/nmE+oyHx2voXORI=;
        b=eetUTK3O3Oebu8xt5ez0VdO0S5C6QkXEvG3wT0zcvDOEOoaYXmHhYwxWAjbzdTTKE+
         pnHpjeRrkrwsj4O5wFQsFCWL6dit/cM4swaqfRjjjnHiFMY3x+o/DGBcJUzqMDCn5Nmo
         JM22Kxnsr+TfEhXWi2BFVp8I2FpcQz4N6i4ZTx4D2rQkQA+pDSmt/IIQYLjjuMhEe2Q/
         jWSFuRkmB0ziq3UgVD45xyeMQ1vfYKsLbpd1lQnh4szgkNf7OvpEGfyXJCTSnqDfSmKt
         LZafIRtFHxiCMwJ055MaJ4TXeXRSGTYNRSkXJdpW8h21OZZyRhUw5NaA+4Ik8yTBp7eO
         r4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706507; x=1785311307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vleywJjGQkVO0x510PGIAoh5WqM/nmE+oyHx2voXORI=;
        b=cZe8QkCnW33+mYRpIdpfaiJQO8ORQXGCfAEF2Urv9PTc4EcSzuJMYzCdgJMWWhYyxQ
         fEJOAKZOiCEHFzViq+3XtYdfo47t/+mRfUI2PK3Fo0BtrVfRoRGT2S7JZtnsFMX068RD
         DOh1IybsQkWnRK+rG7Wt4F7JyCx/BR2Zj0etguZiWEZYcRwBj+nlFcACh3fDMsORn+1m
         KML6Kw6LU/LVhDqZcAQcdBCeExgqZfSyKUgKLeN3mNf1QXWcOYgzWsqjwc76LSjUL/XW
         5Pkmi7IW6K3ea8jf3ZBYnTcXR9gGxmf6o0t6KkyOQ42CRRZIooVzV7tCmzz97th76nKv
         7CRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPtnduW9Tf7p6eYPhX8hs9nhMRKEfnSOWVUot03JqfYft5xKSkk0LL5OlEAkDU9SyjwdxAA+OcxCmQUP0yEZ1v@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6/m9ipX/Y9BljryTz5DiIKhavzlb5y/lY6FuIOQs1nQeigR7K
	dZwtHXl8eb8UNse/noidkTPDFg8PU3ZcznnLH/hz1DEozyv4A98xQjv+JBOhgoyxtWYGccqhXCG
	b4+qRW2zsp61SV1yp8AIybBgHLeZ5Bq1VeK274gTbiNA1E4J1hMDP9Wf5k/Ljlcy3a366NMKNsz
	mM5A==
X-Gm-Gg: AR+sD10RLJCjblPrjzZAEZGEF+tMhqEK71Iym18QdnLNH6GTFcWlRyPJFSRqV22Ui+f
	WTLVDW0uqZEy0twxVYdwdWRNKz5UupVzwlp3233NRbcWL06/9Uhr2FBkA8WY3kq9AB3adCrjjsy
	qPZ5TajNL0fFo11biMPl72R/+FA9ki/zWWtKOgBMpAEJgjPf3AUB/KYraoJVxI9OzaGNfh1vPsy
	BCj7cnr+V5eI36CajywvySa6wW10ceG8fGc62TvtUI+A3mmZ4VLnBQSjkN7ZZF9jpFPFift6R2K
	7J/42co5XpgEVSkPV0WZe7Dy6HP8KY/AtbcAsJAqYuPa1xpgCMohWTopC3CiJqvDnKebya1C8Jo
	ezj7b3rgl1JonH+ve6F96U/8+ycSWDU2WomgvWCc+aiC22DL668m6l//C0nmlBXXs5gArDuvTki
	T11jGu5VdxmjympA==
X-Received: by 2002:a05:622a:2309:b0:517:580c:bcd3 with SMTP id d75a77b69052e-5213c5f3e3cmr196654321cf.19.1784706506892;
        Wed, 22 Jul 2026 00:48:26 -0700 (PDT)
X-Received: by 2002:a05:622a:2309:b0:517:580c:bcd3 with SMTP id d75a77b69052e-5213c5f3e3cmr196653991cf.19.1784706506484;
        Wed, 22 Jul 2026 00:48:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6886b50sm3142311fa.6.2026.07.22.00.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:48:25 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:48:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Daniel Stone <daniel@fooishbar.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 4/5] drm/debugfs: Move HDMI debugfs registration to
 state helper
Message-ID: <6mdvpbcozxkm6m4psgz63lja4i5l2cgz6six3aas4rurgiqh2v@r247m6paaaiq>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
 <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
X-Proofpoint-GUID: ieOMuTlNYWK5g1kHWYPPTRoWSdGjPov7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MSBTYWx0ZWRfX9PQnbAwdCoRu
 /y8DCVM6akgJAOE/wGumvjwGj1KSWVdWAZgn1v6ibQH43jv5+ud3kpEomdhAkl+US5TVfcxkaTR
 O/+iYDNXaJdlrTE4wRdawM3Myji8AaAuKuQ9nf6IYrWyTL4dYV9esTFHCahsAS8Rwi1wta9skgd
 Yv6uBPHv7W7qxlkTUeWNjFW7WNNdd0yB5WWmNgStbKpwhmnoypzUoGPtGQs3FzLmLd9TUDjt6+z
 42jMWXqwqnJ/bYniDdHHz+ifCEsJL/b3vX2x6bqz6QHJPKyijvI63qmlZReqc9aXXbO00FMHSEC
 HrjgcMjNeLTBbprz7OmwDcdIlTMsArUcv+mvp4tRcGUOflhPiGntOv3qHgeXhJSQ3zIuHAiRQR/
 PDsfJ3Kyiu8DkqAmCb7w/OLOB2VIp181jfvt80BGNwJ/s4ANYeFlmAnZze42BytOgD0s2MQjiQq
 9LiOB0WQ8F1r/UT7wgQ==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a6075cc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VQDRRO-cRQiftV9tIq4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: ieOMuTlNYWK5g1kHWYPPTRoWSdGjPov7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MSBTYWx0ZWRfXwqeX65625rWS
 EuxYEp5n6RjyPvuV43etZcUz2z+TrHAIqNWYqA9MSFthK1OaFWZtlS2KbFDlOKWHSrZXZuE9HMB
 T9vcIor76nUUmZvZXvcmEC6TkRWdo9E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004829_045736_E099E410 
X-CRM114-Status: GOOD (  17.78  )
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

On Tue, Jul 21, 2026 at 10:59:00AM +0200, Nicolas Frattaroli wrote:
> The HDMI debugfs files are only useful for connectors that already make
> use of the HDMI state helpers. In addition, relying on HDMI-specific
> functions in drm_debugfs.c can lead to circular linking problems later
> down the line.
> 
> Move hdmi_debugfs_add() and friends to a new helper in
> drm_hdmi_state_helper.c, and make all current users (vc4, sun4i, bridge)
> either use it as a debugfs_init func, or call it directly in its
> debugfs_init func.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c  |   3 +
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 154 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_debugfs.c                   | 157 ------------------------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          |   1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c                  |   1 +
>  include/drm/display/drm_hdmi_state_helper.h     |   3 +
>  6 files changed, 162 insertions(+), 157 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

