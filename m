Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cSIJmSKm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EuMJQh8j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AXVCbgunRdxiEzfKOtZOu4w7+1IOuyahlSkNVvnhSu0=; b=cSIJmSKm0CT/rwx03tavuUnvCd
	nhSefQDnRDkHVfHOefaidR5wiDTH/Z8ujXq+Hyb7QmTpLyqWW7hLPuALUg13VNROPlTsoBTrEEtpg
	dhDhRyhVDQWPMH2JgsKEGko+LFep2HB7DhmCee1xb2AolKzpW+KAJOirHG+uBzq2tG2NkA7w0sLbo
	XH5cXFKReJCnLN12yXzSbxpQ/ewHCDbBHopVsbp728BOqIB/elOXy/4axvcuce7roDh3Z2dh1mMvV
	CKopTzfyHwnHe0U9hQ44DE/q7vo/gMCbBJRAljVtzPtENDZYZqJDLAWs5UgDFwk6iC83kEsd59vrY
	mvA9+TMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSad-00000003Ks1-2SXs;
	Mon, 26 Oct 2026 21:50:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSac-00000003Krs-146S;
	Mon, 26 Oct 2026 21:50:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 919EC42ABC;
	Mon, 26 Oct 2026 21:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BB21F01829;
	Mon, 26 Oct 2026 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793051445;
	bh=AXVCbgunRdxiEzfKOtZOu4w7+1IOuyahlSkNVvnhSu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EuMJQh8jrNFztkuD9QGjD9IOj3BqpOWIn4ZLfMqp0axPNgGHyX6ygQBg11SPqk2IN
	 HPpQpYKB9+oaLHcz/oXyjCaNY/7hG0ZrJ7RhnLWY1M3m7uF/wvlXeTTOa+nz/Lb/68
	 EqHJRl1eKye9fjZVphj+G2J1xF/2dnWT4BTuM1rwaxZ75GvqRZZtn7HXLGL38zXl/d
	 eRARHpowxT6oVh+EW6FqS6FtOIxH+Qq82wApQZSpsyGER4BTVjuMClPmJ3TRjB9H2a
	 QwlkvEHU+j1hC0glM0B8FDVcr6yiBS6VWlhyoKrh4l+Rea7bTqqgxeUDqGiyT+LrT+
	 cK/TSg7YtXRYw==
Date: Mon, 26 Oct 2026 16:50:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-serial@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, mfd@lists.linux.dev,
	Brian Masney <bmasney+clk@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-i3c@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 19/20] dt-bindings: arm: berlin: Add Synaptics SL261X SoC
 and RDK board
Message-ID: <179305144215.3880355.17021264203914650157.robh@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-20-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929061417.20733-20-jszhang@kernel.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 29 Sep 2026 14:14:16 +0800, Jisheng Zhang wrote:
> Add devicetree binding for the Synaptics SL261X SoCs and corresponding
> RDK boards.
> 
> The SL261X include five pin-to-pin compatible SoCs: SL2611, SL2613,
> SL2615, SL2617, and SL2619.
> 
> The corresponding RDK boards are based on the these SoCs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/arm/marvell,berlin.yaml          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


