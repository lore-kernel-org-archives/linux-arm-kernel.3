Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB3C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YnExfoRh2l4WPiz+TeqVQ2xa2VPv5FI8CGD0LOGjjoM=; b=qcYnBUVXvvCKA3mjAONSXWbjAw
	t6GajaE3eLe3MrglW0I0nk7Srat5OPq3QjmcNzk9xRjKVs/MopXoku3D3gKBhNHhtGUj+lYrWEWMu
	TghkuVY8KriMPYdIYgDdiqVNTLXwrueUpaGxiKJ81kMeBe4/DxU/xZSPQ/VYE4JjW0Bb5QykuZhNy
	3KKcHEyC9hVGRDZRkQs6gp9x9rOFo5198rjXlViLYbAi128212TUzIva2ElC42TCU/XOeCj/GiX9A
	TW+Ul7L6nK12usmgkHX3tdUxETOpFgqCA5rUfoeeZBFa074VYT29kGvF+xEERxskAgvXE1uoDQfP1
	71d75Blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c4a-00000007HJa-04q1;
	Mon, 07 Sep 2026 16:19:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c4Y-00000007HJG-0TwY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:19:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFDB343DB0
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 16:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469AB1F00A3A;
	Mon,  7 Sep 2026 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788797993;
	bh=YnExfoRh2l4WPiz+TeqVQ2xa2VPv5FI8CGD0LOGjjoM=;
	h=From:To:Cc:Subject:Date;
	b=kCTEsmUuN1Xob1tY0cGMPjUvYzzFAk/bjIwaNS5Xvv8U582JjkV2LOWkt3Q7JVNz7
	 GquH90Xz1e2EvNa/wvCSEq3trHl3twDWguFMapJm35qi/z4044KNRQSPUcK/JgR0Ar
	 ud+5/jXxnFJUjF1st+eW+U3PrLbGLtpwwnMDha33BMZy9m8j6w0OYKFWSeupVPgC5Y
	 57v6LnZRlqtcIH/txvtVkcUKODd43E5+9hfgQAWCUPobAUQt9InG+ZtEtQu27Mvxz0
	 GjatLNi97qm/W3Aj/FeuJg1fkBCIexNA43qAW8OxbloXmf6eX+OC5DV1b9UIGtyEsl
	 5V5SSaOZG8IAA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
Date: Mon,  7 Sep 2026 11:19:52 -0500
Message-ID: <20260907161952.1148669-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v7.3

for you to fetch changes up to cfc1e9a543e3589ba200795b6e7fd8ef4314efdf:

  ARM: socfpga: select the PL310 erratum 753970 workaround (2026-08-31 10:44:39 -0500)

----------------------------------------------------------------
SoCFPGA fix for v7.3
- Fix PL310_ERRATA_753970 Kconfig option

----------------------------------------------------------------
Pengpeng Hou (1):
      ARM: socfpga: select the PL310 erratum 753970 workaround

 arch/arm/mach-socfpga/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

