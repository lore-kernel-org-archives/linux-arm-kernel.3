Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389E4CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=; b=B5Z6sZnKziwbqZiwucFYJ+mu8R
	pjcxDNAomk2ta2de686fI4zCwl8mc8KSurS5wMULTOS3/ofmVRR8XXSjP843e42n60I5DHg/HWZ3Z
	x1b8K3eG1zVSD+b2g1/23PeOczqAJXf/GRfXap4Liw5nMRrjKfXf8h1gZXaVGAO208ngfjCl7UNtT
	W3Tm1qaMIMZ1eYcfWek3q8XRreMxJ5i0BGf8TsTejJia2zKPXm1g9HTyAisAOsF0oe5nY6046He9L
	0alDEEKSlfNkJsHjTGwX6jSlgYUS4yfEoL4Ha8lILBTutOxXEjQicBeIph+ZjzLzX9GJwT3k6sIHt
	Eu4ZU6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyUV-0000000G58l-1RVu;
	Mon, 17 Nov 2025 12:37:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyUS-0000000G562-2rFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAprPr3920983
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=; b=CYPf9e42rZzlJawP
	Qp3kqvy3qfQCc+Y52D4WM/zhh09glkeF391ACL2AWapNefwrEKk7UoMK+kJoMbbH
	0LvIIzRmE/gRC7zjE6MaZXehjtZoGiHfMcsUR0glCU+a5P4KnaDgl8yCqpKrxgSG
	TnVr//U6O9hqW1UDSci5nuEjSUrwDkuCNm3/UQZB5UUUGOFt5QN2RjqbYnka90SB
	qh9XDSGra90dJgFwkqwfaoHwPgJY8eKYrg6/vIsxrAiQh2q/XegShtb5qvLngh8k
	b/pk47dF2H0Wc3Y6fv7ssio96UPIw5bt8zEPPhhDBlE1846Q7bYSyj+mdRbH9zae
	vPKI/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay89m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 12:37:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee24e1559aso484051cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 04:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383071; x=1763987871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=;
        b=SwrMMe5O5pWQMRw2cpLHgIcO7UqYE/9HYU6ZhLWTy0ChH/0OtYZ5E1nPz1TSJyIfd8
         SZN+wiaAIVAxxwS84llsN8RDLFeqIo1B71kBLho/ZC4RhxuhvmVmTqR9rGoL7a8mHc0N
         B/3Ng+QBX2X8fGkW3n9TiggNAqULwyUAZW3IEBbSi4LZN5vTAG+jptsYaiW89ZisFblx
         cHbmDX8JGHRly21YugRdy7WrKNruA8VObctmAo0iC49eOAeZEHHv5YjpQWCnHIbI9oOh
         hzpe+rx/RN9EQpgy+/DJGCXSC1fikl4CuvyFd8axB9XWgxgvRTmtq2NVU9SvNe3XxZDt
         G1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383071; x=1763987871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJWzE6wvjXG1AV+aIp3wOyeFKxb3rhX/85KvL6y03Cc=;
        b=k4V6uPLZ/a6ZlGiOWnVKlMaPXW3O+pYEzFZXcpaLxIL1bhrYaj21xwRB0YhLjql+8/
         NfjqYK4GVEiiwCpaqpgfU2MUKnkKLP5nPVV9CDBhx3HnoUzhfbTEm5tMqaWQyJad7UUl
         Gc0bcCLHr9PvxDEz4nQtl1WprrRXIpGi1HT5eYkUmsvhkVZzI7dPfModun54kkr3IkrI
         1GQgrxuckl5IAcDPhbBOpthLfHgz7+iVa5IFAqpUCwRtyS/+0fBpXyFW4bWZXl13Agzo
         3MBcvauZH6grOIoprczLYdP/lMh6M6d4Xn12xwlgXVaqf0RtAs94a6r2oKTE8Jht/0wv
         gCjA==
X-Gm-Message-State: AOJu0Ywpg6/m4737n4srihNh1F7EdIxBL3BLQPlscHqACnwj90M6Z9c8
	OK6XOV4PLJTF1FB/+6+rhBYj1zrFxXoEu5auHdmEoKU13R5rltDwwp7mJRJtjdyipCDXxV3tLCf
	iX78hEEOBL7aKDE+kZKK3i4ike12vRffnWi4MqAxwySyQ9Ilyj6GMgjyNuTGYxFWFFT/hPZUghj
	eQuw==
