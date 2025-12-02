Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9E6CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ddem7pRfXjH2CsY6jhzQQzzqAVw4nJRV9oahcR7IXNA=; b=0zKE9cTUFffaDbd/VchCnyGRTB
	12FF1rpdFOoY2QjGBYeCx+ypPaBhDvX+vbBxV00MJdMspdIVLUvjA0FuBUDL8Ix+2BQ3JLzpo9RHe
	JsthAeik2kPLewvK9R/b3iDxX2IeSD3wJI1R6w4xXBbElK+SpxnhxhsQ5A/ZknLeD3JvQhIR6ehvp
	A8LiWlHKNueJZhzJiCHo+sfZ0EBoU4wH6V7TwEo4iT7hQVKNx4D+ajIIiv0Cx6xytV8syPq2hWC7D
	DhDAcM/xj+eTPUQ+WVOWhnyIebahlTnG0Si7hmiuorlDOK7iOLC/Bq6/jAS8IQkE7R69v1nGmYRZl
	Jd1VPV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMiU-000000056t5-1iZ1;
	Tue, 02 Dec 2025 09:30:38 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMiQ-000000056qm-28Pw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:30:36 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251202093025epoutp02828b980534029236220b9e19543a0801~9XAnCioIf1772717727epoutp02J
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 09:30:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251202093025epoutp02828b980534029236220b9e19543a0801~9XAnCioIf1772717727epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764667826;
	bh=ddem7pRfXjH2CsY6jhzQQzzqAVw4nJRV9oahcR7IXNA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LockMcLKH7V15WqJ2iRMUoPkRCoPWY1oj6CMYOjFkzKzLDUlUBwVHuLpbN0VL/3Ul
	 zxoTJWn8xaoCm81Ijq9stnr22vXoBLdsBwNRKDBXNix3mVO1enYbcyFEEb1gKt9dB7
	 8qsw4JIDKbi9js2EkCw8yTKysADeexTA/V0Jf+lg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251202093025epcas2p135ab56fb84d8bad6f905880addcb2e57~9XAmehDkm0391603916epcas2p1K;
	Tue,  2 Dec 2025 09:30:25 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.203]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dLFqj0V6Nz6B9m8; Tue,  2 Dec
	2025 09:30:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38~9XAlhC1440393603936epcas2p1h;
	Tue,  2 Dec 2025 09:30:24 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093024epsmtip1f37c0608a18fb17f998cf72feb2edadc~9XAlbrQhs1253612536epsmtip1V;
	Tue,  2 Dec 2025 09:30:24 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org, ivo.ivanov.ivanov1@gmail.com
Cc: ryu.real@samsung.com, d7271.choe@samsung.com, shin.son@samsung.com,
	jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v3 0/5] pinctrl: samsung: exynos9 cleanups and fixes
Date: Tue,  2 Dec 2025 18:36:07 +0900
Message-ID: <20251202093613.852109-1-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38
References: <CGME20251202093024epcas2p1567dddf09e3599867e9dc14a9a234d38@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_013035_247551_630002F9 
X-CRM114-Status: GOOD (  13.52  )
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

Changes in v3:
  - Collected tags:
      Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
      Tested-by: Peter Griffin <peter.griffin@linaro.org> (tested on Pixel6/gs101)

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
2.52.0


