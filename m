Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06509CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l03jg7XbVLsjzyUA/wauJ2yxOhp32HR/FKDFzMmGCMQ=; b=VcWyoYcStIS0UYwVW1mwgMoyQW
	J4UDQMZo3Qe/ettyMGucA/G3FXYei7ap3NUoKRXKeA9+8/yktvEDUrE9lgftVcGARHHSKdtN9YxSt
	Kn7bHEHIZSgUDFLFQg5E0J6WqG8y5ExsP/COmHluAM/HjjB0qtvd5I0tlPhp/ZN4iOIrv64Y49uH9
	pcLxh0G8TUi/JTlZPjM1r7TFjVupxzaK+LntFp44fpjqf5PZ13aTiGhrQm7u436bVYabuRheuGKFb
	whUpFcxJsusw8HJRqX2aa0jj27dLoV4ZQ9TbyBQtux8upxmR1nR0E8zCeoL12XvMWe7tcf/MkIjSi
	q0rBL8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzqw-00000008Ajg-01cY;
	Fri, 12 Sep 2025 09:13:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzqt-00000008Ai0-0s3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:13:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7eH2R002355
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l03jg7XbVLsjzyUA/wauJ2yxOhp32HR/FKDFzMmGCMQ=; b=dyh4kkX10GImy1g6
	qT///8wU68rLVT4rOhh37myDhMV0hftZLPbqNVX6jVm/STd0UKQzgqM6XnxzyahL
	dKFfjZ8KUSyV7ksNl1tA43kyxAV+NVB+gXC3RgsGtynm9i/7FX1Y7FFjx7sOuBEL
	KQ6OkwtUL9cBmFqEVgmiqDLEvIDP497JHCkeS9r9ljkwyYvm7wqTdu8u82kabmFd
	DEBCqOLnulI1grv0eP1D98lo5rxDXRnIhsB9FVgXf21THLJudu9j6sUJUGAfY/XW
	NOJn0jBiwYlJfeY+/wpd5n23tb2qxgBdPo9uanhHLe3z1yOtkNsjU2wbMIqVr2g4
	T3v12A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8u0xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:13:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726ac3f253dso6095026d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668433; x=1758273233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l03jg7XbVLsjzyUA/wauJ2yxOhp32HR/FKDFzMmGCMQ=;
        b=Sl5xPdv4Z+H7asdIpalrWfddMUYyLrMZJ91VHzBnWOUfeJwjuIc0oUW14Oq7m45Wt4
         ofZI/EeeFaEyOt6XJ2uGjiBvRG+p5yD/LBNM6DOTs5H0HwWBM9PKHfUvVUvj/tOlLfnz
         f8D0CQ/xABi0sKxfZJLlc6k2XFJen5q+ftWKrly/DHBlQEsksJhq6LxxUM8vlHOr8Q5T
         hx3TPp6n96+QzVV/Rcj8h09GFeNBl+7OSfk+VYukzefOfCYNLBLCpPybfpYMheiWmiTh
         3TK3AHXP4ZAZR6ikbKKFEw+CTaHUcfig3Z1DsW7JEYzmiALAccmFYHJq/wGGw7seC4sc
         boZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6jOff6IZg9OwK9p5Al731BACXUaK7ORsbASR6bbBa/2ilvJkJsIng3EkTJDGD8ltlSe6GLg1MxAs55HlMqaGo@lists.infradead.org
X-Gm-Message-State: AOJu0YwvemqaiDdOpX/OFCKGrAs6GCPdtlf+TsL1yoXpwHB43cxYtiyF
	iJvptZEXWhm9t/lTNLoA1ni9AIyHs2shW7tQeqyqR8ap0adGPPE+YMlbNnWiOiCCLjSAmQMFAdL
	uHOj92Aw5VkstawImZewT6FLg1T1lJiuT6Ehi/L3r3wTqYwamgnmoJaRcKOm5j/DbiVBRp3f91u
	TqLA==
