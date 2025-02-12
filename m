Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C3CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad6XIFFCyVCNa12sN15rD1nz4r/oJ+vFXthIAAa8VkM=; b=svcuWI+QLBNacrIOvFDqlh3VQh
	v8Odn9rTJpOAxc5hIU+46soy4Uzpm1ZDUrh/lScRcrK3DER9BVYiM+FhGl9PHbydbkX38M/Mi5HX3
	34sXc9asSmysIR8WFAdUetdvxfc3smYreHapvTW35qP8ZDxZJ0AIrRmtEmenAODHVamoQWq1ZQo4L
	vyZ29TFOEass/FnGdBnczEwOl2HGvbzM1HOSU7bxCbskOc8hDCp6c0fP40aecSa6lWhWkV57jAgs9
	eLRtZa3QZO7d+dCWRl9aQ+BnB/luDqWxYq9BRIS0vrbmFAZGIrf8mMdOxVKPNcYj0uoEgUH/3q80a
	6AkxVz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIrn-00000008iJZ-1e6a;
	Wed, 12 Feb 2025 19:57:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIqK-00000008hsy-3KKC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739390178;
	bh=+sniyVR/B0Yb/z8XD0mdxMuslgA/Q7KL56k8Ile7nZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B96uFBg0BHhPOJvShbkADmFq5biDN9hj5Rox1Fr1rFqsdvJ3kl4eDTGXrogGQsFNX
	 t3fltvwSsY/s66iEaMaBKFBMWWDMKmbXGslowtM/eaB0OELNOphCO2QLH1cdCcUdWt
	 0GS8bs4kuAjQUTsZMBHwutDcZgq4LHED2RUrL7PhUNJNA8W/Py9+88KFCNDPiYxrch
	 QftG37m17MTm2ZtlSRTTIO3QBUXrtqPI2dCyxQO3z3iWzKYeUB9NNmmrgV+qCJH1az
	 eEohsKEBHzMlVlyuuXzRz4oNQSCpRbiWyr7Wq0FWa0U9kYQ1YN8nOy1UY5TyaMEIQi
	 JGRsF58P2DDLw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B46F117E0E9E;
	Wed, 12 Feb 2025 20:56:17 +0100 (CET)
Date: Wed, 12 Feb 2025 20:56:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Garg
 <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <20250212205613.4400a888@collabora.com>
In-Reply-To: <20241217100809.3962439-1-jens.wiklander@linaro.org>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_115620_990139_2C857606 
X-CRM114-Status: GOOD (  17.35  )
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

+Florent, who's working on protected-mode support in Panthor.

Hi Jens,

On Tue, 17 Dec 2024 11:07:36 +0100
Jens Wiklander <jens.wiklander@linaro.org> wrote:

> Hi,
> 
> This patch set allocates the restricted DMA-bufs via the TEE subsystem.

We're currently working on protected-mode support for Panthor [1] and it
looks like your series (and the OP-TEE implementation that goes with
it) would allow us to have a fully upstream/open solution for the
protected content use case we're trying to support. I need a bit more
time to play with the implementation but this looks very promising
(especially the lend rstmem feature, which might help us allocate our
FW sections that are supposed to execute code accessing protected
content).

> 
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> restrictions for the memory used for the DMA-bufs.
> 
> I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> how to allocate the restricted physical memory.

I'll probably have more questions soon, but here's one to start: any
particular reason you didn't go for a dma-heap to expose restricted
buffer allocation to userspace? I see you already have a cdev you can
take ioctl()s from, but my understanding was that dma-heap was the
standard solution for these device-agnostic/central allocators.

Regards,

Boris

[1]https://lwn.net/ml/all/cover.1738228114.git.florent.tomasin@arm.com/#t

