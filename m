Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F496CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 20:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BfIck/rT3+zK22QCpPHxg3Zn0YkqOsK6i33YZrX+1YY=; b=NWuvQ5rv1j2Z5ikYWG4K80sjS8
	GN3PYI9H9CO3eB0RGS+UrarfPY6snNoob/OU37fgBwZYvr+y5gZz+OdGvcRTV5iEYW6gvZ75+/SQX
	7K8SN2TxfwYrFPmtM8Yi6ZzxPSATCGDAY6K4Mtr0Tb0OHREgnr9h8l1L+J195QiaCNOx0vv4OqvA7
	PVJCT7Eo0Pnc0y2VLXUqio9ddipqdv3Gg9sBqnswa9VzvTIc0iXEKjkq1+QJC9EIB6m1ovup/9zA8
	Qw1G489IkltmW8gqBNNarGJXEnWMBwqnqKntiCceZCHm5z61TDiofCVqbqyAf7Yb4CV8JKeyVf4Ao
	C5xff+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQaI-000000093gq-3NfJ;
	Sat, 30 May 2026 20:47:06 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQaF-000000093gG-2nJt;
	Sat, 30 May 2026 20:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BfIck/rT3+zK22QCpPHxg3Zn0YkqOsK6i33YZrX+1YY=; b=SwxvQkoEVKNzIOGqsyo0BlWs4C
	WSHo0ip6PZzcLEB3DxmTB96AwEwzUFeAR1LoXjR/BRGTrmRwCjBDwPZXQeDFajWWIxTFqqaA9LSgT
	Y965Fs92x/BxcKWgnPIxWpxlbneORSjUUzMBP+X2TXNT8i6Hpwiss2MpamKO3RSlmVtTf9anRNOJE
	GNbXWgydb55lIb1DEchC3gR+UULryEVrnidNhFpiH/dVbDYSDM708m4/mV7UchoNOr2SFuwex+ASj
	Y1U0Y3bR+FLV7c2KV0LVKrz5OaGA50W2eYOFFLIkx2BK42P3a9+QrV08O2XEE0uTto5WCMkPdml43
	UPqCOtUA==;
Received: from [189.7.87.67] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wTQZy-00AN27-3W; Sat, 30 May 2026 22:46:46 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: linux-pm@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] pmdomain: bcm: bcm2835-power: Raise ASB poll timeout to 100us
Date: Sat, 30 May 2026 17:46:34 -0300
Message-ID: <20260530204636.1115120-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_134704_031702_D0C6BF2F 
X-CRM114-Status: UNSURE (   9.64  )
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

Commit 18605b1b936b ("pmdomain: bcm: bcm2835-power: Increase ASB control
timeout") raised the ASB handshake polling budget from 1us to 5us.
Surveying the pmdomain subsystem, 5us is still one of the smallest polling
budgets by a wide margin. Comparable handshakes in other drivers use:

  - 100us : starfive jh71xx-pmu, apple pmgr-pwrstate
  - 1ms   : renesas rcar-sysc, rmobile-sysc (power-on)
  - 10ms  : renesas rcar-gen4-sysc, sunxi sun55i-pck600
  - 1s    : mediatek mtk-pm-domains, mtk-scpsys

Raise the BCM2835 timeout to 100us, matching analogous drivers. 100us is
still negligible relative to a power-domain transition and gives the V3D
master ASB substantially more headroom to drain under heavy workloads,
assuring us that the timeout is enough for any scenario.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/pmdomain/bcm/bcm2835-power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index b76d74e3849b..d507bb675e29 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -175,7 +175,7 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 	writel(PM_PASSWORD | val, base + reg);
 
 	if (readl_poll_timeout_atomic(base + reg, val,
-				      !!(val & ASB_ACK) != enable, 0, 5))
+				      !!(val & ASB_ACK) != enable, 0, 100))
 		return -ETIMEDOUT;
 
 	return 0;
-- 
2.54.0


