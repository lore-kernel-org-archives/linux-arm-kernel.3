Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C361BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06kA3D7q5+feETjZztMj3/pQCz9ZvioWeY+GXfhxs+g=; b=SxjKQlH35aFJC/WI6cPea0eTsA
	H/dkCF/ougB5rOm6mhTfujK7OteBiiScgFPAwlZediFxB0vn5FIGHxBfU8r7ubzS+pxozvblL9Eq8
	45k5DfqmH2QLeFb15BGZL6i6eEG66bbY+t4PeEbuNxC16BsMAs8Mqa/131ZJ+ylcsZbW+qa48tZXQ
	Omw6fnRcQ08uEMDI5BnBXF/2k8VxScKVx9fJB+VuR1xL7Dxm7tJRgrBZN1M30GrwCj+i0GmRyL5Ym
	O8dXKKsNlWszBkHi+xDSR+UHgxj1xt/kBmbz3QWw3w+BoJu8bFiQkP0wvui4U0X++FBhsnu0Txcf0
	80Vv+sdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpyFJ-00000009coM-06fZ;
	Wed, 05 Mar 2025 23:33:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx7P-00000009TEi-1wwX;
	Wed, 05 Mar 2025 22:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=06kA3D7q5+feETjZztMj3/pQCz9ZvioWeY+GXfhxs+g=; b=lUkw1mDJPwmNN8PM4Mq+QkuCs5
	Eq040osdHWsuyn11Tm0W6UnpxHctuR9ScrqJrklLaLFeq/pcRVhBtomEqmObs5JzVoPO1VGKjIr8q
	4ROKTP9xz8touEtqnKHm6AwMTf8QB9svZAUOK6/4MlMvsnSqIEtwoJq5vyHoAx6oGAKwzlAEWMkzJ
	vYqtdicoO7FQK4S0CvsZ/571lwZsB94zEB04FS5porMskAH1e7oVSN2IzsU9dn4FZR50F6HNBTTTG
	gQs6G+/alVnXe33g6eFmi58lFL2VVYHYjxkMuWMDY7hJSLtz+yd5naztafwQRvtnzkAqH751ZHw+9
	8X3U5BSw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx7M-00000006IAF-2LHm;
	Wed, 05 Mar 2025 22:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=06kA3D7q5+feETjZztMj3/pQCz9ZvioWeY+GXfhxs+g=; b=0jTs1xQcFwh5ox+whGadW7md9L
	WS1OfCwNfoT/R60g3n715mKlYtI9WjDijcapfP4h/inDZR9976tcNGiyoNj0+yyneWUUZ2ggYSdAe
	yTo082HyUXdH7MF4UTjHFsIIOaEanyKuNhhTjVOJGqQtmCMT0qjnUX24pLy8QLutraI3hv/b0hqYT
	NjRL5QdypTnZidKKbC9xcOtUQ/4uTdV1VVo/ryphnbf6BiucQwY7rFp0uoRRwUprlDco3Mtw4ZcWk
	t1fJObmKUI8LjICwz9D/wFRCAQHEJ0kTZTE91wGbNagju9vdMn3f0SDQJxg7PBglm6o8jBr62LP8Y
	IiygmWWQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpx74-00060i-4M; Wed, 05 Mar 2025 23:21:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 2/7] clk: rockchip: add support for GRF gated clocks
Date: Wed, 05 Mar 2025 23:21:12 +0100
Message-ID: <4964374.GXAFRqVoOG@phil>
In-Reply-To: <20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com>
References: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
 <20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_222132_635546_FD5A1FA7 
X-CRM114-Status: GOOD (  22.10  )
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

Hey,

Am Mittwoch, 5. M=C3=A4rz 2025, 22:24:22 MEZ schrieb Nicolas Frattaroli:
> Certain Rockchip SoCs, the RK3576 in particular, have some clocks that
> are essentially gated behind an additional GRF write. Downstream uses an
> additional entirely separate clock driver that maps over the same
> address range as ioc_grf in the DT.
>=20
> Instead, this implementation introduces a new gate type, GRF gates.
> These gates function quite like regular gates. In effect, this means
> they'll only be enabled if the clock is used, which I feel is a more
> appropriate way to describe this compared to doing it in, say, pinctrl,
> or even in the drivers of the respective clock consumers such as SAI.
>=20
> It should be noted that RK3588 has similar GRF-gated clocks, but has
> gotten away with not having to deal with any of this because the clocks
> are ungated by the hardware's register reset value by default. The
> RK3576 is not so lucky, and the hardware's reset value gates them
> instead, which means we'll have to ungate them somewhere.
>=20
> In order to facilitate the GRF gating on RK3576, we introduce the
> concept of auxiliary GRFs. The RK3576 has several defined GRF nodes, and
> so far it could get away with just using one for MUXGRF by reassigning
> the clock provider's grf member.
>=20
> However, with the IOC GRF gated clocks, we now also need access to the
> IOC GRF, so we can't get away with this anymore. Instead, we add a
> hashtable to the clock provider struct, keyed by a grf type enum. The
> clock branches can then specify through the use of a new member of that
> enum's type (with corresponding changes to relevant macros) which GRF
> range they would like to use.
>=20
> The SoC-specific clk_init can then populate the hashtable with the GRFs
> that it needs. This way, GRF-dependent clock branches don't have to be
> registered in a different step than everything else, as they would need
> to be had I extended the branch struct to instead take a pointer to a
> GRF, which isn't available at the time most of our branches are defined.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I only did a short look through the patch and didn't see anything
glaringly wrong, but this wants to be at least 3 patches:
=2D add the handling (hash-table etc) for multiple grfs
  (including adapting the grf-mux)
=2D adding the grf-gate clock-type
=2D adding the rk3576 grf-gates


Heiko



