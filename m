Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C10C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBfsTn/XfwMlZZdSGlyt4wB89d7wRqfVFiOSfo7+xO4=; b=R8fKtJKeCcEwS3gaDOQLvLinDA
	VtmZCAY714kQ0zebiZyCh3mbO8Kke1Y7hQ2jlVW9DBJ+Nz+QlAD+gVLRilUCJVbKye7kgHlwTtZ5O
	mD/Lckav++S+Q0nOXlFH25wCNi2JA/HJ7kpqtGac+pnIEFIINBwD8yWnk2pxLCitsCKEJWmSjeis7
	1kq7Nw6poCl9Clm4+CK9ckCdkrmYAgLUp4JfNGxYVzdhVI3ChTwA+Cuqp+pNCfB3NJ/uyI0Xi1v1s
	ikJqE4mbT98+FHnX+9eukLdVNIJ/bdY/z8JfZXIoKOO8JAqyEHkm8ewUGlqrOqSr48fmXB2G8FHl1
	62iKOyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkux-00000003hDj-2z1A;
	Mon, 24 Mar 2025 16:44:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkiU-00000003emx-27Sb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BA275C6287;
	Mon, 24 Mar 2025 16:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7F0C4CEDD;
	Mon, 24 Mar 2025 16:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742833917;
	bh=o3I1e5fW/j1ECXyCGvpQUQbB9Bbur37HOh3CsImYTnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZHNRmw74+ekrr0zxkkjseLuXiaqsD5WNVYWDlcI2/bERR6y0T+HFDCtn1gYK4Ak1
	 JLgmb+VfUQyuiudy+XqUgBqrY99obqIb1gXHBeZ7Vm4P1A2hCx4JChnCMse4xZv6pn
	 C09EgkVkJDDWA+BMEvCEv2rdApQY2WmQgBJeIoTm128OY8pPrXSQsuuajAiD6x7sk1
	 EeXRLoT0MwEsTyn+X9xVsMJOeIKumvB10uvHaf8MgClykEqhM8glRYeJ+AHy2pWMRW
	 jDPtC+ZiSsugV4gkgccUwYggW3q+Snk2Lj1da9O9lTV8l3+DmGRS1GUQywaO2E6MiC
	 Je6dvOdLxbz0g==
Date: Mon, 24 Mar 2025 11:31:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>, David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/9] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX95 support
Message-ID: <174283391598.303728.5865660880555702267.robh@kernel.org>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-8-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321200625.132494-8-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093158_583986_AA3BEFCB 
X-CRM114-Status: GOOD (  13.69  )
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


On Fri, 21 Mar 2025 21:05:57 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
> 
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
> V2: - Add RB from Frank and Alexander
>     - Make resets: mandatory on i.MX95
>     - Switch from fsl, to nxp, vendor prefix
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml    | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


