Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B079CCDE006
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89YFiJ/Wh4hAAoYq8gOKD9UqG77+iIqKpI2Jvm7L0YY=; b=AB/ZVWRTo35wCr2X+V4vPxCtfV
	vDE29z9D+VHK+1AR/aVK5XmKvFa/mEVDj1gKhdeN3Y/Tf9s1k0dsJ89EKbUpiQpb/HWigxOtKh/Df
	C8jcbyP4fiwD3gT7EX0srUJlHwkz2v6fsFrbuDEIHCvegE4xORoMs4mrFU5y7VuzEc0InkEgVWWqD
	PT04xRSPNu70DcT44fTd4+rUK9ACT6I9yGzEtUUlIU62ce4JY4r/7tty8y3bi2w+rv9FyJZtyquf/
	JjXBuBkXRw32R3ZwDEQ8JjeYZJhAgPrAB2KIPzBi7UNLhS+3J+FA5LscY18KVn9IreYsXZHVWptAA
	oDvSt6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnx7-0000000Biu2-36Nh;
	Fri, 14 Nov 2025 07:10:37 +0000
Received: from mo-csw1121.securemx.jp ([210.130.202.132] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnx3-0000000Bisl-2zRI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 07:10:35 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=1763104224;x=1764313824;bh=ZyZbk4ge
	M5CS5wO0ueAyUR0irGkrwv8RifK13AYs0oA=;b=vCUy6OvEEqQasGSfhXrd6CbayylYJ6+DUmtxaq
	h1P8+Z33yyiUA5J1vRiMVCX9i4V4ULXe3K7lDMQJ+Iryuapyn0cJPTBhwHQuDfOfI9JXicZchMGZx
	xwenYuDSgyJA+5rxuKw+W3u/CH8yEPhaQesivnM6NpUxxXNB0z+pIDbulVx9axbsw6PvRjlsyfywk
	mMbqL37/nKUjb0yth0ZT1dPIO+0VcQ4zRiUJMEAQ4dtVdEWKrQC0mtAqFUL1W0x+8zXB1QHH24CCl
	OozTU1Vz/VQXjUdd88yCXDdKYk+0JLRFYkUs3Vu0y9xdQWoLcQCqTIyL8v1XA/VUbRqW/py9Q==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 5AE7AONa3876984; Fri, 14 Nov 2025 16:10:24 +0900
X-Iguazu-Qid: 2rWgP4I4zWgpT5ii9N
X-Iguazu-QSIG: v=2; s=0; t=1763104224; q=2rWgP4I4zWgpT5ii9N; m=BKYLoLsdkX9EDYa+JXbp0G+uwgGPlmm/1WYhYC2H+gE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77ZQ6cCcz1xnj; Fri, 14 Nov 2025 16:10:22 +0900 (JST)
X-SA-MID: 54823655
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH v3 0/2] clk: visconti: Add support for VIIF on Toshiba Visconti TMPV770x SoC
Date: Fri, 14 Nov 2025 16:05:10 +0900
X-TSB-HOP2: ON
Message-Id: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_231034_412207_13098AD0 
X-CRM114-Status: GOOD (  11.24  )
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

This series adds support for Video Input Interface (VIIF) module to the
clock and reset driver of Toshiba Visconti TMPV770x SoC. The first patch
provides the identifiers for clocks and resets. The second patch privides
the control sequence of registers.

This patchset depends on https://lore.kernel.org/all/20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp/

Changelog v2:
- dt-bindings: Do not modify existing identifiers to avoid breaking ABI.
- clk: Update clk_gate_tables to reflect changes in bindings identifiers.

Changelog v3:
- dt-bindings:
  - Only add new clock/reset identifiers.
  - Remove TMPV770X_NR_CLK and others in a preceding patch
- clk: Obtain the number of clocks in the driver source.

Yuji Ishikawa (2):
  dt-bindings: clock: tmpv770x: Add VIIF clocks
  clk: visconti: Add VIIF clocks

 drivers/clk/visconti/clkc-tmpv770x.c         | 75 +++++++++++++++++++-
 include/dt-bindings/clock/toshiba,tmpv770x.h | 11 +++
 include/dt-bindings/reset/toshiba,tmpv770x.h |  8 +++
 3 files changed, 92 insertions(+), 2 deletions(-)

-- 
2.34.1



