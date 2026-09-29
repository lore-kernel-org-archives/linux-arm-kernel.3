Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81180CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=; b=nbUFPoU0aEKQDUs7/gJ7zk9nPv
	5ikDuOPpGqu/9tBMuAoiTQuDZC5lHD6irt+arB5cHe2LRvOwI3tOQNq1eUOuaZ55uwhkvXecnDSiw
	wR19cRDsO7ULS2i69ivVejJPsRdi0iCD7hhnmQ2nX8hffqv9/5jorTn/vgDjKZXxVeIi1J7VAJQ2x
	knl/e/IeluVMDvVDiI8t7bcjPP4Lqq5h52F3T8pOeCxbLdYbmYEepCIFoTwc2mWACaWwg2m399tM0
	j6XbFUIeOSNsDrbCZtT3Y94u2UTQ9MD0PtfyC23ITAufMBksi6PT65xXZkW00NZSDDIQDicepS8Ck
	FCTMJ0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRgE-00000002Wz7-2c3J;
	Tue, 29 Sep 2026 06:51:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRgC-00000002WyU-0UcL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:51:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47KF63241648
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=; b=Nn1oTJqZKgpL34gB
	PYd6lvc9jUtOrzbjx11pTeoFrNmIxW0en6/g71KyXJ39sqFDHbGo+3m67xNCmTpR
	2mgvv2L2qO/RtMmJ1afjOzAOjbv+lTkgTSS38pdoSBL3rvCe/ZHwegTryIPfDtZH
	SCZ9v9e/+7uRFb55nJlWPu+65DCT8HKA61N4fHPjCWg2biLYIIaNzWCY+sX530EH
	KYg+SFS+785CLIpvlQBejGqM9Li5S6vI2b76hHK9tPk8eU/siHnaW3vMKyQm4Wq0
	ndPKEVAhMCVPJw7dUNvyPVjVPBKiKY7/OfcDss5JTGsfnIhKHo/phICgg6f+R6kk
	JPbsUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144sj9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:51:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a43fc3527so640011b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664666; x=1791269466; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=;
        b=X2mAa8LLiP4u/nuNiELNxPF7McyNpX3ovnU+tUlLdlR+k+sCFFVAZFG8Yoz+qDeouh
         Ie2d8HhBMcmOzxbebtt+b39thNjgYd50uj+ObG94L5SpF9ASbQ/ITagh6+oXF87NGdL+
         8TCIkTWdVazJebkWCF6rzwToRpCZ+4CNT+wHy+lS4r0wViINjWRyOZECotGaHAbTBCWj
         O8r6P0U7d5oeKjLEGoZevoDJFbFIRlc6tMPvzI40yLFiVLrHCfrlDBac09gwF3z7NDZY
         r1hqJ+BNCkQx6W1nt8MgsVq1HtnG1kX96oTX+vOhmbRl+RWzC7CtzN2JxRkGh1Ae0kZc
         Cp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664666; x=1791269466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=;
        b=uwK+E0Vcl51xMCFM7tvDug3c7UW0vIVOPnL6PKcSxWYK3RdPv4V9zhs1QEDxoAMjsd
         viwl9TrrN0Tu7LwDZImNQ7LR5osftrJB7AGV2ih3j6BppXTWt5d6xlFSxMIfB7+3Goo4
         YeJDmPtGI6Q5KUleBHJqCSR9yMmbaosM3WzArQJ/HLOxHjtuz1mkC4W/sfafedBHp6V+
         npE9/87o5HEn4cqFfIipAewO4HKDvy78CIf2gQ2tQN+cXl4WbSJ69RXSXvuBLNRW8hd0
         CUzBLP/Q84kZZ4GE8c6qzgPYwyhuXjpaNn7Q6cJQ/eyh25ims303sKJ1tIa/Bt3zcP27
         5yZg==
X-Forwarded-Encrypted: i=1; AKwUvBwdM9HmiPc0CtZYnhHKcE+JrvoLd4THlfjxmiQ4G6gglm2qBmn/QL38QOH7PjIYpJGSfU1yPqVySukW4usa7VMB@lists.infradead.org
X-Gm-Message-State: AFuF++nvjoPrqShXB9wh52ub5Be0+nGflzn9AXuQa1+fvPJvI9+3PzPW
	xtD6D7i9M8Zpg5pxPZCpxOhi63FuYIhWV54zYGdPQVLTk+eUnRQQQO31WUQFrcJ09vMXV8mQMio
	txrpBWlt0ALuRC22nKjcJ/wexeuuoDA23y5HOtU7RGnIUH1j8zhLdkD1yK1RZfWhBBW1h3vWBpL
	BkdA==
