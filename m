Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78505CCF9E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ITcHTlrm3kX+LD6C+sylaX9MmujOF8phbcUMbMEiBo=; b=wIFKBgOBH7wYLfDMpxeKbAINPr
	UKPvIVgINYmnoXbZAaiWIxJUSgpZdmlNGy05Y/h2vhIQmn+MT3BgZ9MtyhRK42dj7aAP/drG9rrhj
	DHi0IBblSFVZijiVtnQfCp5zboCOQzSrOQIATANZ34tqjysSI63Z3arsUu15tB3a8wOzMo4lC9teu
	PWA4quhBNTOPOU6ZFT7YlPwRl56D3h7zI+J5XBc68DjYgPIisgPZla0srqGpnVOtKa2S6yQq0acBA
	7+ej6KtFKukrrDt9OoV4W3yYIf+jqNIuJNnW5BZiEm+lG83gP12GfnJyMDc+S42Kr5pa/jvWL6Upu
	RCdIsjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqeV-00000005Xlo-1KJx;
	Thu, 23 Oct 2025 08:26:31 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqeS-00000005Xl6-1Tvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:26:30 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59N8QJIk486628;
	Thu, 23 Oct 2025 03:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761207979;
	bh=8ITcHTlrm3kX+LD6C+sylaX9MmujOF8phbcUMbMEiBo=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=C9v+ynXOXmMHKsDt4CsxCVhBlE4/0BKIwINqcu8lDseGOUR3UylEj9FUfHtyRji7C
	 X3vM2t/UaUb3RM0F9CVb6+GnMUnw/xLxbCw6UohBTjEZXjnFvUDG2LKrwcrdGS8EuD
	 8hOAEKbXRK6LP1gWh6wuwI1DHM+kMpZM4F6G/mig=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59N8QJuu2991195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 23 Oct 2025 03:26:19 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 23
 Oct 2025 03:25:49 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Thu, 23 Oct
 2025 03:25:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 03:25:48 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59N8PdJ32560624;
	Thu, 23 Oct 2025 03:25:40 -0500
Message-ID: <e7aba180-5064-4b1e-a011-8e48c5cf3083@ti.com>
Date: Thu, 23 Oct 2025 13:55:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
From: Beleswar Prasad Padhi <b-padhi@ti.com>
To: Hiago De Franco <hiagofranco@gmail.com>, Andrew Davis <afd@ti.com>,
        "Nagalla, Hari" <hnagalla@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <jm@ti.com>, <d-gole@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
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
        Max Krummenacher <max.krummenacher@toradex.com>,
        "Stefan Eichenberger" <stefan.eichenberger@toradex.com>,
        Hiago De Franco
	<hiago.franco@toradex.com>,
        Diogo Ivo <diogo.ivo@siemens.com>,
        Li Hua Qian
	<huaqian.li@siemens.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Baocheng Su
	<baocheng.su@siemens.com>,
        Benedikt Niedermayr
	<benedikt.niedermayr@siemens.com>,
        <regressions@lists.linux.dev>
References: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
 <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
Content-Language: en-US
In-Reply-To: <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012628_504229_4AB8E9DB 
X-CRM114-Status: GOOD (  15.12  )
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


On 21/10/25 14:33, Beleswar Prasad Padhi wrote:
> Hi Hiago,
>
> On 20/10/25 19:47, Hiago De Franco wrote:
>> Hello all,
>>
>> After commit 1d6161617c10 (“arm64: dts: ti: k3-am62-ti-ipc-firmware:
>> Refactor IPC cfg into new dtsi”), suspend-to-RAM stopped working on
>> AM62x.
>
> The above commit is only refactoring changes and should not
> cause any trouble. I think the commit you are interested in
> should be: a49f991e740f ("arm64: dts: ti: k3-am62-verdin:
> Add missing cfg for TI IPC Firmware").
>

<snip>

>
>> Do you have suggestions on how best to fix this in the driver, or should
>> we consider reverting the DTS change until suspend-to-RAM works again?
>
> List of suggestions/solutions in order of preference:
> 1. If no intention to enable IPC on rprocs:
>       Do _not_ include k3-am62-ti-ipc-firmware.dtsi
> 2. If intention is to enable IPC on rprocs:
>       Make sure rproc firmware is available in rootfs.
>       rproc would boot up and consume the mbox
>       msg, suspend would be successful. Tested this
>       on TI AM62x-sk with commit 1d6161617c, works
> 3. Add support in mbox driver to flush the pending
>     queues.


Posted a RFC version for #3:
https://lore.kernel.org/all/20251022102015.1345696-1-b-padhi@ti.com/

It still has open questions regarding scenarios with
FIFO firewalling and supporting existing OMAP SoCs
which could restore context upon resume.

Cc: Andrew, Hari

Thanks,
Beleswar


