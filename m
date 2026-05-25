Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4EECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=; b=ovNiw2gNb5j831e2NmWet/gjg1
	lYRzzZpQL97dnYONIZeUVm1bUvZqmPWeyQDW95KLC2RUTKOfLufnGby+cxDB9/u9U9TmYCMvqnRPT
	Rg5Xj3SlW9FL7zObF6I533K4VLxsdAK+v6Ama2qilVkGvgxhQp17CAGbVVHWb8p4aQi4U3opPrD3k
	tiQgKqcBw4tj588T6cRxLtQUdlujgjoE45P0MXbwYmuv9mRbJXISJcTBrpA1xzJ6r8tv9eYNRdL+E
	zbMtJI7uWzFPJXmTYSLdb85y5B+7zeeuA5q0mvB+Lp0Spr1fIcpV+M5Aeo3D7nCG1OvbmD2dc83ME
	bcWeqtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFK-0000000H3AX-1MSB;
	Mon, 25 May 2026 11:13:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFH-0000000H39m-3s86
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:13:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9cjgt1802476
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lCcY67VRp26KG8gUmXkaFmQN
	V0bN6FhsAAQbVvffwoE=; b=N2yHIfNDPCAoU0qJJ2fS+P/o1mscfVDZ+owL1O4v
	Y+7ouHnArUgFXSk2rhBHYgWlhK03pGP5KcHUcXpPMw7E+aasiyFr89PIYkRjWBcC
	uKjqRp9CjY8ofZFd0/+8BsdFrcvQo0avU50tH1CuxzGhBm4qcyxd870uHVu95xCa
	XtQl3Gqc3H1ePAJ+WFqfXkBbtY/biq2K1NwCPdoscGDceFTjyKyP/w5StkiyogYc
	LbgiVCB5SgFcAQFhBtiv5aLMEk3nOoaQlqY7tcnLPorgW3fc78PnAknMcLQLm8Wa
	s9s02nwk+R8Fv9ac+UcsZ+kGO6g7THNY+WjkTGG2Fg3E6Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqga89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:13:18 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95ccfd9b58dso13519126241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707598; x=1780312398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
        b=YIFzgp1CqK/ShsCJ8tmVnIEhX8vxXhdcsV+6ws0Dx3E4xERbHb+BVYLS8oPtuQ8yIS
         GgMj3vs/DtLT2Rl/x3z4gWTW+drDVwfOaQdND/jTdPnr5N4T0z23ztSglSpHRWkdHCJT
         MuXVCae9IiIbhJeQ24Q7mff265MfZpPdYKydML83aJG1D4XvOFB58wvkeHiy/CWJR3Go
         7nJnsyhLOdiW+Pe2AHQ6sJS7nS58m/+n4W4YFL2nhbDqZj2xWPNbt0mfFTustcjL2VuF
         O00HKMlxs7icuuWJQhN355TDTQdbrU5YuaSHy3O7BbD5dFjQPp+pTKHE9ZeDmfQBEWrj
         Ba5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707598; x=1780312398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
        b=YW5QIihe2RiDDGLRu8rSHDtfX8BcIhwiZFFjafWE62H5zZxx8ZNQpOW1gIZBkpmOhE
         8UcY869Mnmswjh2NIqKRft0AwpTWLbKhclb9I+X65WLDq6nXjeY2vQb1TaOdgueaCaDW
         FSL0QIPH0Lqcx9m1c8azp0gqOYQtaWeEsqVsykdz+cARlBlHGEZlpkub5YdktVp+k+OK
         nlduiu4Awj4Kl+E+XWfPeF+VNm07+Vy5VE4Dx9IkMuEX/TH3aEjXetSoQ9VDFDIcgdIo
         q9j7UJ19u0pld1Jr1baPexFd8VCeY+y9nm69AX08H0GPRpXma67hspIYs1STClUt2x6K
         VlLA==
X-Forwarded-Encrypted: i=1; AFNElJ/nCzgKz8Qk3E4uyHjT523lWA296HS1WxCtkSoQVg1OcujI9bBuOJFvOFcKQx90a8StQ1MeLLg+x+gwt31qWPnm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+FvblwqxcevoKpnC5Ku7jFwI3tIKD67UkO9T5c26/FZpVyhIL
	a+kIp38hWjZpfc4ry+DDWswrSyxWJTqQB9e9rTiMiPjOv3MCbjmWuxu42DIjWUiMbgH9RnSgpmM
	wDR0ueEubjjp1OK27HcVV/s5U1fHCip0Gr50xobBMz3yQj9AvsV9Rj+rX9ynvCkaU0qD/Ub/Kb6
	vwyg==
