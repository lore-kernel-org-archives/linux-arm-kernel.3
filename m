Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8147D58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GrhfvBvRZGiUNI24672u4T9qgGpFtW6cvQCVSgM4gf8=; b=P4J3H3KicQuAcrRpZXh8WzvK5Z
	H3llAIsURsCEXnYcZxC+SqnqlVhtXM8fPRI0mYgwbhARcllz4qX112eWJxDs1jbefGxm7VuT/JvJY
	DTQ4xNHCXOmW8A/rgpswYLWfxRk6e0IyHPfISsb3zRLdt0Nq1CZ3HVhSL9t0w2uAFuGwU+lSiErfp
	eWNdfv24p44Qg5kepxj/oXdtiOO22ddeH/Qg14CL9tDLdCW/wWfsX9E05wlJvjdlxuKPqfnBjhDty
	der60NiZSkxCCtwHKsQ1foX8uX6NT6dYVUycTUbyUD2SO6tuNO5FN7bEG1cQcNa7cKOtDxHprRqG2
	1ozZohqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51LL-00000001SmX-1fOw;
	Tue, 24 Mar 2026 12:58:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51LJ-00000001SmM-1A3a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:58:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E58B60138;
	Tue, 24 Mar 2026 12:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F73C19424;
	Tue, 24 Mar 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357124;
	bh=A+4g3Ij/AyOjNc1oYiN7OS9aACrBKUxxbsOdM2jP8Ac=;
	h=From:To:Cc:Subject:Date:From;
	b=Hil6nIEM7g2oVF+7s/xfLmKm+SI4qMb6HhsT/SfHKXG7ZVjuALfdThW6eLkWOPg4A
	 z58WqRw45kG4TjmDf5w8lhp2QIRyN1Q84bRCrDjHgMQFDpJQOcTtrzHUPahik46DlC
	 155E0OiGtXVimz2n0vQwPnR0l2TxV1CBlbQC4flmByQse4nJTzjevqt+KvZKHvNpUW
	 MkyjeCf0RRcNTTYNaknrgmzRqZZIqoG6LHGTJW2JxAskQbKWFSLv/aT5s7mY1K2imD
	 HZ3mHww6y8ps6I8Tbd2sslEJEmU0nF+e9jy0NDz2vZ4VbZr2b6ORWWNpkaypFfu+Fp
	 F7aAtmwwVgVNg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/4] samsung: drivers for v7.1
Date: Tue, 24 Mar 2026 13:58:21 +0100
Message-ID: <20260324125821.59728-5-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266; i=krzk@kernel.org; h=from:subject; bh=A+4g3Ij/AyOjNc1oYiN7OS9aACrBKUxxbsOdM2jP8Ac=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwoptXmmr4YBkPD+8zTZrPzd80hp9Ha6QeNMJE VZySaNb1TKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacKKbQAKCRDBN2bmhouD 1zhRD/0WQA/XCArRr3CdsfHsXa+JTsEbFUOG7rPq8BI60jJgtrCfd82ERyonh793OfAWYazJ9Vj CQ5lrsxyrR3ff2SWMeBFA/NClJYNToQYqX5XZ4Iag/ALdDxGWITkYgVWf05qhr4IyNmiGu/yqUq yUEu/CuMb3hQTujHoaSf/jc34JkrIhppAwL2Hb51FgfPKdUIS6oG4Wa51CoNcsmFUoCE708HTTl OwbnKKpASQon83rxTKDzHD77mk+SMxe99NqcaIkMuES3IBAg4CuNEGZp9tbOHQ7KFUOgcxoxglW BE47zmIBDcdEd7/sYicT6lkI30IUpeU/Qohha/ejHSdKcYBIC9XCtMbHgcx+43Ut3+xfWYNhKsD nijKWhvAa2GdB/STlk+waGuDuoR8AVyWPvnHJSFauaXXBwNAWR1OnKbG47LRcTfkFugotLECNGE vMVxw15rrNLEqbgrYxCIVwE0pNsn3aVh7gcBawh7CuKpAc0TgCtbPMMaOG7wu14GDE1p3cd/Z5X G6Mx3aQs6WsezW3YELqCf+mOKg5koZlXdQErDXlKNXo9HQBN6czPsslarn8BIOZUI661nxbEe+Y 67fQMKpgxV/Heg4eNsNBwpvvpTvJwjxxq+EgZB8yEzFBgXFHbpuctC0Ax/172iIngPBtEwwUgqf STZY9sJaxw7SR7A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.1

for you to fetch changes up to a2be37eedb52ea26938fa4cc9de1ff84963c57ad:

  firmware: exynos-acpm: Drop fake 'const' on handle pointer (2026-02-28 15:47:03 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v7.1

Few cleanups in ACPM firmware drivers, used on Google GS101 and newer
Samsung Exynos SoCs.  Notable change is removing 'const' in
'struct acpm_handle' pointers, because even though the code does not
modify pointed data, it immediately drops the const via cast.  Also code
is not logically readable when a reference getters/putters (e.g.
acpm_handle_put()) take a pointer to const, because the meaning of "get"
and "put" implies changing the memory, even if that changeable field is
outside of pointed data.

----------------------------------------------------------------
André Draszik (1):
      dt-bindings: firmware: google,gs101-acpm-ipc: add S2MPG11 secondary PMIC

Krzysztof Kozlowski (4):
      firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap index
      firmware: exynos-acpm: Count number of commands in acpm_xfer
      firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_ptr
      firmware: exynos-acpm: Drop fake 'const' on handle pointer

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 +++++++++++++++++++++-
 drivers/clk/samsung/clk-acpm.c                     |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        | 13 +++---
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  4 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 26 +++++------
 drivers/firmware/samsung/exynos-acpm-pmic.h        | 10 ++---
 drivers/firmware/samsung/exynos-acpm.c             | 30 +++++++------
 drivers/firmware/samsung/exynos-acpm.h             | 10 ++---
 drivers/mfd/sec-acpm.c                             | 10 ++---
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 40 ++++++++---------
 10 files changed, 120 insertions(+), 77 deletions(-)

