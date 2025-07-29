Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1004C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIz2sC5rEvjeL5lDn/RzFAavsZ2n0Q13ZJnx4oJFPBI=; b=jcqL4x6Xz/xbpZf8i34w8M0Qu2
	tWQ2/6iafxmD7DaWlJgmes4lHxWbko2uk0Ys9S0hAabaOsbfVjkzCr8mlnkNylYSVlRei/mCZBtOp
	lJzyEOKKwjdsUtssweuhTQS2cRDairTocjnoSz9AhDkp5C5fBdbhoGGHEvsO02MXOm17l+1Cq+LpA
	XKWhfqWJ7r1XJ0SX5Tyd9hSTRCpSWGawnXa6c9Ewf+Vr56JbpcWZcuNkR/E8BP87AQiF5/D0S32cV
	A1zb4orgqn0RvzMyBRV7rhbfJqwoCD+Bomhl9eAJ6L8zmspnc4Byf/3KII+1wcBaXlceCHRkBWZ15
	G1NbMkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkoZ-0000000Gr79-2vVc;
	Tue, 29 Jul 2025 13:56:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkm6-0000000GqpZ-3w2J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 13:53:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TA38hu016326
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 13:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uIz2sC5rEvjeL5lDn/RzFAavsZ2n0Q13ZJnx4oJFPBI=; b=f8uyGyDbhemwKOn8
	iFRaSRVt3n5zuPyusne6/n6UyImffomcNSmo7wRFQ8O+DHCdGM+s56Tybz2Yd5nt
	fXI/5YpxUJow8wXke+xRfygm4WEsrJC6wGzoEKdJ2svj1QOsoyXNbjoAw7ZpbGUs
	+psQp2QXMj0Ip7Txngg0jOc0jlN3NOTUcmCoh6qVlSdjgFMVWQ+ebEqvGRilmTci
	5jijlFQKSrlhVHEyBGHXV7ccxUA3odPaj23e+8nu4bVduvmWNqiUdlbu+4FZ2wT2
	Y2EQizrsFzP5FgrtW4JDMCwg7J9Vm13eR+ojDCuIE5DrKIJRan5oR6qGJv3qN1ix
	HZdDrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 486v6y0n6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 13:53:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e34ba64a9fso29117985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 06:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753797229; x=1754402029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIz2sC5rEvjeL5lDn/RzFAavsZ2n0Q13ZJnx4oJFPBI=;
        b=VtlT7v66mnhEsSh37mJ7b43vB05wMuUvMqEhGj8tU83msY9GyyEW1zav18+Ln78r91
         HosXmC9QrBlbLdmTxpB+gcFj5JM9naOrYkhwWmSXqFfOh9NcMW1hwTynEp3las0tpwsf
         eAYI2uWo/QpBqDY7tqdbJ+aHXuiOAg4NShSeEG7f7amFxQVzXe3m8z96UcgUjwKDoHYA
         2nX2PToddHUhTZuctt8Io+kVL72i44unPSTVgknQe5KkfZmxyB8+tfy+n8lRY8N1apln
         pKeHQllzPl3/J07NNc9ijz/SJKuFvPsF6vFcHcJlvY35+klg+/+PY4wi2cZBc7aH3ZLc
         d95A==
X-Forwarded-Encrypted: i=1; AJvYcCUrO65ZbZ7FBz9gYOTesVCdoSQnlGRtgRJ88tkJ48MBHxesi1LSH+oPClOU+YKrQ3QRFFWyXG+wIhHRCDkDzZWm@lists.infradead.org
X-Gm-Message-State: AOJu0YxX7fmpu8wGMi6UOX91iPJFBK/rIpTX0BN/Qoya372xQx2xwasg
	7N+KExcgSqhyt1tRj7qSo3rbmliGCdGGqxY24EW1PnGYF6RAu9iJScqZie5B93qfLi9+B7mzoet
	FKPg2R0oTLOgxTVJRTm+1tLcx7M1Q3cVFRE5m9JoKnMbu+BnK9liJFOXFzqUSPVJ8N8/AHMS9Ug
	jrXA==
X-Gm-Gg: ASbGncv8LquA9iVw53+4jTJS1EdiR4TOd5mWTAl2g2VqDYkDfuvyH9z/lEBKVTDn2kx
	lrOjBbT+QNFVpdDffQkpPI4CQCghOrnpcY3B0Ma2FYQAt6Gljbt6XtokW4/pwe/Tz28iLW8u3c5
	e78lQneGZua4L8QF/saJNeiG10aMOVxEfud/8krBaKUM10XOPBKcqG1KvKkvySXUP2iorgZkmCa
	8CxqyNTPGsaRM7vCASNaW76DzwbQPlWpTtel0fZ+EP1yXEw8/4PHt6St0zlYgM/IoNPhabMIdW4
	VG3uiHJryY5dFHJ3GhumSnfATPrcw7bIprS2fiPE8o0S1kqCT+T9Rut6DJ1kuYmjFbMMXvKCBpx
	RfFnFEnsZJ+Ced5sr0g==
X-Received: by 2002:a05:620a:4502:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e66d73f600mr4096085a.9.1753797228627;
        Tue, 29 Jul 2025 06:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2rZ50HIoP3F9/NtATSvU3RTcoTLz7GUYh9uMTOF98nuj610nPOwpQK2hdrfHtttMfHeiLQw==
X-Received: by 2002:a05:620a:4502:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e66d73f600mr4093185a.9.1753797228016;
        Tue, 29 Jul 2025 06:53:48 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6156591fe7bsm1187250a12.51.2025.07.29.06.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:53:47 -0700 (PDT)
Message-ID: <c67d7d8c-ae39-420f-b48b-d7454deb1fc9@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: ipq9574: Rename NSS CC
 source clocks to drop rate
