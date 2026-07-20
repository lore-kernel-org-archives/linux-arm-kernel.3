Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9A5C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVVBJ31A6FbKsFlgxmXSOPAtuGA8TxPtOacCBKqwyhM=; b=tv9jeLv9h8rKlivICLMK6gjz6A
	yKli0OS2ESs3SF17z0KxvKjdyn6aXZrEHoPuemVugwDOYXK/Z0o1CNBvjq/gevnTvJElj3XJk7iHs
	7te0aMtWdxmE2qnECo/o1QC15EJgKywjWLH6nggJJEY7O+O/IpJbbkWEgq2X042Ar6PR5oBlMVX2B
	mhrGmPd115tKS06vP3Q9Qu5ojXSmv13ViZGhYTMv2+KKOqz0iUuJWHWzU6fZ5yiqSuw839s1GPnvX
	clRiy1i8iHcG1okliIK+l98Nx/z5ZMsFrAJ8CBDwWiz1RYSoqCUynmf31TbcAYhanixlIahsc0puh
	ZaapFDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp2C-00000006ym5-2ahs;
	Mon, 20 Jul 2026 14:31:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp2A-00000006ykV-2d0Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:31:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDr9gX2878897
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVVBJ31A6FbKsFlgxmXSOPAtuGA8TxPtOacCBKqwyhM=; b=V6pIIHGM0seBO1ic
	X+CnzBsSRPjH6xnkOdQ8UYvGh7BixZbGKrh6OlPhq6FqhL+vnOb1c2lcrUgDPS9w
	zwatz+mM7TqLOSkr0toRwd2gav64hHxjynCDuNuDYBCFRk90zp18qayTF/rYCaG9
	QbvQ8dcxtE14Hvtupigb90qF3O0+405yVAxoATSzvs4cUFol3N2SP4d6yQeHo0bI
	mEHk3fRH1vi7V3at+4H1UrTu10l5wZU1VCmiSHY8vJI6gGGCpnKWP3Wg03QW0d5v
	ZcDfOMlkGj5ioqm0BuTU/Zy4VA7zMZ6jqj1vsn9doC5yLBiE45u5DgP0Qj4Iyacd
	/5Bgbg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kswc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:31:53 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9771c8f5045so1408202241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557913; x=1785162713; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XVVBJ31A6FbKsFlgxmXSOPAtuGA8TxPtOacCBKqwyhM=;
        b=JUvITvhe7aL/PjPrS5A9ZNse5wEaMwnaOokTZSM8Dr/V8qIjTYPg+cuBRotaL8ESe3
         3aP6f0251XnaB1w9j/xNWIrDo0Id0Tc/vwfXU5+neAbmkmHQ4NlgNHESTlO3VQ+mg/vd
         dBDEPxOxWayVC8B3tlhw2jz360OldbwCr4c5Beh5qsZYUOgN7VzppdjMGLaeehFoKQyZ
         pW2cNRmGP6qg/S5OVe/Z+k6OaQkBmXsXPaJEJA7TfmCm4IJVDqIFG3Wx8WR6zO7k0E3c
         B4bXusJMHUA2g4ydAxY6a10JOMRK6ZHmYsnuyi4hMu2SunhKE5C0AoxkE4q+ObwPw7ZF
         7YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557913; x=1785162713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XVVBJ31A6FbKsFlgxmXSOPAtuGA8TxPtOacCBKqwyhM=;
        b=NwdH6mB149qlp+9P9KPFqohWZV7jn7o4kYFVza31DRFwfveGE1G8IyFibzXA1cKarf
         tAC3+YVcDAScLTfTHHNdsgtxnKOry8QV/r9sghav4OYnR8Hl0uKiDrOk+hY189Dxmy+6
         ZwEVNUQe1W3nz8ErzeS8mVB2U5FZQIuDSlnONe4kkmYmu6xl2RPCvwY0k5RalQw2SQsL
         FZk8VKUZlgqfrNAG6YhUx2wiIgTFb5skUVTwZ+dSvfA7BoWLidB6HKM+Q1eCvuCFOM+T
         Un+rVIk3kfo8+XmQAQEnH9um5VyQu44voyq83VORTKtWCcANk95W3GPXaM4Wwfr5/w8t
         By5g==
X-Forwarded-Encrypted: i=1; AHgh+RpbJ4pI4myPjT74akR4DB4IHO1nW3nMXRoqXAONfOI9d4qITZdgWpGzAdmqyd195wFHeckiRmULNx+TOr+e0w7y@lists.infradead.org
X-Gm-Message-State: AOJu0YxE8h4Nf/q4zSK3AGHxds0C6pZfbT5YPS1uagfrYKO+/8RHGzDO
	juAmXOp5AvqF7eal2B140HbuaxYGMbTkG8Rml2sJVJh9k33XEjDUKZe1TV/S/1C5rtmiroUCTU1
	P7xMdg0a5JLOI44l33wI5kT8BPNVBnWU3YNYyaVEHWjV8JLeM/hoqFb+Ab/4cYEWaxiMbq+xyxV
	pN/A==
