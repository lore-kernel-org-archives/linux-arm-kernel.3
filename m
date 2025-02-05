Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD8BC02199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgbouvaIpxAOI+/T/j6mufdIysNVPHBLHY7/8pAZJ8Q=; b=pqCVhEr0lCD25gEm+7ABFb2+X6
	BkMOkTHpVboBvz6ywweQlI/drQYgUI4iMd4C35a25ILexY+hrhZpWaXgQaU26lfS+sViqxjmbLg36
	q2HFrtmC0AVqT9BryNQjmsoKuOhQeTxvXFgH+7tHYfFFtJEAEFGOdOPCP3ivTkZQfGM31jYkl8Bz7
	CpAI3qGsn6GZjXBMy0O1zBMOWZ47dp6c1UzIVCHF62N85O4BJqa4NKe/gsHdCRtK6cKImJ2X4RRpN
	Bx8TN1pGKuYFZ9QDgRcIiXhvV5l1n51PzNsaqEExfSMBS5Iha4FVuJW91QCfmJpk5lb1KNtSrJ07l
	63Mc/qJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfksh-00000004NVY-1m1q;
	Wed, 05 Feb 2025 19:16:15 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjjd-00000004BeV-2ht7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:02:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23EA44321D;
	Wed,  5 Feb 2025 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738778562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgbouvaIpxAOI+/T/j6mufdIysNVPHBLHY7/8pAZJ8Q=;
	b=l2CdekW1RepJihNgiSiTw/1ixasWr5S4a+WcrjbPeHSeaXr3L6s1ig9/3XzAY3dIai8aDQ
	FGQziHfbz0/zTcLHfrzzNFLOE9/GdRrt26LYvbkKAo5CWmiDQQA74+7kH3Qyp0b0xr15bV
	8Jq8Ekw0akYgZIv1h2+uXNP7Smtv3wmbui7XPKW2L5gcGj974PmSUxNykul2EbMKwjMBAZ
	UJCKBSV+hNwXq470bcLob64MNVtBOfjl3gQUtOOsEySVpWKub/T3cn0QJm8hLZ3m6MXSWb
	NKygQmfWpovWd6I4bNGT7+yikBYb+rNR+C9DO4PDHcQtEkwJfb4hZbEUBc7/Ug==
Date: Wed, 5 Feb 2025 19:02:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje.mihanovic@skole.hr>, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] pwm: Add upgrade path to #pwm-cells = <3> for users
 of of_pwm_single_xlate()
Message-ID: <20250205190240.0cdb0473@bootlin.com>
In-Reply-To: <1829c1a040c707326d9c53aee3577763e2139d58.1738777221.git.u.kleine-koenig@baylibre.com>
References: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
	<1829c1a040c707326d9c53aee3577763e2139d58.1738777221.git.u.kleine-koenig@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepuggrnhhivghlseiiohhnqhhuvgdrohhrghdprhgtphhtthhopehhrghojhhirghnrdiihhhurghnghesghhmrghilhdrtghomhdprhgtphhtthhopehrohgsvghrthdrj
 hgrrhiimhhikhesfhhrvggvrdhfrhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguuhhjvgdrmhhihhgrnhhovhhitgesshhkohhlvgdrhhhr
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_100250_130781_E6C45DE1 
X-CRM114-Status: GOOD (  15.00  )
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

On Wed,  5 Feb 2025 18:54:00 +0100
Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:

> The PWM chip on PXA only has a single output. Back when the device tree
> binding was defined it was considered a good idea to not pass the PWM
> line index as is done for all other PWM types as it would be always zero
> anyhow and so doesn't add any value.
> 
> However for consistency reasons it is nice when all PWMs use the same
> binding. For that reason let of_pwm_single_xlate() (i.e. the function
> that implements the PXA behaviour) behave in the same way as
> of_pwm_xlate_with_flags() for 3 (or more) parameters. With that in
> place, the pxa-pwm binding can be updated to #pwm-cells = <3> without
> breaking old device trees that stick to #pwm-cells = <1>.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/pwm/core.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

