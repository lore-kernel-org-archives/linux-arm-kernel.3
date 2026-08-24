Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B10AC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBEO2yddjoRYR/362AQj96X4fgKk2EJOvMsZjHeZg7w=; b=RPvN0XBp6nLywp8W5QK5Ck3Hqn
	rcZSC7uCPlS/h7xC/tLc1/qLAcARBvqh/VGWwvaRo0ODpJkMpq3vN6iZ9c2TlT/N4suCITT72xXX4
	UyeWhc2ofYXIlzucWakRAEjAqW8lImG5mDJRUmMaOl7YOB3AFi23YK/BM+dGhrxeL3iRGtOD0/QW/
	tNS6TZuceH5BhwoFIOR2HDAQujlVxASkmYn8gccvxeqlNz5n6umtWtOOKmTBMZ/CZ9vtVLDqA9PfI
	Sk99pEy5t3e2ctriXU2obYzkanS2bHBeHSLL/CdM21Q2F0Tfom16Is7JwN0uLoG7wvA6IH5jjwDs/
	9CSIOgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPMr-0000000G8O5-1skW;
	Mon, 24 Aug 2026 07:45:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPMo-0000000G8NC-3HIZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:45:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67p2A1663169
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBEO2yddjoRYR/362AQj96X4
	fgKk2EJOvMsZjHeZg7w=; b=cyQZBhV+e0F00QCVxVnZRTOKfyCWc8t78J4BWLPL
	NpYO5Q1tpeVJ7VfIZ8as3elNkwZFgApYtx9y9z8fyuEprhnhVgnGBnKJz9C4nu2T
	Ki8ygGUPKTYNSLCdUAr2b47ftMMcHYd2TfUtqwdG4jTPaFfE0VDj2tGQ8gYpay9k
	Qe7Ue33Tmy3WRd82hab0LB58AHgDVZkeMkadNpqpKhjf+0LKcUtGmnvqzGgVPhUK
	L9BBSO4bhNyvzS2euUBVYylDt3eVNjIMfpPnu5Vu5NlY8Acq16rGoEmIpWZqTy1K
	Xmthi3tlfxf7JQGKyM8X+rrlxicoilqNjbJrmp8W/VZzIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsge5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:45:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so68198811cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557513; x=1788162313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBEO2yddjoRYR/362AQj96X4fgKk2EJOvMsZjHeZg7w=;
        b=g7YkJwi9wWgF68qpyd2xQ5qBuKwpS8qDjo6iD0D3I1A/3P/Y+mk7yNfMfS7kXAFzPh
         X/4bYjKa4+eVOecJfQN93kJCzmH+V7SOEe2+WI9hTLtdMGwhaLgO4aET2goM2s484f17
         qqAKTK+myWN+mveCcnlmWVYSaklIAF7Z538BjuPiyRzJb2vNN0RENyS/KZOwB4EGYgcE
         2WxESPs39Hhz+KqCNq8MNlJq7NzQqrNNKaissbxZXMV3mtrQVRv5T546fsOqlLYmb0k9
         off+f6boX84AsiRrJq3hCDRsCfasCtI40qbh1YOku3AD9dFt0R0hOMl1r+0FxT9H+2qh
         bVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557513; x=1788162313;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBEO2yddjoRYR/362AQj96X4fgKk2EJOvMsZjHeZg7w=;
        b=IMQcWUcTmUqHZ9WDSqnrznaj8WXyXo4vZIG0jvHFVUI3yHg6U8S7Z2rbtlTXfeTuaS
         4c/aQvK3Pal3mErmltfLqDkKMtf/1ZfygaYz7ztbVzGXCi2+OKilY+yYSE1SAA/7SIiV
         efeptEJxR94WtjKABefB2BkUj1PBAowXnR2kFd/Wydj+OEUBvNobKgRghtaIuLchFm7D
         EedsMfng7BNNXgwJcI8DyLnnZA40zcYZ8tx/6kLW5rCiZ9L20qLaV8OXV+IpEn8SaYX2
         2P8EqLvzYKBcut3xGXbTEC5kOh7DseImHokyKaWUq1jBn4MUUNO05lWryMr4KRQPXVpR
         q5Sg==
