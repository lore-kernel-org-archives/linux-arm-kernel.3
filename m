Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCDBC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=; b=VwREEOZDAEZC6qIVW0bV9pn8B2
	fG0TGchVF5Qaf3eaAIzV8xhnxwilcDf/d2DU3HFcL7AqTbp0eFM45sAme0wrjlA9p3vF3KqjI5Dkb
	tMpOjpTdbR4dcOv21w1ipkUqYBl/Qoe6nmzTHqlcCiENvd53Xeu3u3C/Mr+lU87dt3XuzM3TlUGIa
	9f7k1p+7TKFE+FKGRqBLk/1rRoWaNtEso0jkEHyNMn2lolA72s4mnbe2wTe3WNPwWemKAa/6dcW/V
	YRdGhqr5alvOVgwc9U96Kp4xnTyvdJPz0WpSr0f7pDZ5eGS/q9vcHDz8e8R++FGbanHOm7h/YwlFt
	C+sKvD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Wv-0000000BgGM-0U7J;
	Thu, 20 Aug 2026 14:14:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Wt-0000000BgG1-0Krg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:14:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7iE93234851
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=; b=ZsES2lTPPLE/De7V
	vTI0zxRwv9ZzcgsOVJ1wJ/8Idm+WNFET8H5kSoA6jFiFt8Md1igBKGGKPf9xvPvE
	y8P7UR14S0URQp6bulHjj59+Mv1y/5Beh5SZkmPmTHJn716KAy/TKAuMQQKGKFTi
	rluQh5ldP/jbaXIu1z0C01pv9FUiTqr3Zj97rHIDBndEJETuMs/dNpv1H/8YjUQV
	LMuns1PLzIAAn7ecNpqnldGcK/Q4p/HqOuw9iP+7xr+LQ09GjYY8Gyx4j7ahRS6c
	KBVG5Diwc62ZfwjrC4ayVlDLwBGeco2rua1wOpu1LE12Y1K3Rh5bc0Jvr4ufevuu
	ThXU7A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv98tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:14:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so296312985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787235240; x=1787840040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=;
        b=jLb2PBgMFPYH4Qtbr/hj0TjgVceoOYBTq5jAROUxisY3qiXkueJemWDKK5AkLTJJE5
         Up6XQ0THLbS1v5wBYHIH2SNkE86iseHe3W5+vsLAPmE8p9Q1g2opTwSzifIMNUuLNQnW
         psftsixUWJEGAoBGpXk9zapU+L6+v244kjixrDxeaiu/rQW+A7CKNd8DTvKuXCxkrGFz
         whfoxY7N9BOdb0KNY/Vnh64O7FG/We/rn1y9EhghUKV2lOUqr/3F1LWIo50xwkdykvth
         OAIlIqgjk0RhqfwO3NxwTowmSAJgH+kIX7Dw3D+2ThRZTk/fDQrAqPm8dacG0YQQ6PM8
         LqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235240; x=1787840040;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ge7NAc26Zouy60hxL9/gFyna+mJcO/3xq3mdUNcdssw=;
        b=fSIJ8uIYm4QMiUZYJ0s5Hl77C0zbbOUK6wegBrNCHXEihAfTsUiYUHmJbG/Zn/E9pX
         XdQM3s5AwRjn5vU9WgR3gLkxf7qSrT//yMgaplsh547vGO+ZuF+Ta3rir9ejYiGuzJZ2
         +OPWVk7cf3pQrMgoccxoez51kYRlBHRbILcfuE3S85fAxZOHdgBeFFmCrb3llNbhqfX3
         Y8RZIbfthUJsnPO0LXnFzI1qrChvJJ5Z/SiaQ+bh4ZfjwB1tqqKvJj6yPGK1k2tUMwJ9
         51uaU+PfflFJoarOe3Qm62cnleVMPIIuTpuy4Yhy7EUxP5fRC9uxy0Z1//8PJMo8rG5a
         Rp2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpnLAw1PFdeT8FVhiWTV+HuXPN7pxMvWQ544tlk30aS+8OO0QAoGOoA7qfnelghetpKtWuz6cg1zIfJtBJ29TIf@lists.infradead.org
