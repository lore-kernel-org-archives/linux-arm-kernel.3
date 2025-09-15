Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CA3CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 00:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfIfmtGDU0fMWPSXfBq3QGPrRejWAR38abE4jrrVyJ4=; b=2X0nLkIIs0tBIO8NP+yGlc50na
	k8A5VQKsC+80+1m+Ou/cMo4R2B+jSJR4ArRgVaC1mFZXSv7EIZY1OD+BJ8fBYXbAJdTa638Mrrwgs
	9JEzcaSGDE5OnT/0oI3fwd5M9aV1vaIPfOoGzFmwuBylfCKMzkWR65s0r6Q7AQ+muO7JyNm3r75j/
	RJwBHqrU36+d3k0cYSBgK/ME7uErH1fFmNYxfnwA1xFQvWQhDMUY4/vRyE6UvUkzWdsp19LdCW//h
	17EIn6uWiBY11VHtzWnOzqlt0P2qsuBODLBNeZljhso9NPBiJSxUoMk5WdFhS/aelpMSHYRor3c2s
	xLg6Gu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwrM-00000002Oj7-12O9;
	Mon, 15 Sep 2025 00:14:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxwrJ-00000002Oib-0R6J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 00:14:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMuHAt026714
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 00:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wfIfmtGDU0fMWPSXfBq3QGPr
	RejWAR38abE4jrrVyJ4=; b=SUOFF4XNRO46ay3UYMsN/RFX10KQxXKyoxTnQuXZ
	jFJzdaDG7YKTMEn9DWCJWxVSXROJy/EXK3NdO04I9mcIXSc+Yh/oybm+zoM+ge5X
	gi4fhfdHiD1oKn3jHPCZVjcbVhwM3M+b5O/K2xeAn5ptq4erGu7d/KduI3Oth0WJ
	+B805Q8T8Djcm8Rj4Ww2v9PMeN3VK6fe56aORWjK90imQIePdZ9NFJr4nuelu3MG
	rhecpEnLlhZspV/JJp+w/R9551cQIuSaCTbO+YqVOXuJrhx273m369UH0Fdvprq4
	MlL1BYxYnMQndpZgj3CiU5DnpjQx81xZnY8MOt7Q2TsqqQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr3613-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 00:14:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7814871b57dso8755196d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 17:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757895255; x=1758500055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfIfmtGDU0fMWPSXfBq3QGPrRejWAR38abE4jrrVyJ4=;
        b=uaYjYfZcBEamGJdpf7LrjuoqNjCySeIjZpAe5ERmD4L/0kdAxZ2H5p0ksUI+9sD3gQ
         1nOMuZYcCSWhcAKShg7howi2gaZ7evxDwa4q5NUpKerUtfYfUVmFZpaDom1q2mw+rtFf
         sD5b7yhR4idDgmZNT4Y7oyz7HDX2VHzKMEwaCd7Md275JwXUDzNvKhlgTGz6TP4Bk2HN
         AyyEbCp3hO0lxB8f1HnLPGXU2wOoEGMYgSdyrMVBmEqJghbfJ4rZvojBXOnirCY4SXSZ
         NkTXvQu+XNLj88bB7vLZs/QYkg+4DQ0EuI5yFr2lziLNjcPudZltniyeauhTshmF3huC
         GqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS2oUnv9pHbUdzoG99npWstCSd8kPARenTZMxHDxTO4RxXsdlxeOnmU0zkhcXYVrgRRojGpL9OD+4IL42tRK46@lists.infradead.org
X-Gm-Message-State: AOJu0YyqNzHBobUk9VmNZIH4ZPrc0bQVeFeFxSOu/KaEPd3tjhHlKM11
	G4RDYddz+78jvMKmeOhvTHzxac1fvnkOwaexzIDFq7ZZvrie+JXqEYDP6eZHyXWBTYS01KpUdU3
	/ht7Ly+btb6N4CTme4yJ6G5bLAngShEqbeslmdLlpdTtJp8c8cdxCJRZnk6iSf+hm7JKb/0RQQ0
	FJkA==
