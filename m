Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B5CD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGkHjXmWVQjraKaJ6wwurxHm5JCQa5c/z0VsW8zE1F8=; b=GlCOI2t1MdG2CEWUHHtKnkGOw6
	odCy0x5mLcI1vb8Uwyy6o/kyo/HyYYjZPw4VxdICT4fwosNU+K66TIGwliud5FRUqT3bwS8Gsqo2w
	9jc4D8u+uWJXIFEMCM7V80Vg67T8okhbgiF3HLEJJPNup3zhnMArrCRYAak3uqfu1xai27qBl7D4w
	kUWcCgQAu/jSTs30eHrURk1dUMQxHOYsnKAh5FQAIw0NONrxfaUtyrQE7ErHsEa6Qvv4w5dCztfVj
	MD+xK9C8IFwY3oD6xEIitEHy3cVbqW6Sm+8SVvWK33vM5hnYGD61f7UL9Vxl70q6/e0ZHnOci+vwT
	pirjL9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XFA-0000000CKRB-2od3;
	Mon, 28 Oct 2024 21:25:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X5G-0000000CJ7F-2prj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:15:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SBPiLc021444
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 21:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGkHjXmWVQjraKaJ6wwurxHm
	5JCQa5c/z0VsW8zE1F8=; b=mS0SM146tNlumwHQZn5jjze0HBfwr2VwH2t1p0cM
	V8aDkZZ9Pf1itoZgnVL8f95F2TtEU0I9YeV2g1llDIiym20+pLMFTi1mWi/2vaac
	DSFUNw9ggDmNcziuJ7OAYQvTXtznS2vBllQwlPfkLr8CA0d5f+RXL1HhQLi8a1/v
	5uZk14gX8j0Nu/zyF8koG6DRwhEVAUpIIUDC+47dUDvUBc8N1cnQiN74D7tyIPtq
	Iy9j8jttPivmcCmkGc9sefCrA6ZzwveC6y/Oh5rSwS8s38zMfeEe7eyDEdZSmVR4
	Ujo4mZByw1EeFumrRXXK8dCpWfwlRrUQyAwej8tSZuwz8g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gnsmph38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 21:15:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-71e51a31988so6711582b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150128; x=1730754928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGkHjXmWVQjraKaJ6wwurxHm5JCQa5c/z0VsW8zE1F8=;
        b=SqPunXgmKS24VhhdumsWOdA1UU7GTyN6kb/N/PgVWikl3EsjRuaQ4a8vuaeOkh0ke9
         YkridYTISbRART5iIThLMIe5qL/IPkB2FTmmVXObzUy76dD+jT8rA06hQ4pnbEXtWUUQ
         q3DwVZJQpoWTvFs5O3G7v8nV913oqQhiaELVGELepEqzZzaL4YcuZ1UjZ9hHUXaJ8x61
         sGQN4mBYNq4aLsiIvYu7ooLlmb6xUVBK+cUkfveGUYnMP17/TKpF3OO29SYtFhjiSgtC
         Q7ApiO3kITNU7bgjpu+D+ejZsrxUuyjwQahBgzx9hZuWv3I08i515uiyi12kSK17a+fO
         i3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUDOEtISdU2ChS9k+i1JnUIkwEBPOazjGvUsjaDPCxpb9z+uY8Yo5zpxo5pn1PgA/+664K47Q+J8XAi3dilTMgB@lists.infradead.org
X-Gm-Message-State: AOJu0YyeYbV8Zhq8iegqpljTvEvldbqVURZwHl2dPbRPG0dRWiRlPh/T
	ctroawUxR6z1clxI8xzplE128Xi6Ow0XXoODKBcE5I457g5Iish29xQegMGVFpC9fdodOp2rfRB
	5QBp5ui66sjEnZTSMXbL4Uk9FcR2woAiGRCepCli2Z1wW1+Dq5qm2ACdBZFLAuPYLBO/xfvYzCQ
	==
X-Received: by 2002:a05:6a00:4fc3:b0:71e:410:4764 with SMTP id d2e1a72fcca58-72062f83b02mr15359434b3a.8.1730150127726;
        Mon, 28 Oct 2024 14:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLS4bXucVxPkbGCTLBguqswLvz+psebCz/QBAAb4p4RpFPYgkJ71k2/L7RSrziUNRgAsspjg==
X-Received: by 2002:a05:6a00:4fc3:b0:71e:410:4764 with SMTP id d2e1a72fcca58-72062f83b02mr15359374b3a.8.1730150127214;
        Mon, 28 Oct 2024 14:15:27 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a219efsm6252180b3a.168.2024.10.28.14.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:15:26 -0700 (PDT)
Date: Mon, 28 Oct 2024 14:15:24 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: Add PSCI SYSTEM_RESET2 types
 for qcm6490-idp
Message-ID: <Zx/+7BCOXY/qR3zj@hu-bjorande-lv.qualcomm.com>
References: <20241028-arm-psci-system_reset2-vendor-reboots-v7-0-a4c40b0ebc54@quicinc.com>
 <20241028-arm-psci-system_reset2-vendor-reboots-v7-4-a4c40b0ebc54@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-arm-psci-system_reset2-vendor-reboots-v7-4-a4c40b0ebc54@quicinc.com>
X-Proofpoint-ORIG-GUID: JD5c-eIjSMamCKOkFKADtW2G9bV_Sdud
X-Proofpoint-GUID: JD5c-eIjSMamCKOkFKADtW2G9bV_Sdud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=935 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141530_869662_51452024 
X-CRM114-Status: GOOD (  22.03  )
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

On Mon, Oct 28, 2024 at 11:44:58AM -0700, Elliot Berman wrote:

Please fix the subject prefix, it should match other changes to the same
files.

Regards,
Bjorn

> Add nodes for the vendor-defined system resets. "bootloader" will cause
> device to reboot and stop in the bootloader's fastboot mode. "edl" will
> cause device to reboot into "emergency download mode", which permits
> loading images via the Firehose protocol.
> 
> Co-developed-by: Shivendra Pratap <quic_spratap@quicinc.com>
> Signed-off-by: Shivendra Pratap <quic_spratap@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index a0668f767e4b..9c141244a7b2 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -617,6 +617,13 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&psci {
> +	reset-types {
> +		mode-bootloader = <0x10001 0x2>;
> +		mode-edl = <0 0x1>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3d8410683402..5360d0e51a65 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -850,7 +850,7 @@ pmu {
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  
> -	psci {
> +	psci: psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
>  
> 
> -- 
> 2.34.1
> 

