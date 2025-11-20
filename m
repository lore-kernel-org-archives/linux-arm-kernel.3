Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675F5CF64AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=; b=vCilAXU6FUQtRxxyvlxjH0xIfu
	IzsYWGTcdbpdl/4Kn5E1tQglNzw4Cawb0stc0BgPUckQJ5A/RgOPlTy/xzEDf6UPq067lztvNBF8J
	5RTnsx5GKw/UZOTV/i3FJ5EwWqYyLbWKo/dxYXPCHAzOizb3g13/80YMz/SwIj6+df9HahBgscSxA
	x6b56FfKeL/bFqLZjQkFP5h36zwMiBUzkHeOpjB9HyoGpQFNbvDZAluAgPWI/nKpeWoZP+uCKOzGy
	2fDi1FeM9Rte1E33f7sUzi1FZj4Un43TgfI0O7W+Bu+PsAidmgFYwdhJqDYsWXsuNeu/uEJaroTOX
	njDQk99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1PF-00000006Ss1-1McJ;
	Thu, 20 Nov 2025 09:56:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1PD-00000006Sra-1qYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:56:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4qKxP3409497
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=; b=Cw+UqZJCNsnBt1Zl
	QNbfmckNYUbx4cRRpsq4ISA6Jt092B1RDHSSgAt8QFsjfV4l3tczXECPsvC/5WPx
	I5xMA3lDThsXBtE3/Wuv6/iIr4DMg7MeVpimQA6/4Iyw7EN5E6AUg7jcIgSa2NvU
	800gpZTPMm6q1jbBCgBXS/y6QJ0H/eZqR9np+teeUY/2K6TG5jJM4Nk2MPZXcG7+
	9xFmPhaovdTH/SBq5K0XGXU1rK2F2Ws8pYfLQRCh4NN2a3/wShfIPTTkRU9WPO7r
	QVt9CuQPvtqcChlcLMW588nrggNNDtqZxnCjsVvaIfd6mFKpTSyGqRe9Rerw7bEO
	hbSsTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahm812976-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:56:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso2136381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763632606; x=1764237406; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=;
        b=cSuQ7QYgONUymrTeOmpXutC5ddZHA+qtnLnnupHZZ6xeo4U/xVwDbk5P1RcOi0D+MA
         sl1M8y7AJ6hzgumizPClrJOkfPGBedRYUWIt9+nwPjjFjpyonmaQowD2yfhcRDWVsEFu
         rSPj9Yl6kDHa6dKYNL0Hy/o1AaftQyOE5PzNuVKwwzy8dmxH6ShIFiML8gWcvJLKZNY0
         yNnPrr/1B75GsfuRq3k6m9BH9Ja85BhfwkWG9zjqYp2J8phQ8Iq8/fS1XwqDu58mfT/s
         aL2t0VmtLeOE0DuTK2AQoee/HeJeZDN9sDRLddaTf9eW9Hz315HY2KyNSHEzA3XVisFi
         NX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763632606; x=1764237406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=;
        b=k6Aypv1nBz5wDe6TgbFhrD/fNq8KFiON51JSG0Y3nAfn+5rzxIEnon9vV7ZkG2TVqM
         NQ7zs+CQth4DpmmF0B0Yu6DnC3sZu9wDs9zIJ0uPMmFB1EFUeK6b80YH4z773QV+FoQR
         MUSmQE1Y4Bn8Cbj5R9fhWzx6ktB2xdAqac/dObspw82hewA+mdNhr8ZC3Cec+5ctZt8x
         mWB5dDAD0P3XW2KF1/90/7YaFC/L9hT5+XDFETewhLOzl/5A4ako23PXWZbQI8PFKrxP
         Z6DhbNeIl7gBuI6xUD3KqjIH+dskCbaSFmjGZ/JfF22zNCLvzfRPReAh2S9F1w+rO8tm
         ISZg==
X-Forwarded-Encrypted: i=1; AJvYcCWN+AYZzpzVVR6lCN56DWrRCEClZUYs3W6frHkFkJyZsdkLjo+0BvmtvcwWr7971WN5kKOQTlAXze5935TQfISO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7aZFECHlsXVCV01ZJAiAd2WGqyjRy3mpCThdfwUcJaR1Rme8L
	K98Tz6PtbNsVlTaj24bHGPaU1bu0ISK7ze4zQN4IpPEcdaYvM6Gf6rdDSEXTYe7Z+ka7pH8BAgI
	29Ks4EnOVPmHuOTrTyl+8r8C33Pa3ubVN6vHTUTH4aPgEjCBUR6JI3Jq/ZN1GbN8pD5XEibacbX
	bnHA==
