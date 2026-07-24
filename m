Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A487C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZuc3S8NKvEFqAPnoOjRFSMEIzvtAOjkPfseQxs6Dh0=; b=Os/LSVVWQ/62Srb6NSuzcHpxYW
	ubpfnMS7ZlvmDeYabdDThurIAZ7O/K3jOaQorLu11qBICzf1lPZ/BUQUwKTICYTl4A3bkUiYvmvWe
	xlTEs+DHUUVvFC+CwndeKUg6vX/qhyiYut0hWlBO9mJ2m76ag0ZizxRjHgHpgFBNeTSOMdmbgQbzD
	cJuwNDDOBumleUjdfv2qgxqR7SrLiK+j6IOvNQsAJkB0BfFoBD8FP0m+fNp5R2A31UfbLCBxZpgho
	PsTENq+yoom5OmUChcqEFg/g/vtdGi8Zg3SMgcdtvGo17MHb3gmU6a7GQm24gem4hglIdrCejw0YK
	SBeeH5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAw9-0000000Fl0e-3vnB;
	Fri, 24 Jul 2026 08:07:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAw8-0000000Fl0X-2Jbb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:07:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F342043CB8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87AA1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880435;
	bh=HZuc3S8NKvEFqAPnoOjRFSMEIzvtAOjkPfseQxs6Dh0=;
	h=From:Date:Subject:To:Cc;
	b=ERvVDYEZtsO54xTTMW1oT6IpCqsd2AQvAQv0v2ETUtP3vKbRP6JJsK7/r4lWg3qEK
	 KaPJHd9GW8P0ESZD0gYIOjeCU/rPb6hiNHvNenTa9cKM5RAkAWWrGjtAjihisrABYH
	 qvEd31E3wyu04kNhjd0JiUh1Nvy/tJELw90fxdUKo/G8pYlzjxMosY8OkFpd52yQjp
	 yCPT3f5EOoL5oYYjEllplNMU009CrvAoVD15wpS1/sQdRMDvif5uTEQIOhxl0R68LR
	 7c+v9+Tux1kBmuNFRfEm8ADTartbpVlVh+2GM8LWm9tP+jds9wVDRegZU/JLZrqP6L
	 1tYQxOvHXL8Cg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39dbe684115so10303431fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:07:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YxnwO4q13k7TNpXtjH/AOVyIFj7+R2igezsaA/ta8qIANEf2Lcz
	dAdHRfLbnpUDyXsKYOmuaHQ2ZS53yucmC5/IxlVTVkMsjoW7fRf+GkS3VHvmvLIgmId7mJ+77r7
	Ofdo0MuEW7YzcvZ+xcyX1JeXty5CzmG8=
X-Received: by 2002:a05:6512:6193:b0:5ae:bf5d:5c54 with SMTP id
 2adb3069b0e04-5b2b339da76mr1250712e87.27.1784880434621; Fri, 24 Jul 2026
 01:07:14 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 10:07:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXOA=u4UxwEDa3WJbFEyTeMPj_U5BiqYsrahxdoKM+2w@mail.gmail.com>
X-Gm-Features: AUfX_mwopg3eEdaNe52uAWb7vkzYQ2MfkVezpYU8xidl14VByB6teDIoClUL0ak
Message-ID: <CAD++jLkXOA=u4UxwEDa3WJbFEyTeMPj_U5BiqYsrahxdoKM+2w@mail.gmail.com>
Subject: [GIT PULL] IXP4xx ARM changes for v7.3
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/ixp4xx-arm-v7.3

for you to fetch changes up to 2262f02ac2aa545560a7f182c8e6b5c98e72763c:

  ARM: ixp4xx: Relax endianness (2026-07-24 09:52:10 +0200)

----------------------------------------------------------------
IXP4xx ARM changes for v7.3:

Make it possible to boot IXP4xx in little endian mode. This is
dependent on the patch for the xscale decompress header
submitted through Russell's patch tracker.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: ixp4xx: Relax endianness

 arch/arm/mach-ixp4xx/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

