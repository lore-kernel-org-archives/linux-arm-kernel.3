Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B23C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24vCB/Znf/TjzLM/rAbzJHPouiMnIdlOj3IaBxZTHOA=; b=cmu9vVNuCXDFR0QBfk50FlAt5C
	6LvLsy6n82SpB5j0q3QaUUe3sivyQZjBiNsb2rIziyWr2T5ft54AIaoE0PhrsrG1u0bWcPiRkP8eV
	Bef7eDZWPk+3dXpS5uc7cZrzc123NChDlbXVS6RGOSpvfyfHKJIkQOnxUkAkbsFN/RWxkNpCfgWG+
	hjxyc5iA48r4Hn6sahOGUCzl4jeujhS/ghC3IFmWVydAdEc7L/j0R3003thC7ZUKz3nt18h7dCMet
	5bRCBalhP36qjzRCAk145yvXdyRs5GgmoTiS0o/ytv4F7GZbVC9zyn6YRxFIZ48FqNeg180NiCmyl
	S2TAE5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT5i-0000000Ahjw-2MQN;
	Fri, 07 Feb 2025 18:28:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT1V-0000000AgYN-1PDS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:24:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517CT9pQ010620;
	Fri, 7 Feb 2025 18:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24vCB/Znf/TjzLM/rAbzJHPouiMnIdlOj3IaBxZTHOA=; b=E03V5WVdh1fY1DbW
	yBGjR8ooUk49Udw8Yr32oTNz88DdkkXzhfc4KbaBHW/INhjp6UGF0M5G/UAg7bCw
	S9AiqmeMDOSlhBQUMBp8rA+fLZOH2c+u9MLB6qy37fUeKdiH9NmFOFgkMGU+hXRk
	DQ90WmK62P4xV7Tryte3Dsuus4bSV2YEXKbDFX16lYR+nWN8WkgwZVffiKtWFxjA
	7vIqKvZ8015aTGkRDpuxE/TxwPNdNgi0HySfB75yl/t+FCk+wuvIdgrQga1jFG+v
	IjE2AbkHni6qP2AtopA/KGwkaBJieEKSxxwV7Wz90tGNC4+Kj8I+EbZm1kgg8gc2
	E4gLFg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nj6w8v2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 18:21:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517ILXDi023451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 18:21:33 GMT
Received: from [10.110.91.228] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 10:21:32 -0800
Message-ID: <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
Date: Fri, 7 Feb 2025 10:21:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/5] net: stmmac: Add PCI driver support for
 BCM8958x
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        <netdev@vger.kernel.org>
CC: <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <richardcochran@gmail.com>,
        <ast@kernel.org>, <daniel@iogearbox.net>, <hawk@kernel.org>,
        <john.fastabend@gmail.com>, <fancer.lancer@gmail.com>,
        <rmk+kernel@armlinux.org.uk>, <ahalaney@redhat.com>,
        <xiaolei.wang@windriver.com>, <rohan.g.thomas@intel.com>,
        <Jianheng.Zhang@synopsys.com>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <bpf@vger.kernel.org>,
        <andrew@lunn.ch>, <linux@armlinux.org.uk>, <horms@kernel.org>,
        <florian.fainelli@broadcom.com>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OOmFY7SmVHmL41lJG0u5sLFBwJ4eloTj
X-Proofpoint-GUID: OOmFY7SmVHmL41lJG0u5sLFBwJ4eloTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=832 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_102417_508377_F149136F 
X-CRM114-Status: GOOD (  18.61  )
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



On 11/5/2024 8:12 AM, Jitendra Vegiraju wrote:
> Hi netdev team,
> 
> On Fri, Oct 18, 2024 at 1:53 PM <jitendra.vegiraju@broadcom.com> wrote:
>>
>> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
>>
>> This patchset adds basic PCI ethernet device driver support for Broadcom
>> BCM8958x Automotive Ethernet switch SoC devices.
>>
>> This SoC device has PCIe ethernet MAC attached to an integrated ethernet
>> switch using XGMII interface. The PCIe ethernet controller is presented to
>> the Linux host as PCI network device.
>>
>> The following block diagram gives an overview of the application.
>>              +=================================+
>>              |       Host CPU/Linux            |
>>              +=================================+
>>                         || PCIe
>>                         ||
>>         +==========================================+
>>         |           +--------------+               |
>>         |           | PCIE Endpoint|               |
>>         |           | Ethernet     |               |
>>         |           | Controller   |               |
>>         |           |   DMA        |               |
>>         |           +--------------+               |
>>         |           |   MAC        |   BCM8958X    |
>>         |           +--------------+   SoC         |
>>         |               || XGMII                   |
>>         |               ||                         |
>>         |           +--------------+               |
>>         |           | Ethernet     |               |
>>         |           | switch       |               |
>>         |           +--------------+               |
>>         |             || || || ||                  |
>>         +==========================================+
>>                       || || || || More external interfaces
>>
>> The MAC block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
>> MAC IP introduces new DMA architecture called Hyper-DMA for virtualization
>> scalability.
>>
>> Driver functionality specific to new MAC (DW25GMAC) is implemented in
>> new file dw25gmac.c.
>>
>> Management of integrated ethernet switch on this SoC is not handled by
>> the PCIe interface.
>> This SoC device has PCIe ethernet MAC directly attached to an integrated
>> ethernet switch using XGMII interface.
>>
>> v5->v6:
>>    Change summary to address comments/suggestions by Serge Semin.
>>    Patch1:
>>      Removed the comlexity of hdma mapping in previous patch series and
>>      use static DMA mapping.
>>      Renamed plat_stmmacenet_data::snps_dev_id as dev_id and moved to
>>      the beginning of the struct.
>>    Patch2:
>>      Added dw25gmac_get_hw_feature() for dw25gmac.
>>      Use static one-to-one VDMA-TC-PDMA mapping.
>>    Patch4:
>>      Remove usage of plat_stmmacenet_data::msi_*_vec variables for
>>      interrupt vector initialization.
>>      Change phy_interface type to XGMII.
>>      Cleanup unused macros.
>>
> 
> I would like to seek your guidance on how to take this patch series forward.
> Thanks to your feedback and Serge's suggestions, we made some forward
> progress on this patch series.
> Please make any suggestions to enable us to upstream driver support
> for BCM8958x.

Jitendra,
	 Have we resent this patch or got it approved ? I dont see any updates after this patch. 

> Thanks,
> Jitendra

