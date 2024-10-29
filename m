Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475B6D3A66C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xboBXOL/ABXA9IN3SAAt5t43jtUCmvi9K5P1WAvpnZM=; b=woXCDLqtaY6NVZDYYKp7r/cuJG
	x3EPmAfYZbPZhqs4V3U1IzE/Vc58Wi5kV+TG45CKKjuB7c+ylTTzMchFDfLWlmYFQckLqfuYZiQxN
	2XXQdTVviAwH4VoP677emgJ2wpNGkB5NeySGYnO6eIDH5Yt0+tLyKgQ/6uSQ2JqJzbU02YZ50eZA+
	jdCCR2fWc52X6GwsG8f985ub/7b73uXGHGEM4dbIxdoGSjYRzNMfF+5qrJOKQSYlnXPTxa7V14uqS
	S4AzYrCwr0CkJmKt8031JH1lLW351WpKqP+AdbgiWhRBMesmdbRw4PYp/HH9Z+G4Idg+sDfjRu49+
	ClsRwfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nnF-0000000Eojl-01sG;
	Tue, 29 Oct 2024 15:06:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nTv-0000000ElrH-39I1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:47:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0D1215BF;
	Tue, 29 Oct 2024 07:46:32 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 541ED3F528;
	Tue, 29 Oct 2024 07:46:00 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	tglx@linutronix.de,
	will@kernel.org,
	yury.khrustalev@arm.com,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 2/5] arm64: signal: Remove unnecessary check when saving POE state
Date: Tue, 29 Oct 2024 14:45:36 +0000
Message-ID: <20241029144539.111155-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029144539.111155-1-kevin.brodsky@arm.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_074603_924987_3B68E3E4 
X-CRM114-Status: GOOD (  12.39  )
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

The POE frame record is allocated unconditionally if POE is
supported. If the allocation fails, a SIGSEGV is delivered before
setup_sigframe() can be reached. As a result there is no need to
consider poe_offset before saving POR_EL0; just remove that check.
This is in line with other frame records (FPMR, TPIDR2).

Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Dave Martin <Dave.Martin@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index c7d311d8b92a..d5eb517cc4df 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1154,7 +1154,7 @@ static int setup_sigframe(struct rt_sigframe_user_layout *user,
 		err |= preserve_fpmr_context(fpmr_ctx);
 	}
 
-	if (system_supports_poe() && err == 0 && user->poe_offset) {
+	if (system_supports_poe() && err == 0) {
 		struct poe_context __user *poe_ctx =
 			apply_user_offset(user, user->poe_offset);
 
-- 
2.43.0


