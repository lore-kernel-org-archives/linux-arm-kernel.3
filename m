Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20BACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBckan28ReRm+vHjeqo9hDBptTm2ZDo75/qWYq2cqUg=; b=l9/o6e20FpWc7KoUMUNzMUEcMp
	r0QBJdnkE926ZNu+ZyxQZnERv2efHa4p+sUkxpIaAUh+iHcMoBaBMWoA0H5pUyYBysf6lfVg7oZJR
	ODlNmxGUzNcTJHsqLFj4LNlG9zN3CIefCRRspEZ+1AKd8ylM9jFlm+X+kqqioaApl+q8F+rqOKYri
	nUsyi0FZ8JLEnCVIvaDhe8gZgXcqwWC/XcjAs8JiPbiS5ad4Tvpio9eGmtVCJwK02oy8TKd1oP2ax
	8MiL6Gzxz+8L6iao8fUSHhFNtnOXlQdPB1vkKCA6PcR8jp7ziqzPiVzEUu1uRyygza3nrZhT/Khee
	EF8oJpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZNm-00000005h1H-2pHG;
	Thu, 28 May 2026 11:58:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZNk-00000005h0x-3WTI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 11:58:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A74D060126;
	Thu, 28 May 2026 11:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FDB1F00A3C;
	Thu, 28 May 2026 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779969514;
	bh=wBckan28ReRm+vHjeqo9hDBptTm2ZDo75/qWYq2cqUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CIdxE/z/EY39UPxYgK/2ngScCHwb8bDMkCmmvEsxaLRWICgYUHP27cih64JbHi//6
	 /yHoigsrygZVx8ntlZOuaimw3A37Cz2I1U9KcU9uIL0mB0Ib+cL0MfgS3Xsdm6n0r8
	 cwcLnkb8Jv/gCjvJicwkZOjdOqULQN6gM7eEV5hW8aEwVytQb26y27gHGFeRfF07/w
	 lfD47iGqcs+RcmMiMRvQPWMrvFHSmJPuebkFiVmhNWvy3iESQPeR2arST8bbl2P7EQ
	 qOOq6XKizP1RJh3ezHacKO4UzRAZgt3wgoav8TEDkwTaGYEuOXSY04H90Aub5+rMs7
	 jsACbW+IrDuvg==
Date: Thu, 28 May 2026 12:58:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje@dujemihanovic.xyz>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1] iio: Use named initializers for platform_device_id
 arrays
Message-ID: <20260528125824.0f5f9853@jic23-huawei>
In-Reply-To: <1a45a4aade700448d7b1c702210ff147aaf21f90.1779962510.git.u.kleine-koenig@baylibre.com>
References: <1a45a4aade700448d7b1c702210ff147aaf21f90.1779962510.git.u.kleine-koenig@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 28 May 2026 12:16:49 +0200
Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.com> wrot=
e:

> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Applied.

thanks,
Jonathan

