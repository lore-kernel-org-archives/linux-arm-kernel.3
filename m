Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08206D6ACD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/77vK913TTlKN8QIeaXI4qErBxlb52ugP8le19n7SKM=; b=UvAXWoJt+rvbkdT0Bw29dQIKeN
	Ex3gZSLLau/XHRYJttu/xpuytzRsyIlW6jXmMCtUuob2408bQW4GX69UsTqp43G/pSPvQeD6DkxF6
	aakKAnStdILANY+cGcIj73eTpMYne3q6B8h3NFWRt8Rka6WDQUIkyKEWGc7yHAhc/IcaClmCvbXnq
	Xw3ZnlX0zUowXITddysGGFcxPgjWqfbKdP66uARsBU1OYaABalOfsDSt3Z3Qkh2z+sDGGS6PF3wgi
	U8bWBQ+0EZXVCASVHpw0zvXS0mhTdu5NAoo3N7uVIZsPdpeo9HEL4+lwu7xYFw0LPYOugHUousk+i
	y6TVUlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAUL-00000008AHN-39HR;
	Thu, 18 Dec 2025 09:40:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAUI-00000008AGU-3KUb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:40:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI967vI4147974
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 09:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/77vK913TTlKN8QIeaXI4qErBxlb52ugP8le19n7SKM=; b=krdYzvvG87C2LTbf
	hzmQpzCbTJr3ekwoATs3LgDfuWtaQ7zAsVTPSIn2ZjkJC+TXhg4kbaPbb6dsXpSO
	veVh2v2ifDj7jqGH02lqu7qBvF6aEAOWOisKc9UF7MHRZoCvxTigreIZGnNnQ6r/
	a4WIqT+HKT0tzGCg94D6NTrnVK3M/1656Vec50f6+HG0cUrSvfzfaxas6BKr6s6d
	5dyf2HuqnARGMnH1CEn7NrYK/idekVq+gRd4Tl3Z9xkd8G5E+gZZvLbELRldL6zM
	rah4aYpjLS8xJ/vR9XZS9VgKqEn5GJhi7QAAanjRe8awoWw5XUtENdwhcH8E96G+
	T/wZMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7ajxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 09:39:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a09845b7faso6669505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766050797; x=1766655597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/77vK913TTlKN8QIeaXI4qErBxlb52ugP8le19n7SKM=;
        b=Y+Yayc6g6q2JLiJRx/Wl+BAwzUyz6G1e1m6IO7d2/yJYes3h2V0ZMaHbcU/kKZAOZm
         uADQXSEKwh73M5C/Rw9vyZkxcoGRLzkxYnIID/ii2Ju5WuGLPQil6TUSGN+QdLIADyh8
         qwlj/P5yIUCjlVBAchLFlq7Vyhp/IwNc73CpXeZyeC0bR/NxnXpkjxv+/p0g5BaFn1ap
         ypVQLnzeuablIsUR5ZEUjNliXVuMFj/QWhHrombyp4ipT0j5hWJ+UGLXRudGRrs+xscr
         /eU2dRiWurHqzrlaPpAPJ8IIVm0puSKU7tgEnN4NueNQANd0BOAxFE5d+DkncIEo1bKN
         ryzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050797; x=1766655597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/77vK913TTlKN8QIeaXI4qErBxlb52ugP8le19n7SKM=;
        b=b/Q1ni2ugnwv+WrZWbHm5ShhUM+M2r4lL3GWHkINuwFL3tR/B7hzAvILE1/avIdThm
         AdfOQaegDfLB2FrdmMNiLknN6CVIC0l7R5HbT9VDcqF2gZTkn8pi2YIoPTIQDblJEDqo
         OLrNakSRJGYa3gzfY0TwSe8nkGvjBhFC7lQTeZbNFYqPf1LLXck7K0wE5e+rx+MKgvKA
         sWGHxkg4/h/UoPnhAd9OP24vvia/bMZzqHLseeUePro56fnv63ifwmKpbVWXXdL6waHd
         Gfvx+wyjfMehu70OYUR3nLq766P73fBDe5bLnlI0fmhqHGwDb7tcHbVZQVAxJduIHrSx
         nRrg==
