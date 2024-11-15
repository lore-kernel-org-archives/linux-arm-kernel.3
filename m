Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C92D68BCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 20:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMaPm1+IImUdO7cISBLcl9c7Iu1WSHE+iCkPkVlturo=; b=fB4qiPnlzokVNZJB6XG+YqigVp
	pXQWMROPimkYjssm2Fa+arFY9P7BTuGCJp+k3p7hZKDxtL73+gmQ6p25z+zvmtdFgaa1+qrsuSbxh
	BjnVSiq6mTmRIUBu/aTAp/XwQM4vkS9zOOLP1TBy2Pf1F2BNurAzFdvFUNSd3TikSBPQuVEt5g8P1
	AquIqbQANKCdIQsgFqGLdPX1vAeeB0FqF48yA4xOWP25eDWGFvhDKG64Aj04hmB/lEgZ6iDwC987c
	2+naeq/HlEaQ1Sl23m5H6pTLR1bMmHAbv56VUH87xdkGc8mC/MZV6dw9rcWVq97ypbO8WYuRYfnN7
	4nN9wd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2uL-000000042Mx-35YB;
	Fri, 15 Nov 2024 20:27:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2tP-0000000427b-0FcV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 20:26:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFC2DBP017790
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 20:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMaPm1+IImUdO7cISBLcl9c7Iu1WSHE+iCkPkVlturo=; b=Cm+KtutMRhf7d9kY
	zGLxREdMiXLY9z/H3sT06+8p+BjYGdVp3oK6EI1TlsQ/+JvJs+IAE2RrsXuF6MBx
	E10lpqEH8dhwfj7cmwD4556FqXRGH3H4hkM+koYn9EFU57xY+q4S46vwpnlQFPBK
	fyOnMsKl1j/sYNDnCshbAWskVxYYV5DDCBt2+VUuZOuLSgu+KxZJ2saCRWiDRdQJ
	z+82TfeSO4QjPWsIPlF3vGxghioeN89Dir1vIDkaDD0Va0XSjJI5D0oJh7NRBOkN
	dq0dl2xKsmSAKmQjjJN9sgMCAbSTYaOa0LqONP+4afV3D/Rx17AjGaTSiWK1KdOJ
	k8nPYQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wvw2jvnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 20:26:09 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3e6069ec8fbso398006b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 12:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731702368; x=1732307168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMaPm1+IImUdO7cISBLcl9c7Iu1WSHE+iCkPkVlturo=;
        b=bWG2ksP8R5IzKioXUgKqAUbVjy+A8csQGZ6fzPzE3a4Yt+VYQ7VRUWZqFr6DYusBJn
         0KogI/N4Uc37Sa7tIb0X8XUYkQf2FfBaMg7TNegBnv040M3W6ebSimLbwOoZeMNEe1Xk
         LV1LUXZ+RnaZKEFQSJ3R7bJLDuf3702JF7fg17pzIvd6oPJc4L6HUvw6Cq8hOucpimo2
         O3oq//f0JzfGEhpUEbNqHm+r3nmoca35sT88RujVV8ZonHY0VjL8fjPqqAjtQR4DBHnt
         rxB5Zde+7EasGvWtAb00ua6sTG1zrIVg+nlcsatPuhEeEKOKSX1vS9XER0nXLU8IiIiG
         Nzwg==
X-Forwarded-Encrypted: i=1; AJvYcCWiTxPM0YBGG+trrPipUkMw5SJofW/R0Vz0fKUwpz0geScrZ6Tv50YtstzEljCGpcUTpS17zNBj3PyEizY00Ze/@lists.infradead.org
X-Gm-Message-State: AOJu0YzZf6JgassaU77aD0dPfjiWvHm7aILOwRD0DpOPV/jKvXwGTzJs
	tZCDxmTaPpV3IPksju1ts8APyykrywXnhOfx7OcoEcPcTyKtMD1YnCJcXJ9VGlHY6pmPa9sRdnM
	zL8on23TGbNaBdRom8vdwWZIBw4TJipJe2WqBjmhgEjF98d8qmgLyiltMz5WWBckyE8FBpsJpJg
	==
X-Received: by 2002:a05:6830:641c:b0:710:f7b0:1d9f with SMTP id 46e09a7af769-71a77a53decmr880167a34.7.1731702368463;
        Fri, 15 Nov 2024 12:26:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtR3/Q2/qCLJeKACK4JhpVADHvNgsg3j76CniniMUeFU85uyl/kGD/ZyaH9K7cExGWRaIdJw==
X-Received: by 2002:a05:6830:641c:b0:710:f7b0:1d9f with SMTP id 46e09a7af769-71a77a53decmr880154a34.7.1731702368136;
        Fri, 15 Nov 2024 12:26:08 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e046c68sm210747166b.167.2024.11.15.12.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 12:26:06 -0800 (PST)
Message-ID: <636c2392-bcd6-45ae-a7f7-ed893479d3dd@oss.qualcomm.com>
Date: Fri, 15 Nov 2024 21:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: Add base SM8750 dtsi
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-4-quic_molvera@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112004936.2810509-4-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RRXHEPUq8IAZ-e6IbXfT2UfwQ9hM8yWj
X-Proofpoint-GUID: RRXHEPUq8IAZ-e6IbXfT2UfwQ9hM8yWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=760
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_122611_220042_16A08B3D 
X-CRM114-Status: GOOD (  13.83  )
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

On 12.11.2024 1:49 AM, Melody Olvera wrote:
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

[...]

> +			power-domain-names = "psci";
> +			cpu-idle-states = <&cluster0_c4>;

So here and on x1 we use cpu-idle-states instead of putting the idle state
under domain-idle-states in CPU_PDn like on other PSCI OSI mode-supporting
SoCs. IIUC it works out to be the same thing, but maybe we should stick
to the latter for consistency

[...]

> +
> +			gic_its: msi-controller@16040000 {
> +				compatible = "arm,gic-v3-its";
> +				reg = <0x0 0x16040000 0x0 0x20000>;
> +
> +				msi-controller;
> +				#msi-cells = <1>;
> +
> +				status = "disabled";
> +			};

Any reason it's disabled?

LGTM otherwise

Konrad

