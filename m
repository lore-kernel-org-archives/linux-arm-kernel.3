Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E394C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=; b=C/7O9BvXZByFmhDptI5O4r8kq2
	efMHAq07lIZyH8493JfCwOuaki9ewwAWVEZLD4advDehJ81Gz0vAL5CRToaodY307seNgFK6oVx3N
	mITxs2MhHpbOD/MOmzN3X/bkoDeKKPdO2BLy+QUmcS8L2G3f6XXjGEogY+J5hQvMRwiaTwinivx/1
	FqH0Rk9Kfs7kHRNAS8zIuOhdHJFRk45XyIkxJHo6mRshNy2ivggqXB2+Q32bi5eF7oJZ7NCTpEh9n
	ghzfyzeHXvCOHDw0ULwBtlNKhvT5QdqSxCcRyK+5lcqbXMDTaB15PTPTtFiUIfMJjHmZk4dDBRrfb
	vIREY1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuhA-000000027Mv-1l7r;
	Wed, 01 Jul 2026 13:09:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuh7-000000027MY-3yzM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:09:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8RQS761262
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 13:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=; b=iv1Oi8vpq4nli5ml
	1Q9t81EyDDy7VVZkFid0cYuNfWDu5H07OMGx9T1ewmMItFFPOpeLcxfF7529EhWC
	vpZiMh0gNo4B4w42RVDngLOOXPr5yIZpQ7orlwhYRMfEPSJWOdwQQHfeQMi7o4qY
	W7RgrHWLMok30yLU/T1LkcXLJB4gz6imgBS18O3EQthPfdBHJYjbF6iCU70Uz79b
	sr+1qsrhjET1UGe2yG0h7poaJxB2ATU/Sz6WgL/Gi9pUqJrPXIwtB4cDo1Oqbtgj
	oBSr8sVSKRcFBGcsJE+xLjepUrMSgL+Yts6WZ2R/xhVrqg4lEBshGQP86awOlSHp
	BaaLqA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw46te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:09:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bdcef50495so13097e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782911376; x=1783516176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=;
        b=ZfDRVpDJY+0oWb+Ptdxe/nvK/e+mAFVDk75YZVRikUV5J4EEGGdVvv+F9pRMR7siiW
         v8bFbh30evo8nkekWoF0XA3W8kcG97JDuPAAsWJ5K5dzc+QDvS2YgRmStCeHU+pPsPht
         QHl49uln+ah0h5NKcD8BQhKRKsq2DemPp4hdl8Vs5xPHBiqz5ibiKwJ2U80Skh8+qMTE
         /MzaApahtAZESDIAlxqdlfMNfHZ4OrEsc20AHPYa0Xio5nhpmCXVyUpEebep94b0ndrE
         U2eT+YIujnb8ZoEQNNf0P2m0oTpQgZzfQ5J3jNypsmPiTaAGvCnve8ISM3sZ8IiyFBxG
         mLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911376; x=1783516176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNMV6F4pocwaw2OlSZLiAo2ckxtv00Hefmll5jlWwg0=;
        b=KyUDPL9trDSSheBBw8I/m9giC3E7GFx9NtnbVmw9voJiVQTFiYs8fOAhRNAJStsAMV
         Bkyv4/jSrh0+hpINx+gM1u2Ks1Kk0ejBNQMAw9JN8n7kfn9TqVFLd0IcrpWz6WZ3y3Wu
         hYDROlHvdbj+93m9EoOXClQGVBpo8qhy2KIF0ygSfLEBGIsSbBsnzCFI4XXVttY3pYRk
         pOnTeoFWW3NbOc0w//ghbzY80KSgNnW+go4hKv1F6HS3kN1Fp3GZQ8zPJ4J0UWJlT8wA
         w0EoicyEAoTfxr/rR+Aqr5lJa7d4DsGhd9OJ/mP9GVX+mPoi0bVvXkgzFawb5tgw9XCt
         Es2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp0B76nnlfjybbxz/KmFwD19iiWfHWtcdYNY8S9r11m11ob4I0CGaFOyK1BgtQVRMxSwDxPXjOxF/Ry/jgPI0mC@lists.infradead.org
X-Gm-Message-State: AOJu0YzYxK8Sg06AR067cGxy2nkj7ZhdrQkxa2KfE0OTKnF+XmlpR2lh
	pXMG2UIFxkhzz4pMqwpiYz/9O+ThA6w53TIXoU85qfeKnuxNJWkiNA1cBZbBUxdIWyjP9niWOCh
	0JLV29Lnilru/eQb9mkJO95HZ9VHIkkIIZepKzEhZHaO1QSnSIO8wPHY8FRzqTVDPC/TDOb6CMX
	0ckA==
