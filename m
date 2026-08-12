Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0803CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfDriKHlKJPwI0qKyg0STbkkscByIZsyJZCbFgT+ZwI=; b=DjF7GDG8WP7sJcueTkbgDKBSg1
	1wyZCGSZWrqzNqKR9n2AFRVgP5Eq5BYQQeuJASxWYG/x522nINM+8JjgOCY+iSGlZ/2ZCj2kCusMi
	z3yZGi7kD0JmLm/1PqmKrhHyhXpBAFDJEppf0aVr+dUt/BD4FFhmn7Q3r5UB3LGfot4awjc1KQQsu
	XbxMrMQRU7oY4zJY05iXRRct57lJNZoiAVYEsOjyyOkyvuzlrYETpdoZjBe0IGTElu93apqkXuNY9
	7apOTUhieK2eAwIMA8M/Fqk+dpqf3VD5qb7SKiq/46YWNK2nFzU9DF1LZ8czR8H2LVlpPUPlYfPVG
	dXhVsZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBmR-0000000Ga6K-2a09;
	Wed, 12 Aug 2026 16:26:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBmO-0000000Ga5K-0lYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:26:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-496b7622a83so8248385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786551970; x=1787156770; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yfDriKHlKJPwI0qKyg0STbkkscByIZsyJZCbFgT+ZwI=;
        b=mNLu6ddIo8vns3bAMmC3Jf9sks4Xer70Mp0y6FuZdEaQ4s+pnaYMT7Q7E+ZAFYVdyH
         zYWl4awygLRsur1ormMVp6GMjqUsPDDEQLOWIZpEAmkdVL8k8p8VUt9sjen5IYDBNwPd
         B3QIJNziMduHA/19zgd4UhEIlTN1RFPE8CP1I+qBkzyDLCvAkkN6v+Ho7WLCzUv2MU1L
         XYssnFSb7zHnHXasmMjUBi2A73URCSf87wE+P7B8WvKOPXqSBNqDy1UE2aH868LzCNbd
         /oUTYtxrJL9L/rWp4gsNSBlBuJXMPdH9tyOwpW8EkJTU2jpqNKqFhm1KxnjKZCvO7Ph9
         g95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786551970; x=1787156770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfDriKHlKJPwI0qKyg0STbkkscByIZsyJZCbFgT+ZwI=;
        b=czONMFxRJD38GCQLg5iwWprAI82pw6rAZeJidUxZM8zQXkbgvRrKw/Ghsf+HAvCdcJ
         SkrNiDs3XHUlCwYqxqUPF1Cc9xLV3AbOhOoFtrZ1W5k9PbkKky2pP9JId49I4dm2eoEo
         pSgfH/R/JWn4jB0BsfABi5aahDDf8Qb2iaqHiSWI2ml2rsanO7lNDHx0eGcKsGmzKcuX
         zuS9Tmcbnl7LWpr6xzQWLFnR7fQ3ZyYV7nJqALpowJXdfxyQEOHkPPh/fCtLyz276hYD
         9ub0SnoprMpT4qLta3psd/AmjpA8FiZqKGIh55maFABM0gbu23tqcAgiqzKAy2wKsN3s
         5k8g==
X-Forwarded-Encrypted: i=1; AHgh+Rq0dwNImEm/33Zc8ydnIF9WTxdjDwAy+xmPVpnRdTVw08Va4bxj0MDTFuWM86XP2Ce17kdyYNn6qHrQoapbMOLZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj2Jtw2SdPmIEFWqm8evd8+V47JWWshZGGQoQon99taL0uhuTG
	k0suMwMh66ZllrCnbAJ4yQc9lUbrWf5hlh/kbs2Hoe6h6IhzRI2jakaZIshBaiJsmcs=
X-Gm-Gg: AR+sD13K6lWn1lr2RGTNgGejLqmwUSE9XTA70SGfic/PqeQncUOVRrDPFzvbrVNu0Ne
	jLFeZTZFeCyp+4qqXs7PqQLss0cv+ESTAAYJNVKvUExSyq59wP/MmePIPnHFREcpKXA9DwWe9Y4
	1H0zsjIkCecN2GS4XQ/smlXDJfjwsdd+iDPavKQPQGzdD4DY1kR78V08gxWwsULTw5pl7r2nCu0
	ph288HIGPPLKcNW7E/ZEWN0A0N+CBdVJ20D3YGlEXxxT+RkqeXFzCZ78etnHk/bK3Pn95FEx6Zt
	qRh04SBrilDPX92hSbXFNXg+N8g5NsdYiSAT5EVhteyF1nP9dMh7o0J7MjhR+nmX0cGzEOfFg62
	VCPLeHJrx3AhD+HmcN8K/B88td0LDW3n3D5KdXXaDRj2pDDvZvb/GaSEU8moKLUWWqs0jYlKFB1
	WXMfNZrzrx51TjaTIpAtzFU32gADlICMjxHYL+1qIlUXY3F08+o9gUnYcTTCT+b4kjdtvmVYbdK
	OeXX+j02dU3Mi6brVnwbcJKxzmZo+FwK0PnFQgtNhZR8FiZ3gQ=
X-Received: by 2002:a05:600c:6012:b0:499:81ae:1020 with SMTP id 5b1f17b1804b1-49981ae1070mr1584685e9.11.1786551969802;
        Wed, 12 Aug 2026 09:26:09 -0700 (PDT)
Received: from localhost (p200300f65f017104d14d09407ec2ee4e.dip0.t-ipconnect.de. [2003:f6:5f01:7104:d14d:940:7ec2:ee4e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981abd6desm1552825e9.0.2026.08.12.09.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:26:08 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:26:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
Message-ID: <anyd_NS4D8KRIuEW@monoceros>
References: <20260812002728.2283079-1-irogers@google.com>
 <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck>
 <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7sx3vsomhyj6zol"
Content-Disposition: inline
In-Reply-To: <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_092612_232206_DC71186A 
X-CRM114-Status: GOOD (  14.55  )
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


--f7sx3vsomhyj6zol
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
MIME-Version: 1.0

Hello Ian,

On Wed, Aug 12, 2026 at 06:38:24AM -0700, Ian Rogers wrote:
> The changes are sent in reply to each other because the entire series
> is visible in one mailbox (b4 mbox), which I find easier to work with
> and provides me better context. Others use semcode to do something
> similar, but I've not explored that.

The usual recommendation is to start a new thread for a new revision.
Depending on the mail reader (configuration) new mails to an old thread
might or might not appear at the end of people's mailbox where new mail
usually lands and so might be missed.

Best regards
Uwe

--f7sx3vsomhyj6zol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp8np0ACgkQj4D7WH0S
/k4VQwf/YxOBBigksYFgF22jLmKVsFAaZptWFZ4gVjHqa7XnIkPvK/AFnjSipLEF
fUoUkd3vnJurJVn+Z9Agg7O66DLQ5ittOVmYJj4Abq1mwqYGycZd60kfc/2ULOZD
WRvK1oD/9wV3CFcmfHpmEdTB6lKOx+Cjlw7zXewYZ2lej0pp2BPl4pFB5N/c+ZxH
vXvYZujyIxk0W3PK08UukO2BqpSgVZx7Rz9STDRHPvypvUTcusMRl9dtWGepmmyu
AYWdYKpQtSjZeaXWgYXVqksQkIfP03QirRaq9ZntHeQvSZ8ogNiKUjBbG1wC1zhp
BZf+rGVBObnlJFRc0ldLhPETdUBHag==
=S6yj
-----END PGP SIGNATURE-----

--f7sx3vsomhyj6zol--

