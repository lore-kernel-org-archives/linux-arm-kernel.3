Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20111CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTvlZKvhstSW74NiwXKs0omU+0odCUFBtda8/2FEaWw=; b=hfgiQ8SETDRsae/vJZZZPGlUxE
	KoeOHfdsxYafhYDLqV6jBmhynzJJcvQRBi2YZe0DYrkWfEd0g97H5i0oPfwEZISFOooZ5t4oxKH8Y
	aHHnZdSZ9B0T9vu+W5jcQeP271naXPQDdapkMu+tOtu9v/OHTmXj3ew/x2yBVr2/K+A3ZpwcnDinK
	7Nwt/XtaDevc4m/McdE0s77jZzOQhyoZ32ee6qnEmHW0dofpHSVr2fEy/ndxspLXHKP/TzyD/WO+8
	aeYMDh60EaAAOkVqESCNq/IafM9TCkOdPJkwwVwDH5jN3njSOtlHQRy2oQ1DImFC2pdWs37C68ELA
	uqvK6R0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA790-00000009yip-2knJ;
	Sat, 18 Oct 2025 13:38:50 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA78b-00000009yei-01qQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 13:38:49 +0000
Received: from x415ea.. (unknown [101.14.4.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 038D935120;
	Sat, 18 Oct 2025 21:38:05 +0800 (CST)
From: Bill Tsui <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: [PATCH v4 0/1] arm64: ptrace: fix hw_break_set() to set addr and ctrl together
Date: Sat, 18 Oct 2025 21:37:30 +0800
Message-ID: <20251018133731.42505-1-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016154401.35799-1-b10902118@ntu.edu.tw>
References: <20251016154401.35799-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_063825_210501_2EE19EFE 
X-CRM114-Status: UNSURE (   7.58  )
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

Fix the unused functions detected by kernel test robot.

Link: https://lore.kernel.org/all/202510181547.dI5kyPuT-lkp@intel.com/
---

Changes in v4:
- Fix build warning of unused functions by moving ptrace_hbp_set_ctrl()
  and ptrace_hbp_set_addr() under CONFIG_COMPAT and add compat_ prefix
  to the function names.

Changes in v3:
- Remove patches for arm32 and compat ptrace
- Rewrite commit message
- Reformat the arg of the added function

Changes in v2:
- Fix username

Bill Tsui (1):
  arm64: ptrace: fix hw_break_set() to set addr and ctrl together

 arch/arm64/kernel/ptrace.c | 90 ++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 32 deletions(-)

-- 
2.51.0


