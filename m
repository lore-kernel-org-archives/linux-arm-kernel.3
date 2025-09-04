Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EFBCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XViZ7K4qUIDoQ+R0DNxwBPH2Ie9zst4zMX81EjLVreE=; b=y4DOJl6hhS/QE4lqgQi4Gjx+x4
	SjXNZc7y7Oslafnck7X+uFgkzdAhP2JABY8jM6myuFgAVPa32wFSB0i9A7Jc/ruU51g8UYpyY71Dv
	gSs97II8hwo5StoCslFbd8VDVDairNHYLsuKuOkZahwxxyuuL41Mxbb9UyUV7nkhRL9aI0xNGhf6G
	xXLgb1jrx+WDityJiCbqusNgXGDO/yudO3efhWBxJB/3FQ9IbtwsvM5LwaqY7kVkpkcAC/QRddF/s
	EYhFknqhM9ZYf7Pp5KN0Twx/p2wppxEjescZdWFqBrkJfDtWuAZgRU+e7JzJ+GPgmwUyVl5MrwrtX
	WbRMeW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM33-0000000G1gR-2SUb;
	Fri, 05 Sep 2025 02:19:33 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGlT-0000000EKyp-3UtL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:41:08 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584KepBk3595659;
	Thu, 4 Sep 2025 15:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757018451;
	bh=XViZ7K4qUIDoQ+R0DNxwBPH2Ie9zst4zMX81EjLVreE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ptTOBHWt/JWN/jXCAdnAvShJZj5EA/1fBWY56d+Ab7GX7zbZotqkTEKu7Vd0GjZEb
	 OngvCoFOuqN3Izm3HTkrxPZ/UN5Ul/rXTJV+1ETYarkWNlyCGHQVxkPSHm1lTOGkY7
	 NLTgWpiAxKWpQ5BZpfST2qg+sVGGCpyv2A1LKlwI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584KeoJN379192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 15:40:51 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 15:40:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Thu, 4 Sep
 2025 15:40:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 15:40:50 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584Keo8e3561056;
	Thu, 4 Sep 2025 15:40:50 -0500
Message-ID: <8fea9d7d-faa0-4e51-b7a5-e17a945bf1ed@ti.com>
Date: Thu, 4 Sep 2025 15:40:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/33] Refactor TI IPC DT configs into dtsi
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>,
        Parth Pancholi <parth.pancholi@toradex.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Logan Bristol
	<logan.bristol@utexas.edu>,
        Josua Mayer <josua@solid-run.com>, John Ma
	<jma@phytec.com>,
        Nathan Morrisson <nmorrisson@phytec.com>,
        Garrett Giordano
	<ggiordano@phytec.com>,
        Matt McKee <mmckee@phytec.com>, Wadim Egorov
	<w.egorov@phytec.de>,
        Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
        "Max
 Krummenacher" <max.krummenacher@toradex.com>,
        Stefan Eichenberger
	<stefan.eichenberger@toradex.com>,
        Hiago De Franco <hiago.franco@toradex.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_134103_976643_D393AB7D 
X-CRM114-Status: GOOD (  18.32  )
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

Hi Beleswar,

On 8/23/25 11:08 AM, Beleswar Padhi wrote:
> The TI K3 SoCs have multiple programmable remote processors like
> R5F, M4F, C6x/C7x etc. The TI SDKs for these SoCs offer sample firmware
> which could be run on these cores to demonstrate an "echo" IPC test.
> Those firmware require certain memory carveouts to be reserved from
> system memory, timers to be reserved, and certain mailbox
> configurations for interrupt based messaging. These configurations
> could be different for a different firmware.
> 
> Refactor these firmware dependent configurations from board level DTS
> into a dtsi for now. This dtsi for TI IPC firmware is board-independent
> and can be applied to all boards from the same SoC Family. This gets
> rid of code duplication (>50%) and allows more freedom for users
> developing custom firmware (or no firmware) to utilize system resources
> better; easily by swapping out this dtsi. To maintain backward
> compatibility, the dtsi is included in all existing boards.
> 
> DTSI vs Overlay:
> 1. I chose DTSI over overlay as both the ways required including the
> refactored file in existing board-level files to maintain backward
> compatibility, so didn't see the advantage of using overlays here.
> 2. If we do down the overlay path, existing board-level file names have
> to be changed to indicate they are without the IPC support; so that
> they can be combined with the overlay to generate the same-named DTBs.
> For example:
> k3-am69-sk.dtb := k3-am69-sk-sans-ipc.dtb k3-j784s4-ti-ipc-firmware.dtbo
> 			     ~~~~~~~~
> 
> I am not sure if this renaming of files is ideal?
> 

Thanks for you patches, I was able to boot test on am62px SK and
am62ax SK boards. I was also able do a simple rpmsg echo test with some
additional patches on top of your changes:
https://gist.github.com/jmenti/4ae7a6a65c2cb95fd54f48d32430c1e9

so for am62ax and am62px SK boards:

Tested-by: Judith Mendez <jm@ti.com>





