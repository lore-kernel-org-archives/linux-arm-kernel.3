Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC796CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=; b=kxPDjO3vg5kXUBQ0NynqhRfp5G
	qjfv/bg01Oapi7RU9Suc49Fnm24NOp93B1P5lcitmUdfErr5fjZi5/fSwJ/zZxRpZ1k/OA2EwkFEu
	Pb2BtFpNebkFZk8BbXUZ15/PAY0aDdjfBZzewvIDUlIq2TTJ9sBz0VY8tQ60PU6HWBE+LDdpxTIqF
	gSciuHW3yEv3T27XVHpcLkb28YaYH2/MESi14dOQ2HFENojnZzlhKfEgAzLR2ca3c09mdqTzUpcbi
	dBYPOpY1/3wALcrfnRPguauxOpGkyKD9s/imCCMkN/lSKMJHbSeNYYYak1QVwd/i2bkQN+P1NUwGO
	zmZZ0GdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNz7L-00000009Mck-3TdI;
	Fri, 15 May 2026 20:26:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNz7J-00000009Mbp-0wMh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:26:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJeZV5903650
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 20:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=; b=ROzmynIPA6lwPQK+
	xKMW9KCUVMKLPdJ8Z9R/S1iX99nA855cRLSEyp2k2Urql3d4cDxRr7GcEQVe4PIJ
	2HcDgS8c8Xj+Gj0j+SiKNpO3aN21rwAzwBuiuFPMsBRp+JucCvBdZmBf5A2Xs7mm
	0py1fT3+flQLXNZgMlw48QqfWZIYOkUTP/Hh+sWqtk1bEPehlXdG47zH2j7b+v/K
	uBxcFmYcDNgIU5xCU+NFOdFbPEQ6ttSCWrSDcj/YYropdlGjRoxIo+M+PjDRqcpf
	75J+R9jHtD67h3WpEq8DBDnfKt6Tm7Aw/Zik5N4l2DtzC9r4BQDnRd7likqnuDSh
	2wK5Qw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e670u8r3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 20:26:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83eefe4867eso191767b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 13:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778876798; x=1779481598; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=;
        b=Dr7RssL2ogJvSoCGPqLmoEu3AaFPaiarhgQVxW3Bbp1rl4UgLlnUZD+iSHBRiT0oVs
         e9kAHizR1BmpcgPkfhytYbEzxWMxf90oEEQ4m/GDHkQnEhRdTCOyOnZHQGqwyhtG35US
         pJtXvrCd11wdlFWmryICPyzrLP3PRmkai38yTqZEF11TMw0f4EHUn+FhgYctMf4UrU6N
         AkY12fi0CZQnwqdrdJtBhF75UARemap1R6BUiAf7Ncxi5k8oVTUqkxSV196vU7dN0dBu
         5N32jGb4rxPicbLz4MC+o8SUdlLywBVPe7TWOXV8lycfhNDki3Qfj2EhsqOB74H2NDxl
         b2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876798; x=1779481598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=;
        b=F7GMaimNn5u3d1pMgZqqArNiXsZ+SHsXN0VFySrbc+Ap0fmb2ILLQo5WEXybu5/Dsp
         UBlzkkVQpzPF5LGxZa8w0hg0BceUkLiSBQLCqiolcdxjGjy+wIO3Jc7dTzZ3hqoCbrVa
         Gxan+a8dbgTLAR8jWCIwBsL3rPkhPzuLQdEfUudYmm1j9VyXZDVf22pCg0utw0T9NZhR
         X3OCbOsiQtS7FBFQjsKJ6GeRaOgu781uuzoLO5ENckK0T9HdAMCUqWlJe5lNpSsB4Iy5
         ZiXHfiioHNZKD97tJ1QhOYMqbkNWJM2rxrdT163TsAgNcplMGDYjI4hATJW90igMOd9F
         db2g==
X-Forwarded-Encrypted: i=1; AFNElJ9RUoXTcFlIZNcbM7qqCeLRrGB/1ymahJjzaJbQj/vCH0OvD0KOwTA/yAw+1QL982SE7yttu99uDmDtC9KpA0n/@lists.infradead.org
X-Gm-Message-State: AOJu0YxxGLAXJB8wpKEJaZd7rvVzlp27Uv3doeHJh03vKmfOdl6fYCvI
	aDG7AWw0+uFTGjYyjcvKrLecmfKY9Z+bQjhDJGLtRvpRIO7DfN3RoISHGYhvap/dstPLXDidh6w
	c//IEuNa2VgUbebEf9i2bWFY3GBtYLg+wvoYrdTU4Hq6hItSnP6KzyqwRo87C5ZH0naC6MKSnT4
	DzmQ==
