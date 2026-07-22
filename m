Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58319C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 01:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=; b=sqU+hKLAiukCcIywJ56FEnWtBM
	H6NPZsFk9Rp2PifIjI2JQMjUxby1gjDIA8bMhYohCCkKL0AlNxgViWAtFZGxk49LAZYcgdZnb4gJ8
	b6OjVZRnqdQkUbVb/1w2tqHOyazFJLoxXAyNtWrSQTV/PjpBVxqUgyqbiSSczh4y10rtM/400g1uK
	cJsdWfFw3UI1IYrZJTIejQlfXW8erxznzB4gN4sns0/X1OaT8irp2fxpZhpqm3qqbICkCdYCf3FAC
	+S0VWDhRKUefe8/rAzogENluutB8FBQIsgwcD4Rdy6BzCaGE/XNwSnlQ6yG53ludTMOFKOjQIe5uK
	T5Rage0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLLx-0000000AgLt-3D2y;
	Wed, 22 Jul 2026 01:02:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLLu-0000000AgLA-3zQO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 01:02:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZNVP4190010
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=; b=A4cQdBcOfzSJ+xxs
	Wf9YkPWkl0vVI0PXxqY2IwQSKv/6Rw3/yPwo+xat7cf5zHYobvNq7EfHyy7BTem3
	BhsTYDmn4UPLoGNNn8yy0+GlJVVQ5soCHQnuSzg7oiRRKUM/YPAHsV0T9XTr7ATn
	Ce+aWg0vGWW7XcE8tJL8hFcdJueR+bn7XkAwr4tAe3QsEzuROnRxYHvjnfU98mYe
	xEMN6AeVQscx8l+0BzTFqp91S9TmpMkFKuFXPm/cOgM59LRoxPBYzC0POR7wua8l
	0K5lOHRmEaC/NhhEeTXJgvtRH6RFNSWnoNRDAofV2nR5VC/jWaiVHfCVj9XaK1Za
	AWGciA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsupyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:02:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84842381150so20949540b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682145; x=1785286945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=QzbwPXhnK3d809lEOo7eMWCVZIy0Va6ODQ8zf0x7lP5YlY6QW8lI3vnVIXQJ9J536T
         MfYbVVZqJN5QARJadRfTNLzIQ8mj9oL7lPdDx4BWmdulEj3HZBsln/7qAkQv5sxWIh/w
         4CNW0aGMWsbVdJrHqm3c71OzfyZHaAFX6FKyxyhQJkTO5Q49vfCikbIWJZjfDckwosfS
         eXn/UVIa3lw+manJwEOkUCxRZuV9Kqm0HDRrstgeJsDzj81jBkGQLHE3biwQKx6ASEnj
         kBBT9h4N9pIF16tmseZiBg5Qt2KBPSwhKwbpCvdWJzru6968rTDt7Uzur8Jqsi7AAqri
         hXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682145; x=1785286945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=d+tCyF+SmyFcW53oBLZcZWsjRGq2LQh047ongzXwxOdHEfVPr+j3zF5/8E9y+9ojDp
         XPnGbIV+uxEoveO6JXb8xhHQns6ee1XQGbSaqBaugON02/7REBUq0QISt9vz2l/cs8Ft
         vazglDiMz0DpmaksqcWI0a7AS22X6igJ5i+st53376gRVPmtSKsXOB5iKgev90lmDSUF
         UX3R0JJyP8PaYcRI/EpNXbwNNLNOVYqhEQkevt5Qp6Rz/Kfukko/Xi6vAhb8mHlHJYvZ
         ndCm5570smhj/63ht3yt2yfI4HOErZoS/loOqA0v3NGbvImjoCcD+G9WIU9TNuTRHdkF
         Ex1A==
