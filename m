Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAD8F34C79
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOK8xz+kAAT0sGnFLw4aNDwgw8+J3RcJlXQkxpqjpmM=; b=aEoSHx8K2Cun+pvTrZaKs2xjCK
	8Jx1DhI4lmTCcc9NpMNy5w8Lbj9vbmWUkER96lYJuKTgN3JAjTswF+NIfGWVnVV9dgn2rY7EEdhmq
	NqQJ6WRHkVim92z8Vn3kON6631KgpYtirjLLRmvcOsev+CRgWRRe1muxzMvcKPuBP0/7atGRJKPYd
	ZOzZ0z8wgdTkcHo5VgLknPiU3D7ihjaTBjBUY7zINtaKrlxvthEJBpIRK3Ky9dnZp8ZyvegTUVm31
	uyY7OQT4MORVdNeRVjOCoqTvDZNnOPJcxPDcTF41Ck01H22Yk4OeYBbas7lkkZtphtE+jBilUxlbY
	2HJXe8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLWV-0000000G9g3-0bXA;
	Mon, 13 Apr 2026 17:56:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLWS-0000000G9fe-1QdB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:56:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEJOP53539434
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 17:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOK8xz+kAAT0sGnFLw4aNDwg
	w8+J3RcJlXQkxpqjpmM=; b=Dw/nxBMdq4uF/bpfRCFEEszlAGlfPaHv4z+nVmQj
	dUjFoQO4+KLUN18wfNGZpltZOoG6HkvF1YxLwe3lJPQJVno4vCXlSIBoM59HF/fQ
	44J7Pb4VYomEr3wcHHs9jEFQbpkxHbKhO4YgLQ9zYIscZ3/peMKUa70joNENP+gD
	HdAlZRL6LX6Xb02hIEQKDYQ1PZMp07eGZ5EQEXZGMTt3q3v3R8XnjZQLF/ZGCubW
	fVsH4kC/iOlShXfkHrS5a+uJj6uB7so8J7DPsTqK3wFsJ26kptiFkqnkrn6337Ju
	VUrueMdMLmIM7ESyw26imU04XaK7jw9QavztEH+mFZwa1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh258rrrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 17:56:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so74002891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776102990; x=1776707790; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOK8xz+kAAT0sGnFLw4aNDwgw8+J3RcJlXQkxpqjpmM=;
        b=XJrtL8EFKfQ3TxHkGH6bS7cSD55He66VakmXyndAS3hKhr36BwOHhb8OGz3AP7VG61
         ayaC3wZ+AQNNhbZjJLMAA4ElIskDpva/PAwhifIYoQduvmfvutCVcBti0lbO1dcX4hpz
         +EgKYb0YGvcIENnu0EC4ZHUD5QELOAdCQgNTT0ISz1QEbeT307u9coJx7KQr6vzF6up2
         6E/vG3F7Uodr94XBzFGQlwQ/ISoY1KavRa3xZgaEmiqrhlhh9JnmnCxQVd/pWDpilBHo
         IVdnpGlslUe0hqih/0P58VvAilq6UJKRminQWU1XdR8j7qLEaEwwqmPkA7EJewKDrXnW
         86zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102990; x=1776707790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOK8xz+kAAT0sGnFLw4aNDwgw8+J3RcJlXQkxpqjpmM=;
        b=gGni45PPCWxWrw287N+5osFYLnvKVd12xevyDKaKM1zZ7nRT4V/1/FtSyEmVs3CF+b
         rGEgY8lcIuTX/x+GTqNaxSvF5No3BZtIUWVxdFZU2I7GW2ss5bXMe7s3OHcM0SgVKt6V
         L+aQiojYuTOe9jrvmMvnuE29Z10c4NvHmcQkdt2Vyscm4IU59vDPuQcMNoXrFiJD92bv
         oZHQyYf4V7QXFCWWC8x9j3vhAZHOjZ5jCTuhrN0pW/2cgarlL2imIksmMIVswAkyazkl
         yHN7Ajefj+H0aKs8Gsa3tuMcWqWWuuKxCqpPo6zSE7ibUffyJmvALCLwmgNAM6f45afM
         EYsA==
