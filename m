Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D4C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxdNpcGulDPHptxAYTQ3/RA2+jf6IzOaeSaGvumBXnc=; b=NSebx8HtlkOgiTiYigDL4TEqHi
	/vwjBw1tQUSLRVgC/WiLlgSeUqTg7qiiKu0lJaXmO9CU70t+cDzk+4CTSVP6TP0mXKVqzK46be4/O
	Z/yxVd9bQJhYLo5JHgJ6CFOVNhm91yaGVtBeMHb6qIUOOwR3hgtQ2XhVsqRpOAOgsdcdPTGqSBUjU
	dSzMAtnom7s9fohECMoN3ajWkQtiBJ0R3ErVZUYcaTpgCjkcuWENh63hn5hN6OdSA4w74M+VaYZbh
	eI/slq9vkE0VV4Eem5kv482QFLFWAKkZ13VTyiHb2ZuyX5SUqCHyyKwyapNVzXqSvvXHQNYs2Ta1b
	Z9hwCwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKo-00000003OJp-1ICN;
	Mon, 27 Jul 2026 16:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ0-00000003Mv3-3oZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D74FA1756;
	Mon, 27 Jul 2026 09:35:49 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03B6F3F86F;
	Mon, 27 Jul 2026 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170154; bh=Q+anWvz4MhVvNjRofJ78HmqKTzubKdFr4fyy/6NF4QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IrYWMzgNKi9aBduJzzZqmfqikQou97DnnplQlz+T5Wkvg2azGPN9M9cLSw3PYPNlQ
	 nXxOi8hP//ntExXfXgXrEo7r4GfwASpMUOV+Ua4iNyriIBhyciQOKJGVzBVytJdT8D
	 ozLD7qkSJMUcSgSh41Xsx7LZLaLe6sxzmXSbNDJw=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 27/45] arm64: booting: Document boot requirements for FEAT_NMI
Date: Mon, 27 Jul 2026 17:34:35 +0100
Message-Id: <20260727163453.7969-28-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093555_057688_7498FB92 
X-CRM114-Status: GOOD (  10.14  )
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

From: Mark Brown <broonie@kernel.org>

In order to use FEAT_NMI we must be able to use ALLINT, require that
it behave as though not trapped when it is present.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/booting.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..3170b26ae981 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -568,6 +568,12 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
 
+  For CPUs with support for Non-maskable Interrupts (FEAT_NMI):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.TALLINT (bit 6) must be initialised to 0b0.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
2.34.1


