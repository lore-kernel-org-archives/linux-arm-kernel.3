Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFF0606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nSNn19XV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+6p5HmB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rNrgsfhJ8iQuc0OgyRK6owJ7CKB0QPGDuirnZiNjO7I=; b=nSNn19XV64GMo3JsJ9bj9oITtJ
	MvL2jHjnenobTWY7qoeOAKjcmZKuCz3Uj50BOes7vLdy/YQHA8C2/S6tef+2rN6KJEeo6uOoiQQZ9
	gK+Lv1N/Fe60lGWpbViHSZE6fkTNJbqkx0nDo0fuimWQqXcc2JU3/TKwpuV++Ybu0Mm+2X2FLk7ac
	MjIjSKXOXF54TVZ3Fhviw4i3q22E8kw6Yhcp5a+KOXyoudFxo9Skm4dm4N8xpcGMiWnwDM+OIm3T3
	gsE00I7pCr7yfvtYB36OUvSEC4r63vsKFDYKGzwuEHSvyw2p1tD+jHlDHrxgrAkiluoUbrZ+kBTy4
	1KrPcoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3ZD-000000072QX-41x7;
	Wed, 28 Oct 2026 13:19:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3ZD-000000072PU-020a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:19:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 138F3600C8;
	Wed, 28 Oct 2026 13:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013911F01825;
	Wed, 28 Oct 2026 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793193585;
	bh=rNrgsfhJ8iQuc0OgyRK6owJ7CKB0QPGDuirnZiNjO7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C+6p5HmBaYr5tGiWDQW8DO9OXPVO5d0N/g5bNvmX4QN6kXYA+OyuJ333IWFjCQOxn
	 qsWoUsVixm22DCKopMLEA9H264qL1laJBucEBsgfAeFdeTirQMNVxjvCidjAlfxauV
	 iabQFLG6bem/w//Vd7veKWZa0E5FRIofuKwO90WQoaaGnPXTG3egrkiwxORRmbgSYx
	 PQTKRfUzs+xGyYX0bxZPyaAmYb8frm3RpNxikM8Q3JU66xkpBzG8AKrsqXmNz5z1KT
	 lEW6LuT5Yjsx5QZnDv8rehEivRPxGjsxWCb5OoOzXpauMWPVH88LIRP4e1OQHNiryB
	 h8iNrLjNZgnIg==
Date: Wed, 28 Oct 2026 14:19:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, Mariano Marciello <mmarciello@google.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <20261028-nonchalant-griffin-of-triumph-ccc710@quoll>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
> 

Ah, and one more:

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23


Best regards,
Krzysztof


