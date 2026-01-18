Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF15C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 23:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cpdJb3snyBWfzegv/aEp+BTWDHKlbrKi3ScV1tcm8Q=; b=v0nof4mEECIA7OfWnvIL+AvwHP
	n3t2DwNKcvS5n5LMHvOUEsk3Thx6BYUU3JT2FYKrUrwtTPeaG156761lc//mfO5xRt/jSCYQ96826
	4XMC0i+zrDfBDXuTvQgq17QS8+uSi0/rjprou4zRuGgpDelFjW1D7tWCv0uvQLoxZvXrTRfl4/zXa
	x9VG0mw6m7cpJeDlBpKx4K4I4a4lHE9AFSiSiYOd/C7hqfSIUST0Z2nvufwgCTSeBf274cgo7OT0N
	C1dMcIqrLSvZm0QFs9pw/RKnSImwo9yMPg8+MY5qBn3A3alf6+dVUzdo2dCma7JAEbJqklK1o7K3J
	C+Msx6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcTY-00000001AVb-2f0J;
	Sun, 18 Jan 2026 23:46:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcTV-00000001AVC-1zFg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 23:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 294864410F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABC7C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768779988;
	bh=fmJuw03++MrtIEVUfe9zccVFflBW/PgCC0Emo6+ulTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NG0xx4gk2tiotdywImvLyI8SkZ7MgbzgjHASbWxPsb2rXV65AbRpj5WctL7E9GSs5
	 uA0+yGKuWSHg6Ui7PGWXAXdWxZHxXqF8ruicxkQg2VLyaiX3Ygf5fqAmVoB6YXb6km
	 D3u1rb7kNGgONSP0xeVVPz/TdXrRvNy8RO0uxfitWX12x3jb1ZNo/njq/UNtsEF1+P
	 MtjpZ8xcsF2cwxTqwo663X1YycCEh9Zg1Ldfr9I94zafksXx7wIanBPxZxy2NFvkpg
	 lUD/E3jU8q4oDjinl+pMtzUbwbMO71X4Rsz4/ITS/ZgIuqT9f4MmyKxkEMLlPT1Y8A
	 1bMwuafRXPIjQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78f89501423so46522807b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 15:46:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQ+t+mdtST/Jl8fTpMyKndTHoMW680gNhtWr58hzNV4GUcE7VOG6JtVVYJNSLf1yhgSz8Um9R95VFEnEw1nykd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywse2O/S2hJ6JyfTIR7Q2MaXh968KL/FywUDKM1RFtif1bbxfj1
	eVv3diCP0095X/YkCVJWMWzfo589JbI8VhILI98ZEiCF8FrTEDotgg6u2slw9w5kj9yn3haB/bd
	IAD9Z0qKZSKFThG0+Gdo/XXp1uGMeJGw=
X-Received: by 2002:a05:690e:1883:b0:644:5166:3065 with SMTP id
 956f58d0204a3-6491692f165mr7106290d50.21.1768779987241; Sun, 18 Jan 2026
 15:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20260117180615.10368-2-krzk@kernel.org>
In-Reply-To: <20260117180615.10368-2-krzk@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 00:46:16 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5q6gvy0OEG5H4VY6=NJwpdrFk6hyPbhc4vBRAD3hvEg@mail.gmail.com>
X-Gm-Features: AZwV_QjiBOvy-Nk8tBAVu1rug7zhMUrm03mPDCdZcDEnZnlbNgNLxRql5ih_ybg
Message-ID: <CAD++jL=5q6gvy0OEG5H4VY6=NJwpdrFk6hyPbhc4vBRAD3hvEg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.20/v7.0
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sylwester Nawrocki <snawrocki@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_154629_548069_99CF39FA 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

On Sat, Jan 17, 2026 at 7:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.20
>
> for you to fetch changes up to 8c483209a6fc71a555fec4a0c99b05e46a5bd38c:
>
>   pinctrl: samsung: Add Exynos9610 pinctrl configuration (2026-01-11 12:1=
0:29 +0100)

Pulled in!

Yours,
Linus Walleij

