Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1DDD46624
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=jLsk1QNe3UEV/AsLlexXFYnyk2
	TYM6k8vhnlXByg7te79EEhzC5Bx+VEeSJt5fhukkgJPQBzcOE4rQGPDpnfTvmUVz/nJAU4rWtv4Nc
	Dz4i7rtGpRc8z8pDckENPevQn1RUtLC7AhbZd9A34ZLPDi80B2VVC2zNqMlUeATchQPBEoa7yhUBk
	rqvA7haoZ9UT/zbwwLBSnwR1vI5ID/LFkqQJCmnWqRaSCpaOlhszPBQ/1WITvTvpzQTmxdkbZGGjj
	3LFE8oo34rKYX/ldERtHkHQ8QyLnUO9rNMqgvwoLNyinJxDPA4rMyHgbuLvEY9BGYq9JT/rGGV7Ee
	gLdZ+M7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUXa-0000000DCM7-2deE;
	Thu, 15 Jan 2026 21:06:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUXX-0000000DCLP-3TyT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 21:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LJDFLCrYV45/LSxd/YrcJFttsp
	NXwyrJ7R658oJEKX1DN1Y+wlor1+an5I/UjHTOkMUPoQUiMVxnUT9hT7ZFN1Ps+y9lfR8G+MX6qn3
	LoIi/tlnSBenkHsMdpQQfp4+Vfk0KtDS+/xfW5a1AIufefiR2Fl3bGf2I1DhBFm64OIqVaAp/QHQV
	v2Tofl4v3MjbuvC6QUIv4tN8BFHKNcIOTQN8bvCyLwUvwBCykD3VjPewC6JQ6zp+pI2/60pS9eXxd
	lEs5b0FuKWjRSn0i83tG3EUeGWvx4lA897HX0Z/mJ8XbZ/ijJWghrskvXbwiX0Ku8hskEsRO6KpgS
	84AAUv7w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUXU-00000008SVw-1HK4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 21:05:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY8oI2673505
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
	erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
	usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
	JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
	ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
	k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
	6E2Taw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpyduhm0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a4c50fe5so220328085a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=fYlk3Er8QjpTwQrT/YEHJwd7gsSEnU2jaAayPP/3j5YWBImwuaYDgDhuS3VGjbdeww
         Bpk9qtH/xwJwL/JDuoPiRmXQz1f+Nt4De2MOKEf67er38gjl68yi6tMIz145UXHpQj15
         zUo+3qTGmS+Fhnoyt6AbXfkBdU6cuCt1B6L9JPIwgc5ymrehCrHBEEhtslSveXwegc90
         eqw8mnZAw4kh/pHAJY7NeHd/GtB3jJ8X5AEQFBzkSNawr9UuP0s11Grwjk5tSsPgAuix
         aA+HOe9/PxTrZysTKge1ufFkzPsGI/Vu0P+vTgMMO25F6TEwFmLNt7/JmSNGmWrMMnLT
         EIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511151; x=1769115951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=nR7iY1w694H07stJhkcWafaOdqrRp8xis9K9YjZUmp9SpmzN+SDeopO4puxtYWsS/N
         hXWZYoTyHUZDdG+7cKjxfRXjQdBgPIrW8SryDzrKhEYdmGmauQQxnEooO/fzWLJxGSUu
         +Jaynpdt6PgTN0uE9TnHZmoqUx8GgVprLNIRReh7gr2g9ydjejiHGH+8+X2aM01xhCCX
         iyruq0TTsRjcNT+lfr7w5ptQpfaskdHKEMhB8Vdy6QdpfjUUIdMk3MSxnLA9TH0BeAS6
         zGpTVyrVInvf80yn1v9J+PS/tBgo+G9RRmJbeXEfQtrigNyZ/q75w6y9sk+W45w5Yk3K
         0FUA==
X-Forwarded-Encrypted: i=1; AJvYcCVduwUch83fpdfVbyHDlJho1X7coJ0TVHR4TUxydVEE+kYj3YY6LUuds/1umxP4WAjx7MtxmwUMW4LzdbyY/Img@lists.infradead.org
X-Gm-Message-State: AOJu0YxH8ML8qDSODKtQwxm4N2xLh17QkG9vWSkaxEj0+a0cY8fSJAnD
	RUoJAYbFnLrC1Y/R3eID4LA+7sNxVqrfX5nVWrsizbgVbkkTDSKNn5nYhjlnzlK2kvhNdD4meNl
	u56EI92HJqmuOVk7kE6DTxMmnxZvL9U8w5gdjqlJDbrB4d1Bs+YFWCAN3TAVoEU1TsUKr0BbPNT
	5jqA==
X-Gm-Gg: AY/fxX7pvgR+P7zYIxRoFWa6E9q/x9KZvlYqrCh91cw+UDEciqN8JyqnC0qloxt2aj1
	dJnQCGF4ejP16mqQCTTBmfufpm9d20OVVPIo0BB1/HZ7DLDGv+HP6J/wYZCM/X403koW4Tl+Nra
	vInoX7F6NlNTPtM+eVEMuekfhenky86/O1GYh9I6JZcmmhJySbdAH8EODdEuEMXuVZabcu5ixCD
	WKyQsJyD9ZH0JVrANR9gvadhZ0Z+B1tz4eqEjYM/U007uQqPnq5jYij+hW/QabasXYe+bbjh8b5
	l9fsCfiIDwD5KExmoWtDpCaRsa1lWKqruHRpPkZWGDAjOKONIjvrGjBFvDGjCfh9CSvSghfMK8/
	f9NX7h2BBf+itOuNXjjvX7vCY0LhYCX/jN/F3k1AdGX2bzTKvvecoKtA+puIsQjR52PI+vvaiRo
	nHIc6UeDNwJ+MMSVOYi6QXMhE=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120082285a.8.1768511150952;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
        Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Michal Simek <michal.simek@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and friends
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX/OdgV45UeM9A
 YIbY+YFE2lPFb+81q/1tD+3XxQHOXDa1DYr+mljie99NTi5QNil7SPAgjY1lJ+6v5RBwDXAnM0h
 XBLwITOdaY+UxiaBCGKXwo0YblHSw5JlIAVlZo0laSaLk0HWs/2bwh7IQuXOuhCjKLsQ9X05R+g
 LTh6BhwLgQSPmqCEqGlaQxF/hXNOrwLP3Y6Hanle9h770yd5uWp5+bLNYnvi20tvVez0W07GsTA
 u61KaB+HQs0jTGsdMiqD4HKSFsE8dr+/br0hp29ZGwgGXLXZxmSUZJTfhi5JSz9coVNyCQRm+hZ
 M3ekAIjR2sCc/Ce6jveJJlP2n1JFWKghtZ6dSElEMNb+8GXtbIJrr0faTzCdX5gPuA/7Bdq7LT0
 Adqhu2n4f6uFYFktIkS+iRV3B1+0yzQtIlrDRXz0Q3ebzmajuSu2pS+Xu4W+tjs8x5AEVtyO6jT
 tCNUOm+aHOWxxkH1mkg==
X-Proofpoint-ORIG-GUID: 9bDynAkZFXm2Uhg3in2HxRM1zqBtIhEc
X-Authority-Analysis: v=2.4 cv=NafrFmD4 c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 9bDynAkZFXm2Uhg3in2HxRM1zqBtIhEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_210556_575248_A9891C2F 
X-CRM114-Status: GOOD (  12.86  )
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

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry



