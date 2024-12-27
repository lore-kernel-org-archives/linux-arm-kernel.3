Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14911E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAoAQK8wcv61Q4+IYKcN8ei+CcRcG/ZBfFbTeJJeA3I=; b=fqYFQYNzqdb+ZFm3/vMDF++pqc
	LEsG7wmlEIQ/H4kDGOJqUB4c47uVa4eECLlY/wnF3ah4QcTG1DMecYfAmBFtjank8gS8GGf+rKGUz
	zCto1jplXRgKLB7hYI0tew3OIYaKJrYZZGFCayZg2HCgUT7ilwIzoFRLANz0neSU9kXwqDtA7QIRp
	xQ6eeTtTtX4ePdik8ziJ7tSEYHv5uFoFjDTYdIZovpcNZEOkC84pFgAjfDB2gHnVTZgZ+9aqpvyQL
	v76Mn2YdrSTID3XSBd95LZZOe3YUYGelYJeZIPOhUdbcxwhnxxWVTOSMGIVPUeImkHPcwEBuNKE65
	XhPL7HvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5SV-0000000HLHn-1LDk;
	Fri, 27 Dec 2024 08:12:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5RJ-0000000HLAg-3d3z;
	Fri, 27 Dec 2024 08:11:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E0215C61E0;
	Fri, 27 Dec 2024 08:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE6CC4CED0;
	Fri, 27 Dec 2024 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735287080;
	bh=8G7txf5k/NvaNn+tMyyAs7ThOyBVKh4kAWiUg1BC3uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmlntwVNpzXuVe0t0HV1ngHDTaIYGZ1m9coMxg6iE0pZaxIFbM9q/0fUg0LIpTZmj
	 QaaP7Of1u/TqwEBS73IOdCypBx+9IRK2PetOkZ3oUEPM2tw2/UuBVMJwR1jA1Ykjru
	 tSW8YHol78H6cxtb04x3psR9yh+H1eUmV9aJK+oIv9o5L2t4xbJ4XyiWBTxWbxdxC+
	 cGJDOBj4AwLeRo4gOHIm4lFkD7loqGSVqTZkuZATiWtW42PS45MpZgmczhhI8UPNZU
	 WR0oBLz3244e7cfY8ivlS4Mxniyak+YvYmpZ41YBBmIA6L7wMCyRLpMJMTA6RFmeON
	 qJ8fDf2UeLjIA==
Date: Fri, 27 Dec 2024 09:11:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <gfopo2xjqljehbwkrxlf2t3vqwrqi4namh7dlt2rf4bc4ri25k@xm7pawszl4ix>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219170800.2957-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_001121_959397_788334FF 
X-CRM114-Status: GOOD (  16.81  )
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

On Fri, Dec 20, 2024 at 01:07:54AM +0800, Jason-JH.Lin wrote:
> 1. Add compatible name and iommus property to mediatek,gce-mailbox.yaml
>    for MT8196.
> 
>    - The compatible name "mediatek,mt8196-gce-mailbox" is added to
>      ensure that the device tree can correctly identify and configure


This is 100% redundant statement. Don't state the obvious and don't
explain to us how DT works.

>      the GCE mailbox for the MT8196 SoC.
> 
>    - The iommus property is added to specify the IOMMU configuration
>      for the GCE mailbox, ensuring proper memory management and access
>      control.

You should say whether device supports or does not support IOMMU. So all
devices now work with IOMMU? I guess I asked about it already, no
improvements. So again, don't state the obvious.

> 
> 2. Add the Global Command Engine (GCE) binding header to define the
>    abstrct symbol binding to the GCE hardware settings of GCE Thread

typo

>    Priority, GCE Subsys ID and GCE Event for MT8196.
> 
>    - GCE Thread Priority: Defined to configure the priority level for
>      each GCE hardware thread. This is necessary for proper scheduling
>      and execution of commands in the GCE.
> 
>    - GCE Subsys ID: Defined to specify the subsystem ID for GCE clients.
>      This is used to correctly address and access different subsystems
>      within the GCE.
> 
>    - GCE Event: Defined to specify the events that the GCE can handle.
>      These events are used by the driver to synchronize and manage
>      hardware operations.
> 
>    Examples of the binding usage in the driver code:

Drop all below from commit msg. Don't paste C code into the bindings.

Best regards,
Krzysztof


