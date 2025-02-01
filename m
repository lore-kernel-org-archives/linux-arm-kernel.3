Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F1FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n2dQUsAQR8BGbcIRrC/eRUMfmfG1kg18Uqsc42/YA4=; b=dV77TrpIQKcHY0JX6jldZPOQct
	fx9442nsu6cZrkhXGUWJJG2vEfLtOveFbUsb1b0pOxwLq4pNagNsnkH/et+136md7MNa9of0VsRai
	gxUhJGGgp2jYYaYL7tJXq1tltzdnWw09l/OWwimCH2Ead+0uke9xf1AWzWbN6rsjFrRuIuICf63pk
	lReYt3IkNUkTZtUaSkq093/H52GZ7y9T/hKQHVvpzZl0AaqvG+XqiaFzZ5RrpN57dV8PlgaGhMHsq
	3YYTRvoVb9rbrU7uBPtGOnBv8IUNZ0E7pNniONRw0CZXoDaRbcbZxVPxZGBca/nfx+039E6DY4el9
	z3zB0uEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teFkp-0000000Cp6R-3Qom;
	Sat, 01 Feb 2025 15:49:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teFjV-0000000Cp1e-0JgI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 15:48:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5115xrnp002238
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Feb 2025 15:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8n2dQUsAQR8BGbcIRrC/eRUMfmfG1kg18Uqsc42/YA4=; b=Bt428S+3uxH+vEzk
	tnDluDLTVPQSs6ciBolYDkA7uHbbln9oqYOG57YImHkpp5ZMl0letkUDsP/aA7q1
	+4zexevqo/jQRGjiTXd/TwV2XHBkO6VQAYP66XLS+JbTc7QJEvjsHI/fqRuLT5ko
	5SoZO4pbhbCOpqjWnSZ6u7VcxE0jfnGnQbSwntG+h81k4saZ3Gzi1VYMbjw37+uC
	W9KapccKfQZ+KguK95pnyNCX2DgSq50Fa+z2a5yPt5QK4FvsfuL1S42I8YDKj3cp
	8ziqcu38WFZf5AZjyljX+qjL5ndVD6BqWaZF1SGTL41eVf6tAQSbl1NdarzHlQf3
	c3ri6w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6a92ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 15:48:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d881a3e466so7812426d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 07:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738424909; x=1739029709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8n2dQUsAQR8BGbcIRrC/eRUMfmfG1kg18Uqsc42/YA4=;
        b=lLA4/j8XVxxB2NIqWjuOG3n2Lf+jlBA6juiXLLZa5JplsZTZx6xnEvJj7WD1mRxB/a
         kXRdLXmeC5g5EQrbahS9Z9h0aj+ucDNf/PaegDmZ2BrOXD/byJCp62+3Qaa2gfDhEPSM
         nQVjlQ4WCzezQ2MeydOvVfVyOwMZQiX3zRvvpqIbZTbeuyKz5JM/6BsuC2bcyPZGW3tP
         zzhzK5rqAd/um+PW7KRf/uR+bjj28kNIxOv4Ip0YNrierlvXDT24HecEh4WvngNzXp7O
         lhmZn5/CE41aCe7VC3w1Gn682I+5xFFR6E9d9380AMnAp/FSN0BTXDd3o84sks+z1O1A
         ThOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6SHNcESHpifdVa/xxHT5MfMqiTmaFrAUNiagaN2FTF1cKmAgIwqs51W2ixeIMAMdJ39vZNueZ2grHc3FMTbCe@lists.infradead.org
X-Gm-Message-State: AOJu0Yxia3LiryryX/LMLUyc0St1OYAMZPiPVZW49zCXIuaycWAaarFs
	1an/ccp2Dv3uShbyZTTjfzLUhsV1tsJqgJK1T6p4r0PG8beMgPfCf+UG5exIjnlS7VNC8GOAbr5
	bNnIF0xWfEpzo5VSkN1cBBC0dW69E//M5q6VWMxEyt24h2lNaJAjCi40C2F19yqtmnZVF4GeeMA
	==
X-Gm-Gg: ASbGncv/MMs9Sf1hdOEnwgSFYLcQmBdiaAEymOqXJzKN9N7gS+4ri5r+lv5lD5uWMQq
	DhV82y40cDRrA3UuknIYyb+di+O8lYvIQfCAhvK1HC/qSWhH1pJ5gvxzuSHyPEA4uC+djRo9k5r
	TKI139JTzvCnoRZYrqnw5ZH+XG4glEA4o5pEn0b052DaNqFtuO8ZM6kNyVVnwN8pqSSPZeF5cTz
	/zlrWwwsroqUF41SBjfBhPm85Ntaq3k3h7j6aqDPguVRzhG24KcE8MZna7QtKgJUiy2MyvcCdTA
	/qET8xaVyL/KrgVr35PQK+ThbLq6p6LvIpoJT/9KH+gPh2qmPdSXnviJ9hQ=
X-Received: by 2002:a05:620a:44ce:b0:7be:5020:6df1 with SMTP id af79cd13be357-7c009b93599mr574152185a.15.1738424909352;
        Sat, 01 Feb 2025 07:48:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxPpR9kTBzdbY+SmZntvSpbA0AmhKdf4LITbXaMdP95XvejXet1vO1PHrcj+dARpvQVLwZIw==
X-Received: by 2002:a05:620a:44ce:b0:7be:5020:6df1 with SMTP id af79cd13be357-7c009b93599mr574149185a.15.1738424908921;
        Sat, 01 Feb 2025 07:48:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff269sm453716666b.118.2025.02.01.07.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:48:28 -0800 (PST)
Message-ID: <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add ethernet node
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4h9dPYNOX--72s2csVWklF7bVON_KAUL
X-Proofpoint-GUID: 4h9dPYNOX--72s2csVWklF7bVON_KAUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=721 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_074833_234838_46F7308B 
X-CRM114-Status: GOOD (  11.04  )
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

On 21.01.2025 8:54 AM, Yijie Yang wrote:
> Add an ethernet controller node for QCS615 SoC to enable ethernet
> functionality.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

