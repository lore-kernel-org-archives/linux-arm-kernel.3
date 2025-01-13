Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E0EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOiMvmfxdFa1swvNRvZ6Br8LIBtMTwQKMjwv+dENlJI=; b=nJS2xDqVWP79ERh1itFQM3XqYp
	jNJPQcAR+3pcj55EebQd/vrfMsF5Zt0soLIAgbm1K57SdSsEBqSAGB82Rttrd3iRovfzl96JVuxVl
	pinloDqwUCRCmkjdaLD2gtDF7hZj6XIOJfBG5MuX7/f+b/34Xz6jPLQgUqoUfe2ODubxcxmjXPB9e
	81C76lJQiuS0PE5Y/PXnJwMDu31k/FGhuma1CiNnw0Clw+LmsHOY9gG8z90pOE5/qXltk2o00tRYu
	Ctbnq58eZ8TC1i5V69InAEbxItEcJQFl/ziOTkmt8qn230Q3Sy+SV/TyJJaP9P5zd//oZPOMq2+fI
	RBgRI64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPgd-00000006JFQ-3w1d;
	Mon, 13 Jan 2025 19:01:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPfN-00000006Izl-1Z8j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED0345C578E;
	Mon, 13 Jan 2025 18:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2ECC4CED6;
	Mon, 13 Jan 2025 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736794800;
	bh=eOiMvmfxdFa1swvNRvZ6Br8LIBtMTwQKMjwv+dENlJI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XvGeNAcgH7np8/z5yTrHK8BBnJJGoPogFQCVRRj9Whr3quitSmhOFlSkR+qBqXTV0
	 QSHS7yafeXhNoY3yeL0iBUHgkKE1Zwf553TodFMqjHIJehC8u4glNlJh2Kx1O04bv+
	 /1sDlADXXsl+GFVyLvR/Xmi27JlENJNolfsHhQoCEqk0wZmuceJIjpIDI+LeGw4xDp
	 v9BFlRHS5GbfQPS7kJdOO8cPHP1A2xfaD1kFq8H3KRmxTuPs9Nuh3gLP1NH5in6LZZ
	 A+R3w2qs0S0jR4uSVtvIGpCupKoICvj6AlytC5iZQsuDaIW9vA2xsjtLjHDWo/ozce
	 7KwevoQDRf1uA==
Message-ID: <ff960baf02e6aa6fb93fe9a4584689ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
References: <20241025105620.1891596-1-andre.przywara@arm.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during frequency changes
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Philippe Simons <simons.philippe@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Samuel Holland <samuel@sholland.org>
Date: Mon, 13 Jan 2025 10:59:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_110001_455999_B1747CB7 
X-CRM114-Status: UNSURE (   9.12  )
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

Quoting Andre Przywara (2024-10-25 03:56:20)
> The H616 user manual recommends to re-parent the CPU clock during
> frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
>=20
> Add clock notifiers for the PLL and the CPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source),
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Applied to clk-next

