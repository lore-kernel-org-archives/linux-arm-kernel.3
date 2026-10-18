Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F63CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xKFMMQAaLNNm+skgAAsXw26m4WFtEZPwDrF2Msw/lgw=; b=h8DRLHs160O2FMH/s/YZrR8ELq
	pQXzVl8QRtG/KZRKq/52rsM1ZQo7dcLWOgz6L0t3ZY2BPJn0S5nOw1MVK4LE37S3mhZt2R/tiGvYB
	y9h1B6s109CWyIIUF0/YjH6fkjJJZmWrTRLgaZcM+rgwVfo9NHGjhR1hyTs0axg0/nLlpDFDAzKg2
	HAfB58rWHa55OT79Cd/jRj66h1yN7M4bbxq8RQcWJU/S2PonFsse1/0/sH4csxP2AwMfadur142Q3
	vShXnlW7f7D38EEgiBQXLg2fUKOkSZBsH3hcwyMXW0pd7LnrAMANJ2660rDZFfPiH6TOgJpp3Cafp
	IMksCSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIP8f-00000005npc-3ET1;
	Sun, 18 Oct 2026 11:33:17 +0000
Received: from out-79.mta1.migadu.com ([95.215.58.79] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIP8c-00000005noo-2U7j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 11:33:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zHr9xcPazVHWL8DJfrl78kLBlWerYRb/dlKmQut8Npw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792323189; v=1; x=1792927989;
 b=EARffI3i9Q6j4HREmWe3h9i+761Hr9zI15AKvXDPKmVfwyU4FSTvf2eVNw3cGP1EjuojnQrW
 zrM5f/zeV73yhIBQWQAQFQMGryc61rB/zxvHjc5ccivBNT0Xc9caCaZbtDodKCfLz8rduzSmrV0
 +2vtsOkjpZUarIThQ6dbRGB4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e71d276a41eb9d7b;
	Sun, 18 Oct 2026 11:33:09 +0000
X-Mizu-Trace-ID: e71d276a41eb9d7b
X-Migadu-Flow: FLOW_OUT
From: Aditya Garg <aditya.garg@linux.dev>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (macsmc) Allow enable writing to fan speeds by modifying sysfs
Date: Sun, 18 Oct 2026 17:02:48 +0530
Message-ID: <20261018113248.12243-1-aditya.garg@linux.dev>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_043315_150892_A4F8FE5E 
X-CRM114-Status: GOOD (  16.06  )
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

The fan_control module parameter in the driver enables/disables the user's
ability to manually modify the fan speeds. In case the user attempts to
change the module parameter via sysfs rather than at the time of modprobe,
changing fan speeds is still restricted.

The reason behind this is because during probe the fan_control variable is
used to restrict the user in the following two ways:

1.	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key == 0)
		return -EOPNOTSUPP;

Here, if disabled, the OS will return an error and will not allow changing
the speeds.

2.	if (fan->attrs & BIT(attr)) {
		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
			return 0644;

		return 0444;
	}

Here, if disabled, the sysfs files are with permissions 0444.

In case a user changes the module parameter via sysfs, due to the second
check, the sysfs files remain with permissions 0444, and user isn't able to
change the speeds.

Since 2 checks are practically unnecessary, and the second is causing problems
this patch removes the second check. Now, if the module parameter is changed
via sysfs, the first check will pass and user will be able to modify the fan
speeds.

Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
---
 drivers/hwmon/macsmc-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
index 1500ec2cc..76c485832 100644
--- a/drivers/hwmon/macsmc-hwmon.c
+++ b/drivers/hwmon/macsmc-hwmon.c
@@ -390,7 +390,7 @@ static umode_t macsmc_hwmon_fan_is_visible(const struct macsmc_hwmon_fan *fan,
 					   u32 attr)
 {
 	if (fan->attrs & BIT(attr)) {
-		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
+		if (attr == hwmon_fan_target && fan->mode.macsmc_key)
 			return 0644;
 
 		return 0444;
-- 
2.53.0


