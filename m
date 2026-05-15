Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D80BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 22:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=; b=zMBkrDtW7ysCxJ2tcfLac5jqvR
	f1vX2K7DYVf6bh0lmDKu/bOXzReX32PYqeNaiYtWaK0qSPl8OR3YOf9/U8+b0D2JMkyRcouAHXROH
	/5MbIVHlCoJnej2VSY2NxqF9ji8idan90H39KEOZg5+fivvCZiNUL9BoKfPvUcgEmjHk88xCHMzbd
	A9G8caU3pCB98knqwZahxPUmgSWuCWivXS+7Jek17iXqmeT5F6lN+n5xDHUN42Dkoo6BP0Aq0Xq4u
	V+A/XB8RH3WE9ziPvz8MmnFytX8dpGtNruDNMeEIRUApeggGmR+kydNAXk8jaD1OSA/fNEu2nc2vf
	X6M/nOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0pF-00000009bqt-3rQu;
	Fri, 15 May 2026 22:16:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0pD-00000009bqL-3af6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 22:16:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJf6qE3077040
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 22:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=; b=enQl/oxkGo4EUY1C
	0nmObNylCTCi+UVv7Git6oE8B7q8Bt1uKHiilYmDewZ8qqnxSX6AK/PKoKpOLIm1
	0aWmlBr6qJ1zvln6zk64GhcuzLUmoTAHHN/xfsc+4BTUxqsBnaGC2gYKHVPlTKyZ
	x5CG8V/PoH6TiqHonXu+3gMcp6HhDy4GETZblyihZn+z5k5pfcuot0+O9mFVesey
	q4kxw/021aWB2iYk0ygL7qx0AWtv/qXYJbNO6tbzOooKCEfxaQUXryof/9EYjPgV
	yNF7vOe0ErUh4Sdj4zyegucA3XumsC0oM6di4BXlncDVa4h9UK5uPFTNIulzHPOB
	kKZNCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e68g2rntp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 22:16:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36629e48023so180613a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778883366; x=1779488166; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=;
        b=himXb5I//C7ELK9Cw/+x+tsAz9dwAImy+Ds9efj8oULx6AXENAo0toqJl4Qo9nPjev
         1TSnxJFf5oowbXYZF9iP9LpDaRLQfkI7OiwX3jQdb6p75tWbS16b6zlWT743ZE0mQdSF
         ai8Z4hHXJPY1XXW1KPTIj8BkTgiCowX+R/pw7jw+/IZH/YolkG0r33xEM5y+JT0gV/5P
         rYfW6jGtLS5sZUku05QF0UMmvgJyQ5025JDZO/jSQPNoR4KmKowc6pp2mQV+RNAvzGH0
         D4SUi1nDClPcs/3nAX8ke147Ult5GE+g0EF2TYqDvWTwWTReHxPpYcO9yU2qLCjM+Oi1
         CePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883366; x=1779488166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=;
        b=pscht7TWdwH4srCQsYp7qvXD+4lketQAhpCdI24R0RKUE0VJJpiwTFelbfzA7Y+5/B
         5idThTkqP34kmm2HirEyddCJlUW0vsS/H6eobzm4M0pl4mECz58EoyjkasM2O/EfaDK4
         qttLxWxo3iM39o+xxhfk81GH5i12R19oKb6vLnnMyJWqmzLBBnsVCqSP6RAK3AeXKIP6
         zVAw2XZP2S6srw5MhiZ+zMmZSbXMGJ9qfr2Z6ht5+KeeMXN59OJ8kBRxF8juvWBkb8qe
         rSX7fBRAqHzY9pX0XaiywHiGNUllThmDmIsHuVxqZmSTUqylHNDc/65VIZWvZ/BRzptW
         w4HA==
X-Forwarded-Encrypted: i=1; AFNElJ8IbR62pxZ5qj4Vhd3C8D2jIveW1vseWd8UUGcRr9/FOmKDcTsgux0HTphQMy4WdtnqpyXetvab8Mt30zCIiHiz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf4uRBqky+XecKNjbRMNgMWbLWd2mdeNagJvMAygFnq3XVMw79
	+ca2BuN0LCQhIoqfWKJh+bb5oRTvQivgXNQjZK1wBliLMafn2kpCv8cgoWs246jVbnQyVjIE1l1
	/z9OzF/vX7dJ8zuxVZg0dFUmdNH4Wk2C4JxL/BMHJnLY0SKshbrqKD3UCC5utpJUlAZqpkStwUZ
	GR9A==
