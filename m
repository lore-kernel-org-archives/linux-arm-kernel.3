Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E52C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO84XX8BCE09RGL7vusFeXvWbo3XxjZ0CfmZdIWcErk=; b=z7pXgaVIB58aupjRNfy7ipT/XJ
	AjRxxdkIBx5icQa8riIN0l+Ly13SFg/3zMD99gbZFxyy60cPjP89TKYiUl7O98n2nyabLOZGYr5L7
	7F+ggSGHh3koYousBsm4h43bLa7g3uUFGBc+MyUfmv61mHf8XP/n8ZX/AUHUqz4ve80k8ae/jSJOF
	GKh8CCMp9JPNXKxGeko0FCad6IuwkIRuWgvFJwq94Q84cGzxlAm6/KrWS4V77DEIxxFKoKIgWRrrx
	n+aUi0h3wf6GMW1jPZRk9+kTuTj/4E1dVPWKQL/fr2KFHQJTa8nZRE2murJCJ88/aQkRXtaJnIF1Q
	mxsYS3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM07r-00000006xTl-0qjG;
	Mon, 02 Jun 2025 08:02:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM05e-00000006xKY-3QXl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 08:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9D4D5C5A4E;
	Mon,  2 Jun 2025 07:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E2AC4CEEB;
	Mon,  2 Jun 2025 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748851213;
	bh=umrm4OPqCUR6IKXG+EjkwiowxcFgqtY7vo6Ql4O92rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=igZtv5lycita2pdB9vUCKQn5Ot2DDWRDKERLJ/3TdR9WcUbz3l4FEY91MH2aVk7uI
	 edvI/pA8tUlZMo4dAKcfrwiObxreKUQT0dGoA8oDU/N4/zwzLqIBV6A9WnOalg9qkA
	 9EPR9NPgJJxm+Y6DstkM0RFi+VYklNuZlrhde3ulzBaa3/jx2DfjN4CX//Rh/1ynCQ
	 QE+mm77FGxt8gapFwpn9Nnc/FjNo5aLqy45j+oZd8WS5JfZ36OolJe2nDEtG60thsD
	 EqnIqofYBnHtlea6WcL0RlcQyj+Lx1WDsRxAFepYHUySKK/jjNAIBQct6ELQFmJLYM
	 gTbTROOWoxawg==
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v12 0/8] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Mon,  2 Jun 2025 10:00:09 +0200
Message-ID: <174885120812.425793.9126435244511372625.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_010014_902825_FC94A33C 
X-CRM114-Status: UNSURE (   9.41  )
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

On Wed, 28 May 2025 21:22:05 +1200, Ryan Walklin wrote:
> V12 of this patch adding Allwinner DE33 Display Engine support. Just a single change from V11 to add missing documentation for a new sun8i_mixer_cfg struct member, and add Reviewed-by tags recieved on the previous version.
> 
> Regards,
> 
> Ryan
> 
> Jernej Skrabec (7):
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

