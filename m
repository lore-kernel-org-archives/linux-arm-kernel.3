Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B85CE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBfiocvIunnaNdZDDLqDWW4sOXy+djzBwH8MF4PUINQ=; b=05Obw1qcFmLj16kK8sAumwF7Xi
	PjolZEZKSUWcY1LhCpfoRopY0bR/Xt2FeezY8PSZKSTS6vtig2BhdwGjywfCwH//2Ho4qsQnOWQsu
	aZNDBTHuXNFW3p3fLhONlOKvKnAiNNeHP+TwH5xQJyW6WaDc9nLocrKdNaGRPkYx9fmyoALat6bea
	JBRHLKfuHutgbfSXJUzC+mkhHWFkSN69uuY6KsJqYhX2c3X8aE0tGpZ3nMWw+tfHuP5v833/Y5xOR
	LanD1ttIWwgeYuHR0Lqsh9x6ul/Ydp1xZ0qdcS4Jq/ooIp2bI3DAJpH33KtayrAH2CJAzAQR9A0h4
	OF1/VuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEO4-0000000GgQi-3B4Z;
	Thu, 05 Dec 2024 16:07:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEN0-0000000GgBd-1vUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:06:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56vhhs009565
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 16:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xBfiocvIunnaNdZDDLqDWW4sOXy+djzBwH8MF4PUINQ=; b=hwivEnYFXmdrGs4v
	MBK7TzXbl65XrV89nzqUUFt+MgNVfhrv8mMWc/ZmftpyxLdS3BYx1jPgMPBNKcOF
	XRYyDZZPm06o61Dzxwi+mWNkI79vbZxW/PXjTgzYV4CS17czWFiXDd0fZBGPDm0L
	HMUdl72fFjGuNbxPgXN33ws+K7zYKKPBJnYBDNmFAvIIa6sYbE2HmpngUy/Gn6XK
	dKAMIhfMy4NeCsVbkcJOvVfp1p3TSPdO4kdHaB14mkT4tNn3a16yVxjg+4BxP/A8
	qprbVThfdQfsfcc1GCLQ59q+COiu12VhipMuMULbtLBTHQI5UXHIZ28vU9lyBqjs
	iOHzyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v8009hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:06:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4668c9aa8c7so2816841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733414763; x=1734019563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBfiocvIunnaNdZDDLqDWW4sOXy+djzBwH8MF4PUINQ=;
        b=Sav5eknzJ7KW7yO/eaQJ76oOqss9SrH+LL2Nq8oPfeJ245RLuBGuO1G935qYW4cb08
         q4L/06aTIxjp+wr2cu1MF1lj+qFU8qyXxNeWLlBuPWJ+Yza+aUhmdTdbIjfoNGMpQj17
         gkmiIIufZMV7sVxqnxsoytmJ3fQqCeS5KhEOXz0b3dtaAZ7yr9xK2Twld0TieQuxjk91
         nqQHXwV3tse1z/l5C9GcYlD3bmVDKKOn0fiY8KKXRPEVJuaVCmXr/e18Rjn22a7LXy8L
         0Q6ojvIbEXL2u4A/ZUzaLxMxFQva0Wr1ihg/KglbMKEnEpaIo5zeVrEbVX8QACH9MuaQ
         Ksmw==
X-Forwarded-Encrypted: i=1; AJvYcCVlhF9k1dLYt7GFsESjvYJwqNKbPjhchIdfG8awvyemk7bWBBbocHN8WwmtvO7B3Arxtij/57vNBAuXQMNltM9P@lists.infradead.org
X-Gm-Message-State: AOJu0YzUyhaudcWeAFXxmkaEJmVldJvHDPvh1SC7+uDGZ2+7oUGAWewT
	PR8VmRnY5PyPQ0gioi1dfOCOcnOlqtc1Zi94TgLo8sSG0yBDTK/gPUXZXAg3QYyi6Muc4Z+vpDv
	GYrDrSRbWZtR7bUkDSl6ePST89NpWC6H5Fu7TdQHVrvqUkSH4S4x2sfKVnVMTma1y/Kj6lOTFbA
	==
X-Gm-Gg: ASbGncvvahOnI4G1L3whCH5qmFxEMqDidnEaB1ebLbekRyfrC5G1d42MBdTz4KxWO2F
	9R4+ywAX1Z8XG6O/em1p8AmqRO0ba7N/8Pjo3FEQhjrglDtOtKpAoUQYemTtOD+WxNA2H0QJuBf
	rGdnV7SfkByQD+PUfbtbO4sYlPau+OXdJlmv/7m4qrjFIHyEldqHzBni3jsnuYeh1sSpZpI83HQ
	rhVrSkRMOj4BFlTQfY/OytEah1G5vtLJfGDad/i8v6RQvbpNRgkqrlHZOQpS3w9HfkTGArihULR
	NG92el5pvL6Rsw+gW8suTrNkL6o7Ct8=
X-Received: by 2002:a05:622a:14cc:b0:464:9463:7b32 with SMTP id d75a77b69052e-4670c0c1266mr65695291cf.7.1733414762961;
        Thu, 05 Dec 2024 08:06:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrCtcaE45feNNHFxkzDlmaVr36CClapjNu62lWnE1/SccytLaUZvqDSxyCoV/RvKzynTQGcw==
X-Received: by 2002:a05:622a:14cc:b0:464:9463:7b32 with SMTP id d75a77b69052e-4670c0c1266mr65694961cf.7.1733414762471;
        Thu, 05 Dec 2024 08:06:02 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dbf3sm110912566b.12.2024.12.05.08.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:06:01 -0800 (PST)
Message-ID: <54e9582b-8570-4272-9d08-6a89a1548bd9@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: Add base SM8750 dtsi
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-4-4d5a8269950b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-4-4d5a8269950b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p72wvBMJCcSY4yfMjPnIRUdeUx-pshkz
X-Proofpoint-GUID: p72wvBMJCcSY4yfMjPnIRUdeUx-pshkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=745 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_080626_614422_1934F324 
X-CRM114-Status: GOOD (  11.37  )
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

On 5.12.2024 12:18 AM, Melody Olvera wrote:
> Add the base dtsi for the SM8750 SoC describing the CPUs, GCC and
> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
> reserved memory, interconnects, and SMMU.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

