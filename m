Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0226EFD7066
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IDQPmDHZ7LDaNPmykYu+PBZ9rDW+xvWcxkrzkROI3Wc=; b=wNVnIytpmFmw3QUivFDh70K3P+
	hDrWgM19aTwbKTYNF5uwL6DlaoWspkgFlzFInNNTOh9syJVUvBSaQFuxWXSpdckwAaSPSHCCoLj9A
	qsvoqjffOh1GiRncsy3fTFGesKrUQF3q5tX8dzT4IelbhDaz3tDZR4TZ7Y2012WwX91MblSHY2tpx
	Dta+2edG+L7WbBa7MF4UD036O5itUAoN8l7UH78muPs8532sAbzi/OciXH1pdRtiEtdaHslhmJ/13
	/ZmiZ2GO2cjR30I8kYLNokAfz7SmLqTEKJIzOi9qs0225PsldxN3b71T83/sxFbsKSKezsnunKg5s
	iicsTH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RPE-00000005xkH-3Ere;
	Tue, 17 Mar 2026 10:12:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RPB-00000005xix-2CMG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BEA8441CB;
	Tue, 17 Mar 2026 10:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D72C4CEF7;
	Tue, 17 Mar 2026 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773742324;
	bh=KvGCpcTjWQCs0s2dSC7IrzOWH5KgMs4DoVxV2p4XZqw=;
	h=From:To:Cc:Subject:Date:From;
	b=miANjL6odISaX11fd8SWg7tQzlD2eUmNoCrSMfbL1nGAiXODi7kJMPb5Gih1/5F4A
	 nbD4XQN8lni2/eEHGJP9Q06MkCLpDesb9G6tV4btJYYexqXtDa0vlA7Ra1k9fa9d+p
	 pTd7msewTXiJjnrKrAqUAh8Ad7JWZWMoWtMQvluUmvvp3417gObU+O+FjFqSbdtHwh
	 Jt27DFH2GgGH+9UnW8/VBjc0zdhles8/OunQ4IOYzzn487ZXLTotAhjkBha/2g3ao7
	 V9lngFJwrSOnBnxuteo7tFaQglyjlaMsQF4RaxD2fUfvabYYwSDlakdYrAygcEYLmt
	 Hf01tP4cr3NPQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v7.0
Date: Tue, 17 Mar 2026 10:11:52 +0000
Message-ID: <20260317101155.3873122-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_031205_588559_2ECB75B8 
X-CRM114-Status: UNSURE (   6.68  )
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-7.0

for you to fetch changes up to 4e701b47c3ba8f4eaf51d676732b11204bc75b35:

  firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/ (2026-03-08 13:00:15 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v7.0

Few fixes to:
1. Address a NULL dereference in the SCMI notify error path by ensurin
   __scmi_event_handler_get_ops() consistently returns an ERR_PTR on
   failure, as expected by callers.
2. Fix a device_node reference leak in the SCPI probe path by introducing
   scope-based cleanup for acquired DT nodes.
3. Correct minor spelling errors.

----------------------------------------------------------------
Cristian Marussi (1):
      firmware: arm_scmi: Fix NULL dereference on notify error path

Felix Gu (1):
      firmware: arm_scpi: Fix device_node reference leak in probe path

Geert Uytterhoeven (1):
      firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/

 drivers/firmware/arm_scmi/notify.c    | 4 ++--
 drivers/firmware/arm_scmi/protocols.h | 4 ++--
 drivers/firmware/arm_scpi.c           | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

