Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1DBC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxEjmrMLU3ArphO/8yrozyx0jV5tnXGHISJN2k9QOtM=; b=02WpOGka4Wg8yGcS8ThBJbQm1N
	7/b08xO5FdyPi4iKtpG1NqYxUY3+FBhEo+y9pADrg9bpcLOu3Owt3scGj2p0owzpB86LA0G76mVew
	UMf0h1no7djxYEhiCZoFfyl44G339LSd3u4Re7qVdrR9CS/yWRnrc4MIyReG3e6ZIrSAtquKMgBcM
	e7w9uMhqV51VfhqJeSb4a8LgZOi2BvPiaztJrKbpzpXpbJuIVFcZHV0kS0BPc6JFNl6CxWSUHRWEu
	EUV/WhmUQ3Ii1Ja9tsyhpcKz/OlSDbeVC2oor+A/36FiZ9pIpmozNv/D1SMa3v28MbiM8L1wPfRv/
	E/Citd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRo-00000004aT6-1VV3;
	Tue, 22 Sep 2026 08:01:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRY-00000004aFy-3di5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VxEjmrMLU3ArphO/8yrozyx0jV5tnXGHISJN2k9QOtM=; b=HVCWMc/+nZ9jI3ONNL4OzxNXUE
	ORMZlxrlzaH4ldHx7R2A0qtxqc6JQkCWYbGWO8AR6CcUvOcsothDjnmLdYY4WXH3a/FoJB3gNyJcV
	fRGZDMxvUeiPW5gv8p0rInwUOvvd8XX8GcGnWwQzhBZTfX1kKgV6t+wECO54gOtyN6Bxj1NHNt/Mu
	XSTdfm//5UBjnMMjteSYMWLNLMtjbxeoizT1gVQ2JMcoHPE/ZNAfIl2ohHsQQ3JGJUdP0c/owCLw8
	CVSlLxQU8ZmPYZle3EFNwGM634Y248tZbUwuoATtaFVGVgIvBeUpF3BRof7JFx/zsiotP71DkUyNX
	L/nlf9pw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vRS-0000000DEcy-0PC7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:01:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so1756205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064088; x=1790668888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxEjmrMLU3ArphO/8yrozyx0jV5tnXGHISJN2k9QOtM=;
        b=Y/o1yMIFMF8bO8gYeCYhuvZ4ITc7Dt1gr1MBFqiOs5GQmqBwL/8nDMuwc1NKLFWO3Z
         bqpM984olCxYPqdEbYOdviWfsZAbPgzp7olOJjAUmTPxNT8xxfaSWDidmAo7lKTJA+uG
         ZWySTg23r6X7uKP9zyCuZPmyAyECUBTX1tIMwM/D0YbRTaO8SwSZn9YMaBF+Nq1fsz0X
         et/gq6McgRb9Q/YWxc36bKdlJWJeJ2KBR3XtaiYRQ21xV5HQEf7cEwMX96qqNzXMEQ/W
         Q7gvlAdGepVSucfwuvIWvttd2Byz/0qH6bbWBKcpwvjoVcaGhmPVgR2AAEXL04hb99N/
         FxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064088; x=1790668888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxEjmrMLU3ArphO/8yrozyx0jV5tnXGHISJN2k9QOtM=;
        b=Knsc37ntfRUXQcrIJNPplWv1j9Z2rH6QBAh03cdy/5bU3zj9F47w2DdlUx8iq0rQfX
         FvxH9JXZqqKOhZBG3CQDr25KFLsiWrlc7bSBOeaChjg54nl7Sg7RvalD86PutarmSbVP
         LRQ0dBrpQoBDj4BkGtEpX10ukpAjf6hm1eRWMsSkFObHl8ZkEotyuhl8CNsDWg/0LhD1
         JDyy5ibB4CHE+BrymB8aF36iQ0/+nToIRWDuq81pvqyrvGByxm8bLCY2zmO4JMmKRe9I
         90GKB262h3mbrPA5YlzUVrX69tA+FEUHK+CVGaGf5vuaAG9UzV14X8/XYsN8ZadQGSyB
         PyJg==
X-Forwarded-Encrypted: i=1; AKwUvBxUPzjHO/Ms+4n2UG8Rp/bi19c/excPMsOnJAl6s0L+vZyFC+cSf2u7QI2RxLEtJYy52aaxCQ63Ar19Yrnp/deb@lists.infradead.org
X-Gm-Message-State: AFuF++muzQrkBth8fNZvK2uCcNMwrOq6WntpWdZOpzztkYrZ7AQpqHVc
	neAW07af6F6MI2jEx/EAsLyonuMf1POGeFoQZ5JFYCKzBfidED3j8Dri
