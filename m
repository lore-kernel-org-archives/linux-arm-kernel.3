Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F62EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 03:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81XbHVpgrvitz6FNaWdfiNUW5qqRcwftat7ZNunOoP0=; b=est2R+uJXDCV0Tpk63i9DN2lOh
	oCMhUYx//888tjtUwr94ntU71s+HY6BhEGYjDvsp9lOGykXsOwJVk8V8gtrvqtAtGBzTwv5k4K4vr
	+IYScbQUhzcKfudg665C8QF1d/4oCkpN4DP74zGpfDDx2Axi/TQ5s5nHxIdQ2ok1RK4hG3Q6Iv0lh
	V+uo09ZkunpyawTS+8/Wo/W35XqEcYKl5NEFujSnQHdznrcS2gr9Gk0beSTPHRm+QbOcvJMTUYhwX
	ZdcADmaxyekhmOaMMaxSXpeh7KHLpv/9layHI5Li98i0UroDYp/+8obVK2EqbJcTJmDUbobvt06VK
	DYgwczTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iXl-000000097Tx-3B7n;
	Thu, 10 Apr 2025 03:25:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iUY-0000000977e-0CqF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 03:22:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIg8e032431
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=81XbHVpgrvitz6FNaWdfiNUW
	5qqRcwftat7ZNunOoP0=; b=Hm+4Hm9+MxW1KtDwMhT/6OhbK7mrnDOmv1NvwcGw
	B2fQ+wp+yeeLWv9RWE01AP5Z9o+cBIaC+w1lgrhx7utiaqo+Y8OoIoUPmUFLyV47
	/rJxZVUtWvcWvY4A1/uGe5XoVhcgdRl42VTStAxpK/DOyh1g6C/pWzJz1aCtOdQY
	u/aa1P+ev25knKzNp792iKQD8qxKEXTQnn0JSf9rMmhcoo+YXqrSwga0R5yf0Uce
	+mDtpimJDOQDCyhaeOIRb6QkCcyhydEEPY29eTGrgzxd1K2zY3vWEmeT27wRwWq4
	2PoqrztysW1lb4fgV719dQ4FrPuNXht/f5i4RkTFxmol2A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedhc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 03:22:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ed78717eso4720096d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 20:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255332; x=1744860132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81XbHVpgrvitz6FNaWdfiNUW5qqRcwftat7ZNunOoP0=;
        b=KCx/rUvh2BAmje8N2aaQJYmnMy/VoHoBBZZFv0wuoBD/um0H+v6M6DQPkYNcMnx8xk
         LhLvxYR8z3mx+kSGjhDpj9vQkFqJodvJSY5gdS6LPS4vD5MNCp5P0IBQIOXdlkxtLQA0
         pD7k/Vlhapumc8dDd6LTCXIpJu73YcGnKeegxnbL3U1bphBWQ2yiQah3XOPZh4HcBIbg
         55OHU6vpD8ccXc0uOWqJTtj+laOOKr8x+/jhq86lxE4qyyUmUuirUG6HSFqSqNIiUkMs
         1M4l9XYQdAuCXUxS4vkS/dnPJF/WcRwaxEOHyaY87Jj0UJsjmeZWqt7tBuN8c0xvZsxR
         4qBA==
X-Forwarded-Encrypted: i=1; AJvYcCVWOpzuq3pvHz76w9QuU4h2y5TAeNbrGyw7NzdKOkWAw62WTzyn19jUiy3ngHnhDUMFrnJWkChdACfUOLngIKPM@lists.infradead.org
X-Gm-Message-State: AOJu0YySctA+/cl8kD+0CCdWhSmwOngLCr6HRtJfz1qdqvs5YVX6YP6P
	6t+TZv6D6x3y0diuKc2Abgx36t4tUFEaN39IpIF9r9MZwRzjXtEEqKGNbJYQ92JvLtQB2t48oTO
	Qvw2FfkxdS5IUcFmR/g7WWEEpiDNtvn0ttSXh7Sj04a7gxmkV0Ou8jCz9RlG+ryehWxd82/YvBg
	==
