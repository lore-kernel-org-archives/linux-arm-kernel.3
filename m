Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0EFE9DE6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcyBxEdC83CwSQVeqd/+ifnZKhBgjInw+UKqA5lU87o=; b=J6ZpXNIi9ZTfrJO5qGD5MQ+7tH
	JSIxS5pzAJxB9DMKV0S30EmL8PndDXWsY0VihEIkcOS1o5r/nYGnGdP9YLaQ5dIcNxC0H2PB0h0D+
	9QcCUjmj6v2OArE5+jH6BlPoJwoSPKLkXurRwNQl1Wg+ySKWb4D7PLgcRrJpYTK7R+M7BdqmIP6x+
	MsFswN1DGPStez+ZW5QQTs/+KLxwHLW5hkx1h2XwyyTGGlZG/F6+Dr7grnOQog7cxCp8REHUkdbWx
	MSMnpqkuf7xJlu2tnnfI+YlsZdUOAnrXWMi679U4EvWBxEOlKBueAlbVUIPNP1sFcITn0YGZIoroN
	7Y4Kr40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkzY-00000009xqc-261J;
	Thu, 09 Apr 2026 08:44:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkzX-00000009xqG-289n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:43:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E58060121
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 08:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B69C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724237;
	bh=NcyBxEdC83CwSQVeqd/+ifnZKhBgjInw+UKqA5lU87o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YU4LpRfW8wM1HKoklft4RZo7//H5bYshqeN+VLfxQe1XinC9HQc2AWsbwGcIHCUDs
	 quPgrBjlSciM/uAzKHsVfiVGeImXpFnt3YsQ4HgdZIEXBCicGS+j8nuXtCRnJlBX8U
	 mM/vylpuUtEspWgAalnOfegWCz+VWTZ8UUoYFKntTw8Tr9OE/m2fri4MlQ44uSiOPP
	 2lCbaH1kdnjTm44cWrXrAt0k2oS4t7XH5h2xBdm8LaDWJaCQdgg7o8nhWv3D8kBce7
	 FaweX4FatQYKLA+CwgIXN4KIsF7D8GugYPHHFDu8Z0wVUWM6KqLUU33DkV9L5AdrF1
	 Gdlx1mgjwuuZA==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6501418152cso593050d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 01:43:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIc9hezH3qXww89WdwutbgBkK20e2cf2XrGDhJf+Kofv2maJtXTrPl60WYJxlvs/blKu/ZSDSL55OJXOujyZtd@lists.infradead.org
X-Gm-Message-State: AOJu0YxkuEgkeKJEIQIsChTlugbyPFbU6YQEZMbeUkbdFfBGVf6RidLl
	uBtej0dgxBaBTuO7O4jgqbgCZfVBtw8qE1jEXk1gCLOQiN320dB1nMo+ZCpgE7fzHLseQYreImO
	i5jczfaVji9szoB4+ZOCxhz+clDvz9CI=
X-Received: by 2002:a05:690c:6d81:b0:7a0:4146:6ebd with SMTP id
 00721157ae682-7adf1885749mr30709357b3.24.1775724236613; Thu, 09 Apr 2026
 01:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260407235611.550515-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260407235611.550515-1-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:43:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkDViw++2z0zU_kJ34MSn6vbBODjGFvdPU9mtRZKF=iqQ@mail.gmail.com>
X-Gm-Features: AQROBzCTxnAq_MMXyVcVYXsPtjsQhejsVfqwYdrCEdCdgzSYiyyw7RR-hhoaEGI
Message-ID: <CAD++jLkDViw++2z0zU_kJ34MSn6vbBODjGFvdPU9mtRZKF=iqQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Utilize pinctrl-single for bcm7038-style chips
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:PIN CONTROLLER - SINGLE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROLLER - SINGLE" <linux-omap@vger.kernel.org>
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

On Wed, Apr 8, 2026 at 1:56=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> This patch set allows Broadcom STB chips with the BCM7038-style
> pinmux/configuration blocks to use pinctrl-single. This does not
> preclude us from making use of a more sophisticated driver in the
> future, should we need to.

OK that's one way to do it. I wonder if this approach also works for
BCMBCA given Haojian's comments on my previous patch attempts.

drivers/pinctrl/bcm/pinctrl-bcm4908.c would then be phased over
to pinctrl-single, or does the MSB/LSB register layout create a
problem? If we always write 0 into MSB I guess we could just add
some quirk...

Yours,
Linus Walleij

