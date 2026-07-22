Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97742C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=; b=DARGKOj10pY5PdIy6QrhBwI/3+
	0Fu0pTDkOXiErZusS1HGBnDqRhunmRJlJg48gwVndli3tPsq+jJRLMHEmoppWx02XccdwyR1UTTs6
	eLuVueO3FYakn76zj+Wx16NDj9q+MNeBmTs0PcoHrhi5ZVGEZ49dV576HDJM8sSWXDVcywrVUMbE9
	z2WrNaS1LneRDMGFRppq7hPSji6covARZnU3Nbx2rmSJcZgSTWqM/Cv/AR2AoBm88UfvnD3JQ0EQl
	u2UR2LkOx+zRZ1Nv5jk7SSI+0swga914LPTfQuwGNX3TgPw9CA2fcjV51jqnM5xBxHjwzW3QYwNHk
	WtIEVEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUdH-0000000Bb4l-3yBH;
	Wed, 22 Jul 2026 10:56:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUdF-0000000Bb3l-2V0v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:56:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x25N523912
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=; b=M5kizwTRKlP0HEaA
	vA5DdiU2TZqxaIj0ot5NdxHfHSItIYI2b3RPc10+STyr5HiUGHyaZB5qm5PWzTbG
	EMdBY7oiA8RtRJJAJ69nTGq5ftBWhd4j91Wp9ouKu9MeWoNtq2kWZqvBcvV6IsaF
	HzLCsov3iWnckNK6uN9y9P3+DO9m8hgrLicus93hakByASTlytmltxaBmSasgZ/O
	N4r+lbz4xa3tCBSRm3AK0Ha6zWjWxjTiDH53bjEdfkPrBzMfUM6+wt3Il2S15tpd
	fzzl26FhI6/OQfBvE87k3MlhAv1WyJX0UmU1hDmSUXp/wwR6NyRhl+wiOUvKreCI
	o5tG+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt11cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:56:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc5faecf01so251050385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717816; x=1785322616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=h+ClpyKU1wct0W9nkwYb3qNGJzuu9gpQ6367SyeXI8vvvLigyoPT0ggeXjYuoOcA2A
         V+CFmVom5C64PV6nFdCBmHjhwLVagcLtmvS2VwuALGyHMr6gQSyIfKU9m/GvqSpJla9G
         MEMpPZq0HIziHxgPQofIWW56fR564TesS5b0SvPnEeTWBB5gwLxxj/yjxN/GrtB+YPS7
         yShV+p156N2sHOx55jq0J9+b7XemJntRtxkD0P4NnIU7yYnnfjegmo/HcrkwiMScUQ9A
         vnyYpwMzpj6zuPVMAX4uxUJTIBxfpDnfhJyOo5ewR7GdH6Edv3DC7y+2zS4+9F6r2NQ0
         4XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717816; x=1785322616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=QF6G3Fh1TI/ZuGxUIe7MnewOOKec/IOORHQde5Gfcuo8updLR+CTMmLYfJBSg3HXkm
         L5EwBm1RfcGJoyNVz+4xP18C3A9LknUYCgQ4/49Izkev0sL34nuCT/u8ONaCSQyOfFby
         fcgE9qkn+pw4VO12FZ9+4HD9WAxkz0hWOXE2iNl6IMFH1jBfbASNxiyPFmdlny8STgbx
         AFkYBFCCOw9A9h2mikSZsygE5wbWjDX67lMksjVyRiUBmazPMqGLGGXOqBjq+FYEUfA1
         2izHqv3FQpJf+vUiBugCcd46vWQrNspJKaq8bZncrk2OwoaZGYhC3MKSYcbF2BAiGDpu
         O2Ag==
X-Forwarded-Encrypted: i=1; AHgh+Ro05Ctpbjzwct+t/xt1EOBPJQsvfapZPMb9gbLcQ4/g2+0OtH1/pDYqow+NB3q+TCO9xKuW2z62ZrO+2D1p5aBp@lists.infradead.org
X-Gm-Message-State: AOJu0YwyKxydJaSZfudifKkTeNxbIHY1s0fPevZ8oQ9bLoKXNQpctC6s
	9naFJxDfZ9KiJLACpgYgz9FPrfEFKV2HK4ssiJZ1hr+B6Q79yl7gi5Xb6Gb2x9EoYGiePf6ioFl
	ssia0XfwEmpkpgtrwwy3RNbikqDN1USTp0TRAsS1b6o+Sa5aSjC+DvouY7YS0J9rVxRpOtvdqKW
	jOuQ==