X-Gm-Gg: Acq92OFMPhsvlvJ0adyLU702q+rTagIUKuOvfFr0iHYxnWk20VsYasCkWgQDNRmAnIw
	a21n1OyDSpuxJORty2Le3hqjXZgMGlhL8YLoNs0g9suVkZIEKN/0eRwqVv18BTBMq7bmv5Y8Itv
	w/ksxVFvHmJheH5ST8ZNd/BOWIaJjwueLpUeKa8cWAUOEU5rnCeiU5FhBHq7CxYf0xHbVIeGn2f
	S55p6ebNtItlnbQveuQLtQF7BC/wLsLeP2v0uaeJSc30zZWckC02lkbYeFvc4fjqkaB+NIlQ7ZH
	f6QIi7aM8zfVI9DjKgEVIRmQREY6emwmYqp67K7TsppLwAE8vGaSV9yDNVqbeieEVHY5gMwMOtS
	ZhO9pBi5tnVqg4Z/XAMNIOzqBssDeoGwn7ZYERqwBoos=
X-Received: by 2002:a05:6a00:9502:b0:834:e092:2631 with SMTP id d2e1a72fcca58-83f33c3710dmr5683366b3a.8.1778876797977;
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:9502:b0:834:e092:2631 with SMTP id d2e1a72fcca58-83f33c3710dmr5683325b3a.8.1778876797457;
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm8255734b3a.2.2026.05.15.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
Message-ID: <8ceb09c5-7da2-4cc2-9e6e-0c08b509c212@oss.qualcomm.com>
Date: Sat, 16 May 2026 01:56:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
 <20260515-reindeer-of-original-skill-cb55a1@quoll>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-reindeer-of-original-skill-cb55a1@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5VL_WYh4lpy7G7HHPb-Z_TKirKWV9ovW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIwNiBTYWx0ZWRfX0qpGxdwK5ojY
 Dxxj4piMgK0OeKLrlFLLXYEjPOyZqJlTwawEmOybkhAtszNU6dFgwZlpue6sEvL+ehB65RYEBhD
 nI7QAGfAfe6roBsoqxmcWv7D/ifUKE6kx41V8HMdnqKopwD431I4z98xET+IuAEyug1wlZFm/UW
 Fne+bPYHSKs5DWTg20hH9dGXAga6eQm3GbZobQmuM2DF1SbK/2dEF2Lj/je6/TCVK/1YTHviqWc
 IPrSSBF3Muadi8Zy7cmd9nKHuHrKK8OZ7xdB0e+maQB2+M5dL3Y5ttIJvKm3CS0rtp2bIN7Bul9
 MER7f2mulrjzKTOTjou50Nue/CRbwpCK2tWIOHWPqmHhg3csgvLcXbVPlTOj+mDbgjyJKr3pvze
 uMtS41msjnZSP19nnAu+WhmegoVj4fg3dbnKBf4Bh1hU1xeODYKGaDoU0CZdmqwreGjtFGcMS8z
 0nAiJGBnfxF2HpKdz2g==
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a07817e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=T9Sauys7PDlx7jIQPikA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 5VL_WYh4lpy7G7HHPb-Z_TKirKWV9ovW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_132641_387881_2F16B631 
X-CRM114-Status: GOOD (  15.64  )
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

On 5/15/2026 2:11 PM, Krzysztof Kozlowski wrote:
> On Tue, May 12, 2026 at 03:53:15AM +0530, Akhil P Oommen wrote:
>> Extend the sm8750's clock description section to also cover Kaanapali GPU
> 
> There is nothing about sm8750 in the diff. Probably you wanted to
> document the constraint of clock for Kaapanali Adreno SMMU?

Before I rebased this series on top of the glymur gpu dt series, that
entry was describing just sm8750 gpu smmu's clk constraint.

If it is confusing, I can reword it in the next rev.

-Akhil.

> 
>> SMMU since it uses the same single "hlos" vote clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Best regards,
> Krzysztof
> 


