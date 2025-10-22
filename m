Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA754CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yeLxlHF1ExWB5DZwZRxEYNkaxzkbdpoSKjymzjUJmE=; b=N9zD4alrUOphKtYUZsbR7f/wkB
	AOOJKT6o0gewLXJKTksroZjUM3WW9lOwrwiaGehua7jNW+m6lDRs2XaSi1uQRuPBcUP/0W9WCaGKA
	UalcK4C7NbElwcFKsF9asloDxRQBPQTHM72M4sc/9HVp/KElufxbz+k/3jHu//YYzCM6m/+pdCOtX
	G2kImPSMJ6d0jrkMPdgkHh+4oJL5dFhlTwzDmMGiImbeLjp5YWQYGG/Rz2qgSOGrvrYD8pDEDaYYP
	vKBQJwJ4yL5UL5be+JWRE+2+Vzk1z0ZlhBvOv+igq3TrJ9D3V5XV2pW0frllmq6B5hfvPIKXEFy5O
	NdBay+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUmS-00000002BgL-49vH;
	Wed, 22 Oct 2025 09:05:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUmQ-00000002Bew-0n6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:05:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C51B3C0B8B2;
	Wed, 22 Oct 2025 09:04:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86033606DC;
	Wed, 22 Oct 2025 09:05:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D3DE102F2424;
	Wed, 22 Oct 2025 11:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761123910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6yeLxlHF1ExWB5DZwZRxEYNkaxzkbdpoSKjymzjUJmE=;
	b=n2Z4tkf6o5U9c0lipN+o3XifhRcaEsIcWUSNkB4T/+bkjiLI0YovdjgK0wcw/J7+w+RMbP
	XXXJAB5sk0AgXJ84LV6w1+bAF7TfewA7Ru9eQQUYtqRfc5Mz8hPSjomJ0vzJimC6f6WSwx
	/RxHncJUqmBumvBArZb2tIXudRxorWrI/LUSkof3LpNucgeWNsVEkRp5WEsVVZK+YJCiDt
	2WpyPYSkFUyw42NtZYWtYA8vW4rVY8qo9IfQUOl2gFlEZkXCUFjf+zwFrTIIUZqhmy41P1
	zPVa0GTV+6s2TmWVoPZN/nw4n5xoyv9dLP8khMJ85WIi/0FKybbmO1lGqDabAQ==
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
Subject: Re: [PATCH v3 07/15] mtd: rawnand: sunxi: introduce ecc_mode_mask
 in sunxi_nfc_caps
In-Reply-To: <20251020101311.256819-8-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:03 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-8-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:05:02 +0200
Message-ID: <87jz0ntigx.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_020514_513627_875E39D5 
X-CRM114-Status: GOOD (  14.24  )
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

On 20/10/2025 at 12:13:03 +02, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> The H6/H616 ECC_MODE field is not at the same offset, and has not the
> same size.
> So move the mask into sunxi_nfc_caps.
>
> No functional change.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 70c940840dda..4118307cac15 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -29,8 +29,9 @@
>  #include <linux/iopoll.h>
>  #include <linux/reset.h>
>=20=20
> -/* non compile-time field get */
> +/* non compile-time field get/prep */
>  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) &
> (_mask))

This could probably require a mention in the commit message, as for the
introduction of the field_get() helper.

No need to resend just for this either.

Thanks,
Miqu=C3=A8l

