Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB8DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mbxvc7g9kmOmqyGnKfQ+CCv0+V0ZwNVpQh+E0cEdoE=; b=CZGV3YIWotZbCWRnz9sZ5gbArI
	pJRc5OPiGEdNyGtblYVHtu1+4jY07ZNzaxH75Nh1NQoJC10Hlm0BeMujdyYpe2gFkAAtT8hdvTtju
	hzkp1FPO9q+Z9XLvpAs9AUy3M/OcT/k1LdAs8BHPppNeachrlDXVkUIpQTq73OH0H4erWUpEgJh67
	B0ltu1eGqd4V+KhqBq9uPMkA4v9oJf6IS4SSqo+L1havW0Y2uy0o5eTIL3OJ19nwxn3oYGoEZhxYr
	IWQJMKdHYk0cpCjqS+Bs7cgnpPu7ggedBmzZ3zHrlFVpsT6N6KvA3vI9fNxzK2vgjhr2bXGSoHsfj
	4dAR6JeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuz6-0000000HSM1-39cF;
	Thu, 07 Aug 2025 07:24:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuwW-0000000HRvu-0iDK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E1BB40C10;
	Thu,  7 Aug 2025 07:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D83C4CEEB;
	Thu,  7 Aug 2025 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551299;
	bh=l67ps6XMJsj22L/0eqwK6V7mVq3B1+8/YAu/wUCLpl8=;
	h=From:To:Cc:Subject:Date:From;
	b=XyopB+dEl+ZVYHiIdZKgbDzNPDA3ozqq6SkvPzFse7qJJIPKPKUzrzXkMMJlH9TxI
	 ZbBsdW7Yseu6vrN7K4xh+fj1ixWfbRqwsqtXB1luq9TZbkA+i2KhhLpLEPAjfICb4p
	 o08jNdQbo3FHPHTdPHHYw7wtwiW12pEepdEJXCTGgwrZuQdBzbtJgl2711aMe7LRT8
	 4UfzTBSEwvEmZ11AQ/ZSQrqft2xR0Mc2uZiRMebWtCpy/GWMfcPcmCQ5uVVrgH527U
	 chlAcQqbBEaZAzpUOOJ68Gb2+lcYMEyX2iwAT4ihfSsaxYGjwUDNeruzWK7K4xezjo
	 kAl/pUy6krLSw==
From: Arnd Bergmann <arnd@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kvm: arm64: use BUG() instead of BUG_ON(1)
Date: Thu,  7 Aug 2025 09:21:28 +0200
Message-Id: <20250807072132.4170088-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_002140_225821_0B471DC2 
X-CRM114-Status: GOOD (  13.75  )
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

From: Arnd Bergmann <arnd@arndb.de>

The BUG_ON() macro adds a little bit of complexity over BUG(), and in
some cases this ends up confusing the compiler's control flow analysis
in a way that results in a warning. This one now shows up with clang-21:

arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: error: variable 'len' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
 1094 |                 BUG_ON(1);

Change both instances of BUG_ON(1) to a plain BUG() in the arm64 kvm
code, to avoid the false-positive warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kvm/hyp/nvhe/list_debug.c | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/list_debug.c b/arch/arm64/kvm/hyp/nvhe/list_debug.c
index 46a2d4f2b3c6..baa6260f88dc 100644
--- a/arch/arm64/kvm/hyp/nvhe/list_debug.c
+++ b/arch/arm64/kvm/hyp/nvhe/list_debug.c
@@ -17,7 +17,7 @@ static inline __must_check bool nvhe_check_data_corruption(bool v)
 		bool corruption = unlikely(condition);			 \
 		if (corruption) {					 \
 			if (IS_ENABLED(CONFIG_BUG_ON_DATA_CORRUPTION)) { \
-				BUG_ON(1);				 \
+				BUG();				 	 \
 			} else						 \
 				WARN_ON(1);				 \
 		}							 \
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index e416e433baff..a573b1f0c6cb 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -1091,7 +1091,7 @@ int vgic_register_dist_iodev(struct kvm *kvm, gpa_t dist_base_address,
 		len = vgic_v3_init_dist_iodev(io_device);
 		break;
 	default:
-		BUG_ON(1);
+		BUG();
 	}
 
 	io_device->base_addr = dist_base_address;
-- 
2.39.5


