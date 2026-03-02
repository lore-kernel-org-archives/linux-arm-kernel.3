Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003ADE9B35E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=; b=ccXx2fDoZAu8ktm+G9jI1EpBts
	RXSEL1hrZfV1podBG02atBE6GDunGe35x7vfhuJG4MFjkXvOlerDMBA/+Cz9hcTVTPXH64elYBrrf
	vGlau7+YrApfAt8ShjB8Y7CrZHSY2UFqSiaAQJsK7JDPe95GJmWdaxkFK12i4n1DqLFkISwc/WlyP
	SSMbWocu7MD60h7Cp6gxj47ohYRmV1wtOPKQIVjwGs2amy9mpJwWdl/bmPAk6qyFqBtajhriVka5b
	s/eBwywN/tMeNvjpgK6HJGF4rtAbIDH5k7u5B4KqQuW6Tz+o+ZaxdYZrf7YXpLOlbfn3HsswAa3WD
	G2RClcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx14e-0000000Cm10-293j;
	Mon, 02 Mar 2026 11:04:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx14Z-0000000Cm0I-1Rx1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:04:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K2Zo782712
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 11:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=; b=QZ1dpez4bJDficoR
	RhQ9Sb/0BsBhf+KyrowiYM+XlrAOe2p/WLjMTACPYW71uXsW40RAYZZB1MR9l699
	mXIkuW8bfNzsD8h4gp6cCs+ncFNcv4WBJ2hwhhw2zyzQKIEWGYPqsQPzXeDCQuF8
	HOl7r4ZtYbWH2Wv5Lkghjsf8jULz7jGNdYzRxnCsMfsk3uxQ0pN8ZezxOwnxo9H7
	jq0lgHH54EB2K+6YnKHFODRpiyb5cCmpI5Z2Sxe9W/PlC5BEPS984sQY+yjmq5OK
	KG+UdUyVsSm1D8/trBuXUnih4vxfdvgNh1f26Rh1q740PjEhg8I7fThUYiM+f6cX
	97pAkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00c76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 11:04:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb399597fbso332268985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449461; x=1773054261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
        b=GectZLBFpYxw1Gr4A3NFmKlJrhtO/FHXgRLHMqvBmnY+DZ0PHcH9xtqZlCxY7MCj1r
         OlqZGvZ1q62XqUxcxo3fbZC6LiaGC0bym9TrNzs79dtA74SS9BYZlw/SQobbeUmzKitv
         Q1aP5z+KDPj+yX5FN92v6DCLBptg/Ity2b5TxrKC2NmbuuXz6QyIq04v0HINxPP2u09i
         QvCRat+asbxg5RsuxUbBAxt5dDVGitIk2IjqqNOa4DTjG8mfYOxeYJGtm+5AET59RqqK
         BQnxuk72w6zxPytgF5KLIY2YxTtxMvYzmAcgsFVqCCHl2aIZ1mfZxKlNYpotylWZQ2fd
         27Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449461; x=1773054261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
        b=Fq7BzVWvNO21PyA82ATqeOmLx160qAZ4qbi0p9QIli65/03ackVoQLjNr4lAtZa/ar
         VLjG3ZwNzuI1zaqqO/YM0heQcaDyjrg2dSuK4pCXmMKzDXfk3sq3CXQP6JW3c/Ywt0Dj
         AbYR2/jynx4bvfv+1gap7HO6sfyuvSxAy8pYMuzKRMGhEaLQx9ViSC757sEECzM7URED
         HzHaUhkpKU4Q+XsbofaROL2Ia/ztNSbHEMTfRIZVdDJfnS8WAJVhVK6jssI3gq2dUa4M
         O4vsPmvfJsz174VNSWqXZvaUOJ360J/65uUOlGlLogN6QonZtl+ZSe3XidVXZJCdVdpQ
         TRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLTs7Iuo6qu5D7M/pgn1+U1tyLSCp5tCpF2VfSiRdjB+GrRqKX9neNYqkroJJcHbA1ZOGiXCZhHkZ7516o71Gl@lists.infradead.org
