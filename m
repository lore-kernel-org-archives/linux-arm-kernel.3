Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9525EC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=; b=vHI8OO6h7jcOrGIFh9r67rOtJN
	AsjI5kKZSb5qRH7IF+TZ+ZnCWUJtw6tqZ1ce7eAdza12Vh+4zsFG6vBvTv4mTsWcWNE2E46S8e6oy
	c6A4rcN8L3MPjTrXtb+y7ZTNgeY+NtF/FCf15SDuMi2Gd4bVoDMU2T8dEOjJ7GQQIms7ls5buMZOc
	pbCSfMkDjsk0AO2ftQIlsdfPKaZr1YAfjspgcV7ydc4D8yWGQVGbcqPsHy2AesZUJ4sRwGhkxvWUO
	7MlMbotkc/XGF6Utiu/iQRwsQJXXM0VUbIae0gV/LRm9SMqWZynb09Qv7QsMiSGwM30VIQSLJTl91
	H0sWYx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAor-00000002HdT-21pB;
	Wed, 26 Aug 2026 10:25:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAoo-00000002Hcl-30Cp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:25:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGfNI121450
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=; b=VB63ATLQh1rIxSTK
	34aWxsiZ6QQyZOXcCfvXu+ptD9QteLtPIarINOeBNbLNhF8cCKu6KviKlqJoy87z
	+yLzBqOKXLVdXbMlCUeS7xk0tjcB5brZTna7RM1bOXBpHiaM+8atqQTrksJtrJLZ
	6uMzb3t+Ym1kqQyFM9GkOZEq8VZdbc6nvnAmWZJ7Gvl7AZzeHa6Upp3bHokU4nUy
	smit6pykgqIh5gKKpyObaJAVRy78b6Wl/jpLNVsnh9pvASSsi/BKAYPtWltu1jca
	P6uWaZQGV3dp2M+3zNdUOneiu2UAdu9T4FaPssbiQdYiPe7ChK7xoxbZ9uuYtvmN
	pMAU9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9aag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:25:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ea38b1e7eso414111cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739917; x=1788344717; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=;
        b=TYyGEa76WFqjf+SX9F6vdaQS6pSTKL7RKs4Nz6hJEuwOJTiHZnhaRBI0flDp7IuBdB
         YqLVdaEOaUSXItanZKVXYfMLvAZd1fHgCsGCHKi5HvBoDln9kfv2aNBp9hQSOhFBXDL9
         xRguKomezaPsGdyMgce38CKk1DwLH0WLx7mMygpFdQZttrvpMy4FK8gLYD/tHpcM7VxN
         ejt0H1YfaJpsuo0Z+3T0wQQrk+FUV3LJpEY907HwqRYkKiGpEsELgR4G6jpRPdAZNXed
         btIPrmNHxaMdXqB3aYhBWUY7IL09RU9u+GsiGZQgjTuRJS0nAastMXVo6xuJ48xlArlR
         yaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739917; x=1788344717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=;
        b=gZr4nWFUSp14w0ZdSwi4RfpQPL0znnx0o/iH1xuVZ4j+UIRByn69b1WRnNTS1S7YN6
         DGien7gJhi/4Ne6LZ+tPirh1oeiIzQhAKF0aMVwqRwmeVc1j2lzB0HlkSZlmRFyvt2Hu
         JYluKt00xNo4aIV5+5W9Onh3/ecroOwSuj4DrgDON5ln89VnOCSfytTrv4aEi+DNW0eC
         gkNrHZ+eWqtPrH+FH74zJOuYE/CJwUROg+SAc8LvNw4CP6zrf+7JhDodN2OwdSJoUVz0
         G9jMNgclcKTng60zcoNAs2wEIYwsjZAzbwyTAQnLaH0rbmg/njCUguUHFXHcpff8wMGr
         QKxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVklSS1dI/CU3y9/GfeUr32J6o3iXtHhSHtRvaIIOwMrMcpWlI20L7gQ2pi6fMYBtib1parUDdtSOvpN/HKIWJ@lists.infradead.org
X-Gm-Message-State: AFuF++k9ujrU7z+pSbc3yDm88nAArYLD/Qd/L9gkAIxvMKZNwn9RLKX3
	/tcS2/X/u9kq4wyUR2SHGDuSO7sDv5mBhQWWNu8gr35gaARybhUGBLutTj99HnyePGwT/EF/kJ6
	eu0HY3Lzo6pjnk8k9iUbP57AxAMjBmKFp6hZ7KMEuXvZ05QPmNrHfh4T5Lot1tkyHMspCJwf+zx
	N1LQ==
