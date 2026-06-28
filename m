Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4556FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08I0qAKNeZ3YtOQJRXgtfOdKvyOV10uVclmPREP6adU=; b=ZB5fn+jYld/2gHLyFdW2PQ42Ui
	51Ew4+04+YyZQ5Sylzt7v+EozYydBDBwEQhzJ4Ryqu39zuisZ5uomTPYzlAbbVsNRm5GLocp7418K
	pK3NC2Mq1wE3xpwVrL7yIKmqxeOrEMY9WStTGnNOX4Xeg5+Tjx/R0oOZ29lL9cZpW7nN011Bnhkf5
	KGEFYSTP+Ysi5+vwj/kcWDScXCCT75AYfEfbHVYyEyVFhfIHJcchVWjzoObGSf79tekUYJr3iOysE
	AO7DSfap8UhpoBH5X5W2rAIssJyDbmtzjWB0PHlL0P5cCTPvA+3TK9EBVMvxtfrsk0BWZWE9RY3XI
	v6/oc0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyND-0000000DSo9-2dNn;
	Sun, 28 Jun 2026 22:53:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyNA-0000000DSno-1dWR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 22:53:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9Lc7942274
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08I0qAKNeZ3YtOQJRXgtfOdK
	vyOV10uVclmPREP6adU=; b=Pvl7WW3dnynCredS2uHbctPhs2ZIcn/foX1a5uxN
	zcZHYX+eSKnoreYOzg6p2aFMO0S//CDSm32s8rFWce47yEUHLRJlb+hAsq9D93Kf
	+iNcyG+eJSdIkCnoINhR4J17Es4oWxM8grbCLY9tfO552TGnref0Zd2lUub7vdYP
	/8GQAH3IMA0TKPyW7Ks700CYqm5t9Dz0haO6q8w1eNm1W+vZMCV5PdU9h/UR5NKZ
	ukWrE9kBz4x9OoEDpulG2AjHkNm6NLwPi3xYMphAvhBW56U6PyDj2EXAb+9lfZrY
	0LFQDrk7FlUHB1sMDphSHYUg3lP/0DveF6UR97jSvzug7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6ks04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:53:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5740so104406585a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 15:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687187; x=1783291987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08I0qAKNeZ3YtOQJRXgtfOdKvyOV10uVclmPREP6adU=;
        b=X2vCG8PsP0iosrVXRlqH89sqdLLRpT12/gfWi1XBAwzUP8GOifXsgolaC2PJIxuIy5
         XAIeZe8C3P4f6plMA2kraTEYDdLCZYXcSSYuNREGM2pvJRrxnzffGqsKFXdYUxu/QVmq
         EVDNopKfloNJf2DfSqjH0ssAywF8/uTG2eBRzMuSeeMZe2+sTmmeqifOdsGF6EDS+DMC
         IdJRSGab28tZS6RIMjworcvV55RWORqLpBtoFQNdSibj4OEqjQizS4q6oTJ9EAGl/feo
         /asdua31N0GnwfJaGbBRndQZmZesGPBxwyssT//nPJqj7O0IymPu5TaRGfa075QNQtZY
         H+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687187; x=1783291987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08I0qAKNeZ3YtOQJRXgtfOdKvyOV10uVclmPREP6adU=;
        b=UTtWK0zEQkXBZ/YpbmOJ3zHSc5i6/f1R6LpMsFUSQLWzMegVp8rFn8TAHfZ588qJ2e
         BssvIuSxkGNNDog4YdZ0Pk6ilQxG5oBCAWs7XHl6XJc4kA6oqFRoyxCgebdUtGYS+lmX
         jqof9glxE8IaURbgtLSZRHoDdsXuOsR4xA2TPNkmwCcY3GCY4k8vTH0judp2kcX3hNVo
         k6ayoaTwnzS2/G3HZt8aeCh7bNdnAnJRpsm0KVwOJgxCsWLbE2RWgY90p3pZbfyt4MrU
         aP3y7MfVMLEuIAcfqyz1am+T33nOExBh9KhfASxEw4/wevDO0hSYaPbN1HOg9lc2h6Fq
         8bew==
