Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D70FB519F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=js/60XcxEgznRBJwV2ujw120fs3UELKfKXD5uMVygHQ=; b=D9alRyDFIWNw1e0mQYYlR8aVMB
	0uZEKuMDNJuSVk6/RCU6d6Pxl1pkZLFGv3toDaaTJixEXaVH+5YoU1kttnwy/WtQDEOO64cpc1L8v
	f76ltLEuNsplpQKH2aEV2cvBeyb6zyHv/cfHKFfTHE142kwflOes0UVEInl849jo91QmIjtmWtZPv
	4/WwrYiUhdfqY73qgVRuGt+SBxLg0QPPjqQjP0jbLB98cwiHbXFkt4hs6m1RCcvQ1P6PndwElJ7vt
	T4q8hyE/Tcua/ybVb1tWEDy0ZARmydTauCwS0qRE+ELUaPpjyXVl2QYFLXgIlvcFUKC4ywPnyi3iX
	hoiPXlcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0FK-000000061ej-0FIe;
	Tue, 07 Apr 2026 06:49:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0FH-000000061e7-0I0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 06:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39F2244432
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 06:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B79C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544546;
	bh=HjjlIen8rUrvGYqNR05Jq/L1IRmPKRpg+nH7yZl2hRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kGNC2/lqyiujlvSY6SSWV8fe8eVTjPMe5dVTVNEl1a/g9RTwdfCcLBylgtyOdnWyO
	 j5JN82QNLKuFCexfdfAmwq9aoCsnnWePrIknivfP98412hCf00i5/EH614vO037t12
	 18wfYDVEC8WS823YkuRKRufiqess1ghcV91OvDZFFDO2XRw4UXJjZL442ZShZFxWOq
	 nIAOrcpc0ENNVeLec61Ua2bnpxVE90J4bNNqIm2BLSPpHIWyM4eCnJyZsH5ZEt+UrH
	 pI/C8sG+WOjxUwU9qwXOfxv3uRqJEoKUhSc+eYDQNhghb3n++zAKyy5JWYXcJhRdoI
	 CUNnylxTI4Bpw==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79ea87af213so82251777b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 23:49:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwJ/zbMONTl3Wlbm0qlrB/WiZXvx2tbmwHmjWzxj9JRfwGXTD+B8DbjZTINseQMWehphTklYrQMt4MZU/E637m@lists.infradead.org
X-Gm-Message-State: AOJu0YzDd6dw2p57CLD3iyUl3bIJXsYUGloJ3cZjYntXoWIJ/S+xo7GE
	4TEani7uESiU+i6D7qMOdfqe8Vv8ATlVk5PMqSfA5GqbKMS9seyTL8JHiFaqsKiRE8BVV7t+5fk
	r3hoc0jWrEAUj2TKFJBqLhuGqDPNkCTU=
X-Received: by 2002:a05:690c:4903:b0:7a2:46b8:3858 with SMTP id
 00721157ae682-7a3be360aaamr143427997b3.24.1775544545311; Mon, 06 Apr 2026
 23:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com> <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
In-Reply-To: <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 08:48:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmyf9mD4FgmLqNdrP1WdFgQptGZ7KbVOhwYCRrxZQXuHA@mail.gmail.com>
X-Gm-Features: AQROBzCgkwudsrLfavBP6ja7953ovvgx3yZllIUGcsr7ztcvvCdDDTr3vn9C_-w
Message-ID: <CAD++jLmyf9mD4FgmLqNdrP1WdFgQptGZ7KbVOhwYCRrxZQXuHA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_234907_124195_36E0877E 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, Apr 7, 2026 at 8:42=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:

> >       mux: add devm_mux_control_get_from_np() to get mux from child nod=
e
>
> Didn't get an ACK from the mux maintainer for this but this has been goin=
g
> on for long now so I applied it.
>
> Peter: protest if you don't like this and I will back it out.

I created an immutable branch for Peter to pull in if he want it:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-mux-pinctrl

(You can also pull in just the bottom commit which is just the mux change)

Yours,
Linus Walleij