X-Gm-Gg: ASbGnctCzFoPOMXzhqLCKmZl3bOAizEZoHqrgBqxaaMZgS6J1d0nofkQ9T96S8Dwi+0
	wtP7H2JIvBek4y00yFpaQTlKiYZw6pqLc30F7e2JkM7tPJKOqC8b/73wP3uxS1xzvYIXRtSLCWI
	iTN589O5DhpIPBQ26IOZ/U+LnDfRkJFM1C/bsmzhcRR3gvRCR6XbYugocOhJk5/Q6zN+G9DrEcs
	JIfZfFxgOtUWwBmha1fDD+lVHRudu6o1gZjWv1m6Yt9wZhr8gWiy8hn6nTV3kU/BaoxEHc2FhJi
	asrUYEx+5VCQIoumQX45W/Leg2sp0vaZdhLYVc+6WkhBwdrd8mMWDPxRLCF4PRsF8SUzEPhOXA3
	9Yg2KisogbNs4zWnZFkhhqBY8AEseRkv0IGla1qbU3SnpZGogBKaPYeH9
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31605101cf.0.1763383070633;
        Mon, 17 Nov 2025 04:37:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwighRspdkvDuEfxmwg2BdMrC4mdWFT0VtYsAmtd8r1HDT/ZXvRXlEbF7IXcyxlyFAchnefQ==
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31604651cf.0.1763383069999;
        Mon, 17 Nov 2025 04:37:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80cb6sm1076756166b.7.2025.11.17.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:37:48 -0800 (PST)
Message-ID: <4b73f64a-1e28-4f25-80d2-3d59575b9da2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-4-quic_vikramsa@quicinc.com>
 <a5ae933d-c5d1-4094-b4a1-de52060e0786@oss.qualcomm.com>
 <22350774-20da-42ff-a6c2-02fab121f4b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22350774-20da-42ff-a6c2-02fab121f4b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b171f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7e9gifwXs9hXINWudeUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: c7itxZqBlaRwF0pKKMCSAgLrmMyWT8c-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNyBTYWx0ZWRfXyfJQU4vZ+swG
 TiPylwzjD/eQjx929X9sPqdTjtN0bC74Lam8vyeRe0Ti/zPWFEN49BveEuH/pFoMcxKqa2yseNQ
 nQYyrD7h2UqEJjLXZA5Pi39HgG1hfC8l7x1jYzM8Sh+ZMr48IjCNTEVr3IfjyqYBu47zNLpR5FS
 y9cDyIjGOgbc2Cib6Kii8aR5zVNpgNx6CU8Il6/1PU5qDoE4oZMlzbyD+YsgenpmRYH3y6kDl5V
 s9mMSMZZ6VmRhyZ89pO7IiZkQUCk9xaBdeiCHKsnpSFXb8IauYoiSITWiyjenS8A74HjcbkeiAS
 WtH47ZwD+y+6D9GqQ1H5XoyHwuyXBSG85YoFETjJgbgoxh9NF3Oz7mUngmEfzLbRxknhipF3rQE
 BhBW4E/kOMVxpzGYgaR4GGXiLHTptQ==
X-Proofpoint-ORIG-GUID: c7itxZqBlaRwF0pKKMCSAgLrmMyWT8c-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043752_835680_51C174DB 
X-CRM114-Status: GOOD (  22.18  )
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

On 11/15/25 6:53 AM, Nihal Kumar Gupta wrote:
> 
> 
> On 15-11-2025 03:49, Konrad Dybcio wrote:
>>> +&{/} {
>>> +	vreg_cam1_2p8: vreg-cam1-2p8 {
>> Where does this regulator lie physically? Is its presence dependent
>> on the connection of the sensor, is it part of the EVK carrier board,
>> or perhaps something else?
> vreg_cam1_2p8 is a fixed 2.8 V regulator located on the EVK carrier board. 
> It supplies the camera sensor’s AVDD rail and is enabled via GPIO 74, which is controlled by the TLMM block. 

Please keep this definition in the EVK board then. It would let one
reuse it for another consumer

> 
>>
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vreg_cam1_2p8";
>>> +		startup-delay-us = <10000>;
>>> +		enable-active-high;
>>> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
>> property-n
>> property-names
>>
>> please
>>
> ACK
> 
>> [...]
>>
>>> +&tlmm {
>>> +	/*
>>> +	 * gpio67, gpio68, gpio69 provide MCLK0, MCLK1, MCLK2 for
>>> +	 * CAM0, CAM1 and CAM2 respectively via the "cam_mclk" function.
>>> +	 * So, here it's MCLK1 pin for instance.
>>> +	 */
>> I don't really see the value in these comments..
>>
>> Vladimir requested you to move the 'description' (meaning the node
>> describing the hardware, not a comment explaining the function of the
>> DT hunk in natural language) to monaco.dtsi too
> I’ve added descriptions to indicate which pins enable which camera MCLK/Regulators. If these aren’t considered useful, I can remove them.

Please do

> Should I need to add hardware descriptions for all GPIOs (gpio67–69 for MCLK and gpio73–75 for regulator enable), even if they are unused?

You're going to need them when you add support for other sensors, so I see
no reason why you'd not want to do it right away

> I have referenced qcs6490-rb3gen2-vision-mezzanine.dtso for the MCLK pin hardware description (cam1_default).
> All TLMM GPIOs mentioned above are muxed pins. As Bryan suggested in v4, these should go into the mezzanine-specific dtso. Do I need to extend this in monaco.dtsi as well?

These mux settings apply to any and all users of the mclk function, there
is nothing specific to this single mezzanine about it

Konrad

