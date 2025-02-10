Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D89C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRIgquMblxmiFtLWE8uSlg81ZeJdWHIECgta1ooGHZE=; b=e/QEQeZju2WQYr2FFi9Q9a9wpO
	m2UstJNv82/s+POq8N9UTjqiN9ctd2eUlhOPPzXz/j6AzDpUPYiLq3i+BGWrY27vEg3H6EzT8O6nT
	3agWOi6GHadJwhrGEUxKU6Fz+Pw6Z9ngnKCiqh2gFWGI7QvUBGW28OqpY9Rqx8faPW7oi5O6YCDYv
	73mfcMvrn0RqRKmrb1Rm+bK5gRYvnUu50jWy9EiF284FRlsiRuL+v6/vn7wFTVZpeJZPCxOGBQ54d
	MF8gT4HOk6tLyyn06qCfJJ9pdWNBxYQrUhJCOLxoenYDk1/16zUm+ra1KJPkx5cOvy/ajQ/6ElY2V
	rVzDuCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thY8P-00000000qKe-18aI;
	Mon, 10 Feb 2025 18:03:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thY5n-00000000ppj-2gvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:01:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ABgCmg031911
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 18:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRIgquMblxmiFtLWE8uSlg81ZeJdWHIECgta1ooGHZE=; b=FLJQE7msxiBv8Q2e
	4t0V7pAIGLQlOUGGIjezyRn6OOlV+w4kLff7G3L8ZGX8rXTcXLdtL1TR//N1n2R0
	RpdnZD6WhU+UkqjL+zw6qbvllZ0vZnsZ/VD9AwWjShj0quKK6MncNf8tqECZ4Gjl
	ebG6NURd4oveqz0xbJlPiFv+K23YlJRRDZgS4EzEXIbV8zCpjkW7A4RKFoV4+yay
	j8vN8dT3ZVzDPDDmygbIzb8nU0A7laM7V6IcGdbURUfM0BUZq7ja9v6Kpjv+jXkt
	9DDR+Vv9zxfPUEW4WY5J2ObSXNISHdofzxfR6oJZ+bcmj4RYb+VtsZGzKu/gibVJ
	R3ic4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk10g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 18:01:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47181a14d8bso7513031cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210469; x=1739815269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRIgquMblxmiFtLWE8uSlg81ZeJdWHIECgta1ooGHZE=;
        b=d4WkGpOnn9KSrY7YXl2sM1MM30FTPGLplPBKJN2viVUdaURxkqzk7SJFLk1wEIQiy4
         zlSKQrX0wHcw4jCGIfB+oItJ+2Wuj5cVUSFCxx1aLwYtfEw7TvZkEhJC8uI/cUD3wsaY
         HMVH2b9DmgBFHt4VDdM+Z686SkGmMHl3Fnh6w8R1QSiLAVPFBhTyJctK2JD3+zoYR4U7
         g86SyIU3TGzjVeq3NFCeSC4M4LogH24sdnY2SB1lMYbyNRplOMeQraqJr4hZBuq4yupF
         Ou6micpcAI1QmowN6bTH/HKPpc6us8tRUcQBP8B504F44FXkxpdAgtXrvz+5sISZdEbf
         k56A==
X-Forwarded-Encrypted: i=1; AJvYcCX5BZz7yS2uZOu/RK5sURsf1LOreABEX3XL8F3S9vRXfUKtkh/lPNFo1AXmaqcNskDTlhI3v+A067/K4k7NOmFo@lists.infradead.org
X-Gm-Message-State: AOJu0YzAhjXjybY75H6BUTBvh7Pw6FRgwpaT9LLPy/oqonI/gZjjLaQ1
	gbSm1f09NqHTHSqSa4FCbFTZl7SG8JyVD4sklcCNa/4VQsqJwDb8d498MaWg2F8usGvHp5cmAsL
	rymST0wGN04wAAnRM0RAjaE8Q7ZBnHz/V8gH5TAfnL8Dm/X9wHaL0+q3INf7lWEnZ6ksFu1Oh+3
	8Mlp/IcA==
