Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C3CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=211TaafuVdmwmFpTWX2T7r+JSbXlFt0Mtw+hMPa5lqU=; b=VzC8r/9chqWiT7awpKx8518u5J
	NhTw7EsdA1CZEpoCL7i5xiO2rIDBXRWvgvAcOvcm7fyYI6I2RRuz0uP4bFAbT0Zrxm4EVF5f0valK
	dme6ffLel0U4BzsWMy22ZrnSz7gYYP71D/c0M2D0PL9RwwuRW6pmMytQUXoHBCJ0rsRkrcwriZMj2
	Sci42jWWIUdIq0Xkk3HAmAuZOp6HhuaXTXorBFcoI2cHo3xCA7ZNiICHX5pgKlo00zB4yItwVX9TY
	EpelI1okJbfQ1TXzH84HNGI0SOhHSIMJ9+F76wcTN+unyDXRzUrJT51prI2DXZ6/RKi1/porp+HMv
	CNE02d6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzyl-00000008Eeu-1P3e;
	Fri, 12 Sep 2025 09:22:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzyj-00000008Ede-0dcJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:22:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C8DIqx025757
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	211TaafuVdmwmFpTWX2T7r+JSbXlFt0Mtw+hMPa5lqU=; b=psmAV4uhJDui1mD2
	TpCjvU8MQQJRkxDuw3yqKkng4nptAa5x/7xUSHj6EX1X6oUbpT8FF28zsrmre7yu
	6p/Fp2rav/iYRUYCqDi++eNdmU0cYLSY3LSWJ+tX3FS0MmKDSL8p4IePtThsrg/z
	Ac7+4k4XpROaSNMzt9ybKtn3X8B783KyfS5kAUKtMZPEDpMpPdotPDoiRuFREgPa
	pg9//ykOut1X5Rjq7PwNqZFRjrYipChc66NfW+GoX/UZm+8We35j13Jt+hH62Gtl
	F6u0m5V5mD8j29L+7+62Pb1B5wvt2owSxXuoK0JQQiSo9icMMzJ7VUQ0QyT0iZD5
	YEREwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj12xkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:21:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b77ed74e90so847071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668919; x=1758273719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=211TaafuVdmwmFpTWX2T7r+JSbXlFt0Mtw+hMPa5lqU=;
        b=tKoIHMaCtTBgx+0EmiCqijLcGl/IGjI2zl0XuphoGxgpUfRAJ9xhtBppRZHXkKF9cC
         Z0oj6R3iX2GKCW7z6xotwGpoEvJxd2ja78qzK7KOEty1F43xvSc5f/jBEitFUiaePc4S
         jwEj3guTv+vCT4152aX98fmdSBiP0qGiavkHy+RuxiPBkNL/7RM67Obc95KRfugCVbGv
         UFfrEZ5Dr9wAI4NKLAjflNSlH9poFzz45eMJU3TW9OydOXDIe9X/exUpZagup3LEClK8
         60Zl0Dipr1GhbyZkQyIjc+BU9B9D4Xe8YWLEiXBrxQ9SORUgX8kDE1TGj5Ns356MYEWG
         fMHw==
X-Forwarded-Encrypted: i=1; AJvYcCV9CnRRes5AHBM09XHOnpOhaFnpyMA3zc0hgf4yHK/4KObrJgQFySzvxisJhPQMzgb0DKsPAtVZddD2XIyE/Q0z@lists.infradead.org
X-Gm-Message-State: AOJu0YylZkeaBjb9VTFyl4lyvdIfSSYhoMtT3l+cI2fkkwimqbRtm2EJ
	RhONe5WBmCkQm/4MFmUzHFDXPRU2ZyKxlHCIMKEqcdZmDnzssP2T27r3SPlhJmO/FuJu+fm81Tz
	BryEe4FGbyvZl2kL1LH3Pk61WNyOqygvrClQo4s8NgNKcA3g+NDz8CQB4jnZwmwoWTQ27+ulg8m
	0v2A==
