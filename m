Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45741CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=; b=ulNTjbJSTUeC72qGVJpkuDwjOt
	qFJy/CnxsnC5icG/etCM7IZJqA2qvK909NhyCSussqoRzQMZNkbh7pG/LJGtRp7mx+2HmSxZaCGTt
	6cPb3Em6XAWcDyBB9eir35WR044UTKJyYkzDTArN15UTTTHB0FqyFTtpB8m0vg4OQwjWtF4Yr7SbX
	1GtrA9Nl/k4ErpHAIVOGXFc/7sScL0q4rBiA554FEYWCJf1YpUZvhAquUjhhhbo7GQkfbgR/bhcGO
	3uG/Cf5lhJ2E2hZwpjcZFjEqPLBq2mAquxl7Ek7wlD0gCnPX9qcOKg/fri2txgp1Bt9+hLGH/QFsk
	aaPosajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIh8A-00000006iX9-0rJ0;
	Mon, 19 Oct 2026 06:45:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIh83-00000006iVX-4ABF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 06:45:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j1Ir1177593
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 06:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=; b=hn/J+RbS23AsOvR8
	TedeY3Bsg0NhTf5sRVzf+0mHzJ8qwP9oCzAtTS5o7lwEbYW5mo2dL5nVcMjRYW4K
	zYy2DwuKF5pwxaHk4uyyie5gEDyvAlIo6TFc5Ml65qQrP7jOW03pcY5YoHp08Ook
	/ssC941oX/sC71PYIrM6SvTaH9SThaoeaueI1RXHU0QbUkM1Tfxdw3PM+9IDhQrC
	bKTrn+jrlI/a5CpFoKv8BtZA4C8Cy7PeHmtMupCvsyr/rirrsmrvi8LTYgMAfZyx
	y8eZag+4Jq3Xsi9eFTfuP81Yg2hrQCjZw/SQqRSiY3o9FvvzXuQFxrTy7FfqqTgV
	Cc2n3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se56cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 06:45:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e97dda7346so14486575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792392344; x=1792997144; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=;
        b=Iu73W0RvixCfcncZQLIAhGLyJiQu4G+LGrNR2OxQwOJHdObEzPOW/dXO8DIfYqlDeF
         6JzYZ7WuVarhhFfLjXsK89oE0HeN5IWgJq/f7r92PaSS5LiHKg6qDGCpFs/uAsduCCow
         gmqc6JpL9QDvfBiKRLWvVDPE/bei4ts3lGqt9Wt1AOH4IT4x1o4AAXSPZKoUFHVLzleh
         Ar+9W4K2eF9kk3TpeOMhwmB7iR3HKFUlaEShdj+gcfpwe1gkWUakMuv8SHmfuzuXVU7U
         bE1HRA0LthdAeffM/u+ooxzoqco0dskuoW1kbURWxI60aoexyfwxswVrz1brbirhasWB
         hVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392344; x=1792997144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=;
        b=LHaqi6MIn04RUda+q8rWrQecQ92ch5nI1cXfrt58ZtmFTxrVKNAsREAt1QUBAYU2C0
         N2GJIZXiogGlzxY0PK1zlPbdqOoBdgQKQFcNXsokUOV8safQ64LZR14Cr5cVBYuAGuqy
         rI/EmG1q15wMoyAuUxlT+bC9y0I81fZTU3D7gno4ZSNDJt3HOnboFlIN09sZ/Nh54SVN
         XfBd1yJSFZ+TSaYvEOruvUjv09K1XaCopPZtlXxi8g6Ci9eShJI7O+XgHSPMjsFgud5K
         ePXitTg9FyrcKaB5ENtG/oUDg3xUHvgQh4xckNCnosWZmXxvUhhTBLC7TYarvN+AsJ76
         tDIg==