X-Forwarded-Encrypted: i=1; AFNElJ920N939H/IezfHnNi4OEk3+0FV8U9YWp585fTuG5YLvmHaNSayUaBMtgqQXLMVsz13LCeJ2vZdyarAKNFE/wi4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4maH1Z0gJPWVtWJvQr2QWfockJpjPrHPPF1/CcUHYrO23AvTP
	5DCm/H/QjAiz8ogVmTNHc2OT3ICK7usHhb0A2m73eHrpzvfbdMa26EKxLCrqH2sJV6hYqZ3D7UA
	Z8i93Xs2HmCmTtSNn/I0oZXhryM5hhvapJ02wJ0+Oua+GM73klmbBL9PHF0dWtOV8N9MzXwQ38Q
	+fig==
X-Gm-Gg: AeBDieuqMiq8ma2up6m1HTWuGFxre7OWZScwL2z7NRmcKyJVH0GRnhCXPH+ZWtJbJYY
	ifMqiYUyWPVocWfa6RQPoIyjGcgrxmiqd7FbMtNSVVVznZw+hhRIqkd2Tfjr0LTmTYJaiCKUbpO
	FYBbEg8h1UjOVrrZDcqCSg5OjhA5KieAkTEz7i5LC0LRfUFlaKbylOvEUYHG5d/LqRsONFgYF7k
	dSSCMh1zEPLsfdZHDY9C+fu4oZfZ5fTbikQ0GHKGp71AbdbcBPdPqAZNK7SFSScQVJt2dHmtcoC
	HgEqcWo7x+ZIV44ooJ3boANQBswjSggcdxkjveng6AVn//dzQ+0UUWVQm66kh4wXuDSZ/wf1bV/
	h05Gt5rEW8urs93JURgHlfGsf1umuMCY6qicEKW83VEK+0hQ2csZJerCbyp2JGhFsqvqVFz8NqW
	orTlJ7+09BJRfAtsQeOOoBGF1+tcoF1z78DixGV6C4X8A6+Q==
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr228447351cf.26.1776102989385;
        Mon, 13 Apr 2026 10:56:29 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr228446291cf.26.1776102988486;
        Mon, 13 Apr 2026 10:56:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe7db18bsm670757e87.47.2026.04.13.10.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:56:27 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:56:25 +0300
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
Subject: Re: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
Message-ID: <omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
 <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
 <DHS6WZRYGWZQ.1X6ABU4UWF730@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHS6WZRYGWZQ.1X6ABU4UWF730@bootlin.com>
X-Proofpoint-GUID: 94Iuc99C3VxgSPVa-RmJAUPR239irdCG
X-Authority-Analysis: v=2.4 cv=Vo4Txe2n c=1 sm=1 tr=0 ts=69dd2e4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=Ch5lwy9Ifhz3koOEWzcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 94Iuc99C3VxgSPVa-RmJAUPR239irdCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NiBTYWx0ZWRfX8N4Zxcq5aJUl
 lH+hYfSElCV0pWYSzAAWNHomD2xjwQ47sX/qqLJ0O9DHr5SmBBLKIRNftg4EMr104knF0eLCh4F
 7eiPQsHVO2dKuRfSvswtVfT7EoxnGBpv66gO1cmc5QcXk2LkAQUgbzIsOLDOHE/3iwFVZconEhB
 +aS7A5VAvbtiTtdpSgUzTGzsnyS5SBZuqG2JLyyZm6kI7E8EhifXXMEduALh4vJmgDhwoVIYbmk
 nrbxW8EFc1V1pdpyOUkXd9I8JRhmOOf8ZN553hMLR60Njhv9iZkWQPfM5HvNoWtAutrCHU2dp4N
 aVOWStQJ0GpcT8KGolpetv58b9wluJeIEu9JEjUhZa4JGWujiCqfGx1l7Tnk1IRw0P8CTRzSf+I
 1u7YjMa0wlTrJ03o5dNIjmFxqWgGyE0nF6vuHPidGxuDQYwG1zHT3UH5X2Q45lk4ZMyYTCQ/s82
 PO+hOh/r3Ihsk0DCrmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_105632_564184_1005ABFC 
X-CRM114-Status: GOOD (  43.17  )
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

