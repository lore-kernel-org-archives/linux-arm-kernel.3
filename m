Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBCFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8P5uG6PJun8R28epOEw5Y3NzJYkBGc9o295jGAaImU=; b=1MXxWmSrGUT17qmDo+fpdKz1Sb
	LKGJ/4sET8MRsGBtkeosvETwdrts4lOgtCLydMz9Lgg2PspHEKlCZqOIlp79/V9C64+/fQ7iA4EQ9
	/QGPrEblyw3retWCuym5zu8Zu43hf/Vr1e/5ZF7BDqzy7f99VtfWSI4hJteme0Xi0irr2dv8EZa9T
	y+vU+wm651OEQTijyZB7aHzoVDXP0Pw9csvPz9WqaVtcIiedNkY3sdzNcUBKLcs/qZBRmUBOXInRQ
	XGlTunW5+vxJKSmuGVnUuVOlh72M1uE6UJpHxBkEwyQUdQIhjUVDR1UreKCtxDHWpw7dKHaGqjYH9
	X9mZSUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgp9-0000000Cupo-0VLZ;
	Fri, 03 Jan 2025 12:30:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTgnv-0000000CugR-3WLH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 12:29:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503C4gPD022737
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jan 2025 12:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8P5uG6PJun8R28epOEw5Y3NzJYkBGc9o295jGAaImU=; b=cxKKxmQgFR1yBhai
	rRpv8IdII+TYkdgoCRUDyn01N/i4cndolm08quge1CqXUASsHlrMxuBr7U3dJqVm
	YB9gaeNGlUlA1sYkKmDud6tZ9kNbTetV2a+h1gdujhU2fh21mzkHhHP/fv7aqX9Z
	i3JSQY7ZNlrqTRnHVIEbRmifAmntLBknVKFuGTaZM9iR3NPrdXDhK3JLGdivkF4u
	X74lW81Nui7Nmp3l6HI9y7Yly2vxDaWlInFzVusG4YUAEx28TrNKokpFcdxbbzcK
	rCmKForCrZ0Cyguv2JvM7BfxJQbXWsLXTFV2f9ZCIav8aXnozPDp+i7PFmIVLwMd
	/KpR0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfk3g1fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 12:29:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679d6f9587so34415581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 04:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907366; x=1736512166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8P5uG6PJun8R28epOEw5Y3NzJYkBGc9o295jGAaImU=;
        b=JVXD6gmA5j+KWxWS8ZyGNEf/tfdQXyQVLZhVa/h1NBsRxc4dhISDbuyq2a9vHfOIYm
         nPBSDjwmVk5WhvT+0/3BSRsQNWYt+qmvORsFrAzjAF02fiLPuzfqURfqxVpdIBJptjhZ
         nZmuj4pdmrb0ZK93bvGpXK3epOU5/ZOzM524j10NptovRSoygm7UguZC4nKc204L7kWp
         DbaBNq64ngCEvXpBkYwQoCuCAk5PR3rqM/ZQ6kNq6619IBIQi7QZbd1vUeTrJ99Uj7u2
         7yMlCQCWzZCbc/eArw9zW2cMH3Au747yL8bPwbfWk02Hi5kpp2ooVR0DNy6mC898dBIp
         3ipQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3MZDuWew7/sOd5mlbt1DmKYWxHt8k54doySk1Iz0QFnv9B2jFcCw8RTYS2iI0M+dqrvS4I/Sit+l5XsxlqYEF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg5rbaYkpCJ3O9bif/r5KxokLZ0fMlmCOiJoW+3l5yW1ta6Sg5
	E9OeqBNrL6OolScinSfvKJVKT4egAbgV+fH+Jkr0vvXwd6aNfjg32OqJgk6LP2RFgZ8Jj1tJ4Mt
	cRcQMzg8dDkwDVuoai9f71TheLct81Z/Cyyrb/FrsCMIyJgL1Oe7Uhpq+D/vJGxGdNdwQSsH0aw
	==
X-Gm-Gg: ASbGnctxAlzlhL87qbYw/7g3E3nhzrOrhtmcaMmiRTUpyz15i9c0NVd/4qAOey6Z+sh
	aosVaGwYnOkdgshxeYEs94ByappHv5xcND+NhB4BfBUm6O6MTkXpiOSz0NQ7Ludcf/E3IH8Ttkf
	8mD2gD347xWO60Y5luY0sj+MTrBK3AH8iG0cmc2BDP5tDBaHIWJEbVWL4g5i/kb8SrQURAbKq6J
	tMkE/w3lcLH4MYAUEnF94cChF98RH5+KEaOWjkQVZ6JHPoFvW84x8K0vmG5buvrIXm5/B4R6LuU
	as2Da2zRHCFPjPGPQtJi46n7PDtXi9WAb1c=
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr283345281cf.2.1735907365710;
        Fri, 03 Jan 2025 04:29:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBd+GaPxhspkqPCI+ugt43bRmXkPYvV99w0sa5IQCFi9Om8iHkk3NOJSw1+HKaMtuKdDJdUA==
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr283344581cf.2.1735907363816;
        Fri, 03 Jan 2025 04:29:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894b60sm1919353666b.68.2025.01.03.04.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:29:23 -0800 (PST)
Message-ID: <a40f05c1-6897-46e0-a9e6-8f898e97b5e1@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
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
 <20250103-qcom_ipq_cmnpll-v8-2-c89fb4d4849d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-2-c89fb4d4849d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LsFJU5zKMnPHam9bPpVs3a5gRQoC3hLb
X-Proofpoint-ORIG-GUID: LsFJU5zKMnPHam9bPpVs3a5gRQoC3hLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_042927_998716_FDE43C6D 
X-CRM114-Status: GOOD (  15.72  )
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
> The CMN PLL clock controller supplies clocks to the hardware
> blocks that together make up the Ethernet function on Qualcomm
> IPQ SoCs and to GCC. The driver is initially supported for
> IPQ9574 SoC.
> 
> The CMN PLL clock controller expects a reference input clock
> from the on-board Wi-Fi block acting as clock source. The input
> reference clock needs to be configured to one of the supported
> clock rates.
> 
> The controller supplies a number of fixed-rate output clocks.
> For the IPQ9574, there is one output clock of 353 MHZ to PPE
> (Packet Process Engine) hardware block, three 50 MHZ output
> clocks and an additional 25 MHZ output clock supplied to the
> connected Ethernet devices. The PLL also supplies a 24 MHZ
> clock as XO and a 32 KHZ sleep clock to GCC, and one 31.25
> MHZ clock to PCS.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

