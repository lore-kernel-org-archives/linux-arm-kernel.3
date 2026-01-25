Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEB7E63CA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+h4Fr1swQcoD3DXpbaZsHJfcLLHab4S06jK6pbWJoY=; b=OQMO5cu/dyzDrytDG1v7XZCfJL
	hQmB9GKHlqH0j1+vy/1IYMZBMiHN0v2BjMeowWXM8mwE6uiwRX1lACZlKvc7hiK1nmEjA0eAY7PJ+
	zpzpUI1PNWYwL216SYw0m/T/jDc6ChOUxklkdHgtDf8Ajzm1wX2AlIxU+C3xElcmD3AeJilGaFqe9
	XMyrJyKoc360S/TVWpYynJxYlr9KrPuiPbC0e4rNXMRyXLIY2/4Dlcin4hQMDk0QVOVy0qo893vIu
	sHYtst7yLtVN0vxjJJYqfO0WU9P2rHZ0C8qnV0AYNKHw3iv7u7Tt4JSbnt3a6WX5wnJG3DEZ0rg8e
	oFcTstKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzwa-0000000BBmT-1W4c;
	Sun, 25 Jan 2026 13:14:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzwY-0000000BBm4-1Rd8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 13:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABB5460132;
	Sun, 25 Jan 2026 13:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2163FC19421;
	Sun, 25 Jan 2026 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769346857;
	bh=4qeRI0/8CXPNVIq8qwuTcyMxP3YlJM0KAF+LDIonx7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=phIHFM/TZycq0bBuebQOAvfWZRLjr5O2Q1pvxCAXag/B2zAAAU3EsuQhJgeLo2pl1
	 sBeH1o2qkvrkzIjDQNJuLxtA6POhycud/EsxUwTG8CQgpoG0Ib0xFkuOTh3MDP5eIl
	 rUWMpFNrOG1+Ulz28NpaY6pCYstTtpKf3aM+qJdIc0U2KSKGzLcIycOhh0U0Zc17/V
	 CY+Oo5Wie/nGea5rVQBvrwtbWcsn37JLkgzYvU6dWy2qN8Af1vtrJp+7OJ3KAIqERG
	 Ue77UDLByHy3sLsf/oSzqTriroYHimayzDEKBKkqVndEO9526Ls+JHkxz6uNcKlvrM
	 mUVlwqzqfO5yA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190F8E63CA6;
	Sun, 25 Jan 2026 13:14:17 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Mon, 26 Jan 2026 00:14:12 +1100
Subject: [PATCH v5 2/2] mfd: macsmc: Wire up Apple SMC power driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-b4-macsmc-power-v5-2-302462673b18@gmail.com>
References: <20260126-b4-macsmc-power-v5-0-302462673b18@gmail.com>
In-Reply-To: <20260126-b4-macsmc-power-v5-0-302462673b18@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769346855; l=861;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=l66XKVNJtI8aTWFc0QpUQyQBnqT+6mvF4xxxt3DtiJc=;
 b=mAiJPj7JoEQiRxVrmZOGA5lsT+1h5EHMSlS24t3OZFIp8C/24RLl14QauMr4mwcMN7baB6bLg
 NGQjmQbOZkgANchr7FeZ26sU/ht/OdWNbq2LnUaVurk9t22TLORn4n7
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



