Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11157C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYCdGIX6UIZ2mXOZfI22r/coPeU9+PWBzhiqF45CHNI=; b=HjJiL187DXr3o++0FMLgQBNms8
	Wau83FYNL0J82N+3ayjwcsCwHWlNMzdbmIdk/m3XIYI6yI2DrKgXxHH6mLnbm6pznNbQVxzsoTWUY
	wd9k36yA2CBzkf2kpZ4iyoJSZWyI4BlPTPmePDHy/sT+ZCMza8zXwj6lT3zZd8CorVOsLC/Q+06De
	kptOK3OQrlcW2MvsUny1z/Y1enkhi7QpuJpniOtS6LjOdGdPB8qBkDs5poOppytzmDv8lAgQJBYJB
	E+B4jDeMCWGSQ4BxkLZZ3AocgGtx5fB4TsI5ZKHBNj3eczNbjl65fnsiO/QCX5oQfB9WC3ACyTpHt
	dcz58yTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuB8g-00000002qza-2YMo;
	Mon, 17 Mar 2025 14:08:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAlt-00000002mp4-1l0P;
	Mon, 17 Mar 2025 13:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742219087;
	bh=JVmdQyfU6VNsa3dSvwc3s1VX9bvBvzsEOdDC3T1SiXg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hym0kP32VXeZ9Y8swpAitB2ywPMwWIR5TMF0ZqbdOKyF5ZCGo/j69C8vFQo1klT9a
	 KZHEs1A4efzgf8ekooXaM3aeUER2GS/vKf1xtfCMyT8gLn2hyi1XhAi8Uysd0tUVT2
	 rVeECek1J5hB+k0sg3QHTjhhpOuuRu3bTfbVAMPPYFoPRsv9x1J37Wu9wDPQQr5Jpe
	 z+c73PZyXXL/SkZyTRx0vxSLu0QzAOt9xqM1toDpL1KMUnFhiKD4nh3QXhsSk+aFmh
	 joKJC3NpkTf0DWN0JcVyed1m9YzGiY7avd49Vu1INRQ+CtF+ZuFK/l5k+kPP83q1Us
	 enqrkhPs5W1KQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91ADA17E0899;
	Mon, 17 Mar 2025 14:44:46 +0100 (CET)
Date: Mon, 17 Mar 2025 14:44:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
Message-ID: <20250317144436.2bcc17ed@collabora.com>
In-Reply-To: <20250317124044.16257-5-ariel.dalessandro@collabora.com>
References: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
	<20250317124044.16257-5-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_064449_642667_2E3AD208 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

On Mon, 17 Mar 2025 09:40:42 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
> +				  enum io_pgtable_fmt fmt)
> +{
> +	struct panfrost_device *pfdev = mmu->pfdev;
> +
> +	switch (fmt) {
> +	case ARM_64_LPAE_S1:
> +		return mmu_cfg_init_aarch64_4k(mmu);
> +	case ARM_MALI_LPAE:
> +		return mmu_cfg_init_mali_lpae(mmu);
> +	default:
> +		/* This should never happen */
> +		return drm_WARN_ON(pfdev->ddev, -EINVAL);

This won't return -EINVAL, but !!(-EINVAL), AKA true. We should do

	default:
		drm_WARN(ptdev->ddev, "Invalid pgtable format");
		return -EINVAL;

instead.

> +	}
> +}

