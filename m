Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D33CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 01:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+vxraGGwRxWPFyxdb81njhOMW/2CY53qUTKsiDLF4eo=; b=JatUfJ2KX6Jw7+NMTtQIISJ8/d
	SfA2l7u3cB/MfZGsOysPYWrfQUGP0jg1zuOQcxYvdvrh6MSrqXwIHM3UwzFy9EGu04U4AJfaplm2Q
	ZByHi1+lQz9KhxXA0zGdOP9CdFi4qeyHG/pTTMRF10qJJh9pM/jWEES5ak4yNcypnZZuZMEWUsPG9
	ORgbB4lOlUuOZVSochyUF3QM2vkTDWuq/Wr0p2svT7P8Iv8S9h4MUSI+dv7ZpAZGFRFK34PHDrgHc
	GkPmkGNTHkNY70DlgoQb+zojbqT/RLwLDVi2n4hdiNRHTSMkGkKRcGDfakoDjh0cKqQ1uelGz508U
	jchh7Blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Cy0-00000003DvQ-1Gke;
	Thu, 16 Oct 2025 01:39:44 +0000
Received: from mo-csw1120.securemx.jp ([210.130.202.131] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Cxu-00000003Du1-2xdb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 01:39:41 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=1760578757;x=1761788357;bh=0N/vehwt
	RWCtYehNttI9Ju13qsk5bS7jNthluYyiTec=;b=QQDpsKoP6QHf/NneiUqD9ulUIX/13UeB92/+CY
	HNxMMtrvK+i4AFIz9YNviNmmfuOEMv88H9Z2SjFwl07419T6gmhBz85zSMuNgWLipQ4oO+oBdT5RZ
	vC0HKH3agujnME4KLVujZGnKTXiMV0+cydcARqIjGqnmFwBJ2oPmTEDs+9qEAEuqWYGrTxBPeRGfO
	aDrconBZXNtZTZ+XB4gFmxhKB8ShhOzCBOnCX5AXvpAARbysk295/2NVnsoQIOqklnl5H9DGuJwCC
	Xi31EHWIPzBOeICZ5iWOtDe2yi8HlHoiNwPRGGW79Nwh2GtEx/YITl0D93iAMqLNOvuYGLL6A==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 59G1dEij409533; Thu, 16 Oct 2025 10:39:15 +0900
X-Iguazu-Qid: 2rWhDxZXiUctHiFsU6
X-Iguazu-QSIG: v=2; s=0; t=1760578754; q=2rWhDxZXiUctHiFsU6; m=At88A02yyMty72IxemKjb6m7fTgZRP/26fXwMLRdT+g=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cn9bh5hcsz1xnZ; Thu, 16 Oct 2025 10:39:12 +0900 (JST)
X-SA-MID: 53068305
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] clk: visconti: Add support for VIIF on Toshiba Visconti TMPV770x SoC
Date: Thu, 16 Oct 2025 10:33:26 +0900
X-TSB-HOP2: ON
Message-Id: <20251016013328.303611-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_183939_558579_E5F34AC0 
X-CRM114-Status: UNSURE (   8.32  )
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

Yuji Ishikawa (2):
  dt-bindings: clock: Update identifiers for VIIF on Toshiba Visconti
    TMPV770x SoC
  clk: visconti: Add definition of VIIF on Toshiba Visconti TMPV770x SoC

 drivers/clk/visconti/clkc-tmpv770x.c         | 71 ++++++++++++++++++++
 include/dt-bindings/clock/toshiba,tmpv770x.h | 33 ++++++---
 include/dt-bindings/reset/toshiba,tmpv770x.h | 10 ++-
 3 files changed, 102 insertions(+), 12 deletions(-)

-- 
2.43.0



