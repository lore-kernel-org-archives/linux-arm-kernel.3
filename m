Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C1FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObqOUZTyrARl8ec8JgmHRIoBQhBr/qr+CrAYCMGQmus=; b=YUO1vX3c3W1ar+BG3UgLu1mGtj
	g4X1WDpzGT6harJEodlO7iKC2LJ/Jodxvfv3tzDzGDd5H5npuflsc9y9p8/cOASGnQOfCDpw/z3jj
	V/IAh/BpNUs1PauslSobVSfn3d1E6pVLE93aQEGCYvlhAcEdaSU90L6SAm6VuCnXqgXQorOeWZBjE
	XgBnXPjI8ZVbKTQbjBWXT52dhCEwCbC1LNy+z8hpho2yU+m7j6yZwrAI5Ty/LgkFDHOfwYqxZn1k/
	zLhk/QCQw3mhAcg45bjQycEimCaUggjf72toVjy5KNA3bYb/K5VlBs/hbGxUx/kQuTQvyON8umhCy
	PRfdSrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1cL-00000008mEv-2MoZ;
	Fri, 12 Sep 2025 11:07:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1cJ-00000008mDL-07hk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:07:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fK82014034
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ObqOUZTyrARl8ec8JgmHRIoB
	QhBr/qr+CrAYCMGQmus=; b=HogY8K/EpkV/pbnGmdiacBZ3fg5WnhBQc14tPHE8
	dGFAFY15Ke35AX8wHNIxpMICYLjk524LwDwH7+ESLvSWfHG0jX+z3POOceLoiFtd
	mtnH/kgcCGF7eD7kjQg5pV141NQ/4vaq5p1iQrVBevtotYv1dq86UHBuBdNSQITU
	+G+1vsOOMsDnwgnCFcy8uVTCL2GuIWHBcliJ2eDN96TsP1+TpiZOuRLLcJhEdxeg
	brvRfxMyhf6EKz5PpJsb8EZ8HVP7Sb4Pzxw8kqZtRJ8s8XJk4yO0IFKWn1zseqy9
	n9dvE2lcfcF9bRA1T8jAva9OKWZkM4p6WBf7GfvB3GEAUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphw4jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:06:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7671821d5a7so28033336d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675217; x=1758280017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObqOUZTyrARl8ec8JgmHRIoBQhBr/qr+CrAYCMGQmus=;
        b=i7QKmralH5GExczqeWTPrinrMHCcamYoq7dve8ZIVkUz5vn6uU+qat9kakp8IeV9os
         /kDxWiiEagMwLRDVFF/dYo2Tn/6cG5KwpTQtM4ZmqrNgDhap9V9GoqiMNdYzXahBy36/
         Xcp/iBFCgBxoCqFYHMRfi8yBFJpwGxF05cfLT2wj2WqK9jToCSI3yxLjTBvYNjeSvCeg
         pgJGffPp3cc/kX57ACNqABPPEnGBn7/m5H5zYNNFmiWVrhmxLVpYW6OAp4QLMkdwodqC
         JmJlWRLd70mTNqGhxkMu8VJAr0Uzcse3xxZFcpwAySQ96jb0sy4wJ9W7t2RCuetwSB5i
         RceA==
X-Forwarded-Encrypted: i=1; AJvYcCUTekcsjWr3a0EUTj3s4XyBmxmnqrI1TaVsDchLxMXfc7dr5FkDoMCw1OtAZ4pWVXTvtGOeTybhcvzrZVazaZeo@lists.infradead.org
X-Gm-Message-State: AOJu0YzKYSmCYtR38JW+fs2qFlle9O9uxN+mow4j0UUPdJb5OS7StBxf
	RcGyCWnA3FjbZ7pv1fJ9YFdHoX0MzU2ZvN9sBEbVHf95/t6W9oeKckTxr01USMjuF1bp4xghjeR
	2WMBFKkNVe4lquoK+T4FUV+PCYxo4C62e+R1c4GoI6DOIsrAJQrQOqu4vC/rQ1k1Bhw9OoPBClY
	ZIKA==
