Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D39CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9B1kQb1T0UY6CATcPtK/c+w88VXB7tYmHIDUsbEh6cw=; b=BkYCbBfNn8lm2SOL6CfvrgKQ/g
	ljva6HLYFVEpXSRGiAGrfNa1dZSJ6R9RevQN+CzCYOxMGSxK39Qv4KDnpDJAT1CP4eII6CViLpJ02
	nfH7+Awd3paruEUP9+gFX/EFINVtKp9fM++iUhhEOAI/lMhNWvcjjp5L7EbMgwwOwGTEUz/x16sKj
	+dJruZCA3eAQBAfZfhEBH1O0jrfiD8Rywrg/TfTZRNWYZBX13Q8AkabkPR/UZUroJL5q9Qe9EJfel
	fesnjZWQP1Ga4lbOQ+VAsmbe+sS2y+S6pNotdEfjjnKC2r9DeyIwXbGeREd4hAAfCFJOK6TXvR/kK
	Zo+aKUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw215-00000008wBe-3Wgr;
	Tue, 09 Sep 2025 17:20:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyv9-00000007aKm-248M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:02:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LTc0023942
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Sep 2025 14:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9B1kQb1T0UY6CATcPtK/c+w8
	8VXB7tYmHIDUsbEh6cw=; b=cWzlZ2CXdbwfse41ZXIbaRErWR8Y5sCPurxEUwVd
	YWhAZCgktvv9YMAF6NVErZCYsp1wkWLw+AX3mLOAo7nNNEXsOPRuxBA1VJGk2eEa
	UyC/bLydqe3gsWTPcRUP0fV1RHDvi/Lp4ACdRc+TcNIJMOjs+cY2iRZ3RNW4yt/y
	5wJroWh6r/H/SLaI1jougP7sAQPt1nCmf5+049v2eAW+M3oKg7PBkMbdX5FPElTj
	mGDHKrmRpqPd4362UsgaexfB+3WroQeMUnnCyEwuU5JQUGmXemksDKMGvZdi9U7D
	+XAyQ2bCW64NRW6Sz4Xl84P4uPtKtvK4S+rurdTXRCljeQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by90fk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:02:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-89608b6e6baso1861499241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426524; x=1758031324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9B1kQb1T0UY6CATcPtK/c+w88VXB7tYmHIDUsbEh6cw=;
        b=A1wiUyscFNkSdnJeoCmZRYFB0FGZnw/i0aKbUqnCJQ5zOImpUTn1nOZ7opuBwTuDrq
         sGbWJf+nxaCRuRoDgx7AF6E3jNGDMDA9e+O1BI5PVBK2ky6L0PgsbpgObgjzKbq3EaFD
         G+FP/wapKpdfEY93vGfX2eu9c7nJ2v+DQDdLhE3t1U6w/06AZan+fBuGKcwTkuh3MK8I
         1+5zd+1hhR6mQuzypcbLBC88r4xRnLAxJViziRUbjbRPfi+5olZ0NXqJllUXysXZrU3X
         5wi01M+beyh4lvHNfVG6JRxByfENf5MZ9XqlWb4rLLJkUPTVTQWSgoLPf7vzEXLRaQmO
         /y3g==
X-Forwarded-Encrypted: i=1; AJvYcCWpxE4NxViEu2+/KAMsJZnt5ljN1EAbyGSPbuLbUcXQWk1SIrp4bLu8LohnKJ/xho1IPqjlSFsjVNOD6WIpFYlr@lists.infradead.org
X-Gm-Message-State: AOJu0YxSM8NYfaO5KHmhwcDwKm7YIO1RmudK1RsjO6Lwcxh6uwaMFQby
	bjspic6XwKSujPNADgTwPz1N3tS9xQA0VFWQUFM8pknb7rV46SwZjZWlP4FUb673zOkjb7z9r/p
	k8KlfmsXgwUWQayEwjgfHOsnFNKXHJyJST4OVTB59gVn//REJG1IYxP0GUJX7Itmmyegw9wTz0l
	s/Yg==
X-Gm-Gg: ASbGnctGgnh6QHliLisTTJdYach0UFSFYsi+RKmnAWiq88XFIPWq+R8zYrHTY5wehw8
	Fwi2tDuQ34U3tTxOqjam2p3p05FZlYMDSDKCZ8/M00EZoWt39xgHvNz2/PT3ATYQKbsLz+7SG4b
	HxhDau0DgpkKtuPmyq6cB6PXH+6rQAPScYFJeTm9anvcodvgtIlAbhr3dOyqJlhZIQh1v1E6JOu
	YUxJmrJB++B71NGKpd548jiE0MQZbB4f3XQdgp8yfylxj9yzkcVGymv/y7iTkhgGroJDGWhP5fs
	vlyf2YOO32lCydeqBW+fO8r3xNnUmd6RQaIBUrTqb/N+KQ/VILAjWK0NUKo4+sdqrLwPByg2e7p
	vOvnNvwC//qnYSCfwsPhv5prjI4X6uHnvN+ybn2LsJZiqd4icR9Ke
X-Received: by 2002:a05:6102:644a:b0:4fc:eda:abd8 with SMTP id ada2fe7eead31-53d13a4ae5dmr2295376137.24.1757426520491;
        Tue, 09 Sep 2025 07:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL84NEi5zzLfmvA6uWURA/n95r+KLG5Ks00UXmw2/s0p20cMz2peYilnoYQd9/RRTYJAcA+Q==
X-Received: by 2002:a05:6102:644a:b0:4fc:eda:abd8 with SMTP id ada2fe7eead31-53d13a4ae5dmr2295275137.24.1757426519750;
        Tue, 09 Sep 2025 07:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818067eb7sm537728e87.106.2025.09.09.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:01:58 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Message-ID: <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909114241.840842-4-quic_vikramsa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c0335c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=xh7zYxaUke6ZEiU0VLUA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: huYXrkQ9w3jjAPBUHLdkco53O_y4w7tF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7zyJdigKEjNW
 Z1gtiVP3uC35MBN50FsXFbq9UENrzrLKCJUXKYyOhl/t2spoHkaV/shMInPP0R7XaYR+JtLGAoS
 dxWNswsh2zWLM+V9YARek7WZ572cdqXO4FwDl1+dFOp9rjAP7hxKnn8hgU75sXmGptpL1697d/a
 T4CzzU5/SE9sP4/n+okveDL61R9HQkIwYczav4xwcBMLPLm1BQrpGxS0/8ERJ5IDXsFJIZ/kuHR
 gt/6mU0/0gWcUu+UqO1Iv5obxFwpGQ7dD9mDapFvXYreVOLdSGDwXYPe+76QVX7tB1zly1OHGu6
 6cZIFtYH4ChslI/9NYa
X-Proofpoint-ORIG-GUID: huYXrkQ9w3jjAPBUHLdkco53O_y4w7tF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_070207_650129_0488DA15 
X-CRM114-Status: GOOD (  22.38  )
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

On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> Camera reset is controlled through an I2C expander,
> and power supply is managed via tlmm GPIO74.

Why is done as an overlay? Is it a seprate mezzanine?

> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +
>  .../boot/dts/qcom/monaco-evk-camera.dtso      | 98 +++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> new file mode 100644
> index 000000000000..5831b4de6eca
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/* Camera Sensor overlay on top of Monaco EVK Core Kit */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {

Is this a different product than just Monaco EVK?


> +	vreg_cam1_2p8: vreg_cam1_2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +

-- 
With best wishes
Dmitry

