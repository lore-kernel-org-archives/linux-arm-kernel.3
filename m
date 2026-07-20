Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8362FC4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF8karFkg0wDdEIf59u76yMEjWKKdqIYaXBpJmFfZtY=; b=F9SHDvhfxa2b66Ttgrmooqu7P8
	NvMnazZ19uNPjVcijofIW/ULHqZMOlgebXobp6MUf7l4kKTxgZ0rOqRPwrcxlO8EHChGC9SlQ3bXm
	xiHaczS20C2irCek/stDybyy/9f5Xo3O9QKKehcKbTfGFvpC48qefNlbJLdctAIwqTnMnFj7bKVgl
	aymzeo91SLUkiljTOtn0mz9Wu98zSow973NAcOKfuZrZPwcEQvrmvk83+CiFkyUixSMy7l0B1xjyR
	N15S7RrQLdsAD6z7GLiSFxwHpx0ZqWfS3iCPyJaTYId/LU4AiOtaWe0+hg7h4claIfSpFyAjWAez+
	tz+XtcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlojo-00000006ve6-1tLe;
	Mon, 20 Jul 2026 14:12:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlojm-00000006vcz-0kId
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:12:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDrFSw2807604
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lF8karFkg0wDdEIf59u76yME
	jWKKdqIYaXBpJmFfZtY=; b=P9jylU1OWDZDvCUMZurHCGquKJfn9Kz1PKdfu3/9
	PbZOR0XqFH+7RQtryW4etriqR3XYE0+vSv3xdgvr3SGaF9oRIVvybAor4ItxulnO
	qrMfVAUf6OK+TxRDuBYuAPHUIHGIsiC6EeQwZvX7NQqRqV8JAgBfNJLb03dlXH75
	uyY7QEPw6LuBFdw13JvcnHzUKQ77EIooJJHYvJQKeKI8sVl2R9xR45SG/fb6BW2s
	Rw+mCBs5itpzAbAyJzo309xdII/bR3R2TXLa05LQTjf1hu+6+8+1JrsS3VCW6+Nk
	loRRhHr7TTsCNocwtg/XJH5rKNwLoWX3vEBvuvCtEwU/Hw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9a7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:12:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so94721821cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556772; x=1785161572; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lF8karFkg0wDdEIf59u76yMEjWKKdqIYaXBpJmFfZtY=;
        b=Z6KyAl19g2uE686V6JaPXUx4DhOZAF8YlpyUq1Z0w3Tp62zWOak0uPIA9Y9Blr+yaW
         BXjBs1BPe/3GTUHi2V4wlW5lsy2WEsA2ad7WyHvv6pw0t2HeF8vQGIewrpBGaW+1t7HX
         RsdvnVGgT3SSCwKFHTbNq0D1qJoLu8JGn/84b7lkRYXy7ssZAAMmZd4ch0W//WrUfphs
         sXqGeaOfXJJrshCiD9zzMfIPJLsbrPQjjnVlPYnTboH/2cnDF3FAgsaGZwbzf8z5uwoK
         SOAFSSwEffiHZl+5JiHB7M+tsR8Kxu6h204hBPITvth5iNv8I75ZUs9W2ZFBOULFf7UD
         CQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556772; x=1785161572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lF8karFkg0wDdEIf59u76yMEjWKKdqIYaXBpJmFfZtY=;
        b=qXxQ6LYT+H448TdO++9g/6KKxslos7Uks7/RfgVmSrmIYflT+4vmzO1UT4q7dlWXfv
         NDTQuI7pB4g0zFX5+Pqc9rPoPsGKyPh4RTWEnjvZwhrfjlvCnDx97sW1ZyBMYrbDWsgZ
         n0qToE+MumnKTr/5mpOOIFP1QJ34PlMO5oLTsucbABTXSde0sUALxKgwiwynlpya56TK
         Nq3jPv7p5loclo+p6j3QsaA/DpaGQ9ZhnIiBCOJNLq9MD5WfKXm8bK6toxmraZx7aELM
         BK50HJ+QkCBSxdHo1JHW5R7A0QOTnldMp0LDKHHuPee3MQAmHtu6i23YDQ2DvFMfOMt3
         VOsg==
X-Forwarded-Encrypted: i=1; AHgh+RoYx6T/Ap5INfdFaHW3mp0ftMR6gGZaUG98lwDbFsGDt2GyZiyTOV2Gc3EWAmxgKZmk01wB5zQnA8UFAza3dS7f@lists.infradead.org
X-Gm-Message-State: AOJu0YyNZqE9dA7b/2DvWT3aD3jHuft3t18vfO0qy5RBSzQef9XjKzSZ
	Qy9xJt44qPhi8F6rroxbP7b6odwu1tja2/RluzyFJ300kp941YQJyJd9hVCmGkwaU4Lxzkxk16J
	ixoNyAKYkDsdHlZbSPLtxE5OrtAQCibeabeGkKbE68mHwx+3IXZy8fo5bYvbvvGIYjh3XxOpzNx
	j4mg==