X-Forwarded-Encrypted: i=1; AHgh+RqGIGjQXPq/ICQo1FbWF+zrF+ic6puA60vNyhY+KFTMd4PGJ8rxWIoM0X8Z84WpL4RYdubWjfgrJjArzEatNhYU@lists.infradead.org
X-Gm-Message-State: AFuF++lq5WDxyZkKHQkMUG9u1w4AlmrEoCM3wVwVmpoSnYDRyTv6cFKb
	s1knkE5ZqlSkQlwmQ5vVDmYVMwghorKck9uhFhyVJYd3sg6HvUDsRzMcjB/LYAS92VQydaxMZcd
	eyRcvMjBzE3DmtpQ8o60ZbZLALSOflcniUyNnA7lhaVkgLst8OtgHKvuSB6jTXuF74p2rJKbmi3
	xr/w==
X-Gm-Gg: AR+sD12WGLEeLk4zOe/ijgcQ057L/xDPcNB5SDh9YkYjp1JdJ5WDAdkW23/XobQQk5W
	W8K/b16hcwIHT5tWcLNigSVOC54XLwwoy1CHMBf9BcrGBS5Tqe1M8speC2WGR4cPx3yzTXd7hu1
	QZiT5MlwugZxnoFKMXIUwCIG3RK8P8sn4rxc/SzUrKENyBuJ+3ZxISjfIPhT/Nl7GR/bYS5UVND
	eIg9mz8MkobMM/4t2OKWWl5l6db0zQtPnwky6NRNQBx85xPY8i/MR+7UDjmS/IQ2Lm5JFSTEwb+
	75Bu32QL7SuCbwj2NqFOB3mkf0uXOzxfgqvz0uIucJ+FaGcWNeiZCL+mzNGm8n9cxsBDdyNYiNV
	qYUND0WPvSzLStkw=
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr168583441cf.18.1787557512938;
        Mon, 24 Aug 2026 00:45:12 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr168582861cf.18.1787557512434;
        Mon, 24 Aug 2026 00:45:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1270001566b.12.2026.08.24.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:45:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:45:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 15/15] ARM: dts: qcom: Add initial device tree for
 Kuno SoC
Message-ID: <2gvwwqbqknmxweztazdyex7wsbzyr7pxta65st7hvaohuq4xmf@3aqohho2dl6t>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-15-196e2b306368@oss.qualcomm.com>
X-Proofpoint-GUID: Tx_qmZMnIdHPn8Y7lc6JQyF_0O4ZkrsU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX9+eiF4bQ/Ivo
 bKLSAYloDkG8eNq0h8Cch1iVNjkZEgHNS0KVAvEXXxlv4g419HbXd8SJAYoHRiHG8I8EBt04JSi
 6bYcvdNzIi2fXz3MZHy+7gIegC4FOR+KbbIYihL6Zk41ZViZTiyj1aOdVlWzPGNUrBUMmKbkH+2
 /F5FF6UtBPUDHG/05ASfDHUWGgjSf8+0OOE/9Uy+V7Z7sdNbk3d2mFsMUTWLN8JPiem65MjvuOJ
 GqL8IitjToDKNC31MhUTkodx9Yq2hkIPKo3O3frTSKl5ZAvwjoExcnYlR348T5F3+glHEfF/n8E
 E0pfIHC2nm61lppgOpt1h2LRdktQyngrWi3qVJqjf5Hm+lmpRuhbpX3SVXS4/1h5MdlutJG70bQ
 H8UKNvHdK72XfBaO+TejX3XG0AaeIID/amI2I1EjD1KOx9sZZT8EHUNb8TGSa/dda2ldPsKSxUA
 JsijvpSxrnPI1cZb+AA==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8bf689 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0woZI7LFW-Y1d3ldtK0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Tx_qmZMnIdHPn8Y7lc6JQyF_0O4ZkrsU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX75eS+hkeQpa9
 dvLJcSzA3O66zIcjm76vfseoohg8VQYLbSAj2TkcHv5pqiMN02+McHXvwufTSvXseEI6eoqdUq6
 YVdes2dhc+P3eFEZYfpiwKWzHRJo9Lw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004514_935327_C0A5025E 
X-CRM114-Status: GOOD (  21.18  )
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

On 26-08-21 21:39:08, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile          |   1 +
>  arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
>  arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 422 +++++++++++++++++++++++++++++++
>  3 files changed, 448 insertions(+)
> 

[...]

> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> new file mode 100644
> index 000000000000..d430e65e08bf
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> @@ -0,0 +1,422 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,kuno-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;

Nit: we usually put these on separate lines.

The rest looks good, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

