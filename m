Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C357E81A31
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlPKEBv6IQ2bElkuTOfHR7LPZVbnNS4TJYo62QJXTrk=; b=qOd9J05xPE+944ECG+JUxjlVCf
	e0VmZeIg8bAUEyjY0wb9r0Hr0NC3c2YmhywtEhxl9KikSEZX4VeEf/ymV9grwlU85uwZVLwyu2+pJ
	hOAVabfbtCD6AD2Y/T4DcYd2p5CTiDpi7PVt7oewstCo4t87Aytxb5DVOdr71gyNKtZSwHaQRfEnF
	8P6Pq6jxmaYtYTLiNBBmp35GaN1p6fUy6zJE327lRAet+n33YJhUqWvU2BOEozXh1u3UlM4vTC65p
	603XIElPm8T19XGrYSE0ok/pH6/7WpihVZPju8uMt/UHFKf35TVwOxhVYgWxejKfoQV+fEMqrpaAd
	ZGNZ/acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs03S-00000006pp7-11NN;
	Mon, 16 Feb 2026 14:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs03P-00000006pnp-0yBi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 14:58:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8fwcX2802096
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 14:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TlPKEBv6IQ2bElkuTOfHR7LP
	ZVbnNS4TJYo62QJXTrk=; b=gDCUIQJHDvPmPLc2Qo8VfZ7mqC/TUf6wxVzRXB5A
	yS1HtSTB8Y3Tn4oLkg/37nM6zp93QE/WFRS+bJpBVlRVRkL+N67aafT0VS1TFrqe
	N7fgir1bkG2RMX1L7d3YPPTlt6I639iaI18YSxadXX/FO+OW7GEySUv2peuSEbFe
	+fV0xQzOXEbOqyXUMKUZsYFuXx1b4jFY4nqLv1nwhSJZIuJpmCCwnKXEyCKskjWj
	njdAjvHg17/MXVhHCQRboAhQP+K5Ji0OCy9pTIGZjkClHQQVViLRRyPo3eToEsG1
	ChClK87FopGK7H7uiuDw+wO2NL8kyh6O+gNuL4h2EEMHeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugwg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 14:58:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b6a5821so1772473885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771253905; x=1771858705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TlPKEBv6IQ2bElkuTOfHR7LPZVbnNS4TJYo62QJXTrk=;
        b=RbVYtDFSe4h2VepPcfXhioOW0/RIDnYlEbIkk7UbB6/3K9RxDZSwHJzCU00IpM3g50
         jAL0pCJtJTBiMkKXYiAUQNvitZxl+5jsOHJ6ADc9LscU5KiZGaHZFWTeq3fSORxBNZOH
         f5PGTuoHIsy904mEB7ZradLdDH/wrPIh6pKtSL1i0EpZChjZL+JqsNC2UQNXU23nrEHa
         G9SodAl86pgdvXPivwU56G5aWYQ6sSL5s7WRi/fe29JxJgPU70YeorVLCqQiqUHK9G5U
         ikLubWadskILrhHhLEvH/vmR95lqf5Z5JdzbU16aUjk6AOsfTCrg1wnc7eo6EHF35nP9
         Ou9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253905; x=1771858705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlPKEBv6IQ2bElkuTOfHR7LPZVbnNS4TJYo62QJXTrk=;
        b=iOej8Ww6TIqwsaSadjLeeI+GQS15HqjxXZa8c7zqMXi0cceMUimpqw36gHs8T6YOFT
         Il14A97CVL5A6GljcHcPV/fDK+HCesYwZrhl4b78vocdHFRVDUPowZaCCnyO4yLkhjHl
         TYkiqK58b/1/TkvWHxxxzKn6ivScR1+unLNxEuXNWvcET+EQFgTjGfkc5XddKujuCqsE
         1SeQb1bOfjJ6KjwAbFfqcwgAEC47ODYHPLdDwCbelBEefJwmhO942BR6QdA5qLqpgPU4
         MS6KUdIuzuohUsEppZizedmn7+xU49Cc+xYVN6xQadeMIOMXzsivOwlOC1HIRz+H+XyK
         RP0w==
