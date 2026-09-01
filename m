Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE4DC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwSS5nR1hghoCG5bm+VPBALuRVxL+T/Xl3qV/qM3OiM=; b=He66HygvD4j9abndqvbJ7ULxz9
	OikS92c8UgmNvQ2N2HxzcexHLP0zjjsWi3VYcUKwF76ovEiMyS29zKESpNIG3GfXdixMDNFFmQNkC
	2GDmKIV7A1HPOwbrhxskPs1Ua12tGQFDQ4ugqaPev17W1TgWAsei179eTAn0ClanI3+Bonf7gCalL
	nTrPokC5S2YgQNsD1KJLbfATk54pvHt0+KQq8wl3OC/LLg+c49d5KWPOt1hqgBSyXhtACHNAZXT0H
	bDGHVv2sFx886T8E7w0yyYDGAg+3cRPxUw3vIAzeTYcwnrdcqaDzTNnFMRdf4JQMerB00l76g9QOG
	vJ9ma+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5v-0000000CHCX-1BzZ;
	Tue, 01 Sep 2026 14:04:11 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5t-0000000CH6I-2bJ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:04:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aVU75XT42/hoFARBw3KCuAe4snE6JpMOO83ThRddGtE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788271444; v=1; x=1788876244;
 b=TEJK32QAnVRKxxgM2CoHvbaPH9Kc+9fhgwbcM+HlvyMfIXeMtZJYxWLc/caeCyl+lCtAo0ob
 TILOD7ee4F0/yyi37wfHx6F/xoht47y2RTgEAk/SL4Zg6cEwrUyd2Mxa5kYPHybM61BcUvJie8v
 7pRLsCfp84LHxf5qG8/khgFc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 64e57d984ad2e962;
	Tue, 01 Sep 2026 14:04:04 +0000
X-Mizu-Trace-ID: 64e57d984ad2e962
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v4 06/11] arm64: pi: Run the source checker on the libfdt objects under C=2
Date: Tue,  1 Sep 2026 15:03:21 +0100
Message-Id: <20260901140326.3812068-7-fuad.tabba@linux.dev>
In-Reply-To: <20260901140326.3812068-1-fuad.tabba@linux.dev>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_070409_799059_8458B5A0 
X-CRM114-Status: UNSURE (   8.44  )
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

The custom lib-%.o rule reuses rule_cc_o_c, which hooks the source
checker only for C=1, and that only when the object is rebuilt. The
C=2 hook, cmd_force_checksrc, hangs off the standard %.o rule, so
"make C=2" silently skips the two libfdt objects. Call
cmd_force_checksrc after the compile rule, as the standard rule does.

Fixes: aacd149b6238 ("arm64: head: avoid relocating the kernel twice for KASLR")
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kernel/pi/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
index be92d73c25b21..96243c291e39d 100644
--- a/arch/arm64/kernel/pi/Makefile
+++ b/arch/arm64/kernel/pi/Makefile
@@ -34,6 +34,7 @@ $(obj)/lib-%.pi.o: OBJCOPYFLAGS += --prefix-alloc-sections=.init
 
 $(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
+	$(call cmd,force_checksrc)
 
 obj-y					:= idreg-override.pi.o \
 					   map_kernel.pi.o map_range.pi.o \
-- 
2.39.5


