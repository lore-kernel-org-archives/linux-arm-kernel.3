Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84FCC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yVfkbBACBShGXdAU662j/G0SBg9Yu+9dij18nL3NxE=; b=z7UUtdcTAlARQ2PHF44763Kzmx
	JDpEjOLblzayR+0cc34zKsy0yeGKMGxFFkpy6cVM7r+KdI0dkFwcGEYbFyZmCtFFJeeWoAeF8O1wN
	McCY7ObFLF2NMsEFeDVsRsHlOb7by9XeDpUtT2sI5Y4ynwjvz3cgnIBofLTQnmgXw3qsVRy+V2LNl
	LCP996jpXWm412WMB7peJT9nrEMmWZNFE0/dDuSTfwSFILFjbF2IWfpDzBXpyyYP8JNWYCajydV22
	wnYj0jcJb1dRQ+Vlst6dmowiYPnXQwX9SVhYdBioy4gRdmNtoHtNGUqv0Slwgq0Zl6EWV6x9c+Yw8
	9CRA5xaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoLX-00000003WZO-3jbn;
	Tue, 11 Feb 2025 11:22:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoK7-00000003WPR-0kGC;
	Tue, 11 Feb 2025 11:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739272861;
	bh=uoP1nCCvDBGx8Z7jqAGdTm1hPsk3dkyFnV2/E09V82I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hMrujhFcOZq/4f66dL7dk+b6M2gxuegP3AwaTO8f1n9aKVEgZtlMNnY4Bhx/ejzMo
	 pGydGWXFHnA9dpurrQF5alPZvAbxpAYPoU8StnnR1TnOtC2kRfP0P0HWRkql/TO0D/
	 AO/IjMCit3Ob3tK2swaYdx2cFbxh+ddFXuYpgwwwBd/TLPrl0etaxbXsqx1rZMR+4S
	 qW2a+K82BrOMXpC4modD0gLaLNGAhu1FPLTJcT5saZWCgOb/A7j6w2vZofUsFr1CLV
	 5FdHFaAPaZrnZNYD5X11VJbi2Nzamdxrpz3mFC12cUu6rMtJJ8VrGRjTBAVvRBuD+w
	 85thIsVMvH2Jw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77FD117E0657;
	Tue, 11 Feb 2025 12:21:00 +0100 (CET)
Date: Tue, 11 Feb 2025 12:20:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <nd@arm.com>, Akash Goel
 <akash.goel@arm.com>
Subject: Re: [RFC PATCH 4/5] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20250211122052.3f550650@collabora.com>
In-Reply-To: <20250211120448.3e89e75f@collabora.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	<821252c96ab2ab3e2d8ef211a09f8b171719baaa.1738228114.git.florent.tomasin@arm.com>
	<20250211120448.3e89e75f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_032103_381402_A758B660 
X-CRM114-Status: GOOD (  10.21  )
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

On Tue, 11 Feb 2025 12:04:48 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -9,10 +9,14 @@
> >  
> >  #include <drm/panthor_drm.h>
> >  
> > +#include <uapi/linux/dma-heap.h>
> > +
> >  #include "panthor_device.h"
> >  #include "panthor_gem.h"
> >  #include "panthor_mmu.h"
> >  
> > +MODULE_IMPORT_NS(DMA_BUF);  
> 
> Uh, that's ugly. If the consensus is to let panthor allocate
> its protected buffers from a heap, let's just add a dependency on
> DMABUF_HEAPS instead.

My bad, that one is required for dma_buf_put(). Should be

  MODULE_IMPORT_NS("DMA_BUF");

though.

