Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF5CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 05:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kddPkpre7ME5y3bcroj6Je9pgogY2lLTOokJDaid64A=; b=bpS7iWnWMkhVSov+Fpfkw7608o
	jTJAUOEtqn8L8lnQHt/APOuoM4sOSib4jmP+MKggxW3qvtsT1Rg9O8DysNRnhmBh4ZWmQT1+eT0cR
	3+UtktH40/fdbdhOo+2YQ4IDSy78i/u2FzJJDco9Oh3TWinTo00ZOJLzx9hUkm5UXiblDOl1Qnh34
	D1sg18+iLJmLdsUKL6u3KFONLnMAxZ5FF5gx2Z5ntgn09uvkkzLU1lCmV4HR1UtcMU8IocMdvwOlA
	N5j9MNu3DPlswBegx/MjwuXw2qnZU5VgYQounFf7TAu1lCjA9I2xru+k9lD3EmdTFRG8cRyoZn8jD
	TAhdUeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8ni-0000000FF0g-1Su7;
	Tue, 05 May 2026 05:58:34 +0000
Received: from mail-westcentralusazon11010001.outbound.protection.outlook.com ([40.93.198.1] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8nf-0000000FF01-0edj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 05:58:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryvJOSvZD6d1dWMt47xel0ADCQlPsLBEfRpAOYWaNxlvrYjXGB134PDeeFMpmyhQPQ2Bwm9gLFXrgVbVc3JRQjqhrI6OPz8SxLwyqVIGgSlI1W/dh6Q55csN+i6iRAjIzPG2VLoCkLIV5ntXZD8YTBSLFuGayag68FbJBl2taSI0n9730czrHiGAU6RcUmC+Y1a3/8g8GTDjd03oVszoxYoUnq80JHEbjXBI3bmVQ6vBkcspcIF4udk3n/tXycsyxz+/PRc3Cz40yLI550AOs+xXpWcQDx4vvMUfypdQs0i+55cFRq+dEM5F7qnRsEs7pF2p3JNQM917O/au1k7oKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kddPkpre7ME5y3bcroj6Je9pgogY2lLTOokJDaid64A=;
 b=p8LxWbauQDs7p9569EFXegIWJBSy9f1lO67Uao+OguaTJHOIZx76sWNW9EtxESP2tBNTHtR2JbEaz5hbfK37+HiYa3hyeOY/2nbmo/E+mfoOlqcAj9Spd1zp16WefIky9Nck7eBu72dEao58upuc7L7ikBPiTaeabkykEHREUgUBbD80z0JBw+7qoMt4uLoTkmejR0QQqqv+aDhb/LnrCjq8Tc5y8NC/Fr0hnLEEYqCvDYerY5veiBAb4hnR59Kq+ygUYrApjfT760iscy1Sa7zW6CwveiLy8saNSI5xl9+usvVtDZopUlbJ/mizBH4gHwn6tjLMxhuZCkGCAv6fMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kddPkpre7ME5y3bcroj6Je9pgogY2lLTOokJDaid64A=;
 b=mAKqZ5IHtB+JqNGbc9yP+hvWUx3wyQ7pXdtPFn10YbpP6hIELeqR+sekWcfd++a4sdAOQv1HoB4DsYQR+4PDlcJE7k1DgNlNacPYMIv8gjO7wpz6pE/Sfoa3Gq4Yxt+s3ZASjwABwAyxlx82EcxZXccgotl8PHVOoPipQMqGKWs=
Received: from BN1PR13CA0012.namprd13.prod.outlook.com (2603:10b6:408:e2::17)
 by CY8PR10MB7195.namprd10.prod.outlook.com (2603:10b6:930:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:58:25 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::22) by BN1PR13CA0012.outlook.office365.com
 (2603:10b6:408:e2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.13 via Frontend Transport; Tue,
 5 May 2026 05:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 05:58:25 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 00:58:24 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 00:58:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 00:58:24 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6455wKDZ2612260;
	Tue, 5 May 2026 00:58:21 -0500
Message-ID: <1f06c527-4806-47a9-aa3d-70a01c5390f9@ti.com>
Date: Tue, 5 May 2026 11:28:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ti,j721e-system-controller.yaml: Allow
 audio-refclk as clock-controller child
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>
References: <20260330094459.128648-1-m-shah@ti.com>
 <20260330094459.128648-2-m-shah@ti.com>
 <20260331-flashy-hilarious-whale-6e606c@quoll>
 <62dd6a7f-7a5b-4939-a18d-8b763f6e8f9b@ti.com>
 <0c78744d-6bdb-4b0e-a0bc-039bb6527476@kernel.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <0c78744d-6bdb-4b0e-a0bc-039bb6527476@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|CY8PR10MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ddec9c5-5341-4cd7-74b3-08deaa6b52a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TSa/8W1f9NeEMg94cZoipuTCjdY6oYHrnCS09s8UlROWVnbBWx+pnBVkSiLV7K5tz3yaBBFNuQDGT5vMAkEi40HaefwNWQKTWvmYtJ9GlqyKMB1hQp5xkusV5h2Pep4eaKeKAHNnzIQm49Dl8al4EdraXoVg9c7gmehmLqohg6cYACC9N09IbalESRiirLEZFcyRo10EgAyQAcplEdqnNumdaDJgCA/3QaUv/ykDdCxmHUa9Ll21U4GC0c9O2nkqW8b33hFelRa9yi8t8gloN8I485YXR2GyJ+MSaaTrPnT/w/MYT2OjOsaILpC75A8Mek6Z1SZW2k91WxbBz5SUXI3dBLyvmuQQrDZvKFq36BiDvUNfkHb0TDrMEqUx48uv0AxNTcpE35YRBdkms2rWHVfZ2qcmqs1y+YXsjWyxnQxhq31o411JvC4VkQ1dwpqj5Ay/Jjp1zfhU2kJv4Ie8Wrjomfd7BS+hzlIP/IkUdAm8TC2e1HXpeAVyCrb+5VklzJnAgWoWCbv/1FLe+097v4wCobx1jqI/eRPIZFczyNbOL/r5oaYgn7uA+2R8gLvRt+Ae3H7s/KNhdYSdkDMPtNkzSEjCcqTS1BE4nLGF34MCbBOlojJ9Fo3ocMEfpIE7tBA+VX9fQSDiLuTtS7TZO8fTlK9pXVSi/gmk1OM0cjWfmSEg1HHWvI49Hf9s4H6QLB6kCLWHEuEOhSs7zW1C1R5XW6weX5o1seWGtL/X6L0=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +1UfVy5yYbrcEzYLA2cwvgpSR58fbT9nL/UwFTv9wO7qMDfJdaZsAoxKT8Zqqo1rz2ZVTp0wsqLASR4A734SmWNS0CIKSzCVEkRpRMkNHpRfACpmiIszn1qNah5vq/PEh2wxUbKP1zsI7kKLg0wPaudWL3mgECIfihRwkPmkSDdHpiS9aMJvsydOAqOJIGTEK0covYXubp8fopJQ3cx9TlLd66dRhTozJy8R8I0gTYFQmPjEBwL3CdcKsHl34qk8TOP+uHaSJMXADW9N1F42fMsLfptDybLbzrg92qoHmf1xvSm8Hc4UzT00mRW13iOavT4GhgfVNAdlSI02RLgsNV20OIB2dM0zsqmhBZGBkZGZkH3gTwduKP8uFyOHguWOppArhSCWptXSQDKBwULOfBQKrWYQ9bQTJZnHKcPlSOOT4mqZj8lVyI9T5bx0LCyi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:58:25.6858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddec9c5-5341-4cd7-74b3-08deaa6b52a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_225831_228338_354DA850 
X-CRM114-Status: GOOD (  13.78  )
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

Hey Krzysztof,

On 07/04/26 11:23, Krzysztof Kozlowski wrote:
> On 07/04/2026 07:46, Moteen Shah wrote:
>> Hey Krzysztof,
>>
>> On 31/03/26 12:39, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 30, 2026 at 03:14:58PM +0530, Moteen Shah wrote:
>>>> The ti,j721e-system-controller binding currently only allows
>>>> clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
>>>> schema. However, the system controller on J721S2 also contains audio
>>> J721S2 or AM62?
>>>
>>>> reference clock controllers (ti,am62-audio-refclk) that use the same
>>>> clock-controller@XXXX naming pattern.
>>>>
>>>> Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
>>>> or audio-refclk schemas using a oneOf constraint.
>>>>
>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>> ---
>>>>    .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>>>> index f3bd0be3b279..d5d84a8f1257 100644
>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>>>> @@ -53,9 +53,11 @@ patternProperties:
>>>>    
>>>>      "^clock-controller@[0-9a-f]+$":
>>>>        type: object
>>>> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>>>> +    oneOf:
>>>> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>>>> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
>>> Alphanumerical order.
>>>
>>> There is no ti,am62 in the top level compatibles, so why am62 is here?
>>> Top level has j721s2 but this ti,am62-audio-refclk.yaml only am62.
>>>
>>> Best regards,
>>> Krzysztof
>> The "ti,am62-audio-refclk" compatible refers to a shared audio reference
>> clock IP block that was first introduced/named on AM62 but is present on
>> other TI K3 SoCs as well, including J721S2. The compatible string
>> identifies the IP block, not the SoC family.
>>
>> This is already an established pattern —
>> k3-j784s4-j742s2-main-common.dtsi uses the same compatible for the
>> J784S4/J742S2 audio refclk node.
> Please read carefully writing-bindings doc.
>

I am planning add another compatible for j721s2: "compatible = 
"ti,j721s2-audio-refclk", "ti,am62-audio-refclk""
This will eventually be falling back to am62-audio-refclk's compatible 
for now, since we require the same functionality as 
"ti,am62-audio-refclk" but if in future someone wants j721s2 specific 
change only they can use the new compatible for j721s2 specific usecase. 
Does that sounds okay?

Regards,
Moteen


> Best regards,
> Krzysztof

