Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0BFCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fRrsqvpg1Q6JCWfd2TcBUF0ojUJZfugzjbRvfHErgU=; b=E4UJtfW79zzqnp
	HfkXNGMhiEGH7A6kMu0YakiH20gLmttx2Lb71MQoe7A1Lowk2z3gRb5CUWwbuIr9qmWKKpCrecsbV
	3FoxCoN7osxI01bfGxtq9oqUVQEvyDxeb4vtetlL8kh+IuWSSJ0V3htPGYx68Cr2sWJfvt2P/nPlK
	qJliwLp9PfJjMNWVjYyPTFawk3KwnKZUV0ITyNswgt+Ce+NN9Qdvs6RdnPZG4qvbbXzNz+unFYymh
	kyOZpKw8Fv+Io1x8uFOiW6kqUU5FXhvG6rU7miPxyknwOBvG0kc4acK/MwYrcoZ4IUiXXrAHu92hN
	l8y/ukxDwItXzeSeSbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyPZ-0000000AQNA-2zAb;
	Mon, 03 Nov 2025 17:32:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyPY-0000000AQMv-1eP4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89ECC600AC
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA90C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762191127;
	bh=3fRrsqvpg1Q6JCWfd2TcBUF0ojUJZfugzjbRvfHErgU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=qbC7Vn2l1XVkEmbWdOLCxZ9QlnsD6iVlXEOqjhnQoDuyIdu57Q0yPEvT9k1fGGDE0
	 fFUX6As5NT5W5+Lphtv9vA45c9gmC4XtCj7ScBUv1pv+i2QTbwzhBPFTWOxjAKXnxe
	 WC4AaeZ4k7y9bAQKVbeHpIH8ucC+a2jEqfw8VKCdyuN3OnaHRIVNE9VSltHs5PV4pS
	 3EZytlnUZUtG7TiSjVZFq7mLIIXCMV81cV7I5TpwQKw02FFIePxgBVjUJv+HOVKcTs
	 uWdXdeCrFhB1Shov85+kAht0uo8lz8xBuGwCxDUrOaz2weuHm+BQjYj+58FjKV9tP9
	 UkMgZUrN4acug==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a38e56dd5so8543221fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7YQjdwUn7TLF6xnmFIZ9AptGJPMJCZWnnbs70iYHJ2l57UMswXfxVmWtqfuepdS4fREiO5z6FBjdWqvyoDQF8@lists.infradead.org
X-Gm-Message-State: AOJu0YypCo/lKP9RNcVZH29Yo5Yu18oYERy+3zDjn9INzDEJlUy9rafk
	e9kG/rzkZOAD5voe0DI5EUGdYA3dXKfVc3nPJ+4loKRHe2CJplH1uDr3OVjF2CI7A9hYpcsS/cb
	oV8LNsz/0AGhjmV1pmjA9pssq6sAZRRY=
X-Google-Smtp-Source: AGHT+IFTQffhb5i+F71J3LOhF5jx6hQRYOqxomHkplL/413quHMbU44WrYZZRRChAb5ZISTcoMgWobqdOxBAKEL0T+s=
X-Received: by 2002:a05:651c:1c8:b0:37a:415a:1fb4 with SMTP id
 38308e7fff4ca-37a415a2387mr3245231fa.0.1762191125657; Mon, 03 Nov 2025
 09:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-29-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-29-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:31:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65btpVvsJV0wJ1zNgyej7LEkd85v7ivpPp8ppzuDxUkow@mail.gmail.com>
X-Gm-Features: AWmQ_bkXFHKrewU0eoPao6ZZMOh9kve-I6lS6VpRvTzlPCKA65lorBRFqLDielk
Message-ID: <CAGb2v65btpVvsJV0wJ1zNgyej7LEkd85v7ivpPp8ppzuDxUkow@mail.gmail.com>
Subject: Re: [PATCH 28/30] drm/sun4i: layer: replace mixer with layer struct
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This allows to almost completely decouple layer code from mixer. This is
> important for DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

