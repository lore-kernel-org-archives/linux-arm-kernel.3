Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A949D78763
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGNe475MceD9LRRkeQrgMu5K0BExCqyAtY9JJaxoK3g=; b=PE0npGnhGJcEV8hRMGig7RJtcR
	1/g3WJay3lRxh2XeGpkbngeGkFvaFGKhir2zJX12PLQyx1Z+N9pPieE7QYuwWXDQp8b8QMdY7LrqR
	q2dJbroVmRw/f9eobEwneCho1LUUAfP4atP9N33ddgfzo/g1qWURRPqaUvsMmrWYKVytjR2NCKqE8
	pW+Sn7O38wb0LD4UKvDsDtH21UAf8oK/UvRBiiEX4beDzVnvImCVhMGZ05s6N0hW7FUwgqAsd8ZJA
	Q6/HxrCAlsiZ5tzR0ezEjDbltwMvE8Rfawl6d0wOG1nqLBuBO7+Q5uVFkZBfrGM9rKCwsIYc+tdjW
	JeYQKfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZZe-0000000AHzf-0iCt;
	Fri, 19 Dec 2025 12:27:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZZc-0000000AHzJ-0A33
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:27:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBlpkb3990920
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGNe475MceD9LRRkeQrgMu5K0BExCqyAtY9JJaxoK3g=; b=V/dWc7AMDuDQOsgk
	Cgn1dTRIp1scY6lFqoodNCNeiEInwt481OXNeX2cGhipy06vKrAnvowHI465dJeS
	mCMl4eQErE5JXSw/02Tfd19BcESgqQeOqT914dMd9BwdiZJI+Q8wi8jVFeU7owLk
	NMjCYWPo4XriOaRlmCoUhK9Lvrb7yQNGsh96TB8/CdFpQZHR1duIR9ah980tlHGo
	1lXRku3vIecnuttHGaXwfx3saWm8nrREhO24pZT/lPS1PSoqFiAO1I7lvA2Nlymj
	jjaOkxSvf1TfSWsFl4SdLEJp63SSPYY0XjI5ZnOpPajVh5eyHjKvTNemZ9mRF/kr
	L2Gjug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dajd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:27:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1e17aa706so7510051cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766147226; x=1766752026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGNe475MceD9LRRkeQrgMu5K0BExCqyAtY9JJaxoK3g=;
        b=IsJ81RMrKqH9kf6Ls4X8I4itflc7xB6ZxtYOBmVjL0yxsSCc+Ro9/TrK4NZLS2+VkI
         FiN1QgRzs1G0BW0z4wBXDqSSyunBJrbphLsGB+hCMwJiR5EPK5uahN4fe6mtJFMZcWEt
         ZvUpt+nQHIIrxviKfZnAly5ln5SzcBS866nCjKG2UyIygKC+qRbwcDcbb8PIShmUl6DR
         hA67vZP7n7dszZT2RyEee+E7qmfpclohjOtDarvzx0KVaT79axGyotQEVGdmB3nZ3zDZ
         TtvWqBeSz7BhlxQyTMtuKRcNn4s7Io1Au1FFbDh3lg9cGMPdMP8zOO8a+2LJe0h1f/k/
         228A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766147226; x=1766752026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGNe475MceD9LRRkeQrgMu5K0BExCqyAtY9JJaxoK3g=;
        b=GXM9cUt3WZnTX/SXqSq92tI+3x0h+7aoyw56wbsNmGMfmhi160h9BQ6pryLLmEQpca
         2WABUM9KiqACeh+Bgv+P3VFzhsaZ9wnrtDiFTjlRtrVcP7QnKsmbVtdcJBWGTIqPhsWM
         gkJmU8z0Ed8Lmxq39a9z3S74efz4kMDc/z0efH8OWMsL1ZGYS5WkNkzC0qCwQJJyMQrj
         LV7cV/8xs1H5MTOg/JBiVu7qJ8eGQ20EcwS6NgkxTriCdnWH672XV+auBj1p4Rb19pYi
         SZW52O6fP/mgoypjXftN5VlmecWSnf6MH4c0PdF5+jece5OCpr4VQXKv2Pk9H+q11BhE
         YCeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi1CItcLE8hnOsoTUfUoSLtVT9E0yeU4B+JdEStNZcHMQHcshLxx+cJGeSlQuubEqc+EhUPthfDSnMQQ+KSz/L@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc8UfNfEZzQyJe+HcXBh0UG1XWIp7qW+2d4QNovchWqWKdB1Qk
	sPtR0ALUzSSS/nKmev6DjcaGT8nNv7k4KjNnZyNOafxVMergvyGfKliiEHFh1ZsIg8Yo0yNPZAH
	zkIZPf9A2O9C5yaqWOajPCq6zdb5Xy9qEiaS9YJm2qT9seXsISN4DCZrcxailtcRX6DTbOulJ1z
	G2Pw==