X-Gm-Gg: ASbGncsRPtfmTtwcil3MrZVL1TcCPcwqby9bzDS0dIC7jVgiXzNSoMMWMZ6p+O1YXqb
	XEBtFlSaEv5CN+vFzBwP5JN793WtFI2jQflFtCV3zcViz3nCWWi05IvHBdamipN/RTCos/19ZyC
	VM+YtbGZBMDtOwAARkHg6vYnE2rhzv6lYby4cAnSI4hldhzjv2NntPdDa+A6EDwrYM9ckAe3HS2
	xF+S6mJtGrZXY1NFHy8B7Wn5T25qK7DdKpyWv2Fjzf3M25s2uk7RT0DqjXJ7ZggG9LHFLflh/J9
	B3GJZcf2cJpeP/mCZ8LZj4/dGvu/+IWWERx1+VKFMOGBZad3o//Jbhq1gdQ=
X-Received: by 2002:ac8:57d1:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-47167b066cbmr77016891cf.14.1739210469211;
        Mon, 10 Feb 2025 10:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjNHMrPdlFQI52pflImfeJmycM/6sYmtEApuonTlMDTKaYLqKa6DC/5hsEpJ2wVSAK4BNHWA==
X-Received: by 2002:ac8:57d1:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-47167b066cbmr77016271cf.14.1739210468350;
        Mon, 10 Feb 2025 10:01:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b77d58bdsm351070566b.130.2025.02.10.10.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:01:07 -0800 (PST)
Message-ID: <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
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
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZO9jEYYUXEVD73Qkqyi7pkSiePPKzQHr
X-Proofpoint-ORIG-GUID: ZO9jEYYUXEVD73Qkqyi7pkSiePPKzQHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_100111_688070_C0D5C384 
X-CRM114-Status: GOOD (  26.50  )
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

On 10.02.2025 4:09 AM, Yijie Yang wrote:
> 
> 
> On 2025-01-27 18:49, Konrad Dybcio wrote:
>> On 22.01.2025 10:48 AM, Krzysztof Kozlowski wrote:
>>> On 22/01/2025 09:56, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>>>>> On 21/01/2025 08:54, Yijie Yang wrote:
>>>>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>>>>> the PHY, which is completely opposite to the suggestion of the Linux
>>>>>> kernel.
>>>>>
>>>>>
>>>>> How does the Linux kernel suggest it?
>>>>>
>>>>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>>>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>>>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>>>>> the definition.
>>>>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>>>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>>>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>>>>> phy-mode.
>>>>>>
>>>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>> ---
>>>>>>    .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>>>>    static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>>>>    {
>>>>>>        struct device *dev = &ethqos->pdev->dev;
>>>>>> -    int phase_shift;
>>>>>> +    int phase_shift = 0;
>>>>>>        int loopback;
>>>>>>           /* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>>>>> -    if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>>>>> -        ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>>>>> -        phase_shift = 0;
>>>>>> -    else
>>>>>> +    if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>>>>            phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>>>>           /* Disable loopback mode */
>>>>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>>>        ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>>>        if (ret)
>>>>>>            return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>>>> +
>>>>>> +    root = of_find_node_by_path("/");
>>>>>> +    if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>>>>
>>>>>
>>>>> First, just check if machine is compatible, don't open code it.
>>>>>
>>>>> Second, drivers should really, really not rely on the machine. I don't
>>>>> think how this resolves ABI break for other users at all.
>>>>
>>>> As detailed in the commit description, some boards mistakenly use the
>>>> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and
>>>
>>> That's a kind of an ABI now, assuming it worked fine.
>>
>> I'm inclined to think it's better to drop compatibility given we're talking
>> about rather obscure boards here.
>>
>> $ rg 'mode.*=.*"rgmii"' arch/arm64/boot/dts/qcom -l
>>
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dts
>> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
>>
>> QCS404 seems to have zero interest from anyone (and has been considered
>> for removal upstream..).
>>
>> The ADP doesn't see much traction either, last time around someone found
>> a boot breaking issue months after it was committed.
> 
> But what about the out-of-tree boards that Andrew mentioned? We need to ensure we don't break them, right?

No. What's not on the list, doesn't exist

Konrad