X-Gm-Gg: AR+sD11nsB+Q6DiEMZZRe5utbORn2cShVre/rLQjOyrA0ggG9YO5uIg7KLaiA6t4pHM
	c2i65V50dstt3x8Qtpbh4O1nb3fTXcW+ESezi1+w5R9hWw3NmBbNW4heRojEe26SondWhuzlJQ2
	dA5SYozhcQAdsH37uguHL2bAjdr0ba2zuXmWWiijMnN26y67/ddqv0KgEEcKtMECjU2/7NEPPNe
	6rbeH9FP8EUK9Q0EGBYvmf3/no0eNXP0XYjaa1CJ6rbb6YIFJOkPAaA3DnIVmcb3/5ixt90VRN4
	9MgmoEiWRdOJ1rTTH/fcRcXA05emJCdnq7dbOsdglpMOviXDi4LfKtiY1lPWRZcZcmsce8aaQ8X
	rS3N4Zk9Bd0n9ho4qQQ0waTYe
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52e42446072mr39442221cf.5.1787739916929;
        Wed, 26 Aug 2026 03:25:16 -0700 (PDT)
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52e42446072mr39441781cf.5.1787739916424;
        Wed, 26 Aug 2026 03:25:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b5e5esm3137249a12.4.2026.08.26.03.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:25:15 -0700 (PDT)
Message-ID: <c61f297e-3a42-4b23-b341-0f8d97d4b78f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Frank.Li@nxp.com, andersson@kernel.org, bryan.odonoghue@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
        imx@lists.linux.dev, kernel@pengutronix.de, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, rosh@debian.org, s.hauer@pengutronix.de
References: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
 <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ebf0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=RF00TdSWAAAA:8 a=CXY4OXtTAAAA:8 a=EUspDBNiAAAA:8 a=TEp5gEa_GWzzUIBBXKoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=-bjYFdKVujGyJWVmPOR4:22
X-Proofpoint-GUID: CCdiLZyMcegSVixU-F-arAt1eGB33V7I
X-Proofpoint-ORIG-GUID: CCdiLZyMcegSVixU-F-arAt1eGB33V7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX5raGlyQzRjcB
 1j3dagFJQYQfQArpNrdPhXpwqlfTei4b3RWo27MGu/x6fN+aP2QhnhMygc7Hm1B2IKEMvnEFb2X
 TIttzJMdg/5mg4Go2tqlfq5Zdn61nuBm/e5WJJjPfUo09t3zzdctinbq6LUURQaYDGXX8YWWGay
 +iHThJQ0suFPBCb3Qs3XDP5PhPAVzMXyigFiN1HRt4hyBTvElYsEITPB4u/+EUSBSdzqFQktGYr
 o0C++hdn7QakBlnOoV4s9U69wntOEBgow/AzVp+ukl0VaGjGai5TrFpE5e8hJOkabXUqQTWBTcF
 T4HGqH1pJjgt+i0Gqi+6ru5c5zTiMfSGl5gAW47lfrLpfMarZpo7WpyGc7kdorn+X6LY4oWXy/X
 ewN5g2K1BaPXiLOXM8d4Q1gfNKCYfhJajR0/BLwKrpC1voDgX+dLzs0/xq3DgbZz6LzX85uXWmY
 V/sDTJFne3Ve2KuFS8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX9FqfQz+z61DS
 JxBMd9WTTEV6HqnmZl5+Tcbwh7QF2DJ7xfjG4LAOYxa9/eT7iRV3GlyQCp5Wg1g+y7e3ZOg8i8j
 sK5UUQD+sGJHZu41W839JR7wmykAyFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_032518_773976_B81F0BFC 
X-CRM114-Status: GOOD (  17.54  )
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

On 8/25/26 1:13 PM, Hongyang Zhao wrote:
> Hi Konrad,
> 
> Thanks for the review.

[...]

>> No reset GPIOs?
> 
> Yes. The RubikPi camera connector does not route a dedicated sensor reset
> signal. It exposes PWR_EN and CAMERA_GPIO, but neither is connected
> directly to the IMX219 reset input when using the official Raspberry Pi
> Camera Module 2.
> 
> PWR_EN is connected to the module's ENABLE signal and controls the
> module-local power supplies. CAMERA_GPIO corresponds to a pin that is
> not connected on Camera Module 2. The IMX219 /PWDN signal remains local
> to the camera module and is tied to its 1.8 V rail.
> 
> Therefore, there is no board-controllable reset GPIO to describe for
> this camera configuration.
> 
>>
>> You should also have a reference to the mclk pin state to make sure
>> the correct pin function kicks in
> 
> The Camera Module 2 provides its own 24 MHz oscillator, which is
> connected to the IMX219 MCLK input on the module. RubikPi does not route
> a SoC CAM_MCLK signal to this connector. The fixed-clock node represents
> that module-local oscillator, so there is no corresponding TLMM MCLK
> pin state.
> 
> The Camera Module 2 schematic shows both connections:
> https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf
> 
> RUBIK Pi 3 schematic (CSI connector, page 13):
> https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

Got it, thanks for the explanation

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

