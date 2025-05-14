Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD68C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTYcnTgzrTSARrdRyGgDqevHWfgdqMFkurpjm2teTzU=; b=JoRIEIgGH2G4v9myHFCFeE8f6j
	MizJM4a3j0maq0CFnvufpKoOzuz6Nq5ksrJpF1E8wXBNKIK/TkEAKrllFIEWe+iDxIlrqvVUzfukY
	i7Q/ankg7DTAz5tt1XyV5ThT1ov8FMTfZk+UbEC37fgC2/f8wWfYujWZVtGwmXOCDRT8xdXykaDeB
	19BwCdEdGw5dDsh6SCMT7Aq4cvJWU26vCi4Xw7ebAVDmteUWLe/1LmwLCi0tNB/i3wZ6njA57KrRJ
	kCcy0o/YvSaTLhoK8xx2ZDTODVUaC0N3wtNcskoruYpZCAxgTcKLLUj6jSzX5ghLrWwH2Fo+Yl2QF
	NCRqp7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8VF-0000000EgJM-1Vkx;
	Wed, 14 May 2025 09:34:17 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7aH-0000000EWHt-0QLP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:35:26 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7w1Jx022967;
	Wed, 14 May 2025 10:35:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zTYcnTgzrTSARrdRyGgDqevHWfgdqMFkurpjm2teTzU=; b=dz80wl+vuCkp60ij
	7FaCb6Y6rODPhEpIjDoGI+ijqilMSRtvYWm7EnQx9GskOVNIsUs1uVfmNsv+G5Ay
	cRSz2iiBT5+l55aIFj3fJr7kRNWkgkQ6RZTQpTRwMb7D5OIhDBOrxfd0O/ry0klN
	3Mt8OA2itjnWurK3iiNcG5oq/w8l+I+4J7E/hI4RhD0v38DQ/pTJrvE1ppDKxczQ
	VOzgCkLMnebXGBJnI7fdiqdSUm+jWCaGP/DRZENCfrUbqLpFuo8yNS96tbUAzTCE
	s5R9cyuwQKvkhwUI4wPqL7TMC6IEwiyx+sY4DtQdnp0IzufcwdAa3Al16bjuR/O2
	pdndOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbds2h27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:35:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8AEA64004D;
	Wed, 14 May 2025 10:34:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D13E2B3CFAB;
	Wed, 14 May 2025 10:33:33 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 10:33:33 +0200
Message-ID: <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Date: Wed, 14 May 2025 10:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
	<boerge.struempfel@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
 <20250508143818.2574558-5-goran.radni@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250508143818.2574558-5-goran.radni@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_013525_414996_4E07776E 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

Hi Goran

On 5/8/25 16:38, Goran Rađenović wrote:
> Add support for Ultratronik's stm32mp157c fly board. This board embeds
> a STM32MP157c SOC and 1GB of DDR3. Several connections are available on
> this boards: 2*USB2.0, 1*USB2.0 MiniUSB, Debug UART, 1*UART, 1*USART,
> SDcard, RJ45, ...
> 
> This patch enables basic support for a kernel boot - SD-card or eMMC.
> 
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> 

Series applied on stm32-next.

regards
alex

