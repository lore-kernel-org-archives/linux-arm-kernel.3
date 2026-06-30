Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F44C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xJeaRAiKHKbp/aAstXnsYKTpc6E8XcGidN9PLbZJKo=; b=heYI5XxJUVKHLVDIUYmEhYZjf9
	n3UYwYq2pQKW6SgJnu6lP5oF+g7AYCvAbmlAqgardNV9yN45dKCEDwHchAZWQh6VywLc0YOKlw6sE
	Xm/Q7WYFUqUu4j1aCjHj8xPmHQ88/N9H1pRHyE0riMxWWR2YtROl5Ks1pgZO8QTlkbUgESdp1A23n
	xjkzZw+U/nFNRLD7WClNiPwDAt6RjDcPMTJuuVXtguAufSyLi4vHqgfuf7AfmVFlpHvWD06LHlqPV
	GiALwOP1ZE29yBuRrlLKRQLpcKsp/8OmDh7ydC6ooXY8GoscOwZpRRodCtEV7QpRImEBg7xc0kdZl
	OvLgFqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegz6-00000000JPE-2lMy;
	Tue, 30 Jun 2026 22:31:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegz5-00000000JOs-1Vai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:31:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D4FD438CE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D361F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858674;
	bh=5xJeaRAiKHKbp/aAstXnsYKTpc6E8XcGidN9PLbZJKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bGKRFsSnQ0ajrm4CcAykDKHJt3WXV60tezDU/gKxVw5+MNudBSpWLQRT5SpDxo5h1
	 LmUYi4rg6YE4jgz3m3o69xY9gmDswalYy+dy2XG3MSIgVs1XWHLTN1BnZSkQ2ZNXXk
	 KBUJ5GKJQB/Z9KQvjCBIv0nn1dicJJoysGeF2ayUCue28nV3h7jbHUbZ61kSsQ0vVa
	 I2wsuS0nTlWofc+BgkEOUZ69I79aJmTC9TDApEqAkAHM7BG3PGMDk+Ft1EQPfh9ix0
	 NVquT1p+BjfYrFTQqUV8xLudOPmBD5IrCM4PXxyK4cdnKh0sSRa1ZE6M86sb1SVBHc
	 kdAZT8/cFewyA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso3733597e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq2MchlO6FLLc3Df2QKIX7l4HaqI5D73UIkSGYBTIgceH+904W5t9Bl3EbLeQMx0AInBBTlzE/MvxxnYj2x4nfi@lists.infradead.org
X-Gm-Message-State: AOJu0YwitZS37Ydsus1Iv7ti0R0HZqYLxVDAkMQo0E72AGzh6lA34REQ
	X7mSJPTVa6DS7j/EGVMhPjZDG+mfrJH26DO9amZ26tty+0x6LvypX1/jz/LJaZM4Z+La7GVq4S1
	rgiEO6pKQhFpA4gb1Jz2bFaL5xcg0+G8=
X-Received: by 2002:a05:6512:1389:b0:5ae:c286:c54e with SMTP id
 2adb3069b0e04-5aec286c65bmr321902e87.47.1782858673751; Tue, 30 Jun 2026
 15:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-2-v@baodeep.com>
 <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:31:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
X-Gm-Features: AVVi8CeD_JGR0lMhBhRY5S2FOUVA0y7Fr83_izAzoDl2Cf1SkECqUOqmnWip8_E
Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Viacheslav Bocharov <v@baodeep.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
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

On Fri, Jun 26, 2026 at 5:02=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:

> This looks good to me. Linus: do you want me to take patch 2/2 as well? I=
'll
> send it for v7.2-rc2.

Yep that's the best, I'll add my tag.

Yours,
Linus Walleij

