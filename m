Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4064BC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7lTzRhQ5ZlhyyXnaCjJO03OUDYWwPwK0v/bJp5iw08=; b=U9j6OK4af+AyhHSbQPRtUUu6NJ
	lfBp4MOEEDI7677mGsbN1s7cz8iLzexLsQULCP+VQ3F5tJBr3zebXH3axTHnGIp3C8EI2Ar0xaClG
	9d5C7dXwLYTQOzJRE25DQnDiypLKcwo2hAkqSm70CaK6KywZFWLpFF+1Rcd+tlO145SLuFFPLifnr
	De8rladzgA8W0sNofq7AKomaUiS4giQyGhu1J20WDT0YEBjLq7YQ8OaUdnD+c05H/wjEVhcS+ahGT
	g4NjtZfT3lVJg275sWF6SelibNNaAfkLKpjpti1cYBlDo5fFqOIHP9UZhYJIyVM8Jwy5z+IVS6WJP
	N/kdXbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEJP-0000000FdWy-3Zh8;
	Wed, 14 May 2025 15:46:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDia-0000000FWbu-44Mp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:08:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A84D5C5AA8;
	Wed, 14 May 2025 15:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9C5C4CEE3;
	Wed, 14 May 2025 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235304;
	bh=NwS1B7xosoDUO5tvEbjazSqGCbiVpg+Ub8mt/kAm3Y8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aWN/WMdWE1PCBthnaJXqUMGe1aMIEUcwedLYmMvOqp3gLpWVWDULMhgOdOssGYL7F
	 Ux6eqGHwcD25ra82uYyaDFCffC2Hjg5eRVBd8Zjg5WPp5nERBe0jZ9HNwKk1CGWsmu
	 uRP850sK2HnKUiT6TA1rchg/P9bA/ZNZwPV3d9cJwyNkUUVEXK6YX68PF3sF/63PnW
	 s2YT/hITmGfEmg5iRSqgvGnZ7RwFDACT2KJDDnzuxEi3qMDTccfiM5mzq2xtlG7RQf
	 JURaUBMP/w/k11jm6RWzkMUlRkrrZGsQu0rLJkL6WhPF4xn3EpzhKYLRj6brxaJO5k
	 KVUXH2Uc2g+VQ==
Message-ID: <b628554bb2ebc2e0983bd904b04d790e@kernel.org>
Date: Wed, 14 May 2025 15:08:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 02/11] drm: sun4i: de2/de3: refactor mixer
 initialisation
In-Reply-To: <20250511104042.24249-3-ryan@testtoast.com>
References: <20250511104042.24249-3-ryan@testtoast.com>
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
X-CRM114-CacheID: sfid-20250514_080825_067629_714E8929 
X-CRM114-Status: UNSURE (   6.56  )
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

On Sun, 11 May 2025 22:31:11 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

