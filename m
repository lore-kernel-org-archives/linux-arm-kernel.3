Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4DD606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BbYEnyrS;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D8uhUPk8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=N7v5AcWY2ZN/+fvAV11vpesr+5u2uhrmRksKZXAExiU=; b=BbYEnyrSHGb+n8UH9q6kvDo3NG
	VTgeJMbEODzT//eZWDCyX/Bn0u0JYPpFhKvSkWm9QRDTwKCOU+jO0EaRNe+kChl8MYQSHsZucdJd+
	IT2wwyKXOj/i3mlPPUg2nh9ruUq1TLYT/wqInQ3S+LEH8d/kqHTR67NNz+okniXioNyi+4KPlWZIE
	4apkUDw2ldTGmZ6hQECuECwatKk+BoeZL6/CecNMwKsio4W+lMuA/3Hs/y7DV92JcTUZRbY+SnxD4
	caWQZmcqhX25zTfT563a+bxSfciAG6gkdLpPfMaHo1daASmd966Apb3cYGioAX1OOG09IT/5ZiBd/
	cMPriUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA68-00000001bug-0NRC;
	Tue, 03 Nov 2026 08:42:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA60-00000001br6-27GU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:42:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 773671A1421;
	Tue,  3 Nov 2026 08:42:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4331D6046C;
	Tue,  3 Nov 2026 08:42:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12CFB10328C5E;
	Tue,  3 Nov 2026 09:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793695333; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=N7v5AcWY2ZN/+fvAV11vpesr+5u2uhrmRksKZXAExiU=;
	b=D8uhUPk8e/mDWNQ+IHdNBipUhZAigKwtP86YXYMWiA53N+F4JJHnkKcappOXI1fJ5xcaf+
	FEMwoVfqygp9Km+2Ltw5kIv3KqUMlTnGUWoESOwBPR9GON1Tk3aE2Lf2Ff3Asw2xL2Ya0U
	PmPiuYVFgJg2kwHgGbsjn3mbVbSu+TXn6KIDvfpSFqvl+6/DnRQrbxV5pWaRpqk2glH4cg
	CjUSjSt5HqRUZm9z1OSqCFCkUCK54oiudhyv6cJfGwGS/9OoJX2mrwi1nF2lnlXyBrOAXy
	HKj/sjE9felgZshvjt32+z6ITKP9Ok+n1hs92qNYuCs3b+1T/AqhlHCSZCeSTQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
Date: Tue,  3 Nov 2026 09:41:40 +0100
Message-ID: <20261103084140.7689-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004220_685703_206E3206 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Other archs have it, and it is supported in arch-independent code, so I
see no reason why it is not provided on Aarch64. Add it there.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 arch/arm64/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..f8542e532b50 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
 	  the boot loader doesn't provide any, the default kernel command
 	  string provided in CMDLINE will be used.
 
+config CMDLINE_EXTEND
+	bool "Extend bootloader kernel arguments"
+	help
+	  The command-line arguments provided by the boot loader will be
+	  appended to the default kernel command string.
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
-- 
2.47.3