X-Gm-Gg: AfdE7clc2jqumnkpazh/xKdWuM71kDCLs8PXaW3+e3isXTGcsz/Cqg1XJaDOtMvBChc
	Y6u9SsguWfqsZQVqYiHD4pLLgV67XMZ1Nh/WLFmNHxHn0q3cgAw5qjW3sj+ZlTpA3yQvLUadrEc
	lFehfBTfv6l2SBmjlg8ZqEp58WlGxanlrOJU42xu0CvN4AV7jgWdEUqvKcE1b+jOU31gKBiFrza
	BL8Gtf5/d9paUc3qhkDp4NF4yKkzFjKOtkPWAfL7ZyIiVVNvd77N5/hiJARtjfF3O0/OMXer5H4
	E7H4pB1vpvPa5WxLW4NAknm1tgeHzIf0mxwACws36quw3SW9BpS6v9Np/BK/4DJm/HopLke2iCF
	zNmVnLqJ9yuCVTN8N9ikdWNvw2hYx/UffDEczX8AXLlmkTV3m8NVoXBswjyWMNHjNU6TuT3mG6c
	Uo+TXrEeBtmD96og==
X-Received: by 2002:a05:622a:2b0f:b0:51c:b8fa:395b with SMTP id d75a77b69052e-5213eb7cb5amr135131491cf.66.1784556772368;
        Mon, 20 Jul 2026 07:12:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0f:b0:51c:b8fa:395b with SMTP id d75a77b69052e-5213eb7cb5amr135130821cf.66.1784556771698;
        Mon, 20 Jul 2026 07:12:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e25290sm2371565e87.73.2026.07.20.07.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:12:50 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:12:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v4 3/8] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for 3.2GHz FRL
Message-ID: <al4s4LH2Om9bZ-X9@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-3-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-hdptx-clk-fixes-v4-3-ce5e1d456cda@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfX23Roe9rUBn5f
 folrceQ0xhqnEHMZvEs+yxbLgq8Qvm1sYVRQUUo5D0MEqK3lgKHZ/kyAr40sy9lpYul9dOID9oG
 78t/gbTJKeSzuElK6smWrx0aks8Waqs=
X-Proofpoint-GUID: c-WM_1E5L_TGy0cc_MWVcQQgy553fjNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfX34FmZ4yoLg2z
 cdPnx38MxMiyA/yuk/swu+A5AjjPSX3088HhCxMm9L+U5OnJ7lHzD0Ii6AL8v+4nAeNZoq7R6s8
 sDbDPjTzFbkzilPpo900rrH6P5VeVC3iKV1cFQrVDyTyvrJ+KwL8jjWMntNpeDf8o//gotlTjjw
 IsiEyImTvqDDKWgMznTiZXy9qGNNV6CrjnJBElEW0dyzFtFUALa9KMmBz7h/z6jZMnFje3RASV+
 PjO9ZM+gTGexv/cqAmTlH7YPAL7KD5WGQ012B2fJo4fotK2yUv+MXqN67x+DVRGSQ0ohx4pt6tt
 kZIbE9UBQWurtBTGyKdiVjj9CDouO4wJ9desjw3hWE5txZosgyHoG7AQlSlZafV1loOoyWg7Bsz
 JVrcYUge73Yw+7ecbPko4YkvcyLmlN/fCCyGYPaGT2FiN9JRnPWMkKdrMk1iitzH3uxtt35EyOx
 Q+F7FogtltM9C71qnXA==
X-Proofpoint-ORIG-GUID: c-WM_1E5L_TGy0cc_MWVcQQgy553fjNk
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e2ce5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6btzFAMt-cuNwz31USQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071254_332944_F82872C1 
X-CRM114-Status: GOOD (  15.74  )
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

On Fri, Jun 12, 2026 at 02:45:22AM +0300, Cristian Ciocaltea wrote:
> rk_hdptx_phy_clk_calc_rate_from_pll_cfg() is currently unable to handle
> cascade mode for the 3.2GHz FRL operating mode, as it relies solely on
> LCPLL_LCVCO_MODE_EN_MASK to determinate the rate from the
> rk_hdptx_frl_lcpll_cfg array.  Since there is no entry for this
> particular rate, the function returns 0.
> 
> This is the only rate which requires LC_REF_CLK_SEL to be set in
> GRF_HDPTX_CON0, hence extend the FRL matching accordingly.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
> Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 33 ++++++++++++++++-------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

