Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CA2109446E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ooCyWJDJGQ2ju349DViWIFG+H1R2tWk787dbjOmduyI=; b=be7qEib7mv3t0WtKOCfAW+nf5B
	sFBse30gWWKiL+V2s7lZrNg4ElFHFA1JL1ZWHutQIKKCGHZn8nj1Zeah+9SYxRWQnmh7+rpzeW08g
	mIsg2vCbid/+5apKZ1g2ffdn7SMcRFqJtgf8UXnlDivclAGpZRXpEyT+quDeIc6WB03fmR17D6k5N
	ksNKp/4FtnTkopM9odtdu199CxPPcLbZkQNBWh0leBjvAZ/1q8sHWdLF/TJ2gWvNaR5B6NnsRrZv1
	jij5GwvrIw/RsPImUD886rAPIlfV9KXt2BFkfVhznVbreqyr+qwBlWfArnwz4Agx1SxbXJPfuC06B
	2wkQbaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u4N-0000000ENeI-07lP;
	Sat, 21 Mar 2026 11:00:39 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3u4E-0000000ENdA-0n7o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 11:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090790;
	bh=ooCyWJDJGQ2ju349DViWIFG+H1R2tWk787dbjOmduyI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=H8OnLUc4WFMJqsHI/8jQUwoKenZ87fq1NLoOONuNVo/dyWledWzrlnqDK4n04GtJl
	 3Z8FD12kruJMSSQ5pdXqSIm7/TyE+gx1bEHpC0ohlSb19mZWg7p0GjLgTeiorJCSIk
	 ONeybWRj11fokt6WJEfzaiDC082nMnVbT35H1oFs=
X-QQ-mid: zesmtpgz9t1774090783te0150bfd
X-QQ-Originating-IP: ESyRAv8fja4MvPrq83ciTVZul0L43JGDktef8Dmc0Co=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 18:59:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8580062653679907244
EX-QQ-RecipientCnt: 10
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: linusw@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] spi: pl022: update outdated references to pump_transfers()
Date: Sat, 21 Mar 2026 18:59:40 +0800
Message-Id: <20260321105940.8143-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: OC0Q7tWN8iCRFbFV2cDRJs1+P1lRxYY/PXVQ5lPyNIctrcaaedLHSVkG
	dOJAnjIb/ZYHLHSdZs1Y2JRH6mFDrFEn+hkOqcCk2SF4jmnJ7QIlISkDdz/PEMFyhXyxvvP
	FnzuJOmHSoO2+yT/ttDW+jFxyoAhdq2T5gUZrsbIS5oOdx3YmvIRqyz8g+VRa7fWYMQsS+x
	DcNmXnzjfNPHqh/HxaRZaxL18xOSr/9Kwdbimvd7yQD8m5L+XL6uFKmEzMmZR8KXZNQINKb
	vrbOH+DBy/+T2K+NK7GeaqMkvKMAeRy60QEFNIWOMluW+eXoVi3y0VT4CFLVrdtckelzB+t
	p7WhR9IVwLTBGAkqHpxyCSe8ZiJwU1y9+C/7f1ym5qtcM5GjFJQE47uj9lh+mQuAICxwH/o
	DaL6crGWJg0hi2wVrv2RhC57I0jZhHm/gxZktlgWxt7xQChHxxAhq8NCRuwtOSTH9U68gRU
	GA3e5/tF6jKjWhGcRERSPJ16wESeG/vg9advMdxQsmRYvpYmKMXHPZuXD1wnISNW68hKFb9
	d4Xpn5bfZ0SkpqIPYWDw/UVINv7l2x/d7k5u42VThPiDBnMr/EzclI58e9WS7adzODNHihL
	G7tSyLz2++1fOdCO54w/CmOMj5CuC8XhbzKig5jWLf39IZwQZnMazeOqdMFuQ7LkkCvZNUF
	LCQCzta1U9yYJ5ImgnOW5x/xwU8A1n+Dm7HfK8KSG0splTeDHw2ueO7BwUZt2t/hdJmk6FW
	vh6RjpjjCjbKg/D9XEf7d58XzlFQZeVuHogAg9TVbYJaO1g9B3ibokiq2fa/G6E3Wxhfz2P
	plxkn5VopLsVJzcp4Md0DNedH7JieCAnEGubGzJkEwOYPzD/fW16iAA/udtmJQ2S5mZmbUT
	Mt2f+yOYWtv10wtJum+i2N516ve3N1ULCeudmLZSbLsv5JlwV+pDW7HD0T4knkeJBo9pygs
	omNvJR2OCrATJHEu/mssFXOjkPiWCSHEFEJb2i4lBQ9Z7Oe3GoKAeRxR1u6rD8bHyUTn2rm
	+YU+hNjKfoE+sBywO4Lada3MF1lYzk5l8DN/rRHGHEaKm3N9WKFNHpP4unHuY4L1RlQtsL6
	eG0mx4lDefouhrg+1nUjYc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_040030_794498_A17A0775 
X-CRM114-Status: GOOD (  14.18  )
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

The pump_transfers tasklet was removed when the driver
switched to the SPI core message processing loop in commit
9b2ef250b31d ("spi: spl022: switch to use default
spi_transfer_one_message()").  The kdoc of
pl022_interrupt_handler() still describes the old flow: scheduling
the pump_transfers tasklet, calling giveback(), and flagging
STATE_ERROR — none of which exist in the current code.  Rewrite
the kdoc to reflect the current paths, which flag errors via
SPI_TRANS_FAIL_IO and call spi_finalize_current_transfer()
directly.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/spi/spi-pl022.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index c82cc522776d..bd1d28caa51e 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -1127,11 +1127,11 @@ static inline void pl022_dma_remove(struct pl022 *pl022)
  *
  * This function handles interrupts generated for an interrupt based transfer.
  * If a receive overrun (ROR) interrupt is there then we disable SSP, flag the
- * current message's state as STATE_ERROR and schedule the tasklet
- * pump_transfers which will do the postprocessing of the current message by
- * calling giveback(). Otherwise it reads data from RX FIFO till there is no
- * more data, and writes data in TX FIFO till it is not full. If we complete
- * the transfer we move to the next transfer and schedule the tasklet.
+ * current transfer with SPI_TRANS_FAIL_IO and call
+ * spi_finalize_current_transfer() to let the core finish the message.
+ * Otherwise it reads data from RX FIFO till there is no more data, and writes
+ * data in TX FIFO till it is not full. When the transfer is complete we call
+ * spi_finalize_current_transfer() so the core can schedule the next one.
  */
 static irqreturn_t pl022_interrupt_handler(int irq, void *dev_id)
 {
-- 
2.25.1


