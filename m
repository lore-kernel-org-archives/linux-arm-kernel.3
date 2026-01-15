Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794C7D3CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sb0ZGu9+oSOI1mEsTRRw44zBYNIbpYysOjwipDJVRyk=; b=46ZRJwxPuQ+W6hzZGljcP8cgCI
	5xPOrKO582nSW9wrf9EnvSx3X9RWV1/VgewUZ5mysdFwfZ2DqYZ6MjmVM5nH6+ZTedY298pqbhByW
	3aYIfJNnR2cPv2/z/yrT9YC+fWK78/0x9pUXIcV/MMvO0J86aK6KoXR6YwYTtyzVfcpRcs5hlGZe/
	pDL4zdew9fkbnvRh65dVBd04SE1jILzQC7E7ml4n3fo8eD0HyRBHqYsuHlK0NnPZvpXzXNyD5wuT9
	bXVtxqzhnJNDxXsfc2Y+XIqtTV9UfbBZ+3ccSSVt8WhYNd/mblWuErEspeEe1+r2mRtszD7Ro7jVS
	FOCyn76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHT5-0000000BuHs-0Plg;
	Thu, 15 Jan 2026 07:08:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHT0-0000000BuGJ-12sg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 07:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C12A4455A;
	Thu, 15 Jan 2026 07:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE265C19424;
	Thu, 15 Jan 2026 07:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768460904;
	bh=cP4GmaEtVpxPmeyytNYbYkgAMv3oQd/5ywe08WS5YKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vwufild17USCNmpj1sGc7MrkwuGz5Jn7wcPOe5w8tpta6qJv4+hIDNCYYJHHHu61f
	 ANnGTcP8WEFKRlQz/Pvz50GQ/ipAdVjKLaVdU3ZXiLCwwzgzrZvN/0OhHXGyPpI5mZ
	 Xa6vK5YH2WjK7voOGdlSU/m3ouimPru8WSchkTzAhF7CKtHFee2NlqTwEZKY1uI7oM
	 HB5RgOMcMHvA5EvgBcofpOaHN6Z2m/hlU1btlGLrlgyGb5Eqd2r5QA1tbNvWr1FvH7
	 2rk16kkZno2byx/Su1E/4IysT2ZTZNZLo/lWv1ppuAQDvDPJKU+xjXkZu4Z1LxrDTL
	 xFoii/UPDxvFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9B3D3CCB7;
	Thu, 15 Jan 2026 07:08:24 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Thu, 15 Jan 2026 18:08:16 +1100
Subject: [PATCH v3 2/2] mfd: macsmc: Wire up Apple SMC power driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-b4-macsmc-power-v3-2-c236e09874be@gmail.com>
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
In-Reply-To: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768460903; l=869;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=pPwBsBWIsTSasQaGOKu1mKoA6/kk951MwDXnYg4cljc=;
 b=T0S9aQuOIdFj4nfC6B+Vg43orEdfW0DIHViAU1+v5ZiMTHNvE3hvNDbTomYG6ra0z+W61p8yM
 InFmkvwd5cMD79KgFLvLihDvNhGirHB3cIkMVn24asgWqhYXygum2pd
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_230826_318084_97492CA2 
X-CRM114-Status: UNSURE (   9.12  )
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



