Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CEEC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxdNpcGulDPHptxAYTQ3/RA2+jf6IzOaeSaGvumBXnc=; b=C+m7ug2b6IrJw2mTYYQyi0bC+T
	/xPONMqDMA8h3/X0KDlSlUqd+1W2bsWkfVMQpyHWOXTtI4QOTY0GVAglTgvKThloEwYi9DVkORC2I
	DD89+qwi1YtUgck5+TJsuADIwyZ4JykhT9YTF4mAC1k5kkGg36rPM7GqeqH9dUhryumOUta5N0yzA
	k0fC1uUtSL9uk7d6FKZpJpV2Zu4AwlifUl/gm01ew2w2/QNZVRkbDp0bbemw+ED5XMqWlq+snrAEQ
	p9vTOUqYQU9T3fW2F3TTyz7yshAgcMEa0q2XsRncweCHwIggIVHe/sTBC5j2aSaa6SEDm0JSdQdsR
	HCiR7KRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pU-00000003682-0G5s;
	Mon, 14 Sep 2026 10:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63ow-000000035VZ-0Gic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 172FA1CC4;
	Mon, 14 Sep 2026 03:21:50 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D31A3F7B4;
	Mon, 14 Sep 2026 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381313; bh=Q+anWvz4MhVvNjRofJ78HmqKTzubKdFr4fyy/6NF4QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MCXhq8Rm1cpNTONZQngHiTL3RmxWBWy2QwRqrL/JmAFiI8ApHZ17ZW46+xuCMV88y
	 vcCoaXGXsRfSeuOXOdWBLYReF8VwDPw6vsOU6BlL9MuYCGyXcU7yASTlVMdzypxDGK
	 if2WMOgcPdxTcq5jPkMSmt+buJ8NM90AWRA+FNUI=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 18/38] arm64: booting: Document boot requirements for FEAT_NMI
Date: Mon, 14 Sep 2026 11:20:42 +0100
Message-Id: <20260914102102.68597-19-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032154_151023_4D31A5EF 
X-CRM114-Status: UNSURE (   9.84  )
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


