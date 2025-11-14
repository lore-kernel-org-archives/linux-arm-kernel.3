Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF2FCEACCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rtaMl2P4Y3ggAEQ1PRkpIjaXxhkUvSE2Zjlj8Gi40I=; b=B731s1wATz/HheqRFas7M7feO4
	vjx8gYAxftWgvc3siFI0Qb/E/EV0npDuk2qP3Mp8lYLDnM5PQhVaeexRuSApsx4kQRdRJuA5GgqV0
	Qy6QgWFaYiMCkvgs99jnsLy3VsT64iBrgXYz07gc18DJ9IFOjp3H6WJOi8InL7g5xrrnE6rlF+uf1
	L2eVlfONO5PzkuOUUxeWdwupdc1LdIRhDfj1fVxHzRwPXLCf4zZ1MEcP/ujXbqg8TIasU2mxtUvn2
	SyHZlKTe4lW+lBvP/O70Ewdymsslv2utJkbD6X7k03HIlXJ4OSx4cy8go/DBFtdVD4EqgfqbE9uUD
	SeLCZ4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK28t-0000000DAWI-1Hje;
	Fri, 14 Nov 2025 22:19:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK28r-0000000DAVr-0bLJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 22:19:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQ9tN241812
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 22:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rtaMl2P4Y3ggAEQ1PRkpIjaXxhkUvSE2Zjlj8Gi40I=; b=IwhIA2CbmGxDzYND
	Gu462zOvplCcRiD5OK5QyYSXpzBON4wjWozEORmY5Yv3WpwDPmTzm6RWSob9b5Dp
	s3lusEoIAy65bY6jNWvgsKP490hvOpgPba2Hf1j+kIbX8dFX9GGlxXv87pa+LnpF
	+Uxh33KXuI057UF3pi2odbRKRUzgelROvNzMLMDx1/3Q5fVdM+khidhtN/bx0p6G
	54plcKsCKBX+XDU1K4JbH2YWdamAdl5JozIk7aJFxIEE1h+FEapaWrPF7qkSVrNN
	oRTgfb4w69f8yzQO8+4MZcak1+gZa83jZWcwEK0Hf6BycLREv1TgACwqu6ZZoz32
	olCGgQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae7pj10dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 22:19:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so7973151cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 14:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158779; x=1763763579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rtaMl2P4Y3ggAEQ1PRkpIjaXxhkUvSE2Zjlj8Gi40I=;
        b=ebhM42zPpf23ft0z6Gg27jTwmlZFTc2agtJSpoUIKMrVO9HQOzYL0hbWI8zu1Y61vW
         KmjSvMI0Ch9SCVPO+gbHo+chvabT8OP4xm275V77KARocLVY867EPjqwCe75o9j+ut2P
         yKflp0/JR6uDf9aeGlVvMX9suBHrtjZAAwz5pXtizKWGas+mRPkukCx0vg6pwVyDZER9
         +WZsGQepPUcbDEjUqft463lrBlQMcM7yQgXi+/lDfFO8sIMP9pvoKD3C00O4kMPCLfyg
         3wUt5tTCNx8jVTe2K9FuPOdrtbnedq/iidV8cY/uwU744kmu1j7vItVPQDA9kLGNqdxc
         47Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158779; x=1763763579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rtaMl2P4Y3ggAEQ1PRkpIjaXxhkUvSE2Zjlj8Gi40I=;
        b=XDlqHUGQM5wWahIsXjguwbgtE2G+mMBU69DUM8bBgVtxFgjCcdtR9Y40eLkRNllHFb
         YkxiSgg8e1FKx87nLbIrOatFXZ1v2wPE06uuAw+aQ6tLeBvCG1Y67cIJgsTPPhF7Orcm
         ukyGAJooGu1z+mP8P3JXqEQcMqgBIdcYZ4FyRL2i/1YjXoTfIhUxIKc3o1opIYkT1/pP
         djoMApFscyQc+TR800HuCIznrpMWsTiPqp4KDsX+hZPjuqDWPVQB49zQHeu548F6IgNm
         aYGn/zpzXKVQbUVLBqY/WvTfaPHPr4jdg4QlkaT/NtzX6qAuBsxKAclbac/IzkXuvoIO
         i56w==
X-Gm-Message-State: AOJu0YzkDUpDOQYhLlryds2c2UIp9sgZ/DZpPVsV+IwVoyn6MOe1rLqu
	o+k8eowxWBl7g61M+OG+3H8YhaH1QfTgJPJ4sjNLcjwTOTGWY0J8aeDRw8AHnvs2cyBNx4liHQJ
	X2VU/KPd1t45KY9vSVbdhGfbOh+K174noSwEXaKQxTNefeqHC2WomtdvAFvR1PKbVcKsaIo7Ukh
	XVPg==
X-Gm-Gg: ASbGnctzjmqxK5m6R4tu/gPqFsXRFptp1U3aNjU28nWfbSixgxDkdLrT4NcABYbuHnB
	6p9mPhW3haMI4C98HqHMmO5kG9jrdmbKMI0WUvAwccS4spZElIeZZ3+KkVeMhMxuBBXu6uOYD7h
	iQjA/apvmUY3R77N/lqT1Zm8yYz/iNzh/3sUMTr6ZEAjZC8Bt/Zx6GOk1FeTkyJiXzrc8SVOWTT
	CdoMG5B872/+KpkAzQblssluDaeM1B9WVapAOycxkH7RNMNrDMk236pu+6vHaBiKay/tE6qRq5b
	nNbGUIsONAtTEjCru92Mvv2NZwyauUC1Tf1dGA1HAq+m+jfrg2SoPlgyfi8z4Lyu863YuAGjdQS
	+fPzsKpCXARalYLwph37KTQzSpCfirN7xkQR01zJm945fFr3gGPP1mbpL
X-Received: by 2002:ac8:7f87:0:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4edf3441d01mr39997371cf.0.1763158779389;
        Fri, 14 Nov 2025 14:19:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjbG+BUiaIkkQZyS73j/X+Rt+OSfewkVEELl3ZfmiAtanj7Nkpm9CmHByNJrV/E1aDIWckHg==
X-Received: by 2002:ac8:7f87:0:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4edf3441d01mr39997011cf.0.1763158778906;
        Fri, 14 Nov 2025 14:19:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac68dsm470137366b.62.2025.11.14.14.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:19:38 -0800 (PST)
Message-ID: <a5ae933d-c5d1-4094-b4a1-de52060e0786@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nihalkum@quicinc.com, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-4-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114064541.446276-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U25I2Xr7yfLnNbDe8PBBMo6Kc5OBe9ec
X-Authority-Analysis: v=2.4 cv=Z53h3XRA c=1 sm=1 tr=0 ts=6917aafc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=xh7zYxaUke6ZEiU0VLUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: U25I2Xr7yfLnNbDe8PBBMo6Kc5OBe9ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MiBTYWx0ZWRfX0omYk3IUxFgJ
 atRytt3xNFCTz7WlRT1itqEp9OV7Xoc+vEDWNT8Dxythe5XPup4slfSkkC7UGoN2t+V25KWclRC
 ozGmnmQoZNMqO61p2g7Cme4Ohwe0zETKHOBe+5YYAtWlFk0yeEhnj7k3IaKxEhNkIJo4I9fYEO9
 tiu5b3wNku5TJusMmBFKNwbcjOJgtMrC0FZDYWmYxN4z1REDl2DwZt7t0T8Z3mq4QYTBmpU+A1L
 11iDZ9lCGP0q1jQXxu3UAm1BaCfs8z7ejenACIa8p0/Rb/K41xzi0FZgpv1JmwcoyuPHz/3LBjn
 7XGmXRRODjcvZRhTY9iLRwH56jTienaU2thsvA5Rl4a0jCn8iNhao87Ti8tKqVkxlwKPdZjhnWs
 4dywwARTII0cLPcCHmJg9oNG02ijEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_141941_330415_DF8931FE 
X-CRM114-Status: GOOD (  15.16  )
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

On 11/14/25 7:45 AM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.

[...]

> +&{/} {
> +	vreg_cam1_2p8: vreg-cam1-2p8 {

Where does this regulator lie physically? Is its presence dependent
on the connection of the sensor, is it part of the EVK carrier board,
or perhaps something else?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;

property-n
property-names

please

[...]

> +&tlmm {
> +	/*
> +	 * gpio67, gpio68, gpio69 provide MCLK0, MCLK1, MCLK2 for
> +	 * CAM0, CAM1 and CAM2 respectively via the "cam_mclk" function.
> +	 * So, here it's MCLK1 pin for instance.
> +	 */

I don't really see the value in these comments..

Vladimir requested you to move the 'description' (meaning the node
describing the hardware, not a comment explaining the function of the
DT hunk in natural language) to monaco.dtsi too

Konrad