X-Gm-Gg: ASbGncs2U89kPmdzP+eqGwteA69uOY+xoKAMEamQHE/6ju4MoaWJgQwArEOldwVmkrJ
	iMWZNRi7MRVJIwF4PIaxNQIiRs3QnbabA3znbkQ8bXleEjwUj0BsG/hj0UzIFsWsfUg1GdtxgC8
	UDDYm3X2CrBYdGfe3bqI4LCRTeM3AfcXNBCBYg2D9sE6gdzfJzf0H6KzzKhy8GlSbRHc1pxrO+x
	UWIJFl+0I8P+1b5LddRj+lhRABRtzIdQQW95s1C/QPq3ThLG9Sv3EsXGz762TSGmxBQqp1io/iq
	dwOP5cIXmd0/dpvapn2eZ+ZQRdpmGfIgCbhuypctH/fVboefZJluwId3X9r8w94vQLyWE7DVuD3
	KKAJV8yTQpLJWSyswfvO9YrIxUoBd7uWKGRvsi0cTccxsTQ7YXxqyweDjUoBUEU7rxog=
X-Received: by 2002:a05:622a:606:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee4d3d9577mr9046091cf.5.1763632605809;
        Thu, 20 Nov 2025 01:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvX5tt7Qoa7/1Nd3zshKb3HAhHIfws6mxUCD1woH2NH2kWlspMcanmSVKJFvTHbTJGYjt4Sg==
X-Received: by 2002:a05:622a:606:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee4d3d9577mr9045891cf.5.1763632605320;
        Thu, 20 Nov 2025 01:56:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d50328sm174027666b.20.2025.11.20.01.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:56:44 -0800 (PST)
Message-ID: <e099d1d4-7e8e-4212-a324-5e790ba7559a@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
 <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
 <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7EZXpnUJxS70-7dA7RJ0d8Gk1lr37OKk
X-Proofpoint-GUID: 7EZXpnUJxS70-7dA7RJ0d8Gk1lr37OKk
X-Authority-Analysis: v=2.4 cv=SJ5PlevH c=1 sm=1 tr=0 ts=691ee5de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=ZmNGhu4S8FOEUr0570YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MCBTYWx0ZWRfX4dgiDACXh5FG
 rcEO55XrjBvqqC41C0xTsBcdhMmyhfla+Qspk2X3dKQ/2KsyMtdex97/TrownBUHZWoMgAFMgmJ
 nR6859TVEY3GjIb8eg0tVkVYE5zyNK3qHS67XYlW6VHZPrxIfNr3cfGw6nG1LpOVHTnhuogbmi9
 oPOeGPUfQ2LeaaJonUFBV/8yakSLoWeoZ74wmHXZ+QWTQUxMgpRa25tGt7dVw1P+5xaP7rg4QpG
 kduA0Pk2UPJ+NHifCgOFcKMQDJqdRdb6C1sKa3XXHu9uEBGRUr9sDDagjEu52Fcl6b0TnErsQOP
 hRKTtT3wG8xNcSQSly5/EdyAwrtI56BCNVR/AstDKMKLIPx6oHIixd1M9CRVWbWtiAws5p33403
 hbmwuMDC9zDIHmD5ocg6DJfiq4078w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_015647_496264_7B82D8DA 
X-CRM114-Status: GOOD (  19.00  )
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

On 11/20/25 10:46 AM, Russell King (Oracle) wrote:
> On Thu, Nov 20, 2025 at 10:42:04AM +0100, Konrad Dybcio wrote:
>> On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
>>> The driver has a lot of bit manipulation of the RGMII registers. Add
>>> a pair of helpers to set bits and clear bits, converting the various
>>> calls to rgmii_updatel() as appropriate.
>>>
>>> Most of the change was done via this sed script:
>>>
>>> /rgmii_updatel/ {
>>> 	N
>>> 	/,$/N
>>> 	/mask, / ! {
>>> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
>>> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
>>> 		s|^\s+$||
>>> 	}
>>> }
>>>
>>> and then formatting tweaked where necessary.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
>>>  1 file changed, 89 insertions(+), 98 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> index ae3cf163005b..cdaf02471d3a 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
>>>  	rgmii_writel(ethqos, temp, offset);
>>>  }
>>>  
>>> +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
>>> +			  unsigned int offset)
>>> +{
>>> +	rgmii_updatel(ethqos, mask, mask, offset);
>>> +}
>>
>> It's almost unbelieveable there's no set/clr/rmw generics for
>> readl and friends
> 
> Consider what that would mean - such operations can not be atomic, but
> users would likely not realise, which means we get a load of new
> potential bugs. Not having these means that driver authors get to
> code this up, and because they realise they have to do separate read
> and write operations, it's more obvious that there may be races.

Right, I don't think that would show up a lot in practice, but the 1
case it did would be exhaustively painful to debug

Konrad

