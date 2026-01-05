Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE238C2A073
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 01:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tuYxtSJ3jgyVa+7fnJ/tPQ8W2cf3H4jb98mjZUZblY=; b=3GcC2EFuJCI92pqw8cCM7aPPgh
	mzOSAfbFoTJJ5+pOCQv+CdFBV/LHKVlOyxzQPp1yvuAhPOM0I21P9QNWKl6dlNLAHMg0x4IkmjcCt
	OHA8yB7mrZJ14BF0CuLEV7jlUE2BrcOwucbNQwPS0xTXcqOeNVtB2YPHGlSbWPO6Ak0et7Dqv1ZOI
	VMBOx4agykFHIuLnNR1406yI3gHjaImwDegC4aiy58dJ2IepOZe1TWW6J4nPyDe4MaFzeN5B1Rpl1
	vzO2tlsDdIEW6NTz4YczsOHBZJiJZR48WMayaYOZ4VPKrEQMH67YYMvA68uSuREUpOTDCextezoNL
	JHgrW/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcZU7-0000000Ac2D-0x2J;
	Mon, 05 Jan 2026 01:34:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcZU4-0000000Ac1k-1Kce
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 01:34:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604NsDCv3760958
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 01:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6tuYxtSJ3jgyVa+7fnJ/tPQ8W2cf3H4jb98mjZUZblY=; b=WFTfOn3CEGwP6HQE
	xnDcP1KOSdE2XN2QhyrueO4EbYCLH9QGapZW3qdqsgpIt2+HdDatnb1mF5ArMkt0
	unZ8xXV1DnsXUoSQXFMSCA5djZLmJtIPpHqoa5FeLM62DdIl7cDqcOSmgp4aP0r9
	pL3VYdR7TRkUGhU4byyx6RtveC/Y7nD8WC2rCwttP+BS9V1Srv0HsuLftC7aSdk5
	W496pbgcC+pzz46H22DcN6qPRlhoKaLHIQxxzlsWc6WQyotiF8EgAdeU03txQ1In
	JC4kfgFZu2L6A1FTpTw4ucXyqZDbq3v6/6HBdVHVjtcoBE397wfZ7jbW34VQE3xZ
	IJI4Cw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qtw7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 01:34:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b90740249dso24010625b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 17:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767576849; x=1768181649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tuYxtSJ3jgyVa+7fnJ/tPQ8W2cf3H4jb98mjZUZblY=;
        b=PPdjfzk5nGvYtAUmI4o0xHFlv/5HW/5Xc/3tY3XyGuuX55IbAKVCCMgu6PVY5CL+Id
         pUk/LOBTdhOcDy3/j/YwlyMVGyE/sOIY7uCbk+eWWhnF1utzLlokd2S9FEN/36MI8IDb
         iTf46j+2iInMLeNGLRsZQ+cHaY1L9UU7ttd4Iegnust+tHhF8dcCXuBpTSErfnHEGb/6
         Di2zj0LsGbz1zeR7bILI5nuyehELn5zNgtpf6K56TxZ4VK8XLnk7i/dRpM2+E6UQAVC3
         Dc5XFDu2OwdDZkzYMEZPr04B/ROzscs9M3fB2psBS0N9OXaOO4vyapfaLRhgxXa3NzgK
         rLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767576849; x=1768181649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tuYxtSJ3jgyVa+7fnJ/tPQ8W2cf3H4jb98mjZUZblY=;
        b=Bm9yg1TguHaYTb0kIKGQ2eGgu9t0wDD8RWYmNSGAsRUFGcXRgNCyGBaZPAfgh9oQiz
         /AG82kw8MP8X4rpdel+c5aKMolPvr/kc2yajxEt5PlDbw7mIRMmnE19fZiBNMEbSLU6c
         TpUzDZM58nOXJ3m1pzENL2S0Fswl+aiLI5zIrSAP3IdC0AG+p1vymmALJXPBBCmOg54I
         zCp7ucPPjyXUFeN45IVYSHWqmEcMyZCYRr83vUosX8NSwEqXqMe/RWYEv+inSPkCfeYf
         G0OW8bZUXEEUBgH6bv+zllxnzC3KdtELum9TEC8Ji0WF2hWmIYh01SnkO+gfMWuiBHfE
         zj8w==
X-Forwarded-Encrypted: i=1; AJvYcCU1zJJr0CrHxHq5jPoof4bdLx5BW7HBca46yNNyrUIrMvuFzHQcsYV0FqOvYKj9983FZcH6hrcjnCSFT2R9FKhL@lists.infradead.org
X-Gm-Message-State: AOJu0Yywg9tTiXX/BDwOox3Wu0OsLztng7ROh7gbJ4PefpUR30YtQVyD
	QkjPW/SZAYzbfZJTI1cD9so/XP19v7alTTeCkqNa93hSMCtnEEn7esra1CKRJ0Uk/bZz+J0PssC
	oUmj8eUccJEHLi91gCgmsUSRpn5UNNsHmDhVQV9/gNehHpGm7G4cgE4+nAaHUUYM53Yj4vk3G1T
	FtrA==
