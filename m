Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B928C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 14:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9aOSYpRZbubC0LhLw3TJI3f4/WcTRijHeKw1Dkq6If8=; b=gXM/HqnBjtN1Ihg6742TCwkSOe
	quf4RiY8FsNvIzWPOoJv3NMoTeGOuHbBDW8s+Pf6RTU3nmZ2lVFbRfLax5cVxOuCz+nitJco7X1uZ
	eiXl9YDrIxEbpc0jqcEXHs/Yfnpudb7e3w9svfyldiO2tuXjjG6kxaOZWFybtMMceEniJ23p+R7Bw
	M3tZ22Bxa3inwMyVzquLYvskX3j89TcfOY4rbjKQYco/xKZrA5t4NEbKE5Yr1u1tqykdyPB19MkSC
	N2fz7n5hGAmSLsTxhGSfxg+rZMgdDSNMlL9RK6O7w940NQJchZly1n6qgUDRet/RaR3t25Ni/QCIf
	z59DK5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBDWT-00000003waI-0WYx;
	Sat, 03 May 2025 14:07:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBDUW-00000003wV6-3ilD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 14:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 713D9A4B590;
	Sat,  3 May 2025 13:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB08C4CEE3;
	Sat,  3 May 2025 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746281118;
	bh=g9NJHAlBW7HIs4g5OZs65GWHHdecEv7BH2OMVTqtXm4=;
	h=From:To:Cc:Subject:Date:From;
	b=kcQdPQhx6qjw/50nyP5lVELmS57Wke1KJP9KZU2MEN47M9P6JXFJH8eKItZ2QsnQB
	 2Cn6IJWIiLsAV17YXdj3WjwZoQLU3DjPoBxkfNqp1g9JWobNrBRvd6zzLepXPe1JBo
	 OBd1iESxQRohOC3+pZkbhxFFwa68OqOyPNazA5Y62Qs2IqbofuQGcWQ4DEp6c9BmsM
	 yTQpCjkvbzSfpXKbK7+FufsXTDZBeJKK+YGl6+JxVRkq5Vx3r6gvrljH7KkutjBaGj
	 5Ps1hGAjj5zqmoKynERQoPGmpjdp+dnNSdmHQJdaAV0dcstS+wxqYf5oH2yBE0SC/i
	 7M70TDTUWgclg==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/fpsimd: hide unused sve_to_fpsimd() function
Date: Sat,  3 May 2025 16:05:10 +0200
Message-Id: <20250503140514.487947-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_070520_995901_6C45FF32 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Arnd Bergmann <arnd@arndb.de>

The one caller outside of an #ifdef was removed:

arch/arm64/kernel/fpsimd.c:676:13: error: 'sve_to_fpsimd' defined but not used [-Werror=unused-function]
  676 | static void sve_to_fpsimd(struct task_struct *task)
      |             ^~~~~~~~~~~~~

Add annother #ifdef around the definition.

Fixes: 929fa99b1215 ("arm64/fpsimd: signal: Always save+flush state early")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kernel/fpsimd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 92c1f647fef8..be8cb5b550a4 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -662,6 +662,7 @@ static void fpsimd_to_sve(struct task_struct *task)
 	__fpsimd_to_sve(sst, fst, vq);
 }
 
+#ifdef CONFIG_ARM64_SVE
 /*
  * Transfer the SVE state in task->thread.sve_state to
  * task->thread.uw.fpsimd_state.
@@ -691,6 +692,7 @@ static void sve_to_fpsimd(struct task_struct *task)
 		fst->vregs[i] = arm64_le128_to_cpu(*p);
 	}
 }
+#endif
 
 void cpu_enable_fpmr(const struct arm64_cpu_capabilities *__always_unused p)
 {
-- 
2.39.5


