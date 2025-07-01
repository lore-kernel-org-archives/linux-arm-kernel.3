Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D2EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dj2RXbZ/Tv5yAxHz/6WWadAXm0f+rEasqd5wSxNrNfk=; b=zOwCGGwiPr7xIbhVc2od5psA2s
	XOFYxASNhAcSyshpMchfcbXSzOlsMvjEP+UGILyYatO/SYaLR68DIebOsQxFHnRRnNdvoIgWvku8W
	z+nV7DT8rK4mUjh32tS5b3jIcpVoMC2NdOdjz72GkQRLjIRhDeesj9p81YVgXBMb2M/cM6FvUEV1V
	8qZIwbelAk7RrnXA8cFnl9jGQy3qo68GLD4fypKqF7DyurqB6b9/2iMpMLoLdpFf3+1+xn2188LhF
	QhfyauIrhgdKD0fsiAbLsJ5QgQ42ao9EUXaw9md0AyT5+Y6mMk3eCkacJJq8DErOWgWh8NF4+51cb
	PF9sCp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWh4j-00000006VpT-0qzS;
	Tue, 01 Jul 2025 19:55:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgiY-00000006TnV-22Yu;
	Tue, 01 Jul 2025 19:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Dj2RXbZ/Tv5yAxHz/6WWadAXm0f+rEasqd5wSxNrNfk=; b=COv/WEvLADeJ6fd21KY0S80AoD
	XAN2jdqZDbmJLuHjkwzeQOPC/J+uLnEp4cOPZMr64nMBTTT7O9tyv1Eo5P3D9VzrPR9ii5R68h9u8
	x0wMgRHL8MjOUXKpx0bTeMlN96lBxW0hVtxOE/OolJEMZsQgACj71Dk+raYFqFUv+5Gt3KAdnqG5O
	zQjvfJUL9d9YX9i6ONayuZX4GPHZyO0Ot9qQXBgoQ4iOfk84Nb3DKg+BwfGpR8mQuFu0N7a1Z0iag
	J4Vn9kQA332jEckCkT25MeMr0VHE/7KDpvPcC6ylfJlD/Vwf3GgBc+asJkJag5aiUgs2e71ApfHnG
	sFw0nDZw==;
Received: from i53875bc7.versanet.de ([83.135.91.199] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWgi0-0007Fd-TC; Tue, 01 Jul 2025 21:32:00 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v7 03/10] accel/rocket: Add IOCTL for BO creation
Date: Tue, 01 Jul 2025 21:31:59 +0200
Message-ID: <8888010.K2JlShyGXD@diego>
In-Reply-To: <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_123234_543049_A199B05C 
X-CRM114-Status: GOOD (  17.45  )
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

Am Freitag, 6. Juni 2025, 08:28:23 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Tomeu Vizoso:
> This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
> sides, as all buffers are expected to be accessed from both.
>=20
> v2:
> - Sync the IOMMUs for the other cores when mapping and unmapping.
>=20
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
>=20
> v6:
> - Use mutexes guard (Markus Elfring)
>=20
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>   Stone and Robin Murphy)
>=20
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/roc=
ket_gem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..61b7f970a6885aa13784daa12=
22611a02aa10dee
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_utils.h>
> +#include <drm/rocket_accel.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +
> +#include "rocket_device.h"
> +#include "rocket_drv.h"
> +#include "rocket_gem.h"
> +
> +static void rocket_gem_bo_free(struct drm_gem_object *obj)
> +{
> +	struct rocket_device *rdev =3D to_rocket_device(obj->dev);
> +	struct rocket_gem_object *bo =3D to_rocket_bo(obj);
> +	size_t unmapped;
> +
> +	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);

This should probably be
    drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);

as pages_use_count is of type refcount_t since
commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")

Heiko