On Mon, Apr 13, 2026 at 07:07:14PM +0200, Luca Ceresoli wrote:
> Hi Dmitry, Maxime,
> 
> thanks Dmitry for the quick feedback!
> 
> On Mon Apr 13, 2026 at 4:58 PM CEST, Dmitry Baryshkov wrote:
> 
> >> --- a/drivers/gpu/drm/drm_bridge.c
> >> +++ b/drivers/gpu/drm/drm_bridge.c
> >> @@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
> >>  	return bridge;
> >>  }
> >>  EXPORT_SYMBOL(of_drm_find_bridge);
> >> +
> >> +/**
> >> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
> >> + * @np: device tree node containing output ports
> >> + * @port: port in the device tree node, or -1 for the first port found
> >> + * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
> >> + * @bridge: pointer to hold returned drm_bridge, must not be NULL
> >> + *
> >> + * Given a DT node's port and endpoint number, find the connected node and
> >> + * return the associated drm_bridge device.
> >> + *
> >> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> >> + * when done with it.
> >> + *
> >> + * Returns zero (and sets *bridge to a valid bridge pointer) if successful,
> >> + * or one of the standard error codes (and the value in *bridge is
> >> + * unspecified) if it fails.
> >
> > Can we return drm_bridge or error cookie instead?
> 
> (while replying I realized there is a design flaw in my implementation, but
> see below)
> 
> I initially thought I'd do it, but I don't like returning an error cookie
> for functions getting a bridge pointer. The main reason is that with bridge
> refcounting the __free() cleanup actions are handy in a lot of places, so we
> are introdugin a lot of code like:
> 
>   struct drm_bridge *foo __free(drm_bridge_put) = some_func(...);
> 
> Where some_func can be one of of_drm_find_bridge(),
> drm_bridge_get_next_bridge(), drm_bridge_chain_get_{first,last}_bridge()
> etc.

This is fine even with the functions returning a cookie: the free
function can explicitly check and return early if IS_ERR() pointer is
passed to it.

> 
> Such code is very handy exactly because these functions return either a
> valid pointer or NULL, and thus the cleanup actions always does the right
> thing. If an error cookie were returned, the caller would have to be very
> careful in inhibiting the cleanup action by clearing the pointer before
> returning. This originate for example this discussion: [0]
> 
> [0] https://lore.kernel.org/lkml/4cd29943-a8d0-4706-b0c5-01d6b33863e4@bootlin.com/
> 
> So I think never having a negative error value in the bridge pointer is
> useful to prevent bugs slipping in drivers. For this we should take one of
> these two opposite approaches:
> 
>  1. don't return a bridge pointer which can be an ERR_PTR; return an int
>     with the error code and take a **drm_bridge and:
>       - on success, set the valid pointer in *bridge
>       - on failure, set *bridge = NULL (*)
>  2. like the above-mentioned functions (of_drm_find_bridge(),
>     drm_bridge_get_next_bridge() etc) return a drm_bridge pointer which is
>     either a valid pointer or NULL

3. Return pointer or cookie, ignore cookie in the release function.

> 
> (*) I didn't do it in this patch, that's a design flaw, I'll fix in case
>     approach 1 is taken
> 
> Clearly option 2 is the simplest to use, but it loses information about
> which error happened.
> 
> What do you think about these options?
> 
> >> + */
> >> +int of_drm_get_bridge_by_endpoint(const struct device_node *np,
> >> +				  int port, int endpoint,
> >> +				  struct drm_bridge **bridge)
> >
> > Nit: can it be drm_of_get_bridge_by_endpoint?
> 
> Argh, this convention is changing periodically it seems! :-)
> 
> I previous discussions I was asked to do either drm_of_ [1] of of_drm_ [2],
> but since the latter was the last one requested I sticked on it.
> 
> @Maxime, Dmitry, I'm OK with either, just let me know if I need to change.

I missed Maxime's response, sorry. I'm fine with the suggested
convention of using the first argument.

> 
> [1] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
>     -> search "called drm_of_find_bridge"
> [2] https://lore.kernel.org/all/DEH1VJUEJ8HQ.MIS45UOLCPXL@bootlin.com/
>     -> search "What about"
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

