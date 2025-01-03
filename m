Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB4BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdbJ1dOWvgh+OgR4NwZE+j5YlKJamHg+xsDrOvj8Qik=; b=KHAX6N6h2Bol+xpPQcD3JLdzn5
	iFSWARpVOdKcnTSL43oWjkMu009CYoSP5SqrcX7uYjI+/YC6EH+T64jpbZu+uSNllfrOfvSaOzOzD
	/oSfTIDJRD6IcC8vnH4okse4dNZCekKHtioshWP/6TeLwAqllpkzh9fgvs2C+UmtiGCnIePi5Iopk
	2HxRDKSoPtF6lTEKwBjQKDokeB08C3lLNJ3iMFcFCIUOWshbb51brZt29QtrHoCV+0uvHl8QP3qrB
	eIe+CEVJghuKHN684IrDcaD+mAEwxZ6B3COH+6T1/2qdVgcE6QVaJbacsUnfprMSbxnBTTuUPi2qW
	ilj66umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgne-0000000CueM-20jL;
	Fri, 03 Jan 2025 12:29:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgmR-0000000CuXh-29g6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 12:27:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036YWO3010123
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jan 2025 12:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdbJ1dOWvgh+OgR4NwZE+j5YlKJamHg+xsDrOvj8Qik=; b=N3bKE+H/u8PRNQb7
	C88AV19SPgf8adrEUgxVI0CN4QPjJXgH2zwKEINlA6GrU/WpuFleQyD+YMHgKGEt
	kBkuXz36JyDyvscC2WeVjZ5TJIfqerz5v4EifdhermbvhdJE6N0mSbmrvyUBcfmc
	OPu2dAb6vtAprnjO5aiE93jtBNdNHoVz/9vUrZsYkLZQ5s805ezeU71fBUCKsPmA
	+lfTsurWNJshXatDRTAkex16q0Odj+V2j7Nb9vU3G7VXYZkYqV2HwhY9/fyHukq2
	FCAGWqNwt+b+tSAo3cNEvLuP5CaKRxkwI9LP4aEB+mpxsBAfQ/sihfFTOOe/Iw/U
	azGUlg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xardgr6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 12:27:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6ee03d7d9so83230285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 04:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907273; x=1736512073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdbJ1dOWvgh+OgR4NwZE+j5YlKJamHg+xsDrOvj8Qik=;
        b=CSQjMoliacD1NV1LvaWB/zyFT7QLdcqLcGoo7I//B9c3HfqpROgpe9A4qhone5vASG
         vcFtiEF58baoWxry53m8mmRMEsmMcitSIKorRwv1EzMV8t+2DMWFSHEx1ZJB7sVbZjeK
         6A1ITkae35O+giqQnPEtIDm2MeqRNr94r/NYPtMj4reQJpqZeNaDZYQdhcauklA1pBuA
         ZiVboVpNwF+9p1zkyVP4fqyQOkQOh0kkhyw1LdWihK8oa7cnzK12EQsjuvtq0M8me1jg
         oVwniAgoP2F1TNapLrg9IE89SpmxcT63BM+sSFgfH3pPv3iceuB0E6mbYOJxsBJeLK5M
         PAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV3xm1kg7Mjji2VxA6AS6uQX1LDBMC+IT7dAoa2vJSE6oRkllMSxJh2I2/QazzyQjeSCtrHVWDF0z5ETFouCg/@lists.infradead.org
X-Gm-Message-State: AOJu0YzYh50PzMBbJJQJBprkb3AIc/G6bYRYgvSWFeXh6KfpMvz0dtAP
	WS+JlNxRzsmft02lEMs97RYz/vmOjpnVjUEsyRkCt6tdcTUkDMS1I9or6P81zNKcy5/PkM0273R
	CuqhlVkR5jZdvS0YSy/B26NJNJQ9x+qiNMw2oH5Q4DLxehsfPxRXVHBQKQ1lqnblgvYX6+az2kw
	==
X-Gm-Gg: ASbGncu/cSdWjDT0LDJQerTel5/sm1V20qbpjeyORAUKukdp7fGxoBQcp4RQDavn1r+
	VVYVIUZY97v4yFHuFOKy6amyD4kbWqIfxIpWGh/s4lHYxu3uBi0hP8ahn6GAPUX2SZlwcVH3KZP
	045lLIMTckzLfQ17giAYWD767gBC+6Nrn3OYG08vMe3U2FLUuM9qOrN1VvhSIuFZZeYKDY0xytj
	1mJiHRLFWA1TyfoLEeD4PZmNtkcUjf5lQVgaw/rCVXXP26ph33TqejIkP23NStZUzxScR+GTFl2
	8qh3O+G5Q4UT2Yh6aFnf2hV/JBtlur4Q1b8=
X-Received: by 2002:a05:6214:4007:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6dd23317478mr274820766d6.3.1735907273052;
        Fri, 03 Jan 2025 04:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH15Wpx7u9V/hOQ08GkSp0Y5O0301pekMRgSHOKCQeCdUs50MNnQM9AG6NcnIA0Lbk63M/OqQ==
X-Received: by 2002:a05:6214:4007:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6dd23317478mr274820606d6.3.1735907272677;
        Fri, 03 Jan 2025 04:27:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e898689sm1875427466b.78.2025.01.03.04.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:27:52 -0800 (PST)
Message-ID: <c94ce3c4-5b8f-4d7c-8acd-afab63306018@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:27:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
 <20250103-qcom_ipq_cmnpll-v8-4-c89fb4d4849d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-4-c89fb4d4849d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BLKFTjA07-8JZOs5veJfo5t5-uZ94_Y7
X-Proofpoint-ORIG-GUID: BLKFTjA07-8JZOs5veJfo5t5-uZ94_Y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_042755_565397_3C04CB20 
X-CRM114-Status: GOOD (  14.81  )
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

On 3.01.2025 8:31 AM, Luo Jie wrote:
> The CMN PLL clock controller allows selection of an input clock rate
> from a defined set of input clock rates. It in-turn supplies fixed
> rate output clocks to the hardware blocks that provide the ethernet
> functions such as PPE (Packet Process Engine) and connected switch or
> PHY, and to GCC.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL through
> the internal WiFi block.
> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
> 
> The reference input clock from WiFi to CMN PLL is fully controlled by
> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
> Based on this frequency, the divider in the internal Wi-Fi block is
> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
> ensure output clock to CMN PLL is 48 MHZ.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

