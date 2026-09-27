Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AE1C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 21:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MlWJGwAK7s++BSE8UyIbisw2komC/Mbq7iN3EgEn2xs=; b=sTazd100tUv0dSAK+N0sR2nVjf
	ttjZ4pVU2naVEQmufxjCkAurN5X7Kh2IZMJg9jLrhjvWU8z8LkB7cXb7nGusMxE3VJbSK3E4bdw58
	IX6mvZVWlX/oxXNtmlnmnxyrfwA4P4pu24pnYkSOOh2NYg38bkWCJzqUrnUYAtXYmPuvb5W8fpC0c
	EBu1DFuYD8HZO+nGHxNcKsnM/EcO4gbVcl6JNhLiFzDJUHnuspi3Yh0Ww48OkKzKGmwRkhkLvlmtM
	kkZpOTLNp4rzzouxz4uTvbIvQvUdlRBwQlRvJLfmq5v+phAysS7h+lAirXwKgJUT+ukNnHG2phHyG
	4XxSaGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwJL-0000000GsvN-0Vhu;
	Sun, 27 Sep 2026 21:21:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwJI-0000000GsvH-45wu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 21:21:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50E2540B88
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 21:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260081F000FF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790544084;
	bh=MlWJGwAK7s++BSE8UyIbisw2komC/Mbq7iN3EgEn2xs=;
	h=From:Date:Subject:To:Cc;
	b=alA7WSiQbysrZXMl4mNJ+FoEdsxL96p4ZBp3gUltkPYrmzN7WSWtpzlaFMqL5DQ69
	 zQhYVYVZHepJA1yKu+CiUwm6IIGB1TRkgoLYCa5We4AgS+SIgHbcaM8747OJTs17aG
	 toey8TpZ1Ot/Rl/88dm5J+7Z01IVRL0k3bq2WrLaSNQ3fPf05Nu0u5viBBFo7snZTU
	 mADsbf3hbhq5QTn+vZUhJ1wkmBMbnktH474+7iWnWmBtoXwcOfjlYprHNEk2rN3J5V
	 qdm+q1w3TdaBXuGNV6Zw/IJp7nOOyqvEMFIqFWazKwhT1mJsMKi7uYZ1+U9E/kT7tC
	 wz1cxQUE6J6GA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so2067901e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 14:21:24 -0700 (PDT)
X-Gm-Message-State: AFq9FYKEuJ42Nrdrsa94MpMTKWpRCpo41ydb7GNNpnL1YV4MlOoGalmZ
	HOib8N3UFM+myr11Hm6UCaHhc+ZJ8OWBaZVhb93C7a7ZwAd6tqgGos0NtZfCGGTftWRjDYAjw2Q
	nZKQZzknP2CRnORWNIwfHILPj+cwNmbo=
X-Received: by 2002:a05:6512:104a:b0:5b8:efa4:869f with SMTP id
 2adb3069b0e04-5b8efa486e0mr1579469e87.27.1790544082838; Sun, 27 Sep 2026
 14:21:22 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 23:21:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>
X-Gm-Features: AclHuK_6hRljQ6deE-ZL_zrAt4pG0cHr2GN7Cl3TOwa9PlmIC_S0tPFfyvHV5uc
Message-ID: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS changes for v7.4
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi SoC maintainers,

the following are two small DTS patches for the v7.4 kernel series.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/gemini-dts-for-7.4

for you to fetch changes up to 5bf1bb010712bba28eda926ed453db3cab91381a:

  ARM: dts: gemini: Use a level-high interrupt for TVE200 (2026-09-27
23:13:42 +0200)

----------------------------------------------------------------
Gemini DTS changes for the v7.4 kernel series:

- Rename a badly named power controller in accordance with the
  standard names.

- Change the TVE200 interrupt flag to LEVEL_HIGH solving very
  annoying bugs.

----------------------------------------------------------------
Khushal Chitturi (1):
      ARM: dts: gemini: Rename power controller node to poweroff

Linus Walleij (1):
      ARM: dts: gemini: Use a level-high interrupt for TVE200

 arch/arm/boot/dts/gemini/gemini.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

