Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4592AD6B6C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or2KvqJqW9neTrGs27NJV1Mi505S8IEzYJIDkgKZoEc=; b=Xxffui28WQFScwovUwOdnL7dST
	v5j5NwEpPB8QqToMpFaxZVnLK6SujAyiCbE7SDG/Le/fa4V48s2T6n/aIXGQwQagm9l4oFARGwVFT
	x+bttC1idF19sMOiTRCLE6ggGZD16zX2o3zPqs/uIYF/0Oxh9QD8nXUkaI9rNyD3Ml5cOdiMayC8Q
	vcmhNZhzfDQ5Un/dCa9Wz28PlVFQ87ntfNvRuYVvVNPaaI0QejLu4HovNL/rtQBwMWAgl2zx9wo4M
	ADDmvr5dNKm3X7zpF2BB123azKPnmWoR9UCZy3wAWkljJyKZD+XUJkfkI0qClGwb0Ui3Vd9f6Y5q8
	j7gb07lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6EhM-00000001Zk2-2Gao;
	Wed, 30 Oct 2024 19:49:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Efh-00000001ZYR-3R1m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 19:48:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FA72A40261;
	Wed, 30 Oct 2024 19:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC520C4CED1;
	Wed, 30 Oct 2024 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730317679;
	bh=or2KvqJqW9neTrGs27NJV1Mi505S8IEzYJIDkgKZoEc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GnmoJZMRD/rtg+jn7BGx08wKVT8M6G63TvnrrDXecde7e1/4BVYddIh9qHTKiKD+d
	 Juy6Iuemeemw0Q6wZS6kRnwYXm2AFn/eNIyiUrTUTDJqukFaX7E/ue1FeYZVp85f9M
	 yV4jet/k5v3Lbo4Bm7cDpi1Fyaa0OK6yawAYkjNyIA1jiDjmfJl43dZqFJyV0QCsr5
	 fGTL98dbU6d/bS/kMrUYBs2jZSrk2TmF3SZcmHak5e9hydEJTkhUNhBWY5Op42El/E
	 69wT7rXGtucgP3jDqHAF1Ry03kQrI3y1NpsuvaG6XRuIBhfiyV6fUhGpM6ftoWvyIr
	 cNAPyHTuNTcKw==
Message-ID: <d9d5ef74df0564cbec46c093bd611ab8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241030110120.332802-3-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com> <20241030110120.332802-3-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 02/10] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Wed, 30 Oct 2024 12:47:57 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_124801_942439_BD181016 
X-CRM114-Status: UNSURE (   5.86  )
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

Subject can just be "clk: Add devm_clk_hw_register_gate_parent_hw()"

Quoting Claudiu (2024-10-30 04:01:12)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
> devres managed gate clocks providing struct clk_hw object as parent.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

