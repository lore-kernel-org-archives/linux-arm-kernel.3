Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FE6CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zEnPzFVE8t3bC1R9rCg0zuwA6Ldkx+mgUvoY3rTxV0=; b=bJhOiptwKA/LSPQ0MAWt6ueR4E
	9ijVkTd97/FkhDv91SqAoOX+N3TZXex4PFDBRKfJd3f7V13JgKqZDAKms5jeT2vPQ+XsN8nwqACe2
	H0oB688v/DdmrvkUQ+i8bgvkLR3GoO7to4NZTPP964Z8RQloO6te0uMKj2k5rG4swMhSY07lpsk6C
	3t9Ic1P9QUQljXwMtBNoLKMWE1HYgw0uLzssxD8JAbcA92tgIc8WyYe2pTn7L7VF1NMXIlSTcivbq
	ID/HIGMcyX0YQYrazSzjG0zBxrpGNXoRbdfpiDihGrt18HIQ6ylzMuUHPCyNDEQmFEnPcEYGqIvY1
	f+JDQMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdd6-0000000284h-2NCe;
	Thu, 11 Sep 2025 09:30:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdd3-0000000283U-3uym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:30:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8VNIe002780
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zEnPzFVE8t3bC1R9rCg0zuwA6Ldkx+mgUvoY3rTxV0=; b=BN8DNZeu+8SuM/Zt
	ubyblklFV4TBsBtcvSlCa3YYL/fKjTtbAxMGIY5EGTx98snDFeQEvNV1uv+fr6U6
	pE7DVv6JRC2n/LgbwTInJ+92NMjiuXmneW+76eFUXw9ogHh4ZxtJ5HK8x4mps8bh
	z/Eq8BX0gkk/M9GHq/c7nuswTXXPKJLyREDUlChhXfgfDzEwz66IP6M5Odndo1n4
	IUws9MYf/twsG1VPSMRdjczq2R0TijdGzDMTsS0L+ni+YF/8JI6riJ5Xc2mj4QIn
	fvotVWT3gBJJ9nI96oy7ujVnaRFK5z+zValRjkgZmEccmDDM3+jWm62mUOfjSP49
	XoKbKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493tyxr64q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:30:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-812c3483afaso16786385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583008; x=1758187808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zEnPzFVE8t3bC1R9rCg0zuwA6Ldkx+mgUvoY3rTxV0=;
        b=hwmdtZvw5j0gkoQ+Iz16nKXEPAD5NN/KRlUeFFg9ixiPBgjF2IfhQLOzPXZ0acaF5r
         5tJDe6mhFtNcTpw8MIYoNsh2dDKSeLH0yhA6TaK3gbI6xXnoODcajF7u4zzkEetK5xfL
         Ct9m/J/KKw0Cbek1XS0n1wx+cUZxL93ZZdfg0T1FnIsRDU7uMSLsKxllih8cGaltEh5S
         4UWkwnGKCyzN2o7ggj9dtCfeiZSWHNJ1dMhLHpJKmWpvyQdze0qj7mNWnONTzgBTr6ef
         Eq31+EgpFYW3fCslSuEHYvRs4FcT8BVFoqcOufh8p4mgssxx5dta+Gcx7bQgwgnGrzAu
         qcow==
X-Forwarded-Encrypted: i=1; AJvYcCXkYzkOoIVbs1dqy6ZP6fsQ+1xoYwgHuF8qrXrrfR/7ZCvpH5gxLzmVW1VR6eYf0VV0VAi22IXJaKfcy/mTG9Hr@lists.infradead.org
X-Gm-Message-State: AOJu0YzoB0YZmUsfOp99qPiHk0qcMEg1siIj7G3JF4UEn3O88KdDVDFx
	yM+fiP29JzPnag5s70PKTbRl77Ryp+Z40EtwgYef062mYomE5YGVCzqvvaRqmI7b8xJ6AJ3XoI6
	kBtFiKpaMeVotVhLUqT6FlEQngil1CcsGvW1phLVYjmmGC5SiAyxeblLSqhYCUC6uua1y03NuBP
	HIoA==