X-Gm-Gg: AfdE7cmmfkNIs6W/aaqLWdW6A9+DutR85IhfCUTC42rxMwb8JdFWiwkPqVAOGbc56if
	/qVol3WwrSJ2bEr1Q85T/UNJCQUludZ479cDYMIaNbErd2scOOiQfZLDQGusqPxmxnlKXPR0XsA
	kTuBaSaHqFT99PYI5fB1xfZFh6c1mjtrNyB1fZRae7n1L77cB/xMRp554ftjWpL+k3YA/uEID61
	/zWu54SxRTiBJtytGGkuey1QloV0NJqAr8/z8Sg3aj7tGu/L/DYch1VvCW+zj6qzPDjva7NtCOb
	S66zLH1MbaaZDTK6Z1MzZx3NvSJgN2XI5S7Hzrfc/QTJ5ZuG+uMQ7SRXCsaTu7RTWUE7aSCtdSB
	cCekBLEvUK3ogRWm2NO6HiN+E7qvKCKGqqhSZGs6sPgVEWsjwhMxSkNlQ0IPdlSpKFRVBg3ot/L
	dIuyVOvbiXzC30Yg==
X-Received: by 2002:a05:6102:3e12:b0:744:cb59:d6e4 with SMTP id ada2fe7eead31-7475373fae7mr4340477137.22.1784557912706;
        Mon, 20 Jul 2026 07:31:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3e12:b0:744:cb59:d6e4 with SMTP id ada2fe7eead31-7475373fae7mr4340446137.22.1784557912168;
        Mon, 20 Jul 2026 07:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e297ecsm2333411e87.82.2026.07.20.07.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:31:50 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:31:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas =?iso-8859-1?Q?Niederpr=FCm?= <dubito@online.de>,
        Simon Wright <simon@symple.nz>
Subject: Re: [PATCH v4 8/8] phy: rockchip: samsung-hdptx: Consistently use
 bitfield macros
Message-ID: <al4xVeMXTmjQeMlp@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-8-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612-hdptx-clk-fixes-v4-8-ce5e1d456cda@collabora.com>
X-Proofpoint-ORIG-GUID: 1OhnEt2Bza5ennQQ5IzXRStagyVCMqq4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX+r+LnOBwprAl
 L9rWXsxhk8Md1sT9+9ZfA+QBvF+sm+syVBDWO3aM35ZDDaX6ngqM7jN/3hJjNcE96W/7rHa9ZuO
 F/vZC0qGl1o9gCsaS1KkCNsvSqQ3lEI=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5e3159 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=I81vlq0Cx9dIN7l1fGsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX3h2UXqSrHOsF
 K1sUP8rjEwJs10Pg2L+VxiF+8b3cICrpr796GloPujXWI5uVRX7zlrKB2d4aE00fxwP34BCNFmy
 aV0/ZNS/Pmo1nKpLITfC0GBhNjdaLfkpEiYQ0ViIKVQnDL1TF4oRG+hPaQzsMyhELHRabcWUxGq
 wVFrL5+Qanxbcs4jZDlU3rzChDW6/NFy2n5Dup1oDDDPVH66uDq7GTmFWEvAgTa3yvPhWffB5fJ
 pj0A5MgNZXURmK/DQxkUisMu1KtV6+UPfrERo2iDc7bZDyr4i5lxk43pKJf0vRhRf9hlJiP8wYR
 5AcHa1u9iESv5CT4U8VhFZHO7w655D+IdofbFT6GfxZcYXPBRMK9o2zLxGNyf1xbs70tsHKUL4/
 xApfSUy/6f1iDZ17Yxtqk+rI7j/ZiSFOU4Y5PHBMMIrykPpzH66y+UsDdbWfhj+jw1DjhcS5prQ
 GmGRrBudk1efPqhLWtA==
X-Proofpoint-GUID: 1OhnEt2Bza5ennQQ5IzXRStagyVCMqq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_073154_792244_95C6C6E6 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, Jun 12, 2026 at 02:45:27AM +0300, Cristian Ciocaltea wrote:
> Make the code more robust and improve readability by using the available
> bitfield macros (e.g. FIELD_PREP, FIELD_GET) whenever possible, instead
> of open coding the related bit operations.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 30 +++++++++++++++--------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

