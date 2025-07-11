Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2B7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=4o5tufmUdMXOwD2VEXUgMfLIMP
	pbwH9ftaGwm+5G6tWd97yD/l+J3/ylptEjvT4PeKypVUWxalTVgTcp33uGH0U4RNrQimnMq5zzlPz
	xQlCrICIZRVRfFuGsAvMnZAdV5EZeKaTWSHe8+kL4ibDOGly0gj3snt8ZUv6e6Tjbv8fvKAVwTh/g
	EsaDJDNpuq6Dey8nUDv2nBwQ1HqH9x8fDvIQgZITF4Dpybc7q/5DqMvbhDSDzPHGDUGcWxo4mVgjn
	6q5N32xapgWkJqGzI+gVR907rPydZlgwkRprFp76NlZYZJy3t0K+DKpevJEGa0Sjsd3YrrA7COIf/
	GkhPnK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBgF-0000000EZOs-1fz5;
	Fri, 11 Jul 2025 11:12:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAYu-0000000EPoY-37yW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 10:01:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X9gE003861
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=NgVA7m81R1L9A0Ki
	QNp4kFDi3N8DvO3qx9RAcYjs1jtC9/B+avlbDc1rtVhy9F3stierm1OKhJXjyvGW
	YdJRQ9sJZI2dq1voO32H+V90S5DBNkGEzMB+xaAjR/XUQqiqXKUbmfFIb4pfvmVg
	addsweOBBLqrhC+UeeNjdbg6BndSLotgYWOKAXr9XGGsXN938CxJNVJZZLif9/67
	bTDai8X5rgEivv0G/Ddbk30UzPRe6GPhQK07mI7NvCLN/vavWRbSaFIQIrbwsqW6
	eGBhsOpspzm7+h66u4RlX5bUzXbU/874gi2Q1I2OiV3jDc5IUlMIMm7Q1MkP6jwn
	rNhUlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp07h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:01:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3ea727700so31170485a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228059; x=1752832859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=YTEEh4wD+JckJcslsU8tUgVeyTDVba8fOfu01O+K6JYxA56x+w8UQJaF3U7l7Qbp22
         gbS+tJOC/3F6gfaUy1UVw8HzU39vBkL/20FwyLcAEKZpUj6HiWjIQzMo88rYFFlrp/Us
         isQ69AO5lTvoJXmyYYWg4oxd/0AkLI7n9Mjnbnaln5ZZHDcLa0eqWjWinv87cNzhCCId
         9Xw7C+3XTHp6zKZmG/4eEZDo5Ke16g8jtV76UtUJN9yK6IJAJIzBpqbyHYqqiBiY4HXQ
         +5GEpFjfcJ2aF7wq2dt3BSsyeM3SQB4JJi806B6p6bBv6y4QdaIvFGBZEZmc0v34/FBY
         sGrg==
X-Forwarded-Encrypted: i=1; AJvYcCXJnLhUXgfrmMZVQJ4XVZCtsLTSRoG62X7fAckWnV3hH7nJOJTJDxhvrzSrQ3iU4IFtEWJGWRgKY8dOVHkVIHj0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc7FmzHw8C1E8E2gTTBqrsCw6JINkgXXeznnkd+F9bPeOOMo9h
	M1eO+wXvFRKi1qnAYr+TtTtCq20l2p28JGV/EDCdGgpzt/3tXzwcnSWAmx5L8LR+nnM3t2Qqqah
	MA/7eia4K8pofMwUdqhtmkZ7ycZOngGvnsXyF4rWphAS+DP4Ar+U5fsnPgk7S10M65oxUp70h61
	KFFg==
X-Gm-Gg: ASbGnctG8+JjTZoAwh42Pv1O8N8MbgN2hYlH+7mciOF4z9gy51Nlt2hFju18pjiB9Q0
	nuF8gFSOMfkdGdhw3rRQWyBuZdZocqua53C+/N3LsMvBYBi0WzAnGPHU4SCeOOISsUOn6tvyjni
	pF288q9kkiMTfZE5igJLsfdgDaR5C2DzNGWTs1Ut5DS78gMoZmmTfkra8uWioaXT2Zdfr6UGUpG
	3k6TWmxpmqBdeiX9dcLys0BQAyLSOoY/nBv87vTlH+eXWB7gf31dqlrgHPrJl36ZZ4MCdePf8q4
	TzwBJkDg0eRmxuu+KmiUZ0lIq2QYXsk/ZTjjhVx1fJIDwb08+FxPTGx1yofIqlxwdtdfSMPOro9
	A4jaB/RA/yyabb5ObPZHv
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7ddec077b97mr142429885a.12.1752228058091;
        Fri, 11 Jul 2025 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLY0/uyOhHuHX1X9pWT4ZRBIdqoYlueRYMn0zZIdfXxI0Ouch9sgLT86MrHZruF7j7b5jRXQ==
X-Received: by 2002:a05:620a:198d:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7ddec077b97mr142425885a.12.1752228057424;
        Fri, 11 Jul 2025 03:00:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645c3sm274825766b.99.2025.07.11.03.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:43 -0700 (PDT)
Message-ID: <ee4fb01e-4fc4-4082-be96-3be22e1769e3@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX7iFglEDGivea
 +QlMbDZHSovz8+FL7DZ+6Z06W5YbzS7sY5Kek83JTq9vJMsLMZgsSzURQfSpcC+mFaRmN4AOUEy
 7UJXhTQwOV2dvTYnXMjtXKPCu7gRuVlrkA8xbagx0sa4gWtSKtYNYXg+7mBr4ImCvpse7Mxx98Z
 6bk8Dlbn9dsxqEeGR8ZX8c/KEtOTbtb9qreUGbl/Fpv3JSQCnf9IIwXE01V9NwUnna0vLtp1h1X
 9k7aSWVL6SYKr92WRZ8vlG3BnSphoANTGDizvfhhNI++3bnQLllYyPO/cd5G65NcrgY5c+Ob3+h
 apdcBtHbL0St2mZUmpid0M80EwNkekIMHJcJwunSt5gszrg+w8UZNHX+JWZSV3YpMqNbW2jQaRQ
 qblphTZwZ7JiSh0jQxBjmdr8SGCXAe23FCLyDOQPw36kdXWoIktkkRKDqRtO+Fg8VTrdTw/M
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6870e0dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: edrIrab0NC9ZwhzwKWQmbTz2W6DT4eN8
X-Proofpoint-GUID: edrIrab0NC9ZwhzwKWQmbTz2W6DT4eN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=772 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_030100_790598_E90F9339 
X-CRM114-Status: GOOD (  11.88  )
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

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

