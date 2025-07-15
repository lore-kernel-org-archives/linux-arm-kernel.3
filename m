Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A59C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFE3yd+yxu1P9RbRQyZIroNtei5T0YAfVddPN3zIsz4=; b=ofqj4QOR6b7c8dMfVoyuRy2A6u
	aodqkjQm9oACK7Uuk+X03xXPO9xxZ63sjostTPkglGynqeQoINmT2DzQSk1Nhc2MxsqoThHTkyVYF
	2qecxo1t8UrhJuLZ0GVAGL31VrCYu8YTIQKTj+oo6Gnb/ZD79pwuAMcedoF8igR8BddXlsUWn0Lhm
	FsuFcr9w5GwrjN9rm3tauztaL2wFHRkiagA+TfPBdKc5T+L1X3D/zwGG1V08oYIwfXF1QlyVs3zJB
	hDtWZ10WdP+vvC42pUy4lqk4T8TbCtqj/GXICk8yAk7PwQXEwgfoaMdEfc2qqMlYUog2kO+6APoM5
	lsXk45zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6v-00000005xvV-4AmE;
	Tue, 15 Jul 2025 19:14:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhFx-00000005Xcn-1Oal
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:07:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8RKG0007444
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UFE3yd+yxu1P9RbRQyZIroNt
	ei5T0YAfVddPN3zIsz4=; b=kms4CHhKguztPZrh6aMbRBtnl6d9uGu4uOFm50lw
	iMEm3Hk1vAypjt53Ce3yleNqozyM/XTTCxr+e4G/uDCfYHbXQAg9h5hQNPK9y3I2
	udYhwnexMqZsF9/inyxAfUZ76hBWYT3td4TY3OazGAs+vHQuinCcwiorjzrk+l0g
	1Za2lALAmOj85o6c8rScrhk/vR+IhdCd7eBxxr3eg9cgxubjapge0iJaHFWolH36
	PYJa/KbYNYKjmbLO0zdUTqedsIENjxR/LKLsuUc3U4b4zj/FX1nbUJwrZnhLZ3fE
	bV+7Tw6R8Bs9zY0xs7ikJuxKj8mBvjo/d/+R4DU3M38Xdg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut8k92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:07:43 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e933923303so5121355fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592063; x=1753196863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFE3yd+yxu1P9RbRQyZIroNtei5T0YAfVddPN3zIsz4=;
        b=i9a0gf4oo/ZzhrkwflwByrNUNYM3CLIxXhKoOY5KMz1yewowGBgld4JZ/hVtNXM/2y
         Tmko72JZ9ByDpUqatTQJT1au7SNpEtkBh3/8kTXglD5OyBXHWuRNZR0GWuPeNcBQFoTK
         9B+hJeySe3Iq+k7zlKDKPgTWSqOtGJ2qRDfycxMw984StOJgurC8dpx3FitEW020r2pD
         qow60aceto8Hw6nfzBRC9Q4CD0TcUzcnvLgOnDK9hIjt/8rDhsO5B8Ehbe0lQKeu2HIS
         2ZAb5CfPPinSeYlo7CM5GiIkhj6KydEfSJH0IJbbWhaYkU9fv3z1MTrYk9//6POf6E2g
         41aA==
X-Forwarded-Encrypted: i=1; AJvYcCU4yzQtStqoX3uoL+M2S4eO8k8r4fFpMrVKbCH9IT8rezg6dPWhshiRt6tjil8420eZHi6nXLCxrC5XkFXMpsEH@lists.infradead.org
X-Gm-Message-State: AOJu0YxkR3NNRsNO0YSDTFu+yX1HjzZV2OXGXnF9Aa3A9BqkgbWk0450
	Yqh05f7ZixvShDXI0HuJHNddomLj1Zi8v0xGi7V4H6KwLmIDJPc6i08ntI5tOu8b9B/j5AioEdz
	kLHJB4IjG9Iewgqq4uZVIozYHnvzGRev5DcFN/++q6La1x6MQt2aCPuLtvIqZ4eLQPSWGVI2FB7
	GdDQ==
X-Gm-Gg: ASbGncvkKYOEmc53IOAF7VF8Oor5FsM9Z+KNv+H3AyOCGQ0At+pGNcFJewf4LN5gQfr
	g9Fa6TOAiIbYc59L4R71MSY6n+dx4/xkm1aGSFuZqYUqnpo0qdlZOsW5v9Pa5AQpJFDweo9oxxe
	4VblMUMFFByQKIc2camHXbLOxhHAi/4uaxipSiB/tZ3sucQnl/bMctWfcq872N8lJx/8pmfwoCq
	FNTkw/ycpOrgp1hIpsuTvVgrNk+2yq4G2UfHiRxqHfZKYgskpS/nPIvstRBhmZr78AlGFu1KJZh
	pXUpbQIODclxL1RiJL1jHf06/vHwEcLA2ZLMyt1p5ECKswYz1VchJ6tLdIimFY2UTSq3ZbocTKt
	jWoAwdGj2Oh6s1nkgrsKQeswxzcz8zMMFnRau2Nc7P5aChy/7Z3tH
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id 586e51a60fabf-2ff8f899b18mr3018612fac.11.1752592063017;
        Tue, 15 Jul 2025 08:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzt/a91mT3BodYIFDMVy8jVt1HoRKIa+1bUOyQbH9aZS0Ib97nHGb4Ty6uV5H10BORptHD0g==
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id 586e51a60fabf-2ff8f899b18mr3018555fac.11.1752592062451;
        Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d092csm2317122e87.114.2025.07.15.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:07:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:07:39 +0300
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
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Message-ID: <qk4v2znryznnvg2vcye2m7taurfhoozjjdtye3fmk4fgawm5jq@2qlqgg4htfnl>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68766ebf cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: FeEUv8F-x-Qp39nwN0WjztVmoCse5S_O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfX3urQgloH3NJd
 Vkvs6btmWxFypNTWrHdcfQxnPQSlyhbFdKtaXAgd2URH0JlUZoZw4UtirBeP5Qov33AqDqS/ySO
 Hm3wB6USyKM448Ube+jLPD12DcAyEguyGiiu1JmLKOQDxfLPLgm3vHSvH9F91yghwvbW5+W2ZBN
 L7KhXYtBIdwp6ZmDBEp5wkjuq0bzGxVD8UjJ4WyOkayXpmEyTW4LYhyHD3aHELjeWgybyk+Bhzu
 cpa45WuqcgAvBwWDu+GNmO6WasaxOQRkLnjtnQgr9+YxyZuP6CdoE66vOF5vaRiwMDu+e7Z5Ero
 KxshquN5EGzAHVXTx46wm5XEg8WgnJk/UH90glhCN2iHTxRoI1MZQoxxtI45QEQ9lQyvwxivrPs
 Rcnw37xfGV0HaWef9Bl92OZQBVmMUVXues1FzP/ocZ4+XjRj/Y9sY3mMdPQyIvpPl3I31IXJ
X-Proofpoint-ORIG-GUID: FeEUv8F-x-Qp39nwN0WjztVmoCse5S_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=881 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_080745_489834_D3F55899 
X-CRM114-Status: GOOD (  17.35  )
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

On Thu, Jul 10, 2025 at 01:43:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry

