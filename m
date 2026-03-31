Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197E6FF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=; b=rIrL93t8DmUZINk8NrFn9ZgFB8
	oZyIjTsDiBeKXf1SOpHzRtiBYRT6cqhWfRiYVo6TiSX8kw0xpIvC5BBU3ZJqg6Kao8Br2Vk/Va/TN
	DhmZOqFxH1EVEuDeK+RCKXQp52c4bK04L0z6MxzG0fLrM5QLlH48y/0d50TKwjq6sTWaD+RnFW1EB
	e9ZCF/Zh34iMd35Cg+uwNdERxf9LdPkj0soVlRk9cK6805rRd5YJ2t+OpBBVd4xv0f2m3llwT+QVN
	PUOQ4V24OHvdU7VaNyxH4JyHU42CzHY3OZf8drIxcZln4jj5qbgAL8MDK0T1bjS0SqpYdSEvj/6Is
	WP0rmPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WMo-0000000CmvN-2ILi;
	Tue, 31 Mar 2026 10:30:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WMm-0000000Cmuq-29pp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:30:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9dZEj4053789
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=; b=KdVnZsdRtnR2gq7T
	lcelVAhTrgIH/shudawtLTooth+u06vUOSKHPaVWN7joo65ZrsQGXBO3xviSME5e
	OiGaJZwZ4BF8NJAS33zImqWlP6Blr5Z/CIEyF6vatsJsQ9wCAyQRb1eH3X6WRXO9
	bfQO7pGC0T7RhPCTgkjv9HTFg3D4FXPvw8tI4Qsb1+QJtTaoKD5y9AejZ8r2Uuzr
	Gdbseg2PE5aUXJ1wpfBSLR33U7dvFADz8kpkvlTGAeHq5U6feJQjCYB0GNvWX5O8
	rQLJ0Asv5QbDCjiysclgTbZk4PNe5ymtq+cZGzQbHqHq3gO0anNOvyhvvikjux6t
	UKOqHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3b3kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:30:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f59c9bd28so8056486d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953035; x=1775557835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
        b=dtR5BOTsBMRho1iu/7QYDckpArioy9BgoeV0nnXWswzpZRV8HpaZMWnkHudBHs+GAr
         M7M6ddOhAhkNWRzeuqI2Ukm82scJlRUpa4OpmJcNX0J++DYwnwkYQ7DNorfAtc0vzbml
         M0TCSk4Z0T7I7QZZoFQoiHKhRGGhHxLgp+yCFD1Ktu5X4NgnOhbgyHeyCagTRzBWp0jf
         +LlGNsKcMjnuDuhrTOZ+jhHC0+KiRlN2jt81oblzZhzxW83sXX0BTl1uyym+Wh3a9G8k
         WhxTA911akKjVem/JCuWZpCPUSq0l4otya7KEGMZpBON5n8EvnsgmMC7vmx6tDx48+3w
         hk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953035; x=1775557835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
        b=XjsUSFpGzbDwV2PhIBM+6LINPtz86nF7D8tD2tF1T8tCLUyP+1Uxa4+M8QA/JCjjTv
         ylt1Os6gkKgATSzyDI73GOuECwKi1/JUHdRwNjp0VhEofKO1LlWIrpCGdty2SHT41TwF
         yfAeXctC82fd1wk+5PuH+cwg25rmrwnnp9k8MGd1Hr6OMgczLnw47B3n8axVjD6dICul
         JrlXK/4Nvo+vOtXcisqo9gdUcKkJd1rBJOzJdip/dqr0DERY4PHA4f5Ju4WnIWs8aPym
         nWM1TqxPgZmTVdxX0glHBRY+6ADVMAWcc/0LOC8QouIMgp8lsqx3EHNHh2FvoPY+1e/t
         xi3A==
X-Forwarded-Encrypted: i=1; AJvYcCWjc8CPFH3k8sl4MtMowR6h6L5NHXpgtA5c7moj1DiYxhNo3pQh9DcTDEE+rFM9VUn9bm4gJX7U17U0AH695Wr5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7VaJvxtv1UNTF0UQRfIDjAueAyKJBGXvAv7KekKN8i/XFTlx3
	hBxFXRZMDDfgDTleUVaW03dihMpJGHvnMzaoqXio2vty2eoHinAc9x4NwOVyHDKaaE3mxTQ/EUf
	DqBQQhlCHxVX2r+xf9XRtH0yi3bbk9wfxlOpesf2dUAkv6bnuNZlQMQqu7yAa1Oj83L+s7QzXr6
	nMJQ==
X-Gm-Gg: ATEYQzwt583Pn46Hojb8tX876Awie1Os8OUV3RkHzPcGGtmRGLEOr7QEaNO71SowWIC
	RuvjhoHFTFRyacvsqqH+tDlxhnZWPUZj4No1ThpnEV1xgAIDKqvgIhsgh8p6z34ShjrGYZNuQNV
	BeOMJJIvWhI1gIG0OXhYtmYKyTmoWgY1LGdryAGYZIx553iCfkrRRcP/ltqDlisUx3qRMSTsA//
	q/KvtdF3VHbWYsDcCdAvjh4i2uhA245G/M++wfI28X6BD5yHDO9HuMn42HALbmRYz6aAPjpcBH7
	NfkqrfgVYPKCxK4LDxm/weQPxJR8j99d7JRSmV8yfl8Wnk2RPOz2hxEnlu73nLLObK4+XsbnE4V
	q+ZuRLKmFnQgxtj591n25oeBTQsLKqZxY0SM4NE5hIk3itJNF8UX1yldzanm5GaMrXd8Y6LjaCJ
	MvW8c=
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr178613756d6.5.1774953035265;
        Tue, 31 Mar 2026 03:30:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr178613206d6.5.1774953034772;
        Tue, 31 Mar 2026 03:30:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1dda44sm385697166b.43.2026.03.31.03.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:30:33 -0700 (PDT)
Message-ID: <2a444667-b3f5-4992-aabc-6e7bb1b1cff8@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cba24c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Opsg_zMjOw_MMP9tyQsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: RuRD_EhRGiSjo1zK2Tr79IVyQnhPlxBN
X-Proofpoint-GUID: RuRD_EhRGiSjo1zK2Tr79IVyQnhPlxBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMSBTYWx0ZWRfXzfskW+v3zrHj
 5t9KqqNRT/Y3ocVBKLIcEJK5IutL0efKzzFOvTU5R6dHQN+mq1PWJejVpWmdqjWLoGT3tTj+tT8
 cyBDcwEkl2siaNG1zE5mf7TcRvQXp4VRE9bHkOrQMCvZXJahB33HsRK5wecaIV5xcm7YIXcPXny
 BNfsieV+pdi36xL9Comyw5WCSTYrr9Du4g3/Uo3lehzOSkRF3r7Aq6IDqJzMe7Y0paMYHFaiWhY
 xZmc9GkHuQbS0mYtbrFm4Ah8BY+8Hc5Gg0xanJr6fDr3BprQTGShL4gI88Xvzc1GKAJkksTGSnL
 80kJ/8injDDXSJLDx7HzqbFE+YiU26J8Gj0aA+xebJrtji881ZTUJvxbEQVQdUKuKceMEuMk0rt
 TFXhuDHqQG+rJR6BD/kJw61ouN+59Z/qt97e8YK6GDTnN517t+woXHKoO6lisjpb0PuzZCcGT/2
 84cTSzd4zC4MA3hRWKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_033036_559309_6312066D 
X-CRM114-Status: GOOD (  11.58  )
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

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

