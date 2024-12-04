Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6050FE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKPY5mUDwCQzcC0NaKAT50ijS7gJKsqZHOvVhsiu++M=; b=f0SSWUTb3qfFafKGGE5o0oSxKg
	JU8mGl98F5T/RV9msNgbM/TVvzqFTVUW4EsXlYgLdsOtgMWWRGGhbwJVxFniIfuo8EaH8BLVmXS/W
	U8li3JTbY2E0PT3QgCVK9XKPAo2jwq6C5PcussWHa6Kc8W0B3AsE4IWBHDbafLuwlHQRQAaqAM/Mz
	IjuU4s84yku30McqKvF3YLEc64FDHYjljjuQzFwnaLL9jQKyedvFKV56i/Bq38yP32EtGygNTsOs5
	jXUwRjF8FIkFDmXjnMbPysvo9lSGzujzW930TmiZzmAus/2KXeIXlD0eFgekXtzpLu7Efkcbu0cSf
	zOm8H/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrIn-0000000D03k-2Quf;
	Wed, 04 Dec 2024 15:28:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrD0-0000000CyuQ-20oE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:22:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2574A5C5413;
	Wed,  4 Dec 2024 15:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDB5C4CECD;
	Wed,  4 Dec 2024 15:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733325753;
	bh=NfLmqQjhH+UlQ7Y+G2ykkZMplv/ejiQc6RhXEP3cv9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AA9I21OQzvXTD9ePUDrr5h9Z0wOHDh6jF35EaoAYsUMqsSJQxW38z3QkOpd4uHYoB
	 tEfGXOdRKuzb7ELZCXUubD3N98i0JUifocbJEzfA480VJGyFRORsIzShFIiRFiyoSO
	 /nKknR1fAaiEFa+JxnIfv5yDGERVC4xKTC548FcWGSMgmdS6NgymsjJgustYy8B3UM
	 eMjXR4jiRCqSQqOhLoyzk/MlxiWk6xMGFTz44c+XJM0BZYTT4S/oH3+uwZnQtON94C
	 HbdNt8+GPmbtflcy1j94owT2fq5Im2hpgRnGWSYtqbBC5qxwW5CrqJ/kULLBDpI8vc
	 77noG1ZMROR0g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Dec 2024 15:20:53 +0000
Subject: [PATCH v2 5/6] arm64/sme: Reenable SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-arm64-sme-reenable-v2-5-bae87728251d@kernel.org>
References: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
In-Reply-To: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Martin <Dave.Martin@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=769; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NfLmqQjhH+UlQ7Y+G2ykkZMplv/ejiQc6RhXEP3cv9c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnUHOswXh9Qp87YFQNiApq82JF8iKPIsacXChbC9NO
 xUMJkDKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1BzrAAKCRAk1otyXVSH0AmYB/
 4mHv/OIIIvF/5wo69xV2tpZJVLWHKrR4uBygEFPUTRdj9ULex3KfhOg6bIOKzNTK2cFoNeQrrGdI28
 djJn+ZpWtW75a077cHznj9M27QiE6xdldBJCpUOrhSwhJG4k0xvF/iyjfXdsFbk/d/Pr76AHgZmiht
 moDjnqoS7w0MDsRHyrvrUmKu7+YxSTxaD9/KB853GQNFi+fzpmviHqgELXfcOJsDf81gMCTihdl7IL
 dhwQ3/zQnZoHhXZiqLLXdFzoOcaKCS8o/oz92gHgzI4vcX0rwaeW6g30hkG2uuvMfI1UIp0H8pqRwX
 +o+yqh+aa19lMOpDLmNrsqHyA8X4Yh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_072234_554982_A24AD7D7 
X-CRM114-Status: GOOD (  10.26  )
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

Now that fixes for all the known issues with SME have been applied
remove the BROKEN dependency from it so it's generally available again.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5e8892c0112704f9ca74c4fc55b27..7e3182dd6fa0dadd961c352f88484cff0e520eaa 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2270,7 +2270,6 @@ config ARM64_SME
 	bool "ARM Scalable Matrix Extension support"
 	default y
 	depends on ARM64_SVE
-	depends on BROKEN
 	help
 	  The Scalable Matrix Extension (SME) is an extension to the AArch64
 	  execution state which utilises a substantial subset of the SVE

-- 
2.39.5


