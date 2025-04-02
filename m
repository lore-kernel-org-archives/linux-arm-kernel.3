Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B5EC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 00:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0YyQuuJn0D70Gt3DF9qWOww2Vsvhfea5p77Xv4vYXo=; b=1cqwo6tsPvLg77tTnX4I61uLG0
	ftuVt1SnyE4WgSDg0Usphe33JrglMJLqcCFF0mtBT1pIVfP5kMDTBM7X80P4RRQNmG5kUmOOpUo/P
	ZEOquVMkrMux3MA9jzrlYfAeTP7fZOJbzNvRf0hnd6lzdpqqv+dYcYLpnBEgSm0eou3RpXzKNiz/1
	O0bwai4mKte0Ggzrzyrkn+CokvxQ7K0YifllD8QL2Jug9OBNg9krUmiFhWtqe0ovoMpmKx/M7IZZ2
	Y+HRHFMHuxFjive6CnYq+scMtvqowTLlvs6HdNfPukSCjsiE4fSUtSvYPL8emoBgX+c0dfKfHaVvt
	Ncf41WJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmHD-00000004l0D-1yJB;
	Wed, 02 Apr 2025 00:48:19 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmFT-00000004kbo-25PW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 00:46:33 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 21DAD60A2D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Apr 2025 02:46:23 +0200 (CEST)
Received: (qmail 23180 invoked by uid 988); 2 Apr 2025 00:46:23 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 02 Apr 2025 02:46:22 +0200
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] mt7915: mcu: increase command timeout
Date: Wed,  2 Apr 2025 02:45:26 +0200
Message-ID: <20250402004528.1036715-2-mail@david-bauer.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402004528.1036715-1-mail@david-bauer.net>
References: <20250402004528.1036715-1-mail@david-bauer.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=vcbb/N719SqerjnEgmY492MYanRbJNvTR7pgs9UQi2g=;
	b=xY361tET6zI12Oo5cMJrqCzaecMWF2wZfEmGKrdaOiWA8pN9bBNW+E/WtSlYfWcFnfL0U/Dcjc
	82GaoEQnAgqrDaheMTPlOfAQDeomqdZ0bOieFeWmb5h0gECxR+XWDZ3j18cq1QaCOhrcBy6mb8O2
	ZpJ7/7CjAhb8qeuOBB2BJ1Mi5aWmrVJFO/HbIWbBcxbQ3uyAccltFSBBOJoIYcbKeaCTIyR+jRL7
	YJ8hhVzgmy+BXshHqgTyAYBmU0Er3bniumqQ6aak6TNJWUdmoXncgDdf6ttFr+6wp1h+a/DdI/zT
	JBtmFU5H2XMEBiqBt03RTZ96XYYOsyOjwxbbe8iXs25Ff9aFeMkote9NxIwSjoCymmx9/27oCJXy
	dJF6dnRZT3fsEOdVleSI/XR8kyC8I/WBqGk+DOUjesS5lVYrgRhlZ6rw6ASpo9G4JUF2Ha9ZFWIW
	OtIUFikYak9Q6tj1RL9cfcem+/+Ka0+/NOjdv8t9ekhLZKNaxg9V2Vw8SnZ5cC7lo6NnQXHu2joN
	Wbe8/Elp/yi4sqTtXiZHhNmovvmSQZ8DJ01p3IPG0oUpItV/hMQ7TY7O6vjmmQWLslkgJ97Sz9v6
	OM06VRh5E/UhzSR2VO4cwZLF9aj2tML4p70zeb3FbawG41p+rCUO/5ELJWZA7wda9u+SpfyQze1G
	c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_174631_976618_E28E46D9 
X-CRM114-Status: UNSURE (   8.72  )
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

Increase the timeout for MCU_EXT_CMD_EFUSE_BUFFER_MODE command.

Regular retries upon hardware-recovery have been observed. Increasing
the timeout slightly remedies this problem.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index c1c5afed571f..d93a72d0a78a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -210,6 +210,9 @@ mt7915_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
 	case MCU_EXT_CMD_BSS_INFO_UPDATE:
 		mdev->mcu.timeout = 2 * HZ;
 		return;
+	case MCU_EXT_CMD_EFUSE_BUFFER_MODE:
+		mdev->mcu.timeout = 10 * HZ;
+		return;
 	default:
 		break;
 	}
-- 
2.47.2


