Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1AFE64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKPY5mUDwCQzcC0NaKAT50ijS7gJKsqZHOvVhsiu++M=; b=D8jcsxG3V6rhgUIM1C7N0N61dq
	qdoc6AqeAKolNPc3M3ybdKBu/eb8N3EYBt+DmfBUTetlenRRssAxLzevWW6ZS6xmJd/54HN2KT88u
	RD0x90VY7ei4Pu780+9Epk1GEkQmpQDp3018eLm2vjy+NI2rEm7gaZH1e2sbbdecBaaomF6TJmWkJ
	IKy16q09MNcQF6hPw871sGotmLncqd4nB41eTsER8KSE+7tghhnRVREUd8jkwsBW4z9vhpBCcsOjk
	kZEE8CwkAtSP0yYgnwaeaP4bbso7BdmxeoBOLu+LXysTFU8/pC2ZWG2XcYQv7ENRAvZD5BI273m+S
	4Da8MA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISa2-00000009XXp-0LhQ;
	Tue, 03 Dec 2024 13:04:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISKD-00000009UNO-0wTo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB5725C6CD0;
	Tue,  3 Dec 2024 12:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C299CC4CED8;
	Tue,  3 Dec 2024 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733230100;
	bh=NfLmqQjhH+UlQ7Y+G2ykkZMplv/ejiQc6RhXEP3cv9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yu2+KZWiSIg/vcibGpWsC4cSQbX7GUoTsRpfcjQeVzVoSvs+rjG+UlSrYzTyUDwdI
	 ga5ga1wgyLuIOxUK7PRdjOOwas0dHstcVRs4hb6Ct/oOTZlr3NpjewUgorCB0g1wv3
	 uTSF9S1gNIZJ4Of4zDoStJL+72ik3DAONCVZE+JXx74xTwu/2AFg8rcOcRWXBMcuax
	 mulsC1oYrj9JpLIzDjmaiHaRR9S9iFbbgMkR3dpxBTlauafShocbEDuyC47gx8wPKP
	 jz4tCO3BzZ6kbwKbJMAX7d3JQ/oCVDEUMAaDvZQYqRnKRyZ8qaz8bgndw9Vy1S5HNY
	 SNbYEK10lubvw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:45:58 +0000
Subject: [PATCH 6/6] arm64/sme: Reenable SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-sme-reenable-v1-6-d853479d1b77@kernel.org>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
In-Reply-To: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=769; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NfLmqQjhH+UlQ7Y+G2ykkZMplv/ejiQc6RhXEP3cv9c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTv4EwAM7vHQhCvbi4NPdM/aOb5HiD8WW+R04Hwxs
 zQLBaXaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ07+BAAKCRAk1otyXVSH0GhZB/
 sGRSMP+r1w2EvOeWpp1ren3qhBDoiJyO61GV2YT1wDopNT9HefjfeDe+yPisElGPZdPvi21dHByK0u
 6EHYKPBCF6TrC5EW4eLWCIl86ntF5Ym7Zw6qsBgrdlnQNoUF1NzxxOziu2h9Odun/EjCWC0Ted5Uf4
 31BnrqOPDSmcBabkjEVeXjvAKgHv5uFRVHS9MnPNuM1TD55kahcDYCsjQmTFiHM/3OI3z3OkxaMxpu
 Dr/XrY6g3eQ1/BD5u00yHaMQOHyF71QdwHBMgO6b6ZnKogrJcJcAUmmhlYqU7seGNaylYBWkSUfnum
 R0rvriv0KBw/bSl5tqqYZBYvZm8ePz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044821_319332_3DC5BBF4 
X-CRM114-Status: GOOD (  10.13  )
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


