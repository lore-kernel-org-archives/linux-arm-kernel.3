Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1C0CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=It85YCyY0Z6V3OSHiMm2GKafJoABnoz9EzMpSHJC0Lo=; b=14CA5HN9DjvVqA070OYJMtm3KP
	4kbx/kzAFMGugIIIk5Lv8qTQksxl0+UVbUqhGVfD9cnhGnHBtqWKpIzJ/w9Z8hmDg/q049OM5S158
	sSI7qFnoRvoybpQzug61YbKPZAJkiz04gu/pIRpRqgRd6f6vGIDhAkXzUWFfibfJwg5FwGCsXALY9
	4oHkny6AuAFUMFCHe6WtBMG5wNFaAi8x2/Z7yJNra/VHkXyRfRS/QbkZ/TyAXPH/S+KqE3Wv47CyJ
	lS/k7UpHAzh5d49glXxCOHjqPcpxbiggytcRSPobZhVPswzB5A2cL/tW4DJDi+9NwratO1IIZHhUW
	NhlIMLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu36F-00000009PMp-1T1P;
	Thu, 04 Sep 2025 06:05:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu33V-00000009OV9-3Qhf;
	Thu, 04 Sep 2025 06:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756965763;
	bh=090gkLICbGM7TNk6kExYlvvMe+p36xr/EilWtJfF52g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YbFApHCMtpPV7aWtDBimSagK7GUlxOLsVOhn2efk4y6D7WTKDqaDKNVh2Qw5HJa49
	 YT9K5uzYEUyhQS4tVDJXDUPkez3c6hNvH38OH/cZNvjSnvu7ia4Ij18GA5LV6Nq6aV
	 dkR5BklGOP+AfqjjFFrWhxfvzfXqo76Pd/BqUJsAJtyPWxrIv0x2N1PJvUHzlOrleY
	 wn/HCFCbSnr/lLPiHhxWv/EvkVBbjTFRlzLfvnUDjmh3oNbYKqXK9g1nFX8YYFBd8I
	 L2b6AYtvTLSQAsH+Kj07nc0Q6XsBsZR+CrMse/+ajzchGiixuDRRdt6isiKPzCRsTG
	 nTvYqllWSba2A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A221A17E0EB8;
	Thu,  4 Sep 2025 08:02:42 +0200 (CEST)
Date: Thu, 4 Sep 2025 08:02:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
Message-ID: <20250904080239.779b5e24@fedora>
In-Reply-To: <20250903225504.542268-3-olvaffe@gmail.com>
References: <20250903225504.542268-1-olvaffe@gmail.com>
	<20250903225504.542268-3-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_230246_022372_002D397E 
X-CRM114-Status: GOOD (  12.60  )
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

On Wed,  3 Sep 2025 15:55:04 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 02db21748c125..75e92c461304b 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -12,4 +12,6 @@ panthor-y := \
>  	panthor_mmu.o \
>  	panthor_sched.o
>  
> +panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) += panthor_soc_mt8196.o

Based on the stuff you describe (ASN hash, core mask read from an nvmem
cell, extra clks/regulators?), I don't think we need per-soc source
files and per-soc config options. If it becomes too HW specific (no
abstraction to make it SoC-agnostic), we can reconsider the per-SoC
file approach, but I believe it can all live in panthor_drv.c for now.

