Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA8FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=; b=VPgq4uiX53k93CE+KDZcy1Wg6s
	kDiYMr5g06DIfJ5JtJez/+e0Fj5eJv0VCwU18gEesIUv+kZIQjwE43YSxxfUhyStMDsAgCuinpIMp
	2FzDI7mAAzbe5SPSg/CbxLp/bOYS/EiZcqWrrUqO01wlrv7Lc9/6OnprWdYjeY0bQzUVv0v2UXwNN
	0X+QRiKDKA2IMei1xCpT4+qUTKt25Y9RBd5HUfOvej1icggq76o5u8jTAiHvjrM8JzjvoaGjbFaHM
	+u+mzyqybjOESoxD1jrmkshRzsXDQOMGr4nPIdKQu7fX751iDa5tcH+uLc+csZZj26Dh+K59VDkii
	nbdXluoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP62-0000000GnmD-2NwX;
	Wed, 08 Jul 2026 10:01:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP5z-0000000GnlZ-1ghn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:01:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889HFn2135713
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 10:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=; b=oltHG4ZG0U80gfpJ
	tYRua4KBzGf901wPuYRVh2i5a1FPhwH/fr5a0zAjX3VDEublxoHPSvbZVaHRjjT5
	CVNGhLqADIgdvEh+ShfpeXP7RXFgIQ32QbejmmRBpxzEg243jUP69Vl3QIpt/3ue
	wOlVnwQMI5cMt5cnRPvam1Gpq/+FxAldRghc0cFUCAhGcdwDssjsTTQtE/2Cv2ZD
	IWjMXV6OPjWh7LeTjXNlTovAKeiijLRzgWQqQQt4W9x5DEJhXHA5z98Sm5mYdGVJ
	a1ACK+xTymCfENv1pL85ypKsPEXw7JDCXTDpWaCUDQ4ZEwRMav11ZN4OetgL0ZVW
	+LRCmw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgtma2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:01:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482df30da4so834524b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504893; x=1784109693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=;
        b=HQNf4MZAJmUVS5oTiSQ0+8ibcF+3QxT8a+5orbMeL4n8XG7yHhyyEdvk+HeKhivRkE
         amOgKOCDveUcENeYQI3LtLH08M6O6yC1qgHMUmiRwS4oVUyjCdK+t3J2tgngjafj2vyU
         R1F6NOfaGS02fXPtRhOQejuEh4WY1qDICwYUygo84PVPPjRhxIHhGbqynLkERUVL2TGh
         QECkM4HWLGLRbm1ESo4M4wsd+lL4mNw5rja2LmqXbXb472aBkjVTJGiztz6+cNncV5Io
         NOoEIP6k1HtdAiGPs4leZ8gkxETNEPuKbmHTjZ6JcAUHjfw77lzUfRPe5TNLklrbsEO9
         wqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504893; x=1784109693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=;
        b=Nb7Af6IhhRwU8kdtVHx8WWWqfiqE4zdiYi43ykTF3lcj1ToIpT5YznIq0z6GZij0sF
         s/pQoWort6XAd6E3p/6BSHN99A+mZ4Ne/lDIbkCI9dbqUzIsvO0xYiFYDVMjlJx8O449
         ovZueG32Oi9ttYZ6iFAegNcE4XhpkfaV0sBI6BJ4l8ixznQakP17yUlsxhksH34uvFuQ
         9sjtdQZOHQ0IElRvY1Irad2LZYwaHVwvKYKSWxMincTJwmIWInaVUB+wHZL5NP1emytK
         jVq0P8W/ztpZ2LxyFmsinjh+DO3tf53ytGzGPDKLkGF/2XrbfMaYyQ46nPSsXDCuHh+9
         0VVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwCk9OnZuuPDYjYkvCNdjiy/n2zkGAefJr2EfIV0E+IQO/VFc+scLQ8sWm26hhQbT5TCmhzVcNhaq9CYZQq4dy@lists.infradead.org
X-Gm-Message-State: AOJu0YwwTWhOwZwtzV0Rbv0yZg+DsgiXKVUZchB2foRLG6+TaTvgIgQC
	+Vy3uFOlR3o9HfiojOsao09CoRE5LxrEKml+UAlp0Tgq9yDz/IIgKCkVXmefW619XMrKRKz3G+1
	CJzc+ozhgjCD5ZBwW0t6bPo+l/12K3UN3lSY3jNUdZc0zJ1KMn/k5v4yX2bQppnTPlTk3N1xbwH
	FBJg==
