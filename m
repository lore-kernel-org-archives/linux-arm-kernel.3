Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09679C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 22:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=; b=TwaoXR8DJkeowgn60QBO1lQJKn
	sFquqaXjPcVMiJaNgffB4l4G1y+NUyd/SO400iIn6zKOsKDGH5XFYZPivHSRFEMivhY5JL9O7gOyp
	V4ALswAk/viw6lSDay4XKUeFuNPxJ831F5KalpfTxdQ530D3hUGTJNpCfzw8xd7U//EWKfQ5se5e5
	9QQgAGPavd5+PX28Ql6wYenPampv0SXAmA9B/rqxtM+/1ZiXUnnyxLS/Ufqj19FWgIZYSvXb66Ifr
	68kVFoVFicW+D16HTMRzXVqnNhgUFcUofkrDwzG1fPpOjaPR/sq58zdOZEdQq0IH1M7POllzJYDNe
	wAxOluLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2Zh-00000007oVV-1teN;
	Sun, 12 Jul 2026 22:23:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2Ze-00000007oV7-2s7R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 22:23:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1281595f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894977; x=1784499777; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
        b=VPlEAYSRtO2SHYOGXs2B5k5KBGxJCr8f15/hERZdjGabFfdYfQyDTZN23jOIkRJ01A
         cj3GVQDxmtAnqOi8uxFsAFl8yYS3reyilRI/hE+0QtFitIHYJbEhGs2WjUGX36c4elU2
         j6yn4/Vg0hhqMjGR+hgEmEaZdf0YSl1oyWoX4I7mB/YhXoq32iGq5fh74ObYSbrLSI94
         KkJv0kn5DHXhsrfAvhHAJiBgNRacmcVpli/HzDkEVK12LpNlFmLx34nlWzcSe/U9HcNm
         g6cPcE2Z/soliLHNdd92SF4Hy7ERIECRbxgSEIrc/mJz42+rCvnkQaqnzoXgSMhpqGzr
         BQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894977; x=1784499777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
        b=hVBB0pVrPo1/45E+BKr9nyWsoZtgQ3JGgC81ePfePOAi6Y3nErlXPH8T1/5kue1qbS
         ghPuOWAS2PqXB8opMjoq/F8QgICDz8Fs1UIDqkFEWPbg1z0RuSXmESx9Zx3rW8NiOcqR
         BqFoUWHgX8L6EdyG3cL7P2MYm2DxLqv+xmi7BC4OuHLD5lyP5ubN2yUk3/eRlvMtz31y
         vcPkRgE4KdkZvkZp6Budu1kmG/2sr539dWARRxtHA6TDM+tjVzL9Xqkwm86hWlGXz1P+
         WJ7ZlWGSudIUDVwAqz8JzF8IoK8EEWLclv82yP8RYLFjFIFelrpTaAxxeXmyM1DbuIth
         LjFg==
X-Forwarded-Encrypted: i=1; AHgh+RqchdsF14Fe5OTBh90AMNt7IYrpaLsqxVkF22TMNfDG64wrxOmoMo0NayfA7Uno/lXiyWlfJ6KwrO4v0UINdk08@lists.infradead.org
X-Gm-Message-State: AOJu0YwxSk93GRgmTg4KZ+hJaGmSMQMOptEUH3rymaqYisEOzhmGvi4Y
	lCbVFT5e+9QUDf+j91RASzZTenjsNSSGX7q01BHVZ60l5FAX5OfiyVXo1PFfT4fqNdo=
X-Gm-Gg: AfdE7cmc7bwqj7UVFdp8EtQgEk/lSAKnUJTkN/QX5cf2fsygiIMAP9J5be0jbKUargq
	Bcx0gm4shd/y5xOkX6TU5LF6pbWmRiwXf6Tu33FbDmuiBCRi9Eold8waJwaBep5ym7vBKqfeynh
	XQms9SENOTLFAp8dr+P/0aO/lUKAdF9yxLHzMtqPoOxCX0Vwv7cY4Iwzs/ORLcy56FqEtmr45nR
	fzlIu859EmDAkbV5S4y6cfeLMOWbnTou5jpC1RIbsjtdPvTtbiJttodbHdTmSh4xY2+eSLR0c2W
	LxLKyg6JF6SQ/IrmObrVhw8mHNALjHQ65voGOE9fucDx8sID8k1iFBr9W9ouVksMMTqGjBdE/70
	lUD1LQvmPnn6ELZWNqZsMTlqw6GroEV0hkCVPU83F3Rby8BA6gigfywsp4SxO8wo1s97wnX5hPV
	h90hzrHwx25OOJP4sbeP62XmLsHqwk
X-Received: by 2002:a5d:59a4:0:b0:472:9bf7:2f58 with SMTP id ffacd0b85a97d-47f2dcc69e2mr6731266f8f.36.1783894976653;
        Sun, 12 Jul 2026 15:22:56 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm78667437f8f.34.2026.07.12.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:22:55 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:22:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
Message-ID: <alQTnZwVRwpVTVUf@monoceros>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ak3qgcbynp5sb6ym"
Content-Disposition: inline
In-Reply-To: <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_152258_742249_050E20B0 
X-CRM114-Status: GOOD (  11.31  )
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


--ak3qgcbynp5sb6ym
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
MIME-Version: 1.0

Hello Geert,

On Wed, Jul 08, 2026 at 12:15:08PM +0200, Geert Uytterhoeven wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Ditto for patch 4.

Thanks
Uwe

--ak3qgcbynp5sb6ym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUE7sACgkQj4D7WH0S
/k692Af/VsqjHq8LAyiXwd69+QSwZHSG0U4MEBmnqkTcJ6mPo3Q1tfbuac0TZGpR
buYByMLca9o6W+7RHLvf+/Zr3Deak9AlTYe0KCuPpU7D8l92MkJ9qyU4qaQWyxrI
Hv1YMMYA5G+C8pvTfUspprOv7ql6Xa7cYPsIo3jLpjbhJL3dg7EiCHHjEt/TyipW
XDBbz9nhJzlzRZZzwDROzHctrH75sRADO/UfFjRhtDmkYC4qRs2tvJk7mEMQ9TG0
ZBnRKl3liOyOP0apWQ9wSU/MuVwRJ+l7pTHIihy3BPhzxJM+7fQFIzy3bdjFMWZY
qnwvvfAtAsXvn3SjgrZe5nuPmhpk5A==
=z1Ow
-----END PGP SIGNATURE-----

--ak3qgcbynp5sb6ym--

