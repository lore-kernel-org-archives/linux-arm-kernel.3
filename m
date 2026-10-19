Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0215DCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D62cup5vprZgFRRa2wzv2xPzHFDPatAnjBm5Em342R8=; b=ayip/hco8z9Kw4wC9JyghSVQP3
	9TFTW7O/Ej5Pdq51dhse7r5lUdR/AXofcAPJeDcj49l7cUvin8U95z0fPjhmQYVegNBeIdWZlRZbK
	4staPLMRst3LYdEQIrBSsTFK50cfk9vEqXVRKX2l8aJwEjHt8lTXrhHHLj4A0KiuHK4Wqe0ggqqlD
	XV54PXRObX9ciPH/TShmtC3wIDbr6jjrIY67h0DfU7nI0/hFmPCo7GpXIJa6SQqmzz8ior3+0uqKb
	IX0Nf7M4pfogzCxvVDD1xCJX+g1KMnsQUxwTP0PSFw60oeLLSz8RE58fGmnqYO4NctnyPHy/RZmUF
	RpraK1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImte-00000007RO7-2v4j;
	Mon, 19 Oct 2026 12:55:22 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImtb-00000007RMm-1piU;
	Mon, 19 Oct 2026 12:55:20 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D2E57202283;
	Mon, 19 Oct 2026 14:55:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792414514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D62cup5vprZgFRRa2wzv2xPzHFDPatAnjBm5Em342R8=;
	b=CvLrU8+GmNypWn9xx/r4fdYSchqqMToLCIphjGezVcKgEReCLDwu4KClpz/9k7dw1wUZtT
	mLQJtWWOEHZfwcmFWN2Q0u2KPfbgvNIFKpnHc4M4eL9J2ppYYeE8kakZHVR8qglWYiPRhu
	tYZ3D7c/SUgQN2jLVW6PuM12R8trJGPc4aFTkE8PIX51UoIsHFVHBRJ33hRwRkzchdulpY
	TVZnMDQwW1y/Pl2ERHoUNvPVbd45xg0JL6nIHyj7/6YpzHqR+ujBDiobvlNxhcyRSmyXj2
	hC7WNh59pIeLAC0D8SM1sL9x1INHzeOVwMPXM66o8yUD8SdwazuBiFhfQttJJQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792414514; a=rsa-sha256;
	cv=none;
	b=Z3Hoz5ZYqpiDZNjSQCUX4qtokt95RYWHbGqNXWqhqiGqf+TwUCDZ8tMYc1DdbjSl0As+kp
	no2s+1YvTtJ47puPaAYw0LLqisyWf1XSiXfOutBQNcWZnR56ARSWULa/+Z1Vi3EQSwB6Vf
	2PG+IVa7/V/TDFQuDeNZZK2s/2OwcJ27ePvLyXSygTXpTRMFdkMHUCKccQ63E9TjcdyLRF
	qAAIM+ugML03WPm6FjdGWP37XLj8TnexXawtwG++tmeanbeufaJjOnmWZr1UfZRpc+P96r
	PiYVYIvtUXh+bgSKvdZ7ubpLSfrmYX5zTFZdUY095wH8ruyWH+E5eXYEIS86hA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792414514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D62cup5vprZgFRRa2wzv2xPzHFDPatAnjBm5Em342R8=;
	b=PqOAWYC9utW8pHVrGs/4aeyNUl89dwzkhYkJEoxW9do8WrW2lE7H6h/Dx2Ebkf4qFRaSMz
	tV9u2MvW/3x7lVS6juzYWIkKfOmGFMNRVZcAQZN0tnH5bOtoaoFN1ta4h76p3ANwS54IbJ
	4asBYp0P9935uack+6hWfLV3repCSXTntsMywf1TZTIo8IaTFA918AbUxAAA8GfrIgoB1x
	HbX+tGOzBHSZgtOQA5WnVqTN6OiUqzse8VZKDZ+UjxKS0sOfwGappRHsHqb+C616Z2k+cN
	ifQ344VCgdmFjU6y3fwGq4cz6mLcupOmwGQkySCga9wDVz3tDIyRtqz8CTOPdQ==
Message-ID: <80b084d130b7dc7406ae23e54a77706a4f42b606.camel@pengutronix.de>
Subject: Re: [PATCH 04/20] dt-bindings: i3c: dw: support up to two reset
 lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd	 <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet	 <jbrunet+clk@baylibre.com>, Andi
 Shyti <andi.shyti@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Lee Jones
 <lee@kernel.org>,  Linus Walleij <linusw@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Sebastian
 Hesselbarth	 <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
 linux-gpio@vger.kernel.org, 	linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 19 Oct 2026 14:55:14 +0200
In-Reply-To: <20260929061417.20733-5-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
	 <20260929061417.20733-5-jszhang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_055519_622598_90DD9DEF 
X-CRM114-Status: UNSURE (   6.24  )
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

On Di, 2026-09-29 at 14:14 +0800, Jisheng Zhang wrote:
> The Synopsys DesignWare I3C master controller can have multiple reset
> lines, such as core reset, apb reset, and dma reset.
>=20
> Update the DT binding documentation to increase maxItems for the resets
> property to 2.

The last sentence just listed three reset lines. Why increase to 2?

regards
Philipp

