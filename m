Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A1DCA101C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JCfZDqOW3xYUnS4qfRX3DC2JgwtDWIhIkGDWmHc2PpA=; b=RwrNNNaQuDTasznCxODeRUw+a5
	D8V0XO00Qn0E1SXHgvu7/NkXVJwKEgz8mr+RrwE+LS/vIca4et8JvmzKD0a2oGbJQEcNeJQZSSrIr
	X906rtHoRWj+TznvVtpn9qhuqM6wprHQqU+Oo8gNuciyx6q3wHBcLcuXtSta1TT31XmJrXU0Q9U5m
	lddzYvjL4XJGKOhBkHUsRBfmDvWyo4kPXKAXa85t6+iepivPwwz4bzCzfVQoMe2Yhl53SGTeVy3aR
	EH64X77v3bCHQFuDABhHRd76AouSC5iB047omqQZvDXKrQuqRDPpZnx6RwzRNE4RmeC6SvzdDdeFi
	T69lf3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6H-0000000G5ET-2dTb;
	Fri, 05 Sep 2025 02:22:53 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIRN-0000000EsGs-1NVj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 22:28:26 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHvJP30QXz9tVN;
	Fri,  5 Sep 2025 00:28:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757024901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JCfZDqOW3xYUnS4qfRX3DC2JgwtDWIhIkGDWmHc2PpA=;
	b=e0ZRpMNRQGLryewqCpS/3+JvA4D/B76+kiY62TbaQSEtIdzxeLh2h+L8AxGfXWGDRLjWmF
	G89G8/IurSpsEWUpnRNDuUDgrGyQeNyutJ/IQcgm8EYqkV9IEstP8W3PzEyeETAmxndt/s
	fjZ20uwJuLRLd8xTagw/wwl9JBo69/yUZbTI+xq7+oaUyqWDk4X40AObNsmJT+cQ5oszO7
	K96EMAUhJtaU0Ihdqp9gmrScU63ksE8a3qP3dS7mN7d9EdgOxonAVJL64PUA0mscddinMd
	sADb6Kv28ucvA1Q+9+9begb2RB2FrES3V/ykve6eaB9wzem2pQef6vONbrgVoA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757024899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JCfZDqOW3xYUnS4qfRX3DC2JgwtDWIhIkGDWmHc2PpA=;
	b=Y0gx2hsFq+4s/uYCQxW/jpI5/1KPUQbGGRMcfJwvzmywREFGxImjit8pGMVyPJPOBc2wYv
	DzUgx0acsiLf48xZWHcy84RGx5DJutoT/YCIa3H4/FqAbh9oHzOI1cS/HKx8xeBMBTA0Fb
	6RNCIc3FdVqzwFtCUQeHG4gFNeRXbEv82+XqGb1G/pLt05aquC9gBY5dhMuK/Q+pJMp6Vy
	dY8pYlZQ547oAhcQD2HGX/U8achT67f8tL9hjx14m2N7CQR5213tRgosKzKrzaCcgyESaQ
	glzYmR/4V9QyQqmVllMnlEZ+8mDiKr/SLD0A7dGeURqy9uOozvHWfJojwEsZuA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment
Date: Fri,  5 Sep 2025 00:27:44 +0200
Message-ID: <20250904222806.193260-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mfes1j688q8wf3wu6ec8ger8k67kyhis
X-MBO-RS-ID: 139fc08f7d3b6ce8f2e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_152825_507635_647AC646 
X-CRM114-Status: UNSURE (   9.83  )
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

Fix SoC type comment in the PFC table file, replace R8A779A0
likely copy-paste error with R8A779G0. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index cae3e65534997..218c5eff9b67f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R8A779A0 processor support - PFC hardware block.
+ * R8A779G0 processor support - PFC hardware block.
  *
  * Copyright (C) 2021 Renesas Electronics Corp.
  *
-- 
2.50.1


