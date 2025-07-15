Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2987CC83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=; b=IcoyXpYzIv//y6N5C2GLrA56tz
	8B5DrKyTE1c6ntI78P6YyYiAtouUrpx+PFJYHLzsDGkjxC6mt/jXJf1n7C7JJ/KDOvL0Ao4nXwQwW
	NyCmXdD8rZdHs0bkKUit+A9ehhe/0sVH8t/1WO4resW8XdWCV4CDuQBheQk1cExPjdzP9kcAG/oZa
	xSsCJhvXq9RSbKckakYFHjqrogWwQkUI8wyCtoC0g8XusCZblCXzzHpcxAN+Kt1Ajcw2JrhcVVpnB
	7+Clq43Q55RANTuhdRLimDCY5Ues/tfVzbcYBXPjqUvjzajPjw3AL9xTw9W26Goq6T832zjV3tDak
	SEfjbR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6y-00000005xx1-0o0L;
	Tue, 15 Jul 2025 19:14:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhKN-00000005YTS-09Fn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:12:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEHcoI005981
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8/GQmYozt0hkVdJKNP3dY4c
	27MmXYLwdf8DyqAf4/8=; b=ElfxlvT0VzYDBYqLPcqcx5u7gpdJm/0FYmMwnBnG
	y+B4eho5GQ38s7gyWa5V2do3XLCADnVdKyNIdYEaRxCT0C1n6voidTAPb/dJ8PNM
	cQjD55+s9FTC8E0DR8gaP1UR/8u1e6FZJsdhUG9oFq65KyWJvm1FKx/OIVGZhCDY
	GqP34VrlblGX7kQjhS4nxUIVXBXKFZ9NLggE072UbjrSEaUUDqK9bPvusCTM1sc8
	TYWch1G+ETibhGOgFvTa8N8/FWEZDaZpp8bAT7BoxZ0ifVXNJ6WcBNJaKwt99/uv
	EPvODnurcR0dUiYP2bhTrorQpVZq/UucSCwyWS482wIFPA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb0s05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:12:17 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3df2cc5104bso94801405ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592337; x=1753197137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=;
        b=Hti0yUCXuFM0gmRJkfQegj4jpiuVNHaTNOG4sY55ik+Gc0aifGzQmKLYU1breTCoEl
         D1UUZc5g5IQm+BlX3QE1f2otAhYth25SCDT7THiNTKh7pbuUn5/SNLRQp4WTSZHtPuFd
         Kh0nKyScwDce7RFcEKbCQjnF0Uz/0mggKWlju1vKJI8IZFoJhl/FDdwYGOjxQApzvuc2
         K7lVNdK0BrktV5OJ6KdAuXUHmzLPRp77iZ0HqKobVKQgJnG+leVLnpC7eDupEfd9OwFA
         rko4RwQTCWd6AvpjgyMIUPthO9vYBj1dWnKUv5GPxHahwCrULcQlqRzOqBoN4/QQvzvl
         6dIw==
X-Forwarded-Encrypted: i=1; AJvYcCU9nVnTK5+3HoLcFX4Vj0i/+mOi7AnZ/q7Nlf1GjNwwQGdJCllUdOZqo09rn3jEny+XWrku2ZnyBf54gcrs4D8q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg9qioKLHw9XtJkMZmktCks1KXbmqG+1O5YPd2amRwNnWqDCXa
	wCOlIWvax18oZykSc3SBk7pe5KASTA/3jw8M3/jpjVySsbbU0jX6Wij9Iul84ZVywwpNpRQPrSD
	cb9WdxhOequngqIIuvGHqudMZhDHm3BgKHnTJFDL3fgVVzOig32jc7R2w8jU7jcZrwpIybYx62I
	RsgQ==
X-Gm-Gg: ASbGncvlne5F9xMD6VUaXrzduMLNmqZ3uoYDE3acwASRQEc6ArKNUc9BRiIh7usE4Fk
	UcWS/sPYbi7P8ZTCWSF8FH8xCbODW3K6cMf0Zm6bxhv46iVxpxCes6LbR9mZJSch3QQ1LAnPIj+
	t4OQIwNQJgvQtKDyMnKKiIyiaLPJdgyQOjOctyzuvTx28qMzSmzXqmdNaTV3ya/IdMAz+YwS1Xs
	71QorcpljyQbnhlC17Xyx4GyGjeA6zoR2jYDbVZVmslQObm5wnrwtllmeX8ewxBS0XDrd1Fj1rF
	dkWtyHU9a1AkGnMjbGZfMw3AtcDQerKqT9k2IzZJ6k4uQMovxk1FQTQteZj1mKHsyoNC+FiBP68
	w6C7CwZK0mxX3t/7ZYLIwHfc8xKRMKkIoHlP80X2y2Bxv5KNH0Og4
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190550625ab.14.1752592336606;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCcHGzu/NV0coaNVvZvnyxMM3fWdvavBShiCcBGZwVBVkpyKA9SgxNyTJ8HCuKA2VAmYM7Q==
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190549775ab.14.1752592336031;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7f380dsm2345658e87.83.2025.07.15.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:12:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:12:13 +0300
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
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Message-ID: <tkqu2zt5yulnngwvda462fhmkmtmtjnwieruel6lfjr475h7ld@47goit7jldgk>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-GUID: krx-3o1whaUIb-qeIOxH6DznrESgT98O
X-Proofpoint-ORIG-GUID: krx-3o1whaUIb-qeIOxH6DznrESgT98O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfX3/9eS9yrTmUv
 U2SChLepZFQTrFXerNrRZIjueFM7PQL3hYI1HUtL9sdrgJfsaw5eMaq/2cxQdXaUeVtpfmHb7Q4
 A5t8wnzYhH28pAwhFbntHcxvMow2waXLT+YYV1GfKiIBtemcNajnIbBDQdius4LcoghUxCV/Sao
 vgRvAP6ZldIqe2LLe4SN6SrtgODjgfWjcHCmRUYwi7fEFcvJtQyyJkZWnV1Tg0M/pLn9WKqFlZC
 GQ3s6/9UiDDMabm+3vT4vB3NIKaK09GDECjtROvstAAykgRNi7FtQXY4i4SAvf1HDi/KS2uQIkC
 ranQB6+OTYA+Pj75+yvbBNXplvmVxNHEd9vxJdsjN9SSuPsE/X5gAkAHCGZ0ehMf1vYAbhLHlPb
 h5J+ySoEOPanndsvuuH9UasZgNPMQ0ufJtLNNmREw99SNzGFIUanPu2GHDur6i+ShDlI6lZj
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68766fd2 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_081219_189361_7C770139 
X-CRM114-Status: GOOD (  17.87  )
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

On Thu, Jul 10, 2025 at 01:43:04PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry

