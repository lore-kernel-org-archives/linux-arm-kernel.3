Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6560C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=; b=GavyHPsNx2sh5Y1lrg4EP1k9Nc
	DY/0z+IwccxJ/5P98md8TuxjAMHFYdX7GuxSU6noZMbCyKB4fVb0Bw+8s0z5Poa0/iEB/vG5YlM77
	Kk0HqWyRGGouIsJLH2T0zYD9v2r3RzJ295uHVgvWC2n0ut8JgdOJcYBEqBZShiOpOv7xnfmeBLWJ6
	E6zhZzmtXutoMxUTZH6wcJs/TB6kxfwStK7MYeOX4JbXKD3ZVElQiMJwvAcrAw9dIcihJkNJ66oJe
	gmXP9ofr99b7DcUY0A6zIzQFSjCtU3QemX/UjA+wI7/hVQilronXpFNickz11IQj4I5hAuZXF6E9H
	OlFj3/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visE4-00000006uEM-2UWd;
	Thu, 22 Jan 2026 10:47:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visE1-00000006uCz-2L1L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:47:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAleT02915173
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=; b=P9GFPg6K+o4NQaJT
	sz7Uh1WmDz6hOXq43d+1iZ/omCGeppt6pV+gsaCvkkJp//2T3LeabmA8/1cw5RVQ
	oNCaZjNLl0vOPxtgtVz4zv9DhuJ/DJkzbiAm9ciCsxe81oE+qgwxpC9F5fm9M2Lq
	axnDugCqa5CzJjcI3hsI2MzX+Du2R27fQKYuX9Jdxf7wXtYeXfIR0g4Efc7rMGB7
	wMa8AIP7a+G4OFK65Ff2ql+iFRhieN2+jVv7CQyY6k0CSPIsxMgy5+wC26pJ5KkT
	opmnBSfu+7FRkmK/XQydkK8mPHdzJfs33cJS9MGGGtoIuJOGk2Gqv7PvfT9mJqjc
	NpYiyg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2g003-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:47:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89475e062b0so24281236d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078858; x=1769683658; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=;
        b=UR7NPOVkZx8KL2FKB1qbgWEilcKVVvwYvlrTi69og6Z0BbeWSqs0NyECbvMFzDOVah
         Nz1UsVZ03S8p3QM2DrBdTexlHR8CE+S6yPzyGoRitChK6NhmBXsjIM2HN3Fg3hxVLfGG
         wY8wKmI8obX3NNaUdU3AdV9YtPwKDBM0jKWT16SYiNo20TjZ+PGpiALB6J2IAMfpBbmD
         /bCWsh6QkrtPPfdKqYAh1B8pDSWhgJXJVwnUlfOo9nlqiBZTXUtlYeG35PjWjVCf6UXs
         nla1Jnvor8BixpHLAHTG9tkwq60MFHPLHHczhpA3Rxy+C6vN+RZfQDvGpMrV8ifgcEje
         eBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078858; x=1769683658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=;
        b=WSjS5nee5Ty6ozw9welFfnIUB/4fdcP0OQJ3sjPlDnSb/OGLLLJBxQzZpKM/69zgSp
         YMwDtq3QKSg3/sU2UjrCrrPf4ITfcDoIE4p2aLKYdBi87fkFnKCle5g9AeQrEB8LVpdq
         nfgGHTwhcLJp4mX/qRfn/Q6Dt+4wGtyipqoBeqV/GLLnEbMk1uvFWWwhu9XRlVm//FHA
         zRbZEksYaovq1SfzxL9/5IFwcmZREwJUs22Ipg7ZGel2YzxG3dvt2aeOvcFReG+R7b4b
         Hr+GugA2tlt7ksXmCxf/+wDEEWlqKGoh4r92o9JA+d2oVPQsK3/+w4YBoIAOI51EsZV5
         yXng==
X-Forwarded-Encrypted: i=1; AJvYcCUokLnr7S/NJArvHsrcpCwCPeMs5HN9v9sl4nNTA/0TTbj8GDiywIwipQaNlWBOwrJ9TmCNT//DmZ4W1FJV7PQF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywre0Aq/8FiClZIF0stj/jclbnH03dPpZEnr81+TMl4FiPXet/u
	9nZt+AU8gKmwqGG2KSyBGBOWGIf45XNeHQqyk+B+QB5kPV9sFOAUlO16U/JLPuvia3IiIpjQ2XB
	WXXoqRnc2JXTi2vz8f5YI9HHp7lTdhGPXt7lvhq8PWoSLefhmzHIVuQ6DkeAAntiCi7wSBdjk7z
	K2tg==
