Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625DDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbLO7yjcp13kgrbLMrtPsgFowoaqk261CAPX88WxiV0=; b=gsjwLm+vBCc+Ju8gi+NJ4WVrLT
	gAgB9cIXAPjWI6l26gzLw2DGXBfEngQCrxpXkNAfj4Kbsm87eHJj+plsnDByN3M0bdLx7JbGuRiUI
	jU4LkpsnYQQ+8x3KUV5/+CCV3/4l3DKMu+QyBGPetv2hNOBiu0BLLGFTzBYBLVdfMWJ3+y2FVWvkx
	9ZLTd8RIYxOPZmpCbVBerL3ZHEb+AMHrEBRNBsNRuRbe8agXuUoWVWxYg5HQeyhk3p1yN2hWuEVo/
	zM4FaTHuRMMCXKfdIhJJhmPaFHAjMfpuDF/T2nT/XJu4A4TXIgk7NvupmpmrUTvY965yogUON4abU
	rdcBVYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqdC-0000000HOpA-21t0;
	Mon, 21 Jul 2025 13:32:38 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpPf-0000000HEIT-1mmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:14:37 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LC5CAG018486;
	Mon, 21 Jul 2025 14:14:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	IbLO7yjcp13kgrbLMrtPsgFowoaqk261CAPX88WxiV0=; b=nfDgjGedwxd5bWa9
	NsZdWaCUY3TXRY5k6E72h1w+zNKywB4A0/XE33NGR7muKiXNosUtj28QRr/VU2xb
	9KLPQ2UDIdnhw7iVmy7/g0SL1U7rsI7NxYN9InjJyKnFI17fUpEDBQzKm4Xwx/Lp
	hzNSgJbW4nL6/bUXqwaWLOgZBKqneJafjGGIPVxZEz5UD1ZO8bKfn3yS3zt4rcAk
	syHDwt6zvexxg0ERTSKAkgv6psGf32BliwvVL5Azr6aOOw5JtEsbn1aaQzfDx/Wa
	PWEhfhoGKpb5V8IvchroZDmFIBjFSBNEk1KWeEq7oJAQm8W0gUxKWUrJZis/h5U7
	GmKraA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q20v4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 14:14:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B4BED40051;
	Mon, 21 Jul 2025 14:12:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A35B6787C05;
	Mon, 21 Jul 2025 14:10:54 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 14:10:53 +0200
Message-ID: <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
Date: Mon, 21 Jul 2025 14:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
        Tristram Ha
	<Tristram.Ha@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_051435_967846_1774E1C7 
X-CRM114-Status: GOOD (  13.31  )
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

Hello Krzysztof,

On 7/21/25 13:30, Krzysztof Kozlowski wrote:
> On 21/07/2025 13:14, Gatien Chevallier wrote:
>> The "st,phy-wol" property can be set to use the wakeup capability of
>> the PHY instead of the MAC.
> 
> 
> And why would that be property of a SoC or board? Word "can" suggests
> you are documenting something which exists, but this does not exist.
Can you elaborate a bit more on the "not existing" part please?

For the WoL from PHY to be supported, the PHY line that is raised
(On nPME pin for this case) when receiving a wake up event has to be
wired to a wakeup event input of the Extended interrupt and event
controller(EXTI), and that's implementation dependent.

Best regards,
Gatien

> 
> Best regards,
> Krzysztof


