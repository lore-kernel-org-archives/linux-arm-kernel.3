Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4276DC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9k2GiWAU4a33+EzJ6hCarjcE5xLYndFdiv3B5hwrBA=; b=2a6Tc+AVpOB5QCGZpSpk+ec3IY
	VugyK4c77WzFvGG6qSMkLg9TMMwOt2ldsXf1RJ8aO21ODLby3uFJjGme2aNkZZqRXfS+Xs/SwCJ9j
	8sjgIl/a0meMKZ4IZufh/gcDGiVMN3aQdMNumwWVVHJ07vKTGIX9LCXpg6Jp7rqPv61FHEEBRYxz0
	RBmhzcRKiMzL3r6C4gyD3qF1rSdJOoPTsZkKk0HVRUCMsiIScRem8NABQanpT26yPbE7FilPe8v1c
	M0/Ok7Nd0ZtoKfu1jVvqrTtBGgcdypIIDiVUqlo1prgNKaZZ3hjy+0+h0prtWMVvIlLG/AQ/Z6E2T
	LN+Ua/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAzq-0000000FmL4-46ju;
	Fri, 24 Jul 2026 08:11:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAzp-0000000FmKr-3E4b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:11:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64AB34388C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493691F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880665;
	bh=A9k2GiWAU4a33+EzJ6hCarjcE5xLYndFdiv3B5hwrBA=;
	h=From:Date:Subject:To:Cc;
	b=T8kNZXqN3OzXF+xPH9+xgYjpnGhcgs4M1hCsF//4cvEI8Op1m2SRgUI8qhb04NQAR
	 PgJbXg8sVLi0oLcUX5bHgsOzJDnB6dVojiPGtLaUUil8hdWlGCt1hOshcExOln0qDj
	 Ncr/0xmVC4H/eF+F8dO8iufdgMgI4xOfxM4rUUcQ8MJ3cCeDZlidN6zP3tB+BXfoWV
	 PUr63BA0nu15sG5AcBgpicb+31jjl6hfDfQg1OAEonwwsDPaRYqxloY/wqCCTcs05Q
	 8/l3B/74tGKrLslPu77bMvdGE25SljjVk/BYgwpW2OFl31StBDDT/Ei5MI5zmtV9Or
	 nBCHS7//fJojA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0117dda13so168202e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:11:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YwM/OL5lTI5N8rX1Gfz6xpAWS3qLtWVWA4UTvNq/vhI8jR69eig
	Fr4WIQptM7jMKu3iguEmvdQH2Apt6ZHRwicZ7AyxeBdX8Ilx79dKS8JwOxkfxSqKIH46MAl4HNL
	dpfGQyHHHzMWLQXsXjL2p0GF7F6CSa5M=
X-Received: by 2002:a05:6512:838b:b0:5b1:5d7f:84d8 with SMTP id
 2adb3069b0e04-5b2b2f8db28mr842076e87.46.1784880664049; Fri, 24 Jul 2026
 01:11:04 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 10:10:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLn3UOROn4oK9D306WaJFx+8TQHehSugtLq7zhO0DwhHzQ@mail.gmail.com>
X-Gm-Features: AUfX_mz-C4N8UzKZ7Tyc8d-wftrIc7dtdIzb8jJ265dnROboevalR6jsrMvtWJQ
Message-ID: <CAD++jLn3UOROn4oK9D306WaJFx+8TQHehSugtLq7zhO0DwhHzQ@mail.gmail.com>
Subject: [GIT PULL] IXP4xx SoC driver updates for v7.3
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
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
tags/ixp4xx-soc-v7.3

for you to fetch changes up to 48e54749c1b6446f53f7419c50ebe7c84f81cb0b:

  soc: ixp4xx: Remove redundant dev_err() (2026-07-24 10:08:05 +0200)

----------------------------------------------------------------
IXP4xx SoC changes for v7.3:

- Add some MODULE_DEVICE_TABLE():s to the ixp4xx SoC drivers.

- Drop redundant dev_err() calls in the ixp4xx SoC drivers.

----------------------------------------------------------------
Pan Chuang (1):
      soc: ixp4xx: Remove redundant dev_err()

Pengpeng Hou (2):
      soc: ixp4xx: qmgr: add missing MODULE_DEVICE_TABLE()
      soc: ixp4xx: npe: add missing MODULE_DEVICE_TABLE()

 drivers/soc/ixp4xx/ixp4xx-npe.c  |  1 +
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 11 +++--------
 2 files changed, 4 insertions(+), 8 deletions(-)

