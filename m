Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F01D185F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XUJexu7ZfdgknEjdkB26qBPILaK9KyTZOVEfAJapS4=; b=NkH6/14Lw3XGQLk8Des0C4jvKJ
	geQ5Hg3eyxzngNZbdTt/9Wozh3N9KNi2OZOdZU6dOznqWqWD07FoGZJ8DSVd5pYGHOYfo/fa4Sn7p
	WXtHgsVmO+LK5bhTzVPlp5KB20Trp56B/h6HylHo1o37tWGxJL3Zy14VkbNvcqRnDs9oMMLq5UU7t
	r8aZvonU/H9iUFx3K4I4408qFSd0sarCsYhUKgUnHDibcnH0vmKjzMMrzJ6z+heEGp7HJKeNuS714
	skCTRpz4wveqtrR9E/bAND2RYk4XRamTx+p4FensJUqjzzHkI+L7UdNz8XiaNDUrAo9na+awe2l9q
	IpiHIBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpue-0000000H8Gy-2wWt;
	Thu, 08 Jan 2026 13:18:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpud-0000000H8Fx-41qR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BAB760148;
	Thu,  8 Jan 2026 13:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE829C19424;
	Thu,  8 Jan 2026 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767878330;
	bh=/YUbOZyHu9lNHH6tzNkLGVe+2dLu2CFhEPiXi7I2fUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RKlmo2ODLjgXoCcE6FybeXC/koDaEP9EHirJU0nY3h/7EElyn4C/Lm+qJTLTBm2b/
	 MUZLfYOntzknA5e3xQIruZNQinupFeSoHeJqfPZx2tJMu5x5JmA/1ZbOqettgO6Gk7
	 uA9Ooy5yY8XB3JHt1NSJaa/YHA3dia+3+x+jPOVshYoVH+xXcLrsLXUDaaCRdY5NhY
	 VuObWrOr0ArQYfQGvPF3g3ia202v4YFS3+n4yDeostQkX+08nik3hfcxxK/kAfm3Dk
	 pvpCWTlTZg3z6HsdlTpB2vYetA09vgytWfBbfNy+jj1tvk/IZ49d0GqFw9sgZCCu/B
	 C/IRBDVmUnbkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA55D185F3;
	Thu,  8 Jan 2026 13:18:50 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Fri, 09 Jan 2026 00:18:49 +1100
Subject: [PATCH v2 2/2] mfd: macsmc: Wire up Apple SMC power driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-b4-macsmc-power-v2-2-93818f1e7d62@gmail.com>
References: <20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com>
In-Reply-To: <20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767878329; l=801;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=uag1kKlvUx4ATUulWYAHXmnzGW1u1x2TnZFa9uDBZWc=;
 b=Ch7BexD/JjZdjCCxIiuzHuZ3sJiu2c6EBZQdJyMMp5WRt3j06YLMQdTcs6bP6XAPhaouFYVb4
 cM0SaigWaziBm/ZJC2LIb3S646Q06qiL9FBAFufCvQesuXtCjzdp3j+
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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

From: Michael Reeves <michael.reeves077@gmail.com>

Add the cell for the macsmc-power driver so it is probed by the
MFD core.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5..061b43fc842d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-power"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 };

-- 
2.51.2



