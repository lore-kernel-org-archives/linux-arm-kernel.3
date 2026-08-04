Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA19C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4hFWZPTgwOL+XjLNG+cDq4GULAAwRZpS1PblWfC2LU=; b=E5HF+p/PU4QMlEzUp1elEjOpxn
	fJ+yNmABa8f0sLeGmASdjlBXQfb0vxLcpMyM1cMtbn0rXHPo1rPsaCsieX2QBfg1ivzP0IgW9/G7P
	b7gs9c4FQWdZNKqTPJDpTVqSH4U2ZQmKYTVGfw13OA1HmKgh21EC/6XBo6bCSnIxwa6hnUuT6gKCx
	MM8NWQvoMENy403eukC4BoVfBSPgUph1yThDmddajRzSqfty/zpzkM0Pc9MLaUx31pYgT/S15bTN0
	tlCG7vTt+lVtxJKVLy3AV9Mfa1iMYIu5VYwCqmG7tu9dGO7W7C/N175nOg+X94V7W1eWyxBJSL+aB
	0P7dMY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8sC-000000018zU-1C7x;
	Tue, 04 Aug 2026 06:43:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8sA-000000018z8-02ld
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:43:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417aHO2085347
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 06:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4hFWZPTgwOL+XjLNG+cDq4GULAAwRZpS1PblWfC2LU=; b=p1RiAgE1p8lfFyhL
	kDtdS+UZZzKTbpZgWmv19fAeW+Jv9IKrNMHg6ta4Oso0aY5X+xuW6wFnh4LgHAlq
	Yl6YEl7vJiAVvDjJJ9Evb8rhhIBUKL5Jm3h0f+bqZ0BkXEzTNL6aGb98nfWLeNYp
	it4F2c4q5orV2WwBBJ/I0X+4c0COA+pOEp/XOY/E8On0Hnba06hgXGf5NeIINp/y
	zfb7Qkq680YP7FxOcjuK8rHSRZ4LiGCbTTKx2N7qjzBOsx5sS+fG03QeZM5ywFl7
	ItVfg6iPO5uba0GWI3xN3OzXdrI9/4bb0lQnAWlRIPhBK4MoIxvMWSth6t1Wdi/D
	W8PEbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3qjxpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 06:43:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so11119525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785825812; x=1786430612; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4hFWZPTgwOL+XjLNG+cDq4GULAAwRZpS1PblWfC2LU=;
        b=NZKeYK4imUT0fkWCDEWpDM805Xte4lVEZLH8l06x/DCK72mLl9TYGlRLRuO56JPPnW
         ksMdhVW56DNqAflY6W7BSr+MSNpw4Q2V5FE8K6tajH9izkUl/UoGmT3ZiQtbooYua98+
         sN+bDaS7ClwiJHX7A3mvBLcblAiSggoN0yJ3gabLMV2aZ6PPp/oQRD7qvsGJcIf1q+w4
         GRVye85R+A1ISS2ufWGi9ZYXpN7pYd+4rOR97B+fQJNmNhGGOKW9EH5rpxqpNVxE+MA0
         Kz/3NDPEKi5Eb95Hit58zQGs02oHSCv2CGp/kV4+PC0e/uLwa3W5EjKZHUbdAp4Y95pl
         quJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785825812; x=1786430612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4hFWZPTgwOL+XjLNG+cDq4GULAAwRZpS1PblWfC2LU=;
        b=rM1mWtxIGXawy/pZqudIOFUFqsNV56CKi4/zCiBTK/HnpwfBYCmyRHmd6fvtACaO8e
         ZfdVcqz7w+igD5C4swK3Tj1aqrMmYDe5BM6GTHpFbFKec3CryACN0z1n3Jr5oRgM1NF8
         TVQqkBD+DZWZ3TtdrqvCwpOxNiDD0pxTJxYrF65dNs01l8W/omQo23KbHh+6E8OwogEq
         AI6HxdZ6UDwkZHiWN8a/4pOizxFf0dKJMh9AE+Qt66rJoNPIkdjJN8uKmBFZX1nrMJ5N
         Ct7EQfkaOfOp2vIaKzYRq7odu6Y/NpxwQVfovh7C4KjGqdr7IwHVVYojNsjJhFVZYK+L
         sw6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoYFeo7Fm8hBGbxPqpbE1El6mfnsgJwPlkXHSHjN+5afv7xUL+iRET88HiAdZQLlNlxOMCp7+PmOUUiQFiTfvQO@lists.infradead.org
X-Gm-Message-State: AOJu0YyeaoOPwdHm53/Tnnw10iMtu83L4UI8h9nPFext3vEbn2jp2yPf
	hnP00Q1W1fyDwO8JmUgWGSaCC0wDBKYQT8bznizgsREneXLH9X70OAtWPx1aGQSlxM9gfMHRO8k
	MbSxV2YuBjJOtYh31wP+8t1f1/uL0u2qbJjbEWmKEA0I9sBhK/Wz/yiwFI9Xav4lpuixAuMaHsd
	oPzw==
