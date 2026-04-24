Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7750CFC037D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lcE9kqPfkdqVVB5mfLKu6tIQwxcc6C3I6j5CsqkMFMQ=; b=RgmmhElHeKbPse
	mliwfwx4KwOrASulQbdoeZLM9r6GF4xeKu79LwaAq8HtPjWFhc+r9yOg80XrQaBioKtQIYJ84oUBc
	R+Mp0rx0rqb+FrlFvnTwn5fki7lJugJ8U/KkYUMZICfxIMUwy6yddwQp2hOxI75+wLM0nAlOPzixF
	adtl9c2Rs6L+eQhu1SYe3FkFJ8cIj/kZRLxPVo3bg+vcF1P67ZOsxYllvrtW2o09GS+HOo8wMjft0
	i9MMO8htFfMyruQPlpnvApMZN8Xffd/j5K69WnFFKgwQumUf0Ms3L+HdJK7af0aI70CaaBCV6hSZh
	gydSlqnxukvhFWZ2J+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFmS-0000000DBu8-1WHC;
	Fri, 24 Apr 2026 12:37:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFmM-0000000DBrl-1Z9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 12:37:08 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 414508F;
	Fri, 24 Apr 2026 14:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777034122;
	bh=Vuvcc1h+aGEm+G5RRhrxQOhhVZZeISRZiJxo5Gd7yfU=;
	h=From:Subject:Date:To:Cc:From;
	b=f+WEPqPSUh9OpRaqyRcyptrshOlIO30j0MPp8BtjYEKVQN4bR3/DckpKIAKxSLQRF
	 t3mumK3Vp1kY6/WPiD6wbY1MF/QXDOpU6ANhFIE6N0sWwGRYB6yylY9KTWs5ouWY3b
	 HXE+43jsM//2gt/qyZ9k1nLcLB5vw4olPJooztCc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/2] Minor changes for i2c-imx driver
Date: Fri, 24 Apr 2026 13:36:45 +0100
Message-Id: <20260424-i2c-imx-fixes-v2-0-34fb9504aaeb@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1j62kC/3WMzQ7CIBCEX6XZs2v4qYR48j1MDwhbu4eCAUNqG
 t5d7N3jNzPf7FAoMxW4Djtkqlw4xQ7qNIBfXHwScugMSigjtJTIyiOvG868UUFNSkszOuvsDN1
 5ZTqKrtynzguXd8qf477KX/rvqUoUSEZdhB6D7aMbB3IlxUdyOZx9WmFqrX0BkG1E0LEAAAA=
X-Change-ID: 20260311-i2c-imx-fixes-3e23164a8a8f
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Gao Pan <b54642@freescale.com>, Fugang Duan <B38611@freescale.com>, 
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Vuvcc1h+aGEm+G5RRhrxQOhhVZZeISRZiJxo5Gd7yfU=;
 b=kA0DAAoByElXemxFdTIByyZiAGnrY+2hfg01AQYplJ1UP2hWS1LfeEjJlGqWlvQDABs0G3KIk
 4kCMwQAAQoAHRYhBCrK7DIOdl1v6bGab8hJV3psRXUyBQJp62PtAAoJEMhJV3psRXUy4ZcP/ifU
 M8bPXDhdSbN69rQrxBfKPQcp2eNCk69VX15sfOjKATToTah5tW9sCRo5KmDJsVmgMTpO9BqDBq1
 ZCBNQYn3/rBa5blQmCOGS//XQpwP110XXvEXms9Hqu7QKAJtU2sXBEKHDI28ezwKj2o3I6iXyok
 TXsnJho1ICHrXEgP2WLGvZ4P+hH6EkVtxIGZFFRU7i4H+lL61U1nervGWtzLNqerzHV+5t6cGkA
 ayAh93cPxeT89jfm8pY7VUiGCn5R9eA73etZBQEFkc53SUl23U9b5kPnTdTEMl8IO5d4sZyA53S
 W2QZwDjPFi19mxWZw/ZGzWgxoW9gWEE/ZsMZOZGPH63U+yVvhIrcLzbWIvb6J4V5aNrhmohJToN
 jXg6fa9/2R0vYRvlF3EEDJZO0djJ1OykQ9oOK+9CSXB8DIorW/4hItQVA4oKi+uNy1Fc1gbkkyK
 YTlThc8k9C1AzrbXCBSlmjMA7VWGi7QAtVLcLki7sRWaGfW97fymoEGKG8e76cCxiyWneh1jUvX
 GCz+eXSBKVTCQrs8b3ehJ65wvRypUpfDrh2yHhMTDTlzLwDai4CKbzaS4kTsj8bVf3A1/1wwm/0
 N1z4fZeIWUFNFt+lTgLcJBSjoASHUN7JKbTamnkExQeXXtgDrPwMR8Z7DBBjynGcMB36KemG7gj
 Yjg2C
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_053706_853377_356861F3 
X-CRM114-Status: GOOD (  12.25  )
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

Hello all

These small changes helped resolve issues we experienced using the
i2c-imx driver on a multi-master bus. The device was losing
arbitration which triggered the driver to attempt to recover the bus
rather than retry the transfer. The set stops the bus recovery
attempts on lost arbitration and instructs the driver to retry
transfers 3 times, which seems sufficient for our setup.

I had intended to make a larger change that added a new devicetree
property for i2c-controller.yaml that held the number of retries an
adapter should use, and then parse that to set adap->retries. I found
a relatively old discussion on the list though in which a similar
idea was discussed and rejected so I dropped that, but I thought I'd
mention it in case things had changed.

Thanks
Dan

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:
- Updated the commit message in v1, and added a Fixes tag.
- Link to v1: https://lore.kernel.org/r/20260311-i2c-imx-fixes-v1-0-e625034d8202@ideasonboard.com

---
Daniel Scally (2):
      i2c: imx: Don't recover bus when arbitration lost
      i2c: imx: Retry failed transfers 3 times

 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 4a181746639404023abfcb28eb6f6c66974be5a7
change-id: 20260311-i2c-imx-fixes-3e23164a8a8f

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


