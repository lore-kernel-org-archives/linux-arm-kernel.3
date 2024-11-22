Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9C3D75E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rS0h64lEvJkOELi9LIcTxMezSjA08oWQTk1+bZmTreU=; b=K0X6cMolj5IZ5R
	zxp8Mufcba+ABrMyD6jevYKKNsE2rcaxArplNFIGnf40/nEvc+l7bkiXlvrxSmw60XLkvyrxysWHN
	SIhp5X+GaTrAYqKNFMKYPMkBJ3BvkqDQjZYlOPiypJ5tppkCQI50Jwp1ncIl1xA1f5kmpLOAwRhf0
	Z9lAs9u5mhLQexBULhqVfWAyvq/3WDZu4JAb+SZiG6IEXfudnrvy7ICQBKGf9Xl1mExmGevjNTtus
	oxlQvMnnETqmtQ1yRtTfqUGhzl2UysDV4UMvQSLKCUb0X3vWDZNUVex6bPzQP3i/fg8RfgoRcR+gH
	4GpzGTu4ATeIZyKzOtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUR6-00000002bDq-0rfu;
	Fri, 22 Nov 2024 14:15:04 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUPT-00000002awX-0bmN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 14:13:24 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 92386A03A7;
	Fri, 22 Nov 2024 15:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=rS0h64lEvJkOELi9LIcTxMezSjA08oWQTk1+bZmTreU=; b=
	sWtnn2baWensTrkkaHkuUpwJM2czdi1p2y9W4swtcx1CRcy3N/dv9XFnsZrKDsiB
	PNpkUC1RR7hhJlrMV+KhD1QpZCaMKyyCWnqhhexQsSJU9lBc0iAgF7M+k/LZ0UBO
	hiFOIQ3/fFsovTZVR8xNw2g1Yacdrj0nUBirDodQZhoFyZIPjDgk7w87KaZ+Ad6K
	DX3NkAoLQ4kyjHD/P3IEbIHeYBcGi9HMswz9kKFIlvI23rnRqCmzM3VQAPP9aAtm
	0QRBeZK64+1VA7WAkAQcVBZUeKsq2GgiYrYgxyLRMqQOjwc/9s9MuBGbv2v2kFuC
	RMjrqgW8t6kBh65NXSETzEmRjw0RdW4Ie9inGhdjoNhMkdKTd91mhNXCp78df8sL
	lxBsw1Ym+SNw5n9Aq+ZYSuLqN3bLCGbsJ3CujGAGToMIX19ruHLuk+MDtaLHk1m4
	JzU7CJRuPiN36TnLjkBjnMI6/q5fMF8aYevNwd4PxHKMksKAgzZye37+yPlsoe34
	ci30W4z4yMjP3R31RNgX6H9RC3gxsqz8oXFB1BItc7vlXjngNDyPL0DX/dxRpADZ
	3kNUr7TrpEgMfvRHYgRtlLJgYFuPmTQUm/B3LXbWrUFKfBF+rE+LbYd/tuIvKUav
	XEljaGDkoqiSCjKPLr/BNrHY6XYlg870uo9XUOLMjYU=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] spi: atmel-quadspi: Fix register name in verbose logging function
Date: Fri, 22 Nov 2024 15:13:02 +0100
Message-ID: <20241122141302.2599636-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732284790;VERSION=7980;MC=2726538235;ID=74493;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485560736B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_061323_638901_0522DA35 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

`atmel_qspi_reg_name()` is used for pretty-printing register offsets
for verbose logging of register accesses. However, due to a typo
(likely a copy-paste error), QSPI_RD's offset prnts as "MR", the
name of the previous register. Fix this typo.

Fixes: c528ecfbef04 ("spi: atmel-quadspi: Add verbose debug facilities to monitor register accesses")
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 91108ddfaef2..316bce577081 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -183,7 +183,7 @@ static const char *atmel_qspi_reg_name(u32 offset, char *tmp, size_t sz)
 	case QSPI_MR:
 		return "MR";
 	case QSPI_RD:
-		return "MR";
+		return "RD";
 	case QSPI_TD:
 		return "TD";
 	case QSPI_SR:
-- 
2.34.1



