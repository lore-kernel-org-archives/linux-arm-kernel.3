Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390AED7830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z+yfUceuYtGGc+bc3MXkVLs6f2MiAyVVBYuNEZyuFuE=; b=mgb0NZNBEfwUx2
	U21Sodov57sy6lii+WuEMWFXxKuApc2z6d0ih2Dgf2RbOw8wGWcK3vtKnRbsemnI7Rc2P/4CeRC18
	+DY2uu+B9QaPByVw54zFyRNbr/NDzfxfMa0bvcqEo532tC8OofE02FO0BQcPemvDU2Z6iyYMATSU3
	U0RucIqDT1pHgk5HhZ+IMgUTY1U0lEvDHI0VAiaebHIKh6w68uJE+CUBPDI7IjZE2lEE6/ug/Nw+0
	YPl520M2w+0zYikZK1Dh75ZtiZ06wcyBq/MwYeipvFQFtKg9P+BoxIjdBm6NZBb09rUPg+z+ThkeM
	JVavC3qPPHws+Q66mPVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4hw-00000005v9n-1UKG;
	Mon, 02 Dec 2024 11:35:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Vo-00000005sH4-0tZ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:22:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Ve-0000UG-EC; Mon, 02 Dec 2024 12:22:34 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vc-001Hsy-3A;
	Mon, 02 Dec 2024 12:22:33 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-003R1L-28;
	Mon, 02 Dec 2024 12:22:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/4] nvmem: imx-ocotp-ele: fix reading from ELE OCOTP
Date: Mon, 02 Dec 2024 12:22:28 +0100
Message-Id: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSYTWcC/32NQQ6CMBREr2L+2m/6KxHiynsYFlgG+Im2pEWCI
 dzdygFcvpm8mZUSoiLR9bBSxKxJg89gjwdyQ+N7sLaZyRpbiLFn1tfCeIKDC9PInS5I3JUPKxc
 pBQLK5hixF1m815kHTVOIn/1kll/6f28WNlw0rTPGwVZVdxvh+/cUg9fl1ILqbdu+R3+sJrsAA
 AA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peng Fan <peng.fan@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 stable <stable@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733138553; l=1708;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=yYY6UVZGGPjEaxvwgj6lfAOYs8yXP5MAIF40HOIAKuM=;
 b=IyiH7dNwx3TDJaMvyHgiKlUx4MOxAGSizpDngcE1QG9+Y7eDNVWmGSzsJy4o627rYktQUOpos
 aptGTe3jxdoBtjiJqyE9wwyq7tAcvxBx+40ttjKsT7ATUXSxtfEx14J
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_032244_253450_FB5835F0 
X-CRM114-Status: GOOD (  11.91  )
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

Commits b2ab0edaf484 ("arm64: dts: imx93: add nvmem property for fec1")
and 0d4fbaffbdca ("arm64: dts: imx93: add nvmem property for eqos")
introduced NVMEM cell bindings for reading MAC addresses from the ELE
OCOTP. This doesn't work as expected due to bugs in the driver:

- imx_ocotp_reg_read() interprets the incoming offset as 32bit word
  offset, but it really is in bytes which means the driver reads bogus
  values whenever the offset is non zero
- imx_ocotp_reg_read() reads wrong results when the offset is not 32bit
  word aligned
- MAC addresses are stored in reverse byte order in the ELE OCOTP, we
  have to swap the order before passing them to the upper layer

This likely went through unnoticed because the bootloader normally adds
the MAC addresses to the ethernet nodes and in this case they are
preferred over the NVMEM addresses.

This series fixes these issues.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v2:
- Add Fixes: and Cc: stable tag as requested by Fabio
- Link to v1: https://lore.kernel.org/r/20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de

---
Sascha Hauer (4):
      nvmem: imx-ocotp-ele: simplify read beyond device check
      nvmem: imx-ocotp-ele: fix reading from non zero offset
      nvmem: imx-ocotp-ele: fix MAC address byte order
      nvmem: imx-ocotp-ele: set word length to 1

 drivers/nvmem/imx-ocotp-ele.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241023-imx-ele-ocotp-fixes-f7b216171e1e

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