X-Gm-Gg: AY/fxX7yWFQ09zYpeDr1ZroajA7pU3JnqpZ+9GqgdYILhRyZdEUfgW9Y51ICtTJ+/T7
	r5dQKev3YV44P3iPKfWfTAJQTVQJ0poeC+0i0rptYpCFTkx/RM9+hzG1qlCQ245DzqmuRlI0JWw
	1woyAmBLvlyIHjO1yyfUhPpgoXA0FVo7MCt8xhj9wJDBhLe46Xs6TG/BdtVZwVPqz3axyeoOJxc
	jwqvrZL0tSrZCz2PQp+rjJ5EPppEqqyLPAtyHkJALCgu2S2n1ADQVLMt3XeH68eyJ6FdgmzVCwg
	H80WWU8fR7SJwi3mQ1zpHtjfX5XWgpsYwFe0FYC+X2qL8epeNenpbPI169xoyQvxBL2jJ3OMJav
	CJnLGwxL/sE1waM5Qnemfv+zOl58pzijAmIIphkQ0SlTfYjGZlS1NmW/7eMpV45GI2g==
X-Received: by 2002:a05:622a:14:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4f4abd1239emr28283021cf.5.1766147226272;
        Fri, 19 Dec 2025 04:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe0pL5QT1iJeLiyw10m6uKLpNAYA3Za+0/xVT/0m30q7rSc36HgbWNxqPaKAuqcQOb3mrYxw==
X-Received: by 2002:a05:622a:14:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4f4abd1239emr28282611cf.5.1766147225829;
        Fri, 19 Dec 2025 04:27:05 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de0b38sm218914066b.32.2025.12.19.04.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:27:05 -0800 (PST)
Message-ID: <21ed5d8a-803f-449f-bcd9-597d89118456@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
 <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
 <13141782-ba6e-4753-9613-2b128e008d56@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13141782-ba6e-4753-9613-2b128e008d56@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945449a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=vO6QtDcs3dl2JE3F87wA:9 a=QEXdDO2ut3YA:10
 a=QYH75iMubAgA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMyBTYWx0ZWRfX2QTBfST2Ej4x
 GI5GoKNa/a4lqnX2w3FoSkwuqg20nGjhffGtQ/UvlX0e9HAraWy500drw23InNr5Y9/MoG+9mwI
 O6NYdR5HNhwFcFfMARjZ7cAEjnqsWqex9yDURKH6rVJ0MD4Twtw5dz3qD6D3MYyXSpwox74NJ+u
 tLLsfWKi6u3o6Oox7eYpCwvkXLwp1y/nU+q8uwSv+xk4xggTFSj37nzVamSLsaFP9t7VQrqGRdh
 cIozeDD+AOl134CbJ1KMbyTqo7osgsmmapgm1WlJtA4TlknxgeQdoHJtm9bZ6biVF0cwengh6MT
 N0TWGbLB+Q+cYOkUVICSnUkCKkN2/S+IT/+DsfnafJ/V8ObF/O9AGT/xmEbIKQ3Y4kmsEf4HZhk
 r9mSjpigj+qObg0d9E0NjPhnz8dFloZtHwJ5JQkqVh8YF6Qcv7EpRuoPueOnSsHWCSCCT0rHHus
 lZZ5pcSh1Wsi0d/48hA==
X-Proofpoint-GUID: nVae3MSD5FNOp8LatodIbWINSZEREGeX
X-Proofpoint-ORIG-GUID: nVae3MSD5FNOp8LatodIbWINSZEREGeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_042708_202421_0DF087D6 
X-CRM114-Status: GOOD (  12.51  )
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

On 12/19/25 1:11 PM, Suzuki K Poulose wrote:
> On 19/12/2025 09:08, Jie Gan wrote:
>>
>>
>> On 11/3/2025 3:06 PM, Jie Gan wrote:
>>> The CTCU device for monaco shares the same configurations as SA8775p. Add
>>> a fallback to enable the CTCU for monaco to utilize the compitable of the
>>> SA8775p.
>>>
>>
>> Gentle reminder.
> 
> I was under the assumption that this was going via msm tree ? Sorry, I
> misunderstood. I can pull this in for v6.20

Please take it through your tree

Konrad

