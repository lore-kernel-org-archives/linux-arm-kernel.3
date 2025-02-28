Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64743C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PewV6vRpzRa7RElNSOhd84R/G4gKTxHnznNidOLuumw=; b=s1IWlEUUbkRoYxnFsJWDQJC2ru
	ChQ2ySQ9zHsJyurdo/5mZFzRS7jWCLdxv1jQ6cgtOx9FmzJwUQktE4KK70WAp411vV6fcD4dQC6lG
	j1udj+YvQPt10psZHvSpCj91veX5qOXyygT1uQjrjR6ZAwhmLLfrAOXXCxKrCcmOEWQc+r0s4ZgWM
	98VniLYxBG7A0x8WnGZB71ezu57YAFA+WrgG1TFM1BEd/IZOHyVxw1Q58vOaH/+vOOxhhKU0pSIqp
	wy3Ih2FEzJGxiijB/6KDs9fQQVmu2nqjp4OcyRmXgU9B99beSGyc6/QH9yJOGbzDNsnLy9BYfNMou
	i2x+sNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzTo-0000000AuVP-2OiX;
	Fri, 28 Feb 2025 12:28:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzQX-0000000Att4-0xxg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFCC65C6684;
	Fri, 28 Feb 2025 12:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7A1C4CED6;
	Fri, 28 Feb 2025 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740745512;
	bh=8xUimPw6k9q65+hF485fj/0AqnwZJKhGHir+ktIZLPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+LfRLrw+TXG2vm0sDdtVDrAtD/TQmOeDHr4QC8Whf1R2tJuFBvXnzIycRY2KJF0K
	 z33WOOtp+MXMqPWAm1KMVhF5iQOqQfdtdVft7rT5PsVWQDWTUS88CiIoimBX2Erjdf
	 mZ8AUHJcObU9AdODGCdsOuA0nnli58kvWj/YNM1Q7K8RhECd+BZNgXz1krZzsGnhML
	 7DbB8Uy7zReNcDgDTZ/rpNDuT1vKVnTePpQ9RMXCGRAPzVM9+VBSaIj3KacGC6TvTI
	 dG4jYsZIyOLj2vv153M0Dfiw/RrH7GM8pmpz3DgOrYpqMced1CKUiOMDXHqAW+oAee
	 zZTDI8Iv8OSPg==
Date: Fri, 28 Feb 2025 06:25:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Fabio Estevam <festevam@gmail.com>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: gpu: mali-valhall-csf: Document
 optional reset
Message-ID: <174074550945.2320385.13428412876070691467.robh@kernel.org>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-4-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-4-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_042513_311218_4A5DE16B 
X-CRM114-Status: GOOD (  11.75  )
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


On Thu, 27 Feb 2025 17:58:03 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for one optional reset.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


