Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7FAC54756
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdIl5ruFle3dZRSvSQf0JxqGm5gQ6Pf3iT7nEU/r+qM=; b=BjoJgRfHwwKwDIhrY9OiT8MRk9
	7LhnP85xIMamo8qhDULrtFsZzkiTQgrhyth2Lvx1U5jj4pcM65UVhqBOM3CIoDvha/KIM6WPsAnsz
	KZBL+UrUThs3EjM80jpFG+CTXyOR4g9hqWpCIWGUNvSJ+E27x0tHuVRj5gr9fOBmGUZMXgxMS5dVg
	7HWoHF6+Pr7JiKXbnBrW9YkUr/6oLUsQIq72gyJCHtWAU+J9NcnkZ8ehQsbE2znqShDXGuibzPHqH
	WX6YxgfM9MIRf2LRgqA5PelnBMXkzfFQPAubYgfP9QQtXhLWOqJLI5eAz+n+nc9NneqOdv1wMQEv4
	HGYkk4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHaN-0000000BsdA-2ueU;
	Tue, 20 May 2025 07:40:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHXj-0000000BsFT-3SPL;
	Tue, 20 May 2025 07:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CF8961155;
	Tue, 20 May 2025 07:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48570C4CEE9;
	Tue, 20 May 2025 07:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726662;
	bh=fVyiR8D7qQA0+vUTgX2LRrLxivKrGYmC1L9B3HBhIp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBCD7X/Ibe+2sYG6xP8sVpZb/vvzfhqkfWycoZsODdRu0VlV9AzpwEbDry/P8F/Ki
	 160DahL5vOyYPwKvMHogsbRJjloc+9RW95QTgbAOYkHGrvyU6pZOIzBMpLDSRvv58+
	 BUnXAyXUkB275DFTYj37RQ48hOiD4G6tZPHThU8pDoh7Q96nKggGXnvCvaWTssLPXy
	 D4Lxnato7ApFWIGCt02TmsNFsgVWDS05ddVMquc+IEx925tVwN1KoOstszxYB9LJSg
	 931bNAa+VGLwHHpB9NalKtr0s4Ta9DlL0WsQCce7tNWGaAiywZjHqBSPLO//shlkOy
	 Xncs2LCkxJUOg==
Date: Tue, 20 May 2025 09:37:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 05/10] accel/rocket: Add a new driver for Rockchip's
 NPU
Message-ID: <20250520-silent-prophetic-cricket-fa0fa9@kuoka>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
 <20250519-6-10-rocket-v4-5-d6dff6b4c0ae@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519-6-10-rocket-v4-5-d6dff6b4c0ae@tomeuvizoso.net>
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

On Mon, May 19, 2025 at 03:43:37PM GMT, Tomeu Vizoso wrote:
> +#endif
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..bb469ac87d36249157f4ba9d9f7106ad558309e4
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <linux/clk.h>
> +#include <linux/dev_printk.h>
> +
> +#include "rocket_device.h"
> +
> +int rocket_device_init(struct rocket_device *rdev)
> +{
> +	struct device *dev = rdev->cores[0].dev;
> +	int err;
> +
> +	rdev->clk_npu = devm_clk_get(dev, "npu");
> +	if (IS_ERR(rdev->clk_npu)) {
> +		err = PTR_ERR(rdev->clk_npu);
> +		dev_err(dev, "devm_clk_get failed %d for clock npu\n", err);
> +		return err;
> +	}

That's probe path? so use standard syntax:

return dev_err_probe(). One line instead of four.

> +
> +	rdev->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(rdev->pclk)) {
> +		err = PTR_ERR(rdev->pclk);
> +		dev_err(dev, "devm_clk_get failed %d for clock pclk\n", err);
> +		return err;

Same here... except that this should be blk API and entire function gets
smaller.

> +	}
> +
> +	/* Initialize core 0 (top) */
> +	err = rocket_core_init(&rdev->cores[0]);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}

...

> +static int rocket_device_runtime_resume(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +	int core = find_core_for_dev(dev);
> +	int err = 0;
> +
> +	if (core < 0)
> +		return -ENODEV;
> +
> +	if (core == 0) {
> +		err = clk_prepare_enable(rdev->clk_npu);
> +		if (err) {
> +			dev_err(dev, "clk_prepare_enable failed %d for clock npu\n", err);
> +			return err;
> +		}
> +
> +		err = clk_prepare_enable(rdev->pclk);
> +		if (err) {
> +			dev_err(dev, "clk_prepare_enable failed %d for clock pclk\n", err);
> +			goto error_clk_npu;
> +		}
> +	}
> +
> +	err = clk_prepare_enable(rdev->cores[core].a_clk);
> +	if (err) {
> +		dev_err(dev, "clk_prepare_enable failed %d for a_clk in core %d\n", err, core);
> +		goto error_pclk;
> +	}
> +
> +	err = clk_prepare_enable(rdev->cores[core].h_clk);
> +	if (err) {
> +		dev_err(dev, "clk_prepare_enable failed %d for h_clk in core %d\n", err, core);
> +		goto error_a_clk;
> +	}

All four above calls could be just one call with bulk API.

> +
> +	return 0;
> +
> +error_a_clk:
> +	clk_disable_unprepare(rdev->cores[core].a_clk);
> +
> +error_pclk:
> +	if (core == 0)
> +		clk_disable_unprepare(rdev->pclk);
> +
> +error_clk_npu:
> +	if (core == 0)
> +		clk_disable_unprepare(rdev->clk_npu);

And all this would be gone...

> +
> +	return err;

Best regards,
Krzysztof


