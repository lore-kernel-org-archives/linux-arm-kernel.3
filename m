Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E46FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9ZHZ+Txy5mi1xMSfTEMkpbbO+fn+/HINQfWSf0RFmg=; b=hx8rHpvuxz66bBGx0VPL9YYojN
	5HEgaSEd0qpYLY5BBVyIZyO/IV2W10z3hzHLl86ZTy9SxZjz5aCshE2GCTWn11kRk0hsVPHhUx+IB
	3cheqyZ1Kd+aOak5PhxnE6tUTetJcE6jnSV/AJMHQIT31yOswquaSrEfV30EAL+LbIGXwO7X7+GYf
	koQ8RZ+Vm2bs+OtyELdbvRLz2HNxM3Du2+t29yQp2S3yvad6wmqaciz8VbwT9DUUoziclPmh50v02
	qhIv4+mP9JX+FpE0TQAnitOSU6zpQMK6YCnM3Aho4qOOyV8V/CZ/eCBy4wvj0LHra1u4NfFqTnixf
	S1BFYQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp6m-00000002SbE-3vej;
	Tue, 28 Apr 2026 20:32:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp6k-00000002Saq-0rw1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:32:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsZCc4070725
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 20:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p9ZHZ+Txy5mi1xMSfTEMkpbb
	O+fn+/HINQfWSf0RFmg=; b=mGHrAYuvqYqk+iIbadUEARFBN4q2qHFLJ0TCZ+en
	thTyU8iFTiMT3i3M/lDdrX7EaT+790HtDfBzB8R3Aitm1fTXx4hBGsBpP5AZMgUg
	e2JINAR+i51/xX5+aNua6OVhAIomFFDxo6l2JblcMGSz+DKhfD8CR1oNoOBNWR5c
	3CoVlfvRq+bEDF7h990WwRTConFWdEqJr0l/FdRXFY+1aecxmsNzr8RJIT915Oj7
	WI0Dku2hJAPwwKOKti8fGjRwQT9e5oUIvvAwRZUft1V9r9dK3KP/x7Ollm1qXB4r
	QHog+JwPD6EjJWsAolHkK9o7caT/0XGDquQ4NhR7TRHSbQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjjcmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 20:32:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b67e8c2f5so14516766e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777408356; x=1778013156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p9ZHZ+Txy5mi1xMSfTEMkpbbO+fn+/HINQfWSf0RFmg=;
        b=FIhgAfrjad18Ud0GatAcZ1fzDgWCW4PwMZrFtcyaKCeHWhoq9i+dfeJCfrmCHnFL7p
         qWmd8Zr3eYszWeXY68VNu5Lctpa0NMwOzKioSXIFvQMyW58czTKA89vP7Fxw451DTdQI
         +RhZXOVeJoao/Zd+b7ZU84q6R+B3fOMFzuUdOm8YaBvzYs1+83BVENu2KiASdmsSCpAE
         0lmsBQ0BO+f0+llQoTOvFlNj/taaWGoeU0f9B7IzjIhzfBcNVOzoN6pcESNX1OZ/uDsD
         Bi8JLZBANVSYwQPfpd9z0nOsadlE/KdbdTbnbOfGIxVuQ0xYBor5RPFOGzktyZP23Ycf
         0GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408356; x=1778013156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9ZHZ+Txy5mi1xMSfTEMkpbbO+fn+/HINQfWSf0RFmg=;
        b=F5mS57xucqBhNo617vuKE+x5tYVE6DNXqIPjbs8Wmre94OeBExO/7551+EKGSwvX9g
         xnQnlZWMkl6fB2cfmW7jeCR4IOXiWYYOFE/jyYnSAIhCzVzzGa7SvKicEXuEv8GLECcR
         R2tGwElmebUTocKD9Kvxt9/pUGDF0dgxMZJ8fNXxZkKUhgXeCVUDbb1u67bCU65/3dZD
         rjt4/xykVbRg8V/PdcMApcSwutZxtHBvJ4AXzPklZ7c6x+cnj2bo3jqdE95THlPGvkPP
         8591t4OZ5Ym7n9iqGWFZHhP4sTqGOdK2Mclg2t9f48NtUi1Vm8UdzOrQnme4DRzf7DPh
         t59A==
