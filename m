Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C08CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHlP+N8MaWcT1YqqHBfX7bz2ZZfGvtWUZIn+21jD6Gs=; b=GJRhHeWwfNdzsuc5IG0WsdIbC5
	bd3GQB8kPCYhVfCytWvg2gGlxw1it9udq53girSraDUEtQOLBNp/kGH49I6RyeAkvVAjOBLC3lX6H
	Taaz/nRaEDR7mqUyGZn45/RrUA88rgxW5dkQEoAkb9iZ2OycaVNsbCiFbqv+sDUCCBveiAN3SP7Uq
	tq3aj3JEY0kQYAO/GPDW91+JL5KYsIb99qp3vjQNPzp8/6qsxiSIpxNdQgN7dEJM8N7FaX++uwgbw
	ZgU5SnnMVjrMxbu5JQQ6gOOn9wi+zfudygWoq55ENPZ7vQbm4pEx5KpqB55yUzIASF3HxJ1/msT3J
	ZGV/uyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBV1h-00000002FQT-1WiF;
	Wed, 22 Oct 2025 09:21:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBV1d-00000002FPM-3sFL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:20:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F07D0C0B8B2;
	Wed, 22 Oct 2025 09:20:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0D45606DC;
	Wed, 22 Oct 2025 09:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1794D102F2431;
	Wed, 22 Oct 2025 11:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761124854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eHlP+N8MaWcT1YqqHBfX7bz2ZZfGvtWUZIn+21jD6Gs=;
	b=erNkwFCAkRFjaCf2oyUivOub+gdPX16PZmEEWEZLvuhwpXm6I/Z3WCmtWxue3XYiY8380i
	rAzFBUTDYvUDqzgowQ/DS841hHO6nYltJgJufahq0+5u1e5TskGHD/Y8zUfFFoNcgzfdSi
	9gsG+qjYOzLgcP53U5M1YbGBvZJOs/Fd28fTd/8uPlLQ1j6zaLF6i3nRO6xMRP/ufiIfxQ
	YRdniBbR92fgQ0dnLBLOaaJeWJyocvvfIUefMp/OYFov2NQzQ3QYy1RpopqLq5OPATFKbn
	FPJluRTC+HambRECsW4lb8MOpQnitaTKBF8z9IDTH1WGp17XnXVQFuPJkCONnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
In-Reply-To: <20251020101311.256819-15-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:10 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-15-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:20:47 +0200
Message-ID: <878qh3thqo.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_022058_141022_335E2B9A 
X-CRM114-Status: GOOD (  10.89  )
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

Hi Richard,

On 20/10/2025 at 12:13:10 +02, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> The H616 NAND controller is quite different from the A10 and A23 ones,
> some registers offset changed, and some new one are introduced.
> Also, the DMA handling is different (it uses chained descriptors)
>
> So, introduce a new compatible to represent this version of the IP.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../mtd/allwinner,sun4i-a10-nand.yaml         | 41 +++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)

Please move the binding patch first in your series (binding then driver
changes aligned with the introduced binding and then DT changes using
it).

Thanks,
Miqu=C3=A8l