X-Gm-Gg: ASbGnctgztOirF5ptQYSW2l6Jk65WMHEpe347kmYZu89XZGqDej2IZCBYXGD/ZY7U5K
	tB1pyCv8ZTCwYXqqPjIFBspCJZfN1pfb3J7e+NgWpmgkIESZXt0aLeJeAWe8DeQWacystV9oBBL
	ALE9H8Gyv5mYD6/tWuCHX03QuyA0YT94QQBK+I/CkMQ7pf1A/gGmFP92RxubIZbq++fccKcY7Xz
	8yHRGpBFJ47IGMt/vXwb2eyEf5N2OGVix7e5EpEX2s5FZ+tScoo/I61H/7Kx8/x8pDoY/3FGouO
	OkP6VUSmDBmdYTXWgI3LbkXZqblHPp6jOr7Im0DeDzQucBe8IkajTQmo1tUd8BuM0TIa3xgm9AF
	gZ5uvFpB3o3n7ke4Tsmp3YQ==
X-Received: by 2002:a05:622a:491:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b77d08479cmr19486171cf.13.1757668433191;
        Fri, 12 Sep 2025 02:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV8TvRgejfYIcKWS4JnF+RVS5QxXiaupLov7itJ0nYjCvvDQfhH2p7vyIIoxHj+cjEPYJlEw==
X-Received: by 2002:a05:622a:491:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b77d08479cmr19485701cf.13.1757668432570;
        Fri, 12 Sep 2025 02:13:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm332163866b.102.2025.09.12.02.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:13:52 -0700 (PDT)
Message-ID: <2951b362-c3c1-4608-8534-4d25b089f927@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 11:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
 <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
 <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
 <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX+tuvP+yDOaX3
 1ZIA32QGLEGyzNJCDie/h0iI+A+ES1MTyatvpy+718vI1bTmVrMlezfu0FjsEnMCj4mkxl5CW3o
 X7fkp0Kucr1laVb8DLYuf948oQqEwRrr7Ljy49TQFwq03ie04WYsuPB17uxZgzuE5NkZ+VA4Cp6
 NnoHNnlZHMinA8aIYn/hlSaRAMt0XpwdElwgNDZQ2D9sNAxomLkytGxJan+YWA9+iUTEM9/cX7V
 djHcttHeu+buD71UoX4H88dQnOLvTUWJ+CXu8UaVCiDfgCw8QMYSnQZp3rCQiaXeQ+hn/aRJNbu
 XCd3Qk/Ew1ZTeeMJXFHR9wfhqKgQ3x+lhd/cWbjgrjglW+CL7296Ps+Q0DjHXiORuryYbQ2laFR
 /4BQ7Zak
X-Proofpoint-ORIG-GUID: WUCqFLh0BryHqDcpft889bFrzKekHftp
X-Proofpoint-GUID: WUCqFLh0BryHqDcpft889bFrzKekHftp
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3e452 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vpsw6NEknGMoy4p6atIA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_021355_377058_26864442 
X-CRM114-Status: GOOD (  14.01  )
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

On 9/12/25 11:13 AM, Konrad Dybcio wrote:
> On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
>> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>>> The Networking Subsystem (NSS) clock controller acts as both a clock
>>> provider and an interconnect provider. The #interconnect-cells property
>>> is mandatory in the Device Tree Source (DTS) to ensure that client
>>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>>> the NSS ICC provider.
>>>
>>> Although this property is already present in the NSS CC node of the DTS
>>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>>> omitted from the list of required properties in the bindings documentation.
>>> Adding this as a required property is not expected to break the ABI for
>>> currently supported SoC.
>>>
>>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>>> binding requirements for interconnect providers.
>>
>> DT bindings do not require interconnect-cells, so that's not a correct
>> reason. Drop them from required properties.
> 
> "Mark #interconnect-cells as required to allow consuming the provided
> interconnect endpoints"?

"which are in turn necessary for the SoC to function"

Konrad

