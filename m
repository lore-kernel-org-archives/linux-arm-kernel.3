Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758ECC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=; b=e4TEaqkWxZC2ZWp/H0DYW4sGMm
	GGj0uwp6d4n8Hy0PH/Tg+dRMDZdvZOrZP+s4BdhYHmTPzEX+hvs828fpSQhun/mtksBHI70jBFQsz
	34CGUBMteRUU8JdqgOplYw8UMr2tAjcswvx89DZ3UgnfpoqoJfvjf9sHlZn1HBj7Mt3K/JrdowSM7
	2xrh+lxi7s/qdOTboDyfENvud7arhRnsLcbB+rlc+o7kdF3oPC8qND+8Pd4NEGkDyjR045QrvLPyk
	9jg7F3PbQ8ltYbzrVfCibube7aWs5ykCzZIyfGb8tBqdm4nH/uqhoZpU4g/2+ezCyD/hGc3FHs8L/
	zRJPn/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ8I-00000007x5N-1rCv;
	Tue, 18 Aug 2026 12:41:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ8A-00000007wzY-1UEQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 12:41:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfP1820106
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=; b=KhvHLXgneagenG7a
	TJl2JpqPHsu5Z/eDKgyCRQbfOeg12kT/Twe9rQZNkq0LmAvE1MumCePkthFm3joP
	UWYMd7x5bMKH0gYSDBUl2aB0s4rpvV1g/6ObFBjlA0xXR7LzeNx5wGTK7VRzAGre
	bAynitKFD11n8EKTmlr7gFlTQBap31wCvuua6f8HPxoilviRQJwa7DyRXZyyvIbS
	XJLduckqkE2daAJfZh+rpZB+EjoKiP2J9UqLwVCYRIN707KlGZ0xLr4nHz77vIdG
	/YyPgOpwpUtQToYmndD/NtDBBI6hnhfs/jDIYP9VQfnqS+WyWwUBtiSzKmZ3JgyP
	JxlmLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p21jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93102454272so7467585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056884; x=1787661684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=Bt3E7xenVso1IdMqQ9eMS/+WNh6PzAWH7VtAdAYQw4K8p0sFmhQ8H1TNX0oQ65fats
         y+GiOqSqiwLGgzjkn/l8paR8nY0QuJWuzluYkImZVOuVwYZQ1UhZA7l3Yddcb2qfNlTh
         J5vEske4+dTmk4IYbkxdaLK0e22mmQcftxjDLEg1USTD/UtObd+iT93a1fAkdbY+XCrO
         DVGWwLO995O0in3Sn31xtNNU4UmjCK2jKNLRbDMr0APxR74l03LNKhXowA+/jn3n6bu8
         fDcgWds8qpjlt7LIgxHSPPq7+7u14xefK1f9ukg2QwSYHqHPX12oMxgNcWvyTy87NakK
         YyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056884; x=1787661684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=jWcvD7SZsc5DJqz3jq3drhvkP0anpAYMjtC6MfvGYZXVTk3AXVcw01gwGH49f4NjA6
         GIJ/wptzRmypFIxb/6gkczvetHEJpJudB3rOoJyBodk9IkE6VsXiACp77JS9QktmPqos
         shAaER+CSnyRj7yx3Jve6IqlWutA8BCfhYqAqes8O4uJ/ADCvIbar6t4iGWhacQwdq4I
         uP0+Cfgy13K2wGLoK6rtpjZdpt+os21Xv/Z3ZMfnteLG3Hdm4CnWjLmM112BqPRDfm69
         RtSZrN1XWzwJkgiBuCMGRh64qptD04uqluhjMfTY/BHRqcZdi6n0zQ6ZKKz0kqPG574r
         QsqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoM5wh+y1v14Mb/T1vuQDqGmTR5mlWSnRvzwhlQV4JDbcy4S0DCTreOiXB5Q6edyAAH2tYh7Sd42/85SVJPPuCc@lists.infradead.org