X-Gm-Gg: AR+sD10PUOnYiDeeyb3Bl9EOylBifNjZ9cNdMl/Bn4XbwE92oATORatjZcVBnlfXUck
	P53++CpvPDILwZjU36eub2GrRxM8FnYzw0HvJGQ7fQr4ljDMxTwGyGlaWrEgu7S6eHQMqpPUHqx
	nMVYwEKY84z/p4McY9S1kxp/3uj1tNEgNF72rsJvU7S+sgCKvxsOhyUyCPFUShDH1yMUpLS7XSg
	pEDhddrzc7yseBCNL3XGzXGRjTNnndkHV1C67OT9uBwF9ogBi4AAwo7hXWdgrYQ1VhF0g/paqpx
	qL6r1YYqkAix1ma8jeEb1PZSMo7ofaiCs28lHSsG0+InsPC5p164LVOziKULLegu6IY8yYoiFqX
	AZ9LdQd9EhJ+fScsY2/cLtrt50jncvRWK65SzvSI3Ch1d1+GS/8GI3TKhmfVgXg7r+Q==
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244223255ad.22.1784717816420;
        Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244222705ad.22.1784717815982;
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e65e6sm12700925ad.38.2026.07.22.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Message-ID: <f958ce71-c8bf-4062-a814-aae3df80bcf8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:56:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
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
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
 <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
 <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JxGNqdrei-zh3VyYua14kpwbaMTugqxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX7NjGA6UpjPnY
 7eNvw74I6ZBzCYHtvaLtm4dwdZIRfl4lqLBR4Chnp2fjcP+Mxfbl9EwcSc/8g+zyc/ueC+p+5xn
 E9RCIAu3HjUNgknRqQxq0+MdieU5AFFUR59Zlc3PquLcNHcEivqyG8WGogb90v77pHSYUOEb1tp
 Z4vP+Q780fm+RToJcTBoahwdUVvWK8xmPN85ZLQgoBMs7quia/G8jX2JrTIDfe+P8qAPcMCSK9x
 38g/c9oNlLlu0NPSQ3EMqzeQj5zZu0lRZY6jrvQQ+a3XWRmN8WA7+dFj0dfqeKtBZj5stFWjRq8
 n9aSXdIXbFizdoV4zGNWluDiEYYVItol8iaIsCT7ZrlUwbRT7w/HwYjE5yg1Q/vL9vGzWFBwGp/
 w86v4IHVxEdcM1QOBJArxx8fwgxQGYdvS+dN50AJfTsJAIiG2BZSHAGazoJlEVHh0dvaHeJ40kj
 ZBf7mqMPfXOymyfgFUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX/f4cPwrcw/7B
 mXRHeCdCO46n7QnhR9Ho8czBfo7PJkKxFx6nI7jWU/RmYVaXKhj+HuR7CXQ3rHBWz0fe9BUf12Y
 wlV/jbBSt2swN6CoLYFR9od6cIBhAHc=
X-Proofpoint-GUID: JxGNqdrei-zh3VyYua14kpwbaMTugqxb
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60a1f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=PwRE6yEF67RGCJE-Z6kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_035657_646752_2A9EDC77 
X-CRM114-Status: GOOD (  20.45  )
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



On 7/22/2026 4:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 09:13:47AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
> 
> This is not arm,coresight-ctcu. This is qcom,coresight-ctcu, so the
> subject is:
> dt-bindings: arm: qcom,coresight-ctcu: add Shikra
> 
> I already pointed out this problem at v2. Nothing in your subject is
> telling this is Qualcomm! Not even mentioning such trivial mistakes as
> lowercase shikra everywhere.
> 
> I also do not understand why you add so much redundant information to
> subject. Subject space is precious.
> 
> No, at this point you should not make such mistakes.
> 
> Please take this feedback to your entire team, so I will not have to
> repeat the same exactly next time.

Thanks for comments. Will take care of it in future.

Jie

> 
> Best regards,
> Krzysztof
> 


