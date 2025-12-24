Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB7E7544B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku5OdGWYGavTvfxthybhfXDigWzMuc6sN9BkMdAsfOo=; b=z6bMH0lhspPTR0N6by4R/Yt73+
	rFu1FQjyR52m6JRsEshcDrbkpWCm+nWmSqJeX4zsOqWrE5vd3IzA+HCgLuS6RxQTZhDGEXMDUmubI
	7aLvXXjs8SpfkiAvnwwYeg36yofspV8Y5RBdXA09LBK9qmOKdyihsWWZPrxDMKrTApCaoc6qbYWV0
	HI3WhRnME0Lh2jsad+EDaxdrvRaKXwPnAA337f4Fgv3cGSMg791Qf0Vi3J2CdVOMH9IPXvGMrYSdP
	/SCPVWftIZAb30W8391ZH47DOGUYXoNiOc5sdmKU7AtqFeEgej7IAbO8vxy4TB3GA+JNGr91gsfNc
	8YmM05xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLzY-0000000GgpB-019O;
	Wed, 24 Dec 2025 10:21:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLzV-0000000Ggoq-0HPZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 10:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3202A429E8;
	Wed, 24 Dec 2025 10:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36715C4CEFB;
	Wed, 24 Dec 2025 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766571672;
	bh=ku5OdGWYGavTvfxthybhfXDigWzMuc6sN9BkMdAsfOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvP9FiFEieaUa1XZkBvydCFVeXBtEYpa6DJ+ofow0D2KGuEiCDJfspiM8q+Q40K3y
	 eSDwRjQg9p2bSWhf1ucxxVm9RqXzPHKXu+Xyi5Ikobwz8lJP9jGhL/bWgOFuuMA0Bq
	 mswKTP8/X1DaDVr0SU4nwVFGvaIQedho/Vn2XyPet9o50eCPEfS/ftk9vVncZ44s2E
	 a0H9rvBPgFTMctPWtC229fOJvL40X09lUTmg3IGpRpn1WQqfclPA1sjtubbkWzgMHR
	 QKrz3dMbtBbD6DHTD/6CebYw3e68dtKxHY/h8rVQH4eO9zaMymAhTinziyeRibTQVQ
	 29GtdaKscLlrg==
Date: Wed, 24 Dec 2025 11:21:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org, 
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	lars.povlsen@microchip.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Message-ID: <20251224-berserk-mackerel-of-snow-4cae54@quoll>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223201921.1332786-2-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_022113_126232_D7EF7A30 
X-CRM114-Status: UNSURE (   6.80  )
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

On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> Add the required LAN969x clock bindings.

I do not see clock bindings actually here. Where is the actual binding?
Commit msg does not help me at all to understand why you are doing this
without actual required bindings.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
Bindings never have a "include" prefix.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


