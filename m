Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69314C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svOIBgOqEfJz5rl1KUebw1DSPQLmx16oiBp9+Pj6aYI=; b=YxNlBfpXLV3I/jRU4TnwxRqw5H
	1VEqcuGnO5IdFsLTx2biSPXy3C+ZrFCcLuD9OAPEFOyjYtuMfh7RRRGYftbmSYUkHmuaHHvAXrtuq
	60Y87ZbJ1iHrd3pyN/pDUZ0rlR5Nl6XH9sAHgZobUUWkQO3n837Mp/lqOd7p+ZYIMLiQnDikmeG5B
	p+kit2LSomYS8blSnnGaVadIUgszDveT16cxjxHYAeJyShLLFtQS4yyWUhq/+rp9SZx7PlSRo2giW
	U/XGNumvVB9aPutNFkl9h+2KlNmAt8UZW+hQ4NYtCOhPSYQQo9Rj+a7HrQ2zeWUjGbZLuhNHBiVHV
	33KU2APA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3W1-000000073jT-49Nn;
	Sun, 11 May 2025 10:02:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3NU-000000072oU-07zA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 09:53:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso23879275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746957226; x=1747562026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svOIBgOqEfJz5rl1KUebw1DSPQLmx16oiBp9+Pj6aYI=;
        b=tbX96BH07GjCOg6Qnm9g72rXOwuq8Qo8TXpHkB47ztvfSgrtO0jcOSwVPr5sWthwt8
         GoipDxUDMdNIrtd8ARowGxDGtB/y9JMqZr3MamFrd+gW27wCPHGm9es/Dq06gjzEFn6o
         sPJCx1dTZ+KW9njC44qIFu+arZNPQNRyBIZYrKqQwR/wLWxpaiP2KKtZKXDW8Qtu/oVv
         dHUn8+bN7SlomBnSz3pjVm7+1KeDh4oLZNfGOwyGRSEEPMNzwWds+eyxKAv9kgShBABe
         NTIeLrh5H3ip++h2Iqtpu2yT4SSH277aSOtl7OEML83Qx/3dGetLE7KWYLjdhPQi1SV1
         yrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746957226; x=1747562026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svOIBgOqEfJz5rl1KUebw1DSPQLmx16oiBp9+Pj6aYI=;
        b=N5qKIhJlruBtgMjQVMdMOHm05hdpISni4ye2RdlOauum9nDELIe5g/9D60XHEebzMa
         N+FTiRZy62uMoAa5W9SfcTbtuPIaQCWRh+nSIplI0xaWJCMvX0AnQMFdALmkSZlQ0GUy
         i70U+ZOYmc7HHA3dmMp887KkWP1LfnpWXjW3lyIE0K43WpeVgQ5voqfFVzh+FpIAZoUC
         kLA63cHSrEd9fFHgzHb4wJNxNtX0nrjUetmPynlLjjTKxoUZUVoGcoAz8jiYEUv1KB65
         JvRoYNQc2rYfsdfBuWSqykFtlNe9yaxOKWMgQPBWaAOeRkNY5TvlJqulFgv7ZrG/SAWD
         KvzQ==
X-Gm-Message-State: AOJu0Yymfai0+HZ5HpWTB19zvt0hdF0tErT1/0XJeqwpdyQPSVybiXz7
	c6GYNOmZdo8a63ryrnph0rWXNI38ao6pMfKPQO3Jr0TOXl9vT/y6Ek6dDtDe/vM=
X-Gm-Gg: ASbGncsPaBmby22zVgei7eCI3vpmYHb2X1HKXCEocIgYBWcSUCzWj+h9LMDjUrJAnWb
	H+3jSj+5/+CdEQIzKFvGXgzmRArta9l6s+RvdcilG2ElLx3egZ09jB+b2kqjH8ZlFQcaMb3/Q3X
	fOTA1yhssgHOu+rIib081Nrnt5mMPClEv+MIPE5krO7mjQbxO/RaMcp9oFf3sZXAQqkxqxxrj0C
	GAQneSs9JNGg1wO0JoCMrCEP+0WVEAfGoZMH1GWZZbCUx4NC21G/+k1Gc5g9YwPNRvnxt2iDxdE
	FNofYN70+qcPZhS9eKUhX/4naQkH9MzW/93XXgjAl0JrNS0Bef7Duww4QkMXSf4bDy/GfV8xTPd
	qnh+ZAVH3AViKjfGW