X-Gm-Gg: AYBFou0llSSCIZqOiVBWMCRdaUF3fa3W+3/AzUHn+ASZmZC1J1Q49UkTBXeDEeKQV26
	VnCyrvsBD591mP1UT6r7sGSx21T33PIlwXJuCAG9zPNMueCv7/mB6OOJ1iX0aSqfUVaEQ2aZ/Vo
	NeGs72vpDSdAKCwS06roGpMZN4ILNK1A8Z/HTROof7kBX+2iktCDhwoEJrRFW5oPbfsTab2sSZq
	5/3jvMrqfrGx9ZE9oovfgUCq+YTR8IRDvBFP875A0R+TlvvjrvxYpvM7xXg/JOce7B8DUbty0s6
	HLuAlPCHpStRj9OTo6bDZx7hKf0lwe0P3pwKeU8tT+eSjc4dJLGgVmbyJd2eiR1sJEQ7ghxk2Lr
	xPzM5Tz97YFDNceiF5dAKhDFFtxVxODDhEYI1KLyf0lLmtSCgDJAJpZWRasATJj/pMyULwKKe8L
	TXX2uRk49dKhaBJv1+FVd81RB6p9jJUJj1qVT+xpFV1sKmnayy8XtBAKg8Smc4GZJHyGGCNqNOF
	t4LRl44FzKKp6molBupprn/ai/Efiecdmfm8+m0jtmcHuSqiCDuv4ivePLZfwFO7sLQI3Io2z4J
	wvw=
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr208969905e9.1.1790064088073;
        Tue, 22 Sep 2026 01:01:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:26 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 02/11] accel/rocket: number the cores by devicetree position, not bind order
Date: Tue, 22 Sep 2026 10:01:05 +0200
Message-ID: <20260922080114.44662-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090130_407233_2596C084 
X-CRM114-Status: GOOD (  24.96  )
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

rocket_job_hw_submit() programs the S_POINTER registers of a core with an
extra bit derived from core->index, the way the vendor driver derives it
from the hardware number of the core. rocket_probe() sets core->index to
the slot the core takes in rdev->cores[], which is the order the cores
bind in.

The two agree only while the cores that bind are a prefix of the core
nodes in the devicetree, in devicetree order. Unbind them and bind them
back with a different core first, have one core's probe deferred behind a
sibling's, or disable a core other than the last one, and every task
submitted to a core whose slot is not its hardware number times out after
500 ms. The reset that follows does not help, and the inference finishes
with wrong output.

Observed on an Orange Pi 5 Plus with a KASAN build, over all six bind
orders of the three cores: only the devicetree order ran clean. The other
five produced 27 to 141 "NPU job timed out". In four of them no output
tensor changed with the input, and the harness gave up before its first
measured round; the fifth got through a six-second run with 27 timeouts
and a wrong top-1 class. All but one of the timeouts land on the cores
whose slot is not their hardware number, in proportion to the tasks the
scheduler hands them, and in both directions of the mismatch.

Number the cores by their position among the core nodes in the devicetree
instead, which is what the hardware number is.

The wrong value has been assigned since the driver was added, but it only
reached the hardware once the extra bit was introduced, hence the Fixes
tag below.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Supersedes the standalone posting:
https://lore.kernel.org/r/20260905135612.7324-1-royalnet026@gmail.com
Same diff. The message now says the numbers come from a KASAN build,
corrects the timeout range to 27-141 against the raw log (it said 140),
says what the four failed orders showed (the output did not change with
the input; it said an oracle rejected the output), notes the one timeout
that landed on a matching core, and drops the throughput figure, which
was measured under KASAN.

 drivers/accel/rocket/rocket_core.h |  5 +++++
 drivers/accel/rocket/rocket_drv.c  | 31 +++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d7382854ca9..46ed8352a79d2 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -30,6 +30,11 @@
 struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
+	/*
+	 * Hardware number of the core: its position among the core nodes in
+	 * the devicetree. Not an index into rdev->cores[] - that slot is what
+	 * find_core_for_dev() returns.
+	 */
 	unsigned int index;
 
 	int irq;
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 2bcfe4ab3c68f..7d927bb6b322d 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -157,10 +157,39 @@ static const struct drm_driver rocket_drm_driver = {
 	.desc			= "rocket DRM",
 };
 
+/*
+ * The extra bit that rocket_job_hw_submit() sets in the S_POINTER registers
+ * is the hardware number of the core, which is its position among the core
+ * nodes in the devicetree: a disabled core keeps its number. The slot a core
+ * takes in rdev->cores[] is the order the cores happened to bind in, and the
+ * two only agree while the cores that bind are a prefix of those nodes, in
+ * devicetree order. Every task submitted to a core whose slot is not its
+ * hardware number then times out.
+ */
+static int rocket_core_hw_index(struct device *dev)
+{
+	struct device_node *np;
+	int index = 0;
+
+	for_each_matching_node(np, dev->driver->of_match_table) {
+		if (np == dev->of_node) {
+			of_node_put(np);
+			return index;
+		}
+		index++;
+	}
+
+	return -ENODEV;
+}
+
 static int rocket_probe(struct platform_device *pdev)
 {
+	int index = rocket_core_hw_index(&pdev->dev);
 	int ret;
 
+	if (index < 0)
+		return index;
+
 	if (rdev == NULL) {
 		/* First core probing, initialize DRM device. */
 		rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
@@ -176,7 +205,7 @@ static int rocket_probe(struct platform_device *pdev)
 
 	rdev->cores[core].rdev = rdev;
 	rdev->cores[core].dev = &pdev->dev;
-	rdev->cores[core].index = core;
+	rdev->cores[core].index = index;
 
 	rdev->num_cores++;
 
-- 
2.43.0


