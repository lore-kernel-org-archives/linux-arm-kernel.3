Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C88CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAX9hMXPiheaabgyT1lZXM8onJqkgfJ6l93xnHwfAq4=; b=4hjXEoLDkUfwwbNW4ZK9clvNrU
	qS1cW+syBWUmjS+Y+yUI8Ru9XG/MJXTmVjbbPhajLC9JXDpL2Jj9RdvUFk80QM50z6e2BXPjx5hOo
	zKLmBb6BhPyYl+9Ij5KUw4Vu8kl3V8eY53YHGGXmKU/2Ttz0nBCyqn0txQhQMwwsDu1jHotlOGRL9
	EDVzh6YZHofjAic7uBRkiZ+MloYRu7r0IRWFOUR+IcDpqxis88QZSWLGvFaUx+zslRCs2MJKUF2UK
	SYTf9z/xrVIMNljgNl/pOPvDT7tFQe+Q/gjk8DuCnVHKAVh3CQHQkz2oSiIOA/TBKwtuuGNfm6/dh
	XvIfSKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsRs-0000000EbkU-0ywk;
	Mon, 18 May 2026 07:31:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsRn-0000000EbiS-3HTa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 07:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zAX9hMXPiheaabgyT1lZXM8onJqkgfJ6l93xnHwfAq4=; b=R3GvuhPspba/UUf1KZ8/7ZMjpV
	KBQyNDj7Dfv0TrWkFKw0Dm75WNFpwX4IIP6RKQgAK7VZhCTaJmVq5z9P0U/g7V3b9FvWezXm3AyT5
	dtirI17N9luiyalIwuGX/8pIiQyAZoA2XqbF9Xqp5GQMJcenvNiVxOhFWuL339rLZ97Q+wI0FtkR6
	x2RBKOhIzh8ZKcoPifL6c2bIvE3k5r3FeO0FudnZEz7tHZq1lqTjT/dg7peG6gdE9L7B4qJmA7pQu
	8h/zGs11q2FsDy/FThvpHuDky2nFNLI+10/hiSuQ5FNC3v/BpYwswKbDwf9vam7RGKCAQkb2f2P4V
	ZXZRJ2Og==;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsRb-0000000ABBJ-3Nyk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:31:30 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b4583f0a1aso10791165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 00:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089478; x=1779694278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAX9hMXPiheaabgyT1lZXM8onJqkgfJ6l93xnHwfAq4=;
        b=j/bDt/p+MU3+bDDLkL9VHAXNF5BdUWqY+TxdnVXneJ/fL1M7ma46U8Qy/Cncj6z07v
         E4moFLLWE3JhHjZA3IkCLOlxedcuOnF4gYVcDzMRfBeaPIlkGhu7pHH3QskXiVT1Tyjp
         qQilLtrmH+zQYro62oSJjYq3rRhlxTIMWoFoybVMaw8s1Xrogr7yFtvOpl4Ykc1vt+tH
         Rs829EvkEKQBSGTT7RlselWw/SPMOa+U34qp2sXlXZGTeBAQ+aDznrp9lmKK618QgFo1
         WTp8vKLyV0rj+qWMsknR2BQntn+OSArQuWe6FUyyEZIBvh4oeAZ0VYmFsz1bb04pyPJi
         rsAA==
X-Forwarded-Encrypted: i=1; AFNElJ9GCRPl4/a0AMF9YNKOzzrHp6/JMaPHI76KzPRrMTVY6SNsgGfRk68d4l4OU8dyr9Tr4Gcm5G/sTxmWuT7zpauR@lists.infradead.org
X-Gm-Message-State: AOJu0YxZclp6H0asZf6dcX0ykWr0spZnC8C6y37rOZ2EIIMorDqijJX/
	3zQuwyb70aVojpfn0HlVRDVtDMlPBaZ6/R5i7I2U8Lx6lJzLvjEY0Ch9RuRjjjOj
X-Gm-Gg: Acq92OHW2G/jnxvMYKoekXc5mNk6nDChkhbDeRkr7yVikQ//G+pVT7ZLdmhk8XOl19M
	lLVtPH5mDNyRpP+ocV5As1+mR+fVjKxZvlns/+vDHrXRt4TiIpNgAtVfPj6uuaTtxklitqBifhl
	bX8RiRnA9APQ4BPLoEqnKgodrQM+WdpQKLdAgp3nsp/LfEHqDGs+JM/czC1nE0rl54vtNCbIqyY
	2A6auijiuRqBeRmgZcV0wU1XB5sSmKLBeUqHiN43F101X3IASyRl02Bd0mhGFfC07w+l0RBIEO1
	a2b2U2NJKUSemGXGy+DjQu/oEL+kO+9i+pUK5cTN1IfEG3QMh9rO0JY86mpTbBMniK4ogpNsBMK
	fH6iM2FvFYlGcxzTufEvh1szz2bd9Xn/5P/qgj2vpvfPgLCYT8+fDhML/ZjVX9RNh0gAnSKMdj4
	ehH58UBponOVRNkMq1va8IsK3+TMz9QfKDUEO2ozyuPujQc3V7YJ/OOpV0HoE=
X-Received: by 2002:a17:903:2a83:b0:2b2:5857:583e with SMTP id d9443c01a7336-2bd7e8bd3b9mr148173355ad.31.1779089477889;
        Mon, 18 May 2026 00:31:17 -0700 (PDT)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm147086985ad.43.2026.05.18.00.31.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:31:17 -0700 (PDT)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-133466cf955so8264127c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 00:31:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8rZE1FHPFSVF9qLROtn90O8cbphbosUzAGCHrAnOiN8yaDnZj0KbPHv3KBw0r4v1E4AmbkqrF51iPNsQ9dbpGW@lists.infradead.org
X-Received: by 2002:a05:6102:f83:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-63a3cc0c2d3mr7561944137.3.1779089086695; Mon, 18 May 2026
 00:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:24:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
X-Gm-Features: AVHnY4KCtTIyMp1YT9qrsNOPXjoXEF7LJA_Isl-7-vM7CDKMV110o1b879bzndY
Message-ID: <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of i2c_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anshul Dalal <anshulusr@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Linus Walleij <linusw@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Dyer <nick@shmanahar.org>, 
	Hans de Goede <hansg@kernel.org>, Job Noorman <job@noorman.info>, 
	=?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yauhen Kharuzhy <jekhor@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Oleh Kuzhylnyi <kuzhylol@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Josua Mayer <josua@solid-run.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, David Heidelberg <david@ixit.cz>, 
	Petr Hodina <petr.hodina@protonmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Xichao Zhao <zhao.xichao@vivo.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_083127_626545_038A1493 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Uwe,

On Fri, 15 May 2026 at 18:48, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> My additional motivation for this effort is CHERI[1]. This is a hardware

Nice!

> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.

Good luck fixing all implicit assumptions about this in the kernel!
Also, good luck convincing people to use uintptr_t instead ;-)

https://lore.kernel.org/all/CAHk-=3Dwj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe=
7A1d-g@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

