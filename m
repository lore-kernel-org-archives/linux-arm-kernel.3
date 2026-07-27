Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DE7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+BqVmp9tMlOnrF/CUNQXTwV5ciCXV0wEAYVrd3+4k0=; b=gGf18fR0Ta4wta
	f2NrejNgh8QNEA07ijl/mC1HbGWRUuF5wziwwNp9Gmk9dgbLII36BT/2v9MSwaKz1ADcO5qCGPci9
	VX/ABeuFmYKrN5V55swiRA1fIf1GkxcpBTMA2EoPqq9R+sivSd7BkGNT4EvweBH9glcyGZkn0Y7jv
	sRrpHI0pV0ocbW+fwdeEZ8loC0Z0AAj49mf0P9njGlad3U4oTTk4CWX8wfbwzhAMBKnPG9Lsacv2L
	4IUpW1tEnFTijHCnfwpqH7O56vQQl5t4SIAnSzeFIfRfKOmIMntnYA+vIsaaFZBDsArewiQUxiJkU
	9og4dLqxSDh406DEGDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNiF-00000003Eov-1I1I;
	Mon, 27 Jul 2026 15:57:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNiD-00000003Eoa-2z53;
	Mon, 27 Jul 2026 15:57:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD92160008;
	Mon, 27 Jul 2026 15:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047F11F000E9;
	Mon, 27 Jul 2026 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785167872;
	bh=x+BqVmp9tMlOnrF/CUNQXTwV5ciCXV0wEAYVrd3+4k0=;
	h=From:Subject:Date:To:Cc;
	b=OUGJMPg8DQdCyO1SMMueUYZD+gIitl6T6VqZ0D8JpbHjXWrJQTS/p9zihrF9Y2w+l
	 7gZSfVM/46OqYriOAJlL2pEIdczIuhrOj/Eo2hoQi7o5u23B7L5gjUVsxFxM74UKJt
	 jrjE1maqzHjf/R5D2DZMTs2MRzhzAQpfLKe2ztu4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] Bluetooth: fix short read errors in usb_control_msg()
Date: Mon, 27 Jul 2026 17:57:31 +0200
Message-Id: <20260727-bt-ctrl-v1-0-2e8650e9df01@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubaakZVXkYvtODgS2kZqeXfD5
 a/+3xfBk2Py0GQRHJ3seVsTijwDnMw6kuA+GZRUtdRKCxsEBrcIU2qDpkSqqIBU744Gvr6ntvv
 tDzsThncO9/0AGbpygWsAAAA=
X-Change-ID: 20260727-bt-ctrl-a37aca3ce4e1
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.16-dev-401aa
X-Developer-Signature: v=1; a=openpgp-sha256; l=887;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=r1pyYjYWM9je0zlQZ2arXiNcMXCvBlkttmhvuwKqH1A=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFnp9V8uJJfFPnSpe+TGoqPdssNpyc+v7HZ2Bnxdlh9Dh
 LhbDvd3xLIwCDIxyIopsnzZxnN0f8UhRS9D29Mwc1iZQIYwcHEKwESmGTPMr194sIr1jtM7u5yY
 E5Pnqn3e8vtWFMN8V72cQLXdWT/d1j2Z2/dszcrZM8p+AAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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

There are two drivers in the bluetooth stack that suffer from possible
"short reads" when sending USB control messages.  Fix that error up in
them which allows the error handling to become even simpler.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Greg Kroah-Hartman (3):
      Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()
      Bluetooth: btmtk: Fix short read errors in btmtk_usb_reg_read()
      Bluetooth: btusb: Fix short read errors in btusb_qca_send_vendor_req()

 drivers/bluetooth/btmtk.c | 86 ++++++++++++++++++++---------------------------
 drivers/bluetooth/btusb.c | 30 +++++------------
 2 files changed, 46 insertions(+), 70 deletions(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260727-bt-ctrl-a37aca3ce4e1

Best regards,
--  
Greg Kroah-Hartman <gregkh@linuxfoundation.org>


