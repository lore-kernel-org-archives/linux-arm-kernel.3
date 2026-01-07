Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90692CFD65D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=; b=lXgHJNMgL9qzugnBcGz1ny6chN
	+fi7RIm5YEvucPwAqA7wCAIJl/z6IYfXTxQmB6i3f5WGQS/ZrFc5LR/kycaMtAoKRunTdLdRhPmOn
	JzcSwEsZGCW1BNGenO2ZmOKXFvM0rO7DxCmNGzxFE44jmEBO7uGCV73xUNQkhMbN14dcGQJLsWg6t
	LPE2/wGunV6dC7S0eLsDcKcuLVNOzWwrbxsDCwe3Z2dEwYK9V6QCbC4d1WkNi3I5mBu1AAT/JGNAU
	ecrGN/zozTNm/qG/znui/24S0casQ2XfojY7blVm1HMfTo7UGTJFAwIT40UvGOgvvOCWb8dDNvf8w
	qxzgqyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWFF-0000000FFRq-0Mjv;
	Wed, 07 Jan 2026 16:18:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWFC-0000000FFR8-4AkG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:18:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607FkusD1979616
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 16:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HwZBs/pI4tqrM+YdLcnJrTnM
	DuBq2S6J78a0HWSkjHk=; b=pEqxtVM7ihUy+zNFC6MGh7WxN7cbgbo08zA/hynY
	4qHlzmqRIEP0uOC/QZOS03kyXGH5cV6Jg1Zs7DorHDtEsn0pmksseXi9TztcuRcz
	HFPBO+TTEU1Gnn6x5m4n2gwHD97Qb0AYcPFYKpv/prYihzGuaHkWbGECD3AwA8YM
	hiuQ/x2DQg9FmXWIk3V+jB8rYHeA3S2OhQBI5+7mslQFkWvaG2HKPwWA4rmbB1Yz
	Ra7FvnhBpgzwyhxD2jxvUV4l8utAzuJszDeEqpfnZabgaz+OIHGPgEWeXvBGAeMf
	e1rQPyb225OO+q0LrD2i9CW+DPXQ2nljlVewAoQl6AikJg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavjrv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 16:18:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfc092492eso2111643137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802725; x=1768407525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
        b=jUbKFJNEO3yz0epwM5trvLoUV+q4TSQdHUzBAaEzeCZ1wXJoazw5i3/OsUbjnc9wUs
         wGcBUhO0livMqp3aldHxMh6BvVbOKoaBcWjA3IF6HmjlmCmOlaXg8qYIFeB6VnnWvCMm
         XkpT0iIZ/1fv3jpi7+jxLGq6y8JmMUIUOTNGVkUEhZaAlZ1WU9nBqtGOwcZG2GYK0RXC
         nsx3GuPl1XxM5xjfOQDubCGsUfUrYwsk+kSB8tBevHCPF87e261sUs/bOaPShMnKGPjM
         sfX/Uf5s0pt/u5bjkGF+N+oaBGCpscGXpK8H3gnQ+GO0evbUqkl7SbwYuJoniA8ZE/1G
         CThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802725; x=1768407525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
        b=OVKH/6Ap7MoSazqafYa18SFBPJNLQN94Izcv4GPx6VjbyS5l68lfk5RiWgmiw3ee9m
         eeXQZzLfWV/GiX6mGFZdVlC8pK5xtitcUMPUWiDRdO8VyIvSQ8lDcCUXHrL4NkAHITwT
         xUFBjamoD431+cZhgYoHY4Nwbg/bbZOobsNcJbuKWRFleyoRcCn8FY3Vu5SU3f3v9ohN
         gMtYKpa64Z5dH7LNPoVzrw2uoIn+/gOqxV42HqY2K4+hBtEwCqVvHn9zOJki3uijMkJE
         M4nPtpnGbw1Z1q0XF2c5OXv21NCrX7jJ2feopdt4A8mjxKOMKz9CHi/Jfx33mZlt/GHQ
         22aw==