X-Gm-Gg: ASbGncvwQ9UT1tdPpnh8NnGch9dDbA3/VtffGOL84Bln3FfJgrBM1L6Ue48YPIA8QS3
	BV/2JI2isFmxtELdKzh7ugD7LzBIrIz5Hiu5UVaII8K1mVVHoKr0aQe6D/DOyKAf9yYdJunlbn+
	7S+FkRvOxsRiWYcsz7foGC0vzpifb4WBzMPmQ0hIZFtLYo7mOF7bUXgbPhhrRPBPvjEZvQ+EQIf
	txYTDEN/elHkXjEFb5Gau0diE2IK/bmCRsmFtRml5CC1rrX8Va+QVfwQUiqLbOKn6/w8TnxurnL
	LAquqFQkVuBrrfnRo9D+KW73bHAK40c5933Ah/MzLvhakpBR+hJbZ9l8rEsC9JvLAOOVhcwAea7
	j1p+J7yd8DFewFpPml1c4mw==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr137696221cf.8.1757583007541;
        Thu, 11 Sep 2025 02:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVS5MMc+bsMDXcW/LDyPpJzdvX7Md47Pa7qu67qrv0jvmEfxL8qsY01l4Lv89+nv+0uNmnfQ==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr137695811cf.8.1757583006940;
        Thu, 11 Sep 2025 02:30:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31287a9sm91470866b.41.2025.09.11.02.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:30:06 -0700 (PDT)
Message-ID: <96f7cd40-e5ef-461b-9dc5-44e23bdb4bfd@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>,
        Giuseppe Cavallaro
 <peppe.cavallaro@st.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org>
 <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
 <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
 <CAMRc=Md83STGFYya5eu4j33=SQ+D6upcP-7fnBwKo2dPdTtX+g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Md83STGFYya5eu4j33=SQ+D6upcP-7fnBwKo2dPdTtX+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TPa3Q9Voijzn_BkW2_a56cFAGNsvMKZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA3NCBTYWx0ZWRfX3f/8s+mA237m
 JfbT8abYdHpGmby46LQbAB6ppt1L4uZ8m4yHPoHeTCBAKtqEZeVrjcaUSvqwg2a1zpVDBgkR0os
 SZ/OQhNvdVWrq3zsIfXrj8uzqt9eqkxHU4WX9FapEMwdUJbdrkHQmFRxgHIF8+QmSBQr46MsyrJ
 Pb3AClPJtFS5iPehZytSyLlxS66IsFiz6oslIzYdeiS9Aul/kmHXpCnHN+jHX5xziWgga2ledNh
 bqIf3Rmz7GLybQNCW8kz0TPYZSWJN7jSo1V1RUFQhWVpm/tuh5o04e3d/tEBYSt2tjJFUpLwmUC
 4m2o3Im6WQY/VyDj7sfID0/Whys1Png8Zt9AigPEF1exnvwjDYKN0O4e+54F/Hy+hL4n1ykTliF
 0Y0i/gp0
X-Authority-Analysis: v=2.4 cv=VZn3PEp9 c=1 sm=1 tr=0 ts=68c296a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=QdYl_KjyuFFhde6HtdwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TPa3Q9Voijzn_BkW2_a56cFAGNsvMKZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_023010_094302_5B2610CA 
X-CRM114-Status: GOOD (  16.24  )
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

On 9/11/25 11:22 AM, Bartosz Golaszewski wrote:
> On Thu, Sep 11, 2025 at 10:53 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/10/25 4:42 PM, Bartosz Golaszewski wrote:
>>> On Wed, Sep 10, 2025 at 4:36 PM Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
>>>>> On Wed, Sep 10, 2025 at 3:38 PM Rob Herring (Arm) <robh@kernel.org> wrote:
>>>>>>
>>>>>>
>>>>>> On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
>>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>>
>>>>>>> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
>>>>>>> properties here differ a lot from the HLOS-managed variant, lets put it
>>>>>>> in a separate file.
>>>>>>>
>>>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>> ---
>>
>> [...]
>>
>>>>> These seem to be a false-positives triggered by modifying the
>>>>> high-level snps.dwmac.yaml file?
>>>>
>>>> No. You just made 3 power-domains required for everyone.
>>>>
>>>
>>> With a maxItems: 3?
>>
>> In the common definition:
>>
>> minItems: n
>> maxItems: 3
>>
> 
> Just to make it clear: if I have a maxItems but no minItems, does this
> make maxItems effectively work as a strict-number-of-items?

Yes

Konrad