X-Gm-Message-State: AOJu0YzttErlCbNPN1iOtJ1o2anHyy5rlcr2QvmHd9zkRYerRQ+0yNvi
	jHiHRuxUBUazumtDNbt+Y0TJBl1wlsiesXhIAlNdNiZy0HtkDRpTmEU7jLgJvlqEpvB9G2NyF0d
	n5zUDsKv1GoxxaIQMxs8KPQYufNpvCOYqTc3JXXorr5v+iYXk+dBSItwcijjwlNba43GNgqTaKd
	RvqA==
X-Gm-Gg: ATEYQzxGPpj0vXErSLrNHV/Vd8Xr3BT6IelCr7LpFpUit4DpHzJaC72y7HPZOsevcI5
	tPmlDt1gb4VsBhn3H/x0rMAX8GNogqL7jMDKJZeJ2a0Ldx21Gn39hBSFV/rzBQ48dHSxju15OiK
	HM6cfEgCx/pNZh6YVjYX/MWN2B1zIGmj1pcD3tKmz89Xv5UBBXydbrydAN9tI2+Sjb0v4G0v/Lw
	0LNcwgoo6Mk5u2GPRtXi21pade2Mp4p8EGi0eWHxZkmpf5ohgloccSUwaYyelhzM9YoiEQHc1Jj
	vDQkuzHeUyqMWjWuI9DGHANji97ZBOchoV6tzbbOnTZrDwcAUIrOaNmLt5Gd/zFf+R8ZrrzMZn3
	0iDqX3DGqDBpbxKyK87WBmcYDnfFMP8IeIbTj2t3R1ziz+EtFsA1wbEEnKnlofoyQqvzmnFn8j8
	JIqPk=
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1176611785a.7.1772449461131;
        Mon, 02 Mar 2026 03:04:21 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1176608885a.7.1772449460723;
        Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9385836a84sm318934466b.59.2026.03.02.03.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Message-ID: <5d3694c6-57e7-4943-8dbb-41334086e8ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] Input: stmfts - add optional reset GPIO support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a56eb5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=bmle8qjEDyfOUcEunfUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MCBTYWx0ZWRfX3VIbrY2XTeL3
 FE1T1eTfCA6jRXgz+xKFK7WGiMLaH6mg1zWcrPaI0/HVRwFYW1OeJvm8e0NGx7u0vmgraxvAQVQ
 RFQT2hjxKTh6wvSwLl6t2t00PhMfExJrRF32PXZ0HfgZySyF9aN4PVbb/UGXshI0LKW4CWFD0BF
 wFQwoiBPO8eAqhEgcOCgW4sKpk5tWmS0Po/PnvU49qjyWoMSZkdX+mrNfN6BKtFMmHO9B6IRpcM
 +8sD1LoS5G5IwoF6Cci6mbgJb5XXPcK5gs9uknDFtnSc7t+23u2HVZq1UkQqWbN+bCpj0oTysDJ
 VHQS9X5QwgfjKNLzAvxzNd+VXeBFG84qIUUJtJBHdqRnMOOEvkQ87Py1ShFiyOZTeYNhUN/cuzM
 hrfbEwbbdsoafoYGsHN5L8D5IiWyEquAhhVvdNDfMruRHrr4wxLwluzyXh4D9rVn6S/A/pYtoxg
 QXwzCjjm6i7q23UwLiA==
X-Proofpoint-GUID: xxuOH08IdA1KOwMfAUfFsoH2uzLJ97Jf
X-Proofpoint-ORIG-GUID: xxuOH08IdA1KOwMfAUfFsoH2uzLJ97Jf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_030423_506024_E48546B8 
X-CRM114-Status: GOOD (  13.29  )
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

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add support for an optional "reset-gpios" property. If present, the
> driver drives the reset line high at probe time and releases it during
> power-on, after the regulators have been enabled.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						    GPIOD_OUT_HIGH);

Are you really sure the reset is active-high?

Konrad

