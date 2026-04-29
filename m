Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0050BFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AO19yXsn37qBgG5Tsrn/S/WN0SBnx/bhiec2Iy+vZTg=; b=SStdls7rgowc84OqaxIMGSnapW
	loFhYQJp/RoTTe2mYwQfknQmpMGXtXQrSdfGNdqwRtgLfCAFERsm8ON5K6OQjoVDeqDMNgmzgEg0E
	j81mVXjl6qXXOOgdZxeEe+xW03juBREbLSF4iqHl5OxpLd5cM/ShQ2qHDEO4kjAJXD9Ihjyn1TAaS
	nlmUVSiuPexcZ5Glnobf3L2nYaVwgsurOE6S0uYbQBmOCubYsE1ToTK1LdRTcb9uC6I89w49zj/+7
	RYtbEW8UtxqrQyjSAduac+UXmAUjdLtuA7WkDHXuH8HCpxskp083DGMvvm0v9sqBGsVBnvUW2WpwC
	DBCEwXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtA-00000002rpy-3QXY;
	Wed, 29 Apr 2026 03:47:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvt7-00000002rnh-0lcH;
	Wed, 29 Apr 2026 03:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7B9F40682;
	Wed, 29 Apr 2026 03:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF12EC19425;
	Wed, 29 Apr 2026 03:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434420;
	bh=AO19yXsn37qBgG5Tsrn/S/WN0SBnx/bhiec2Iy+vZTg=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=Fwx5xoFb8vRtgQI1/v3ubSpVpkUkR6bcJVqa/IB1Nnwht+zlh6Vk4Y1hJFXvND/wv
	 V0C+wy7l7YBAZzh8lZrPwvd/LpbECP8hMffMBSOLc6IlXrQ/Y9Rl/69UxGo+FRIFHU
	 zCOopn80cBuV5FfPQhZlVNToahcyy7SffVhaDbIYfn49HxT0spn/P/VtYsNw9kNg9a
	 Akl4tbOCe/GHmIH4M8dTj7OXWOtMd5LV60vrW61k2vJLegWu31C8+G9MJY2EJLU0IH
	 CnlyVD6urCfP/HqBTVj5J7mWuQjCcdst2ICCf+Em88H09Txs4qCYv91Conh0hCwA4P
	 0lIQ/MAwdGG+g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org> <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 3/3] clk: mediatek: mt7988: use MUX_CLR_SET for gate-less muxes
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Ikjoon Jang <ikjn@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 28 Apr 2026 19:06:09 -0700
Message-ID: <177742836924.5403.8826035930365293683@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204701_249726_51A86A08 
X-CRM114-Status: GOOD (  10.40  )
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

Quoting Daniel Golle (2026-03-25 22:11:12)
> All 19 muxes in the infra_muxes[] array are pure mux selectors without
> a clock gate or update register, yet they were defined using
> MUX_GATE_CLR_SET_UPD with gate_shift =3D -1.
>=20
> This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
> enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
> gate_shift is stored as u8, the -1 truncates to 255, causing a
> shift-out-of-bounds at runtime:
>=20
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>=20
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>=20
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>=20
> Switch these definitions to MUX_CLR_SET, which uses
> mtk_mux_clr_set_upd_ops (no gate callbacks) and does not require
> callers to pass sentinel values for unused update register fields.
> The actual clock gating for these peripherals is handled by the
> separate GATE_INFRA* definitions further down.
>=20
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

