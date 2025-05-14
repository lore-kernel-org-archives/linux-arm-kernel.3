Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B8CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuCPZYVkQiljxG/MqaxrpuvBy51W2PCTsxHW/qVqNCc=; b=NjjPBbw3wpHN/D2lbYczxhrf4w
	RHxhSLw0v2TQN5FWL7dqMyo6pho/i4jnkmyvnn0RH6WoRHPl+KY64BX5PbKoUSzAwUgop+i9W6sy5
	WLCb5vTE5+E00uh7x64cE47wGv+OuYyNIa77ZVPPV5iK/NK6RRvzc6Vzwy+fWd52zorInTI/us601
	CUJAnZ2d4nFnNG+E22bisxzY/AbUtEIZjn578gxIp5D6wNJrqDUJ9EOan4CT6OYijL36cf+ypPEHo
	nR+8OlNz4x+mSPU+fSXEX3JqJUfSmx8ejMSh7Qb8zmc9jNky230kai2Z+iu2pjKwRsE6MkNxExYQL
	2u5CkKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEFQ-0000000FczD-1kje;
	Wed, 14 May 2025 15:42:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDiL-0000000FWWP-2Gup
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B174F5C626E;
	Wed, 14 May 2025 15:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0EFC4CEE9;
	Wed, 14 May 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235288;
	bh=FwP8uryXOsUK+TKg53CoKmdnuxln2EK5xDiRjRLSGZI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fuXPIW9/1iuCaAuWi6VNcHOkDoB306E14Fn2sjd4B0pwxFNwPbPEdIOs2/vRlAT2C
	 HxqyMfLwPgK06uYzoPSHWyPHlM87EZPnuH41UzxbrypLU005mSIO/F2/fH4GGnLBgM
	 Dpv2kH09qWBsF/fTxi4sIlhmrhfAFUF6zpYnrACIHbkNXLUvzqbM/BVYU+R5IG4sFf
	 YXn98suvuLuOTm3geIRQd2fo9fIO7PJclsl1NObGC78/XjKa1fbDOI/0ZtTbhiHTjm
	 ZjOZUC+Z1u2xC66O8TzbRAaaDRhcHzgJVyc29vJXsAP+/l1V89I4Q6bxRYPQfkOdP7
	 79c1XND+SFiKA==
Message-ID: <8d835eecfcd7d7b4ef88d06b7bd9ed21@kernel.org>
Date: Wed, 14 May 2025 15:08:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 04/11] drm: sun4i: de2/de3: use generic register
 reference function for layer configuration
In-Reply-To: <20250511104042.24249-5-ryan@testtoast.com>
References: <20250511104042.24249-5-ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Hironori KIKUCHI" <kikuchan98@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Philippe Simons" <simons.philippe@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080809_623626_4EFC1B8B 
X-CRM114-Status: UNSURE (   6.79  )
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

On Sun, 11 May 2025 22:31:13 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Use the new blender register lookup function where required in the layer
> commit and update code.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

