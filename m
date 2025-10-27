Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61805CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFyTNoE2X2hQrZXZgQ1MBu5TC8MY83aQCzpJALZfkd4=; b=TAK36kVletYugvSKKxZN/KjvGf
	vBKQj0Gn182XBFjsTSVC7jO+t9Jo6pUNns3AJGdpfC0qe1ieFEnO0/0a9Mu1Dg+p/Uy/k+U6Rtr2S
	C+gKR2ZevM2ZYU4MS7wDKRlyOSDmREWOFuqwLLldYRJDXEvEz8hcpuAB61+a3eFgBMoxuuPZgmLCO
	Vzvlch54l0cdptyZriKxEPy+8tPbwARgy6AdVkTcVDtv7Up+MRTpTI8EUdlPD6oO6W0HMD1JIYAqY
	V9pnS3PGPjHNoo2qFub76vwcGbMKr3M9c0pLsSZMpjiHkv43FL1jtmNSE51HEozhGddc4Ya8dtpWC
	qMR0QPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRQK-0000000EUgz-3LNv;
	Mon, 27 Oct 2025 17:54:28 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRQI-0000000EUft-1lhd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:54:27 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RHrssW2479401;
	Mon, 27 Oct 2025 12:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761587634;
	bh=gFyTNoE2X2hQrZXZgQ1MBu5TC8MY83aQCzpJALZfkd4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DfT9TLL1J4E5CSALY/kZQMoepMNVcrZdFJ8G15x4Q9Um4UiFHL4anwgTSzoDcKX1P
	 2AOpvzY1e81vSYXz2PEnEreCy/rByPtzdWqPFQattLfXetkj1E4vOmFbyZxBqFzc6A
	 HnYhVaehSyU5gmGxes8Pgh7UejjHh3LcA0DPOZgY=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RHrrD81816199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 12:53:53 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 12:53:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 12:53:53 -0500
Received: from [10.249.128.221] ([10.249.128.221])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RHriYB1061461;
	Mon, 27 Oct 2025 12:53:45 -0500
Message-ID: <dcf71d6b-f453-425f-a49e-2408d0caad20@ti.com>
Date: Mon, 27 Oct 2025 23:23:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/tidss: Fixes data edge sampling
To: Louis Chauvet <louis.chauvet@bootlin.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Sam
 Ravnborg" <sam@ravnborg.org>,
        Benoit Parrot <bparrot@ti.com>, Lee Jones
	<lee@kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, "Thakkar, Devarsh"
	<devarsht@ti.com>
CC: <thomas.petazzoni@bootlin.com>, Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ti.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <stable@vger.kernel.org>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_105426_559621_9749E0B9 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Louis,

On 30-07-2025 22:32, Louis Chauvet wrote:
> Currently the driver only configure the data edge sampling partially. The
> AM62 require it to be configured in two distincts registers: one in tidss
> and one in the general device registers.
> 
> Introduce a new dt property to link the proper syscon node from the main
> device registers into the tidss driver.
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> ---

We are planning to re-spin the series with a v2.
If you have any concerns please inform.

Regards,
Swamil

> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> ---
> Louis Chauvet (4):
>        dt-bindings: display: ti,am65x-dss: Add clk property for data edge synchronization
>        dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
>        arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
>        drm/tidss: Fix sampling edge configuration
> 
>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       |  6 ++++++
>   Documentation/devicetree/bindings/mfd/syscon.yaml          |  3 ++-
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi                   |  6 ++++++
>   drivers/gpu/drm/tidss/tidss_dispc.c                        | 14 ++++++++++++++
>   4 files changed, 28 insertions(+), 1 deletion(-)
> ---
> base-commit: 85c23f28905cf20a86ceec3cfd7a0a5572c9eb13
> change-id: 20250730-fix-edge-handling-9123f7438910
> 
> Best regards,


