Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD3CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9+3e9dP2WaVs0y05qgMULMfCunUKyox0pXutflnw2s=; b=1qoxArvDh5rOycRRP35NaEqIiG
	lcZdTDswJ4TDJpiiZPjgajVEe1TJHj/BCY07cNZNIxHrUSyNTvOdPdQhf1XXpghBblwEDfJqVijN+
	JJ4J4Xh53mCO7RvOfUG5SiG4wE8PQMfMzEaIkF8BXxyRQQQTEi89bFfPSEBA5TvIFloeAVD/QeSP3
	cZZV7n0XOsuHfP/GUmaczgA6WJIH1gOaecpeBXjt2oWeKcO+BOo8GAZxYauZvjTbdfN0xP1XTbjOK
	AA+NTwmwEer6yPJxXn3qe07t9sKCBGAh34NHZPyM5KBmwIPkWKXk1C7wbdCoaRCkzN8SyJpWzOLOV
	dB8HCOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTS0-00000000pwk-0ZIa;
	Tue, 02 Sep 2025 16:01:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPrQ-0000000H8nR-06Ol
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:11:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BOBaW010115
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 12:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9+3e9dP2WaVs0y05qgMULMfCunUKyox0pXutflnw2s=; b=eeyr4qBskZ6+frZT
	07ReQadFBKOtqTEhsmyQ9kul7fEYeJO+8J+mQQrnwuO9rQRVpNFrYaAe64uu/GEo
	6/5vGMmjfknMejSA6PujLNvCS6EFRzRGKZqestEKJJa/sn9048M+hHwnRTOFHwAy
	E6Er00oehkoLqYqQ7+xhusvQpk9CZjTw2AxrXLBpj7XC57NlJtCG3EUpc+wzZGWl
	UvM1H/10mMCF6qEEBcDTql2UJQtV8v4MUJ0si0QCTMQcphEJy8Egtbsj8tmbJyh0
	ZGoavm0dRVgWfvUM70fAqplEaWxM/mMs1p5punMdgb1qB9AIRCyAf0tLumVPfaFP
	sw1wtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfpv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 12:11:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32eddd8a6so5584161cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 05:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815098; x=1757419898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9+3e9dP2WaVs0y05qgMULMfCunUKyox0pXutflnw2s=;
        b=PIDd9wKu1sojazCMKx+IewijO6ICP5qHjmg/YcoFokGJyGVrosumHCn4CtwFFMbA+A
         6aefgo2y+ov+srQ3qU1a8iFmMD1/2e1Qqc2JcSKwNLvwf6LCRnkYZDdRgqqXlypadHG4
         QPptcIcWieJVxN2pnNAtZLKgwotdhjFA+3c1fqrJbFm26Hy84Mmi4ufZp93Qr53RsxrN
         wNWC/6WV++0ubaJPGlSM4e3IcgcGXrcMB41LZfUoHzevyu7H+NQDC854Se/SoBRpf42q
         6Vm0rV0OlegUtmA1bTYM996KZTbz0hcAPLyoOyLtDh3WktwQ7N6X/lHpeJgoD2LyAaJv
         2lUA==
X-Forwarded-Encrypted: i=1; AJvYcCV3fPyYWnPIG4NcKfKG6z6Ue2aWrC2aPQan/7ww3xSh3FeuUz0an8Xy+mNP15c3EVdPDMpzcF0O39j8cZ6iMEpz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ELcyOsIJaDT59IUj4UFdGW1+O+2WTdeETJWaR5lWWHWpRCJx
	glKSE7g9jePvYy8avrfCePCBzFYx+m+zpjewFr1oHuZ0CGF4USzyZ2nOx9+FxDRd+89+9x4cqQa
	l2ew4uztiVMxWAp0G9G9eQSOSTBvZpmHLTO7Ew7PjvBMLxJ6Jp+95FPdMq32zj47A3pzG8VEoSY
	uFtw==
X-Gm-Gg: ASbGnct2yCO2OmXhQI57SGlJf0wYAiYuwTz12rCnkxQeD9a8CulGdooevW+DfKW0Vi1
	sAIk8GWtol5MzyGSSvF0r1vzSTvUvIeKWDuCx9xKtQ++yJFLRP/seQMttULmQnepICLhRvX/XAp
	x03hZnNLyQLbkMJY/2O/HhiDcSnfi2K+KzFYWDL1NX3uRVbF1JNfXl1+gMNwP7fbZSqGcitYFVb
	tuKxa6+DoEetZVFanmTflmEWh4C9EmRTZ+BP05jc2ZDENVEh8I7ZWs3GcHzMvnd7dKVwE1PNRM5
	jI2NWV4SJGKx3DGW5+Z5v6pvqcKukGTsbT3IqU0+bJt4+oizJ/0u3vL0I7Qb4sTa2/S9od7Cgb1
	F8y/SK/hulFWSdovzEMOUXA==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr114042861cf.7.1756815098022;
        Tue, 02 Sep 2025 05:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwW4G4jjkaUKtXkdS+GHMSUK5ZRdAh64PysqQIkVPG7KSVbGILFSKErYbYiYkdMuTYCelzhw==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr114042341cf.7.1756815097447;
        Tue, 02 Sep 2025 05:11:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-affc2fac683sm873825266b.83.2025.09.02.05.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:11:36 -0700 (PDT)
Message-ID: <84c48543-815c-44fe-9334-ec1f688e9639@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] clk: qcom: gcc-ipq5424: Add gpll0_out_aux clock
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-5-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-5-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6defa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xy1T5CxqftMPibTtt60A:9 a=QEXdDO2ut3YA:10 a=jh1YyD438LUA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jE3kDK7p5Vzhll5ph_KHqQFNE5588t0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX3+kPNrx0iijM
 o1D5KmtIVqxpUxZw7yMMcpFwPpTfw3uwh5fxHzO2Mv8nWB9BFctsuwwTIwjGw0G9izTAjKmXJN4
 To3Kx/UdXta53xbs9Vefdpba6YjqO/0FKkl+hsVMLy0c9SxnINguDerlG43lg8Mls0U8Ol/aj7z
 8jXzk9DOtgMYrHcIrGueXtYbxiCW7FPnWeXlPWL9ZqVd04GN9AdZwVm/zLWlzy+6B3JCa151FhH
 qIEMq66HetXsMSArac25wgCRknmquMruKOmZ3QbX/gI8gLLzaMjSYNAoASI5HS7dq3UOw+sfHeR
 ZIv8WUKkF4z6Pxh0Zh119mI5ldFp5vQjS7f9W8neu26sWQwRPVP3hU9n2wjJ7xhQYuUE2mGUhgo
 A8iWZmz8
X-Proofpoint-ORIG-GUID: jE3kDK7p5Vzhll5ph_KHqQFNE5588t0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051140_188015_06C068D8 
X-CRM114-Status: GOOD (  11.27  )
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

On 8/28/25 12:32 PM, Luo Jie wrote:
> The clock gpll0_out_aux acts as the parent clock for some of the NSS
> (Network Subsystem) clocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

