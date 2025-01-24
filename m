Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9ADC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQJZ2/IQ+I2p2Ev80yrRLDK6uoLc+JB+saQGoWGX9Ko=; b=Hkj0YLVeS1Khn9y+CJp9Q+suZT
	t9KqwBcRG4zYJQMuO1NU8dgdU3waV0DRLVLPfyA6cGlwmbt5O0fhVuQYUFj0NmqYzyUGs2UDGGmJW
	MgVXt+nt5adkFwwDU2D+LOq7V3vLgSjxxtQag8cCZsiulMpZQN6+Y753+S9kU0/o0S4EeJb1DiT4X
	1JLi2m0t3N9MgG15bNn3BNGgqeG28O1WtH1vyN+C9c+dms0NRXHTDupydpMaFsrVq9TuLD/mbcQrO
	6KGesRiIekvjvMxjC96DWfHRQzh3wzXzSnoJn7119CGrA1Lech0Vp3DszmD0x5ATh3I6O2yLw4VLr
	0hXksuvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbM5m-0000000F32W-1nGo;
	Fri, 24 Jan 2025 15:59:34 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbM2a-0000000F2dH-3w7K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:56:18 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ODxT21020338;
	Fri, 24 Jan 2025 16:56:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	uQJZ2/IQ+I2p2Ev80yrRLDK6uoLc+JB+saQGoWGX9Ko=; b=ieJDbpw+v0XmJCbj
	nqWoYbSg0U9tI5gJ86lpMlxkANGFkz/xY7sihPc0Cuo0niayH1GJRA43V2Vc7IFI
	+unl2mdy8XQkvwV3yF7XPJ3AcJe/su9q8MQS4bXpviGiotw4t9IfOG6bejzeZu13
	cgnc62DZbOsj9VMJQRPvvwmk4YswWFKLGRsVEAjjny+g9dkhbSwalq+/v4QKLQaY
	V8lVIMJrwEL5CHMD40ta+q8fHozvS/kps3i0uMx60ten/yqSOI033frL8LfxejdM
	cG1YeLtd2DVsN/a/rdf4Rkz7V8Ut0MNGL2Xhsw/0fCfsbApyf58HPmSkv2h12PJK
	27MwLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44cc7x8dqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 16:56:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 73A1640049;
	Fri, 24 Jan 2025 16:54:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B82628DEDE;
	Fri, 24 Jan 2025 16:53:48 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 24 Jan
 2025 16:53:47 +0100
Message-ID: <5def1249-627b-4daa-a1e5-c0df161dafab@foss.st.com>
Date: Fri, 24 Jan 2025 16:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: defconfig: Enable STM32 Octo Memory Manager
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250122141037.953934-1-patrice.chotard@foss.st.com>
 <20250122141037.953934-9-patrice.chotard@foss.st.com>
 <ac9bafad-62b8-433e-be43-96a6f9276141@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ac9bafad-62b8-433e-be43-96a6f9276141@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_075617_264005_3777FBFC 
X-CRM114-Status: UNSURE (   8.10  )
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



On 1/22/25 16:23, Krzysztof Kozlowski wrote:
> On 22/01/2025 15:10, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Enable STM32 Octo Memory Manager (OMM) driver which is needed
>> for OSPI usage on STM32 platforms.
> ... And which upstream boards need it?

Right, i will add that is needed for stm32mp257f-ev1 board

> 
> Best regards,
> Krzysztof

