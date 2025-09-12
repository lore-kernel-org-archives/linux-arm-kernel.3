Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715E7CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDiPEDL++Yv4djZtWlpbz56GxaADR2O4WCwvyOpamYU=; b=JFcxW3NXXXNH4+nge+snyIdc/L
	dW5qhZq24FhDHcTTlF+WBlwDcg3o6ecPgcFS3Q3jeG0r2BdSYE/7Y3d0WED6NJV+TYojXv5kSSB0L
	guufh/QyCTSPEiv7NLPL1MlJJfOnPLcN9+gG1+XXHOIVjFBrP7cdIBEy8IrN0rWuLlcvG2G1tMYhw
	A55xGAUX/5MB9VoTte0pFJ17vbDiXE0R436gR+9Qn+fVtGUH6QGnwOdaKXK5vcuQ1Uy21Naiigkbi
	17t8wxsoPUKwTSeMhhgxj8HQSOfrChD7Bj6DXHfNLFt4M3tNADLsrF9YLa97PEdJVa19b0qO7Ufsv
	Am4SSGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzqS-00000008AWE-2qld;
	Fri, 12 Sep 2025 09:13:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzqP-00000008AVV-2RgQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:13:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7kwcY026249
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDiPEDL++Yv4djZtWlpbz56GxaADR2O4WCwvyOpamYU=; b=BKeLjFtbduWu7Ive
	CbrRzBEaoBA1le6BT4DOqVACa8hsMxH9wluEwDjN9Ly9hefgGvqHBCnIAaG92Pbv
	ynWdyWss2Lb4K4dFfNk6lBGIA2q08QjPBbY7oqG2jJFMhRYqvB6/14MVSiVbOzIj
	YJCpAOZD59dMc26aS4cnR+X/p9WtoMw1TWPO6GAU3mLYd1iEGYCX0pDp2eVzdR2X
	WSHZaJkzXmtvh6dzFjYkZffQpgWxSVWzUnOzskDcFwrVIFNDACr9xgidnfVEJAma
	WYi5L2CdKJDhn7ysnaMC1qY8lCXwsvNB59bNfAj1bhRO+EOVBAI02NRbA9RPjjnd
	uxLnWA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h5y65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:13:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f92a6936so5347221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668404; x=1758273204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDiPEDL++Yv4djZtWlpbz56GxaADR2O4WCwvyOpamYU=;
        b=XyuMi6deQkxMp33JzQTagX9WAe4C+DBawSp1+eQPv7+SI+L/yEhcRZuwYrid59UuuP
         P6gtK53Kg5CzcnQxXZwkX/mp4eFmmQv8aa7kYLQgct0YVJ/DAyKZeQrGqilFX3K7PHbS
         btiVRKDFKOnqs6P/SNtW2uRbxLtw7xZQ4J3/oTzhEPi14dW0MZQGJiEnIXxrop1uY7ZP
         rRy0EWHREwmGiY2hLMH2Um2j7JhrXTx/E4KxcHp0Tx5s6V4EFylWzKZ+vjznUAxmq46I
         uLJvsq9avmxGC/sOxBmJW6cMaP7JLXUO5U+ORqMAxi0Xsv2lIWTYpxTXNWUe4uJHg5i+
         oQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCU/EFfIZBAgI+suQac+jBEsQKNOXG6vSpDrXW7q8wkxA4GyDuuhJlXYTxaRJtSx8SD3bwSJMiQBeBGtJlkTYJI7@lists.infradead.org
X-Gm-Message-State: AOJu0YxQPmzub1hulV01SKEAc1RIFikOGwpCopkw29IFZ8Wgpzz82Fmn
	kWNL1BXr5oCIApiRl1U2rfMErK71N8BZ7QRkogXnGsTrm4DMpM5Lo8jkuotJhI2bvLL+jtZNzlK
	tId0hkbofGY+H9i0l8Xiw+oghIJsJV1LTzR6DGS1d2FmH7PY06yjbKq/Hpm/qbi2igj0CmXTbKp
	D4Tw==