To: Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-5-f149dc461212@quicinc.com>
 <20250710225412.GA25762-robh@kernel.org>
 <93082ccd-40d2-4a6b-a526-c118c1730a45@oss.qualcomm.com>
 <2f37c7e7-b07b-47c7-904b-5756c4cf5887@quicinc.com>
 <a383041e-7b70-4ffd-ae15-2412b2f83770@oss.qualcomm.com>
 <830f3989-d1ac-4b7c-8888-397452fe0abe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <830f3989-d1ac-4b7c-8888-397452fe0abe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNyBTYWx0ZWRfX/YRbT0QbOkZq
 CWvDjC8kJk8FGcOOeg8U49nOJFp8stYnFXBr+d1A106IOAuSqKrGf01RBElYOGTbVAzJULLKnRp
 LgGZhXq5fBTIsjc5rNg/dlKldLexa3cYSEbKRZMJmeGyl4IXwD7i+R+hFQ44gIkJWp79njAms6j
 Up5njdY1RAHDI+cYam82xSItyLBFfy8ohm4G+wZ5vW0/BIDoG511cGt1YjNdd5vQUhH32/2A8sH
 8Uhw571WERrfgxq94zelxzpM3GY8zDzbFahJHEaNgzOjWr+/xzumTtL5ImEO/HgtZJegN7WTo+D
 D55LWRUVdjWhizrDVjYwCmh36NPwOJk1EA9dGeIKGftnawrJk+XfjtfMYA2qVZYLbinROt2IXih
 ubuQXDkeWWWzBgdPX+zfHEMJnwP0N9wL3ze96d627Vh4qIJwC3UturQcbKbt4WugSP7pZZtO
X-Proofpoint-GUID: APo9vNusgyJK9APjO0Ue9WwrS4aff1M3
X-Proofpoint-ORIG-GUID: APo9vNusgyJK9APjO0Ue9WwrS4aff1M3
X-Authority-Analysis: v=2.4 cv=QYlmvtbv c=1 sm=1 tr=0 ts=6888d26e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=RShGOoz45MAMUC7vXQcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_065350_981193_4ECBE20B 
X-CRM114-Status: GOOD (  27.01  )
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

On 7/18/25 5:51 PM, Luo Jie wrote:
> 
> 
> On 7/18/2025 5:28 PM, Konrad Dybcio wrote:
>> On 7/18/25 11:12 AM, Luo Jie wrote:
>>>
>>>
>>> On 7/11/2025 8:15 PM, Konrad Dybcio wrote:
>>>> On 7/11/25 12:54 AM, Rob Herring wrote:
>>>>> On Thu, Jul 10, 2025 at 08:28:13PM +0800, Luo Jie wrote:
>>>>>> Drop the clock rate suffix from the NSS Clock Controller clock names for
>>>>>> PPE and NSS clocks. A generic name allows for easier extension of support
>>>>>> to additional SoCs that utilize same hardware design.
>>>>>
>>>>> This is an ABI change. You must state that here and provide a reason the
>>>>> change is okay (assuming it is). Otherwise, you are stuck with the name
>>>>> even if not optimal.
>>>>
>>>> The reason here seems to be simplifying the YAML.. which is not a good
>>>> reason really..
>>>>
>>>> I would instead suggest keeping the clocks list as-is for ipq9574 (this
>>>> existing case), whereas improving it for any new additions
>>>>
>>>> Konrad
>>>
>>> Thanks Rob and Konrad for the comments.
>>>
>>> "nss_1200" and "nss" refer to the same clock pin on different SoC.
>>> As per Krzystof's previous comment on V2, including the frequency
>>> as a suffix in the clock name is not required, since only the
>>> frequencies vary across different IPQ SoCs, while the source clock
>>> pins for 'PPE' and 'NSS' clocks are the same. Hence this ABI change
>>> was deemed necessary.
>>>
>>> By removing the frequency suffix, the device tree bindings becomes
>>> more flexible and easier to extend for supporting new hardware
>>> variants in the future.
>>>
>>> Impact due to this ABI change: The NSS clock controller node is only
>>> enabled for the IPQ9574 DTS. In this patch series, the corresponding
>>> DTS changes for IPQ9574 are also included to align with this ABI
>>> change.
>>
>> The point of an ABI is to keep exposing the same interface without
>> any change requirements, i.e. if a customer ships the DT from
>> torvalds/master in firmware and is not willing to update it, they
>> can no longer update the kernel without a workaround.
>>
>>> Please let me know if further clarification or adjustments are needed.
>>
>> What we're asking for is that you don't alter the name on the
>> existing platform, but use a no-suffix version for the ones you
>> introduce going forward
>>
>> i.e. (pseudo-YAML)
>>
>> if:
>>    properties:
>>      compatible:
>>        - const: qcom,ipq9574-nsscc
>> then:
>>    properties:
>>      clock-names:
>>        items:
>>          - clockname_1200
>> else:
>>    properties:
>>      clock-names:
>>        items:
>>          - clockname # no suffix
>>
>> Konrad
> 
> We had adopted this proposal in version 2 previously, but as noted in
> the discussion linked below, Krzysztof had suggested to avoid using the
> clock rate in the clock names when defining the constraints for them.
> However I do agree that we should keep the interface for IPQ9574
> unchanged and instead use a generic clock name to support the newer
> SoCs.
> 
> https://lore.kernel.org/all/20250701-optimistic-esoteric-swallow-d93fc6@krzk-bin/
> 
> Request Krzysztof to provide his comments as well, on whether we can
> follow your suggested approach to avoid breaking ABI for IPQ9574.

Krzysztof, should the bindings be improved-through-breaking, or should
there simply be a new YAML with un-suffixed entries, where new platforms
would be added down the line?

Konrad