X-Forwarded-Encrypted: i=1; AKwUvBzc2+JNhB4EuP+wY9EbJlDZ3aK4RzRsq5Xz0zyxgsoHeWHRtSwxss0nAy7t2lecp9fV4zQRGjC7qpbUt0zOOuQC@lists.infradead.org
X-Gm-Message-State: AFq9FYJ//0wuPCQX7u2ebTolfZOplIwS9AHvX8F93hEVJziSy5ipKhoS
	ZMlgBHgcJh3rj+KNFScsOUhww93M/JU+VqhthbrXVfoyJdr8NF+s4pEXbxXUxvq1CkdbNACeJzj
	7wDEGYJs2JdJWgdXkUvCWkqVx5A2AZfWwY2w1WHBnkFFwIYYeDy/FOaNb3wVLHDIOzvlzkV/F/M
	0YLg==
X-Gm-Gg: AYBFou17DaYRa11FK9QCUSQAlpECdAUu1pxwOOx/ZPeQ7ek2K2qaaFJuYGmfmDHFPhO
	OFpSUUSK7NDh5pa2txwQ9p6TjDv77eeuu6NCWH4I7PNNCMApTK9WD9rt4iijRjNmRV9En1aknFk
	3VNqGcWn+lG8TDSW55DX9vP26aaA0/SRyblf5eNQnp2zcVoweCpEQHC2zjOOaRdqBcjXoxqOrTp
	qy+569xgFJJeMmRlhEah64/sGU0BVrDEpsdihtdkMvqGiXhwASz3fTEeDlq86L2GOzRVMOLjYRl
	p2qYqbWS/tUmLSYv92Yg4XbgqGw4MMKcsykVxZ1pWzNX6k/o7IqStuMuwLZPESkrjCaqNSaeNud
	d6sUCXRbygbSWJ3rvXilB0jLG77U7r/PNFnlpKPEbamfoz0jkwPlBxlQrewbM
X-Received: by 2002:a17:902:f686:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2e9a6d25346mr62369895ad.22.1792392343739;
        Sun, 18 Oct 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a17:902:f686:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2e9a6d25346mr62369505ad.22.1792392343154;
        Sun, 18 Oct 2026 23:45:43 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea0cda9d8fsm731205ad.14.2026.10.18.23.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:45:42 -0700 (PDT)
Message-ID: <2bb63bef-b1b5-487c-98de-7cb5fa9b6758@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:45:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
 <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
 <20261015193639.GE5059-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261015193639.GE5059-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5pz-T7yGypyIvi0yspsHPU9UDI2ztH50
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad5bc9d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2vh7TcXBQbIRG-HjRUIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 5pz-T7yGypyIvi0yspsHPU9UDI2ztH50
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNiBTYWx0ZWRfX0n3+88ufFW1J
 98InTsYMT1trRsv8v7f5ezckoepMJk1dxIKMBrki2QkOn6v4npGqMIp15K9keRBmxm4GEpDTsPd
 ITn1W62bi24LjHsPo7nVlvypIcBJRE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNiBTYWx0ZWRfX33XJydIAltrv
 rP5vRb0nw/rHbumVNmhhaastwPdDsyFoag7zE/ADizxI69BjMzKIJrjjz/BQ2sVRwClAf8zQ2no
 vRhZkAVis5sMJL6vwWDymO7ppKgaDCaQ2o7+OmQUoJPJmrgCFkLgLwW7vykuIu6bjj1CT7TLIh/
 V70anPU7N4ghv1mEcuseDQU8ydhbfsqSY0eG0tnz9cls8cjGkLBuDXax2eYRrLNE6ysERjvdo6T
 CkP+y7JaNYV5nOYl1dbMgH35/yattBVrI4Djb49y1HKwpuS7f4k8FEduGW91QGEQMoh48RB8FAg
 BlpLlVlaSHAVpd59GpTDubLAYxgX7WGqguPlH5o5xmrGxugd6n+1xXN+lDVv1xIdL5WrSXZKZhl
 +C4gJZc2gEMtMNRmLq9FJQybBTS1dJ9v62OKHYZcFYRpXolJIYXxvO1umKaAs3ESqDAPSxXxcFC
 Mu5Ci5qQ8Rb0GVec7zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_234552_051894_6B6B7EAF 
X-CRM114-Status: GOOD (  28.34  )
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