X-Forwarded-Encrypted: i=1; AFNElJ+/T7BpkYXR3bDGAur6/uDtHxxNyuqX2JICectDsnzBktth8JJIYaXPWoCikm8l7vB8noxDMBrmc5U5CvANz5w2@lists.infradead.org
X-Gm-Message-State: AOJu0YzRN8d0JAmiSxroH3fUiIGOL22x+pKnnwJ52zx0ZcmGUwroAV9g
	XY5xy9F87uijoSGUijR485ulvXqD3bBmQwb9Q5K8V9ELrC3uGumvkxTKwv/wnvC7ad9NMPIuaSi
	Xs34bj8ezKpJX8VQ6XyGkM4H9cTvXcBcnlb4zpKJXCcT4CbtnNbRWlP7+RNFtxQCaoX+2y3Fuom
	+xuA==
X-Gm-Gg: AfdE7ckwO8VrtO7jU32ygp2y5Iq7n52qzIUKl+T/6CtO3n8OvGho6qwf3Z6GYFtbELk
	+UV/WikXpXrSjheLSIpJTqY7Iq54ek6dl7Wz4oNPue7bdeKPsaWN/J7WVD8XTRErBX6GjLjVp/S
	f6HwJRnkTqfKLGPs/jLzQp18cZB/emEvWKNuh8/Jtv9I8CAaNqp1qmffQdJTuZYNkteyyRRMa+3
	m5SxrMd5/mRh2BwQLHeLzd4eIvP3DsgqAkM/AtZrfP8+gJY0tDUP6QPz8nIEQldBp8rT+4ENOBs
	ZHA8dVcesrzJmX0Vx6kAn+oKUMhhzAHnw2kn1wKLpUGylG29xXJNcIIUeRRrf6O+Bm2FYYnkcpo
	SnKhbTGKQaL6yjDPt5fEm79HAwyOmTlIM0An7XAOiiMYLWgNYzkHSHzjuQBaR4SZFOCQhBIMkw5
	XRCZ4EHUe5j8NPbIvIbkkVw/kO
X-Received: by 2002:a05:620a:8399:b0:926:e8e6:36b2 with SMTP id af79cd13be357-9293d5b1deamr2010755985a.32.1782687186709;
        Sun, 28 Jun 2026 15:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:926:e8e6:36b2 with SMTP id af79cd13be357-9293d5b1deamr2010751585a.32.1782687186041;
        Sun, 28 Jun 2026 15:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b18370fsm68823601fa.36.2026.06.28.15.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:53:03 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
Message-ID: <ga2yyuoob5jcseb5xeeumbnlvsxdhmnrioymbd2bgskpuy5min@miczr3mmgyay>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-6-9b28a3b167e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-6-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fWMjoAeeJsBxWV2PWhmTR0s73E1dLSv0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX38+0CVEoDwT7
 r9XRti8o87oA/cFUc71sPjVmRIlc7GKT1C2j8hJQ2yq2CV4mGFGedLttSZBC4T3xb6KSuzezpvY
 r47NEEQRrj7msFBhXandzdANnlo+DRE=
X-Proofpoint-GUID: fWMjoAeeJsBxWV2PWhmTR0s73E1dLSv0
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a41a5d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX/lwiuHdyLDo9
 1c+Kf+7snYFgN6cIwGulbJLF3m5OQGAQcuL7VLoM3ivUYpTdpEgn5q0Iz8lpFD3HFu9pm4ZxNMA
 VAbq3x471LaKlveZE/bbHftr6FUmwOWXv7fIr4OZc39XUbrKm5T6mNKx/7HJJVhmth2HrtyZoUe
 yVzHt/KfEi8o2Cpa89/Yr5KJe6eUl90jTCttXj4ZerIQQPC3xu7iwD9CI+W/zbWzdWiu5zP/VwK
 sRN6pnjs7yeAnOIIMqM5B6TkzyY74Rxqu26oApfperOrzr9BqKMbuavuuo5yZCxNpDZnYX/kUV/
 hBb23HrtRtyxq1iv+sWTBgB5GUBY+u0X2+oixZZaZtCQJ17/lq4hDuhkCNVP48pAFjRJDWxYdCj
 DCMI0XvOvz4HkNWE+RaGJCK90OGwI3TM4PwSUOhFCrH7VWf+FWZaTkTVs3OYYWEqzbVl5W7pBpz
 Yt40D5ncy5P0pnH1PAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_155308_543275_37CE4685 
X-CRM114-Status: GOOD (  14.15  )
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

On Sun, Jun 28, 2026 at 11:53:59PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQM EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

