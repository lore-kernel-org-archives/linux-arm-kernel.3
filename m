Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9131C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5XjWlbfsfbedAGp1/mzasFXw6pYZ2EXsAySZsa85HA=; b=eI/obhj7ZBSRPDg3c7rm36GsLY
	S2GKJYnK8PPCowAwcrUtgzuEjbzXZ7qOC/NnmoOElW9UEbMku9/5QBva6wuwr6ldbqkTLIUx/RuAO
	wc86DDLBdBKqGFLM+6CcJACFje96BrZInKlbUnku7rCmwzd/2p7ATebHA9WuQ0h01IOhaoqBjamWH
	TepEwInMvJjMzTUbQtcSj9KFwA2owGphQd8UPyJYtMNAvwluLXFQQiVRktcLIT/snxwbg5c4sKrXD
	eLa6Ngs1mnfYMDLrBXrfvCVyzkf0uT9p+/RLl3F5IVyJsGXlWFhqugAL9Sh+ydz1yxAnhyYUL4WQu
	g6tGWAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMY6k-0000000BmGv-0qnm;
	Tue, 03 Jun 2025 20:19:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMY4a-0000000Bm17-2DPA;
	Tue, 03 Jun 2025 20:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC02F60008;
	Tue,  3 Jun 2025 20:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E28C4CEED;
	Tue,  3 Jun 2025 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748981843;
	bh=yV4ekByytzguS9M+Qf6n8nfcrxTdF0tMI0CZ/FW+ZhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COHJ4WCl7wgYi/p077xcxhMr+c0ECulzW+gv4fS4wPm2p4q7u4MZnD98iq1rKD+em
	 WFFr3W/IsOPLbgashjQK3TtL/CaAUWHvYgvItY+J0Nk/9UQOw1zIdDuasY65jYDvBD
	 xuQG9QjyHYQ/fycBwT9/n72StDDKeNnuBpuLd6JA9lu4ibSfRyQ5STGHCdTVu5uoFp
	 rLOnLO2zdlz9l//CCQTnruR35L602rP83EgxTdgpLBIh3La6ojwmvQ7VS1XmZr7Hdy
	 vsjNh0XF/J/ZOxRGGONIIdFYW4QI2FYApB//Hvt+YHkuO3id79x08lA7lOBc/Qipct
	 g+maGoP328NCg==
Date: Tue, 3 Jun 2025 15:17:20 -0500
From: Rob Herring <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 07/10] accel/rocket: Add job submission IOCTL
Message-ID: <20250603201720.GA2119676-robh@kernel.org>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
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

On Tue, May 20, 2025 at 12:27:00PM +0200, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>


> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..aee6ebdb2bd227439449fdfcab3ce7d1e39cd4c4
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -0,0 +1,723 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +/* Copyright 2019 Collabora ltd. */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/rocket_accel.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "rocket_core.h"
> +#include "rocket_device.h"
> +#include "rocket_drv.h"
> +#include "rocket_job.h"
> +#include "rocket_registers.h"
> +
> +#define JOB_TIMEOUT_MS 500
> +
> +static struct rocket_job *
> +to_rocket_job(struct drm_sched_job *sched_job)
> +{
> +	return container_of(sched_job, struct rocket_job, base);
> +}
> +
> +struct rocket_fence {
> +	struct dma_fence base;
> +	struct drm_device *dev;
> +	/* rocket seqno for signaled() test */
> +	u64 seqno;
> +	int queue;

AFAICT, you are not using any of the elements here. So you can just drop 
rocket_fence and use dma_fence.

Rob

