Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DF3CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CzGNF+VTlvtIapSjsIV5bW5TQhJnEB3/iQPUbpSa5uI=; b=g1UsCqkYUqyfSryrEKu2xK+8A6
	SHCUwz52jT58xCysbyRysLVO6gDmv1tUzKV2a59Ctkfj3lGsa1L/9YrRlWqlO1xW2lfK3IJ+kjhsY
	7tuG3truTYtgNopgx4u5BQreur80ZVe1WqB1ajrWB1BePMw1HXXBqWpjljZS/ME7l393Docc7TtDz
	VEEqhpV3PcafqDIr+0mnAOLq8PCi0nuq9cVJyeozpY0QpBjjpzi336pfqAAX1EtkrvvEVjgGKOKKM
	nxiANRyB7nGaAJucwgK2bYmy19FLqKH6cNxIukRY5ZVyYtQWs1pdrrYfPARQgOvDFUil5geufiUYN
	8pG9MtHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwAI-00000007MMx-3KBi;
	Fri, 29 May 2026 12:18:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwAB-00000007MKi-0NJI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:18:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B5F860564;
	Fri, 29 May 2026 12:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F751F00899;
	Fri, 29 May 2026 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780057086;
	bh=CzGNF+VTlvtIapSjsIV5bW5TQhJnEB3/iQPUbpSa5uI=;
	h=From:To:Cc:Subject:Date;
	b=geAcMOp56bGWFIr02wcGx3THTHRAt1Sdn54lmekJqxnYyEUoh+mQBnwyuPFnBrzv+
	 TTj1k0ACRBCKCcQYiZRm9kBn2kTagJaBDAkU+VzNKiGbyPwV9odjPQZZxrYvw5hBU1
	 ajp3tHKo2h6yxzzZjc799g2GcG2PSawv19H1U6ckpPpzl9+HPpc5LvjC70YzaqutBd
	 rqVTIwHP2YLZ6UIQ6v0kv72IHVg/zLhm/5xW3+eExKz6KGfjXszIv1of0ePF29WF7+
	 J2XVtQI8EfxEhGDcxkuU/3UZc3NTWVVA85c6du3r4Vbvtz2CWL22U8eDNeesxBdBij
	 VHnKbkHGl3FsQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] samsung: drivers firmware for v7.1, replacement
Date: Fri, 29 May 2026 14:17:57 +0200
Message-ID: <20260529121757.13224-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052; i=krzk@kernel.org; h=from:subject; bh=ZMjAF+OwBUX1j8RpGOcH8icmR9zWYxGfGHxf/YItcBg=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqGYP21QR0o7tuEi3Mg+qQ+UoRS4Gpd1oPhE3Go FDcj+ptjJaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahmD9gAKCRDBN2bmhouD 1w1MEACCgy6+0dYIFFXZlvyZWmbIS+Ge3Pbw03rpKsktJby8zcvGTsrWW9U+hmfTxRvqJ9FZXQG XGjrj+IOxst9AmogOnewraoEokSI0ZeCP+rAlfT9kTPdp70plfpOi3+JPI5sZBimChUWEZ8D0vF VBVbmOtjqF1HvhwYSo3agk9dIy0Dpu4wWP7OBkaZulXFkR8GSkvnZd+e2a+GgXw0qCajG5i9RF6 03OJmC3jcQgO72+BsLg0gHWKt+QFrrLX9vEB0RonLs8bYpXA8CYOx+owW5gTAXgiaXs4cDtsagB UZbWG78w4S+MPvWwPLvoF2sqmqkWH0Q4UMVoXSJCUOT+gx5qzghAL5FSETykQ8ms7ZE5gtDhSUO 853mdWa3ske8PUFHiX+sSXRGwHI/5z//PcyeWL3fhLvRanRHxQcXl9egQIuRM/kQs4IS/Xhn9NM jGat76mqkd2kIyBMl2tC65KNYliyZuy1c8K5zRWZclfyHZMa/DM+9EUW/WJ9KKA+SxekOsbyJUL 9qtahlHmXrPAdJxUI/Pc/0b7kuan+tfQu9PEcCnIE5/tcUnaT3VSpKrJv/2eO+Ga8dAAfklxGcS CA644PSF1FULCSzz+dMFIKgUPkHPvtwUmil2/JT0gOnaW2xea+JnYMcWEqurg6SgPBQ1Aoh8dhk zPcw6gAqMBcGBwQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Hi Arnd and SoC folks,

This is a replacement/rework pull of previous tags/samsung-drivers-fixes-7.1.
I also dropped that tag from my repo.

Changes against previous pull:
1. Drop commit: firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
2. Drop commit: firmware: samsung: acpm: Add memory barrier before advancing RX pointer

This caused rewritten history, but all of the commits were already in next
since May 14.


Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-fixes-7.1-2

for you to fetch changes up to 7fe40c32a33905302341797b5d12c541729dd08d:

  firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion (2026-05-29 14:11:23 +0200)

----------------------------------------------------------------
Samsung SoC driver fixes for v7.1

Fix several concurrency issues present in Samsung ACPM firmware drivers,
used currently only on Google GS101.  Tudor with help of Sashiko
identified several missing barriers and incomplete synchronization,
leading to possible transfer data corruption or use after free.  Few
other issues related to probe, including missing mailbox cleanup, were
also fixed.

----------------------------------------------------------------
Tudor Ambarus (5):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c |   3 +
 drivers/firmware/samsung/exynos-acpm.c      | 141 +++++++++++++++++++---------
 2 files changed, 100 insertions(+), 44 deletions(-)

