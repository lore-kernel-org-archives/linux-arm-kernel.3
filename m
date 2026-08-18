Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D797C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 02:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98i4v+/vyXWcyWkknO4LIfjzmBEpAN6zh0hmZXHw7mA=; b=QbCopCF6UmD03TOMQVuVWenKu8
	k4iNhTu8hetcBgODRBedak/Zt/2gympYdnxQ5hIbvLZ1dXEE6f4Ef6BghJdSISBcbBmJrPD7qF+xV
	m9IYc7HxgesN20ls7mnxA8lqZNdEYHeDncc6W7XWDXJvs/xq4lzwTFfx2WEZWycpW3UGZ4XGYhVo2
	epjVwpzLH7vu5jDCM12qzUliwis/qkz3TUzmhS+4XtGyp97/M+EWmhQeBPs1yP9+0Q2ZdnoECV0QY
	vvll15p5Kw0r+b/YXsrfww5Pat5MvVhtZW1MyA2qOsneH6A4gFB/uCDnYVGhGlMSGVQUY/FomE8E9
	bunTg0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9VU-000000076Af-1OuA;
	Tue, 18 Aug 2026 02:24:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9VR-0000000769n-2st1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 02:24:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I25Ag53603497
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=98i4v+/vyXWcyWkknO4LIfjz
	mBEpAN6zh0hmZXHw7mA=; b=jFR17imp9arMOTkX5pj7VfXkKzsgtoVFpoHxfGXg
	6CsmJJPqOJU1SLea4VpYH5Z8GrCv3p6yzK0uxeqwPm1WYdkd/LnjRqMl/GtDc3qj
	kaxR7bWFf7zw7EtI8g6SaXII1TbteMshBb1j325Pp6Iaqdvv/PWE6CEJtgDECsD8
	ltDHhp+EQOaH6vDyPuqyNnhA74OsDAFRk0Xh9iIv+PsB1Y4KoJYHd6r8a4Wgp1Yb
	afR2l30njJpQB0SYyodAAR9Ma4QvOtgw9RJTZgRUaMCGi2lRVI3JX9gzbLG6Qa1p
	DCBKyLNFLrru06oW7uLRWR8TBtRUIS/TVD7DiH5m3cMf9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2g1uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:24:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d8243f1bcso5430791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 19:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787019888; x=1787624688; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98i4v+/vyXWcyWkknO4LIfjzmBEpAN6zh0hmZXHw7mA=;
        b=hJPMww9vxIEzqgnEqs5we84BRFounfF5oPveBszbbtuH42IfjyFyHAqutcJVzjKweX
         9pyZqJ93lMQF0X3F5zCAaEtA+q2IbMHSx/1lxEq5utSvEpFnamBD4Qrg40UgBTRwEQD7
         XR1zi2ahdLy14xxfTlNBo5uf5/PMjFAxvIPFAYvaRPLmAqHHJ/2lpuZ6y01qSJgbF3GX
         OuJtrD2XAicEpZki3svDxDilAZzSIELH0wxUI14qP0FOrmhABQmU5nd2w0zEN6odDQc6
         l1XRHcuXgU0pVJv12H3KTAReH4wuWUtwsDgkr9xs0TjbG37VnsZiTOlNND562kwpwnia
         6kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787019888; x=1787624688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98i4v+/vyXWcyWkknO4LIfjzmBEpAN6zh0hmZXHw7mA=;
        b=fyi1bRPM0F1NZNNqYmhZxc5u4U6gRuYznvhgnafH7NYt/rZO/AEgJv1QMUEWOHYN5c
         u+S6o5q/s/3ZKOnZTr16QuftONZFmqbOUT8ySh/AsLSjxNx0gIQH+Qtgk27tSl1f5WBS
         mWLT3dDYU1MgTonk0MyBXfuOII94mEFNzoBDm1xecyHYt6vx2xc3wnMeDBd9YJAsztT+
         qCLjzj2xUhMsp8EZhNQgbWbHz58/8OsgoSpe8nev969ZACD1QX0J5GE8KFNmfpy8Q4Hd
         14ZS3wE0f+pjYKxwg+YgcymWTSEezP/Gymdclef0GurwyGJeAYvu3FIks9Z7ltBnkHjR
         8Nag==
X-Forwarded-Encrypted: i=1; AHgh+RrXoSG+rCFFcyizQdZL+m8fRcblfSmyfyICrzvmvANyy/FgkH+82ZvhrFivXnT37wdSVkbQhDbKGGJp8bFwbv4w@lists.infradead.org
X-Gm-Message-State: AOJu0YzpZPeyxpcpM4e5HDfJHlXJbre+2mcNFMGFtcitZt+50LDzlfDQ
	cRyb+X7LON8Iv643D1oBCD+FvQXZVjqLb0Db9FMncH28aosErFqVPnbjXGs0b/OoeKLXLa30+G7
	jSKzpIwsa1mUqAakiidQVnZe5NNCE+t3C3VBTJGE99wr7t929wElBs3E3hFLghhcJYygms9Jef3
	7IpQ==
