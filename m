Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ED1D6CFB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wzhmw8rKUN4fg6RiWqwWz6GO1fLdpfM7fAdDGueR1fU=; b=oePXwrB2ApFL08ZB0NnuNvCZsF
	iJryXXQqAEdUHnWbiLc6mUNmRYwFFxZvhNW8PetF26a+md/6T3luqyaQ0oF6KltsU9w91FgLxOJNX
	zXBKN8wj4j1Ze/n/lxqU9lGjUL09h32srrXc0xhupy+uxM0YrI3F/Qn2speqxgj+DRSaYC6Vm4MnW
	EAZUDFwO3UWViZLC73lVbanxvx3dWEkS/WYbekm8SieeLSL9yE8afsCyeiIIp89nBav+zGSXa2Mnx
	GhrzmNQEao2/JVmAGHu7wL8nd8yd4GyonTSLKSPhdk9GrItvhiF3NUdYc16JchbHPeMz0jyj0uM89
	ZA2Ot7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6F1-00000007zHR-0rJe;
	Fri, 23 Jan 2026 01:45:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Ey-00000007zGI-0HZb;
	Fri, 23 Jan 2026 01:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2007432AD;
	Fri, 23 Jan 2026 01:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840F1C116C6;
	Fri, 23 Jan 2026 01:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132735;
	bh=Wzhmw8rKUN4fg6RiWqwWz6GO1fLdpfM7fAdDGueR1fU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cdEfcKVM1I8wLG60KGaFaldGgftXWk01K0nVz7kpbnTmDczvycPtG9lznvHm58pky
	 14NVBUq5pEh3ZxqmUJl2lXegtJbZN6mLYmAx5SgXbxiUvZArxtPgyz59odQXJJU2Io
	 jIYCqE938MPSLGFW9egs3I5FFodVtH5oEhdlBfPZ/LGvdWmQbX50pcTT3H5i8K277Y
	 lu37an7syPBnrmBlGM3tUHBK4D0X+qVyFuf31m13GjYX4rVZN3qoSswBgNW/ztQ2eR
	 6zd4nhD8zQTnO2gOMO/SRRSUfV0CYzFj0yxxtrFIhYDDmboBxBRDL81bzfLidUujnm
	 xiZbOVv/8PHTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:33 -0700
Message-ID: <176913273374.4027.10690199843699119944@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_174536_129032_BEF58254 
X-CRM114-Status: UNSURE (   7.19  )
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

Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
>=20
> Add parent enables/disables where the recalc_rate op is called directly.
>=20
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents en=
able (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents en=
able (part 1)")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next

