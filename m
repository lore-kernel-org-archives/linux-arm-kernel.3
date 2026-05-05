Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BE9CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCwr5IzwXs1Qc4UinXjykqNmHwUAVjuU6Giar5Byk18=; b=Od0waVkn7jMSqVf4ZvdwLxQCtd
	mhbKEPcFvI3TWXDyOYyNQMbJ4B3ufvYF7h2PR1ZOjbwkBqlh4CMUm5QB15sXOoZpKGTTk8O0ywxFH
	LolQlyrBJRAKW47NbDHxwQIS1S523vCOFHWDNw5Y9KBUGxvGJaNaEo3Q4fxPJiqXc5NfvPSFjuslE
	1Mhv3EFL0KNGMgndW1GJBfjH0ktbBS98Z6t9uFmP89978Ye9oIgSLQj8rPvvJqxsACUo1OOU5deI4
	Tf3wJtMhElK4M68AON9GoLynDG3CXMzqyiYowSYgU7akgL8bKEwFli7XjUhjZo30RYa30he8Gq7FN
	VfHObh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDHf-0000000Fvz4-16Y2;
	Tue, 05 May 2026 10:45:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDHd-0000000FvyB-0YH7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8956A60128
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB05C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777977944;
	bh=TsTg/4UWC81TfUPMbovyHWMpmJYOhH0GyHDfnnm3vHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJ+tCkcSp6dpIN6tgYJu9sXU6+VcQHZ8W1zFFfUpjX8/2a9fzB+NHY0+oM5ubz08a
	 EPwvgLTTDYnpinWIKHchn5Dy51BJeO15CBCAgYoSTfMYMpBVxh8eq8iobw7dkEcy1p
	 BHY8T0doxouMzLmXwp0pTkjEuc2uxl3fShHQmUcuiJ1xAs/bHaG5CQCPo9Ijy+anqG
	 8nDhUF6mRHTCmsDmQ+NizWo3zkHxEPZIhZX4S/XFacjjSr1vBb7Uq3txgsQiIMLnSx
	 CyIuS4LHW+WbYQ1K3AhYpaaM6iGDu8+egCSAFp4PCGgCigVKMOK+OnXSLeMJ1kfQSO
	 UqMCCoZtKUD2w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso23034251fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:45:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YXCaXDmCO7Qe4qMf6DgXPrcC2jX0MRRu5ZL53cahRQmyX0leV1XuQ3Bt0ItL8si3+QSwjUfIoHOspPGT0rAOr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw335UQ+mu4NWnMFrdiSnQWQsFcqxmzLAg7KW5SvoSTqNy0zYfC
	rm20enyd1cJumpcQjWt2LBfeVL8P5qhpnbEDA5unNesfLTfcj8KwEjhAi/ZKXVmP+nIJYTzPO7V
	YlNJn1pxcrQrNAa8MZdx1UJs1/6WnUE8=
X-Received: by 2002:a05:651c:4198:b0:393:a639:4a10 with SMTP id
 38308e7fff4ca-393a6394c4dmr22048921fa.15.1777977943005; Tue, 05 May 2026
 03:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777562725.git.geert+renesas@glider.be>
In-Reply-To: <cover.1777562725.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 12:45:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLmg0-CviaWkzJi7xCvgwzz2KbVkmq-kqcWJ+2=uTNCoHg@mail.gmail.com>
X-Gm-Features: AVHnY4J5V-rMG0dWh1E5TLlvveEO0urdyGOidGxFOXsPqvTO1NYgVMcBKduDto0
Message-ID: <CAD++jLmg0-CviaWkzJi7xCvgwzz2KbVkmq-kqcWJ+2=uTNCoHg@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fix types in .pin_config_group_get() callbacks
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-gpio@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Thu, Apr 30, 2026 at 5:33=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> On 64-bit platforms, "unsigned long" is 64-bit.  However, when checking
> if all "unsigned long" configuration values passed to the
> .pin_config_group_get() callback are equal, several drivers use a 32-bit
> temporary.  Fortunately this works, as currently all configuration
> values fit in 32-bit.
>
> This series makes the code cleaner and more future-proof by changing the
> types of all temporaries to unsigned long.
>
> I intend to queue patches 5 and 6 in renesas-pinctrl for v7.2.
> Thanks for your comments!

Excellent work Geert, thanks for noticing and fixing this!

I applied patches 1, 2, 3, 4 and 7 to the pin control
tree, leaving off the Renesas patches so you can keep the
Renesas stuff together.

Yours,
Linus Walleij