X-Gm-Gg: AfdE7clkLnrGI40oj+TW0gfOrEjooUXvkq1vEjcTggWA9zRaAsLbfKu52s5hpjZA9LJ
	Q22oxLQbaQyZY4v4lm52rie0yu/nKRIxo1b0fVnqA5xCmwqibRSDBf2BWvztmG8Rfwe6Gu3MnkW
	sM6jG90z2Gx4vxJqkfgbm2ay+f9sgYGgUnfUXAsn4EYP/X86q9xwuH01401oczaSwvIRyOhInI+
	vlfo5eqULdd4YHohlHVmMfr/7edabzk09v0RoPfSxC1zs/sjVp88qV+8XzThiYimq3WTTR9EUQY
	WGBePJ1qB9T/ZXNYDituHUZqVHLZl+vMdYfyr0ePm680wpU2w0zfizXa8oBD0iGxVSGNW3fJmcM
	lVKaf942RTkWeEE6yXu173j7eztSBbdAVY2c=
X-Received: by 2002:a05:6102:5093:b0:631:267d:157b with SMTP id ada2fe7eead31-73daaac8f4cmr185646137.5.1782911376366;
        Wed, 01 Jul 2026 06:09:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:631:267d:157b with SMTP id ada2fe7eead31-73daaac8f4cmr185631137.5.1782911375950;
        Wed, 01 Jul 2026 06:09:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c98927csm2686116a12.30.2026.07.01.06.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:09:34 -0700 (PDT)
Message-ID: <12709ff6-bb42-4d3b-9f9d-e327cd8d89cb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
 <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a451191 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EXNCQnpXykppytCkcAYA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: jW6HstzJ7iF4cvgHlz6ZSnYK9KXLPZl0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNyBTYWx0ZWRfXwF4yUX9vf6DJ
 9zPj6LyUl59PZCXzh8O2LXYPxRxl0iTwfIpQmwdwzr+0n1Eg/J+OkCUIexIdG5I4oorN9QPkmAq
 5oJ0QWVyLZVmyogHyyIFhqpLxZbDkvs=
X-Proofpoint-GUID: jW6HstzJ7iF4cvgHlz6ZSnYK9KXLPZl0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNyBTYWx0ZWRfX6EWS5okeJw+2
 pW/FwoPVjS5gjbfm/DHkIFp2HGvsJcofDE0yxj9K9EM9i01bCUAzWggRNhV4YUuJyFEoGVX9NLl
 1UKtQyQAI9aSXjCLN8biJBJpLUhdxr75jxl7FzX+/0lmpYmOs5wk968cUuBOWxp/acn6+w0N8mn
 xlsCsqJ0HZAW5F+d86AUQvcKKF1+HrHxLwGMc8sDMiioNa6g/j/lpVHzuW+JvmvbZxt/zAQg3OC
 DBdAKOk1kmcRoG9P9r5AMhTbNVN9G1GsKGOS+8xfucJ0kLGwqjmVEjzLTuAcyamvvgzN0zqM//p
 Y/59gFy1iQDQfgMHUSdeV+O+c1s1O+NWZNutwajE46RTQnjV7UJFQRrYsNbmSyNWvM+BEuz0J2c
 PPuFjTA9pZh7eDkfIxCKQmUvnZDv/9SCxuInRuavTewiwODHYL3hWN9ooUFXZEHFoaboHJFioIP
 cMCE9KUbSDua/zMmj6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_060937_999583_94F92F63 
X-CRM114-Status: GOOD (  20.17  )
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

On 7/1/26 2:54 PM, Jie Gan wrote:
> 
> 
> On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
>> On 7/1/26 9:31 AM, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>>> AMBA bus.
>>>>>>>
>>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>>> created on the platform bus instead of the AMBA bus.
>>
>> [...]
>>
>>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>>> clearly distinguish this platform-specific case from the standard
>>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>>
>>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>>> I do not see there a fake, duplicated compatible for the same device.
>>>> Can you elaborate how is that relevant?
>>>
>>> Will fix it by removing AMBA related description.
>>>
>>> Shall I update the clock name from apb_pclk to apb as a platform device?
>>
>> Why?
> 
> For the previous platform devices, we got comments to add the clock-name with "apb" instead of "apb_pclk".
> 
> Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml

Well, if you need to break the bindings already, might as well on
the grounds of choosing a saner ("clock names shouldn't include _clk")
name.. Not sure if Krzysztof will like it

Konrad

