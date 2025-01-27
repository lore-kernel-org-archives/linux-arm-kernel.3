Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B04C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adphgYyuraDm+8q9lCcomTmDXgUPSbCBsDgLoCmq7bo=; b=n0D6FP/Dd3ahPCKfYYFsjHrRHA
	35l8ysDbK69i8ePNanqqFZCimEzJoTx2sLOshm394QW4pT1V+pJNrsPlxWkaHAu/xBTissE9Z2zx+
	J8yf4fQjoUMew12iSVh8VADox9hCtNpyzTZ6ciK960GrREUdl4MzKUCkxmR84+resa/axV995qCPm
	UARdXWKXQl/S88A37csjLtb3yb0HrQ9j1ia1C6KOcrHsYOp+nCOfjSRFYq+cmsvV+8yaPnkIDKoEw
	1PQC+V5hyLHQcyYqqcwGqyloFSEkt7x5OyzAcB4/4H4PaWsLax+KGJCSVOGIG0MCpA/YlVusBACX3
	CfYgt49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMhq-00000002ARB-3slt;
	Mon, 27 Jan 2025 10:51:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMgW-00000002AL0-2QGc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 10:49:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R7gm4i027752
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 10:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adphgYyuraDm+8q9lCcomTmDXgUPSbCBsDgLoCmq7bo=; b=VGMMxiyMJDS7AYWD
	AlCnYoJbFAIFUk65rKWCAY+7bByO4bXUeaqOnoZL2bzpFvKg8vmk10CU3mC9oc3T
	ti2DZr0p2bEtLkwPTeSTdw0WFVew+jrWNZZtRL70+l2UsB5Fmpj58YOCJXsJuCuK
	bflkB/K8472Ffn8Dowr/9yAQ89BeyczFtGUYmbYZDPCE0YmqFv2m85gVCCyh2YLb
	m9MNIuKqcO/jRlymGXiaLp8E7OXR8DdfxZMUduhfzouxQEXwfni7FpXTWR2i5AuU
	nwMwxxAMVl7Nwb7cXR037lq/+ihqKo7ZJGKrHuRqbFSD8H+kLOl/RL6H53jV4B5A
	2Ui51w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e60bgb5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 10:49:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679d6f9587so6558601cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 02:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974979; x=1738579779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adphgYyuraDm+8q9lCcomTmDXgUPSbCBsDgLoCmq7bo=;
        b=PH1765aooXZNK5bWTia6WRI0oQOt57O6DUT4GoF7N+B6P2oy46a8IrkWTovfI7lupR
         DuCMrpahSps9f8NGnaqvF1FjgKbCs/3RPBOOZXlFZIS2H3hEEH8FDbhR2Mv92IMRyzv5
         039NGOCRMhl41NEpaGKgt3dY1aKOFSo/F59WM4JfxTFoAwKnz/IAl8p3vzdRjuSpwByY
         jrfRkL+umqFDrvIq9CLKLrpAmUgq+Q67U+rZd78Fb14uU4+wRhW0dtGyzgO/fwjr4Dp2
         gqmpWzhBc91sI5Z1Vae6fUHoC3RMldNK+i3O4LImEY5vyqOhitCaXcBDmck8IYX3eXpQ
         dGrw==
X-Forwarded-Encrypted: i=1; AJvYcCUk5ITYtENs2bfZ+U88Qs8vvUWUfWnNvhSbRpF0+2QqzqM8YubQE6aXhV5iEJ0u4DI10TsQGdz7CnoQqkniRGwy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+UchYPG6I/q4gYmcekgRowExyV+NEnHW8+rGZAdecPUMs2K6o
	bXlmgOK4YgE6lZgdrfDbEF5nnV0GReJwRQPQnNHBuBpwSFvZSP/EBirHpgW44XmW/rrIJp6smOf
	N3Xdr3CN11EWKq69QN1oyq8Qg4qH4dovfyVOiMuGChZCB7m1OQ8Bt1/3SpO9F+/qIVz+U7qVeGg
	==