X-Forwarded-Encrypted: i=1; AJvYcCUWUCtODfwH4Eat7YUZk0ad+S7LlDEitcntoHRJTNhYi0S0zMW8YSq8YJ2dj60J+ecQoW3kCSBKr1HbBcb38fXe@lists.infradead.org
X-Gm-Message-State: AOJu0YwvCnKHz3gs28vnVJEMoJ7t1g16TbyCjQFp4bYXlP1hk9c68Vdi
	8X8tZOQuRROXWTJQG8bcy1FjQndOoayqQpToJlwbr1cWZ3xGaUaHtJ9IaHH67nindp/yOYncm/0
	hkOqeefILobUnWXzsx4e+nkEbb/dtC/dJbgDtW57X+zGAsVlSKot1ewOT2i+gBNo9h4iHNPCkuB
	IZiw==
X-Gm-Gg: AY/fxX61r5c1JvYK8ogcHBtf+ZMjmXvIY7dixbbLDgg2xivp9IqRVGHcc5WKCNC7xEe
	71Bna7agiL5afTbkSFx0lvLCT+02AgeM6Q3UOywtyTxi0i+FZ5E27V7cqhBGFieJNRfnpwnWd9R
	WvP1Wdr12gRggupYhBwJLbK2+ODtUhHPRyyVLgF0CLt6geKkQFec8P7KFPcu3K8KXkg5juLt0eU
	RS0FSvOjlyKObepPJlNcwnfZgbAyt+evH8EL+7ngmFQGniTAEUfVyfNVXPjz7GjmC/L8v7DWNFM
	qoNyqyp4696HAwwV1iwUkQW1lr6I7FE+T+lQXwZSQtglWnDLVG5hhsYd0B8CX/zbTe/I9RKAxql
	RdqBJ0Qk/zd19Lilditd04LKwl+zweVXDiDhrkufhYWUsxda6agrE86Lqo/Q6CIzY2q7siTJAJ/
	Y=
X-Received: by 2002:a17:903:2cc:b0:295:888e:9fff with SMTP id d9443c01a7336-29f23b5f44dmr202652045ad.20.1766050797490;
        Thu, 18 Dec 2025 01:39:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM3h7K3BRs43Yizvyw1/lLNzYQJC3C2/OyMTefiN1IrLzUvn1VUrHuWvz0igXIwZUSHnooMQ==
X-Received: by 2002:a17:903:2cc:b0:295:888e:9fff with SMTP id d9443c01a7336-29f23b5f44dmr202651815ad.20.1766050796942;
        Thu, 18 Dec 2025 01:39:56 -0800 (PST)
Received: from [10.133.33.162] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c8absm20015555ad.10.2025.12.18.01.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 01:39:56 -0800 (PST)
Message-ID: <6a6fe308-d2ab-4cdf-a7d8-d322d915cbc2@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 17:39:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight
 documents
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        James Clark <james.clark@linaro.org>,
        Tao Zhang
 <tao.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
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
X-Proofpoint-GUID: 1AY3pf4to5MnLhsi4IIUQklvIQ7eAqi7
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=6943cbee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=hx2rv9DSw3ookLii8U0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1AY3pf4to5MnLhsi4IIUQklvIQ7eAqi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA3OCBTYWx0ZWRfX0FY5KtyYAZKH
 YFIoj6xnm7lX5r+JlXvKCu2qHkBeNjJw3kNuOqjdmm2KCYzCPloxjrg+avoUZbZtU1uvQooikpK
 Iu37epAquxpJJuey0eWo1/GflEHULkAHgnIQULBcnOzxdUl/3e2rNev45rephwtVrBk48Uo5zvp
 iyXlN7/aMZnEev22QlN+9UGAaf8c/SfgTCbRQAq6mvXqJ/SzSCvTQW+gxjzhMBR4Be7Ns4P/5UG
 X3FudttxCSiidobtPVODCDKBdxQ+fYaKFXJoe5DtyCB4GAY/ORxi85Ls9W2MeD65KAThKlbrOhk
 UPdTPLWvcgbcaTqJGkLNKtc8PjvjFAkTG8rIzNND6nIhJDIp8rupyEwfB/M+B8rRfO/kAG4bEqZ
 QODuuX/JYBDGsSV+ejurJnYg3uqgsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_013958_844121_03F443EE 
X-CRM114-Status: GOOD (  12.28  )
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

Gentle reminder

> 


