Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4856CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBVT1f4LC7X+qF9EMdOlijngoSBVrKJPfb4IYgGz1Hk=; b=Z023lk2+mCSi1HZJ51bMlsG/km
	LHr9I0GdZi/m/PUQZNz9XWV4gSj/nle68MsEeptzVvcR9Iop90X/dErHAVrnKSlKsW1Dql/kp+cZv
	W4eyl3ZAROF/CepDclvZGXqUayQ0W+jbPwd6Y4B4OD9LqF3oQJIiKidF2+BlNz+K8yGX1Ili7PmRv
	NHxaiCl4qP1dD9tkMN9MAx67/Qm6UZVGb5iewWr9gEYX0/MOqG4t327sOoIFVGofm1Y4KI6ZYHM6k
	g0PZBCTIYNHIifRfIW03TL/cXmiCGGHn6fGkQ2O8Pvjdhz+p8ZHqec35hn0Pdb2KILGW8C2NpLkkd
	JPgx5DmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E54-0000000CdQr-0Y15;
	Mon, 13 Oct 2025 08:38:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E51-0000000CdQT-1Wiu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:38:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nCvX028844
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBVT1f4LC7X+qF9EMdOlijngoSBVrKJPfb4IYgGz1Hk=; b=Fnhd6ZvzNmGrNqKr
	Ta2fhVD20s5qTfXx9lhoSl+Wt8fBhPijpEtd9jaETgbvk49+jcBOzd0r2Bmuzq3y
	q5kmT14AE6nRXQMn5+ccH9QDFph6/6HxlxjYg9A/bOfwZKd/2G1JhXrT5i9UYB9I
	DYrKyJeD5QE1+9U5peP40Cv5Tugu7YDSg2qZ9phCesD/KQ3xnIuGsZZq7yZ0C5Kd
	847H3V1GnXZZhPLHXfkDTxmhZ6E2fdcHy3bp7YCp4p6dUKmrdCoMgKdQMCwbKRK+
	8NktZxu6jgb8ANoeD+ZPqxU7ggt3zGJd6nEG3qaAURKGz6sVc/G1URbqdsJl2ZLn
	nspLIw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0kvuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:38:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befb83so10987544a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 01:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344734; x=1760949534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBVT1f4LC7X+qF9EMdOlijngoSBVrKJPfb4IYgGz1Hk=;
        b=KkaiHQsnxgLPqOu/2Pt15QuO/VdL7OU8orAjnCTr8IUt63v6qfUanZWP2T9UAWNYU6
         Uw+cxVPCIJ0ise2KWVpbYfrhPksz3MjWYtV4Oclui3eLpDWrFeG7EOxIuoJpn50cPjpR
         trXOTA0MmKsIrBFfCSVFX4IXRqeThT4KmeTt3lIBIhkcTrFfYbxzxae3FkY1nhk9Xhfg
         MnCLwk1jPgPzBWRTiX93+2NfWV89TeSY7Rj1h9Rf7kUVhd/YCjkKs6LXOPB9vXtB6Juu
         NuVRSXX/Fb94tNnPp6j6cvwoQQz8VEq4NTvd60CUGZcXPK2iLhJlikXD5OeNmCcTJ2mn
         kojg==
X-Forwarded-Encrypted: i=1; AJvYcCW8OYWI0csZLccig1gKe0HlhlaejCey7uXxxXMatw58R2tfySycZJTS3ES4x609qMf8wi51GMRo5yNymGhD3I9z@lists.infradead.org
X-Gm-Message-State: AOJu0YzwyWUBkXt0TbC3/TlK3ecIk71yuAEHOOvkDgLfQnj/oyH/+YHc
	zH30cuv35hN5pcYZwn9bxbUSALVpx6pxrkboosMPjTrVJOb5p7X06fsFDH9gUSGfYdkywWwxcUC
	FBJtMfwDso1Pwc6F6jrHQ9qFz2qEp3BShgqB+MEy8ygzzvmHqL3GmtXB6UfoHTJYSb8W+Oflmjy
	03Sg==
