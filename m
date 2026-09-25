Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B27C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=; b=IaCyuzjGCfOLdEuw9TQLOYECdK
	chnpYXx7HPttXPL9adevn7UUijdvuZyXkkjYqn4tS0BzxlFSnF6w8BCX3SIBapO6ZAmENcK4lZxn3
	VZS5yg3A9jpvmTpdbwgRYCABIrtPTHV+80pUAIeCxz0Gd97WgTEdApzXYF3hOSUUgfkuPDACTK4ZX
	Ud7rP2Ked2O2DPhomOfZXYw4zq6cktSUKNdXa6eL1ZcCqqASOHix1niqCXWDYU9mfgJdXtJA7fS2k
	5L44G/gT3A01EPw9mZ1FSrTdrJiJFSVk+S4tpOfzr1MaHKgLA82uDqCDiXFR1GBrXXAioJ3MrX+1i
	T31N1F+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0m3-0000000Cs17-0GfS;
	Fri, 25 Sep 2026 07:55:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0lx-0000000Cs02-47FR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:55:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ye3r1193864
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=; b=QkuJ28OMMeOdpYrD
	JM2gcZ8DGgCBQdnLREK7uzV/jrc5h2uVQQZsijPPCgflB+AZ3+DFTVvK6cL041uD
	/ga4ysFrrcqp+fiblFYVK8S0s4BwULcfufxcwAFIh3kQE0ofEQ9N6A28amUyoxnE
	2NWrQWBOi2QfQgb5eYZiRuvkjSWaz/aC00YtMWea4/lYEehwFLwbyPkiO/WKwF5J
	KT3oT10fHFZyP6uRci33d0np8/OaafwW8L/A/lntgXpkWhaNfBmN6c7vsSeiR2F2
	wGrDtSgMVce4OLemb4Wz2i9+YEhb1Dgg7YfXcNtc0eNgQ/6Oah74reXVE4A35mxl
	Uz8P+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jjfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:55:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so14252371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322907; x=1790927707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=;
        b=SBw586YszIEzi47MTg5HEWe2pnxFkgNugVIhJFOmfA2yn0LhjGrjckvE51IuwmAyrF
         m7AAAZYYlRC82u8xh+cnL8Ff0UlvJqI6vDIcTAbdKJXgjE1RFxkxVXbuL2ZkaC8zrNAX
         sFm6G3Xl53dxXKo5GKXN9tQ/MauEYaUyiZUUrxMWmYEXrTqiXJyYUorX2eQTMK5eFukz
         PPbuSEBAP7zBDiwTDnsN52d3JQnOXGk3XI3bxL6EMdGEmXnzQJZDzNStaQNSpNRaLjbH
         xFfsGAC1lRo4vvwPhggbqcENsAP85NAVPRtWc4i0635BFrhVdvK8JcxEkynAXBf/lVwe
         rLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322907; x=1790927707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=;
        b=gCYOXyCy2coqKt+LCRKOdEM9QkCquuKc3r9/lvGa9rSCYoksafJqASvOFmFJrnsMNY
         9v53w32BvPk0SSOP8YCzAlTOruBak2TeS3XvFi3aFikRkEywnklh/O00ioOIPfZ7EQM0
         lz4arKCdtYWgHZju33zeKQ0pPPnO5cWAF1uQ5zmnMsW2U3qbfThNr/zV8SVDKB0e5ztZ
         gIhtgSZU4qLdOsDQKduH8YB8a9ibPQISgCCw7Qv0iieKzksa+FRzLfjH+pvAheVakeUD
         jkRiwfUCcuhtn7FDR3vWlFHCn+i3BbIediAI19JnkaKb0RKjms2870YD5Esw4B9p++mf
         Jf3g==
X-Forwarded-Encrypted: i=1; AKwUvBzT9+tnbKV7LTL1zk+wWOcfezNF9Hi8LNVdF8JIDE6qGfZCxirwKTCZ/XD45X5LoWkM1m6OKpJ45DiT4Wj9P78i@lists.infradead.org
X-Gm-Message-State: AFuF++mSRkpek/Yxe4GXrGjD/hHixVevBcM8TYxk2rUTPSWLB0Q2zRdr
	ThAZ1vQCLCpLo99PQ5kN4zdiCX2V4ORv/owzfiq13MxAV1x7CschvOCcJ3d2wPgua8If4NZWl5u
	gJ10yhmW5eIsF3uj+pxKhHac77UlLKskfXn6r99FNypLjWW7BAEeWEIr/hBbMEImpvtZr/sXKS6
	SSfg==