X-Gm-Message-State: AOJu0YxwuQdNr7mfgX3i94ctiBAj4UzEtLlanHNt2/almrtv4QRHVscC
	9kxdRoJqJWwBp5UKmdkgtIgTLADK7XiTkC8VIULUiZs4VbDhYhJ0NGwPUZjaQtGyDIAqAChGTJG
	DldKEFPZ8BrthwVrgsHgQQcLE6sStJjLVD5UjkuvjT/gJiaHh8X/lzz0idcfJp95K/Yc0FFPlVF
	Vllg==
X-Gm-Gg: AR+sD138GYVK6npZAT3ZSftkdIH8kn/pd1F2H3pRyuSauZgOdbIY9TTkVsAa9o+Kvp/
	Jsg1K5Jb8DNBZ/gFJuAgfSCjZRkdr3Pvhci1pTPViILe63a/6GOOGQNO298MuKUuQa4yjZThyR1
	yLpvlRo9+iI8Ok3WQqTfvWCfz04UdrGWjEHsBytO2tktqiLTDyhZkDOaqOFXswCUOdovrADKk+/
	wwJfceL3JiXjjoExRYp4wGyDTHlkWH4H3QxaYHF2WcPY9dJhJ8mobjvxk8oMt2VxR7UeF6BfEOV
	N/vrw5OBHcKlACxwmuIEYu9GzrjlFRV4EMeHlSuzXLzP+q3vutLhP2yR7etrCQTM4KqyPw/8gn4
	9HNjPoYZpJ3NPPBz6KM3fFrlv
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611788985a.4.1787056884518;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611783085a.4.1787056884066;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97a22sm140036766b.42.2026.08.18.05.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:41:23 -0700 (PDT)
Message-ID: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AsfaBcQbUBvjhuFp52J1nkBSaL1_qWPr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX99FPfe2pdQlr
 4drh7I6u9iKQvQCNeUFYeulykgjeJg4/eeQlL1qdxCC4CBZEkF8rlmANVmt+EqLdq7eNkcPZolT
 x6B20rYxTgg38xyjE17Di+WIZtsldy4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXzTgJnkaUqfg3
 VvKFKd9y6VB5QcK2azh/viVxz69NI2COOF+zK+I5Oc3ZGgfkr7eT9wT4EdqzC2xEKGPKqBlHXEr
 mupWm18/NY2b/gkdMgeqS9sSiUx2hCjVOBVrCLtdDryIobwS1EhKJwufC6aXJbUuTR1DAcW/Zrz
 rHQGWeG/gxXoznPAHnM/rxE8izqTu1ucDnZLzgNYUbRFMyaIr1EEYTrbFuKDLK3Vs0ofxHpnWF+
 9bNW6Pw4E8P/1c9QP6GwsaU5iYn+1LHf8qWqJ0fbSr4/SrSQPU9pDTqFQk6Lrt8dBNtJUrIs04k
 wWJigXWuFO0Xe3SGenKnus7GcBvy7k7X+kp5eaK4cVdsgO7QoUH5uT9Hz9RZp3itnPXHI2CY2Sy
 3xVp3qUKArSs9FyEBig4a19TtZpL+T2ooUdyygd8tmP9JfN4Z388PY/Q/UfL9tyi56fIYLBK60M
 2UesQRfJb8jb3kQtvBg==
X-Proofpoint-ORIG-GUID: AsfaBcQbUBvjhuFp52J1nkBSaL1_qWPr
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a8452f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=UnzNPPs-tNYotgR03joA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_054126_514691_C264EABE 
X-CRM114-Status: GOOD (  14.53  )
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

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and models the module
> power domain controlled through the connector PWR_EN signal. The
> baseboard supplies VCC3V3_OUTPUT separately and has no per-camera
> regulator.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam1_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam1_pwr>;
> +		VDIG-supply = <&vreg_cam1_pwr>;
> +		VDDL-supply = <&vreg_cam1_pwr>;
> +
> +		leds = <&cam1_privacy_led>;
> +		led-names = "privacy";

No reset GPIOs?

You should also have a reference to the mclk pin state to make sure
the correct pin function kicks in

Konrad