X-Gm-Gg: AZuq6aLmxQqP19Hg6UVxasQBftr4tEBTQeFjksMthK4J5jU/odcOGbHcksjcGTjwQBc
	jqicLVIfWHEPbXaJz8vO3tHsJRlEM0AvhSUOifVgd+InJq0nmJaVL3C5WC4NKJLpDVBCcxV5YZh
	mpQggX1Dvctk3121B7jRgtKHIeH3Ubm4IKuSM1j639ww8EtK3wfEHEc61WpslFJHDrvb3C/Ovlc
	tmbk+mPG9Sp0+aOJZRhPFjhMxHyON/D7y7bhTGdZce9Ra1vqMMJIivwVkhkwP+tnixyLhT0pSSb
	IF2UUJ5NmCRJsa4eeYjAnHdN9agQgxNUYmqroy+9/+5gVuX8B0pr1LEw9xuaOGZ2t+gcfknTsXM
	LHb1AgRUDBj0xshUj3DGp6GvHyAo8AIy8EyVHtdDT/NjPszx5qj6f/6pNVRdCpexRVPEmaadObg
	==
X-Received: by 2002:a05:6214:495:b0:880:5883:4d23 with SMTP id 6a1803df08f44-8942e2c8ca5mr306938946d6.16.1769078858056;
        Thu, 22 Jan 2026 02:47:38 -0800 (PST)
X-Received: by 2002:a05:6214:495:b0:880:5883:4d23 with SMTP id 6a1803df08f44-8942e2c8ca5mr306938546d6.16.1769078857539;
        Thu, 22 Jan 2026 02:47:37 -0800 (PST)
Received: from [10.111.168.218] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89468d65eebsm47770826d6.30.2026.01.22.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:47:36 -0800 (PST)
Message-ID: <613d77cd-1ccc-4a5a-9090-ee4d65d3e4c5@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:47:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add CCI and imx577 sensor support for Talos evk
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jRlEAMrQpMV0XvkSLgownoM8Q0G1oUU9
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=6972004b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BqitQj2KRPiQZ0QKAcwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX6SQS63J17xR7
 DCafRZMoou6LSh/jCcTcAcE9Sq83mIFbNq5AvM6copugYqDmq9qlDyvNvB2X7dxez4LZe5UMZfj
 9mCQCGhEQeTI7800SxLXO6Jq/AmudzzJFXohYpgSBBuGaLBaZ0JAsTf+hT9zBnmKci7+31E0HQD
 5OOUUi+N4H0VxYHAj56VMyJVGg8jcVa7kXD1Z3r6CtdiKyQMj+GNafzam291cMrhp31YT/ee+Nc
 6Q/0ib1yjl0DlOg4BH1ARBJGOkSeqwuGSSokqaUVO9jYP6ST1nT9EqK1d9ABwbOqDHSqbPCHO9+
 SXuCZJhLK+cgNgxpYBOi6AabdUgfreqFWs4aQnOhp0+hlEevKiSboHpEnVt+MEI/g954n9T+zYV
 TlTDE51fiC9Pn395YsYxiBG+sOcd6f3z98VwxlZASy0oPM1BwcdOvC/K9zXoX3rD1DfxdeXwJ3t
 DlJUb5JI8TYyN/Q9R7Q==
X-Proofpoint-GUID: jRlEAMrQpMV0XvkSLgownoM8Q0G1oUU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024741_717847_EE8C6AEA 
X-CRM114-Status: GOOD (  20.22  )
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



On 1/22/2026 6:40 PM, Wenmeng Liu wrote:
> Talos EVK is  based on the Qualcomm SM6150 SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CCI support and enables the IMX577 sensor via CSIPHY1
> through device tree overlay.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl -d /dev/media0 --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5
> 
> This patch series depends on patch series:
> https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/
> 
> Changes in v4:
> - Add CCI properties to the existing portfolio. -- Loic, Krzysztof
> - Modify the incorrect dtb install configuration. -- Vladimir
> - Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com
> 
> Changes in v3:
> - Add generic names for the CCI clock. -- Loic, Krzysztof
> - Split cci node, removed double space. -- Dmitry
> - Rename camera dtso name, add detailed description. -- Dmitry,
>    Vladimir, Bryan
> - Add dtbo-y for dtso. -- Rob
> - Interrupts cell change adaptation.
> - Delete cci sleep pinctrl state.
> - Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com
> 
> Changes in v2:
> - Modify the CCI dts style and commit msg. - Konrad
> - Split mclk change as a separate patch. - Vladimir
> - Remove clock-lanes. - Vladimir
> - Add mclk3(GPIO31). - Vladimir
> - Link to v1:
>    https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/
> 
> ---
> Wenmeng Liu (5):
>        arm64: dts: qcom: talos: Add camss node
>        dt-bindings: i2c: qcom-cci: Document sm6150 compatible
>        arm64: dts: qcom: talos: Add CCI definitions
>        arm64: dts: qcom: talos: Add camera MCLK pinctrl
>        arm64: dts: qcom: talos-evk-camera: Add DT overlay
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
>   arch/arm64/boot/dts/qcom/Makefile                  |   3 +
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
>   arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
>   4 files changed, 347 insertions(+)
> ---
> base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
> change-id: 20251222-sm6150_evk-8ebed9e9f3bc
> prerequisite-message-id:20260114100043.1310164-1-tessolveupstream@gmail.com
> prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
> prerequisite-patch-id: eddd1b1714715707d386608e4f9b24396f51cd44
> prerequisite-patch-id: ae777d7e17e32afc36fd1f741bb57ff0d3556841
> 
> Best regards,

Post the version5, abandon the version4.

Thanks,
Wenmeng

