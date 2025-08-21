Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3B0CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhuQQAYtkFz1+EMzbo9h41xY8JijUtMlK2wIkAFemmg=; b=ltFfZtvdZl3V6a7Glj8O7EHPRU
	h+KA3SI1kOqsvikRK20l5vCbZaxGuwMGAWkmcosMcMeVF0WUFUhFiTqEY/z8tyF3VuyaD+6a61q1G
	R9LhM7ZylfwpauVnBw+88y2RiJthE1OZjQhdC1Ox37JHyNb20ps6FiNz7FI1YeckerER5PsG8MWFq
	e4BiV3aP54EJO6siboxsNjaMvLjArwt3ZSGGqAK7UeDO6Ygs4G+edNlfqcHgwfzRzl+TLlL/+L3yh
	6Z8MNx7ysBTtVKw8yNRKspi4ABzMMcwUxT3G5GNhKTQV1GHtWxCZ5SwdiUlBwGQMVmznMttAcMIRk
	YLZR84Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8J-0000000Feqi-0L1m;
	Thu, 21 Aug 2025 03:38:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uouwT-0000000FXVl-26OL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 02:22:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJWAw0005798
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 02:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhuQQAYtkFz1+EMzbo9h41xY8JijUtMlK2wIkAFemmg=; b=mx8Xv+UKFekjgIea
	zpwoOjBGpC8vG24HybBj9dFPUt5QlmnxYQI1nLF8qREnKjpKlPZWWhwvbIQSm75g
	AcfvH8kA10kv7f/86IZhqHh0uayUClUfBvRuLXE/AJBKZPrNY2mJlOufKoHv0fVy
	c0OBFnzpDknd9ZbpLkJ98UFg9FM+oxyx+q7o3t19K0C754pSN2QwlwdVhOeGq05S
	wyA/ACFZPVgH4tfzv/wZNXwBN7MwYWzXTMeO+citUmkwfWKIixxOuoUwhJzeacWI
	NaBtSrWeTcKHyU4ig+xdplvCIu80jwleequB4k36qWtceMtk4klLI/tzwrWQemCl
	SJD2FQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ckpe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 02:22:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-323266b700cso1204172a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 19:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755742936; x=1756347736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhuQQAYtkFz1+EMzbo9h41xY8JijUtMlK2wIkAFemmg=;
        b=WSCck8Cks8+8wwXWpPCXmzzxY4FBbIinPjQXmEvOz4re0CL2GPmSyH5DuWyuPd0qMT
         Sl0pWfhagxMqo+huImJOjUHdUP/X+E1SMwfgCmQtvbwDLx0XnBRevmpAs1EKFOU8rk69
         i+P+slETYgq/2he3f6tDpipuQdRQZYusgLZofTYNQiE8BdT/CiH1Jes3TZupEBBFrzNN
         obpOGai+G2s8xOVJp/LwksEpWgL8HBJIbaNe5q5xjuiPXFI2dx5ksXPAkLvKRyJYBqck
         kI0cITITB1414uSk25tg/DsaNxGeTZL+ueZJ0mZGopKV+80oiTquDJKWucencaqrcwqP
         Wl1w==
X-Forwarded-Encrypted: i=1; AJvYcCVlFDAqsVR994/ukZB8dK81QFncgC99X102hxR0ifiso/9ov1KsR1eht1bUHx7GQdrofLLJaaymqtA86BvRaU89@lists.infradead.org
X-Gm-Message-State: AOJu0Yx76hmm0IxKZz+jyQSReqUblnnQm5Zomc8KlRptzsi2oJAqpbT6
	T9YpsQL+sOgthO4DcnECv0OLCpsYrQtOzSxnI2PARJjMQcbOFdfs/fwMgglsdZ2zEoNAWXs9DxV
	NdmpbAOGFIbpkvq0KdGy08zrXNs6giVY/mhH2Sy4CqXGSFT7MNdcPcgRg2Icndi4HoAb7MGfS/K
	QYMg==
