Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6880D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odVGvLxAl1AqjQa5uRzsIceJRPumkwebyiUsBzFhSws=; b=s8yaPhU8+R2/yiSa0FeXB/dZ5h
	irMItmDG/tLQ6s7VuGhzeW7hRNuAICjnP+mYdN+VSyv6cALOREhYBqWk2apwMaPFMHTOyIPCWGMbb
	KFv/D+qxtI8qT59GPTkA5DL6GHW7gv3OddKFm9C5DZMBzaHz6TC0Ati5tpVnD9YWvGE9kXCoQ0XPM
	rKvuVi3r/cxcoA9bK0OKtKeV3DkdiLqjvaSqhyXA3YGQH7Tg6WD2HSdqMD3fjBFIC8Llbf/AcE+pb
	ZIQATPsTS/pvsYdX6A32kGCzGDZKdTrYgde/XzeynGAPFdT3B70j3bOGWe8V5n/a65ZKHh5IrNk/Q
	YmnjAyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5S7Z-0000000BOEM-3N9X;
	Mon, 28 Oct 2024 15:57:33 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RiO-0000000BK2I-2fq6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:31:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SFVO3v106856;
	Mon, 28 Oct 2024 10:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730129484;
	bh=odVGvLxAl1AqjQa5uRzsIceJRPumkwebyiUsBzFhSws=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=m+Z7inx1xYlR2uujDEcD4QYPvats6tsStuVo1G0Z27T5TkZWsND+1qU6dJ/pHBVXJ
	 O59oB6iU4xYXMtPqZpTj3QrKi3jqJGdHtfr2k6kLMS1Avtu+NudT529ycwbz1Qo+PS
	 95iYz1SE/tk+qQI0LXoQR8YByVbAaPpwzZfUwOjM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SFVOC5073202;
	Mon, 28 Oct 2024 10:31:24 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:31:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:31:24 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SFVKSq031040;
	Mon, 28 Oct 2024 10:31:21 -0500
Message-ID: <a65e17e9-0055-4e5a-902f-8ee2807a86df@ti.com>
Date: Mon, 28 Oct 2024 21:01:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] arm64: dts: ti: hummingboard-t: add overlays for
 m.2 pci-e and usb-3
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Josua Mayer
	<josua@solid-run.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yazan Shhady <yazan.shhady@solid-run.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240219-add-am64-som-v7-0-0e6e95b0a05d@solid-run.com>
 <20240219-add-am64-som-v7-4-0e6e95b0a05d@solid-run.com>
 <CAMuHMdXTgpTnJ9U7egC2XjFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdXTgpTnJ9U7egC2XjFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_083132_807195_3F5A0BA3 
X-CRM114-Status: GOOD (  13.25  )
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



On 25/10/24 19:27, Geert Uytterhoeven wrote:
> Hi Josua,
> 
> On Mon, Feb 19, 2024 at 4:05 PM Josua Mayer <josua@solid-run.com> wrote:
>> HummingBoard-T features two M.2 connectors labeled "M1" and "M2".
>> The single SerDes lane of the SoC can be routed to either M1 pci-e
>> signals, or M2 usb-3 signals by a gpio-controlled mux.
>>
>> Add overlays for each configuration.
>>
>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> 
> Thanks for your patch, which is now commit bbef42084cc170cb ("arm64:
> dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3") in v6.9.
> 
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtso
>> @@ -0,0 +1,44 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2023 Josua Mayer <josua@solid-run.com>
>> + *
>> + * Overlay for SolidRun AM642 HummingBoard-T to enable USB-3.1.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/phy/phy.h>
>> +
>> +#include "k3-serdes.h"
>> +
>> +&serdes0 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       serdes0_link: phy@0 {
>> +               reg = <0>;
>> +               cdns,num-lanes = <1>;
>> +               cdns,phy-type = <PHY_TYPE_USB3>;
>> +               #phy-cells = <0>;
>> +               resets = <&serdes_wiz0 1>;
>> +       };
>> +};
>> +
>> +&serdes_ln_ctrl {
>> +       idle-states = <AM64_SERDES0_LANE0_USB>;
>> +};
>> +
>> +&serdes_mux {
>> +       idle-state = <0>;
>> +};
>> +
>> +&usbss0 {
>> +       /delete-property/ ti,usb2-only;
> 
> /delete-property/ (and /delete-node/) to delete something in the base DTS
> does not work.

Geert,

Thanks for the catching

Joshua,

This overlay is pretty useless in light of above issue.  I intend to
just drop this file unless you convince me otherwise?


-- 
Regards
Vignesh