X-Forwarded-Encrypted: i=1; AJvYcCXMtjz5FIaQrRWJrXwtJSa1/W+OyQ/7Om/wk0ui7vWp4iuEzNkDFSFRMFUfsi3aBeqgNzmPl3vEDRg4C9CNMWMy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0i2WFMMTzqzupoRpsaIpN48x2eSUHmdpXrWEckiI8rPk4EqyG
	a5uoPvBXeTghvyCE2CsL1DzRtpTU8zvFP6TSzFKpkssVJAhzBbB++0d8gLCG6oQLYdbi42NclAE
	fa7ohHkoIaLHNA/MTXVQ4ekNZj2ysQv247gUz0BAXg4/unJ6MS6ENhUqsQQDVeasQO4L5viIR3a
	0APw==
X-Gm-Gg: AY/fxX5lrvNShF5b9pYh+CKfXYnBA/mNpl8CssYyV2k/OhYuaG8fsKvhvPn5ahw1WCm
	IO8XpDXVMQ+XwyyLgNY29Nrw13X0q90TaX+wIlbr9dsjnE1TLEkSZ+ddb7Kflh17uFheWPbV2oD
	/KMV94YqKGJ7yH7ZghnRw7F/SAvh9fsMSuuvrihn8LenAO6eeQUFTn8sSds9KkSleNRnPqdZhrm
	rWwzGGw0EfoeY1aUhFjJhHtkkN6h6yVt+8g9KjdIBLiOPZ8neSq0eUtywaKJOYZ3ktARlOIgthE
	n29lR9nhpPvssgTRFMwlaSp+NUPY1zqV56V8DgYhe/hL1//f2qMVWy1jrpue7Rx/D8Rxcj0RSjz
	lm00oLQ0a1u1uWEbdjPLjf2cRGtGySVZEZ40IkBx1/oanYhU3lt++0XJtjUoHJlATf+Qmdqm6xb
	APOgR5fXoC617yBqJwhRstPQM=
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id ada2fe7eead31-5ecb694854bmr888633137.24.1767802724727;
        Wed, 07 Jan 2026 08:18:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHB5ZRn1QY/K6daz0KlPYsnYXAnz+5ET9h4x0F463Jjq+1VY5FCZCLE1JA9Bad2LVDmCS3+A==
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id ada2fe7eead31-5ecb694854bmr888602137.24.1767802723486;
        Wed, 07 Jan 2026 08:18:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9c39sm12016941fa.23.2026.01.07.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:18:42 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 11/11] clk: qcom: Add support for GPUCC and GXCLK for
 Kaanapali
Message-ID: <lsvn2xjz6zxefs772tg26jg2cvfohbjcetrlxfn7mtq6ag5aig@ep6ofq4mrfrh>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfXwLbgKYCN/4Kw
 TiDi1js+oYubztRPAKujwOZCeM+rMV2L/JG1Qm0bzPKyiVLoZY10SdSkRxCuOmnzs+oNHc4SqpQ
 KIbxEYGdr/jaIpwE5sACQdCh25L3ZDdWVfVE2iYktSb7FKBE2y7ZOrJdZeyehAOs4x7GDe5sfBq
 d5KMY7xUfBHMAS/g14NP/n1hs+JECEFezimAZ2TMDgL49RrmLMw2m3bMowXhmNvgxXaz1xA1Jey
 lVKVUuDq7yQr0fUm+B8gKsAJm921GFMEgWhlKJSB0wMuF1KbAJqskNewODrNB515EA9l5Nwlih8
 2z4TUDXJgiVZgI2MoROt+pEdgS6YCVwHilAMavVRZdo2cEb8lJZ6rAj9kIbOwF9NIlB5Fw7Xgt7
 Pzo4l84huC/fg+jwL0oEoiQ+bYXsAftjaZ5IYq7M8IQWjyK04+BgfTvEVVZwCGFacaYi+11lRN+
 3GhBvNRZC28ZVqgJDmg==
X-Proofpoint-ORIG-GUID: qmtzA2kycx3L_5n9ZBIwDZRNJPsqZSsw
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e8765 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: qmtzA2kycx3L_5n9ZBIwDZRNJPsqZSsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_081847_152472_E7E5C03E 
X-CRM114-Status: GOOD (  17.45  )
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

On Wed, Jan 07, 2026 at 03:13:14PM +0530, Taniya Das wrote:
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-kaanapali.c    | 482 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++
>  4 files changed, 568 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

