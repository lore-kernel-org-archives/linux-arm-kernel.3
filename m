Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE77EE9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJUICxDk015PLfzQs3JF41wFjRVpYrqT9S2gtAwBHi0=; b=GGx/2CNtu7WGeE5c0LgGcHybEQ
	CAQ8c8M63oKLf9GuZm90U4MhHfyF0eARCFWWejYOYwS7J7VHIhNB9FWW+Kuz2SDJK02gf5jWQwEdG
	wCmWf5Y7vN35VZ1ETWZCfp+wbVMjbEsn/jvClgoqP++ZiWI0o2lZpVj7WyTW/+kU3MCKSQwI49GBZ
	QybrlRtKi1fDmUs24c1xxqnumyMLjzs/64r5Z1YnTdkhsN0SdUW591zLjgs5VH6UXy5NdoGsEdfLm
	XS4Vu7LH1hd8qR6440Pkw62hSDv+5/9ycxB3TS3+i7enBI8rgt04K1itrd20jStbDYxMSz88vnJ/1
	vmmlRPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoR7-0000000AOfU-3ImG;
	Wed, 18 Feb 2026 20:46:17 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoR4-0000000AOdc-2erU;
	Wed, 18 Feb 2026 20:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dJUICxDk015PLfzQs3JF41wFjRVpYrqT9S2gtAwBHi0=; b=CBBUe1eN3YrWLixRbeYzi0iD/U
	NPfAu7N+i5EBiT6p0VJKmMUEhZ3nc3hKBdBSi+bzeNBGUD/u5Lb1v7Yj9B0kLAIPqNqAGDkozC5iE
	HjbnYhY5n3bbLePKDfSOSAcn2+Nav4gDYfOD+wVjTnYTJs/mbTMa6Hr0tIbop868PufozLrJw7ubc
	8+IvOnHvQduFpZTkEjG3S1mVmOnEVAwSELgv/pxtXtJbZCB9tN+RB8JJK2Mt++6FJ4aJ+0yXklOoQ
	JOrJT92gT0ckNzJTvsph32M7WXj6fAfg3EpvVrmNWRD08h2unLV7notQgsjrYRnn1ZZZJcivdH+vL
	94OSSQgQ==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoR1-002Czn-8e; Wed, 18 Feb 2026 21:46:11 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:45:01 -0300
Subject: [PATCH v6 3/6] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-3-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
In-Reply-To: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=/i7oD+HdEV5+FKpKWf+g///6ddnKCJYwQMS7LWp2oV8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT5P9XiXDOHTDoiVcbz9TJ9qIpK79AuFWnau
 IyPfH2YHBWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+QAKCRA/8w6Kdoj6
 quUhCACIysUXtrkRvQYkkrInI6yjQJvz67fNCnfp1u2KrfJgVeR0VMGQGnjA+2o9mhe+uE2Om1A
 gqYZCSsCo+s6ovFbvYg9lvQXoXfWSWzGzWaJ8chw8ulwNQ6ly2zFOn9uRxzc5SCRhU8x4/MXEGP
 nY4vNB9Uo9cNAqvjmPg/Pt0+TtyG1VOqz6a0EaorKDUHhMC7E1971vbRRDP0QApPAUNYBx2g0qr
 d6uNPX4pdT+5x5k+YnSOxEWL6tNStyWRnoD7NU+LKVqmQwFHtew+NWhVkeqcWQBEenWXjweLa7h
 +IsBXIdXTGRHqhfSBYNUJ5XHtHZD26kXhYT5aKflei/+WosW
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_124614_680313_D775DBC1 
X-CRM114-Status: GOOD (  11.39  )
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

The bcm2835_asb_control() function uses a tight polling loop to wait
for the ASB bridge to acknowledge a request. During intensive workloads,
this handshake intermittently fails for V3D's master ASB on BCM2711,
resulting in "Failed to disable ASB master for v3d" errors during
runtime PM suspend. As a consequence, the failed power-off leaves V3D in
a broken state, leading to bus faults or system hangs on later accesses.

As the timeout is insufficient in some scenarios, increase the polling
timeout from 1us to 5us, which is still negligible in the context of a
power domain transition. Also, move the start timestamp to after the
MMIO write, as the write latency is counted against the timeout,
reducing the effective wait time for the hardware to respond.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index 1d29addfe036348e82293693b4059e504bb25575..7b9eea10a24e26835deeca84c60ccb616b99a508 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 		break;
 	}
 
-	start = ktime_get_ns();
-
 	/* Enable the module's async AXI bridges. */
 	if (enable) {
 		val = readl(base + reg) & ~ASB_REQ_STOP;
@@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 	}
 	writel(PM_PASSWORD | val, base + reg);
 
+	start = ktime_get_ns();
 	while (!!(readl(base + reg) & ASB_ACK) == enable) {
 		cpu_relax();
-		if (ktime_get_ns() - start >= 1000)
+		if (ktime_get_ns() - start >= 5000)
 			return -ETIMEDOUT;
 	}
 

-- 
2.52.0