X-Forwarded-Encrypted: i=1; AHgh+RreySrjJTYApq+tvJ7Xr6j0U4wcL0hXSR4/kMkWjrShs6erQYMR+F1XcXwR+5RxA3zd9bvhkK/RNcesFOp51w11@lists.infradead.org
X-Gm-Message-State: AOJu0YzrtJhAl/zzXAkuYBxre9AeVAQtA05b1TeUT1pfIbDGCsDS7QrK
	mMzBEXhEVKcWQKz6fVZ0ZMM5PS6Ps5M8qwWDay5i2UGm7vmvmhEqRe0AWBp4CTEKpvQHJoCdziV
	qrdole3OllVfqvNTdM0rPYQAZMfSTOJLMEORzvCdF9V8S2yBD6iC7idxzr1JFI+fDrpSzv/qhyI
	fFEQ==
X-Gm-Gg: AR+sD10yVBdbApXghFNihViKbpqFH3RT/dTg1fwSkgMLqvVFKft/MmrsxGYviEdeBFt
	QQFKL0s2CN1xqdyrnrf1MfAF3JPp8hkOi2gN3Um6GOZyYopXHd2dXm0mhQ2WPmL2TfeNUrX8oUU
	sE2qQw5+P0hVAIchYpd+FJYpJeqhtcsIw8gZ7jmmBDxEfItRFdTXxG3EGqM40T1YePDMT4PYRaT
	utUiuNBZUh6wns8vIaODniRnD4lewszk5poeUm8FdwyAS2uHVQnkPWsoz9k8ORyWSwhCieBgpjG
	oPljNrDChJANlAy9VdoOohyRV1PgQmR5L1wg/asRmQkv0RAp8hPbh6yy66okfBOStpXSo65XqVL
	aoAGH65mk5cfu+BKJZ1Qz
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558307b3a.67.1784682145225;
        Tue, 21 Jul 2026 18:02:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558254b3a.67.1784682144785;
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237761sm475347b3a.4.2026.07.21.18.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Message-ID: <2a532aa6-925a-4c97-97d5-22f4ec6e51ba@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:02:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
 <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
 <20260721-stylish-dexterous-sunfish-1653eb@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260721-stylish-dexterous-sunfish-1653eb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k9QzGxbR5NHgz4mpTohtFkHrXzAYLhjQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfXz8E+cTt4UjGA
 UAooRWvN+JOpwzOuDSLPuHU4WsIRF/OM6aocYpNVQbWDjLDK7M2ErBpEwRPr/xZP1WIS2sKCCA7
 IO3ee2UVQkFmTwecY4l9WAvEDSF7HRA=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a6016a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dx5vPtEcpawhRY5uvL4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: k9QzGxbR5NHgz4mpTohtFkHrXzAYLhjQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfX1neGbl+qfVnC
 YJYmvQBNxEb6A3+FX5uyNPZNJkP44JuohZIHUN17rkJ4sLXwp3Ae/ng8OCb5tk38pk2FDngQGxP
 UdpXFKs/AsyegLYCBfKKpvouaP3FEZ8/31TFfWFPUsDsUXIkQYYJObPw0NURbN6ETTYYu2bzHFt
 fb6JBXYDdklgD7AEBaTw1wk1SqKR9sLaQ68EmQYZcvn1y+xNHcNawtwI44l7zwHWxQWNA7i7SP+
 LdzaKrzJwBeviB8W10oX++pUW09woFM/A7KoO4KRoBwdmNj6DKeYwxE5mU9T21lfsUfa8C2xeol
 Q4Y0Xkp+cU+B3bmfDs3aK+CZNi9ALfDgLMkZXh07aEIthqQKcMVQ1UaSgEtGTinevagfmi4IqiY
 9hxfRUPGwES+OrRCjy7Sbnrf6ZI1CWmVC1UVEMcj95DRlJNS9aWG0bNjgeEdVdfMq1lb4UxE5hy
 rlCJuXgOA2gKWa9W1xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_180227_003965_B388EA12 
X-CRM114-Status: GOOD (  18.71  )
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



On 7/21/2026 4:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 09:16:14AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> And it should include useful final prefix.

Thanks for pointing out. will add coresight prefix in subject.

Jie

> 
> Best regards,
> Krzysztof
> 


