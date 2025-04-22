Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BBBC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKS0/gN4dBFreWXVuJOftMxAtj1ZsfyEUQwImitbTEw=; b=cLmOFZTwqVtiQ3FvuQRww1aiQB
	BO01MdI/CNg8kwfhsFeqN1tDt+sYUKGH+w8NZAg/tEQ2I9RY5xHoUyldvZ9UdBDs5sZGqgu5KZwAv
	mreGbHGUAwMK0D+X6c26UM4XUKF6itTHcY3YnsmGu3/FjnGyRRuWHf0fcIeYd0WvelK33zzp8NGxQ
	mZlK6SLRIXubTsDgcTl3VeV94JLCazacAXR1fjShI9DbP6miaEvuvBWjd6yc9E7/ZK82JyBP0vs60
	wCi6pqJ235TdwTzGYdAHOt1ysb9IP8ASFGmPjuXXt+PplCu2FeOGSo1fIiF5uxrdHhKlkOBedBE6X
	Ek8yG+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ko7-00000008XsO-1vOf;
	Tue, 22 Apr 2025 21:05:31 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KmE-00000008Xh7-2hZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 21:03:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ML3PC42106738
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 16:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745355805;
	bh=ZKS0/gN4dBFreWXVuJOftMxAtj1ZsfyEUQwImitbTEw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dlb0u8AzqAanDz5qn48rBJUOsXVrOrgjgQQ94APP52zCIRIP+tfCaAYtbfY08zrEz
	 y2c4mwoUtstOgGuKDAQI32WetlAiB3gQiUnJx/q0CafAnvbz05KFYRaav5wqSV15wE
	 mStvJ81TPu36jCYrnKAA8NmFBDj4plo3bZqH90/k=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ML3PXX075601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 16:03:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 16:03:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 16:03:25 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ML3Ox6073564;
	Tue, 22 Apr 2025 16:03:24 -0500
Message-ID: <d271122d-fabb-482f-b5ac-35af56de32f8@ti.com>
Date: Tue, 22 Apr 2025 16:03:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add ti,suppress-v1p8-ena
To: Ulf Hansson <ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>,
        Adrian
 Hunter <adrian.hunter@intel.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Josua Mayer <josua@solid-run.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Hiago De Franco
	<hialgofranco@gmail.com>
References: <20250422204413.272679-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250422204413.272679-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_140334_779686_BE305195 
X-CRM114-Status: GOOD (  14.65  )
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

Hi all,

On 4/22/25 3:44 PM, Judith Mendez wrote:
> There are MMC boot failures seen with V1P8_SIGNAL_ENA on Kingston eMMC
> and Microcenter/Patriot SD cards on Sitara K3 boards due to the HS200
> initialization sequence involving V1P8_SIGNAL_ENA. Since V1P8_SIGNAL_ENA
> is optional for eMMC, do not set V1P8_SIGNAL_ENA by default for eMMC.
> For SD cards we shall parse DT for ti,suppress-v1p8-ena property to
> determine whether to suppress V1P8_SIGNAL_ENA. Add new ti,suppress-v1p8-ena
> to am62x, am62ax, and am62px SoC dtsi files since there is no internal LDO
> tied to sdhci1 interface so V1P8_SIGNAL_ENA only affects timing.
> 
> This fix was previously merged in the kernel, but was reverted due
> to the "heuristics for enabling the quirk"[0]. This issue is adressed
> in this patch series by adding optional ti,suppress-v1p8-ena DT property
> which determines whether to apply the quirk for SD.
> 

Sorry for the noise. Please ignore this series, will be re-sending with
fixed cc list.

~ Judith