X-Gm-Gg: ASbGnct4hypAZERzFOzTSNQHxWWko8jyJNhvH7BtSmbGAbmHRmZesu1LQ/p7+FpBOL/
	hNcxq+qIfFjSJ4vNF9sLgURWF7bl+49vFxs4fT7VMMGZQ/C0onc4fkL0kgoTtv4lwpgNieI9QQl
	hgzEbBLfljtb6U8p6p7jr7QjhMJmSADMmbHFMQajMMxVwJrPr6Aoze+ttqNbAkXs91djvHM2ZWs
	L51IUT7/nldOMWnqgzZCY2saVcoiRD+uHN8ED6HkBsXb4JBIMl7vNSgmWMrYC5bnBY6jtSB/US9
	kcrbqYA4KznnqiUE0Gpajuq/OFInDxzmK02EWWc2gA3besWO4Rwj9sL8wkw=
X-Received: by 2002:a05:622a:610:b0:467:6eee:1138 with SMTP id d75a77b69052e-46e4e726f1dmr121602691cf.6.1737974978601;
        Mon, 27 Jan 2025 02:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdnH4J6HaLZ6tC9UeTjZWaxwVuzqp/4HLK9P8eKFWexw6YCwzdP8ffhfgKmAo0wFiSbNS1AA==
X-Received: by 2002:a05:622a:610:b0:467:6eee:1138 with SMTP id d75a77b69052e-46e4e726f1dmr121602601cf.6.1737974978120;
        Mon, 27 Jan 2025 02:49:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760b6f4bsm569985266b.90.2025.01.27.02.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:49:37 -0800 (PST)
Message-ID: <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <quic_yijiyang@quicinc.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y0MbFXcEpzSH1ub8w7crfKmwhxxW4r5P
X-Proofpoint-ORIG-GUID: y0MbFXcEpzSH1ub8w7crfKmwhxxW4r5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_024940_747144_24C013BD 
X-CRM114-Status: GOOD (  25.51  )
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

On 22.01.2025 10:48 AM, Krzysztof Kozlowski wrote:
> On 22/01/2025 09:56, Yijie Yang wrote:
>>
>>
>> On 2025-01-21 20:47, Krzysztof Kozlowski wrote:
>>> On 21/01/2025 08:54, Yijie Yang wrote:
>>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>>> the PHY, which is completely opposite to the suggestion of the Linux
>>>> kernel.
>>>
>>>
>>> How does the Linux kernel suggest it?
>>>
>>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>>> the definition.
>>>> To address the ABI compatibility issue between the kernel and DTS caused by
>>>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>>>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>>>> phy-mode.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>>>   {
>>>>   	struct device *dev = &ethqos->pdev->dev;
>>>> -	int phase_shift;
>>>> +	int phase_shift = 0;
>>>>   	int loopback;
>>>>   
>>>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>>>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>>>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>>>> -		phase_shift = 0;
>>>> -	else
>>>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
>>>>   
>>>>   	/* Disable loopback mode */
>>>> @@ -810,6 +807,17 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>>>   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>>>   	if (ret)
>>>>   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>>>> +
>>>> +	root = of_find_node_by_path("/");
>>>> +	if (root && of_device_is_compatible(root, "qcom,qcs404-evb-4000"))
>>>
>>>
>>> First, just check if machine is compatible, don't open code it.
>>>
>>> Second, drivers should really, really not rely on the machine. I don't
>>> think how this resolves ABI break for other users at all.
>>
>> As detailed in the commit description, some boards mistakenly use the 
>> 'rgmii' phy-mode, and the MAC driver has also incorrectly parsed and 
> 
> That's a kind of an ABI now, assuming it worked fine.

I'm inclined to think it's better to drop compatibility given we're talking
about rather obscure boards here.

$ rg 'mode.*=.*"rgmii"' arch/arm64/boot/dts/qcom -l

arch/arm64/boot/dts/qcom/sa8155p-adp.dts
arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts

QCS404 seems to have zero interest from anyone (and has been considered
for removal upstream..).

The ADP doesn't see much traction either, last time around someone found
a boot breaking issue months after it was committed.

Konrad

