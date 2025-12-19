Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C223D78785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=; b=Nk/WIjM0QLZ/9+Ie4jDWAlWI2F
	0U6Ah6wfB+p3labi9JfYoO82+LbvulQtvW65lJop60pb6lptfaegdjyQFXCH3Rx4Yg3so54+u9OMi
	HoOEFvAYhI0OKe8a/22ExoFrbyMO3Z5vLGUV9u/ZNj18CFDetIA60pTutiY1hXrLSQeynOZV/8GZe
	y24jfSUHSb39+6UR8ZWaWXiA/9I/VNNRezSNcRWlrbpKlhRMqL9QYJf9sm9Pv7mEqAwXHy1GJK68n
	PaHhJKwouHvZTHD4zXm054BJxeiJaMlFtQEiWBYOZqHTBcobDufr9lxadZ3A4Cku5pV0Z4QByLoSH
	eI4+ORPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWblD-0000000ARqs-1m4F;
	Fri, 19 Dec 2025 14:47:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWblB-0000000ARqE-1QSY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:47:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBhsDO4154970
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=; b=flCd99WdIB49zGTc
	An1q1Hdk9XGhbN7baTxHWBodnU9IW1OuTO4Ri0dNVIe8iKl7+QAxfGOpvzuCuLEy
	xutFuVjEyrqw13VgdUvVFv/TcsBADcZ40zRSGu56JCSh58KPtaX2B8Zqa5wSJ3dT
	4QNz3wM7Ej+VVrSQg244rwJ0Vw048cNys4KRXIQjG6w5u1PeVzz6WSn8qLflojB1
	JlEIWc3hcVgEKy2lZwJ6hWJouHkUytIFY5KwMWr+GVd1+YiAaXWBg3lHj/+Ak8Zq
	+mBm1TjcUcEm0SnXRB7dSKGsjp+mO3B4MpXuM+moWgwrG0kO++3MO2VScncdD5Jh
	1Fgk+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cu0yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:47:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9f3eaae4bso54523585a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155631; x=1766760431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=;
        b=Wc1nF0pSAhiJOJ3HHK49w7EsTS0n5DC2Y4ew/+3E3fAFfJSZkvYUz/PusNktPtfluC
         J069hRL62yQN98QbGg1uLcgxSWDwINbEqfCkmKNrKZTmF+Qloiytwnz4E+Eq5LpfnUuQ
         IzzxjZAL/OsoDbCTySMCA3b/o2/e/bKe51z/0gRAR6vvJuy+UKAxZ4u5Zwsto/cYU3DF
         cZKjZNcfd9AbBds2b99pfuRRiL2lMIjj8fbo1H8uQhwUrDXm4WsU7rhIiKNLHISjz8Dw
         m2/kSjNGakWlsnXGkcfuzqYKNWSCeIVnHLxgvjX6cSJdHPFL3xdSsztmZgM7NQgk/dTU
         dzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155631; x=1766760431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=;
        b=dqvE9mChqPXg9S3WPbKfXNzSIYvcClNgh/WGNSzOynqzdAZU+yvdPl1JEfAzI1H2wA
         MuzOGUFEcar3G5JJExeDwfGO3N863yCX1I/DwVme8QpZ7Y+brbbroNHvpMsOVaGDlVy8
         New5P7l+esKfCfucbY7KPMniTxDCr27bbEHkMydspBK5/CBHVL6V/+mFHmdHlfy9K+Gh
         TQefTS+KrfpoBoLGMmF5huTyJXhz4VIl9nC95fUvkhLymYvXX5Cg0ZrRI2AUtviQXJg5
         9nUPrkQ5V0Ja+RYF5PiZkPZHs95wky0GFnKsoGzPY4Guvbewp46285Z4v67Y3CZ+9fCh
         WKuA==