X-Gm-Gg: AR+sD12XTQau+GJIFKtv0YRUtNy/l7kjKxuBxd9Y/lUxxyOQ8SksHLY7PL6n0GxOtRA
	FyjBd3typPRS9YB+aAuYhiZR8jJg+i5ImIUB0pD0mN1tXkal86va+H3enMUdm1ex4YVr4IZusy8
	mDqB2xJ9UHor8ZEzeVh/o7jw1JTXD4BmY6CCI9MjGmj7H4c5exgYL6Y6VxPjLe0grfqhhckFODu
	DLzpCufynnJf1/arCzEIoNNI6tT3IDWGOZUrvzEpI5/XsWJZiLJ0YfpQY6XDKm9uxKV9YBAqTUO
	KeuEAFWrfNc8/12hV5BJMyXuO3by+d+GUUt3HwxwesuCvQxGtNtGhs2ZMenSABYQXdjY2pHdJn0
	G0nQuQZD9LWF6l7lZlocx9leTY48iVL9t8CJA2Q9UykkVbFpUiPGiizfP21yvC1FevrTXtgJ9z6
	lhFAtxi8edWmTU
X-Received: by 2002:ac8:7e8d:0:b0:52d:9cfa:663c with SMTP id d75a77b69052e-52dbeb697afmr39243121cf.0.1787019887852;
        Mon, 17 Aug 2026 19:24:47 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:52d:9cfa:663c with SMTP id d75a77b69052e-52dbeb697afmr39242611cf.0.1787019887314;
        Mon, 17 Aug 2026 19:24:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm821205e87.25.2026.08.17.19.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:24:46 -0700 (PDT)
Date: Tue, 18 Aug 2026 05:24:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <4qc3n3mwsonpzfxi3z2supslvlyat32xgsn7bnrstudtpitwri@enwxj4pkjexa>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <364f223e-15c6-44c4-a909-134754cfd0e1@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <364f223e-15c6-44c4-a909-134754cfd0e1@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAxNSBTYWx0ZWRfX0fKo7ZGExuz3
 MEgnAuIEJE9Rpvgh80AfcPOPFOC2YE/u+dHqlmHNe0F2TEnb3MU2e44HENvlnJ08zPJ8auAfzmT
 ptxuMLJtcs7JEy6/mAuxFAWCSSZRjoiExn+5GSls4jbHiREKPwHwgSvF3RpikNh53wQDLQnGrWj
 IYk/RKx3YhGmgjv+RFueuRzxhHkEhQojo469qTMREREtI4tSgUbhtB+Q41PnRyuC89Qj44RAqqw
 T+we2XHHnP4syoUCsw3hwzcrUv0my8mboh6zgabUpUv3dnvuT+ZTYRdermROneTMb4t3PxSkJc2
 2NsAQFimReWbGV9ssDW23VSQ0Wf6wsdAW6/ER58Ik0g++Un7MZ8Igicsu4TJ/DNf/3yTQkQr8Sl
 NJdiEyQUePx7ivjTI+YlqXdl0KyffR8pIzJAeFYTizYvmVahNscomw7YLUgvmpl9T97480ab8QW
 KnDZoZEGxDs1VIAuJZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAxNSBTYWx0ZWRfX9hY9ztLJNVex
 O83f66Bki0t/SPu6E/SsoIOE2Q0IDtCRAZKJHXTyQnp38ZkUIGHHnAY1QSbfCZDQZY0llFRUuVD
 rzAIgGZCH4khEowWxb2vpJG6lwuaiIw=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a83c270 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=busZWuwHVHLsb9-ZDGQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: zHRAZQqOxIhhFy4X6GDLbd8qNF4sw7LL
X-Proofpoint-GUID: zHRAZQqOxIhhFy4X6GDLbd8qNF4sw7LL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_192449_741897_19C3E9AA 
X-CRM114-Status: GOOD (  26.71  )
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

On Tue, Aug 18, 2026 at 10:05:30AM +0800, Chaoyi Chen wrote:
> Hello Yongxing,
> 
> On 6/29/2026 10:48 PM, Yongxing Mou wrote:
> > The bridge connector framework currently invokes all bridge
> > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > event afterwards.
> > 
> > However, not every HPD notification requires a userspace hotplug event.
> > 
> > In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> > IRQ notifications through the bridge chain while the actual hotplug
> > handling is performed by the DRM DP MST core. Connector creation,
> > removal and userspace hotplug events are already managed by the MST
> > topology framework.
> > 
> > Allow hpd_notify() implementations to suppress the bridge connector
> > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > can clear this flag when HPD processing should not result in a
> > connector hotplug notification.
> > 
> > A NULL pointer indicates that hotplug suppression is not supported by
> > the caller, such as the connector detect polling path.
> >
> 
> Should we add an API to distinguish between regular HPD events and
> the IRQ-only notifications you mentioned?

It well might be so, rendering the first series listed as a dependency
as invalid (then it's good that we didn't land it up to now). I have
been torn between adding a new API and extending the HPD events. I
ended up choosing the latter one, but I might be wrong :-)

My idea was that both USB-C AltModes and native DP deliver both
mechanisms in the same way. If we add a separate API, we have to take
care of possible interactions between those two (i.e. how should we
react to IRQ_HPD, if we already have a HPD event being processed in
flight)?

> 
> I've recently seen similar approaches. For example, this patch[0] adds
> handling for internal events, which I think is somewhat similar to the
> IRQ-only notification here.
> 
> [0]: https://lore.kernel.org/all/20260806-synopsys-dw-dp-improvements-v11-11-0d508505f383@collabora.com/

Thanks for the reminder about this series. I need to review it.


-- 
With best wishes
Dmitry

