Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D8C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a5mHMgwlyejMsFJQNISCi2AvFfycqTH5EAXJVfXLvg=; b=Ml9NKfBEdSBc8l6t2frVWyppRx
	9T69fGDp7iGg1UaDZLon/c3HGs3EWS+pqnDueW0eQOpR+UHc0TOe8Jlb729N/Gz4wwtj0IIupR51d
	msjIJiUDAMgoXPr3Iv7a16JTf5fgTcUz2yNw4gCdMlRVXKDgQGP4aSTn355YNJZwYVfYMT+CkbJc9
	fkazd608yPprUO72d4jfJgh4GnpX5Z2wbHxVM8c7usHzALyjukxErqGXJ0BZaaTCHEgBLw4ORZDIL
	VXkjX8n6R5No0BZlkEbhyW/lhHK/lw1HDHLQE/RqehYIw9xnu/ZESjp7Xov+p+RavwnCHM2Ys2xnM
	p9yVOqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zpa-00000001PnC-3LVV;
	Mon, 21 Sep 2026 08:56:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZpZ-00000001Pmk-3uDw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:56:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A484601F1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B903B1F00898
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981016;
	bh=2a5mHMgwlyejMsFJQNISCi2AvFfycqTH5EAXJVfXLvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iWWAKtbeMFd8MTJIlJ8Ojb1MD8bAC2qJItwDlZw+33XW8Scrj1cRSH3A+SC2saFjm
	 xSZTm7SOnJsabYlSRk80otn1Sr7E/BXGymGxVMtWdhm4jznFjQ7HcQwUsrHHsPOJZV
	 anr4AvegeaXtkGEly6db3MshWhgfOCZYkulBM6gSySw1Whb+j40Ox0FCgzCvh7//r2
	 H5QhnFqgp0hR2lvJo5Gd6q6abZkMznlOuAbkh+lz5Sk/JlwOU0tqwN6EUnymjie5ne
	 tMB4crx5jBnGB/UMqk3uWz9Tei1nPxiNbXxhHMPq4BI0lX7tIGXsd4UjVNKBAx0JTT
	 1A9vt36jhstww==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so2456223e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 01:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzfYcikPtmtebI1B5sNxwsXfdIAMuy+jCEUHeGeLP9QsqUt8a+HF6fnbjOFwY19pQB6MAGBTCkdoSFPP7iDPql@lists.infradead.org
X-Gm-Message-State: AFuF++kSV6tWnYGB2zqlXg6FiEWASoG0SB4+Wh4S0LuN9L/BHzplnJSQ
	kum6ZS2fMrlM4RKAJzig6KyCYng35tXZE9i/FB7MH3/9Kq7jYhj00Kqv65XpKin4z/tJDYyiw3I
	58+FWG66Hb2asftGTKe2xgy/B6bcF7vU=
X-Received: by 2002:a05:6512:3345:b0:5b4:8658:a401 with SMTP id
 2adb3069b0e04-5b8c17fa206mr3083443e87.19.1789981015453; Mon, 21 Sep 2026
 01:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260921061120.29694-6-blum@kernel.org> <20260921061120.29694-8-blum@kernel.org>
In-Reply-To: <20260921061120.29694-8-blum@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 10:56:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ah_RX1P3fPr=QjJpzhtxti5wz7FB+Vs-TpmQdrKSbaA@mail.gmail.com>
X-Gm-Features: AcwNN1XALyjIwjQI4ZaIxHXpArCEdJ4cTcRwnxSkp5lz5jN9zOxBaiocFEsP44g
Message-ID: <CAD++jL=ah_RX1P3fPr=QjJpzhtxti5wz7FB+Vs-TpmQdrKSbaA@mail.gmail.com>
Subject: Re: [PATCH 3/5] crypto: ixp4xx - use memcpy_and_pad() in register_chain_var()
To: Thorsten Blum <blum@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>, Corentin Labbe <clabbe@baylibre.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2026 at 8:12=E2=80=AFAM Thorsten Blum <blum@kernel.org> wro=
te:

> Use memcpy_and_pad() instead of separate memcpy() and memset() calls to
> simplify register_chain_var().
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

This makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

