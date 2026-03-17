Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E79FD7065
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kDJlbTtDd3QV7VpnAnyVbmTuxvPuJRr7rPQieDt9NdM=; b=Y/PGa43bjNgO7iZytNeKIvZoTw
	Pc8knt3CTsUZce4vhxA8Xh0AnXi9i6CfAQWq4XOfFJpxvy1dTBYHssmdgYtTSUBNGZ8DgRUb9/1/8
	AVXY+8kSH/xk3nrC0LgBwrtroX1ciNcnzXceJkysqXgjtN9ec+gBD0OYixcOBlpJpolv5NZyYEMCK
	88gRtUaTj7MQZPZX7hvUC8nQKL0Gcz3JdBwaOq5b06kNZXQgtgX8dgUEMCpZhF5NyT7eBK3UDAVMk
	2C2w4B/LxqvUNAMlPRKYTV/eeMKkD1UiGMLQlN36OlsYsbce45gqlG3qI3Xwuz2HaR3OuH12Heh5f
	//AhED3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ROY-00000005xYt-1nMH;
	Tue, 17 Mar 2026 10:11:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ROX-00000005xYN-17IH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D76460018
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9C6C4CEF7;
	Tue, 17 Mar 2026 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773742284;
	bh=7vBVC397CoGIya1ctMudRcRai4xV9ibDB4MtaoCBrys=;
	h=From:To:Cc:Subject:Date:From;
	b=EwGu6zoJnXt/3S1s975RwtYkS4ohXR4OHOQC33pULA2GR/d8EM51XHJs6aehtSNFR
	 KVq5lCNHQX4AMJcZLTQuRWKIxahUvoBFRWEgenT3tXTsmmc54Hfk3rv1msbjSzDTYC
	 Eah1H95leKd5OMr0ikC4ougyyXljh7wE9lBR48On+NfFdLGoM8YZJogycH3XRF77xt
	 ytT3Hdr2/omS0vASp7NP2ObTXjYlv1mhFEYeg1noblpvFhnpFa7BGxbRWV1I3DVlkc
	 EJbyrYJfZLRdzfVWenLWEnlvGivMo7MCqHzuJg3m7f8/CxRnJhiDTPB93GW87iGixj
	 s9bq6K+yDOvWQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v7.0
Date: Tue, 17 Mar 2026 10:11:12 +0000
Message-ID: <20260317101115.3873019-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-7.0

for you to fetch changes up to a4e8473b775160f3ce978f621cf8dea2c7250433:

  firmware: arm_ffa: Remove vm_id argument in ffa_rxtx_unmap() (2026-03-06 16:26:08 +0000)

----------------------------------------------------------------
Arm FF-A fix for v7.0

Fix removing the vm_id argument from ffa_rxtx_unmap(), as the FF-A
specification mandates this field be zero in all contexts except a
non-secure physical FF-A instance, where the ID is inherently 0.

----------------------------------------------------------------
Yeoreum Yun (1):
      firmware: arm_ffa: Remove vm_id argument in ffa_rxtx_unmap()

 drivers/firmware/arm_ffa/driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