X-Gm-Gg: Acq92OGhtuDBOe3Xs8i1XlV4GRMihGrF0ViHx5F1yuSG5Vf1U2LVpuxTeUdpgFvJ1a+
	K0OMqmJyvFJl2vzVSuaWFi+1KdUZyarAa/ojQlWNiJZ8XnAvU1K2ln4pxJp6RPiX7/T2szu68P+
	nfk6SgJ5+L56Tbg26Dx2VlW2Sop4n4D3pkHDwzJ/XcT4qYTEp3ts1zjZcWbWx7nhuMD24ifOK5o
	cts/cCJjcXipoQFisWBx0El3bgysUbUYiQbCEos66qiAPd2ghbO/vMHlqhHDl8Mmx0btt0XXZXz
	o5p+k5V/XuPw9F325ZEkf5zj+z5uN+TVw9tGpyukIiLhZF+yJDp8t3DGxq95h+LV88wf9PTZ7ws
	spTjUkSh/o7JPQVTjDcSqfhL7TTJuyhQsuwjsREpdJECqvPAY5BSTXA==
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr5767575a91.10.1778883366310;
        Fri, 15 May 2026 15:16:06 -0700 (PDT)
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr5767533a91.10.1778883365800;
        Fri, 15 May 2026 15:16:05 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb11683fsm6304190a12.26.2026.05.15.15.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:16:05 -0700 (PDT)
Message-ID: <f946b661-ee69-4502-9745-247940c54653@oss.qualcomm.com>
Date: Sat, 16 May 2026 03:45:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
 <20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com>
 <20260514-pearl-mamba-of-inquire-e4888f@quoll>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260514-pearl-mamba-of-inquire-e4888f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JwCk1aM6j8LxbNE17Bbv_zgF3MGeH30Y
X-Authority-Analysis: v=2.4 cv=EJ82FVZC c=1 sm=1 tr=0 ts=6a079b27 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CuuWk3emYSqqoFdssNoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIyMyBTYWx0ZWRfX3xEKpA5jy5+O
 oopB8nObdA7AbdHoZ77rBUrn8sG3qi9PhGIEDwlkV4sFdXIaPwisJCViBZmKzIEgugyBUKQFoOV
 7gls9GP2+s+70fhTIBVwHwhGI2uY3bKwCQGVaKQ5Nn04APVc5mcDDcUPLubxdyZ53HwvqXu9rbh
 O2SPZHJRfhX27T9LlbD3BaJTgqoHyLQi8vdSS0zCHup9iw4xYR4WqZu646X6JpcquIaAnMy9FcB
 TkQQ63rffQ9MeAfJs+07cBSf91LHyq5G48nz6DsafasObV0dgknM4yTjmEAKQ+mGSy893hX9mHq
 1jzt9BsyB3ytb60hNUwg8FPXfXHl3V1RpQHbDU1zs417yFBr/JD1ud4y418S5ZlDW23Z6xcjPmG
 teBPwCkjs6Mb7MnHX4QxeDDfuwJsuQPGs3fxjiF+4SRvWHODE6TjQ6ZIjBOhRpGVr3/2SHOvFkJ
 RKihr38bNuxRzOIR9KQ==
X-Proofpoint-ORIG-GUID: JwCk1aM6j8LxbNE17Bbv_zgF3MGeH30Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_151607_907592_7D757A88 
X-CRM114-Status: GOOD (  18.97  )
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

On 5/14/2026 3:43 PM, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 12:51:19AM +0530, Akhil P Oommen wrote:
>> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
>> It features a new slice architecture with 4 slices, significantly higher
>> bandwidth throughput compared to mobile counterparts, raytracing support,
>> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
>> other improvements. Update the dt bindings documentation to describe this
>> GPU.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
> 
> Someone needs to start applying Adreno GPU patches...
> https://lore.kernel.org/all/20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> 
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 04b2328903ca..e67cd708dda2 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -411,6 +411,22 @@ allOf:
>>          - clocks
>>          - clock-names
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-44070001
>> +    then:
>> +      properties:
>> +        reg:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        reg-names:
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_mem
> 
> Are you sure there is no cx_dbgc? If not, then just minItems+maxItems
> like for 'reg:'.

I merged cx_dbgc region into the kgsl_3d0_reg_memory region for A8xx
series. It was getting in the way of covering the entire GPU MMIO in DT
without overlaps.

We don't prefer overlapping regions even if it is within a single
device, right?

-Akhil.

> 
> Best regards,
> Krzysztof
> 