X-Forwarded-Encrypted: i=1; AJvYcCXxP1dJh//HOeZXeECVD0O7yyFqr7Hp3nKrwfZXZJBnKhuw08V/dKfLofiJ/0pknZKKjPLFMyl3H7dHYvoaBWj0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+uyMmvBrdBeBiIk8CCfGMkaJmgtBZLhVWd7Jzo5tvX3H2Tu5Q
	M2mnvLurwdSU9yBMi4xyNp35cGzRaO121Ds6o1L5KSM8y0Uw7aUuMZiqv2y7w/aDqd1WKRHdOl+
	6EX0WBct2LvdBC3eualwsf5B70jTfi0jO2s9ZLWuJfW+N9p87JRaFbHjp3M65wlbYXCK+3cN0iA
	3qeg==
X-Gm-Gg: AZuq6aJFNZ+UlwMe7Yb5kOW3cU1me4HxdgJ0vKep7VOutJbSkX5rydIMat/OiDNbPBh
	i8GFWUp4L6jWsjM/GK/PLicBQzy6cZEEd0ZKUntgxRXUCgoAfwFrmwBkfnGcwSZ/kwliCJGG/jS
	O0dTrz4Kj1DUHdEjwD3frWBgiwkZpTeWuluTYvS9wpMpICz0RT85r5Qf1GzVGh3vtpHo6EHdZN2
	MvBEomAShmBkvFVc5dJ6RNyfoWjtC0lJfskX5GCW2/kq+IAvSK1SICEju506RTzhLqHc2fgnowo
	UUS6EvsbUJ41Acw253YDasUOxUlb3zAwLf8VRDsnEInO+hkxliScqnD8QYdFYMMmdxLlP7MjhwT
	D/4bObyUZHmi7l34JFIy/mAQOeHL8AMxMpSmD
X-Received: by 2002:a05:620a:4407:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cb423c2ea5mr1237439385a.40.1771253905465;
        Mon, 16 Feb 2026 06:58:25 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cb423c2ea5mr1237435585a.40.1771253904844;
        Mon, 16 Feb 2026 06:58:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abe3b3sm32479964f8f.18.2026.02.16.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:58:24 -0800 (PST)
Date: Mon, 16 Feb 2026 16:58:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
Message-ID: <5k5i7zpr7y2wa5o2odkfyafhoiqk3ch53mwxt24g5thft3htxf@zxz5u2hobcmp>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: Fwn1in2E7Bv9nNCAa7v_A3cWNWgN7i22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNyBTYWx0ZWRfXwwKi2MjpIXS6
 jiessUCY+ImwGl4Lm6uazMi8F4sbooNPAoi2xVFxMe+5KORd2GQFV/ipHdnW5ARZIKHl6CXgagt
 bmvJNK0/BOuZBUt9fFG7LbuSBVIuukfmRzVgf2b9uinhj/9xkaZ5bxdT4v18kknnicSYtpRUtk0
 d1B45HAlsCr9iF2LNxdSpKPJXAQ9I0oY/85biQx9Mlzeuev8Y6kBML6IkwcHLfKO3oIVJHErxbC
 zaUgdMTOmxJkRGHm83UjbZsrx94WZRubspEyYzihHCwX7S3YV1WwZAp8sZrXWPmAMxPSfJVVVce
 dU4wnlC84opzJ82w/SuCizFYWHgca2ycMmSSx7YZjuECu+xsK3CwPRcIMKPOaAWT8x+hi8J8nN4
 AE/4+xsQ97CqNXccngma5AAoswWcE2VBsvInlM6DXssG2Ent1dQ81LnEPzKeDX38DSvWbzU4I3n
 yumpU32JVcYoR4u7eUQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69933092 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=rQXAbXeZuVbgsyajZegA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Fwn1in2E7Bv9nNCAa7v_A3cWNWgN7i22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_065827_385027_793548B5 
X-CRM114-Status: GOOD (  10.64  )
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

On 26-02-16 12:04:16, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