X-Gm-Gg: ASbGncscmkRevB7Zc6+Vxavl1QInVZngx1COdCfcUpogSplIFXA9VrgI46yrP4vOpbT
	DKJtCoExe1HiXL0250xH/DxLpIqYMZdla/ZjYvKgfCz8zUlii6oYqhFmlSQVFZixeNmcP77NbuJ
	P71ZnnfURjMiaPa2pA3PjvzKtoKBUTRz+VP9UVu6Ti5TbCVKLYXcP9gaDQR221CBDlH0WGQ44VP
	Sny8szEQBKpKxFPrjSNQjCvrQWLR7r054UWA8wUt2Cn30MXbrwxDCucQCZO/G2gLjGB35QtuzwT
	MSHY6Dp0d/Gj87N/aOob1BHrItm/djcLu7kgkqvPbT4dXNos2A6wwDImsuAOy/grVmkAVghvG71
	3w3+xz9MnLAxZvRMvJVngfBXSC/kXMQ==
X-Received: by 2002:a17:90b:4a8e:b0:32b:dfdb:b27f with SMTP id 98e67ed59e1d1-33b5138e27emr30306520a91.17.1760344733583;
        Mon, 13 Oct 2025 01:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs7ZzJjXcOdRj1a6iEgitTMaufzAdrFWCf6u6RbYV0u2V2fa3XRScqidAK8Ls4TD09WlYnzw==
X-Received: by 2002:a17:90b:4a8e:b0:32b:dfdb:b27f with SMTP id 98e67ed59e1d1-33b5138e27emr30306487a91.17.1760344733107;
        Mon, 13 Oct 2025 01:38:53 -0700 (PDT)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb72dsm11172324a91.14.2025.10.13.01.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:38:52 -0700 (PDT)
Message-ID: <4d6a74e6-53fd-4749-8839-907a9d0d11d3@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:38:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight
 documents
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        James Clark <james.clark@linaro.org>,
        Tao Zhang
 <tao.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mike Leach <mike.leach@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
 <175684936304.1217220.3167248149687349464.robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <175684936304.1217220.3167248149687349464.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXybOLZ7mLrgBd
 7JEC9guxZ8Tz6T6XHyK4UpKORfokkOy3stMGzXwC4DVzcYsbO6WlBRt501bMrhiLoOJ372gbk0S
 FjRbq/vdQNVkqvjAFDS6lnokXdMWToUUNJTvTJEs1qOfskD7ZwYtfPAIxPQpDuwmfa2tk5gWPUs
 CkkV5hEehYQztMbi9RBubkAqSxiLPlSwcIY/xDLjgpCZH2farS/fIFBaK6jlo+oLYmxTx4p725x
 +GnSFv05Hwml0MPhZdqfv9QVrKAt9PZ+gzD7Lsyqid/xT1DB9qKg6uGy/t67FV0X3HJL5fC46AJ
 2TpzJ/0gNYmGMWiybPIggW8jMszCrNw15bwh+5r9t+113MVYclepvSfzDVxxptNASFlJjgFZYeh
 PKOv/BtcQpsmgWv75xuYa/PC8iONAw==
X-Proofpoint-GUID: MU74wJ1LXZWHLgIgQPbMzB8kWMvj8C9Y
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ecba9e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=TojU4j7_S79YkeO3qSUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: MU74wJ1LXZWHLgIgQPbMzB8kWMvj8C9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_013855_430266_95E8D1C1 
X-CRM114-Status: GOOD (  14.04  )
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



On 9/3/2025 5:42 AM, Rob Herring (Arm) wrote:
> 
> On Tue, 02 Sep 2025 12:21:43 +0800, Jie Gan wrote:
>> Update the OSS email addresses across all Coresight documents, as the
>> previous addresses have been deprecated.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../sysfs-bus-coresight-devices-dummy-source  |  4 +-
>>   .../testing/sysfs-bus-coresight-devices-tpdm  | 56 +++++++++----------
>>   .../arm/arm,coresight-dummy-sink.yaml         |  2 +-
>>   .../arm/arm,coresight-dummy-source.yaml       |  2 +-
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  6 +-
>>   .../arm/qcom,coresight-remote-etm.yaml        |  4 +-
>>   .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
>>   .../bindings/arm/qcom,coresight-tpda.yaml     |  4 +-
>>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 +-
>>   9 files changed, 42 insertions(+), 42 deletions(-)
>>
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Gentle ping. Is that possible to get this patch applied?

Thanks,
Jie

> 


