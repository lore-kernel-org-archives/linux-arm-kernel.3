Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C7AFF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=; b=T6eg6kQ02P/0BNKivDaTTGGLl5
	eW5a6F54cAN1RDDx57UjNbh4eR0jWQepULPTETUqOlk9rvR50l+mczRVmvW8XhyhnhDPOO5cndE0S
	1TDCSWKGcJ9upAXh9ZOuNS+q9OhRqwrn5le5Rj5zHfLLNt/fKg1INQlTwClTKYGCfx6kZ0ijwBVFj
	iWXpICc2sXT2rb4zRZ6SFXGus76+o6CuQ2203Cjji2tcNZROu+XSd+zemGDSfoA+d8hTCHwofwiLx
	m3B+juFvvZbEJRYEQ0qNbth6gsWSNBGAeVzArPtHzdn7TVSZZ4HT3WuIArQOAZa+AOo5kiDVs5ul/
	Yg4PTogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W3Q-0000000CkFX-09cY;
	Tue, 31 Mar 2026 10:10:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W3N-0000000CkEJ-1LZJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:10:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jt7k2049398
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=; b=pvG+2BobqzBs0TOi
	aYw1IjEyVY0cM3/yP62t3d/lGzz5EFXojW6zGq/5YmszC80MMcWoOUSioxfD5dHt
	Q+ELIZEJhW++jEtY/uK7d9HYYVwmtKGvbSjiEu5WDLUuiZIRVWkbHYB7PYbNHdQf
	vhnai5uso2JMOmOV1vm/Zb8sh3QbMS+pInOdztpj34dH5Sg+wf6tLfIAsvGvCxke
	vu+2+142yDkoRA4cbkid3zrA9QhRz+z3ccrzDBf7/lC/j+0FgWWFUVqr9sPIPnxj
	aPFTruBp61q6y29mj1/qObXpWUMx1kYpEX9HFfcXVa2dj3cL4b/NtB8Bk78JopGX
	/w2wNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yrbj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:10:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfc644ff12so115948685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951831; x=1775556631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
        b=A1C+sHjnkPP6JptrYzq0oNWrwdViOuxGzDZcbCUt/Mc5BgM1v/b/sNHebkt35csD5H
         olZWAGAIep0ISWCpnJd+f6iTrFW0Iu2odEmrVAFQANjlTM4/VSK1N9Q2tRN2qdgT8kTT
         ujmfalJe4mcWxDuwgfiat5khh/4fEKI2JXEh4DJRsyQtjvmSVXwP7Zsmh1ooPbuNaw27
         0XtR74ydVQDc0/cMZ9X0D7rd+oqufRY+pFWUqEfiPNfrF5cP6tAd16O4lQd6LujSpA5D
         RgFNCoYJMBsh6TlnFT6lYMHZTNiMpfJp2nROYlESFG55h+jmjyvMBh6AKsF+x42/Cc//
         PKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951831; x=1775556631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
        b=mRhw2edAta2AizI66vlro/p63djg1zfTzknwXwTacOJ38xsAAPxVrep7dqCO06KqjT
         lHJ00ZK8sWoGcxTV+XTFXXUOQx+MvEau0AGHBtDLXaHqVYzYuQfJNCUOSAy+XWSVZ4BO
         C8pa4kvZGCfE35AwExtvk4ygsqJffQbvKnsgvOBoX9zsBD8lZvRxGdvScKWw1cdfKcu6
         2Xh+tEYPlbxg7oT8ZBOufpAj1gKbpxBvnHLJxC7rUaO8MtVAS2HXFRakQIqlPVU7UDGn
         QSmejDO784gJgacjSwoXV9aqO3r0yQqXhWt5zU9/xaSG+vyLycFKBOmHo9LGN7gZSV5u
         7cGA==
X-Forwarded-Encrypted: i=1; AJvYcCW9T5kzL4j+Wq5gMn8F/8QcCSKGa7APmLQl4amvkV54e46eMVnge8DtbjMjFFjLNwH/Rm//wPy29zjymf0ke4xe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1A7yat3qfx0JEN1TZfVjY0bBqiMHjHnNeK+e83hKZgm27keuD
	6atiNgt0H/7euGaNWt0SILSaC2QJpgClMMWHUqZX3Ejx9pm2d2zVBk/Lx1aboYIc2V5rB3eUY3f
	BGj8lXDwUTE83Mn0ipt99q8aJoqnMPXvDqakfWyRJXHRaVsm0tJH36smi0JnvHg7V/2r5OHaJ6l
	9RYQ==
