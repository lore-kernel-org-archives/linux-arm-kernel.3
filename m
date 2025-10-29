Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C52DCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1RCQVgXuFAYifsS14yTUrIEaXwBFKF1keBWmbj2f9b4=; b=pp4HaltUg9Tl9qciyBQ8Zh5fJD
	iHbq+9aFKC1Gn/BSZLKraICaku6l/4nRnExFwG2i6MHbBbriwpc67e1FiZdkEbmY3SdFI2kl68IiS
	OtKLtgIv8etJWeP6B4zODlbB1JtdwUe0YR2z3FMm8sFd6xJaDRg3gNqVMApbYlHqZ2yKYSezfUL+3
	86DUDceXgdr8YmaXr7t0Db8KnKy7DOLlBTmgctGWdEX76Ci+5UMD00hcrVLX5mUNXFNE2DxszyfaX
	ZVRL0W+wm1J2pLbUx0zMKBrjhmSmblbbEnNrUtYjftybTS5nUdeqWE6vPy0ewDeaWvLGz3CqdyNq5
	KVoDKHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzWr-0000000HRv3-3Bxv;
	Wed, 29 Oct 2025 06:19:29 +0000
Received: from mo-csw1121.securemx.jp ([210.130.202.132] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzWo-0000000HRu1-2C9e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 06:19:28 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=1761718745;x=1762928345;bh=7IRI7cKE
	8uYS1V2bg4Jc9AQa03FWztuEHP3zHwMpPkU=;b=WaevSnEZ3HXfj24etvWDWgKc9lE4EesOCOcvnl
	CoL6V9wTFkN3HcvOq9YlzcevVL1i4lrukjCarPdlOCTT9jM8EbjFRzaICvhcwZeRIQdCQ0CUa2St4
	t4lzP4vOs93L6Ea3cZMmBD3q7r2/YYIGSoAMYIah2ASyx4LhP/A8deqYX9/FFm09cMofHJMJC3QLH
	lco+iFVTMNouV6ubrcYQDqbOHrqn5J5cfmnlZVnYq9xg2VUNpRior0dejle75aFkg/stYarMI1AOK
	KJhHq5GdzkLNliCsCLqjkP4QNdU+cJRaYqBY85+GJ4v9RpHLlDvJB+cx5sPjgTYLF5muQ5p0Q==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 59T6J33j2256398; Wed, 29 Oct 2025 15:19:04 +0900
X-Iguazu-Qid: 2rWh3gygZ7fVXby91M
X-Iguazu-QSIG: v=2; s=0; t=1761718743; q=2rWh3gygZ7fVXby91M; m=wSwLD5HeGHQFTolYcdrp9j4UtZ4oS71nko3BIBDjozc=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cxHBZ5nD0z4vym; Wed, 29 Oct 2025 15:19:02 +0900 (JST)
X-SA-MID: 53851507
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
Subject: [PATCH v2 0/2] clk: visconti: Add support for VIIF on Toshiba Visconti TMPV770x SoC
Date: Wed, 29 Oct 2025 15:13:42 +0900
X-TSB-HOP2: ON
Message-Id: <20251029061344.451222-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_231927_253071_C92B1A8E 
X-CRM114-Status: UNSURE (   9.67  )
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

This series adds support for Video Input Interface (VIIF) module to the
clock and reset driver of Toshiba Visconti TMPV770x SoC. It provides the
definition of identifiers for clocks and resets, and the control sequence
of registers.

Changelog v2:
- dt-bindings: Do not modify existing identifiers to avoid breaking ABI.
- clk: Update clk_gate_tables to reflect changes in bindings identifiers.

Yuji Ishikawa (2):
  dt-bindings: clock: Add identifiers for VIIF on Toshiba Visconti
    TMPV770x SoC
  clk: visconti: Add definition of VIIF on Toshiba Visconti TMPV770x SoC

 drivers/clk/visconti/clkc-tmpv770x.c         | 71 ++++++++++++++++++++
 include/dt-bindings/clock/toshiba,tmpv770x.h | 15 ++++-
 include/dt-bindings/reset/toshiba,tmpv770x.h | 10 ++-
 3 files changed, 93 insertions(+), 3 deletions(-)

-- 
2.34.1