X-Gm-Gg: AfdE7clK+tyn+C2VI3STZiO1ma3o3eyVD43gwuAMltG2F4BY4dv1TJZL76/0+xSySR5
	8weVT3TCw4Ccf8Ru/6N7Xu8VGt1l/4GO1GmC8hCbZ+gI9JCUUnqqjP10MBb5QhK9JHMAoFc2OgH
	omrnnmsd9/yURwQJVwzQdno6Zoh6onKUfUn0HLqx8DcxxQgQMZqdgwqhNPREDCsnss8ea2U+QOY
	6uKTOPn1XWg/z0HBJV0bbFnpGcLXrQKxsPJ+pW34u9dZaTFec+Sd3sveudGjJPsNqJpJxLRGGzq
	+Ca0hM4EaVadIC+n+1HYLX9bMUECwrGSl2/KKNQzK3L1UNkb+kjeoie7w1dXPrujpO1VxbUN8uL
	MXudG3KUrYjhEmMQf5ne7WSfNS5IGFdLCWEXRQvw=
X-Received: by 2002:a05:6a00:2e24:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84842ee9c8emr1865577b3a.22.1783504892756;
        Wed, 08 Jul 2026 03:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e24:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84842ee9c8emr1865535b3a.22.1783504892128;
        Wed, 08 Jul 2026 03:01:32 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm6916358b3a.28.2026.07.08.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:01:31 -0700 (PDT)
Message-ID: <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:31:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
 <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HZjfWlYHlxTBoYsXI0lca0YChJBCIIeu
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e1ffd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Gb3r-SE-3tiIfwJ9XNYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: HZjfWlYHlxTBoYsXI0lca0YChJBCIIeu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX+4FCvkKRo8je
 /zv6weTjaEgigMGU9uYV2g8aC9oM0xKZOIEe5i5C6npFsS+2NgoxjEbAY9wwxvPX5l0RBCh69au
 H9DzEqp6rr8jwsxaIoCuQA3QUDSiwIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX/fz3i+GefMKK
 xgT3jaYrxul+xEZbRfXqGYDUeUYx8tDzBYncDA+YPDmYJMj2OqM4aAngxHh1dLlX1a1bQ5Lo1QQ
 cdaeFvOTkuu+aLhGnOyZ17bsXGMs641l7is++/bvGGaw7BkN0S/Pg09m3PCsWPiUBIDXhHF4GwZ
 MzUBDuBc/pbA87cLc0rmiLsNO3f7rnfSHAR5t7ncRrHWmZULh+dM9mKM03q5R2TF0/n2k0r97Bk
 Iy3pAzlHox+hn5f7W56cbcuGZJyLgL6UkZ2eJHSPt8KBVEdejyhLQJb8PY0H6rbETEB6Wo0xkNn
 bs790k5yYAArWGcvExvvauKZhtez84eXD39NCQiG+C2iYWWYMFq36rL+vCQJ1PQ/Urw8yAO/Yft
 I2bx1Ti8qrLrvgU15b7iznnv4MZXU+qp+uNKFp6imE4OoCUxklyD/IDRk/y8W/k81tgsMVxYYAo
 qSTPgO+YqbU6mVXw09A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_030135_566812_DFBB607F 
X-CRM114-Status: GOOD (  24.21  )
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



On 7/7/2026 10:14 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>> leading to intermittent probe failures and runtime issues.
>>>>
>>>> Add the required interconnect to ensure reliable register access.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index 90e50c245c0c..721526f023dd 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>>>    			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>    			dma-coherent;
>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>
>>> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
>>
>> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
>> preventing gem_noc going to sleep when icc_set_bw is being called.
> 
> _why_?
> 

Now when i think of where we implemented the hooks, ALWAYS is not 
needed. We should keep it ACTIVE_ONLY since we are already voting it
back in resume pah. I'll fix it in next revision.

>>
>>> then drop the extra suspend/resume play?
>>
>> Not sure if I understood it correctly.
>> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
>> or in arm_smmu_device_shutdown() path?
> 
> runtime_suspend/resume. I might be incorrect here, but I think it is
> exactly what you need.
> 

Yes, I think we should go with the ACTIVE_ONLY flag and we would need
this voting in suspend resume path (For the same reason mentioned in 
commit description and cover letter of the series).

ALWAYS would avoid the need for this handling, it would keep the vote 
active unnecessarily, but still that would have been nondeterministic.

Thanks & regards,
Bibek

>>
>> Thanks & regards,
>> Bibek
>>
>>>
>>>>    		};
>>>>    		gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