X-Gm-Gg: AY/fxX4aytXKMHFsyP1MCjvq7q4+YVH3mI9rUC0Fw8yoclKUuWzvuXG4/KxFRbEDNHa
	lUatgnOoPmm+BwmmanTIC/ggQywCaGGWQ7j16lJlZqQetbT8BUfaC/opOlgK16DirNlsDjY2B10
	T8r2P4+h/IkQxpBN4eINCBkMP4sv6R/4Vcf78njMKMlL39LxRaqPuIVSWV0RJ+qYvIxIbmj8CKP
	JL4YbxlAs0THf9AZq2hsCcjmuLLTtbhl2BqrHX4qtrVsyEy3tjY7UO4T3Y8U5/RefiZKCOAIk7t
	TnUZ62o6W3D0nQGaoHN3XF5EGR3SqE0FGQTBoEOUL1FOKx7jdfVAyakylz5xPaAG7VdQD0F3qlD
	4/wuYWTOTT2BQD/e5cwgkHk7VdUvwAFtXW9w1+BQhMRpmlEiJCG2jozn71NPVjSS+1c9AjA/pWP
	U=
X-Received: by 2002:a05:6a20:394a:b0:35e:7605:56a4 with SMTP id adf61e73a8af0-376a9de58bfmr46505635637.51.1767576849046;
        Sun, 04 Jan 2026 17:34:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB97Uz6BLRebEcWCQq6sn6vCRFtbpKIGtOpQyt/EzPp2umNX9MVpttk4y6nc1VCysgvb9pIg==
X-Received: by 2002:a05:6a20:394a:b0:35e:7605:56a4 with SMTP id adf61e73a8af0-376a9de58bfmr46505607637.51.1767576848553;
        Sun, 04 Jan 2026 17:34:08 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4776df4esm4428132a91.13.2026.01.04.17.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 17:34:08 -0800 (PST)
Message-ID: <ba4f1e15-789e-4838-9d44-8cbf2cbbd38a@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 09:34:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
To: Bjorn Andersson <andersson@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
 <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>
 <kvvagn7badh2q2y5pmcp3m2pvazmax7xwuumr36twekagvdvs6@odqinwynfvjm>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <kvvagn7badh2q2y5pmcp3m2pvazmax7xwuumr36twekagvdvs6@odqinwynfvjm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XB0JHVrhQfEpqJqfX0nhxaZcc03GZqf-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDAxMiBTYWx0ZWRfX+9s3TnHd5LDY
 kIzMZ3t272X2StQUC6B1JRDguD/GyKkSZnOGWTTfbIBFzgXGATwUXUPMSteC4bQWZ3KYX2Hozss
 R0Yvmon7wy0Wt1p3aYTIa+fiCGQrwdlL//cvS1NkvXsNwEDmUv7a9Q5eIOGxVjDWZNo7UMPtEaB
 DWRwOAScFCTuEx3Zz34wc1QHmsrfcn06Ky+Xw3E45e9/Hyji5AyBl6xUxqAb8bUntR5uxGR0TWu
 atbKxdszEG1bordHjFi7973aSrxamHiMRq7eqt5HdYxMS6jIoAP6bTWr66ZpMRuXp4mGfnnekGu
 pz/4ALlXeZ3PfTj8hae07ecGMpkSAWST54VEgPL+7k25qbgsZ0j8ZV7G0DurZktf8TIkKO72tSm
 UXvcJkYi+roPb33sezUCJXV5Ck/1dEkXaZ6M12fLebit8C8i6/VcOWuatfVxobqSOVsHguwupIz
 l0ENYLD9IkusGzaspOQ==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695b1511 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=ye0mpR1ifiLF_JCK0RUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: XB0JHVrhQfEpqJqfX0nhxaZcc03GZqf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_173412_474285_16AA097C 
X-CRM114-Status: GOOD (  17.43  )
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



On 1/4/2026 1:33 AM, Bjorn Andersson wrote:
> On Tue, Dec 23, 2025 at 05:14:11PM +0800, Jie Gan wrote:
>>
>>
>> On 11/6/2025 9:57 AM, Jie Gan wrote:
>>> Document the CTCU compatible for Hamoa, enabling support for the
>>> CTCU device on the Hamoa platform.
>>>
>>
>> Gentle reminder.
>>
>> The dependency[1] has applied and I have tested this series on
>> next-20251219, no conflict and work well.
>>
> 
> In your previous reply, you're stating that you will update the patch?
> Are you saying that whatever concern Krzysztof had is now resolved?

Yes. Krzysztof mentioned that the patch should include the info of its 
dependency, as this makes the review process much easier.

Currently, the dependency of the patch has been applied, that's why I 
sent "gentle reminder".

Thanks,
Jie

> 
> Regards,
> Bjorn
> 
>> [1]https://lore.kernel.org/all/176615287813.688536.723538049922655005.b4-ty@arm.com/
>>
>> Thanks,
>> Jie
>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>    Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> index 460f38ddbd73..57dede7a90e9 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> @@ -29,6 +29,7 @@ properties:
>>>        oneOf:
>>>          - items:
>>>              - enum:
>>> +              - qcom,hamoa-ctcu
>>>                  - qcom,qcs8300-ctcu
>>>              - const: qcom,sa8775p-ctcu
>>>          - enum:
>>>
>>


