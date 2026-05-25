Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C14CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObdNfI5fRqfJIIcKlQbPop3ngHHcDNx/vctIeR8mt3g=; b=m2NyHzuR6xY/ZSWsTjPZt4sqnd
	VK36+ZJiS/Of3nIev043DEci3EdNc1jMkQBMRK76v0xYbcVWQoQolaRCuX2XGwCTF575+4BHEZYhZ
	UIJd84bKv+W48sizeE1ROeRYZom/wjcdm8gX+yta8dZsKLGbjNs7tUT5HTLkKEAJ7ZaSl8uPHfTzK
	dKroHL8fiHQKZ9RWLpOLSvZkqEuduz+JCU1u11jdItceqWZV3Yo61Y09NLl4W7rz3zSevJnb4MsAC
	m1s7pu+F6Pknjjp9kECtFZvPjq1zp6I3L6+RwliONan2upcGyS0CwSXczjGZYbNsaUCuu7S1sfVt6
	er5qBDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQYD-0000000GchB-3kdh;
	Mon, 25 May 2026 08:20:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQYC-0000000Gcgr-2Uju
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:20:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9667460202
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5C51F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779697239;
	bh=ObdNfI5fRqfJIIcKlQbPop3ngHHcDNx/vctIeR8mt3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h0Dl9BHbfR8AQc1rX8YSlF6LoL2ja4lMPcjb4B9y4pIePrfGstISgdYM2HTu/mNuA
	 0jz+4R9ZDuJMheFgczUdERnI2wG4WHLaqjehO9NHaPxT8Bt1RVtzKFkRj5GtgfOzN8
	 gPc3csrqhUp1hT/86QaQBwV5/Fjs/gVzzlC/l3kzJHnIc4swHc/mT6HKNNzl11dIov
	 OUk+gp1H9Dx4BKy/wMwlrSoN7Qud5KloUWxPcJP2D2XJf0N5/bir6vvOGw2pU8ENs4
	 7m19z97F4IMVV04C/WVr0u6eNZJ88+SrOx0oAyeq8Oa6+Z4GgIbnBBLQb9gy1s0n4M
	 vhpOHnPZR7Mwg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa2691db86so8271287e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:20:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywx2Ik9MrsNGdUGzEENI4iG0I4Dc+8sQNAaG/v6n4fq03/wxvnv
	gZBBwH23plbxgK08ryrUXm/n2Mu9/AMLgbT2t7Osm0K4ZMFJ+deBQm+cSeqDYvYThKI3VyxlwBc
	iNHp56x3/Ey9X6f/ycerMWH9fQlhEFG0=
X-Received: by 2002:a05:6512:66d0:20b0:5a4:1096:94e4 with SMTP id
 2adb3069b0e04-5aa3235cdffmr2868165e87.2.1779697238061; Mon, 25 May 2026
 01:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260518024051.189979-1-enelsonmoore@gmail.com>
In-Reply-To: <20260518024051.189979-1-enelsonmoore@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:20:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLmiFqOZCL6OxZB2g0k7dY5=XTNMmz2p7BfEhPdgWk=X4Q@mail.gmail.com>
X-Gm-Features: AVHnY4K8LmPH9KYJwAUA3Frft2O5Siwb98vSeAMcx7NCrrib-rx6PNWIyt-2b6A
Message-ID: <CAD++jLmiFqOZCL6OxZB2g0k7dY5=XTNMmz2p7BfEhPdgWk=X4Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: remove the last few uses of do_bad_IRQ()
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
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

On Mon, May 18, 2026 at 4:41=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:

> The do_bad_IRQ() macro simply calls handle_bad_irq() with a lock around
> it. It also carries a comment stating that uses of it should be
> replaced. According to commit aec0095653cd ("irqchip: gic: Call
> handle_bad_irq() directly"), which replaced another use of
> do_bad_IRQ(), locking the IRQ descriptor is not necessary for error
> reporting. Therefore, replace all uses of do_bad_IRQ() with calls to
> handle_bad_irq() and remove do_bad_IRQ().
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Please send this patch to the SoC tree (soc@kernel.org) after review
so the SoC maintainers can apply it.

Yours,
Linus Walleij