X-Forwarded-Encrypted: i=1; AFNElJ+7RfMkaQJr3oRzj+iJMWeHTxuKZyfA8/weVpoRGPIVpPjes4A4Ao4YVzW5H/1A+V2wmSZgZ0DPs3/pT4VNsX71@lists.infradead.org
X-Gm-Message-State: AOJu0YxmB16uEeDnzvuInA8gCVWCUVVKq84HCYJmfejyNiyDNw5/MKS8
	s8Jrx8iwRdGDpxWbwDkI3oPDJs8cfb26+AfKuf8foTgM8oI3fx2mTxW2diTjCTv22Or064NMheE
	uSAG1ft8NUAY2Ujv8fAh3rY/m5iAluh9Xr7MyWUj9vQyY/zTGjDSz+u0Z/qRnymhm9m87uXvNCj
	Z26g==
X-Gm-Gg: AeBDieunn+Pc4Nthn0BlhAoDLwkSTNrlu+VJH+x3KyX4qFhd3togHzIPVt8RPf+LuC2
	ppVxoSRa8u/UVbQFK8lsNfRbcPYfQ4EPEVo6ODhHLosNBP4+44sv9YwhffLJpyWtg9WSbSL1Q23
	tNHvwTf120KBRqkeh7sBbsUyFbuS8oMEXJ1xAATmnNZYz95KyhG+COnW1U+yQvw2F2hol+CTNkb
	jiccTGTfFchdi82WEr/syIMnUPvtGB1oONP73FXGthImRl+JHjwZMSZyv8INkBLKbbpZYKL5jg6
	nZCF3sGaYXpNSlPrXtc2x+E+dgFQtvUUdOeGXUPlfDtiT3SbytpYYtoAxT3wMxfA4tjes62C5y4
	iVWAfVqY9JL2noyjbDso6DVN9ghMuYQVD51cPS3DBXPxbBkTQu+ofFfAZMYfk30xMDLTYN7H387
	wh4RKZaFN2eR3OlGvxjtB9w0o7CDXEwPSUHi6EiAtqwOybMA==
X-Received: by 2002:a05:6122:46a9:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-573a56b3c5fmr2957416e0c.12.1777408355970;
        Tue, 28 Apr 2026 13:32:35 -0700 (PDT)
X-Received: by 2002:a05:6122:46a9:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-573a56b3c5fmr2957401e0c.12.1777408355449;
        Tue, 28 Apr 2026 13:32:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924d12f94csm1201771fa.15.2026.04.28.13.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:32:34 -0700 (PDT)
Date: Tue, 28 Apr 2026 23:32:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <qpt5vwoyin7ox67ysllnaojduwl777e3zzm2rvw54eogeewoke@gysroqruf4v7>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-3-a537b5567add@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-3-a537b5567add@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5OSBTYWx0ZWRfX+BG1r+oqBkJo
 eGiVAKrOS0g2UKv+Lw63NPRHr/sXDBZIjRAyG7P4hVHr4POGPIR+2iE+flEEdl/AJIhdkCnkgX9
 a7/wYyxmzeKPMCfiimOQy67OOv1gCqgTAq9SX8emoEK9if0pYV5inTGk//sJtJI+VjxfUoZt0mV
 FQuOcFUKcbsr/q4YY7+36WGzCKR/PPqP8ixMd/r8Ma4D2e0PprkLmp3DRRF0Rovv9PKge2i6Crd
 /UKtGBC40fWAd3B80dnOq5iavc7Rgy4wJyI40V1jSPiEhpKQs2U2G5T4PUQEjo0a4cW05/2nqOL
 wcWeQjAP4lz2+ZTH2W2M3V16aMl5ViagQZcQeZ7OHnYyQ/UPwHcYfiiUlvFwZDSBim1UcnW89Yq
 MPsowtUqlV/SOpPoyoCYBV36PQ8ueoZdG/RQ1z+n6z+juvtolqb1ZPiJM63Nahm62NhQ+0Lwqt4
 PvTJYcsmw45KhlUCnJA==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f11964 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hXVsb92WUBna0ZnZifYA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: iTULPpUVKcGWtcC6LFL7vUGdWiaXXCrL
X-Proofpoint-ORIG-GUID: iTULPpUVKcGWtcC6LFL7vUGdWiaXXCrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_133238_406375_0C1274A7 
X-CRM114-Status: GOOD (  15.02  )
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

On Tue, Apr 28, 2026 at 05:30:52PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