X-Gm-Gg: ASbGnctLJxRvQvq4W0PQ8klkF6h5ot6AnGXbHUkPXZEEEftcNKQ7x48Xthziptz6lbH
	KKpQfCtPv/kSEAFfOcmceU4fLGKkL0ZXk3cmuOr/q1oJ1CALBpgKC+YlthxZFHIzZY0FKHnl+8F
	sYZWopdD24uQY+0MYWdIWqVG/B+PLZdSNxzM7dkI2rHjkvRC8oyMT8ka9ncwn3R2siYBu6lEWTZ
	mtmghztztyJiL9sianOpvMkOOnpmVKgFikHl6esTvRNToLJVDyGiDo5o5h7AtUQb1BU7+0T/2DO
	bnyr8rb9Ervw9DfKiagplRAEWch07Xt+LxZSfm3+ALg+4XayBWET9WVl1wIP0s4H60urET31AYN
	QKxv2Rwr8SxVp7fRltmJxhQ==
X-Received: by 2002:a05:622a:60f:b0:4b7:7be4:177f with SMTP id d75a77b69052e-4b77d117d96mr18898491cf.9.1757668403475;
        Fri, 12 Sep 2025 02:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLYpKy55N9vEYWMRWrsZVRaWYcZIKuUasFnYD9vP/tGHxW/XvgJ003K96eFQ0cx+Ci2827tA==
X-Received: by 2002:a05:622a:60f:b0:4b7:7be4:177f with SMTP id d75a77b69052e-4b77d117d96mr18898091cf.9.1757668402925;
        Fri, 12 Sep 2025 02:13:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c28f190fsm159416366b.39.2025.09.12.02.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:13:22 -0700 (PDT)
Message-ID: <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 11:13:18 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0T0FEmKwMS8nsOzauQFNGVgmXKZatTcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX3eURfjcb+3Xb
 9QlppU6EeDtNWzjWlb4FmdfrFUj1zKggA2AH6CSOO8fevSc4HepM9atT/N3eZOKyd0gKPSOgBuY
 e2Oqr9R9wwpU85C5Iyu1H9hVgW87xuMGbuyICtVoF1BTVNGzTUUbIoTOcQtEiVDfbcGllY4MnhG
 bRJwWTIvpfOx2pAsSQE0NsfAHk7UCcOVJ4SW32ehwZwZ1KppBi3i5tsdq1PFIOGokEN5BW5g98z
 kz98qwaToDPKfP2f/0DLEReNatJp7QIEZ48bSCNgAgChnoRhop/qvQi5Pvqzfvw8RHuO0c3585c
 sWpBXIHGYR8Bx75mrQdMjkHwdUUboGZewXAkMFxbUshNiDzj+Kn45O3PQ+vcpvIxl4oULZ18CMM
 MjfpYLi4
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3e435 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q-zjNaZJJLQrxVh-NlMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 0T0FEmKwMS8nsOzauQFNGVgmXKZatTcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_021325_631920_C5CD4D3B 
X-CRM114-Status: GOOD (  14.36  )
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

On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>> The Networking Subsystem (NSS) clock controller acts as both a clock
>> provider and an interconnect provider. The #interconnect-cells property
>> is mandatory in the Device Tree Source (DTS) to ensure that client
>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>> the NSS ICC provider.
>>
>> Although this property is already present in the NSS CC node of the DTS
>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>> omitted from the list of required properties in the bindings documentation.
>> Adding this as a required property is not expected to break the ABI for
>> currently supported SoC.
>>
>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>> binding requirements for interconnect providers.
> 
> DT bindings do not require interconnect-cells, so that's not a correct
> reason. Drop them from required properties.

"Mark #interconnect-cells as required to allow consuming the provided
interconnect endpoints"?

Konrad

