Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E1EE64039
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 22:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Rh3LO8bqPl+/ohAPK4jPsOy54AsIdEjBGcFAnaoX30=; b=txK0fhmNQsh5db/Y8nxh7XpyPr
	eXj8vftIJ80OYTPwH6ESUUNd0AwzrNDSjA8uHwNOG0QvhTWehA29MjvGzL3OnAhX6tqD2Axl74diR
	L5JilWh8eY6H3LmIRBeG4XFhryFNwZH3u5IBd/cqtqneCFf8m0BWLL4YnOp8wbZ6Ev5MerdUttO8Q
	p17E9q1UZxVOuut6zxVzqUcR0RIwdtf9JowyncUIpmP9paNtXvgyvX/CjpHROrQaHv6N/UxzLqlw1
	3WoYBC3+vRhA2O/nV9NNT/OmcUYeVm4uj4UCQvFo8Ykr92nQpLNIlHICmByujXOHIrKPYiyspi4dP
	mNOdtA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEFyl-000000016My-0f0Z;
	Thu, 21 Nov 2024 22:48:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEFxl-000000015y7-09sb;
	Thu, 21 Nov 2024 22:47:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 115855C1AC4;
	Thu, 21 Nov 2024 22:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7F0C4CED1;
	Thu, 21 Nov 2024 22:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732229267;
	bh=7Rh3LO8bqPl+/ohAPK4jPsOy54AsIdEjBGcFAnaoX30=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kr6SfjelJOok2BAk5NttJJeRSCSP9LIRA2nnQ6AIHRy40vBdokk4vG6cYfgaqxbm1
	 /MvRM9u5364nRdRVDJQaBD11YvDTsQYU/Pyyk2+EeFByqxKGKVDSMoykEKD231zHBM
	 fo7tjbm//Zc7Gu9o2EJQ8qiCath8hV9t3mwFKxWqSuKL2GvK+U/dt/A1wtfEZ9dZH8
	 WQTSNdC/6Uq9wXdPju688Tf/uYkojnK8xHJpEkrht9O42ZfzO0ij/BkfytoGXDUmHK
	 86a2Mc/cDMw2tnH7MDV2wflzWpm41FYJZnjN+RiJj1TiNZI60IteAjvPPw86k7CgSp
	 MyiJ1i/fYzykg==
Message-ID: <1cbb46bd59a85c0eb0b2e8319bb7ec63.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241023-drm-vc4-2712-support-v1-34-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com> <20241023-drm-vc4-2712-support-v1-34-1cc2d5594907@raspberrypi.com>
Subject: Re: [PATCH 34/37] clk: bcm: rpi: Add disp clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Date: Thu, 21 Nov 2024 14:47:45 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_144749_155216_4AA84262 
X-CRM114-Status: UNSURE (   8.41  )
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

Quoting Dave Stevenson (2024-10-23 09:50:31)
> From: Maxime Ripard <mripard@kernel.org>
>=20
> BCM2712 has an extra clock exposed by the firmware called DISP, and used
> by (at least) the HVS. Let's add it to the list of clocks to register in
> Linux.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

