Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0677FCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJTeQ6La+9enpjGANxo5EMqn9yfu5ZP6vTBXQafVj5Q=; b=Df6nyMnZD2U2vMs0q3LTqxBg+Q
	1WJ+D1TsvgRZHgqdx1fkgkT9o7dvG2Uj1ekxTaNmWXJpoXLEjOyEpN39h9VRB0gwFDyLeShYwMUjk
	RtVuEvIM6vrLxhfE18MloDQdvVR5+zv8h/06h+C1W1VL1mWLAnxMnjBU/ee6gIlaoGH0Jj6Gn8xFA
	JH6SCEYqyYnRsT3vRPTAqhLixGjCsEB2FKQvBLLDDKL5NMJVV3X23agtkhNtvQ6wHfqIdYFeeTi1d
	Yhsw22suGQzB8s2sf+llDhquD2w6ofonzllAxl1M/paAl4NANpvxjw/lu9zqNN/0452a7cqsPBnWX
	ACtUzw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweE6-00000002IJx-288q;
	Thu, 11 Sep 2025 10:08:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweE3-00000002IJ3-3f6H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:08:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IjQK031026
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJTeQ6La+9enpjGANxo5EMqn9yfu5ZP6vTBXQafVj5Q=; b=KJILzsXnxxfFpSlD
	tCnmGTyAjrfdZT9fqm11eZzkJH6PrLZyYtjDAr8RZQRyC27eLT1E1C/K9Sm8bmOA
	8rhgV9X/6d51fGPCjEi7NEYmzZG42ggc2WwwGAYZG29sjunhbFAzkyW87HxmUFeA
	Ps/OUvz6RzRVA3Ei7D5rySfKAH/KcjRyQZRRdZ9e4NIyPkjQkrHs0xRiZCGEMdTP
	TEUz4BWWgTRZxdiNbNoiHqW5Qg9FkkW9fOmxmuJaL9ac4xoMDRd5NAgpomzcOczn
	sI/gLnB8re3Duakdw4nlyereVvRCbLWGR3TOWrXtCUFtDefE1ezsQx1iWlgiChLb
	OwOaIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7026-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 10:08:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8153161a93eso140928185a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 03:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757585302; x=1758190102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJTeQ6La+9enpjGANxo5EMqn9yfu5ZP6vTBXQafVj5Q=;
        b=ZHBuG1NzGAir1plNvjM8Pnjfn/tEGGKuIGOu2ICUknn43v/NdTnNiXh36XAk1sUgRO
         tKRjoJrWgaWUGOgSz3M1Q4KBq79mRfq2jnYpZRGyNGyx3ceradWDv9ZdYExX2ttxjCyX
         TdCG86eWfw1dOaxfkwzKUH35dVBMYdImNUgScroikGi848dFan1fTsHOyHuOvC0529Hn
         YBkPckNIbd8/xnXDmTeg4LK4cT+jfGyuG/Nt7enlr82ZOL3lw0xoD026/GicWECibfqh
         vvNJzcuowCDz6ifTizeb2/RZwpYA6Gpa1Q7w81ALzzQIMB1bTfF/0P5oD4G2qsrfya+l
         Ae7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5rloVsJTojuqZNFCCL7FiR5Zc6/niu+QmO/gfyA/d4+nLSdtFvV1RSToez5gq2JRdTi2TBD9ZBT3ybFktFOBe@lists.infradead.org
X-Gm-Message-State: AOJu0YzMVeIocIpjHrPHwsALd0Hvhp4f3nFbRSnPi43hHFmH+Yeizk2x
	DODybxBWF7YpHnAJIrOFPeuefpzRxDZP17IqWbMdJxCWlI6Xgc5aBhO+FQuKABEhEFAlktTnkJW
	8k6pTcTLZIv0h1PyTC1fYxuzgi7MSabhmu/71K/6+O2KxYS2un3cXuhAStNBdGYm76SBCfWsr5W
	fPWQ==
X-Gm-Gg: ASbGncvKO/u9HkL1+iiHNFyPPPBDtHWre7j0OkfyJs4dK9DFeoUmG4qm37gYHy/Wg0Y
	mLrZn1NacuZUY0Wf3QgyZjg74IdN9BOQZ5k5MRGPZV9JPcNpK5R5N+ZQF0wRrkxnIjm60QpTtvF
	5mAuA/iDgvZGcBxnPz/Q/AM99GHo56+sO545aP0OYLNT72GiYJGNFmtrAIF6Aqaju63TJjk99Cr
	FxYcKKXTYnhwULyyp8kC2F4qE5MzbfPFqaXPq3cRqhx8f1/KZu8GzarSc4XqaPXzpOcpdBX1kvA
	oJU715EyMJyu/cbGWs50FyTndz0qIoTGUWz4RY4F04E1g3ZSzrTQWUDQ6bKOTyQWvG8vEVV5agC
	Zmz1vtxN+DscL99WVikZ9XPwULI7A7BpsoX9qp/Rg1hWAEkExQpG/
