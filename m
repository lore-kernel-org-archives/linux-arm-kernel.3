Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D7BCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QCw9ZRUBeub09uFvPQECFJsWt5dS1/m+zZsohfeUKA8=; b=TTs60e2jLATEeCPadUEf/QCkh7
	hD2b9bm5X+yVmNyA1Yh+/LiSxnLuQJnH4zHNdqHypTLDB36/va3lLclAjTkczn02gN+fttqVCl+l3
	z24Cs2STTMrCCwFb0blP6ZkBP7UW05HkY4u6MtGUCM7TWwKhO+tNjvfSTaQ2HLS5z/PqIwNjIMX14
	0DzFQo9j9ygsVWe5MRVHXlg+93qCXwzfV3NACrPacMC2nsZlP449PRcXuwplpwxS7S/gpiMtwT4DU
	hBGGBifc2RVJdA0/3BtgJ95jj1bpCDgxAn/g4yYlgYDBFHjQ+SCBpZvlPnHi3Ba1GkvXYavB4Ajt7
	95BeGqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJQZ-0000000F5Y3-0RFb;
	Wed, 13 Aug 2025 21:54:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJER-0000000F3he-1NTS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QCw9ZRUBeub09uFvPQECFJsWt5dS1/m+zZsohfeUKA8=; b=bUcyKH0gfxGVey5fvmTnOKYt/D
	mRiZ45DzP9cOZtSKZQWubJANZXQCKzh7yPkhpyXUYLdk5Z31J5Ftx/GcTMKF9HZ945JeW2gUFTtn8
	DigQCLxhQ2hzTEm9mJqfz0Gyuang1nNw48Cd9ntlM6if2/ifcyC7kLYQg/7mUNdrZzrMEHhV/BlMp
	GBaqmu2iEZV/gdFGCVklivQh+qK79ajJZpFGAa+vpdbc6INeLz+9sT94K9ACkTvngC1OixGKhQgXF
	/fOG+ElZPhlRyQhRyJxbmPr5WLf/voUHktD0fEqOtsKzFR1aIjv9TK8tyltleRoaku1l3ipEZNSzF
	OllHc8Eg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJEJ-0000000GCxC-47wj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:42:01 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfec32238051;
	Wed, 13 Aug 2025 16:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121300;
	bh=QCw9ZRUBeub09uFvPQECFJsWt5dS1/m+zZsohfeUKA8=;
	h=From:To:CC:Subject:Date;
	b=N3/8Ha0yi8GyRekTCrFV3yVdC13AEQGJfrlGGkSszmDEXeGSfWR0n3sObGPfi8ct5
	 1ML7k6o5iT3P7wp78uc0k2v0NOlqUPiAH3zapHt9OWD/Y0PPPTmj1k/t3zuaF0YZf7
	 sKz5bjmhoEOsAk+WoZTHIuK/+z/WJv1N6nRpkng0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLferc1363621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:40 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:39 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNF2611079;
	Wed, 13 Aug 2025 16:41:39 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 0/6] Remove register_restart_handler() from drivers/reset
Date: Wed, 13 Aug 2025 16:41:32 -0500
Message-ID: <20250813214138.477659-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224157_597042_7A864CBA 
X-CRM114-Status: UNSURE (   7.46  )
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

Hello all,

Continuing to remove users of register_restart_handler(), this series
removes the remaining uses in the driver/reset subsystem.

Build tested, but I don't have any of these platforms, so some
sanity testing always welcome :)

Thanks,
Andrew

Andrew Davis (6):
  reset: ath79: Use devm_register_restart_handler()
  reset: intel: Use devm_register_restart_handler()
  reset: lpc18xx: Use devm_register_sys_off_handler()
  reset: ma35d1: Use devm_register_sys_off_handler()
  reset: npcm: Use devm_register_sys_off_handler()
  reset: sunplus: Use devm_register_sys_off_handler()

 drivers/reset/reset-ath79.c    | 12 +++---------
 drivers/reset/reset-intel-gw.c | 11 +++--------
 drivers/reset/reset-lpc18xx.c  | 12 ++++--------
 drivers/reset/reset-ma35d1.c   | 11 ++++-------
 drivers/reset/reset-npcm.c     | 12 ++++--------
 drivers/reset/reset-sunplus.c  | 12 ++++--------
 6 files changed, 22 insertions(+), 48 deletions(-)

-- 
2.39.2