X-Gm-Gg: ATEYQzzDzHA54orcf/yW+7ylSCpVgZC6CXpgQ+Z2WxglhfbcTxTuuDS13O2Fihvf3b+
	GNEKqYLy/rSnPYn2xUvQ6Sb04BIimphOso3mBK380dzS0RcPi3ttHTJ5pmRz3dxEDWOuA4L4gDw
	3J7aZMXUVPo8JAbOE2K9STm6O5qpw4fVOwE1Utu1dlQQBfHEiwgijIQaBOxrUmv7DRTxrypTGLF
	/LA4y6aiw7/P/0smGecLFqnGI/K00eUbVmlrkG9HYDcGx9X/klWTlU8sT8IDLw0UNzkgoJhUyfq
	QwqgNTeaFdaeKKgsA+dnjW6Tu+VO717x2EHVBMLW8UoW+beunR0aKuwAdTbWqZ5StCaP2t4a2z2
	PVvLBdvgve8al78OFUcfIjvjuqbI93HifY9ae2l8darl7LO4OdVPOLwfCtEenu3M6On72PTyzlQ
	bxGio=
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr1476138785a.8.1774951831231;
        Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr1476134685a.8.1774951830813;
        Tue, 31 Mar 2026 03:10:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7276304fsm3447998a12.2.2026.03.31.03.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:10:29 -0700 (PDT)
Message-ID: <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
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
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5JEMjAiEYEBkBMqVUc9nTmtslt5G5KS9
X-Proofpoint-ORIG-GUID: 5JEMjAiEYEBkBMqVUc9nTmtslt5G5KS9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX8px47dTVE951
 2texDasF1GYzgaMTpAgQUHCHr9TcK+3FGPIl/ICE4FIt87VzrzP18TanLFcGgRWE9gkmrasvi19
 vzybpGA6lGfsp9x0r5PaI4D3i7BoOB1pPkWbqO5OQfbtPPdhCDadeaexkYYhbxqNo6qk3PqGwUG
 UY4ThfPpZf4n4NevVIsHFwSJphaQrkoqTWuBurcytO+u1cKBfVH1yqspkrzaWN1JN7WjAtX22eN
 N0BbfaFWZ5avBRYkNoLw0w4sOipUvL3wgmvVfCGJrhGhcb8Ha5z+IhgtlNePDF4+ZsisqzyI+lI
 XUNVkEbaUZ1Yg2pkTblMmd9M9oAdqv0gpdOy91QcI+6H/Vu16mlYqqyiT2hzxcWZ+fh7LyifuXu
 y4HGzZP/UNIgR+8Ji7rCZfC1C3jRnErVRBuCzSis5DeCwVlTSuJpMyKM0RPT9l7XrlEupLcfUh2
 3TuefnXzIYvsuhmVKBQ==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cb9d97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fArkNfqvCtmK_1YDpdcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031033_480455_B3BF0DF6 
X-CRM114-Status: GOOD (  16.04  )
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

On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 11:33, Konrad Dybcio wrote:
>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>> and is not modified: neither by the driver defining it nor by common.c
>>> code using it.
>>>
>>> Make it const for code safety and code readability.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> --- a/drivers/clk/qcom/common.h
>>> +++ b/drivers/clk/qcom/common.h
>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>  	size_t num_icc_hws;
>>>  	unsigned int icc_first_node_id;
>>>  	bool use_rpm;
>>> -	struct qcom_cc_driver_data *driver_data;
>>> +	const struct qcom_cc_driver_data *driver_data;
>>
>> This can be a const ptr to const data, even
> 
> None of other elements in 'qcom_cc_desc' is const pointer, even though
> they also could. If doing this change, let's make it consistent - so
> shall all of them be const?

I thought about it, but then it turns out that videocc-sm8550.c has:

video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs

So we'd have to duplicate the entire struct

Konrad