X-Received: by 2002:a05:620a:28d5:b0:80a:72d7:f0cd with SMTP id af79cd13be357-813c283b4f0mr1972557885a.56.1757585301576;
        Thu, 11 Sep 2025 03:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+vSCp0aQsfrgiWx+CMQVygTOZUT6hcev+c4fptHv2L3yBUTKkcvzaspp8tCLB16n41chBNg==
X-Received: by 2002:a05:620a:28d5:b0:80a:72d7:f0cd with SMTP id af79cd13be357-813c283b4f0mr1972554785a.56.1757585301036;
        Thu, 11 Sep 2025 03:08:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f163f495esm2066731fa.24.2025.09.11.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 03:08:20 -0700 (PDT)
Date: Thu, 11 Sep 2025 13:08:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
Message-ID: <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
X-Proofpoint-ORIG-GUID: ABb9E4dQnoIg45hjsdJLxyykZ85tgdK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX/0GugTzewNm5
 zaoQh5Oz/EfVWoAhQK4uc6O+F/yiFLi5f5SEWTLLtHPEVrMQo4LMC1d9efxpiqO+4SrZtFqy6+f
 tcWm8Euxx4QTR8mApL92mTSqcqnfrjWGb199S10dwGeI3zxv+d2hbkG/8TeC4EfQJtMar8LRS9c
 Ew7U396HiNJcwLhck/kTNV+dmJ+Oqx7jqWm2PEOir+Wth+rJtcqeVIjhtLtRxbaVULHAffFb/Pm
 epjEmNYjYDIOdw37qmb/6AV8NSv3Mkjnci9Kt4c6l9nFMBK8sxmsDKYyG+yiKPgOuZFElgjGXjS
 n7yzuD9TRBfmCg7PxMQ+t/XU/y6t2/WiAKd4cQVSmTJ4Ww4LeG5Gix/xslo4Q8z8o6uaE+b8Oxf
 GOxdlU2E
X-Proofpoint-GUID: ABb9E4dQnoIg45hjsdJLxyykZ85tgdK9
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c29f97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=hh7Il-xXmR37uoo-_j4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_030823_918101_368A9E1E 
X-CRM114-Status: GOOD (  31.82  )
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

On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 10-09-2025 12:33, Vikram Sharma wrote:
> > On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
> >> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
> >>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
> >>>
> >>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> >>> Camera reset is controlled through an I2C expander,
> >>> and power supply is managed via tlmm GPIO74.
> >> Why is done as an overlay? Is it a seprate mezzanine?
> > It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
> > sensor by default.
> > The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
> > on CSIPHY1)
> > That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
> > modifying the base monaco-evk.dts.
> > Please suggest and alternative approach if you feel this is not correct
> 
> Dmitry, Do you agree with this justification or you have a follow-up comment?
> Can we post v2 with the same change addressing other comments.

The previous email didn't land to the mailing list, I'm not sure why.

Anyway:
- What are other options that we might support? Having a single
  monaco-evk-camera overlay means that this is the only configuration
  that we plan to support.

- It all should have been described in the commit message. Please update
  it for the next revision.

> 
> >>> Co-developed-by: Ravi Shankar<quic_rshankar@quicinc.com>
> >>> Signed-off-by: Ravi Shankar<quic_rshankar@quicinc.com>
> >>> Co-developed-by: Vishal Verma<quic_vishverm@quicinc.com>
> >>> Signed-off-by: Vishal Verma<quic_vishverm@quicinc.com>
> >>> Signed-off-by: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
> >>> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
> >>> ---
> >>>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
> >>>   .../boot/dts/qcom/monaco-evk-camera.dtso      | 98 +++++++++++++++++++
> >>>   2 files changed, 102 insertions(+)
> >>>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> >>> new file mode 100644
> >>> index 000000000000..5831b4de6eca
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
> >>> @@ -0,0 +1,98 @@
> >>> +// SPDX-License-Identifier: BSD-3-Clause
> >>> +/*
> >>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> >>> + */
> >>> +
> >>> +/* Camera Sensor overlay on top of Monaco EVK Core Kit */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> >>> +#include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +&{/} {
> >> Is this a different product than just Monaco EVK?
> > No.
> >>
> >>
> >>> +	vreg_cam1_2p8: vreg_cam1_2p8 {
> >>> +		compatible = "regulator-fixed";
> >>> +		regulator-name = "vreg_cam1_2p8";
> >>> +		startup-delay-us = <10000>;
> >>> +		enable-active-high;
> >>> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> >>> +	};
> >>> +};
> >>> +
> > 
> > Best Regards,
> > 
> > Vikram
> > 
> Regards,
> Nihal Kumar Gupta

-- 
With best wishes
Dmitry

