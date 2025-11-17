Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9428CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=YfbyNU/WDrACGa9gZEO0KE1YKBb0kDp5Qr5x8yIXP2Y=; b=DAxxBVGuCKyu6MskDT8F5UflLB
	DROjOJYfyrY+9SXxaQuNFUNpupSQuF/2U/oCES2Gsl57OKcFbtEKb+gFLLoEF++DJBuy7O6hO+DSL
	a/fwYM5luohP3/qPPwWrM3Zxr5nr2kgpoloMrICZh0Tf14I1pJsNyA5XV5R8q79sVumBccnPv90BF
	DeLlRD9be4IPm2qLqdIzP6QT1Z5NvffPWK/f1LAMoUblofEHoImvvAuTqFjZLk3vB8NTDQhmoKoLz
	VqTiMQTEg3a9Doh3zSXoXQ+uHnpxkxLZtpJEOmmCBn9pcrhj8NLES89ccPCAr3cumq0oNshQw4pO4
	Wbr0r5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtma-0000000FciI-0P9a;
	Mon, 17 Nov 2025 07:36:16 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtmS-0000000Fcex-426U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:36:13 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251117073602epoutp0114f94d768e6642a0777f2711755f2a08~4uxdExS3-1557815578epoutp01f
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 07:36:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251117073602epoutp0114f94d768e6642a0777f2711755f2a08~4uxdExS3-1557815578epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763364962;
	bh=YfbyNU/WDrACGa9gZEO0KE1YKBb0kDp5Qr5x8yIXP2Y=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uCJhrwVXyC9h2xnoAtgnSfUBg8l2l70bHMAdlYG8Q6z8j/QCaO99OiJQ0rg3lpPa6
	 JPoi47YiApVgfc96H05Ni4Hhw+8cSd8YSrardgk9egbDZR+khKvS2mXBdJeIcTk59Y
	 dojUaC5zVHJtuPbex5p/B2Z45KkC817di3izBRX4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251117073602epcas2p2a4b606e03c7f58de4b9a9b27bbd0e196~4uxcpum4w3033030330epcas2p22;
	Mon, 17 Nov 2025 07:36:02 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.207]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d900d6CCjz3hhT9; Mon, 17 Nov
	2025 07:36:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073601epcas2p2c72bdd8689a69b35b988894653300c75~4uxbglRB-2295022950epcas2p2a;
	Mon, 17 Nov 2025 07:36:01 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073600epsmtip2759c2dd2e0aa2012b3224edb98a17730~4uxbaiPwM2830128301epsmtip2u;
	Mon, 17 Nov 2025 07:36:00 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Youngmin Nam
	<youngmin.nam@samsung.com>
Subject: [RFT PATCH v2 0/5] pinctrl: samsung: exynos9 cleanups and fixes
Date: Mon, 17 Nov 2025 16:41:35 +0900
Message-Id: <20251117074140.4090939-1-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117073601epcas2p2c72bdd8689a69b35b988894653300c75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073601epcas2p2c72bdd8689a69b35b988894653300c75
References: <CGME20251117073601epcas2p2c72bdd8689a69b35b988894653300c75@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_233611_300687_43823885 
X-CRM114-Status: GOOD (  15.62  )
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

Several SoCs carried near-duplicate pin bank macro families, making
tables verbose and hard to share when only the bank type (alive/off)
differs.

GS101 had its own helpers even though the newer EXYNOS9_* helpers cover
the same semantics, including per-bank filter control (FLTCON) offsets.

Some pin-bank tables didn't match the SoC TRMs (bank type, EINT class,
or bank names), and FLTCON wasn't always at a contiguous offset from
EINT.

This series does
- Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
- Fix table errors on Exynos2200/7885/8890/8895 per TRM.
- Add explicit per-bank FLTCON offsets and update affected tables.
- Drop GS101-specific macros in favor of EXYNOS9_*.
- Rename gs101_pinctrl_{suspend,resume} ->
  exynos9_pinctrl_{suspend,resume}.

This series was based on the pinctrl/samsung tree [1].

I tested on Exynos850 through boot and verified the pin values as
follows:

$:/sys/kernel/debug/pinctrl/139b0000.pinctrl-samsung-pinctrl# cat pins
registered pins: 42
pin 0 (gpg0-0) 0:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
pin 1 (gpg0-1) 1:gpg0 CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
...

Additional testing on the affected Exynos9-era platforms would be
appreciated.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git

Changes in v2:
  - Added base tree for this series (pinctrl/samsung).
  - Renamed the macro parameter from 'types' to 'bank_type' for clarity
    (struct member remains 'type').
  - Reflowed commit messages (wrap at ~72 cols).
  - Replaced non-ASCII characters with ASCII equivalents.
  - Collected tags:
      Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
      Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
  - Normalized hex literals to lowercase and removed double spaces.
  - Aligned backslashes in macro definitions to form a vertical column
    for readability.
  - Added missing mailing lists (including linux-kernel) to Cc per
    scripts/get_maintainer.pl.

Youngmin Nam (5):
  pinctrl: samsung: Consolidate pin-bank macros under EXYNOS9_* and pass
    bank_type explicitly
  pinctrl: samsung: fix incorrect pin-bank entries on
    Exynos2200/7885/8890/8895
  pinctrl: samsung: add per-bank FLTCON offset to EXYNOS9_PIN_BANK_* and
    fix tables
  pinctrl: samsung: fold GS101 pin-bank macros into EXYNOS9_*
  pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*

 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 1069 ++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.c      |    4 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   97 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    4 +-
 4 files changed, 562 insertions(+), 612 deletions(-)

-- 
2.39.2