X-Gm-Gg: AYBFou0G71EDMIG5oLohsaA4aAkHfYhVURoW1JMK/ZWPZKytl576J9KscSSRQaATE4/
	hOd36Bo2E94h0WYzUVge5JyDzFq7SItH+/SuG1iUndD1cy5lB+y8Gi1Z/JWm3QHHT3l6ngDgSs5
	uhWetTYRfqG761Ru4Q+nALDcWaRd+ug27ZRUCiW3YgK03hFakzl1ppkYcwIL9G50rgS5btguOX3
	Hi8KeuBHjjFVbvZ7RZd4MfXH8l5o3j6bAH/JmFcblo52irvyqRIJE7HZK+FY9oeFEOzxKjjNtg9
	MxwFzaZECVE3JW4nVWc3iDR3MVeCwnoQyOtjJ4zUkzc3RzDuqlqx/2yRzr9fjdaXxg2BzBd8q4y
	hxCWt6e9GZohXAE7jnE7D7tikOg==
X-Received: by 2002:a05:622a:1a8c:b0:530:b2e4:d59f with SMTP id d75a77b69052e-5330b6ebb60mr28415691cf.58.1790322907475;
        Fri, 25 Sep 2026 00:55:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:530:b2e4:d59f with SMTP id d75a77b69052e-5330b6ebb60mr28415281cf.58.1790322906928;
        Fri, 25 Sep 2026 00:55:06 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm196689075e9.14.2026.09.25.00.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:55:06 -0700 (PDT)
Message-ID: <32b16fac-2c4d-442f-9174-da16e82944f9@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S1Bb2VBGeud-BW9YlTYeDepuKa0sJ7Z6
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab628dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=8N9GC05w9tLPy7rIr4cA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX2jP1Pka1b1lw
 3UwTbGG08V7Z+bXrn546HPZdGikrOQ/npTUTmOZGZ9txd9+gCh2PTQp9ZqecK4xnXWnA48uEfw/
 EGR33Mb9QdhRo9662T4750hAflJM1lr1TH1iCnzULZ55M4abwIWeHai906od2ZrmAFRXAUde3Q7
 AnrRhQm+WLQVkbAjP5VXoKvr8GoXZ+fu4bFERMXkgjvse2b3w0Kk1gR9pMo8HpV7ta9aLJuwXs8
 n+z7IYGDMHbR2MDLaqYk9PIE1y5xdrHlg9HvPWWzBQQCLW0tfhj32KgWAdpG7/T1B1V/h5doEFr
 +4giEjLLfMMo5GGQCFY+r7xZq6nVtlheaFpbj7/DfdCWeTNGSJ7+KRWTJF02TWz0DeyT3cHzILP
 V11AuIRgx59VsY3gty1ulbWnYSy6wKxvKQzPdThQWSmXNBLpgwhRnE7suK8U8G0tBGGMnznegZA
 A0vnP+NJ2kiHMq9yYcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX9A4xao7vno+3
 HEu/2tydkro97EnAvzc9ctOO+hD4bhJF+lTLK3dLrObcPUddkHtMr4Ors/tA7648P9K3ygZfjmD
 IBw4KF/VPcsZ7ZqnnbeJBg14ihyUusE=
X-Proofpoint-GUID: S1Bb2VBGeud-BW9YlTYeDepuKa0sJ7Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1011 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_005510_033908_43BE306B 
X-CRM114-Status: GOOD (  17.19  )
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



On 9/25/26 8:51 AM, Loic Poulain wrote:
> Enable drivers for the EMC2305 fan controller and PCA963x LED
> controller present on the Arduino Ventuno Q board.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> To: Rob Herring <robh@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Srinivas Kandagatla <srini@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..012bd0cb1bf6cb130c92012748a90ebe76534854 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -769,6 +769,7 @@ CONFIG_SENSORS_PWM_FAN=m
>  CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>  CONFIG_SENSORS_SL28CPLD=m
>  CONFIG_SENSORS_SHT4x=m
> +CONFIG_SENSORS_EMC2305=m
>  CONFIG_SENSORS_AMC6821=m
>  CONFIG_SENSORS_INA2XX=m
>  CONFIG_SENSORS_INA3221=m
> @@ -1323,6 +1324,7 @@ CONFIG_LEDS_CLASS_MULTICOLOR=m
>  CONFIG_LEDS_LM3692X=m
>  CONFIG_LEDS_PCA9532=m
>  CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PCA963X=m
>  CONFIG_LEDS_PWM=y
>  CONFIG_LEDS_SYSCON=y
>  CONFIG_LEDS_QCOM_FLASH=m
> 
> ---
> base-commit: b9bb4134a9583a388704433eef22c82c49963585
> change-id: 20260924-config-ventuno-398c8e9ca9c8
> 
> Best regards,


