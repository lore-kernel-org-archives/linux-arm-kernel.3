Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D3DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jFMFOpY04n7pfsjOLDYFeb6qmDpqp5aExAGmAsyPClc=; b=O9IHqw8+8ZE4T43BbAjy5RGL3R
	LYi4wwXFVqNC83BIuHKufWGbrRq+UOdf8F/G49XzJY+Wor9PP70fsKpTOIVUBY8/QEIjUzSeeT/Yx
	PIZQrX5P2fY8VTieaJ3zRknO61g8tCakBGDfkaDOumIvMEo9lzinUXkZWmGk1mrAXiKD9rz+FbnNO
	L6ZnP7vYEbUoQrPAPBD6eUZPrpW/xHOrEstTaRgISiwMShkRa6+Y2gXwEtzCMhzFKAJOX194DeZid
	hn2/5AnRzP7oOYvt26z0KkQDwKSy3xAkZtYIiOWLutYSAw64Oh2iQUr5nH0tBAakAx9QBdKptev52
	E+VuBRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukk1z-00000004XeE-043Z;
	Sat, 09 Aug 2025 13:54:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukjzO-00000004X9c-0TZI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 13:52:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76b6422756fso4434518b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Aug 2025 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1754747517; x=1755352317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jFMFOpY04n7pfsjOLDYFeb6qmDpqp5aExAGmAsyPClc=;
        b=JO2bJ4ch75Q03+6sVEKT1lsHyFx+SPRAER9f6Bm09Zjstl5PCcjvyTXZcdU1TlUuit
         VCiupkrt9gIaHWbZ8syxZkDike1GoQIbf5Q+9uNiHWLVnwmsAH4UJAjqvqC8rjq/0KpC
         dvJKZY3YNin634B3hqkOLxJFxygjT4Fx/XuCMcMfjnjYdA1e9CwGQyLWEadlYY46P6ur
         13f1dgC97pKJ9iuvtXilhs9XN30dewXg10jcUQhKQ7iiwSoxAPQvFdDfPscEWE2XqnSw
         eFX02YPy99YkJ9TF0gG+NWubEX2z3wQp/rc4P6DqWVf8YZHnJet8EhvR5P+gBoo2qOEV
         ogQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754747517; x=1755352317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFMFOpY04n7pfsjOLDYFeb6qmDpqp5aExAGmAsyPClc=;
        b=GmS2XG4zrletUvGHrOVAH9BCrpxuws9PLLiUl/WkuNVBVGwSeov1wjOBouusySr0Md
         EqCq0vU1iztj1oKYLHQICfRqFKZ1G9LITBEwoxO/WPG8MrL8ehIl+bgcCTpE/9cyoqYO
         ZA1TRs0dWAtPnSKiFdUD9EJUS0usL5tpN0tYs13sLwuGGPs4NIs4ggRaN53+VzORwovI
         UL6KyvmqxeVERr1xyeQw/nrhB2qQoohMCu/tvnI5aNPvQIn9IYTaMe0W1j/U8l84orWL
         /1KbJPw5hS56s2PgHQecmSUkulCajRIuHXdb9zCts+NTphJ6u9ThkRBiCgvJgcTjBh56
         R1Yg==
X-Gm-Message-State: AOJu0YyFPQLbH1i0wPYRiAnTwQXnc5XcMDN93vvYUbcuDz3e7gNICeNN
	Iygpk9f17Zb1mwGRbP9e45JNEsj35VLb392xvq4kiqmovs+oZrE2tLrsGM0bu7ACTNw5YOJbSEv
	JbFziO9RiBOJd8wMfX0sfONDgsL0gBI17uoyFzkn5bhbikmpanynCx7bTDVG7jp/83iOh6I86Jt
	gUWIQOSl88og==
X-Gm-Gg: ASbGncsuvadNv6sRrnH2YkWTwHcFq6ExH5Bi5MpL4GudoWQrAsZvImuai7aoneUyB1u
	iueY33HeCvd3i6PDRV/8fAT1m77vcsXT7gQ42XkXup2ij+BMWOxJSZwTyQG6M3Q7008Dd7JiHem
	oaWJw02Nkt0gv+CugZzF93RKk6kiaqVIGPbVx450eQyfvFITuO1x/Z9fmA5IO4z+cBaXjIDvW3D
	KHyWws9krJ+aUMDOqt4AJgeGWcZ2ahBQfxQygB6ZJ+xRg+jOOOlpMyuOfWoW23c8Tz6pSyf1NLw
	+kVz/YRJ2ff9kJsyXFclPVufggphJWUOJcVY+aJeiTT3xKyTgCZ65qJX1fYkyVXHAVuJTXinkJJ
	AgDL6GoVBw5HJiQ7+ZldSznNH2b3KkQJJVEAdn/Tcin8hFODHdJVhgOmmFPzPr4CwXA==
X-Google-Smtp-Source: AGHT+IEeNgCRS6Ls8b+R2Cf86RDBC5tmWlbLAIMn2W5koGX7pj8yLDZ046+xiBALeYUwG2HzAegNfg==
X-Received: by 2002:a05:6a21:6d94:b0:240:1bdb:bed2 with SMTP id adf61e73a8af0-240551be2a1mr10707896637.32.1754747516856;
        Sat, 09 Aug 2025 06:51:56 -0700 (PDT)
Received: from zenbook (1-162-100-9.dynamic-ip.hinet.net. [1.162.100.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8fa10sm22538342b3a.52.2025.08.09.06.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 06:51:56 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2] KVM: arm64: ptdump: Don't test PTE_VALID alongside other attributes
Date: Sat,  9 Aug 2025 21:53:56 +0800
Message-ID: <20250809135356.1003520-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_065202_610695_6A423F80 
X-CRM114-Status: GOOD (  12.09  )
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

The attribute masks and test values in the ptdump code are meant for
individual attributes, however for stage-2 ptdump we included PTE_VALID
while testing for R, W, X, and AF. This led to some confusion and the
flipped output for the executable attribute.

Remove PTE_VALID from all attribute masks and values so that each test
matches only the relevant bits.

Additionally, the executable attribute printing is updated to align with
stage-1 ptdump, printing "NX" for non-executable regions and "x " for
executable ones.

Suggested-by: Anshuman Khandual <anshuman.khandual@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---
Tested on QEMU.

Changes in v2, thanks to those listed in the Suggested-by tags:
  - remove PTE_VALID from .mask and .val
  - make executable attribute output format identical to stage-1 ptdump
  - Link to v1: https://lore.kernel.org/kvmarm/20250802104021.3076621-1-r09922117@csie.ntu.edu.tw/
---
 arch/arm64/kvm/ptdump.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 098416d7e5c25..dc5acfb00af91 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -32,23 +32,23 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
 		.set	= " ",
 		.clear	= "F",
 	}, {
-		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | PTE_VALID,
-		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | PTE_VALID,
+		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
+		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
 		.set	= "R",
 		.clear	= " ",
 	}, {
-		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | PTE_VALID,
-		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | PTE_VALID,
+		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
+		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
 		.set	= "W",
 		.clear	= " ",
 	}, {
-		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID,
-		.val	= PTE_VALID,
-		.set	= " ",
-		.clear	= "X",
+		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
+		.val	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
+		.set	= "NX",
+		.clear	= "x ",
 	}, {
-		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
-		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
+		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF,
+		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF,
 		.set	= "AF",
 		.clear	= "  ",
 	}, {
-- 
2.50.1


