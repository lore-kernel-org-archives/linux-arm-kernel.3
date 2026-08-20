Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C47C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=; b=bvT7bnY8HAR1kpUt7S97p5JqkW
	xCKKrEqTzELd9MDUVFfEPLwwYSQr5u6VjcjhnYY6kId7kYTkTClwPPX1nzb69bp+VeYazBSAN3+P3
	sDGjDQ4sJ396iTU3wsTkR8SgHZCj8N9OreND2+Hl6r24AdzTdSTrVMB+n2cTwlS/pz2nRZp68URt4
	CGNSOSge5PvU/FwlIC35szjx4p6LEDaUMUFQ+nq23yWMGzka6wSo9cTal42F9rcYtNlwLAd1xTLdr
	towhtMcXKMmTkKdY7vTeJPawj4X31dgdrGwJOeL5YvpfQEBBIKcGHmI03I1ANo4aAgQ7SH17Q7h8M
	UFazwNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3lM-0000000BhoU-3xF4;
	Thu, 20 Aug 2026 14:29:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3lK-0000000Bhnf-2x6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:28:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7peJ3220289
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=; b=kjmLKskEBUQmMzCo
	ULVPSTmifuDAtsOPXPNau2mAkMMq/CFfk59EK13eRSTWl5mP9e3MykSpOwMpCB12
	/+shK29vSs33VH9zlxI6Ji67KsMByUCvdw0mTLiPsigQkPYhW3nQacDatVDptqPk
	sg7/2Zk4Z2Vu8u49EDaHBDtJxBTcuhoe39ihIEaBVCFcNtyJk66KcjoghTuUDimU
	bHaa3rgoRwkHC5K9ppKI3Y1JRR42qieFHuuV9d5XmYTM7b8ZtspjF+le3iyUoMXI
	kkN/7ji12+xnnt2zR9gJsw4BxQ3naFRGgMO0XQGdm1pDmD7UP+p2zSnsR+Vzw+Ja
	TJ4L+g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29hf88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:28:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90a602a4e6fso50188186d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236137; x=1787840937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=;
        b=LUAIW8TsfgUqigiaUC8EsWnYxT/kLVkO7N7/rQRf/YA9fiYV8oYoMcAPqocl7TFHOR
         tXsgXcD+aofu57DFoARrbmHVjU3upblYAncPcqHYMIM+YWJBQ11eItdAJzDjz/la9oeW
         HhIQz2z2xyDQ+phRdYWZ4Ubqmfj6BOlJjObGi8W/KSGKJPUTqGgdURZ47QW/EkEDXgxD
         U55qF31DoNEvravoMO5cmhfXQVgqjVhgyDw9YKvaTjZ4KK8COUULlgHvXkI4hwXXarRI
         sS2fi2YDSYQAioWY7lE6J5hkLN+UgxYL/9VDmqADqxLMjHjQeuVHDQL8Yxmpy+lKf8+7
         GEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236137; x=1787840937;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqoIbGSwu0oft6wj/dC2iCPrOJL6cx75PNkhcbpHMcU=;
        b=Ha/L1jVzWwmKNCiS1rpA4b5pM0fnbPBkGASW+1DbJBA5fH1ltTOYUn6ggMe6swcLW0
         YVv/BORMSOR59pVg9B3LqRYNc5Ol2cUoujfQHvh8FJAiS+IyZpLQKh3zTHZyWmI8Uj/D
         n3YwRiiFQe5j0TfPg9JwfACuLfjEUlZ2xVE5+MT8cAN4lhd6IAQMj/f7B+d4XOhGL6tK
         li+FlAJfYH+/hgYMYRkZcmjKNOO6myZDbesaBxd+7yI9OEtbE0wYEX/iHRbFj3ZBu8YF
         QX+Bxd+umMn1h0cjRES00JaRlSifMA1EAfU3RukQJjD/Xq5x39KDtg9FCYwgvmqWOcLK
         HmuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEwA4WsES9aFix/G7rJpuYrH0s3eZL1Mx94axRFbXy5OVOpK3SOZG1bKRYzc8UFARRvHDbeqZnmP0/oGg8GBgb@lists.infradead.org
