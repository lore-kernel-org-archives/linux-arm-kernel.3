Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D9AE677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y29GH5vL6Son0tb25oXfDxF5f1oIYnsxUcrvGbyq8VQ=; b=em7Xunt0tj3Wq+h8y5NQBIR/dr
	lIYLorrS5+i88tUdl8nPkGsvhKdXZiRSSQE9BX5tIDsKmdAjwPhO1kEcqmKwaNeITNbxsTHi4Mtfu
	0gbNiBQ1nDrnV43JqK2oUWLi705gyoGu0K/ivGruGLC7SQjJ70esZfHh8Sbczn1pUNtMajtoBDgGo
	nXY4sUgUTNbkwLzzWjxq5VerJJf71LLSBYS8tTnT+uixJtf+u70NCp6PatGc2QvDm+cdS4SCtENf5
	R/OLPK6RySosZbPeJ4M3Ow7R8B0NOacyuUmgJYc4QZ5yKTnuLUMf01/2DzHaDTkB40vhhkRHWh5CJ
	XDY+GmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Ahz-00000009Pwh-1zuq;
	Sat, 02 Nov 2024 09:46:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AYj-00000009OqC-2Tmz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:36:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A24Op8i030353
	for <linux-arm-kernel@lists.infradead.org>; Sat, 2 Nov 2024 09:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y29GH5vL6Son0tb25oXfDxF5f1oIYnsxUcrvGbyq8VQ=; b=Xk0Geu1CeiQW1ndf
	Pn9GI2w1MxAJ3FOx1FxiXJLrMo/GWN9TR7mN0OvvekYBAphxktXPhuUGAy1j4zQH
	j93RFiOFVrQkIpMxWXXK0DOcBGIEs7cAAn2o7UFmNo4XEVL4YfJUom1m9AT4O3oX
	ul0pOKwPFCoFyUtP5ba+NihPZI7StxQh/q+Am02O2yQUS3PJBgPtxv11j++JgeGV
	iRSm6pahuuMNEjmBKrzS3gmHVv0gbcEqlZXPuoOnsxLIRpCGJ8f8Fx7jY+v7x+sD
	gPVE7eKH4lRwkwVg6Bd087wmYQzwQWWkMjsQwWJPkSAOGRIQfeUDLMdAHAQbpKs2
	d7uSIg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd1fgdy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 09:36:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf4770c18so9251936d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 02:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730540199; x=1731144999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y29GH5vL6Son0tb25oXfDxF5f1oIYnsxUcrvGbyq8VQ=;
        b=m5jtHI73MnIKa3P4yht0syb7PPW6YebdIjuZrMUuc2GZ9UPe+cMyyOgwiRgeTBk25x
         58zCErwBsj88hzhEA/MTyzw0ADQsEm07jpzWtyEDJLthBBjtvn1P087mCBYLJsl9SZRu
         YBYoYSfHVw3CODohCl/cENcdk71dBllxCtnTD9dWR3LR2R39LiURr4DXEa2PsJ4HccX8
         1Nhg8+RVOTjUZ3EbPiX+UL8g4yugXaMb19ISibQ0Sv+uwg2gaMhsuUIpWlyGKyE5eNT3
         cOa/JsB+tQ0XAuPYwviAvaG3PMzLPLoEO/rgmZl5gXNi3oJMIe79nseK8HqZ1+jr6CpM
         G/ww==
X-Forwarded-Encrypted: i=1; AJvYcCVrIknfbOEr6Y8gf53pHqrcwS+cjhhA6kBvmlXHL+LgffQbmx9IlmqAbbzSsoroFPk71lPToCbGV9Lk2chXh2hf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Alzz5xmgHiPsTKBHg/egPKtbrH9BAk5yF0sxZjDz2teh3o/2
	cu1lK0Ld7axOPsVDEF2uoSipf2EcdCq3mhfrf2vNcY9wBpMPQK9TCysyTJ4KkXCwmOVpp/jbp4V
	HLDXpSpPcYe+DhPC0z4ygua4CTENIuUOsm2B2Boc5l06VwlsI9V1vZRG20sSUVk/9kWVQ+jdvXw
	==
X-Received: by 2002:a05:620a:45a7:b0:7a9:a632:3fde with SMTP id af79cd13be357-7b193f6ff70mr1685020485a.12.1730540199401;
        Sat, 02 Nov 2024 02:36:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwQP7gofFmY9sgxMvy+PKIDrsRwoGI7xSwcZsJP6aZF/ePuF6h/5RYlGz0LMgoXkLvUqmbEw==
X-Received: by 2002:a05:620a:45a7:b0:7a9:a632:3fde with SMTP id af79cd13be357-7b193f6ff70mr1685017785a.12.1730540199014;
        Sat, 02 Nov 2024 02:36:39 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566442easm290268466b.166.2024.11.02.02.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 02:36:38 -0700 (PDT)
Message-ID: <ffff8335-74b3-4f1d-adcc-a10de5aa3e3a@oss.qualcomm.com>
Date: Sat, 2 Nov 2024 10:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees
To: Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <172978739477.623395.5604249801475913676.robh@kernel.org>
 <3ca1f7e8-1204-4898-9e7e-cb6423c122cc@oss.qualcomm.com>
 <d6452efa-5d97-4c29-a2ea-8c97569dbdb5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d6452efa-5d97-4c29-a2ea-8c97569dbdb5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: layQuWj4nkIs8lpbLxmWmKTUSb_euMnj
X-Proofpoint-ORIG-GUID: layQuWj4nkIs8lpbLxmWmKTUSb_euMnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411020085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_023641_772823_7B8C1DD3 
X-CRM114-Status: GOOD (  21.25  )
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

On 25.10.2024 12:46 AM, Melody Olvera wrote:
> 
> 
> On 10/24/2024 10:22 AM, Konrad Dybcio wrote:
>> On 24.10.2024 6:33 PM, Rob Herring (Arm) wrote:
>>> On Mon, 21 Oct 2024 16:21:09 -0700, Melody Olvera wrote:
>>>> This series adds the initial device tree support for the SM8750 SoCs
>>>> needed to boot to shell. This specifically adds support for clocks,
>>>> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
>>>> compatibles.

[...]

>>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'power-domains' is a required property
>>>     from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> This I'll address when reviewing the dt
> 
> So for this, let me know if the following seems about right.
> The rsc node needs a system-wide power domain defined. To accomplish this, I would define
> a system_pd node and point both cluster pd nodes to it via power-domains, similar to what you did here:
> https://lore.kernel.org/all/20240102-topic-x1e_fixes-v1-3-70723e08d5f6@linaro.org/
> 
> Then, extrapolating from that, I can define a system-wide idle-state under the domain-idle-state node as follows:
> domain_ss3: domain-sleep-0 {
>     compatible = "domain-idle-state";
>     [...] (omitting a bunch of details, but you get the point)
> };
> 
> And then point to that from the new system_pd node under the psci node:
> system_pd: power-domain-system {
>     #power-domain-cells = <0>;
>     domain-idle-states = <&domain_ss3>;
> };
> 
> And then of course in the rsc node, have power-domains = <&system_pd>;
> 
> Is that correct?

Yes, please go ahead with this

Konrad

