Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232A4EFB7EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbRgH0UtTsjSS/sUUBJIYwmqMSsMG4hsJxFOVP9rmJY=; b=2AGdE34fp6UsvVPhTUEsZPtw/l
	arhi0IyH7mvAYniNUbMbTuGVlew8O5llmvZLPB4dIejUyvfF3WF0GOpmZIzKa3PjfrSRKyfFLBOc8
	houOKGTOJ3GrzCw7k2UA1xebT3odz2GQq4Dw3mZoDJd2H7Gy6csfd9wKvPv+QLiY6ulRkLLnqUP+1
	k+9jRjaz4GsKZHIYWBjp3RfvIy5IK5wa+/RjdPLQ76aJLB7joUutZjh6FKHwMuNLPXLLsVUB8sVv2
	+9HpdwLiy+gzOm5jfcOx+JxLCOEhu+zEqb43ow4fQcUZfix9JzSWQP/mdK6PDWtVebxFuBi1W+10P
	w/4xhbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoky-00000001l2s-2L1w;
	Tue, 24 Feb 2026 09:31:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoku-00000001l1R-0tPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B5D961119
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F5EC2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925459;
	bh=qFoSCUCgWPxot+zyIzeYtu7f0ut9mFHpqgCHWGjjgGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K53P4/E8cMnSmO8HXEBk+HPhwRUhdtOg/3x+aVdyzjmmSzEjdI8mAe6HBSSDG/I7d
	 Z/04hSLguH/7VXjcf2ovKhDP3ez7imZQwJGRjNgZFkc16ASqhH7N/LT84F9q9opsbw
	 pvOrvRoZOr4XDe9A/m1dOL5+/d/93EDSWCWZMI/BqV4rIuA5hmJfIFAgRgV0LVdHtm
	 qkRvt0oe0N/1aJ0PMLEyxi/B3QzkZwL4iJ1mwP4xeq9mKTu2BybRh3CRGZV/dlTLSw
	 VwvN1jS4rAXqYoeZa7KGtdYUdanUmR09aqBJEnjnSpewe3Nd/pyZeQdVk8h3NntmKB
	 r8JXOoZcYFfAg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-793fdbb8d3aso44593537b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:30:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJ8R3DLUBmHf1RCWDFy2poy9302fuUJbo1q5EwtrpFElBTnTibPK+KAqeueSifY4kDDgVfjTHn/aLWFNK1Rp3C@lists.infradead.org
X-Gm-Message-State: AOJu0YyDYqfVgegvyJ+s7wXnD3OeMnCX/rs4T5u+4dKJ90QkEzXQZntu
	HWAbCbhX4eCIpvnjbX9Uhd1Z+xR4K5oZLQ5hnQiRM3MxJl1x//Ey5qYVh43JqEfU6eHxgtKkwyu
	PlsO1R2kNhVsfFyS7U/c2bePirdJu8T0=
X-Received: by 2002:a05:690c:2701:b0:794:7866:263a with SMTP id
 00721157ae682-79828ef26a8mr110201917b3.10.1771925458159; Tue, 24 Feb 2026
 01:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20260223105717.48779-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260223105717.48779-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:30:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmow3f-_W9hCRDHBjxUkVbS96ssnPchPfGxXNbSgrJyWg@mail.gmail.com>
X-Gm-Features: AaiRm50enX858ywcuPInWGfUc9Lmz7V_abesy4_4DNC9RBPnw7kMzwtulXV191A
Message-ID: <CAD++jLmow3f-_W9hCRDHBjxUkVbS96ssnPchPfGxXNbSgrJyWg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: Fix configuring a deferred pin
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
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

On Mon, Feb 23, 2026 at 11:57=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Commit e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with
> scoped_guard()") added a scoped_guard() over existing code containing a
> "break" instruction.  That "break" was for the outer (existing)
> for-loop, which now exits inner, scoped_guard() loop.  If GPIO driver
> did not probe, then driver will not bail out, but instead continue to
> configure the pin.
>
> Fix the issue by simplifying the code - the break in original code was
> leading directly to end of the function returning 0, thus we can simply
> return here rockchip_pinconf_defer_pin status.
>
> Reported-by: David Lechner <dlechner@baylibre.com>
> Closes: https://lore.kernel.org/r/f5b38942-a584-4e78-a893-de4a219070b2@ba=
ylibre.com/
> Fixes: e2c58cbe3aff ("pinctrl: rockchip: Simplify locking with scoped_gua=
rd()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