X-Gm-Gg: ASbGncuRqoKAD/YO8F90A9B1UJfNtncsN/AQDIJC3KatJ0R/LrF47qfCnribn9dBvTU
	JN1nx99xIuvbE9Dwze6OIpYfn2PxfF21cjgVLA7bDqcIBgGz8EyTm65NcovlpHKYMHkERxe88bB
	4pxF4LkehraZ7xOMOeFRo5u+40Ap1WzleDSeGSi2vCN0XO9wdlPsxl3J5KMiqB5+02bI3eaOcrb
	KnczecC25O0VyNwZzxqLlxbGK6M/aCV1OKl/MAJ2eE39jjU90jzVxBAzbPAzLTggH37IGbAK+mW
	/oDc1z3Pqe+fhRcQeTUi+sKxnNBXpfavyGPZ+O3Qco5wjDbjvkZsm+tFb5lmKw1mVui2J/2u/G8
	=
X-Received: by 2002:a05:6214:2121:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6f0e5a3ed53mr16850016d6.13.1744255332174;
        Wed, 09 Apr 2025 20:22:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbM59zItmQio/3OiVDMhDZ3DGNC7CjNZAzhW3qfvOXOAZa1pf3Fb3OxUrU3srWDJ8Jd3T2Yg==
X-Received: by 2002:a05:6214:2121:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6f0e5a3ed53mr16849756d6.13.1744255331836;
        Wed, 09 Apr 2025 20:22:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm26342e87.175.2025.04.09.20.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:22:09 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v4 00/10] phy: qcom: Introduce USB support for SM8750
Message-ID: <okpaydjmwdnrjb7olilkzfp2l3aw7pik27ac45sc4joasq4ioc@eonquhbz2sxh>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
X-Proofpoint-GUID: W3T6IoFz5qGdxH32NchnGKnwiudjtlOQ
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f73965 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=f-ECfMwH9_x_JKpxBE4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: W3T6IoFz5qGdxH32NchnGKnwiudjtlOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_202214_089062_4611802B 
X-CRM114-Status: GOOD (  24.73  )
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

On Wed, Apr 09, 2025 at 10:48:11AM -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> ---
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver

Which fixups?

> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 
> Changes in v3:
> - Split platform DTs into separate commits.
> - Fixed up M31 eUSB2 PHY driver with feedback received.
> - Reordered DT properties based on feedback.
> - Rewrote commit message for enabling EUSB driver.
> - Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com
> 
> Changes in v2:
> - Added new QMP PHY register definitions for v8 based QMP phys.
> - Made changes to clean up some code in the M31 eUSB2 PHY driver based
> on feedback received.
> - Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
> both the vdd and vdda12 regulators are properly voted for.
> - Removed external references to other dt bindings in M31 example for
> the DT bindings change.
> - Split DT patches between SoC and plaform changes, as well as the
> PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
> - Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
> - Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com
> 
> ---
> Melody Olvera (1):
>       arm64: defconfig: Add M31 eUSB2 PHY config for SM8750
> 
> Wesley Cheng (9):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
>       dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
>       dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
>       phy: qcom: qmp-combo: Add new PHY sequences for SM8750
>       phy: qcom: Update description for QCOM based eUSB2 repeater
>       phy: qcom: Add M31 based eUSB2 PHY driver
>       arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
>       arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
>       arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
> 
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 +++++
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi               | 164 +++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/phy/qualcomm/Kconfig                       |  16 +-
>  drivers/phy/qualcomm/Makefile                      |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 325 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 223 +++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  16 files changed, 1065 insertions(+), 4 deletions(-)
> ---
> base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
> change-id: 20241223-sm8750_usb_master-f27aed7f6d40
> 
> Best regards,
> -- 
> Melody Olvera <melody.olvera@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

