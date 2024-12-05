Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9D0E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6x0KHCQDiAykCeDoL6SPhnPeHMpJmBzuR92rcSSHCE=; b=vkNLoa7ayy2QUD2En3zRZm8ECW
	3NmEHLET2/7MzofRSVyBBCYFg8+SULgmjpYMRkZ5ZO6/Dbz5VZJAHu+9Ezx7ETayM0TL8ElFXv8e7
	lXw1yDHSViMEb5w07yYoEt8tcf1j3ez3o+i/6wlWKrgFYpj90p676Z0SfHeNBLuSmusHlmIkuH2eP
	Qllu4+nXIkj33MYnB/kwWD7VfQeBXUBGcey3Y2Sm59YegSvpLuE5vofvzw8bKQCZwPtnZhiu4coly
	MT13rhDYzsaewSwKGz3+JwJg7PZn5UBZJiKxeOxwbKb/k9geNJ0bXFcO7zkuvqIIZeSZisBuaPn79
	3sYkWPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFEp-0000000GrXy-3RHk;
	Thu, 05 Dec 2024 17:02:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEyc-0000000GnkN-1i5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:45:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Bpk0G029385
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 16:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6x0KHCQDiAykCeDoL6SPhnPeHMpJmBzuR92rcSSHCE=; b=MmadT7w0t4FI82xy
	/QDeA8tEaN4ILLY5OyZZ9btHhflbxwFDE/wj5RAIHom883jTYjujOJiZdG9Fl6Ux
	mFlCxztrCxUvSWwSKs6l421UBlr4U7LjQeYzCEoS0XdhJUy1NGIBwXH2u3hW36Tj
	x/vol0xl2GJEmgpORubvQwpbCmw+7qtJFOao4JJlbLR1VUPArGt3tmGrOUIWoMQH
	hDYL9GPChX9QVtVaHnmeDY1TeeFDyGrJHsjULT+XtkF44tdLkEGgQcNzP7VGM228
	ZcWhznX2WNYGcMLvRXQWcTeCYZ3lXPHOkMHvwsb3tB2TWUYi0Hzey9pXO7NWm8Jq
	O1fdEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmgt8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:45:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8878bbe9aso2863626d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417116; x=1734021916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6x0KHCQDiAykCeDoL6SPhnPeHMpJmBzuR92rcSSHCE=;
        b=H7yXfNTMATgR9e2ewyjLeFtVVEbQQJlLIsNEl4EPkuL8bN4Q0UJQPEyx7mlBMQke33
         qwp0UgK4TVk+4rlu0TP4qN0Hd9ATjrMU8skhOQLli/WyD+usZKLpo8sVfQiwCWQVuwi4
         VVpRa84DGShm10xnI/3Cd8dXglA8b0OO/8SwoNYZ+/7fgmilERBotHGnlvl5auC3TlR5
         1bjfAiH2tgCle/UCaJySUOlXoEEmEj7dTjOzT1g6fPeAMaSq0KeVKY0iEgBU422TiTQW
         yk33/hgqUZBoU1HFQUeZMOcpRAaCwJywfcJqfPoZNDP/gdYSPNeQafqHIm0Duuea+yKO
         HhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Qk7RRtbMkzFbfi7nhLjU1DbiWdrciBdRFj2an4jBvxM+M4E8Oyk1lO56XHyIDx4dAKfWszqkZsOGIM+y/Wod@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ZgHjpYCG/PQMJap+YgF9wyImHs7wrDcplcVu8M43NTwID2iK
	XzAipelNYdm/leUr8LwkM7pJTknans6oGRlzte+fLPh3EIBdAol8dgvaKnFiUoelD6mJklAvxIS
	gsNpw3gnUCAyCOAAwnWqa10TmRSkXkFEPYBEHPFpiIt4OFBn36WHMkYh0AY3+aMRMAeMFkNruin
	UyLmVCGw==
X-Gm-Gg: ASbGncsY+lf3FT2v+E+/BKseVpnZKoe8zN0+UBrp3W3/24EQXxEqveTXWZvzlofolQ8
	GQYYMn6EYkVL5gvfq3yIOAExNJ9b1mWM2yHkRv35VzygF6tXpI1w7waTUmhG8fxyIUWI36vJlwO
	IeDIBAenixLVfZkprFuJ93xVdne8tscC7GKBTPQoPs6rgm8rZQEMReoc/TOx59r+M+COGa0ROK9
	EDUmN3KaOflk2+3+slE4izM2DTfIx6/SgJ/g2RpGLglLDbTJeeWitvMT31GoocJJpOzpoyXhSfU
	8zafE+vE+PKP5Z7DaDPqSFi8e6eFF4s=
X-Received: by 2002:a05:6214:2627:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6d8b73a489cmr65325266d6.7.1733417116172;
        Thu, 05 Dec 2024 08:45:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMc4CkwAoyme+72kcypxiH9g4yohl2nQ8tC0nVxXgfCDWMGWk+Bw8wSqwheuFgPrHSioLgfA==
X-Received: by 2002:a05:6214:2627:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6d8b73a489cmr65325086d6.7.1733417115832;
        Thu, 05 Dec 2024 08:45:15 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b5d2sm115958266b.93.2024.12.05.08.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:45:15 -0800 (PST)
Message-ID: <b9225284-7830-4aa4-aed2-7f58fb7320e8@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: Add board dts files for SM8750
 MTP and QRD
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
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-6-4d5a8269950b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-6-4d5a8269950b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZwAdYos6D3mVmlAZ81d5lRPQdz960sxY
X-Proofpoint-GUID: ZwAdYos6D3mVmlAZ81d5lRPQdz960sxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=882 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_084518_576224_A1BAC067 
X-CRM114-Status: GOOD (  11.83  )
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
> Add MTP and QRD dts files for SM8750 describing board clocks, regulators,
> gpio keys, etc.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> +&tlmm {
> +	/* reserved for secure world */
> +	gpio-reserved-ranges = <36 4>, <74 1>;
> +};

Any chance you could describe what those specifically are?

Konrad

