Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A719EF433D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS7b4nt2CaxovI2sYJxZS8EFjpXGqCXQdb+UI5J1fMk=; b=wVRzdpyZrKcr6syafolHK/Q53W
	gQ09+rOrEHDhgBJ825ZFiVd/5hCwvFmkFpHpEDkf96Ek65W4plHThQc9RnSEubHS3iZfml/CULKEA
	KNlgLnvUiLXfqnpV7VsJusO/V//pL/NftuaKuTtyJuawDvFE0C7A4plnz15CPKALiAFojs7xzfnCz
	1OZazRd1k6zF1tvDUmmbCAsmtZB1z3eLb3I63BWtk/KOmIwA4oiH2ytV0w/KFdtLFoGs6dXzOSocH
	+eOtqEt8vQELCdht4HwD2PMjbk+2Kcet0lOqCFDgSdKp34CZd7OWx52i3WXS2UBhLUhFS3Z/DlVMB
	LcN6Ylyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jb-00000001l4t-1qKY;
	Wed, 15 Apr 2026 23:33:27 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jX-00000001l2s-1Z21
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:33:24 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fwyBT3cSSz9tff;
	Thu, 16 Apr 2026 01:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LS7b4nt2CaxovI2sYJxZS8EFjpXGqCXQdb+UI5J1fMk=;
	b=M4vaJbL3qYavG6n1tXlhY4NwrZFTAQtVmdqTB2XwSBeXrP5VaYk7JmX15qY7OrkDluID2o
	Qg3/nQAlciMrwd1LH2veo/Zo+UoWyay+kZfsSR1VcT1lWAxQWyY0grJ4/uOuGzYijXG6ya
	qBwl6NRjfmaSX1S/gdlezUW4S5d9axK5K1EkGTQdYKrtAMGntxu1MESiJWiBJ2HkQnulAI
	AvH/ZCnqqOJ66TxgEYDtOn/7zNBGzdqOAj+/J1tFlArZNolW/MHzxHjAjJAgBFAgeJoZ7x
	FcLisN3pfd87MvYNqVbFgUDjiUg7eQZP5ToUDx6bnJ+y81oeDRO7RTFaDiokFA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LS7b4nt2CaxovI2sYJxZS8EFjpXGqCXQdb+UI5J1fMk=;
	b=RHwUIsI7iUHWok3pnmIKOMqlFhaQeSmNgPk5ZsN/i/HoToWuittMKSRyj4CaF8au5KvZAc
	vvwsU0c1Hr2GypemVO/rWaNCYh3rsswJv01sdnwbIdaKA7ZQRkF0IxEYp9/KzA9muHD44X
	hNLMyvzimI+SZVIY6zJ7c6qtKuQfFez37UAPsR5L0MJhLG5pFsn2TpiD/hlEdlS33o9Mmr
	XAedVizEBZ3RFzY730pzagfX7B/KKM6xG2kLlek4qQMHqxpmL9q6TF2fHZkaktJMPV5Hfp
	XntiX5i5Jp7feb4FpnlP0QUJtc2RqLcLn5Hm2Eue5/yxIm6wgM8Z4OHtcDS+dg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:39 +0200
Message-ID: <20260415233300.457892-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d868da50f061637a0a1
X-MBO-RS-META: fxs6xzmm1khhhrrnqynihxqqugr494a1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_163323_551963_1E95AECA 
X-CRM114-Status: UNSURE (   9.79  )
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

Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 drivers/clk/renesas/clk-r8a7740.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 635d59ead499e..31a79674583e8 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
 	{ "zg", CPG_FRQCRA, 16 },
 	{ "b", CPG_FRQCRA,  8 },
 	{ "m1", CPG_FRQCRA,  4 },
+	{ "ztr", CPG_FRQCRB,  20 },
+	{ "zt", CPG_FRQCRB,  16 },
 	{ "hp", CPG_FRQCRB,  4 },
 	{ "hpp", CPG_FRQCRC, 20 },
 	{ "usbp", CPG_FRQCRC, 16 },
-- 
2.53.0