X-Gm-Gg: ASbGncv4A3gMV3r9Tw9OcWLkSnvqpPa9BpO7tRQh1zqU/fhLtBFfh1VNx1ol705G6dV
	Ckom2WA/qeC9V/K4ahQLhBxMhq9wzeHlmFkyDL9FqOEGsUUJH9kHyS/jHQubkZ4L/GMU/F1dHWs
	b+0t83N7cHOjQtdjuuQl81y10wXKrX1m1u2xV/hZsm6TEnb7h2AZZnUNI68iqpPssTmSI5Cj2Me
	TZ+UkHqUIZKLNb19rajcWEDQURBY5e8PKyhscsVV2TJMzTB2T6aoeHdac1xwgGgqQ7BAvGNzpUm
	LalH7LY+AMqt66HiMfsfzBF3TnPR1gqFBQTg8WMsK/DpPnzRxrYjCZVytLjlkgu9O45sER3BB0a
	WbZyHbVgk8fvp+OhZ7nfichHfbklJPU15reW2rgChlTmMwFw+gNR+
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id 6a1803df08f44-762262daa1cmr182241876d6.27.1757895254718;
        Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHObBFwIlp3GQ+VOBYwejw1PxkvVAwhDilkZbOEooVdFxkX7Rq1AOhro4RGokvljow6YU9iPw==
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id 6a1803df08f44-762262daa1cmr182241606d6.27.1757895254257;
        Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c692daesm3255202e87.26.2025.09.14.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:14:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:14:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <pdodeksqchby7gtr7oukm7wqleu535kzh2g3uaseqmkxv5g7qx@jvh5fcppvutm>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <aMawQYUIjPw9m4IO@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMawQYUIjPw9m4IO@redhat.com>
X-Proofpoint-ORIG-GUID: C8XJMryvrRApa62pmgqmvrYW-PvtmT1I
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c75a57 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=ErCwDgQeR7lfzThPobAA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX9qnuJNFCnUG3
 hYpE6MpjE7SQEz47wYCePTcEeYdoXPQ2o382yT7PE3pQ8WAl9mHRzl2m6nUrE835OSE1vvw5P7Z
 4MnGP+MscxNoIrwLwMBrie1JApSKAceZJoTedLhZs/NKaVHyAEmiyRshLuJaPXXDlMAIQNSI+6Q
 x8sA5W79mDibMm+ARcqQS/cG/TbWrKLP895EOYJPgCVtQAim/vkCm6jkjHgrGLw5SMb/6qExBeG
 RX4mqvcoeIljJzZ5RChiDBm+qlyB6dsjUVclN+2Ni6vkvNs1akIMcemUyg8h+I+qZiJSySV9znA
 Y/hv5EplKoz+TWDWUTVrgxgTJfQnb6ci/1WfK1n7hdBSp5p/4PXug3Skwg+O56k9UN2t3VSOnzp
 6ByihqTC
X-Proofpoint-GUID: C8XJMryvrRApa62pmgqmvrYW-PvtmT1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_171417_268031_B8B97044 
X-CRM114-Status: GOOD (  24.77  )
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

On Sun, Sep 14, 2025 at 08:08:33AM -0400, Brian Masney wrote:
> Hi all,
> 
> On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm subsystem using the Coccinelle semantic patch
> > posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> > 
> > Changes since v1:
> > - Drop space after the cast (Maxime)
> > - Added various Acked-by and Reviewed-by tags
> 
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.
> 
> I'm not sure which tree(s) this should go through. All of the patches
> except patch 1 have at least one Acked-by or Reviewed-by.

Patches 3, 4 were merged through the msm tree.

> 
> Thanks,
> 
> Brian
> 

-- 
With best wishes
Dmitry