X-Forwarded-Encrypted: i=1; AJvYcCXNK96YA9pHrmf+uz9iWgGzI9OKbf9lXdoHb27etI9LBOdF6MNFUViyaJFfqcz9DRj/YA3q1IULEt/lKAXgvdpw@lists.infradead.org
X-Gm-Message-State: AOJu0YzQKUGbP8o14wIsp3Eh1hm+GBRbn96FPchYif8u36MRNb2LqRpE
	oHH/V7maUM6V0+V06OikkYOyHpPsCRfspfq3xpg8dGlOvEGuQWtSBjOvipN0b6pcxmC42dFhoxj
	LMQszp06nJ0aMPplCiaTWPe358MyrZJsaREl80nFHiI7AX2qqLxxWQ1AY8hdF5kt4zrFAIh75m2
	6wBA==
X-Gm-Gg: AY/fxX5bKlmjOK9Gkha2qLPDjEyiliXDY/DGzD9EHn3Bg2qgMjVFBqWzbSfQ65KOxZ1
	mDIfsdbQB+CFTDOTgTyZmpxueyQlJtSivYsH7ybkTFWrbf0QkbhTYcPkbLAtwK7KlivzwvQ+9Ts
	x/pxH7oAq7HcSHwWMYPn5ACFJxCEgcEgPwKxEAmKjSKW1ZkcoiXWsmhFd38bwvwy0/UBERTFdi9
	m5AJcZLxRPy64J7MzcWw1vT7uLI2SjGAnsAUMr+CuG3tZQ7X/6PlH/bKndxUfcq1OT3qIe2+Goc
	fqqPq26gB4WHhzW3QzTiyYSIlmGNKgVFw11pMhrSrl6HW+4A5qlvqdhLkIm6NC8gbagxf5Ukx9R
	a2n2DvHDAxJcFs4r1OmmVICGsGYH+1XPm9PeckPUympGX2cKHJ2i6J1/MuJ4yaubkFQ==
X-Received: by 2002:a05:620a:2911:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c08fbbc3damr339356185a.11.1766155631507;
        Fri, 19 Dec 2025 06:47:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEve108+vsMnz6uQvHSLsQBNpRTIRrSI8CXrS6ViEziIGCv/1+cO2DfuCTVgDsGgQRx9jhOg==
X-Received: by 2002:a05:620a:2911:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c08fbbc3damr339351385a.11.1766155630854;
        Fri, 19 Dec 2025 06:47:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105b31esm2309173a12.13.2025.12.19.06.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 06:47:10 -0800 (PST)
Message-ID: <528cf0f7-6025-45de-a061-2d4f6fcc5bce@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iio: adc: qcom-spmi-rradc: Simplify with
 dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
 <20251219-iio-dev-err-probe-v1-3-bd0fbc83c8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-3-bd0fbc83c8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NRAR9QypXlEzR4PGmUPtmuSe_cYC_VcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfX87vtNahjSNiq
 MMIbRrnRwcP5illhxZAdqKjI/prjhto4n0Y0bgdJaILtlavinfNk/62xaJHeoyf4U8JRPs5JUBf
 FKXg+irZ12kqCpK1Hl7ef8NeNsTEQbEInL9j0lH7MFhAclsPm2I8gA4mHcRzjY59Q47LTQuoTTX
 wbhbE0xucMcRiCtFOfsE0NO8hEVMpFEeDQ2jGJJPdOiWTIUdssQeaxv7w5XCdxgor9Vg5yn7Fej
 u+NVxhMXb0QwyT325e39Ey0q+ed4POWyW+TKE0yHc73rv+J5juXxKLcnCMAOHJFA7UhGIO5wilx
 5v+PJw18qq5C0Pvp2kQvUvp9LnF/Xyhp9aE3zIJgUdAuBJHUKOlbbHij69jZM7dTcoUG8Jnhjap
 72N9weBfYOqNvEJKnXTOE6/JTd7E9kZmpn5POMf7Y68KXXuuFE7ZH9Ju9eUcO7+ZfjQKAJAX0XV
 Vke59nI7aOCJ963ePhw==
X-Proofpoint-ORIG-GUID: NRAR9QypXlEzR4PGmUPtmuSe_cYC_VcN
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69456570 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y9TzTQZwL3x8CsvTrzoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064713_396941_E34DB886 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

On 12/19/25 3:31 PM, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