X-Gm-Message-State: AOJu0YxOzmxvDggSfl6lxOZxkPXHh9Z/64h99bExyw5OBj++8EM6lOQM
	A6L93zWNI6MMPRwaOxpZp7LREOmldcxnQ7J0+XvZ1mIxBvJcxsBg+H7GuLZjmzWboVoZIXprich
	IAK5pIhdMHR8jvrrDOtSFjFxriU9j1Hj8yTi162tS/nWo9s6APPYbXTnN+cCnn4PlaRLzXIoBpi
	eb7FAneZmq9w==
X-Gm-Gg: AR+sD12Pz4dqHx4GKzodoPSqQXrP07UjYsMRPtJLSFpG6gxKRcT8XvvzgQcS3hvSjmK
	HbUtP98Rm3rbTDn4DHfdEI4z4YKvHHyy+W3aDRCtZxiHlKnf28vulgCLg5LFuUmk1tMOeLEqYwz
	a1m7RGaAI4agi0O2iMT8QvweY7Gt633DIJN9xrzmA5I8B/w487eoVW3QLTQN5eBblg/uYvQ2N4y
	U4ZlyoFF9VwX/Xa44lXgxXluJqkXBv4eGsD9kWVlozfTM3ZfJ+VZdLIRp9nDGALhYGVQYIQolUL
	emD0maOsXWXQMDoViTLSrdUOInJtDnnpmOP3ZxVRX1mWBjhSYlPlCAtgunaBbaM3daa9linNDJZ
	DK2cb/NhmQfD8Fb6rZl3KdYHOHmez
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1417190785a.15.1787236137208;
        Thu, 20 Aug 2026 07:28:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:92b:8a7c:f71e with SMTP id af79cd13be357-9371e219cedmr1417182485a.15.1787236136788;
        Thu, 20 Aug 2026 07:28:56 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2148727sm48532405e9.3.2026.08.20.07.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:28:55 -0700 (PDT)
Message-ID: <88e40f93-ae65-4eb0-827d-9c33c52bad24@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Thomas Turner <tturner@lineageos.org>,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9nIgjtBInkmTVnUaKJff3vI--pbCPfa3
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a870f2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EHrKs5ltxLiqmug07hMA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfXzus8FyVuBDUl
 lBqnD0xd3Coucmu6nCS8kftlnHUQZMUrDoGgcIOaEhEtUVltlLn1uSVwZpdTmUFoPcGcv4LDg8w
 ICp9exYzH+N8a3d5bIdupIYoqT1UIoQyA/t1rLQT5tqdmLqV6nrp+pJcd1R3Vu9ZszF5WFwgFYV
 fT7nBfSoFZslDcI1Q50saRc9Gk6q7mVdFmzitRO1UOfjjMBdIvxZCcys/DC5nGCXyHE2x/7eG0u
 5vxDZcConJs5S55EmMQLzKUcHRehI/SjeWQyQiN0eE1DJH1kntCQwylisa7j/yLR20kOFBa7YCP
 S424r2hNlfacHscMuAsNP7iwr15WECbW5CUx3+Y1i2xj1A0vlzSN+cWqqlJCHMl6N+x1vrQqg0m
 MOp/hH+HTTrKpbApCzcrddzfwwn6CCQEH+znUQ82qEEvRmaQi25dHNNAtDJK89JWWEH1PxngM0W
 JDLuwj6HfoN4M2OH+iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfX2uwtqEu9Q/X4
 Zlxs1NZ5i7L2XNA+KQsUJFo/cIiqJdLuyAYjW+SZi+TBw18oaryhMiIVvmtW+rVYB+q5vHNC4xs
 JQRcxhenasB1c3/I92SoMvwzcw1eSkY=
X-Proofpoint-GUID: 9nIgjtBInkmTVnUaKJff3vI--pbCPfa3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_072858_858718_0FC08780 
X-CRM114-Status: GOOD (  12.74  )
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

On 20/08/2026 16:23, Thomas Turner wrote:
> Hi all,
> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.
> 

Again: slow down.

Why does this appear under empty subject thread?

Best regards,
Krzysztof


