Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA4BCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTwxtiG8T7aliZMirEQRyxQuxXCZuWOL+KmVOLNLrIs=; b=Sj8z/2D2gB2KJ/tPWa8JOgma3n
	mDFfHqIBWwlcDDDkV9KK2QhCpRTpjInKrDzMCpNecwMSveU4/8AxWhIoO1FgZ1dkBvEODFQPJdi0u
	Y3S0ap/qOy1dDI725goq/TPntF/42v3WRnqPoKueY915vCWsCdpPtg9PO12bqs393Tph+SUrvQXrg
	JiONPnzxgNO1QE4TnCWpshZwutD3V0dqYoHnjgduSMj4p1IwY0mZpQg2BdiSsD8SQHlPcQFSuLE94
	dOrWsw1X74jffoLs6j7huktVkPkMtTvsUeNEpSGmwmqpJcDebCUCClimWNAxlg5Ra8MNjeoJpFwaE
	DNzpkC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL16d-00000004Gb5-30ho;
	Thu, 07 May 2026 15:57:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL16b-00000004GaX-43Wc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A4A941894;
	Thu,  7 May 2026 15:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6DEC2BCB2;
	Thu,  7 May 2026 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169461;
	bh=SRDQGAD1Jdb8rMWAaZJsxwcnVMafxfPILg9InfBnZk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BW6G5dbHPaISsPWE5mSZF9XcFmisdWcuoAKiW5zf0L3W7E4POAvDn732x84epIMl7
	 nL+2cxtZ7AI1v1hOywTgzUA7IJzucqLN2kWzZf9Cx0+QT5B6ZtuCNa95UNRDmrik37
	 B/MPn/Si4AsLpY1++E4JIWONY2cqBvsXA8rs0mQ+VPruEIU4hnjSJS1/ISetecwSTX
	 ld+uGPWrx3At5c/+y4mURuzcC/wfYlRkgFOyW6rCvT8NC8XOQhy0b7ofpuprvih9eV
	 78U15qZk4aaa7h7v7Cv8VfO7j7RTOrchBruaJiAGEMbeIbKsEvLS++6RtJ1b1Ao3cU
	 uE85PDi3IRH9w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wL16U-000000002I0-0wWs;
	Thu, 07 May 2026 15:57:34 +0000
Date: Thu, 07 May 2026 16:57:33 +0100
Message-ID: <86o6irxlea.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,	devicetree@vger.kernel.org,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Hanjun Guo <guohanjun@huawei.com>,	Sudeep Holla
 <sudeep.holla@kernel.org>,	Catalin Marinas <catalin.marinas@arm.com>,	Will
 Deacon <will@kernel.org>,	"Rafael J. Wysocki" <rafael@kernel.org>,	Mark
 Rutland <mark.rutland@arm.com>,	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor Dooley
 <conor+dt@kernel.org>,	Chen-Yu Tsai <wens@kernel.org>,	Jernej Skrabec
 <jernej.skrabec@gmail.com>,	Samuel Holland <samuel@sholland.org>,	Neil
 Armstrong <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,	Ge Gordon <gordon.ge@bst.ai>,	BST
 Linux Kernel Upstream Group <bst-upstream@bstai.top>,	Jesper Nilsson
 <jesper.nilsson@axis.com>,	Lars Persson <lars.persson@axis.com>,	Alim
 Akhtar <alim.akhtar@samsung.com>,	Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>,	Frank Li <Frank.Li@nxp.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Thierry Reding
 <thierry.reding@kernel.org>,	Jonathan Hunter <jonathanh@nvidia.com>,	Bjorn
 Andersson <andersson@kernel.org>,	Konrad Dybcio <konradybcio@kernel.org>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,	Shawn Lin
 <shawn.lin@rock-chips.com>,	Orson Zhai <orsonzhai@gmail.com>,	Baolin Wang
 <baolin.wang@linux.alibaba.com>,	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 14/16] arm64: dts: rockchip: Add EL2 virtual timer interrupt
In-Reply-To: <3690258.8hzESeGDPO@phil>
References: <20260507125544.2903406-1-maz@kernel.org>
	<20260507125544.2903406-15-maz@kernel.org>
	<3690258.8hzESeGDPO@phil>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: heiko@sntech.de, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, a
 faerber@suse.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_085742_043276_41CFF2EC 
X-CRM114-Status: GOOD (  15.81  )
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

On Thu, 07 May 2026 16:33:21 +0100,
Heiko Stuebner <heiko@sntech.de> wrote:
>=20
> Hi Mark,

s/k/c/ ;-)

>=20
> Am Donnerstag, 7. Mai 2026, 14:55:42 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Marc Zyngier:
> > The ARMv8.2 based CPUs used in a number of Rockchip SoCs are missing
> > the EL2 virtual timer interrupt. Add it.
>=20
> the message talks about "a number of Rockchip SoCs", but below there are
> only the rk3566/rk3568 variants? Or does it just mean the two?

I have no idea how many Socs are covered by the 'x' in the filename,
and I can't say I looked too hard -- I simply checked that whichever
file was including this one was describing CPUs that were guaranteed
to implement this timer.

>=20
> In any case,
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de>

Thanks!

	M.

--=20
Without deviation from the norm, progress is not possible.