X-Gm-Gg: ASbGncuL/kkl/dvLNhkoSeuxFXW/yAKzv04F25rhlZIulOx/hEqZQ9adP3UkzxBtWtN
	LASoS+I/xwHpviCilwfz5+HSHpvrCJbTSvaW528QmnrzvQcOGwe4UswdePEjxcP0ZcAcVS7Tc8S
	3XPEoFIdX+lmG/iHlFSCF5kVrc5D7A98Z0qTeKMvgb5NuDHrtQoP5mildqFRX0rViG9+EqbBEwg
	oNpsax8SBp6GwGr10YEQjj9e+4OG8JeIn8gNhkssFO7TGh6KJa8p4vaSH3lawci7zIWgNuE8sXX
	2qlXSSG1VESgIh9UzQ1dcy19DxvHbCef6giA2xNiCBvY7pBjmU1TyLlEG9IEfcIreo7AySLYcAN
	8ZrcdMcJKrxt9VAxpgQbDAlXMG3ezDsYMv59ZDhU//ERjMB8oX4oa
X-Received: by 2002:ad4:576e:0:b0:70d:81ce:ec1f with SMTP id 6a1803df08f44-767bd2881a8mr34381956d6.12.1757675217190;
        Fri, 12 Sep 2025 04:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzL4AO8dNGPWgFHm6qvxn4ogauEObB1TwGr9YSH5AEOx8Q+cb9zElyfiMXPvqBFGwT80wJCA==
X-Received: by 2002:ad4:576e:0:b0:70d:81ce:ec1f with SMTP id 6a1803df08f44-767bd2881a8mr34381126d6.12.1757675216206;
        Fri, 12 Sep 2025 04:06:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f15a5834esm7432661fa.10.2025.09.12.04.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:06:54 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:06:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 16/17] drm/bridge: analogix_dp: Remove bridge disabing
 and panel unpreparing in analogix_dp_unbind()
Message-ID: <zt2kyoq4rnn5gbb22vvpphqwmbbv4vecjvc2iepa6t5iljhpgu@xckynlkyyjiz>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-17-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-17-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c3fed2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=0i7CoW_5q_0ZA8A6Ya0A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: _nYN9PNohxDh0TXJ-P0xyqfPiMvf0kqo
X-Proofpoint-ORIG-GUID: _nYN9PNohxDh0TXJ-P0xyqfPiMvf0kqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX61SPj/Iu+yp9
 jSAR3m2JoQZcLKD/B9cavTrk+a0Q7Fat9OTLQLg87WF5R633NVp6pvLY6Koaj/t4SCIBSjhERMB
 1oLu9/+tWuyUltnoQO91eRj4IdX9DqDZHM+KunbfycUxXXn7FjsC8+rvcBaKypGu/MmZP2TuE0z
 bACLBo+HIk4kGsrB6/mlXenDsEFZFEIIRZcl9rvnTzekMF4TGSyCvMTvVDyDZK3lZGtav0iAwbX
 +YhQ/iREyfVeNI0x1Ful2KVRFt0rT+rSzZNPIT19oyVlBdxwgXcPchTLTg1lxEa+97Eeb2ab1Dw
 vc8uqE/iBkle1YMQC+tV7TNvB+ZSRfN+iPNuLghE0gZ4qxpUAXlILG5ITBB2pBqXLVpUY1/UuBo
 ncEIOD5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_040659_185008_3F400228 
X-CRM114-Status: GOOD (  16.13  )
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

On Fri, Sep 12, 2025 at 04:58:45PM +0800, Damon Ding wrote:
> The analogix_dp_unbind() should be balanced with analogix_dp_bind().
> There are no bridge enabling and panel preparing in analogix_dp_bind(),
> so it should be reasonable to remove the bridge disabing and panel
> unpreparing in analogix_dp_unbind().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

