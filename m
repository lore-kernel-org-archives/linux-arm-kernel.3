Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27FAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKtNCOtaL89pHw3G7/FzhB1Ks2fBiwK4pFoXlWgfkeI=; b=K45iLAjcnI2RaLyav2Y045MG/r
	RNciplQuDQ5rdp9nNtMe+WWTS5TTepup9cshFFBsyhtq62AmoGd2A3rySJbH8vmvgiEqjPJAtMc/O
	0mtWXRax6+8CQnnUq8+fT62XAX/NfaghtPofQ9Vjw8mx4ubA1uffYJTxMXBJ/zMzxMEPXwFeDb1Cn
	Gm13t4QpaTzh5FjVCPAAqKLv1kZMv2BV+QjGyR3yzXNXcieiUMb0ZloDLKWoUr2Y9LcXRWqapSZq7
	gqbGMRGNjMW67HS7E4mQrfzJTX7T0rIs+lDu55kCrmkHAbAKyknbbYxZlTrM9L1klvlb+arT6/Ym0
	mTem5uyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLojt-00000001c7W-00RJ;
	Thu, 12 Dec 2024 19:20:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnmz-00000001OGn-1ySL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:19:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGKZ06002066
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GKtNCOtaL89pHw3G7/FzhB1Ks2fBiwK4pFoXlWgfkeI=; b=o0FIywXR9rpDaZOk
	gN/uFkjNFvMH/YtED0Junfo+qOBJaiHOnU+zjfx0r9K/Nm/AHg9hqGSlhE/07wZw
	b3UiDKFahAYRr4haz68xf9H7oKTD6fWrOZWimF4vLcvgmfDfunIMGKqj1OayLAB8
	AOSKsh1Dl0drIz8tWc2BIbri3DRleQIU5aJqHA5hQ3EeeYHuZUORjvzmKkaaJQV3
	xdIovlDrIpmYz/69pMs9GvuQ/KfUgomznnCEZdbJBQ/wMXaOr0DqV1FO+/R4Oa19
	EX6y/Uek4/YO4L6CDhi96GB1dno6TfP9gESfyp3k+98f8hSfeuN/d9IJzSbrziso
	w3uEZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9xar5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:19:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-466a20c8e57so1946431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734027591; x=1734632391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKtNCOtaL89pHw3G7/FzhB1Ks2fBiwK4pFoXlWgfkeI=;
        b=Xz0z6yKl1JuuL+gOsiaON/Z5KCd6fVrQSPo7hCTiwosuFQtyJrq8zW6gB1oQr+JEEu
         iKR0j+SPToDXbTB6DZauwmD4VT7tt/b7QnJ+RI1EKnDwxEMjPq3cvvKAL57647w9ZS9f
         tNVRDburQCW4fupe4nJ8bIuP83xf4HVgWbBPYpxP0f6KwAXlj7AQfv9jEDoqQSwmPPgz
         E99KOVV6pKc6m/ruOJcBgnrmamTGQCKSmGEhlXv/r3UX7m3yD/X2X8nFjmlB0Pxz+EQt
         w9v3GDGXqFCK4e+uVd7JeL4rJ+34wDwUoifCyEbBnfEBM1eGAASXj41O1gx0oCNmpnbT
         4/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCX5mN0lujgcCc2jCno0RT2T8h4NWA4EOJAiW4AfeUtNTlNtqpwgaHb1LZQa7R/DRbeRWDoIh2dgkJNETCfnusE7@lists.infradead.org
X-Gm-Message-State: AOJu0YzCryQI2p1ZtwUEIho/mT/knQmIeAD3k5dfjoyehHKk2oqwbJx3
	LlLnqBDspqnGiqUJ4V0QK/nFJOE7x0q5BOwssOZwTJUL0/O9X7K70ErJwT/GNm6jjvpmmpnwkBd
	XeysAzQ13W7AOGgvSQQzEbrytoU6F78tIKOG2q4Y13gfKUjjqgHg8KLKUyfx/ufk9r6pCM1rFYw
	==
X-Gm-Gg: ASbGncupNgT8vffaeB1qFiB2GIc3HRC7Ya/5W4jgsdImDjUymzgnZRON5dfi81MjHLF
	RNiBiI6kuJRFyzQUrJmRrMH2oE6egYeEaSfwMCvfDpJmPfC3ihNtABfM1JV1kHUjM6isBFDfB5a
	yURHhrTGkXn1qDDfYtj6C6oRr7g3QtclyU2oz/cVLeBlZ/8lqaNVPYh32YyxZDjE0aC1CUl/Tyb
	GeiUztxbAynPU8xwhQQRD89Igu6Uy7Fayou9x0etsLV+32RBi0+xlv/EYAEweMWUJ+OBnIaJorL
	9XaXPD9929mIFOy5ndDtO3BEB2xyquSFTzGrXA==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id d75a77b69052e-467a14cf99fmr7175611cf.2.1734027591061;
        Thu, 12 Dec 2024 10:19:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC6KrQasDLA2/zeHAKapqCU8kql+Ub/Gc2FmOF51LQmMz74nDoscHAYcpWpck4WHEyFhI9xg==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id d75a77b69052e-467a14cf99fmr7175361cf.2.1734027590585;
        Thu, 12 Dec 2024 10:19:50 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67f26cff7sm672205966b.57.2024.12.12.10.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:19:50 -0800 (PST)
Message-ID: <8c60e0dc-531a-47d6-9c40-ea157a24da1b@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
To: Jie Gan <quic_jiegan@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q5oLxSu2myQuXI8uCXYiH4frcTDImgKu
X-Proofpoint-GUID: Q5oLxSu2myQuXI8uCXYiH4frcTDImgKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_101953_635835_CD14389A 
X-CRM114-Status: GOOD (  13.31  )
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

On 10.12.2024 4:15 AM, Jie Gan wrote:
> Add binding file to specify how to define a Coresight TMC
> Control Unit device in device tree.
> 
> It is responsible for controlling the data filter function
> based on the source device's Trace ID for TMC ETR device.
> The trace data with that Trace id can get into ETR's buffer
> while other trace data gets ignored.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

[...]

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sa8775p-ctcu

I don't think anyone asked that question.. Is the TMCCU something unique
to Qualcomm platforms?

Konrad

