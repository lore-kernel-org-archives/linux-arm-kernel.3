Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E71C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=; b=vHDOjxkWhb/DkTfY7dsqAtXptQ
	e/cnsP4mdnk2HywJi8y8mSxJ52HywVydF6ac1WO7TpShyMbG2gMwBs89hY/X59L7IrLraX76pMNhA
	F6uVnSs7KMdnZPHvywsBabPL8M5E4A4X3/Etz8Y8xirfYPWNyT93vHeTMlh31OhqG0f1MOfZTkiVt
	RW8wx21tRnWPbcNZselBgXw3YpUsDbmAp7yWXQ5Dhf5oAPb8Bcpl64m9+PCdvTfdFRjQICHqq7ob+
	SkGW+36nbgRTbY96e2d3nerEeMye6ybotBzVUnj8/bpgBbKDSRV4cGvtgRRv3urVHBwyB7Z8Wd0gD
	HxcTGVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP31E-00000007fhS-2Wzp;
	Tue, 10 Jun 2025 17:44:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP08E-000000079Cf-22ZD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=; b=HAUmHnR468bfYQCd1+gxvbKYir
	qCFpxk4w7PdR9bNu8xwNIVEsCu4EVQox3RyNX4Nb4r1flpRXs+GP5hKb5ef9feqf5puvBgsFPAmjk
	Jpzvk/VMoed/70rJS2fASGAXWx7qLWZ4jJJhOaDl/AgdjCj4Hi/gBeKMogH5xp+8XLHmbIxxT43TI
	IHExQbHNr6QZHM16NmQdDc7UC4AIy2U99yFdIccia/xnQ1rlO8MdH3PQLGAjR2tDdvE9ULmvdWF0Z
	LylQYvDtRPBeDzpCPKgX5J3Cyg8IE1/GNBM1Pgqk6MnEUaHu40VYxdN/xjVbNSSr1WYfOWusiJGpw
	UqvSKDiQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP08C-00000001slO-19yZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:39:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A85cQ9025339
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=; b=Tvc5Ue1NTVvtqo8o
	yOpjgjwsKLep1BvG8wafzxNyght58u8GSohG6CRMXmhuL6zYsGegs7ft2BRQLHBU
	UAzcFNwkHxgCJGGe+KthukAfiuV8P15a/s1QHRKMirw0DtBGx6AJHONUhAcr2Fze
	awtmYShBqwXz8Ekn+iMnF0qhg7q3kP89FywP1GiBClsMTNm5Htw1aOQCnyFDh/oW
	Jzg/LIGAB49aCDdo4TcpT2dTJ2TPMufCIIxtWsyVGBScKTJmrhqHsW92e9/K0c79
	djQdNBuSJBtTjwQH7mbPSftwrWqO7mn4BsVMrgVSLlc9+7Gb91jI9kcR5V9XnDoN
	WlBQTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxt242-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 14:39:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5a9791fa9so15089221cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 07:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566350; x=1750171150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=;
        b=frQOkW7SoUx6CNJ2iBb/xg2eGJDyt6+yNFjgnNtQIRiUM7R6UTHMXdOrcecKBDcWE4
         HJxvAwauJLZ+ZdGAkWfTE9UohKw5d+fzOVjJDgfvHRST2kRzkgQT0ilbVTWS/bBCTyTv
         4cvgQ9H4JmlkA+6Frhj9ssxYXpLuFQkVoDx5cF3Eq5VJaIywE90pXhcOeROzg9GWN2TP
         VIfJU3PNarZ5YeoCY5hfJn+G1Z6AxE7u4lPef1qzq0XEF/ILunToOkir8P5eVGbEvsZC
         Hvv9kn+Yo+J/g0D/rXYxBSQRFDsQM/t7F81x0rYzltauurygBM7CMdcjbwoSn8XGOLR4
         Cuqg==
X-Gm-Message-State: AOJu0YxXB8CcDPo3tyTxAfaoT/wXUJt9ruqtuM0J20uD3tmLut2xhWzK
	L3a/lzVqLrcCsVVgPWTxfiUSPR4reP59VfH9QcDV0u/YM1IDCzdC/k1ltNjLH+yFq4IsVwji3J8
	zMM1BzjEnJ1yEc2Kukp0yQjWiqDc5Xr3fxHuUnrLKN/CoF3X9IUr0DzJLoeto7gukoQyJqnyR4k
	8Pyg==
X-Gm-Gg: ASbGnctLnwp9rgiJyCHmlfz5OSLZBsHKmULoTE8hCfKBvSveweewVwhMDTFmoZ0ZJ8l
	NUgrzblaHeE6HScF676XuR3mplHIiT7p9oRFGdLSLg/aFVB4vsLyYiDAeSJ+pJnymdH04j75kXF
	ZkH1cfCXd1gbC1xtCmjL6BGSlcqG7U6pvhUcPvGn0hFVPz/lLR9vdUsq+QMGMAO8Tr6Zx1DeIlv
	lRyM7LmOnppV2mspTUpTXJ47rIs4o5YDqHuKyYWKSsyVgfYggcLR7HoSu+nbSfin580vAdoJQyb
	02R+yeh0gXA8+1vfaRl9PQpj27tNSCPx8+rR5XUX2eRxFGFz7+i7W1jtybxA5voASOaom8irRwo
	/
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a6690a28dfmr95786521cf.11.1749566349763;
        Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGouqX7qoKwblwHdCsP8sXYcazh4DdthTicdnTn7xgesyInCIp3oCS88Mi1046CwU/GY9svig==
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a6690a28dfmr95786261cf.11.1749566349310;
        Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55b68sm738346266b.59.2025.06.10.07.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:39:08 -0700 (PDT)
Message-ID: <1b26fd75-f316-4cbd-b60b-6b3496551314@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iHxEJv1yYlBW4l3spRyBaLiL1KejKOq7
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6848438e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=nNJ8jBrhinZ9UXkNAM4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iHxEJv1yYlBW4l3spRyBaLiL1KejKOq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX7luWVCW3YbGa
 QLzBqZwKQgr1TtBf4bZYiL0cxnlT6fbs3dhkj3VEcUgLzFE6+4kgUdVhZIhsSc7Uxqfe0IyWqcO
 1Hf369Vq0ItDSwWmk5fDS2CE0XM5QAZPHjPK2uG20Mn+DmqA/RDcUgicaOBZ28caqj1kKBSDfEI
 y1Q+uJKvLP4r9SSj92cFtOboacuhLpLYq8wUoAVtk+r1HsOdhhExIEHJgsyieQay/8XfcO6cRwz
 U2mWvqMPlELPV0lwnQx6VffA7CcM5nfYq1xtw3R/ad4M1GGyR80X11+8JunhJ2eH5K8luTPdIgq
 F/tfT5vHPACaDPAgsOFdO5K4F59YNptsldA6xyndiFDKImfT/FhEucnpYrO0atJ90nbv05kRywB
 z5b9Tc6KQLL71FKeQWPfQhgvk7A3cQor+CHfpdQss7lVIx8TxXL8EMSUWuHrIRGLHAfodi13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=890 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_153916_637445_D121E645 
X-CRM114-Status: GOOD (  14.22  )
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

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};

Please sort the label references alpabetically

> +
>  &gpu {

Konrad

