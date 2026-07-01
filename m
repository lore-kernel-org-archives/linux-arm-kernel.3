Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6578FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih8VI3akqdV46XsDgt7LH8Bzy+tTYmREoOv79UKcJro=; b=mH10OOqNdcjW2zY2SOo2Hslwtj
	A5ywRiQUrJfNmBvHLfjpJAdCn/fiV3SDRHeRJy54JDP1qpjUx1ul6i3VCs9XHNhdnHoVawDnTKOqZ
	jKFRyrTZ4huERQmpqIYCeWUjanz/DZqBsTgyloMCXwNnIk78+GMCApJ7VHu9LUWJy40zPj21EWXFm
	BKmxO+GvMfJ38LPHLalqYKQYE5E8jK3WsC8T6KHg7G3clJTZilGoazrlwT/mmx4UtU/9WvMUjGab+
	wOKUhQEJxPdQP5KfoqyV9u+bdHEPnqRNp/xQwEpQO4ZcrGS7OzgGDk+MgH4q6F3ZEx293nhcl6kJc
	76yKKFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew4M-00000002J60-2f6U;
	Wed, 01 Jul 2026 14:37:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew4M-00000002J5r-0Zfd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:37:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85F6360138;
	Wed,  1 Jul 2026 14:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF3F1F00A3A;
	Wed,  1 Jul 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916661;
	bh=ih8VI3akqdV46XsDgt7LH8Bzy+tTYmREoOv79UKcJro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Lb0CSpzBNMtYKCOss+E8Zo7rqOU/BCoor3uQEMe5WmqY2V1FabHF1Hm5ivjAoHwUZ
	 n4RaO0/1Jw6OnT0c5FKuDuabNnLydlJw/7DIJA52HG53hCLHgi49zRdwQ5a2WpE3M3
	 Ti2CbcOTrJniLipt9H92uU7Aqd17PCtxO5w2koBvHdAsrlEycJZDHQRwuoJT8ko6ao
	 FrO8Br5+oluj8TF7yq2V9lUbBYs1ajdZ7QeGFqTAiSx59EQ4a5XcaoZk+ATT52QtzQ
	 xVYi1dWUcWEBOwOe6OrpvX/Tb5h2hkCEQRdUP1E/J5OHmw1JndmU5UQlOEfGb4tg9E
	 E4r6QX9OligyQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wew4I-00000000MEg-3kwO;
	Wed, 01 Jul 2026 14:37:38 +0000
Date: Wed, 01 Jul 2026 15:37:38 +0100
Message-ID: <86tsqipyh9.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,	devicetree@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,	Lorenzo
 Pieralisi <lpieralisi@kernel.org>,	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,	Catalin Marinas
 <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,	Mark Rutland
 <mark.rutland@arm.com>,	Daniel Lezcano <daniel.lezcano@kernel.org>,	Thomas
 Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,	Krzysztof
 Kozlowski <krzk+dt@kernel.org>,	Conor Dooley <conor+dt@kernel.org>,	Chen-Yu
 Tsai <wens@kernel.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel
 Holland <samuel@sholland.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,	Ge Gordon
 <gordon.ge@bst.ai>,	BST Linux Kernel Upstream Group
 <bst-upstream@bstai.top>,	Jesper Nilsson <jesper.nilsson@axis.com>,	Lars
 Persson <lars.persson@axis.com>,	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix Kernel Team
 <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,	Dinh Nguyen
 <dinguyen@kernel.org>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,	Bjorn Andersson
 <andersson@kernel.org>,	Konrad Dybcio <konradybcio@kernel.org>,	Andreas
 =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,	=?UTF-8?B?Ill1LUNodW4gTGlu?=
 =?UTF-8?B?IFvmnpfnpZDlkJtdIg==?= <eleanor.lin@realtek.com>,	Heiko Stuebner
 <heiko@sntech.de>,	Shawn Lin <shawn.lin@rock-chips.com>,	Orson Zhai
 <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,	Michal
 Simek <michal.simek@amd.com>
Subject: Re: [PATCH v3 12/17] arm64: dts: nvidia: Add EL2 virtual timer interrupt
In-Reply-To: <00da7fd4-68a4-4a92-b4a1-600b5a2b72f4@nvidia.com>
References: <20260523140242.586031-1-maz@kernel.org>
	<20260523140242.586031-13-maz@kernel.org>
	<3c714ae3-8f62-4785-9f61-ba9899fd70d8@nvidia.com>
	<86wlvgpacz.wl-maz@kernel.org>
	<00da7fd4-68a4-4a92-b4a1-600b5a2b72f4@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, andersson@kernel.org, konradybcio@k
 ernel.org, afaerber@suse.de, eleanor.lin@realtek.com, heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Tue, 30 Jun 2026 13:09:20 +0100,
Jon Hunter <jonathanh@nvidia.com> wrote:
> 
> Hi Marc,
> 
> On 30/06/2026 11:54, Marc Zyngier wrote:
> 
> ...
> 
> >> Sorry for the delay. I gave this a test because I observed the warning
> >> that was added on the Tegra194 and Tegra234 platforms. This change
> >> fixes the warning for Tegra234, but on Tegra194 the platforms I tested
> >> hang on boot. It appears to be similar to the issue that Marek saw on
> >> his platforms and so I am wondering if Tegra194 also doesn't have this
> >> wired up?
> > 
> > I think you are in a better position than me to find out. It also
> > could be a firmware issue not making the PPI a Group-1 interrupt, and
> > therefore not allow Linux to configure the interrupt.
> 
> Yes absolutely. I will see what I can find out.
> 
> >> Was there any resolution to the issue reported by Marek?
> >> 
> >> FYI, the Tegra194 SoC has the 'NVIDIA Carmel ARM v8.2' CPUs [0].
> > 
> > There is no resolution so far. Florian was going to check what the
> > deal is with the Broadcom-related systems, but hasn't come back with
> > an answer yet.
> > 
> > The possibilities are as follows:
> > 
> > - remove the interrupt for the EL2 virtual timer and live with the
> >    warning
> > 
> > - add a patch such as [1], which should document the reason why this
> >    is now working (and fallback to the EL2 physical timer)
> > 
> > I'm happy either way, as long as we know exactly what we are dealing
> > with on each affected platform.
> 
> I would like to get the warning fixed for Tegra234. Do you want to
> split that part out of your patch and then I can test and we can at
> least fix for that device while I see whats up with Tegra194?

Getting the warning fixed for Tegra234 is probably limited to fixing
the DT, Feel free to lift that from my original patch and slap your
name on it.

Also consider fixing most of the PPI interrupt specifiers while you're
at it, because aside from the PMU, they are all awfully wrong.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

