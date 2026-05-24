Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180BDCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyKZjNbaHLwDKPrtbrYcM09pSTjLvLotHazDOtjm1SY=; b=K++clts9kdpbj+sfKEjLBaa61V
	r22qny4q/VMHgXgFQRaUvPOyzGM37Pco++8sklFqwWMuhvgLchAp3K6rEfUxged33pbO4uSh6HHbw
	8Q8742yUMCMMAIAu7M3Q2gvloj3OBGiA2mKCg7SsO1FTQqJFuldmr86EcqyXRHN2AX/cB/04FLBcL
	HnlZ95jnFMMlzIG35Zq1U0cymatvaH1tf7L09N7yrkCdHUl/4R5lIEcDf5ivJRAicPtbcFHTS1Kz5
	MNnJ9ZDnACks0qICJfIM96fw6kUwscb0hKqk0NdTCtl4y7F+t0k347JJWoh+gAWspz66BfHUxCkWA
	djSLCI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDzk-0000000FSR8-26HE;
	Sun, 24 May 2026 18:56:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDzh-0000000FSQY-1cJM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 18:56:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8E0242AAB;
	Sun, 24 May 2026 18:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBFD1F000E9;
	Sun, 24 May 2026 18:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779648971;
	bh=YyKZjNbaHLwDKPrtbrYcM09pSTjLvLotHazDOtjm1SY=;
	h=From:To:Cc:Subject:Date;
	b=VyqMcrGD33O1bmv/LoY6CA/aTnLRVd2JcUxO2iMHB1AAqAW6LwxE7ukrFvRAPmmOn
	 0hrNyUybAADQLC1jXmTGF59zvprNeDIN7KQcbM6rFK9NUvYFKPszBvms9h5R/NjiTN
	 T+hKTzOoZw55sxVC4+R6EQ586bzBZ2vTdypHXq+RapsQCKZA2oMwc9v49mM2+pL8L7
	 rfeoYDoa7DWuI9JuOx8xjDpv9/GysI1roOWo/HWPR/ec7Pyz2mteofAewy0WEEAiDr
	 Jw6GVCvGObBUrSXw6uqFHdHWwj/vnmIHGYhumSH9U6nFBlKC5POJ+5rvqoK4if6tDK
	 3mWCFU2/b3T+A==
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
Subject: [GIT PULL] samsung: drivers firmware for v7.1
Date: Sun, 24 May 2026 20:56:05 +0200
Message-ID: <20260524185605.18583-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889; i=krzk@kernel.org; h=from:subject; bh=wTrUwjrzKt9uWx10hAT8NYnO+2kpOmUiSrsRnf4udwM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqE0nFbtpCX9u6rkqyFVoDP7YKC1IYXvuPd2n9P Db9xfTWSN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahNJxQAKCRDBN2bmhouD 17tHEACXTLzXExmrbvCW1l+01kPG3UUgZp0Mx0wjZmgjkNXurdMy/Z3/ecN/9aL9j03PivVwSpN xJhdjqTZpo2eK0R/YGRFW9KsdekspGPDSDcQMX8zKuN7569txcnyMOSps11frD7Iknl8ccBEHGZ BVJ2ly3aPAYQ9angH7ecqQGtHXQ4+W9k7Do4epQnN9gU7ufWt0EttQduM26/T+kfzT2RrUiRw/0 8ap2O7ywDRSIyAf6YHuzvZk5gMkfU4jSTvp1JUr3iP4pJfZZgO1b82zTGKFls0RM4czaKjHaEDe 9q1O9ffekVeUeB0fKB5uLjrDUILdCIl0fR+SKjHGP+99qZCBXJ6LBpJpTnXw8ycOMPeDe6cVJkF zbka2hpb7qV5AztwbHxVV3iGpNxzccjIpVRH4rxP/gNBaEv0RVGtQfIkKAwXaPX6KW8q1xsuVKo aQq3YyHRCbJ66IlvigOxY20tnw5xV8RtIn76tBkuTLCGygf7RUkC7qh2sNdLbfoWfJZBiLwKYB1 9pWoQTRmRNgMbvlVW9zGuvOdjb0KqgMmoaxzD3jlmDdjuhHmI4WR4wdWuH0ws0ehck0d9cafu9Q oh8EqhgDQ2ybmPJkqFgmjfDNxqJ3ZjMFoqZMx+prdZ5c7Lq+rX6peJL8RCXMSUgIAC1Vr989tF6 Wr9U1A4/WFwNDfw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_115613_466413_09F41517 
X-CRM114-Status: UNSURE (   7.81  )
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

Hi Arnd and SoC folks,

Few driver fixes for current cycle.

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-fixes-7.1

for you to fetch changes up to 10313b4cca783ef2e38b2a76dc42dda481d7ebf3:

  firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion (2026-05-14 18:55:00 +0200)

----------------------------------------------------------------
Samsung SoC driver fixes for v7.1

Fix several concurrency issues present in Samsung ACPM firmware drivers,
used currently only on Google GS101.  Tudor with help of Sashiko
identified several missing barriers and incomplete synchronization,
leading to possible transfer data corruption or use after free.  Few
other issues related to probe, including missing mailbox cleanup, were
also fixed.

----------------------------------------------------------------
Tudor Ambarus (7):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Add memory barrier before advancing RX pointer
      firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 145 ++++++++++++++-------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   3 +-
 3 files changed, 106 insertions(+), 45 deletions(-)