On 10/16/2026 3:36 AM, Rob Herring wrote:
> On Mon, Oct 12, 2026 at 06:24:06PM +0800, Yin Li wrote:
>>
>>
>> On 10/12/2026 3:05 PM, Yin Li wrote:
>>>
>>>
>>> On 10/9/2026 5:27 AM, Rob Herring wrote:
>>>> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>>>>> From: Rob Herring <robh@kernel.org>
>>>>>
>>>>> The binding is designed around the assumption that an MSC will be a
>>>>> sub-block of something else such as a memory controller, cache
>>>>> controller,
>>>>> or IOMMU. However, it's certainly possible a design does not have that
>>>>> association or has a mixture of both, so the binding illustrates
>>>>> how we can
>>>>> support that with RIS child nodes.
>>>>>
>>>>> A key part of MPAM is we need to know about all of the MSCs in
>>>>> the system
>>>>> before it can be enabled. This drives the need for the genericish
>>>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>>>> until a h/w specific driver potentially enables the h/w.
>>>>>
>>>>> Cc: James Morse <james.morse@arm.com>
>>>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>>>>     standalone arm,mpam-msc and the two-item combination; fix
>>>>> schema field
>>>>>     order, type constraints and yamllint spacing; fix example reg
>>>>> addresses,
>>>>>     add arm,mpam-device phandle and remove TODO comment ]
>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202
>>>>> ++++++++++ +++++++++++
>>>>>    1 file changed, 202 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3c7b13a23ff2
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> @@ -0,0 +1,202 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Rob Herring <robh@kernel.org>
>>>>> +
>>>>> +description: |
>>>>> +  The Arm MPAM specification can be found here:
>>>>> +
>>>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>> +      - const: arm,mpam-msc                   # Further details
>>>>> are discoverable
>>>>> +      - items:
>>>>> +          - const: arm,mpam-memory-controller-msc
>>>>
>>>> Why do we need this?
>>>>
>>>
>>> Hi Rob,
>>>
>>> Thanks for the review.
>>>
>>> The 'arm,mpam-memory-controller-msc' compatible is needed because,
>>> unlike cache MSCs, memory controller MSCs cannot rely on the parent node
>>> to identify the resource type.
>>>
>>> Cache controllers universally carry a 'cache' compatible, so the driver
>>> can recognise any cache parent and derive the cache ID from standard
>>> properties. No equivalent convention exists for memory controllers, and
>>> the component ID comes from the MSC's own 'numa-node-id' rather than the
>>> parent, so there is no parent attribute to rely on.
>>>
>>
>> Hi Rob,
>>
>> As a follow-up to my previous reply:
>> Whatever the outcome of the discussion on "arm_mpam: Add support for
>> memory controller MSC on DT platforms", we will keep the binding and
>> driver support consistent. If it's dropped, the
>> 'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, and
>> the memory controller example will be removed together.
> 
> Which parts are you actually using/needing and not using? If you don't
> need RIS support, for example, we should drop it.
> 

Hi Rob,

The Kaanapali DTS only uses 'arm,mpam-msc' nested under a cache node,
deriving type and affinity from the parent — following your earlier
suggestion. No RIS child nodes are used. However, this is not 
universally applicable. On most platforms, L2 cache nodes sit under CPU 
nodes, which do not provide an MMIO address space. Nesting an MSC there 
causes address translation failures. The Kaanapali DNM patch moves the 
cache nodes out of the CPU to work around this, which also has the 
benefit of making the MSC-cache parent relationship explicit in the 
device tree — though this is still an artificial arrangement for 
demonstration purposes.

In fact, if Kaanapali supported direct MMIO access to the MPAM
registers, it would also need to place the MSC independently and use
RIS with 'arm,mpam-device' to point to the L2 cache node under the
CPU — the same approach required on any platform where the cache
topology cannot be modified.

Therefore, apart from the memory controller MSC support, we believe
the remaining parts — including RIS — are needed on the Kaanapali
platform.

Thanks,
Yin


> Rob

-- 
Thx and BRs,
Yin