X-Gm-Gg: AR+sD11T035MTXY0jHr7mDgRizsPgu0bRUWFnxM84J6qdd0KcAPOStLEw5F+MchxSR3
	7WLYDAK8DiG0hqHBqDpz1j9kCk+iEEMdTe9YEN5nswupmX3JdnnTvdTU3aRlv0sBuVWMN9+ZqNi
	e2hrBSsj/VBwL5NtwWlRF3vAOClk/BedBTyt6e9wztfgCGsY+XJ+PFPeyDjh+YDJQjNs6ntoHcJ
	CbM7pj7oEuc8aSTT3zufdeCa8cEhqjWM6pMl2MjZObYgKGBXdQWJz06gZZFrXB2wrOk/vNfvyBN
	VZCQmkyi9Cl+Q9cLZrYnGD8b0MYrp1kZY1/bntC+HZcGEpSKvClJakDkfsx6U5qeDIL4IXwiGpA
	Cu6ew02fCQiRM6QVZPWtBgzao4FMf0WiiVrAiGF0g3hdQ
X-Received: by 2002:a17:903:388b:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2d08abc8099mr22212075ad.26.1785825812100;
        Mon, 03 Aug 2026 23:43:32 -0700 (PDT)
X-Received: by 2002:a17:903:388b:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2d08abc8099mr22211805ad.26.1785825811627;
        Mon, 03 Aug 2026 23:43:31 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9371asm1019725ad.13.2026.08.03.23.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:43:31 -0700 (PDT)
Message-ID: <c3c01f2e-9070-4603-a5b2-9b404ab2b94d@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 12:13:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: add compatible for
 IPQ9650 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
 <20260803-therapeutic-coua-of-judgment-5c6cdf@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260803-therapeutic-coua-of-judgment-5c6cdf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aLFEIVLr1yhZd2h15EC5oaQ1llS5DQhT
X-Proofpoint-ORIG-GUID: aLFEIVLr1yhZd2h15EC5oaQ1llS5DQhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1MSBTYWx0ZWRfX3ANN7wnA1HP0
 PCDwn4oHwtvhot+L5lqbKJ4wiRAgefcOwOAj0iq2UIRZ3GFCSIInRaNNddZoZ2/PsGg7EOVoKMf
 7kRrus/5qIwyiBB7LRTJM9MFlAQI20vIcJjMhhPazil3pIXdRgxGqK0f1DeP06viTmNLepRlySI
 G1LhELqOaWIDGi1i7jDdmhFx9WuNPchu7COpeJXjuHw/K0S3FBFYwk70aelAzaJkJ5TBfL4QvH1
 hptfyOzE5EvRPgioIGGeztc6wGiZzzA7h135Yu5VlJ94MuZjy6XclZ4ElsX61TIQKV9ZFclRzs2
 JHGPk6gRMNHkX/j9xOC2CJz85eoNwfEUZBHN8LQp7bw+AE0jBMRolnG3zyyuAXArWijO8il7958
 KsSrPlk/hR5TzyBT0BDNFpubvHBCFl/T0fdEa9WY7jpJGJ2bdutbtc8oyG9EGNvpEHgYLDdNF/E
 NYusFUiQWFp1oDWhAOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1MSBTYWx0ZWRfX4M7klTl5y3jm
 AjGAdIOMfabxzx+4l3GVfJxJ377wDptF/5+xxnucyUpTlRdhFB0cmhtlmiarlaRHmclJs2+zvk6
 M/SwChl6B5YQg/CjACllxFqCSZrmmaU=
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a718a14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=tA7aZXjiAAAA:8 a=JfrnYn6hAAAA:8 a=e03i7Ra0A83BTa4Xh-cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=kIIFJ0VLUOy1gFZzwZHL:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_234334_059234_8B5F82CD 
X-CRM114-Status: GOOD (  21.52  )
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


On 8/3/2026 2:54 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 31, 2026 at 11:01:26AM +0530, Kathiravan Thirumoorthy wrote:
>> Add the compatible string for the APPS SMMU present on the Qualcomm
>> IPQ9650 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Add the proper constraints - no clocks needed for IPQ9650
>> - Link to v1: https://patch.msgid.link/20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com
>>
>> To: Will Deacon <will@kernel.org>
>> To: Robin Murphy <robin.murphy@arm.com>
>> To: "Joerg Roedel (AMD)" <joro@8bytes.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: iommu@lists.linux.dev
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index f2188942f877..ffa33b7f4a96 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -38,6 +38,7 @@ properties:
>>                 - qcom,eliza-smmu-500
>>                 - qcom,glymur-smmu-500
>>                 - qcom,hawi-smmu-500
>> +              - qcom,ipq9650-smmu-500
>>                 - qcom,kaanapali-smmu-500
>>                 - qcom,maili-smmu-500
>>                 - qcom,milos-smmu-500
>> @@ -625,6 +626,7 @@ allOf:
>>                   - qcom,eliza-smmu-500
>>                   - qcom,glymur-smmu-500
>>                   - qcom,hawi-smmu-500
>> +                - qcom,ipq9650-smmu-500
> This will disallow clocks also for the Adreno one, so confirm that it
> also does not have clocks.

IPQ9650 doesn't have Adreno IP. Please let me know if I need to explicit 
about it in the commit message or this is fine?

>
> Best regards,
> Krzysztof
>

