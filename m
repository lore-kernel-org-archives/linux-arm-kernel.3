Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqVcoD+405XB4dTq9LwwRgrp/fAbdnKCAah/kAR2S0s=; b=EyLZi5hPuNdJuPG72yc2ueZqbt
	bODYJsit3trQJc4XjsmtNzR45y1oldnQZzD+ccoP3A6INRL11YqtBqt9f0jWtcWzsGaeILQmizC+D
	1Won8hmEadYxToWcOnZRlw2quTWbYlmHVGNy2M7A+YxZa6tpwGiSBXR3n0LIF44YK5iMQ1wUPSm1D
	C5iv3Je6KAKv8RaXsOzA57v0ffJTPp9ideyzHKRf+35x3LWb/by/uvwfvy0x+CcSQ1bDCBIqDmNLj
	76R2hFQYKPeJC87Q9Re7kTRq6GIbjDnpqHOwmPenPdKoug8d4f8T5yFfjz/E6MbYfKzcPQQXWgObD
	fQ6lJu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkv7-00000007tyn-0Uj1;
	Fri, 03 Jul 2026 20:55:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkv5-00000007tyX-2cYs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2444B40B6E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 20:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086AE1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112131;
	bh=eqVcoD+405XB4dTq9LwwRgrp/fAbdnKCAah/kAR2S0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=My/MynzRjxtoUvw7r/ICdgMWdn5C0CLtzkoGiARZflSYt/ca/LUM0+WLZctYsanad
	 +JLMIXExRBh8/0QaEqnjeVMbn9toiw1M/4AeYuqkqWGp2GN6cq7H13f1dRj/pqcYL5
	 diLwEY1wKDRtUxkRmumRiOce+rbDpJotAlC9LV30Gt0lzbyfYLjlwVSiadqSFAYzE8
	 cW89OwxTM0IgRwYUcRX+MN27m/691ywULcqlGk+E65qU5UEETTgfeU+NSgIScbloc2
	 3VNNnJi9irb5mSkR89yA+uGsu2QivseosXPA8GTkDd96GKlusXLTjsu8WpKixCekQM
	 Ui4OrNvfgNf9g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aec139da7eso955428e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:55:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RquwPaddw7CqmUg41lLGp8TdiNlVjnag5NEycULq7sX6fhCnkwNNxCGFUAB0fFVsRlXILRzdfE3B+qEuDY4dzUh@lists.infradead.org
X-Gm-Message-State: AOJu0YwLc2I2jdWcsCm57vl95NFFvsCZEdTJsbhhfQrbGWJM9y1fndf1
	PSUKmxsHy2wUuyAXLVRWHZ1EkAorAV0oGRrLWDPcGMpN0XEpxCBHRgPedmdYXmpUuwamWeugDoz
	+5vOhf9GbJW++FprNVrbt6KealFONhMk=
X-Received: by 2002:a05:6512:138e:b0:5ae:cf70:a1b2 with SMTP id
 2adb3069b0e04-5aecf70a286mr1070249e87.21.1783112129834; Fri, 03 Jul 2026
 13:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org> <20260702154718.GU2108533@google.com>
In-Reply-To: <20260702154718.GU2108533@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:55:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLkrHWhywms9Qkq5LN2vPB-vJu6mD8QHTQVuxRkrERjZVw@mail.gmail.com>
X-Gm-Features: AVVi8CdgKmUkgHMlUvcumMuj83rO54PKjcW-kf8rsm-Rt3X56XnOOTXP4a4_NDA
Message-ID: <CAD++jLkrHWhywms9Qkq5LN2vPB-vJu6mD8QHTQVuxRkrERjZVw@mail.gmail.com>
Subject: Re: [PATCH] mfd: db8500-prcmu: Fold dbx500 header into db8500
To: Lee Jones <lee@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-sound@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
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

On Thu, Jul 2, 2026 at 5:47=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> I won't hold you to these for this submission, but they're probably
> worth looking at:

I saw them too.

I'm taking this house renovation piece by piece, so this is
kind of prerequisite for the powerdomain change (will send the
MFD part of that once this goes in), then after that
we will find some more etc.

Possibly I can do a bunch in parallell.

Yours,
Linus Walleij

