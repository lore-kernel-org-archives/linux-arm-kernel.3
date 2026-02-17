Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF8E68165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+h4Fr1swQcoD3DXpbaZsHJfcLLHab4S06jK6pbWJoY=; b=U8Du0HJPavqbxhRzffSlH/a9Wy
	HGMy5AoewMdsVWX9akfsC9mCMHwN6Tnf12uRN3+Wtbe3WFaQcdn2rEouMinOPz86MC8x9vjfL+4xD
	TJ1ji1xI9iSnEEqRaR/jdWinsaPbVQ7Bx57itszlEejMve1/6IEJYf5iLpFSAtYccO3JFl2uIL8Wi
	GexDAw7BjIkMi8F3oYP/jL7UBxAmprDKlufj467mKCXq11Isd7ppxvzR7hKNL1hwrodBVN6jXWMVl
	UzFV8cFR9RWC8jIG27P0M2fsVpVYHwTmZQ3q4LykpPLcbNxYPYtiJKygnrgoF5rWSd5afTotKnLZv
	BjdgZdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIcN-000000083OK-4Bzb;
	Tue, 17 Feb 2026 10:47:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIcL-000000083N3-3Aig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 10:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1BE543F27;
	Tue, 17 Feb 2026 10:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1784C2BC9E;
	Tue, 17 Feb 2026 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771325264;
	bh=4qeRI0/8CXPNVIq8qwuTcyMxP3YlJM0KAF+LDIonx7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=azF1KACwtA56/EPO+o9Fn0yLOtN7cln10uB86vzzldGGf+d8uvrskAPnzZ4K2iKGn
	 SH4BwhIwvt6gI1QVBcbFpOD5VMNjzCTm3Eb1qPgvCgHl2cEow9JD3rZtvEqVdBrfGO
	 tvCVjNNyr7GoacXbxby45CdP7GuD+MV5hv2jQzNY1t8bp/xCmyol7/VnECfBLshHZ3
	 Us3wdaCpMjVDHeZCDvCgvyRVoeeNcjPauEK4+SrJJhFBZGyoEiXhwTuttPRrhBdLBg
	 cIfvCOAWNB8gQKfRFMjHu1iuxcqc45n/wSQGcwD5oJ4TzJ9Nw57F792hPFV9/K/wEj
	 XXsT4N9xjgAJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F93E68169;
	Tue, 17 Feb 2026 10:47:44 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Tue, 17 Feb 2026 21:47:26 +1100
Subject: [PATCH RESEND v7 2/2] mfd: macsmc: Wire up Apple SMC power driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-b4-macsmc-power-v7-2-4a4d63664362@gmail.com>
References: <20260217-b4-macsmc-power-v7-0-4a4d63664362@gmail.com>
In-Reply-To: <20260217-b4-macsmc-power-v7-0-4a4d63664362@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771325263; l=861;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=l66XKVNJtI8aTWFc0QpUQyQBnqT+6mvF4xxxt3DtiJc=;
 b=O5DrsNZjj7AQHtiSyJhrCEipvmsjzpNLsu8tVVjtdN0gZqcGXsIQ+E/FabemxZW9l1pwcKda1
 GlfokenYGuoAxm9VnDWwJ8v42ILtiTV5JN8xOscvmfW5Abt/jLOaVvM
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_024745_822590_D89D14B2 
X-CRM114-Status: UNSURE (   8.75  )
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Add the cell for the macsmc-power driver so it is probed by the
MFD core.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 1b7e7b3e785f..358feec2d088 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_NAME("macsmc-input"),
+	MFD_CELL_NAME("macsmc-power"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.2