X-Google-Smtp-Source: AGHT+IEaXwLtr3ulVMHDoKRGiNLV/K4UKtErrKqyimNqORo5mIpZHz11BKqYDHNoxO5NUXC77uulTA==
X-Received: by 2002:a05:600c:4e45:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-442d6d44814mr82270705e9.12.1746957225872;
        Sun, 11 May 2025 02:53:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm87083295e9.37.2025.05.11.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 02:53:44 -0700 (PDT)
Message-ID: <cfe66826-fe23-47c6-8292-74066f021330@linaro.org>
Date: Sun, 11 May 2025 10:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for
 camss
To: Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-5-quic_vikramsa@quicinc.com>
 <cfc85bc0-1808-42ac-b0b0-41e4935ec74d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cfc85bc0-1808-42ac-b0b0-41e4935ec74d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_025348_079186_0DD47F88 
X-CRM114-Status: GOOD (  18.08  )
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

On 10/05/2025 08:14, Suresh Vankadara wrote:
> 
> 
> On 4/27/2025 12:31 PM, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SA8775P.
>>
>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>>   1 file changed, 187 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/ 
>> dts/qcom/sa8775p.dtsi
>> index 5bd0c03476b1..81eadb2bb663 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -7,6 +7,7 @@
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>> @@ -3940,6 +3941,192 @@ videocc: clock-controller@abf0000 {
>>               #power-domain-cells = <1>;
>>           };
>> +        camss: isp@ac7a000 {
>> +            compatible = "qcom,sa8775p-camss";
> If more number of nodes are added for CAMSS, adding isp in compatible 
> string helps to differentiate.

We need to keep a consistent upstream schema.

If we were adding other hardware blocks - say the BPS it would just be 
appended to the end here, declared as another v4l2 device and then 
wired-together from user-space via likely a qcom specific libcamera 
pipeline.

> 
>> +            reg-names = "csid0",
>> +                    "csid1",
>> +                    "csid_lite0",
>> +                    "csid_lite1",
>> +                    "csid_lite2",
>> +                    "csid_lite3",
>> +                    "csid_lite4",
>> +                    "csid_wrapper",
> csid wrapper is top register set, which is applicable for both csid 0 
> and csid 1. It is logical to keep along with csid0 and csid1, instead of 
> alpha numerical order.

We've had it feels like an eternity of debates about this and 
compromised on alphanum sort of of node-names as the most consistent 
with prior art.

> 
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
>> +                 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
>> +                 <&camcc CAM_CC_CSID_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY1_CLK>,
>> +                 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY2_CLK>,
>> +                 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY3_CLK>,
>> +                 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_ICP_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_0_CLK>,
>> +                 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_1_CLK>,
>> +                 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +            clock-names = "camnoc_axi",
>> +                      "core_ahb",
>> +                      "cpas_ahb",
>> +                      "cpas_fast_ahb_clk",
>> +                      "cpas_ife_lite",
>> +                      "cpas_vfe0",
>> +                      "cpas_vfe1",
> Maintain consistency on vfe/ife in complete camss node. In reg section, 
> vfe is used for full and lite version. in clock-names section ife lite 
> and vfe are used. As clock IDs upstream and ife is used for full and 
> lite, this convention will be followed in camss node as well.
> 
>> +                      "csid",
>> +                      "csiphy0",
>> +                      "csiphy0_timer",
>> +                      "csiphy1",
>> +                      "csiphy1_timer",
>> +                      "csiphy2",
>> +                      "csiphy2_timer",
>> +                      "csiphy3",
>> +                      "csiphy3_timer",
>> +                      "csiphy_rx",
>> +                      "gcc_axi_hf",
>> +                      "gcc_axi_sf",
>> +                      "icp_ahb",
> sf and icp_ahb clocks needed?
> 
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                     &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                    <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +                    <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "ahb",
>> +                         "hf_0",
>> +                         "sf_0";
> sf_0 needed?
> 
>> +
>> +            iommus = <&apps_smmu 0x3400 0x20>;
> 
> 
> Regards,
> Suresh Vankadara.