X-Gm-Gg: ASbGnctrdlVMWtNyBhXiXpLA3S7EVDjjBtS14pa43Zr4YchyWu40Q9Aax/Kg0Eootk/
	ABfbSvtOCqPwLwx819k1ihjEXvRSfms/AoHN4HtKcm6paLP8+82laISsmM/46jVD5F6RTsOUyHt
	CIH9tdnUmaHJ/9liDtlwoqtn+chfcU25WZogEMz8hm4eWKqr2FluZC5zAmR5Rvg0n0opZXX/rPb
	KNNr0E1W0UDfis3P6NBZ/5rMH8qy9vNXlqmqqjFNGu06UCVOER2OGnKdwnKq9Kt1rAD/6pMASTq
	+NZCCclmZhIvj7MLxY8Nck+tJDswWOMVpj4KpWPqO02BMS0SAkZ8eqsI419habzdMjtxLwcz0me
	t2wkum3za3ctafF7StWG97qb9AzRq5pEF
X-Received: by 2002:a17:90b:53c4:b0:324:e642:b5ca with SMTP id 98e67ed59e1d1-324ed13a72dmr1379022a91.29.1755742935722;
        Wed, 20 Aug 2025 19:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJRz4sysTqGhrRLL4dSQy2QlK07feYrDXxAVKB+n79aOM7MsuZWRLWFY/xgGqdwpBUmHYgnw==
X-Received: by 2002:a17:90b:53c4:b0:324:e642:b5ca with SMTP id 98e67ed59e1d1-324ed13a72dmr1378979a91.29.1755742935196;
        Wed, 20 Aug 2025 19:22:15 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f23d745csm356703a91.4.2025.08.20.19.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 19:22:14 -0700 (PDT)
Message-ID: <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 10:22:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] net: stmmac: Inverse the phy-mode definition
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
 <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gWvw01-t_HSb3XpvPZv7hJkqAgRRjp4Q
X-Proofpoint-ORIG-GUID: gWvw01-t_HSb3XpvPZv7hJkqAgRRjp4Q
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a682d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uddfqdTxQVX4ueY0IN0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1nhx66jjlTCc
 /ickF24/wH1d/jmVyfimtqrIfc8pbiVQwTK0gdNvc27W8yPRGeZ8TQtIcHE6vw+QVClzzax0CXO
 TS7rFc2l/vDVhfxtp1+Ne3HUf8KtvDslE/CFMbuMf0JYlShkb3m1EvShA1wghP2spFjClHDTKDA
 XxOioTO8AoRbSUMO4U1hzHV/a8GgCCsRPl0D26Gmc9FMR8ROYKgG55ftjeDPmMKzR61xH0NSD4i
 Wy5PbaywY6mXuR/KqN/j+XpsaFzLqtt95ppojVH5OLbx3OlrY36nj2cLqOA/X9pnZF4PLbAMh2e
 l8t7f+TivWvm9bm+VHwGsmE2vrSoChuCvmA7cijsajd/uxRNV51Q7olJgBoqDmh0D6MMYcRlM3G
 2QJiICqwXcqVXbo9yCGi7Rz1J/o1Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_192217_553060_65C81FB1 
X-CRM114-Status: GOOD (  16.19  )
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



On 2025-08-20 00:20, Andrew Lunn wrote:
>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
>>   {
>>   	struct device *dev = &ethqos->pdev->dev;
>> -	int phase_shift;
>> +	int phase_shift = 0;
>>   	int loopback;
>>   
>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>> -		phase_shift = 0;
>> -	else
>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> 
> Does this one setting control both RX and TX delays? The hardware
> cannot support 2ns delay on TX, but 0ns on RX? Or 2ns on RX but 0ns on
> TX?
> 

This setting is only for Tx delay. Rx delays are taken care separately 
with DLL delays.

> 	Andrew

-- 
Best Regards,
Yijie


