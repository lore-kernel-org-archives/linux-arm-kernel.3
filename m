Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45F0606A928
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kfLYcWM5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzbIT5ys
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SnX1aA2HT7Cbm61i2TXLxZiThPnfvq1ghiLIHpuO9ZI=; b=kfLYcWM5qTmXJOgg6LBUslcEFO
	DJnS7rflKLXnrLQpD5yX+9g8JNuSpWHw+cN1gsyI/K1KzqHdMmOgF67I3xHYz2U2otnypco/s9qQc
	IBxViKTxePDS7Da8fxlNWVdhR1krRRyKhJRzARFbF/ZGqYP9jnyDyTNPla5oNPA5c4ybCMx2oMrp5
	oHXRrDj2w+4DSb9mGKd6gRM6Mw0hxH0TMbJBNwfZg7keQ7j+XXdbf12YUNnuj6u5c8mW0BmIsyv3t
	ZuUftTJjG3x0qJhZxRWvOHyb1HfAj7teKWfk2w4sxFc5vBSWkwVkxZApruosCsHx/lP7Kh6ODPyqX
	Euw9RAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwAJ-0000000HX2P-3SHG;
	Mon, 02 Nov 2026 17:49:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwAI-0000000HX26-1WQk;
	Mon, 02 Nov 2026 17:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0D3741684;
	Mon,  2 Nov 2026 17:49:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793641789;
	b=hMUR1VswI5nhONCsranH5chc0kJdZ9R2CsDHp7W6K6mPBfQBX8wDCeg2K/GP9lHgKAsU
	 w+A/29sHdEK4CK81UDqbhgIUG3KRFtaUotfR/pm+F3rdEnQdpDPk5qMAsMzISuVpsNhdJ
	 CKRlimKofCg8b8zaH65HVre9YbDors7CX8OLooivPr0StdY4WQGZDXzgLq+Aj8utPSTdy
	 uo5KNe46weTaONC5d6p5jvprA0aHuxuRpff2IwezKc7LWQkwpt9TkyEKJMOtffrHDn0li
	 tld/vnRrXLKxE2rqQ0aMJ9fpdXMeaIkzi5qvFrmw+ZQ2q0Ve5Y8TIyr6sFRekAQAJoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793641789;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=SnX1aA2HT7Cbm61i2TXLxZiThPnfvq1ghiLIHpuO9ZI=;
	b=pJTcmTt3vaqUbLtuNKDbhbM0GIFDflU0TRmPoy0k9uMNVaDZZe42nXZlAudbBPozi7cW
	 /FIrDZnY5X6PBNUA1zCK6NqxO6rJR9z7tcwsBzkuQyQJ7SFH7nH53l9rM3lbDsCxmcovN
	 ESEQcFDL+99/iDJJ2Kt9+rb4iB2j2aGzcyJjVYR4cNMALRIiFfiHtwQzEky0WosG2BgRS
	 nsQAO/7hr7uw9pO/694xIIoX5FYelReG4KINp3Q16PMKZp/tBqDi47XNlDhGWKkKvbVmU
	 uVaQKcWEPKAmZyE6S6FGMbNN4ZhZ3OwtIfeSjRPaea63Dmkiw09KObz/tUaiWcL2QAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28A7E1F00A16;
	Mon,  2 Nov 2026 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641789;
	bh=SnX1aA2HT7Cbm61i2TXLxZiThPnfvq1ghiLIHpuO9ZI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UzbIT5ysOqmaEQwiAabE+RhW7d+yCygIKKGG1+eAcV/83aNtla8e/yZOYlp/EgZNq
	 3jHuGsmjluldyUKZAWORUN7Narw/Fk4M20ihXjkDcKW2cygEZYElBxlWcVvTdYVpQH
	 Y1/h6iLnmHx1yA3WIpyVBQkOJAnwiUAt5mUFZEcZ6y6/gVbyFyUr2pI40dJ+lj02Qm
	 TkFydwIa9etko6aWPxGBkCvwpYKkBidRMqexsPkfYO+v/dja+Q6G35QTJZefGFvg2J
	 78QTAniDMkBZvqO07xMxJEDBLFm9tREDruvBxrlGj4QYoxQCzAe/hzuQS7xGGErNuT
	 B8wLo+OL58ABA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ADB24465BF;
	Mon,  2 Nov 2026 17:49:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 02 Nov 2026 17:49:46 +0000
Subject: [PATCH] media: rkisp1: Depend on PM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
X-B4-Tracking: v=1; b=H4sIADnN6GoC/x3MQQqEMAxA0atI1gZMHIV6FXGh06hBrKWBQZDe3
 TLLt/j/AZOkYjBUDyT5qekVCqiu4LvPYRNUXwzccE/UMKZDLRJ6iRK84RUwnsjkvPtw65auh5L
 GJKve/+045fwCB8GFrmYAAAA=
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=jIOYNEwnZtImPbbvWDWM3rNp8UHpADnjrlqR/x0YeIY=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkvzlorGesuDT/htuP9vsfeTXcsb6veX16Rckbs93YWB
 etfZReVOkpZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBEIgoYGbruLmbNPF9mf728
 P7yRt8fjsK7pVedP5ca8/84EL5q76gLD/7qbqwve3p9/vZPr5dtJ2csqc0zvHO+qi8zZlHX2SLy
 hDTMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

rkisp1_runtime_resume() enables the clocks and lets the interrupt
handlers run. Without CONFIG_PM it is never called, so rkisp1_probe()
reads RKISP1_CIF_VI_ID with the clocks disabled and every interrupt
handler returns IRQ_NONE.

ARCH_ROCKCHIP and arm64 ARCH_MXC select PM, and no arm32 i.MX has this
ISP, so only COMPILE_TEST builds lose the driver. rkcif already depends
on PM.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Split out of the rkvdec CONFIG_PM discussion, as Nicolas asked [1].
Without PM, olddefconfig on arm64 COMPILE_TEST now drops the driver;
with PM it builds as before (W=1).

[1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com
---
 drivers/media/platform/rockchip/rkisp1/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
index f53eb1f3f3e7..c825fbacee96 100644
--- a/drivers/media/platform/rockchip/rkisp1/Kconfig
+++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
@@ -4,6 +4,7 @@ config VIDEO_ROCKCHIP_ISP1
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV && OF
 	depends on ARCH_ROCKCHIP || ARCH_MXC || COMPILE_TEST
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG

---
base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
change-id: 20261102-rkisp1-depends-on-pm-219d94239b56

Best regards,
-- 
Igor Velkov <iav@iav.lv>



