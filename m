Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC26CCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yll37wq4kopA7qx4DPACJzlOZKeuipd08PLscPfsAlU=; b=OpKmQeBz1uMhboVrFpBLhDR16+
	NLt3t7SKsQ6fCUKaAfjShw6BrlzGuXkjp+fv8/ebul0ApSR39qYvmLTh+muVs98JEbC7+ZtoNKcBJ
	2a0cHKTBc+9KKxu9fYEP8wmNgOcm+k4VQmcYBNjD6OsQFEAeX6KeBozaDpuesYSGiZlZanFCME5Tu
	Jrgcl6j/H7DZJ4qKIzCCjiHElsmCQj+ZdQi5RzdFV3JFymrgQzw+/AOCStf6/qaUpwDXBiWv0HOK0
	0W3FoWMNjV/f3+mlprHR+GZjUm/O/dwG6kriFgGQUjGEHpdXgsYh/E6hKaX2rl44jr9g0CC5h5AKv
	tuUkyjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArEz-0000000E0pc-3kHz;
	Mon, 20 Oct 2025 14:52:05 +0000
Received: from wxsgout04.xfusion.com ([36.139.87.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArEw-0000000E0n5-3zMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:52:04 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cqyxk3J1ZzB9K4g;
	Mon, 20 Oct 2025 22:49:30 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Mon, 20 Oct 2025 22:51:40 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, <stone.xulei@xfusion.com>,
	<chenjialong@xfusion.com>, <yuxiating@xfusion.com>
Subject: [PATCH v2 0/2] arm64: spectre: Fix hard lockup and cleanup mitigation messages
Date: Mon, 20 Oct 2025 22:51:15 +0800
Message-ID: <20251020145118.1306-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.38.0.windows.1
In-Reply-To: <20250918064907.1832-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03045.xfusion.com (10.32.131.99) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_075203_206576_EBA258F9 
X-CRM114-Status: UNSURE (   5.95  )
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
Reply-To: linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This v2 series addresses your comments: 
- Fixed the message to use "command-line" consistently 
- Created spectre_print_disabled_mitigations() function to handle all spectre mitigation messages 
- Added a separate patch to remove the CONFIG_MITIGATE_SPECTRE_BHB option

The series includes two patches:

Patch 1: "fix hard lockup triggered by printk calls within scheduling context" 
- Moves printk calls from scheduler context to setup_system_capabilities() 
- Prevents hard lockups by avoiding printk in unsafe contexts 
- Consolidates spectre mitigation status reporting

Patch 2: "Remove the print when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY Kconfig option is disabled" 
- Removes the obsolete CONFIG_MITIGATE_SPECTRE_BHB Kconfig option 
- Cleans up the spectre mitigation code as suggested

shechenglong (2):
  arm64: spectre: fix hard lockup triggered by printk calls within scheduling context
  arm64: spectre: Remove the print when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY Kconfig option is disabled

arch/arm64/include/asm/spectre.h |  2 ++
arch/arm64/kernel/cpufeature.c   |  7 ++++++-
arch/arm64/kernel/proton-pack.c  | 28 ++++++++++++++--------------
3 files changed, 22 insertions(+), 17 deletions(-)
In-Reply-To: 20250918064907.1832-1-shechenglong@xfusion.com



