Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FB5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z67oCRbuWCDTwxMGhFci3JzWRc2aPgsnC/35Jef8B58=; b=mz6ltzOqgGe99g/2H7hRSNomI8
	OXQLt16aslyku79FxjEZ0hXLxOUqo+VGhNVsMv9AG1ugMUyz/TzH2e2VLebwYn6TxOKU+IpBTrqbb
	zxx488jKBqhHgLWC/ghGs0qS+Saq18K0GpwJ68qkneNb+gfb1d1ejrBYQUfu53P3qAdJxBwqzcv7o
	1ROtbcdiLIbQHPsVze3+N8CdW9V9z7HHLrVk9sZYbdfsfzxwRbPcNzf3Z95Zu9RlPALzVUb5PRKRy
	RzJfjDkDBs+8v3DqvuKlAiepgv7jQjc3t5i852mBi9EPIuPnU9fscyXA5Rjf5WZvyRVg7aWPk9HY9
	arRY7Imw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyMI-0000000D0sv-3vyf;
	Thu, 10 Jul 2025 20:59:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvXM-0000000CeHs-0KvR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 17:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Z67oCRbuWCDTwxMGhFci3JzWRc2aPgsnC/35Jef8B58=; b=ngW5rcSa6gZ6yxL5A//FfRz1Bo
	WjbbnyeGSy2JrTDYVzyr4E6w7R3Ou0OpfDju4AMNV7valycjoKiLrBeP5yx/F9V1b2CaO4bLumCGy
	kqWl2dDZCySHpdMJTdP64H4MlkWVYZZvTtTu6KNXMCiNXLEwyoL/0UgHxW0fwfMT/UYD1TfWkMY/X
	Agp4KIhvygm54rlTiXu8c0eVRxmDGROhDKP9KfVXaNwICtvEgsA6dsJrUG3E8Mx09tf5cu/MniCPB
	bUSKFRY4Mh9YHijAI9333aNPp0u4P/1yJbMmUZdlMcECvrR/UmzUe2mydY8tA9/6WPRGjB39b+QkC
	SxJHHZHg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvXI-000000096cH-3qPV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10558A54A3D;
	Thu, 10 Jul 2025 17:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB40C4CEE3;
	Thu, 10 Jul 2025 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752170296;
	bh=k6LS5lbNC+oc98XASinvjgEjc5c1xSROedbasnLwM9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=IuhbQXoIAJ3e8QF1KzrDMjcxey2lhro3ejsOBDwYiEs4cMGQAhDtYrn1/CjJlJwmk
	 STPqSs4Qb/22CJddWme0gsrzoxTQigLOesDYEjDaHPPwHpHhSabGxxnHj/Zs/vP5Vi
	 yvDn1WczXx1hXcKfsIufYZlTqFQD6wTU5Ht8QHGHaCujvo4CO524txaXf3+uOflFVx
	 fNIGRdfysqKImLk1rjAyrHhkjGyQbEH5RdbJKEMYIIkGnuKG1P/zUh05I9Bz2V7sSh
	 kJvsgS2tG0pDqNclRaUIBrzltN4eLIbnv8wXS/FoE15OYvboI7mcfyUoBhkkltz8cB
	 y2RwvcV2LLWLw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fixes for v6.16
Date: Thu, 10 Jul 2025 12:58:14 -0500
Message-ID: <20250710175815.6504-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_185821_177616_CD1B1C75 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.16

for you to fetch changes up to 3871b51a684275e3a47fbebf93c0a0e7a05d7f9f:

  arm64: defconfig: Enable Qualcomm CPUCP mailbox driver (2025-06-09 21:14:40 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fixes for v6.16

The v6.16 driver and DeviceTree updates described and implemented CPU
frequency scaling for the Qualcomm X Elite platform. But the necessary
CPUCP mailbox driver was not enabled, resulting in a series of error
messages being logged during boot (and no CPU frequency scaling).

Enable the missing drivers to silence the errors, and enable CPU
frequency scaling on this platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm CPUCP mailbox driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