X-Gm-Gg: Acq92OHEuCN4Yh5zpPSzfKj9WREWsnpMU+TfhpxGrRe/8v2WhULZZkz4M8Xp/Mnof5A
	8A0qzCZjI3fYlk5WyZzrP2PMtJHmbIFqK0L814782C2DNwY9KiThphmLLTFmMOQwCWi5S/6Mekw
	P/runXVxNCi/RsmQqnXB4FgvYz8ZrOqFYe0m+rGfUiQ51S0M+AqKCzksUqE3LfGFnlQcqMSIZRi
	KmNszfHnj80SdPIQIsHtUkQMtTMmZpQkyDLiXpUSgalfkPnSX1j1YCLyZj98uyLxHFOuhP9+tPv
	c2xrPoJSSlaEj8Q69f5F+xThqyjhwrLVh3fyt1oCEeGykj448gG7wLDlHvxvxZOI3KWnAqmozs2
	AVfMdBrv/ObkpBZKRISlTXgp9VSDA98It1VAiVhwgLSCdH+5CrK6+8zDn5FqDcKGsCIHNPIh3OJ
	iyf0kfyYxRtxZUD1zNfj68QJ/4wohg/cv7JtQ=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6786134137.27.1779707598213;
        Mon, 25 May 2026 04:13:18 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6786125137.27.1779707597811;
        Mon, 25 May 2026 04:13:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2ed7sm2648170e87.68.2026.05.25.04.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:13:16 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Message-ID: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a142ece cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iCjoXWfrZ2YzCb4Nau0A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: eRo_WIUCq8dj2s8AoXYsNUOaVouVT3am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfX88vxfUwgccJk
 RDO171J3udUoHThXa5sow23uN/sKyfHMF9FHmG0thzuL/dovpu3Bh3eeJx9YFpPC/6bxaD7akvf
 zRuzkpmDXqO2mIYduBEoupbNa0NAPA1e29y5y51uNRSZ5jtDxISKWrOyxIimqNWms9uRjq/qAEQ
 Uq+z2r48sjxEeOtSKDIlrus+JKC47qweMONzTEw0uU8a49oES7dn+BqUwOKQuoVU8IvAqchs8P9
 N3y3M94ASlesV3r8VDH1sOZcHWtz7r5uP1Jzpd9xHvM4Frrl1h5ZzJ+75Z9W7vGrudnWNc7qKBc
 GJYHWvg7JS5tCwEqtIXDIiM1pIPzP3Ed7yyCatB5Iq26O/rEC2ePFAjx+A18Y2uTn+nlK7W8Q5Z
 Xrmm7QAa89wbX/ywM7FCrc/Od4yQha3LfwxtevHRtb5P/K/x2ONcr2KIFk2sFP6sjOGNmJgjYqw
 N+NI1tF3qj/L2q9k9aw==
X-Proofpoint-GUID: eRo_WIUCq8dj2s8AoXYsNUOaVouVT3am
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041320_081264_A03DDF7B 
X-CRM114-Status: GOOD (  28.77  )
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

On Mon, May 25, 2026 at 04:16:02PM +0530, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v5:
> - Taken care of comments from v3, v4.

Which comments? Please be more specific in changelogics.

> - Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
>   as required property in bindings.
> - Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
>   bindings.
> - Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
> - Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com
> 
> Changes in v4:
> - Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
> - Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com
> 
> Changes in v2:
>  - rebased the patches on the latest linux-next.
>  - Add new bindings for Video and Camcc.
>  - Remove commented code in GPUCC (limiter code).
>  - Add device nodes for the corresponding clock controllers.
>  - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
>  - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (7):
>       dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>       clk: qcom: videocc: Add video clock controller driver for Eliza
>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>       arm64: dts: qcom: eliza: Add support for MM clock controllers
> 
>  .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
>  .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
>  arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
>  drivers/clk/qcom/Kconfig                           |   31 +
>  drivers/clk/qcom/Makefile                          |    3 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
>  drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
>  drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
>  drivers/clk/qcom/videocc-eliza.c                   |  404 +++
>  .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
>  include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
>  include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
>  include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
>  14 files changed, 4666 insertions(+), 4 deletions(-)
> ---
> base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
> change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

