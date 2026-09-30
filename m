Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB6ECA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBgLWAqG8Nsq2TBy481BWH1d2sHsXvnlxtN5vEIpQJ8=; b=hfB4ofki7VhheYMaRTCtN7lx1C
	POEZFBLiKbYmcQSFI7KvEc54oBn1j2Xvv2cH/4z8ic/h/EerqqFby+TiRRnfOPle/aCUQ31RXISF2
	7SSsm3YohPPHIOGybsHlZmkgDEUFRgD2s8YcYeIPL1t9IfGBAvbuBqteVsTIAJEQzKjoqWIc0tW76
	XK80spGORUCrpTOSVWgm6Ci98YLUkxbY+WzOxC2dW37xHWSe9nQF5OVflkUVszfixG37We9nwCSRA
	6ppW6PrOa9y5nXJ5/I9cMHTLVP+Ze8Cad7fh1QC9wgt+wnKZFHPWbJDztmr7dyk8i888oZ0oqgXn7
	ds/uuh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtzy-000000065WQ-1qbH;
	Wed, 30 Sep 2026 13:05:27 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtzv-000000065Vn-3VCj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:05:24 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af4663da5so1435218f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773521; x=1791378321; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBgLWAqG8Nsq2TBy481BWH1d2sHsXvnlxtN5vEIpQJ8=;
        b=A6X5/KxBOwcwjfvr+tNbcM+cmdjbD9cxcc5J5Vm7Kj6qxJGjda9XcmwO/GzuuK5rnM
         GnqPMCI+IeaA+I+lx8gbalvyoYiG0mAzJgABHTWOtnhpYX4VVRRlSwf/np1DCGVrFCDS
         BW+kKOEbc6xSMVqvZfdhIhH8OavEw+h2V3gkPGXMC4MXLh957YU8l5lPyCOsc7vl3Lvn
         8b+zPYlfYycQi1LqX5DWPt3FcD+kMy8zgPlwnbnjZVe73SNTwPfhIcGrEjObG2z+cXlO
         QyC+cZ8k10I5LVi5bM5cw+bz2g7IT0K7R8bJBUwxjTc5oaOTBtK/kyWpHoB8+Ro5kwP+
         8Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773521; x=1791378321;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBgLWAqG8Nsq2TBy481BWH1d2sHsXvnlxtN5vEIpQJ8=;
        b=FtdGZkLJw4yvmQC0XOAPlHlYLhaot1Nl5wGiylSPAeHVc6oM75ax/F6/lxoLcP9cdY
         Qfvv7zmPVXMb0Lve/tKtM/N8dN/nu27MY77He9m7zv9KIH7vF+BB3ZyJk4+Q9YNFPRwP
         5A1HfSbFZkgr4h31aWmPqCjgrdI6KP7lVVXAEMxUtcyMXkspWwKSasDv+h/bjEjSzpf3
         vESOVDbCSYDDaXkdlXHLUkv9w0IuW4993iLfpQRpy6Veyr5z5SLW25tsIybGChK0zjsx
         q2gzc4M7dte0cr8a+1RmuulGb9aid0BjrNskkJsZp0QR6oupt20j0XqGnklVdsG0erj0
         WEIw==
X-Forwarded-Encrypted: i=1; AKwUvByjrrRfL0wlVmv3N0MrefTfa02sH3FP5hGOLipr+GQXrjB+GwdxJ9na4R8jOzHhX6pcuoFpYbn+XdC6radhEHLR@lists.infradead.org
X-Gm-Message-State: AFq9FYK9SuJA5W1BOX8FttyHymMoxl2VTB8k8f0mo9ytjvqqlUajBhIb
	cwB1ABmrzfwWblkW853oWNaQl//gv2iNYIfEbyosapsSD3ZCbIYOW46K
X-Gm-Gg: AYBFou3ZHMzwpsJNYF4i53nDol7diLa/zmE5BKd0i8+n+LLhWejhAV0D7rlZq1HzEkI
	bJ/h09Llo3wNn41yawgmzJhfwbU0UxdtP9UaSYTC8sgMBwd+htGj/wNwJjYEQr2RjCFeHRiDN7T
	UQM6KvME29lUZ9O9GmiagY/l+g4YYjGyqT6v2L7sPKA+R+fjNOYPlJbenIlWM+5LiNip4NgWm6T
	osH9gv1GXgVyyY3+UsjNCxY8m7COROOPeqCQfOkOClYZWFxy4XKWZAxEy+1xoVRDD+Bbgsi4jgU
	oWLiqEraOdeCWlacNjhRyj133Sfp/JF2xtED03l4kGE5s0rds/uOVtqWIY2KX29QQj6tysq+iFo
	oVDws20sLBeMOWwpQGdhPiuUza5sW7iq3Xfi5h4v5M+0RPwR8hUQ6IbvD0nUrROmmGkadTnFtHK
	EdXn0qBYr/HgIDqozIGYlkwLFh2FD0RWwe3ODMWRCbUB59zUS3hgkpQbd7twz09qf5Jk7s8hqBg
	zFlrQdlCwxrcdcAEf1hbYQYInH3TMay
X-Received: by 2002:adf:e18f:0:b0:487:799:c04a with SMTP id ffacd0b85a97d-48b02430c2dmr2681615f8f.3.1790773520942;
        Wed, 30 Sep 2026 06:05:20 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bef64sm4914950f8f.10.2026.09.30.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:05:20 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <432b697a-d931-4523-91e5-9b45a08617ec@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
 <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
 <179076863241.3327419.16233537387530771884@gmail.com>
 <f6d0478a-3438-4903-a9e2-5d314f5948c4@app.fastmail.com>
 <179077030602.3399593.12266354979192327093@gmail.com>
 <432b697a-d931-4523-91e5-9b45a08617ec@app.fastmail.com>
Date: Wed, 30 Sep 2026 16:05:18 +0300
Message-ID: <179077351803.3424620.11498774337540482054@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_060523_893574_F1470C77 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, Sep 30, 2026 at 02:55:43PM +0200, Arnd Bergmann wrote:
> It sounds to me like this is different enough from the generic
> spin-table that we should keep your current version then.

OK, I will keep platsmp.c then.

That leaves the directory name: Linus suggested mach-goldengate since
mach-gemini is a Cortina SoC too, you would go with mach-cortina.
Linus, with the symbol now being ARCH_CORTINA_ACCESS, is mach-cortina
fine with you, or should it stay mach-goldengate? I will use whatever
you two settle on.

Thanks,
Fil