X-Gm-Gg: ASbGncsgMdH86dog/B5NUtW9CFkayLiygS9oDA7DeqeDGiBsTd7DP5HHCp6tJZwvTtC
	jNpMYUz5WalLqXqg+v5j6IX6S3u4w91DrUF+sjj04/x+IaSd5HcN7Cj3+N7NVPpc59Kx0e1aFlM
	lKDP8hDlPtpmlCkqrQeRJBm2iBNQOLn4TwONob30grANdZQ5j7HoGxtOvRjNH7rMEzrUwgCPYEt
	bLWYlFEJkgtfFv1zdNpUIazsQm/ikdtF0YvhtiB/caet9MwwiYcKcXM67W+utUHDbSrPaQGTtoX
	gvt6fnDSRhpWghiZpvji13Q6K6BVy36SmWkpxu+VBR8Nnl4WViQ8ZLwWF1GHiBqYrm59QYQ3FGK
	zX517hTSqw3EQ4R3+La69hg==
X-Received: by 2002:a05:622a:91:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b77cfcdec6mr20253721cf.2.1757668919065;
        Fri, 12 Sep 2025 02:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3j5cbbw2xXdC7Iuoclxovs03WKjCh8mVblR4EhINwYFg0atoGoM3n750wMhgvxAjL7lHSQ==
X-Received: by 2002:a05:622a:91:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b77cfcdec6mr20253621cf.2.1757668918594;
        Fri, 12 Sep 2025 02:21:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f2098sm337290866b.74.2025.09.12.02.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:21:58 -0700 (PDT)
Message-ID: <d293a11b-155d-45d3-bafc-00c2f90e8c43@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 11:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
 <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
 <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
 <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
 <2951b362-c3c1-4608-8534-4d25b089f927@oss.qualcomm.com>
 <52714c33-5bd7-4ca5-bf1d-c89318c77746@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52714c33-5bd7-4ca5-bf1d-c89318c77746@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZBvfxjrEMV9Xr1Qyj_YLf1Ue06F4GFk0
X-Proofpoint-GUID: ZBvfxjrEMV9Xr1Qyj_YLf1Ue06F4GFk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXz2HJ4zTJKCL7
 jovx/ikxZRlNYCqjDZuSIuElyxGLlF7KaWCSqykKCWO/vgf7kdqxkJL1QaZx3pGtzKnh8xsKbsz
 DhJ/JfYAnm70bk0InJyaeDf7zWf8ZAKq+S/WVm8hwSXMOtsjtofdS6rV+EeUXSyoBQugZp4JKLl
 cgNaAX+q6znObZ6e+zTsixohh+IZQPvKqr1fPtRCPEr4J9iEW3PcArD2iYjiZ5Sxgnt0nb/KXfD
 8DNZOuVwrQLKlpXFkHqbLwBfVPO8vBkmn8lmm1uh1TLQi5VIHSTkTlve2hkP3KKIXK2628n7lkI
 llowYWYDI7++8hJ+gFDxpc0NnUlaizu4qU1Kf3qKFgJcw1W7ipJ2Bqv2c90qb1nGUbqKN6zLH0Y
 4Dv9Kgjl
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3e637 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=UDPjpuflI1CVcGcpNKsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_022201_325345_BFB4C652 
X-CRM114-Status: GOOD (  16.05  )
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

On 9/12/25 11:17 AM, Krzysztof Kozlowski wrote:
> On 12/09/2025 11:13, Konrad Dybcio wrote:
>> On 9/12/25 11:13 AM, Konrad Dybcio wrote:
>>> On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
>>>> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>>>>> The Networking Subsystem (NSS) clock controller acts as both a clock
>>>>> provider and an interconnect provider. The #interconnect-cells property
>>>>> is mandatory in the Device Tree Source (DTS) to ensure that client
>>>>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>>>>> the NSS ICC provider.
>>>>>
>>>>> Although this property is already present in the NSS CC node of the DTS
>>>>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>>>>> omitted from the list of required properties in the bindings documentation.
>>>>> Adding this as a required property is not expected to break the ABI for
>>>>> currently supported SoC.
>>>>>
>>>>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>>>>> binding requirements for interconnect providers.
>>>>
>>>> DT bindings do not require interconnect-cells, so that's not a correct
>>>> reason. Drop them from required properties.
>>>
>>> "Mark #interconnect-cells as required to allow consuming the provided
>>> interconnect endpoints"?
>>
>> "which are in turn necessary for the SoC to function"
> 
> If this never worked and code was buggy, never booted, was sent
> incomplete and in junk state, then sure. Say like that. :)
> 
> But I have a feeling code was working okayish...

If Linux is unaware of resources, it can't turn them off/on, so it was
only working courtesy of the previous boot stages messing with them.

Konrad