X-Gm-Message-State: AOJu0YwyGXqjFANvytUCDKOjQnSXM1It2fZ6oouQzbYHpOxfKY3zOmDV
	z+Qzqy3Otnuw7qTRBCBNLChkzWXbeJ0cyf1PNQpZci1PCQ99bpxNgPtrWdGQNzAlC7OGEVm+Hbx
	BLzs0F1/GxR/dmKsFLNvsKyU8NxwUxSEYfxYNVhdbS9fvvEy9v1jgr30fyglDsSqaV25jx/9U/+
	RB7Q==
X-Gm-Gg: AR+sD13yWuTmQeJnOAZSwbbA4rSXkqiuIWrsCxzFpE5BukqZwLdRpxZ3bpAOB6SJsWS
	Ee3qjIq75pQkRluwwDe5qv5uiPG+K8zlWByoEVN3QkRzpKVxGIqa5DCX6X3cMwSuuG+FKRcbWSj
	xIUSp7vLrdQwZa3rjDnq669FrDTdgVJC/CZJqDB6/poxBXLt5bJPuTafaqBaC7FRR1QkJRiKheN
	CC9yPqwKPuo1XawEPzHieOKOrFtnpA7/nGg2lN1FyKy67oZR2wH7BreyN7QryAkm3D7tOguTvF5
	5VO9UjeO0MTGTmlZm4058Gtq30v7RsVyBDkXikyfbodt32iMQ1rrh0A1EubJD3zDFzEv667r035
	krmxHb7QclsV0EpaazpZNlBieBbCF
X-Received: by 2002:a05:620a:4142:b0:936:a407:98bb with SMTP id af79cd13be357-9371e2034d5mr1107440285a.9.1787235240137;
        Thu, 20 Aug 2026 07:14:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:936:a407:98bb with SMTP id af79cd13be357-9371e2034d5mr1107430685a.9.1787235239623;
        Thu, 20 Aug 2026 07:13:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198cf2sm75328666b.40.2026.08.20.07.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:13:58 -0700 (PDT)
Message-ID: <609b191e-a670-42c0-94e0-22def353c84b@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos850: Add GPU/Mali Bifrost node
To: Thomas Turner <tturner@lineageos.org>, semen.protsenko@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        peter.griffin@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820133556.76300-1-tturner@lineageos.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260820133556.76300-1-tturner@lineageos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a870ba8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=IKBKkaEKMstryUwTzDIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwNiBTYWx0ZWRfX70l99ilNc7aR
 ebL7gVg+ZjhiYn9pIl08fo7+hMhkPtTONRAsp6HIKOfLTACY4VWYtQaoJN8QxrMUBu+O+dKJyxn
 1Ormrd3hZ/BzChH3l+BnaKpUNSHmBIzW/l+EmG+sWsoF0vKqGLlRvVdHz2HXuH1Wb7J8NC8ZSFK
 meZf2KF7i2P+VoJ3xKhLUecbW7p3SHkAycJ4B94bkXHx3/Vm1b5SguCPUHJYsdUmMFIB0eOuHmq
 XGVLfhttD9ZMBQwH6Bkd3foy3zQ0McUp2bp7C71uuBj5VGKhqXumyciBljrcCfpz61CR6ggZ5A4
 jZtckJfArTYQaX+TiUDK0uHZX/tYOCS9N+9APL/pEheIHNj1TPO4Wb3P51e/A2k+c5uX9j+z42s
 kGFjqj5ojmx0ZrvH70S+AYZ8ZTZ1qwXEayxoq3zPiRThd8mP058PXBfMEEu7LpAKDy9EWp/LmQI
 yXJPC+JSRIZ+/yMS/sA==
X-Proofpoint-GUID: yuQcFJtojW-W2MPv4W5dRu1iGabaVSoo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwNiBTYWx0ZWRfX5DB8upOF/pMi
 s1ujcr+PCpU3h2DVAr2OeOqVkMNvNFaQWv1ka3wTennlxkwwVuczB6rTnozZd48DKYDqn/4qYM+
 6WAbwbaT4U9Pt/Fai+GwxrV6z8Nk61Q=
X-Proofpoint-ORIG-GUID: yuQcFJtojW-W2MPv4W5dRu1iGabaVSoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_071403_260763_5DC06613 
X-CRM114-Status: GOOD (  11.42  )
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

On 20/08/2026 15:35, Thomas Turner wrote:
> This can provide basic GPU functionality for the Exynos850 platform.
> Tested on the SM-A217F device. Does not provide support for temperature

How? The node is disabled.

Please respond to actual comments you received before.

Also, you need to version your patches correctly. This is v2. You also
need changelog under ---.

Best regards,
Krzysztof


