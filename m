Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92710D3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9RHv1s9fRZ1l/E0wCeEXv4fppRhjYbx9rteeeM09nk=; b=iWHnyXAYtOqi8wz7hFzLbD7CFT
	Tx/WNUyF2Y7gy7Ppm0czwo8XsNvG824EbluBgp00W+KqJSbYXCqb4A0Ie/yYv0/MAkeQNVso68PzG
	MUJbyuhVW5P+BPMPRj/z/97VVgoZE0QgTV0yvRZjjOkzXSSgys3Lwbql+WewYZjAYEVfmK0N4aTHA
	ArFz+HJ29neOi/d7Eo9QUM1+LmUllv/j6tHS2tDCfN9QrIwU5d/xUTuH+37I5h9NumlcPXGwacp0V
	PoqaZvv2xhB0ejUM7wM1ZDu6Sqnk5t7c3pMn3RuvGJFMY1ewXaHTx7LERM1J1M5EMQOnsImu0pwv8
	gS5P3XHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q9O-0000000FInc-2faN;
	Tue, 29 Oct 2024 17:37:02 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oiy-0000000F3g6-2QBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:05:42 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCOSNf022762;
	Tue, 29 Oct 2024 17:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	A9RHv1s9fRZ1l/E0wCeEXv4fppRhjYbx9rteeeM09nk=; b=Hzt5EAsS/nPCClIH
	8LVAmJrvfFnKiuZA/gyJj6cmzvP6tzNHtprkmpNaiO7nmmnccsA8heza4pC/pdcM
	CQtj7XFDbxeyjy+hAXrLc4hJAyDGokdWjHGgacFBoSvlOUOqtgi9KtHkuZuFABWI
	U9lOkdgC/lWEwCLF3zIWmbod6c9AiyRcyrlI76l4iI0EkZ+ommEZpZyaL3W4SCPs
	dOHe1TYaQpXfGVp3sBzQwoS9CMbHSrDpL4kM2f+2Byj3HNYLoFGpcHZG1s35kete
	zJuCAUfD+AhzzPBIWCG4uOj7h0rU2+yeBXh+ezMKsCOOx40SltfmNBWEUe8LUq9Z
	Z2hY2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gnj4frmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 17:05:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 46A1740044;
	Tue, 29 Oct 2024 17:04:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E12B726D0B1;
	Tue, 29 Oct 2024 17:02:45 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 17:02:45 +0100
Message-ID: <a4bf6356-700f-4646-9867-ade436341812@foss.st.com>
Date: Tue, 29 Oct 2024 17:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ARM: dts: st: add WLAN/BT on disco boards
To: Valentin Caron <valentin.caron@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>
References: <20240827140455.345086-1-valentin.caron@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240827140455.345086-1-valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_090541_157086_3F20FC73 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Valentin

On 8/27/24 16:04, Valentin Caron wrote:
> This series enable WLAN/BT module on stm32mp1x discovery boards.
> Use LSCO from RTC to supply 32kHz clock to WLAN/BT modules.
> This is done by selecting "rtc_lsco_pins_a" in the WLAN pinctrl node.
> 
> And also add RTC nodes on stm32mp25x to enable RTC on stm32mp257f-ev1
> board.
> 
> Christophe Roullier (2):
>    ARM: dts: stm32: add support of WLAN/BT on stm32mp157c-dk2
>    ARM: dts: stm32: add support of WLAN/BT on stm32mp135f-dk
> 
> Valentin Caron (7):
>    ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp15
>    ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp13
>    ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp157c-dk2
>    ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp135f-dk
>    arm64: dts: st: add RTC on stm32mp25x
>    arm64: dts: st: enable RTC on stm32mp257f-ev1 board
>    ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp25
> 
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi   |  7 +++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 52 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   |  7 +++
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 51 +++++++++++++++++-
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  6 +++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 10 ++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  4 ++
>   7 files changed, 136 insertions(+), 1 deletion(-)
> 

I applied the series by removing patch[9] as it raised a build issue.
Furthermore, the pin pin configuration in patch [9] was not used in a 
board, so no need to take it.

Regards
Alex

