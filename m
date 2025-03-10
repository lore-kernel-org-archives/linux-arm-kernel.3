Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FA0C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=onKZ358iPe3ysbYLBfjepet0iilG2tjfvE5V6cV3SMA=; b=35K7QAuHalWUGw
	QpysQFQUqqZWZT3jO7HgVsfFR2Jg8+8ZUiJz8YzWHQlfwdcPXuRo2mkRao6OQMBXRUExLXDthdaLo
	0xNq31EBNTnWQAG2tqrgIO1rTqHXe8vv1kvCLoxWy5Hp6rd6SQ4+Asz10K8eKvnOBlds1cDVbXP0n
	gJ8CIBDWevGt/XRidXHe2fMxC9xZu3tdXN3Ygj9WTuqM0/iyoQFTEGQvTJ/oz4SJ5yHyX2oSzg7CH
	L/H891zAjVeYDq8YbFsVGaiSEAV7fgSmQLEYbfkisN2D+6VUkd+s+OkRuIS6GvUSrHESyj9ahf5Nm
	6285/r+0C0TT3hSMZggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfTv-00000003I5l-1erS;
	Mon, 10 Mar 2025 15:55:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfD5-00000003CVL-1WUK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:38:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741621106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=onKZ358iPe3ysbYLBfjepet0iilG2tjfvE5V6cV3SMA=;
	b=J9yDaS7cOedY3dvMZxxw9U+nvuLx6vzA6UZcfdSiYtLqYuYkqXQvg1KOn1WT7cDIsqrR5J
	TClfFX7H1kmxDqZ5cbAAwxvDxhgrpbAd5/JhU5eG8H1LvCkReQU+AnllGWQ/xFLFvycqPL
	qL87gMnsPmLgW7/ms6avfTgC1T0dc1uS6WUwyBL4FU/S8pSbYLFDpf9x4cHHbzrwg98O3f
	Sy2mPHgcFw03X1zXpiMq84jOXuC831iRxekwKQK/rXD+G/geTdold4XkwjXX/obtIFB2pp
	2g5GIfVWGpTvd23WQqam4dj1ULjcKvQw8cYK+yylSvaeaSmBm/8w2afb4LCnPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741621106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=onKZ358iPe3ysbYLBfjepet0iilG2tjfvE5V6cV3SMA=;
	b=+3aFRTCNY/Sy0ctAsngH1dSFQqizVCDY+PjB6AjJVetoV+vINiaBDbWhi7R94zs+X+4MTa
	MkLcBnV/CTvbqxAw==
Subject: [PATCH v2 0/2] usb: Don't use %pK through printk
Date: Mon, 10 Mar 2025 16:38:22 +0100
Message-Id: <20250310-restricted-pointers-usb-v2-0-a7598e2d47d1@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG4Hz2cC/4WNQQ6CMBBFr0K6dgytVgor72FYAB1lEtOSmUIwh
 LtbuYDL95L//qYEmVBUU2yKcSGhGDKYU6GGsQsvBPKZlSmNLY2ugFES05DQwxQpJGSBWXpwQ6V
 13+Gtrq8qryfGJ61H+dFmHklS5M9xtOif/d9cNJRQOd9Zq61zF3N/U5gTx0Dr2aNq933/At4Ft
 zDCAAAA
X-Change-ID: 20250217-restricted-pointers-usb-8c711bae6994
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741621105; l=1065;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kwv6YXzRLSKnph4Bl6KQltrd4tKRcYjiSMLedmuP9Ag=;
 b=GwvblWNPSZ+SxzDwVWvmpIZtyOCKLyP5mBcCcmR1GoW75IDYGZAo031r+hH7oj2r53yQ/aCpD
 UrC+v5DR9g8Aj1PR/vJCAMbQqUEN+e4ejnI/o95UWI00TchQxistgos
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_083831_569590_4195AB28 
X-CRM114-Status: UNSURE (   8.23  )
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

Restricted pointers ("%pK") are not meant to be used through printk().
It can unintentionally expose security sensitive, raw pointer values.

Use regular pointer formatting instead.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Refer to original %p->%pK changes in commit messages
- Link to v1: https://lore.kernel.org/r/20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de

---
Thomas Weißschuh (2):
      usb: core: Don't use %pK through printk
      usb: dwc3: Don't use %pK through printk

 drivers/usb/core/hcd.c     | 4 ++--
 drivers/usb/core/urb.c     | 2 +-
 drivers/usb/dwc3/dwc3-st.c | 2 +-
 drivers/usb/dwc3/gadget.c  | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250217-restricted-pointers-usb-8c711bae6994

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


