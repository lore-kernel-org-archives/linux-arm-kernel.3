Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC09606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FsGoMIvf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nr5uW3Qt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qUgLs+CjpBbZipOhT6HHA1szcA4CGwnixmqJCQRTuQ=; b=FsGoMIvf464YwOi49pTeV+PLXL
	uFlFCyeL4g4I2CFQBezNMgOfVPXfHqN9lR7ga6Iypjsy4NyL/hjSPgO4SmSdkCKHqBLmV24/Y6/RH
	PxaL+0ko27TD7H312+E0NwYJwg9RjaIJY/E+JNLqiVJ5B0E01YT4IH3Y3Tu6uZzgrUkERan/wrvpu
	9kbm+Q9dO5VaE1A1cbX4iTRKOC2+ZsWYwE4RyUtoygKxrFmW4HNwxonjRL/rq6a2vW04swAoCdORR
	DHmvuQXa2T5icdevpQ3kac0Oh2LkgbylpD5/xgdjYwS3zZooiZyBK8DNN5ynbrfZFIj1rWcg8olD8
	xoO4aE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyeM-00000008cCb-3oYe;
	Tue, 20 Oct 2026 01:28:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyeL-00000008cCR-0qqz;
	Tue, 20 Oct 2026 01:28:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1658602A8;
	Tue, 20 Oct 2026 01:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3A01F000C5;
	Tue, 20 Oct 2026 01:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792459698;
	bh=5qUgLs+CjpBbZipOhT6HHA1szcA4CGwnixmqJCQRTuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nr5uW3QtlmxoP4tox6wXnKraKe2Y/uT2upIvGqeVqRQNQurkI65qu2/74qwIj2tmm
	 FC6ADKO5hnjDmn9Exb23lD9oAJpVTaq2ahFErEs+UD+/yp7375unDeYqydoPlts/Cx
	 E+1wIPk/+SBcNYuCycNiLcKxDIMH9o1FjFjvOZ9hXb8APeuLO+JgmUir8FA8UsA7TX
	 Mhe+E96RWfYOoxFNLiBPHr3S3lcSz4pDRwoptJPdKG6v+oJNurZWikAWd6ju98SX7d
	 QIddXUrKr85C0TUkEnu/Z73Qbwcd2lRfqI74dpW5PZN6Yfzavn0d/p4y9vPfhZHd+/
	 yUMRCBoYlhWwg==
Date: Tue, 20 Oct 2026 09:08:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/20] dt-bindings: i3c: dw: support up to two reset lines
Message-ID: <ata--JFFUzSoMock@xhacker>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-5-jszhang@kernel.org>
 <80b084d130b7dc7406ae23e54a77706a4f42b606.camel@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80b084d130b7dc7406ae23e54a77706a4f42b606.camel@pengutronix.de>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:55:14PM +0200, Philipp Zabel wrote:
> On Di, 2026-09-29 at 14:14 +0800, Jisheng Zhang wrote:
> > The Synopsys DesignWare I3C master controller can have multiple reset
> > lines, such as core reset, apb reset, and dma reset.
> > 
> > Update the DT binding documentation to increase maxItems for the resets
> > property to 2.
> 
> The last sentence just listed three reset lines. Why increase to 2?

Per the doc, the last one is dma reset, currently dw I3C driver doesn't support dma.
And increasing it to 3 is still dt compatible. Maybe I misunderstood
something. what's more, I don't have platforms with all 3 resets to test and verify.

If dt maintainers prefer 3 in one step, I will sent out a follow-up patch.

