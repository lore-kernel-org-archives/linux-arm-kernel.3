Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869C8D7832E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9rLCyN3N3SkpAKsA5Rc9HfL4egXLQMOqF7xkQ/gpeXE=; b=0y1gm1iOJi8Y6HorEmDBChQz7q
	y7HZYa5zo+miIT14Y6/0Fl4qENUWIM6/8gU0bBDJGmwO+hdXPjXzuHTCaBuVdI3Uh1rzj0SF63lYd
	xFRRhFrbZIiVUHyX2d7ZhDuFD5SG7Mc7aDj9Q3ftSW/TWiERG3YRg/2klYspP9UMSPJKyAYz1lak9
	2Y68XHCPObbCadV3WMj2Zl3GxNOsAGtIDJN4wDiCSoKwCtJLXc1aiLkht16OBgrL2RUO0vHwiohYa
	ZFvs5prGoSsYHDbosvE93FNy9GKWpNgkRxXNvuvDpybWkN55xqdt0BPYa14IT3g62HNLl2faCBh9s
	eWDa3daw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7sm-00000006YDN-3JzA;
	Mon, 02 Dec 2024 14:58:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7rm-00000006Xzs-2f4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:57:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE24C5C65A9;
	Mon,  2 Dec 2024 14:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18A1C4CED1;
	Mon,  2 Dec 2024 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733151457;
	bh=ZuU314T7dvypEo8IVSRo9TpPPGw0il3nzPKTPrnusLE=;
	h=From:To:Cc:Subject:Date:From;
	b=Xzmapy9seldOX1xkt06yHNvONwWXHrOIW2+YFj5K9zFCDm9ZUUG2zl9bX9S0j1dfI
	 lzzz6fgMPmS868OlAJAut36JokKhGey8QJoB9IvHU/tzkpVop/41BifMRiRyIb5Ap2
	 MWiADrACmZNqhOKlxUyxFQl/rYGi3GqMbwW8orpg/499tgLkH7bPyC2IxIlR3/7DKv
	 3htT2lFkV0Jwxj9bHkVcfrB825V6CyNpm1uOusylMtKXjyV+LTYMkuuA2Cc+YkpVTn
	 IUgVI1BEU39pUy54+vX1fXThz8zs5Tyuo4habWk42IgJh9PrTuCBxVe03uiM+NVm1m
	 sb/iFzt71h2tw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Keir Fraser <keirf@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 0/2] Minor tweaks to arm64 CoCO guest support
Date: Mon,  2 Dec 2024 14:57:28 +0000
Message-Id: <20241202145731.6422-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_065738_711659_00DC1C63 
X-CRM114-Status: GOOD (  10.33  )
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

Hi folks,

Here are a couple of minor tweaks to the CoCO guest support on arm64.

The first enables protected guests under pKVM when pvmfw is not being
used (and therefore MMIO guard is not enabled). This is useful for pvmfw
development and for testing a VMM outside of the Android Virtualisation
Framework APIs.

The second extends the ARM64 MAINTAINERS entry to cover the CCA and pKVM
guest support, as neither of them are currently caught by an existing
rule.

Patches against v6.13-rc1.

Cheers,

Will

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Keir Fraser <keirf@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Quentin Perret <qperret@google.com>

---->8

Will Deacon (2):
  drivers/virt: pkvm: Don't fail ioremap() call if MMIO_GUARD fails
  MAINTAINERS: Add CCA and pKVM CoCO guest support to the ARM64 entry

 MAINTAINERS                                   | 2 ++
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 6 +-----
 2 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