X-Gm-Gg: AYBFou2YaP2PBDHJNsSuKFXVAHuEr7WV5PSW9lUusxHig5rajGtL77Rtveanq2Wqo56
	fd8P04zogyaGMQUj3r9olerk0eNaYxza1VUMBYXyign9JJGyfJZfy8L5wgTizbVU7sju/9PbMCD
	uqMLm8F16eiZKHXnESq8O8Sq8q/plzLZWvM+2VYkqWBpMn3xxITlN/fegNbyBSvt96r9Moye60X
	J7eRpI6ykUfh2Ij7um01vVtuHKTtZyhN39CVcHaKe1Xtf4YZy42yG0gmtLSlVqOc8LnO6184CPK
	R1A9I244xOSU9cBFgW6tHG6a0OBkQ/2KQ48+cGt+TqGsn0fjaacFi5hA1NYPRqEX07W6GAfqS9z
	vgszRcl5UBhIbtFpgFeB5XTQtOAzqrY3lwVRWWBhh+t4CPa1WIv1wEYph43Hfm5LNi7h2CA1AK3
	Spv/gdDnl2GFcE15N4AWNu
X-Received: by 2002:a05:6a00:2d25:b0:881:236b:748a with SMTP id d2e1a72fcca58-8855fb8b546mr1025634b3a.16.1790664666095;
        Mon, 28 Sep 2026 23:51:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d25:b0:881:236b:748a with SMTP id d2e1a72fcca58-8855fb8b546mr1025611b3a.16.1790664665618;
        Mon, 28 Sep 2026 23:51:05 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e28d7d23sm258534b3a.56.2026.09.28.23.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:51:05 -0700 (PDT)
Message-ID: <186fbca3-3676-492f-9c8e-fc7a75d5ead4@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:20:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX9N3llZCD7gWr
 qJIxhmOBerA4ptghtK2F2gfridK5hLMRmaBOdYkURLydQXFI0NT2G+9YVnQeq1lfJZ2F3Qu5h8q
 PNJyQYUoD8TPFGYLjhgKpBD8Ogz0HNqIvdO3lC44PXZlugzzrD4X/ZKQg3VYcSPLV6GSvNN52/J
 6c/zY48GeenMNodV0Axi1iyN/+Qg7+G0h/p0V9KVMLxRGQBwpzUxwXz84yr94DA8uBinNSvlbBt
 LAByRiRYHt6GWn86QusQmrMyjz70B0rYU5x3B5Rca6R8+vG53ItJGUU3Wv9egme0u2CmEV+8cmf
 i2hnJ/VWNqSca2RKWXSlPLMuQVyDcWbaYXY7ttQlanY0jJNnQ7iDyTuoLvT3VJVytRb1rSIGn/n
 AQq0DpoM0ZIwfL9WZZI8RMVEE8ckHJ4MCkGW9vFolXfc72wzm0eh5uUixfZm3GKm4BcHL0VpQSx
 30VNiQecS3Q6MPOD0fg==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb5fdb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: eNy7AHDdRJqcRQuY5DnvBTtb-Y-CHYbD
X-Proofpoint-GUID: eNy7AHDdRJqcRQuY5DnvBTtb-Y-CHYbD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX8Kac1oOJyy9G
 8g4jjZmVQlbYB/wVZdqJJGeNkLne+T5b4g4DqBk+D+lZVTccDGwRR2r4ihJ7beiy0zjD4bA/1kZ
 PUDMWmUGDconTkF+3S+HCaPm/6OjyZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_235108_275567_B8B76C27 
X-CRM114-Status: GOOD (  16.25  )
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


On 9/1/2026 9:26 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +		pdc: interrupt-controller@b220000 {
>> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
>> +			reg = <0x0b220000 0x10000>;
>> +			qcom,pdc-ranges = <1 148 6>,
>> +					  <9 156 2>,
>> +					  <17 164 7>;
> GPT reports you're missing a whole lot of entries here and that will
> lead to the wakeup GPIOs silently failing.
>
> An old local script suggests this map is correct instead, but please
> check yourself:
>
> <1 148 6>,
> <9 156 2>,
> <17 164 7>,
> <26 173 1>,
> <29 176 1>,
> <40 187 1>,
> <46 193 6>,
> <52 266 32>,
> <84 249 1>,
> <85 256 1>,
> <86 315 4>,
> <90 43 1>,
> <91 45 1>,
> <92 154 2>,
> <94 158 6>,
> <100 171 2>,
> <102 174 1>,
> <103 23 7>,
> <110 147 1>,
> <111 31 4>,
> <115 175 1>,
> <116 177 10>,
> <126 188 5>;
>
> Konrad

Thanks Konrad for review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/


