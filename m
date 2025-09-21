Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A948CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmcqAy6h/ICDeDYAwPRkFiDSOLcTRi9vj0g9g+5IZ6s=; b=E5sCiXYBkif+m2mK5aISvl4TQj
	Nk5+zeA7LfL7k+AAqS4Zb1BPD7ejtJZuOx5zbr9760NcR00UFMkOtyBcaNwRhzhGJ61gAcH56L0RM
	6LDykqo/cF/dYso7aZRN81486iO+WxCLjNKOKSgjwQhM2CZKmqmJMskGKtgLrvvgBs3cqj+3FthgX
	vBRdIJdr0YGA/vuGEmDQE/kqpVBc1hFlNciwgdA6mHw29qDnAyoTplzQUW6nX9lCKUBsz1Go4AxK5
	b4qg43C+OOfyHu979f5BkMmA/LFitcjOk1Ccd700P0iRlKbFJJg1q6iJEnvLMle9BV5cTGOxBH20W
	yxyIy+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJN-00000007p2G-2S8q;
	Sun, 21 Sep 2025 16:53:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJL-00000007p0K-1zKs;
	Sun, 21 Sep 2025 16:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E33D5447DA;
	Sun, 21 Sep 2025 16:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A102AC4CEE7;
	Sun, 21 Sep 2025 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473594;
	bh=OmcqAy6h/ICDeDYAwPRkFiDSOLcTRi9vj0g9g+5IZ6s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GKc6gR3KcSeCvEA+k+1FuykK6Icfz8SrdmL58SfGBXBWxCVlPrfgm2DmBoUmAhMF5
	 eGEcQLx4DJVGfPu0JNhCxAZMaqth7NjamyXpUDRdA+B+IvQSUb3nTGslgSwpWND4Jo
	 Ph+GAnap95cL2c6v26NUV37mii01ivbbay3LcavM8QVFPPwP1keXi6HMZMca8k+G1S
	 smDICQwe4cXSdIeJBsqpmmaF+tnyoxO9Esqa7sQkB7YlcKCKs4MftDc/B6L367MoBW
	 EqNkXmtfVyWuLQxczQoozKtXCJLsmYbzIlZGw8fk+uEhw6a4x1HpmJtg9Q5Qv+alNz
	 OJaiTaUHw6Ydg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-3-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-3-laura.nao@collabora.com>
Subject: Re: [PATCH v6 02/27] clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and FENC
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:13 -0700
Message-ID: <175847359329.4354.2697873457619753075@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095315_540210_5B411192 
X-CRM114-Status: UNSURE (   7.59  )
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

Quoting Laura Nao (2025-09-15 08:19:22)
> MT8196 uses a combination of set/clr registers to control the PLL
> enable state, along with a FENC bit to check the preparation status.
> Add new set of PLL clock operations with support for set/clr enable and
> FENC status logic.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

