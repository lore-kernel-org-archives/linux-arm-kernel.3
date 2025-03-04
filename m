Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C77AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DonSCwrfl91cmZ8V/r9qwCe7RUFgipzpqhb+J45mutU=; b=BfjG5cAvg33yiLFCGQXv4Sa1/2
	JeFECB1x/y9wGtj3/gG1/IVMv/xS9JxThLQ0eckLbYV4YR+RT58W2+H3uebYXTlkraPTdEgQ3vHcq
	dB2kgAxMjcR18fRcjSyhjgJODMBL8yMMV7AjINxFUrikL4/kdRlpD+Hsdm2HMra34mQYwddfzUkO/
	keV2kKdqenxV73XciVxsX/rfFguYlzoL+gb9jLLfGWAo7RFp0J4dFG3rALt9f0DKrjN6T6bbPFBoi
	3YQDQooSKILkHDvdZG058gE9YL5k7NeVY5asCYjj75GIYR5ttHT8Aza6IxkcZFwcyJOewRzi/LW2X
	Yx1pHaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVts-00000005aod-1wV5;
	Tue, 04 Mar 2025 17:17:48 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUZE-00000005IeJ-3Lgy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:52:26 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 10956A0391;
	Tue,  4 Mar 2025 16:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=DonSCwrfl91cmZ8V/r9qwCe7RUFgipzpqhb+J45mutU=; b=
	h9cleO3a3l+c3MvbQ+71f5S+ixtZrMLrY8Qx4HJLf0gcYmx1R4DgjqcluKWaD+B5
	0wPiDjOnOPlb8yEAZmazwSYYeBaOFC5tLL3ANZaoi2/G9A0Fbyk08Nt6W9+KJFQg
	1W+y5Xq4+Wohcgu3TdowC7iZ7AciJwxhcIo3KZvCBaw4R77hQkV9ikv+pojobAP3
	XJS2o1o+reEurMfAgPPpPfBYKK74MIaRBFMYt/Sgu9cqfUeHTWeMs9GlxhcJ4OqT
	iaAy961c87gzs/iJHO9Xt0QQBSEfsBGCGjUXLpIxqoC+IcnAu7kTodSQ6bUb0gmR
	vbqJelcz3moQ+KCIfImYME1kqIls4oLJ/kKKSfP8F6h/2Fr3eCHYkLYDKzIcVQFT
	vJP7lIgmN7QiZ8ZW91ye4nKUGbFqH85Fz65j9ifZdccSd6UQfjoiFw1bwE9BfWb2
	qb5e+XWswXi09TdRYa6SkpouZ5ybrd5Fctjkrjp+OHuNsSs3QPgYPPg8X7YXvGRd
	odZHr1xyob8EIXTOlYjxG/P/5vwqYCVIc8i5XJShGUxFSrB+4g8+qcxy+Vcbu9cj
	Csw2BJsYfu5S9RY1tt6ok+zDsoR5gxfhEFVmGdeNg1y/L/Jo0/sv4i4r6iuwJDyl
	d91QNZ32JoobtMvJat7IqyKdUhHjNpZ8snxmMkwvVBc=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, <Dharma.B@microchip.com>
Subject: [PATCH v7 0/2] microchip-tcb-capture: Add Capture, Compare, Overflow etc. events
Date: Tue, 4 Mar 2025 16:51:50 +0100
Message-ID: <20250304155156.374150-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1741103540;VERSION=7985;MC=3473926107;ID=1544446;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_075225_319128_097A5351 
X-CRM114-Status: UNSURE (   7.48  )
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

The TCB has three R/W-able "general purpose" hardware registers:
RA, RB and RC. The hardware is capable of:
* sampling Counter Value Register (CV) to RA/RB on a trigger edge
* sending an interrupt of this change
* sending an interrupt on CV change due to trigger
* triggering an interrupt on CV compare to RC
* stop counting after sampling to RB

To enable using these features in user-space, an interrupt handler
was added, generating the necessary counter events. On top, RA/RB
registers are added as Count Extensions. To aid interoperation, a
uapi header was also added, containing the various numeral IDs of
the Extensions, Event channels etc.

Bence Csókás (2):
  counter: microchip-tcb-capture: Add IRQ handling
  counter: microchip-tcb-capture: Add capture extensions for registers
    RA/RB

 MAINTAINERS                                   |   1 +
 drivers/counter/microchip-tcb-capture.c       | 133 ++++++++++++++++++
 .../linux/counter/microchip-tcb-capture.h     |  40 ++++++
 3 files changed, 174 insertions(+)
 create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h

-- 
2.48.1



