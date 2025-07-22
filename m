Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECE5C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YZLQ/KQSkKRnb395MkT7V8sdOgtE5Lh7Itth4XUf8aE=; b=cBL/vK5CQ/WNMhMgie857BWO/w
	As588h+r4/N1NfZjg64fFG0uIcQZPvo6i2X8YaE6/UasiWfAVv5ZQnvsogMN4/X42WNNINcL+X+pX
	Cs5wz+w12nhsMvXVfa03ZuCMvBdE93Sw2FtUaB0DKGdx/soTOD8WyZPztjwfPlSeJ0xBuH6TJtOHb
	x6VB56wkFS70oObCcx/aM9B59Z4WIKLsUvufdgRiA4kU5Z01qKiZiV3uQKBhc/tYo6xxsvMAhAgkg
	M0VKWaW/df2wqxtz4XxXZTYv8FdC6sUFv89vsrb/Qu4piOt7c3yMoC/jp1/SFEFGHsfanNdDYoICm
	g32/Oa5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGBf-000000033z8-3rmN;
	Tue, 22 Jul 2025 16:49:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFvW-000000032MH-2DMF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 16:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YZLQ/KQSkKRnb395MkT7V8sdOgtE5Lh7Itth4XUf8aE=; b=lkynhxnASiO6hqLn7OATFawn18
	lFWYST/rBrrKCRy7vpyUAU9eixfV1hJWPfrL3b/14xPR9RW3KJ0Pduow5o5h/KGpfgq+HuZ7iN7oY
	LRfAlvUJx1spG2Vi3Cjnj3enL565hUQmpgr6OSInsHr8CKiFHfJ6iX4rrPlGEAGtcUnGFkO/bl3uI
	5iTQFUq+3uPmlOA/spx5DdPfN4mkNMmIzW1oRw889VcvQyU3Ru8BncdXE40GziZG+3ob1Hrt54blA
	5eP+tahseAaNL3kMi3GzMiR4N9tEaVqEE78nzdg75FUf+e6l6D9VW9WU/IUhAZ1vOj0bZwTLc8Vm1
	aJJQFJWQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFvS-0000000BJU3-3qtT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 16:33:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C7775C45DC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 16:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EF4C4CEEB;
	Tue, 22 Jul 2025 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753201986;
	bh=HOrXnADP7UreaaGT5Tj68vMJPVVKA1rs/NitPY59mv8=;
	h=From:To:Cc:Subject:Date:From;
	b=SzfIGf7FM2DDMqURKHa7wAoobKre8lX1YP9pa7QJ18b/2Y5p5q0jtHbdBMrXz70b1
	 oEKItR04r1mR8v0TwXieEJY5MqhEoVLrYQnoZks6AT4DZsshLfk9/HunQlXRGaXtYJ
	 2lBkANT7kP/fBEcg9nblZqhllpNs9I8ilXmWPo/0rOyODzGgpjkdg8ajT339w0r7uV
	 S5DYn0GaMm7eg85m0FEJAOFNWt3RqfyMS4RAU8IIl4u1jYA8wSWK7XKgDij/uHE9XP
	 lXVLJj1UO6n5qY7f+TssU0993Gg3O+YV2gJ6ufG00WgPq/duNq07SH3DaE+TwaPHiA
	 +5uA4qxAICnbQ==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL 1/2] Apple SoC driver changes for v6.17
Date: Tue, 22 Jul 2025 18:32:57 +0200
Message-Id: <20250722163258.62424-1-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_173311_778938_018DC0EC 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Arnd,

Sorry for the very late pull requests this time, last weeks at work have been very
busy and I wasn't able to find time earlier.

This time we have two PRs for 6.17, the details are also in the signed tags:

- Driver updates which include making a rtkit memory management callback
  optional and dropping default ARCH_APPLE from our drivers in Kconfig.
  I wanted to instead select these in defconfig but that change isn't ready
  for this cycle.

- Device tree updates which include the bindings and nodes for our GPU driver.
  The driver itself isn't ready yet mainly due to rust dependencies but we're
  confident about the bindings and want to commit to keeping them stable.
  Otherwise there are a two smaller changes: removing another W=1 warning
  (which required a change to the binding itelf that'll also land in 6.17
  through the NVMEM tree) and adding a missing touchbar framebuffer node to
  the Apple T2 SoC device tree.


Best,


Sven



The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-6.17

for you to fetch changes up to 0445eee835d6e59d635e242ba1d9273f168035fa:

  soc: apple: rtkit: Make shmem_destroy optional (2025-07-19 14:52:36 +0200)

----------------------------------------------------------------
Apple SoC driver changes for v6.17

- Dropped default ARCH_APPLE from Kconfig
- Made shmem_destroy for coprocessor-managed buffers in the rtkit
  library optional since it's not required for e.g. SMC

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Sven Peter (2):
      soc: apple: Drop default ARCH_APPLE in Kconfig
      soc: apple: rtkit: Make shmem_destroy optional

 drivers/soc/apple/Kconfig | 3 ---
 drivers/soc/apple/rtkit.c | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

