Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DAED6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3zi7Cs5yb+b4cX4asMUomLRUx2T6EiDtE7IRZ9uGbE=; b=Swi4wCWp5l1crGzjYnMoNa+HRb
	S3iOceEatkjPRdFQT7DhtXqfi3617eTUlt29Pvv5K8LdzD4WaaxLV8jqxOf/Hb97/9B4xrNsSo9Kk
	oDLuokNp7qt2/bUCo1YVzXzOWRWD7AtHloa6qi/1+i8a50JRdonXTX+1cxkAisEiie1Nt5OeL7EMo
	Tgk6WYij7Bu23/RppLPV60wjxJBmTUkSMm7oddElY7XuFKBb8Bm9wj4A+LGAdqqOz0Lr/4RbhDXsr
	HEnov7XuG72232gDB1dAlabveNrPHQVXfTIO7t6NXMZa6L25s8DrRqstvEob013MVkxLbYAJfo8RD
	SPUPxj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Eh-00000007z8b-0Ihl;
	Fri, 23 Jan 2026 01:45:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6Ef-00000007z7C-0CAW;
	Fri, 23 Jan 2026 01:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EDAD43C23;
	Fri, 23 Jan 2026 01:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED26CC19422;
	Fri, 23 Jan 2026 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132716;
	bh=S3zi7Cs5yb+b4cX4asMUomLRUx2T6EiDtE7IRZ9uGbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ts0x65zAxMz2H0YAVA/kGOCLaWdLxg4aEU9swNSUPcJU1K3nQcxIWLGmOCB4Zlqy1
	 JgD/iB6NT7JFx2hlayM5FcT3lOrZRA4tAREStVwtAqVAvF++8csySgPGxpFKRXHe8o
	 +WfMLeRHA9wb8a1YltdRp23bP1GQEP2oEDdRgalI6BFyjPs0bjEKy9lv3BR1JSclZQ
	 QXQ3QGOzEwXsYZBP1AYWNR9CdcuwUO4S9oDhGIj3jnhR9cvtTGPERkr00pIXw1Y6Ia
	 Pv1deqrxH7225uqxDHAEwIw9k71EfLBMY3lm+H6lr9CfZJEn1jhwv0VeQDmswG6KbX
	 q+KPjL1ue1T0Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-3-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-3-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 3/5] clk: mediatek: Pass device to clk_hw_register for PLLs
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:14 -0700
Message-ID: <176913271422.4027.11922127679844362573@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_174517_109119_90716DDC 
X-CRM114-Status: GOOD (  12.02  )
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

Quoting Nicolas Frattaroli (2025-12-15 03:24:00)
> Passing the struct device pointer to clk_hw_register allows for runtime
> power management to work for the registered clock controllers. However,
> the mediatek PLL clocks do not do this.
>=20
> Change this by adding a struct device pointer argument to
> mtk_clk_register_pll, and fix up the only other user of it. Also add a
> new member to the struct mtk_clk_pll for the struct device pointer,
> which is set by mtk_clk_register_pll and is used by
> mtk_clk_register_pll_ops.
>=20
> If mtk_clk_register_pll is called with a NULL struct device pointer,
> then everything still works as expected; the clock core will simply
> treat them as previously, i.e. without runtime power management.
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next

