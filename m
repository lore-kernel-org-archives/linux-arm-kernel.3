Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE5C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+px+gyXVLidkcy+k/uZ//IG8TqK3wgfrhlr6nss3oOM=; b=SnL1FJbPIpP93sTcrb/6jVMRgD
	1kyIfjblWOr1f0IPKA1Lc5wXfpDtwJe16UsX9vy1exXddRZoAkVmNyQiB5yNavN1yMoKYrQzU9DdF
	IcRMY79JlbtJ52i0kB2Ef+ekLmUMMdfCyJAYqcSgtefY/UmLD8IOTgFdUZQYlWIPEUj+ySomWa5VR
	4htNyslmpal8gZ7VBP3mJaeS+pgmBasqNJyJIDWXOmomjyv8zhvsLo3Ef2bZQdCWTH5QY7IXSm9JV
	B5OXAFWUsCofUAH3SGCLbzfq2v+pQqiEMluMdTZS3b70reGAh30l4rLwxlHfshF+CemE2bUfbhlGa
	KjYLWrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8oBL-00000003llb-1sy7;
	Tue, 22 Sep 2026 00:16:23 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8oBJ-00000003ll8-04Tb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:16:22 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-47bc923fe6aso2649564fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790036179; x=1790640979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+px+gyXVLidkcy+k/uZ//IG8TqK3wgfrhlr6nss3oOM=;
        b=JJTo9v/cIWFPZ6qXaN24bxqorD/2u00ibcJVhZEHt1Vad9DQummNig0znahtMkgz+3
         64uQQItPoj1UPPscT/cGo8dq9GthwBf7Q2FpPoLw+25Q+LhHM3DGhyMhJo1MOXxIZiT5
         r4Lh/OsHDrmd7qHa+483H8WOg6LsR6lqDvHYDutzTnZpxYS6qyeIQ9gfGyyROcZfJfIG
         Vc4VAEBJ+GVbeAj7e8ZS/UDdlT57z3fANeHa3Ma284hUPc3DsPL71ruVpzr44nX3OCZu
         Ba+kLnrZhql1+CqveDltBGtif1FvbMq0WcnoDznt8uN7ybpd3g1lekVmiuAhcU8ATpKF
         8kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036179; x=1790640979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+px+gyXVLidkcy+k/uZ//IG8TqK3wgfrhlr6nss3oOM=;
        b=d3fXoEPgIK928BaVqHrNXhvPzFvG9jIiJju2tNgpVmUa72kZx7ypTowJqZwAZtrzlY
         wnpF4ocBzP/JWXwVjsLykmYsKn+ps41LqFCPyAEWCHcjRyH9pTLE/buPdoZ9f81F5nW6
         Dj/q09JA5Iz0tBF7TbLAgVaJfZkcNMntijr8BiHw58OsMkf2i3eLBrSvJpxKMEmTqLVt
         HLH0C0i/q8vMEVr4NnbNJzHZoiLKiYYOqxgpJ8jhNhnzrVmy3qxcH/4PtaoUMh2oSaTt
         mWXWzI/7V+vBKmUPCmJbLO0v/x5nuaZt/L1ND3BppAafRPO+82mYDQVfIHKAc4wBDsWV
         u+cA==
X-Forwarded-Encrypted: i=1; AKwUvBwNcMlXq9mLc2QxyqT5hY2RjWZwaaM9gyKYGHbOn0+xQRkM9rOtc3UXBhWGJ51OIgUL+O1b1bR7LOSqqBfpXIIS@lists.infradead.org
X-Gm-Message-State: AFuF++n8YeNWYWV4+HGyZUCzArQ9Kj2sfoeLy1w682veN61jufe5c18A
	4iqgY5g23MzL3V4f3ck5PgRCQM6Vs85jSN0h7fp6LbFUbkzjKN6rMf2SVWyEu+YJqLN4
X-Gm-Gg: AYBFou2KG/A3dT3fMwsHlDKrzlAb0mAe4c5y88JxxPY0z++pABJ7KBbCY2Rnp5qqbGJ
	uJWTDyTMOdZGhxC68s0map9iktKjBITa3AcqisHs9PHmBmL65f8IckGk2mFUTln7HUI+n4E79i5
	as8LilUCip4UjS1wDceHrHSBsVezxY5dmZl0FQWsXHG58iOQpUI3dDpCLeNdL/NHOU7epSROmGd
	trfnOERKugCSRjNV0jQeqbM8rfSzpHaeyIlJ+C0aEAuZu3fxSqaNBoRf7f3KJ9GsazOMP5Y0Bje
	mT40lUIr3oA8jOKrSiW0Pavahq9+eviLswEEYoYzwJelTXtjoyK6f1tPL7lpJZyaaGnHV1F5GqD
	MsGAC0DjsXdBvgpjmHCTN/Mv4oi0YAtT6ssRW5S1ygGCJGqfkuHn70AhEDnvTKCpDgO+SYl1r83
	v08U0w7cdvjqWiizUHZ5P9LmGTZ+4kWw0ZlnGcc5rhF6+1RGsDHwxPzC0G8Nh26rheuqfn/mp4T
	6EU101fdP7K4wOQ+ArqHqh0Mo47JuaJc3SkvNvOidx9gMSC8FRI0Pes1/B0asT+qhh8kxUuQKqb
	hKu5AtZzL0gq8uV9iH2bCw7I00cY
X-Received: by 2002:a05:620a:1791:b0:93b:f246:bae8 with SMTP id af79cd13be357-93c15e78ed6mr305051085a.37.1790035759325;
        Mon, 21 Sep 2026 17:09:19 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a812d4sm53263785a.22.2026.09.21.17.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:09:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: airoha: npu: cancel wdt_work after releasing the WDT IRQ
Date: Mon, 21 Sep 2026 20:09:14 -0400
Message-ID: <20260922000914.542068-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_171621_089299_1E456F6C 
X-CRM114-Status: GOOD (  17.48  )
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

airoha_npu_remove() calls cancel_work_sync() on each core's wdt_work,
but the watchdog IRQ that queues it is requested with devm_request_irq()
and is freed only after .remove() returns.  airoha_npu_wdt_handler() can
therefore schedule_work() again once the cancel has returned.  struct
airoha_npu, which contains the work, is devm_kzalloc()'d and is freed in
that same unwind, so the late work dereferences freed memory.

Register the work with devm_work_autocancel() before devm_request_irq()
and drop .remove().  Devres runs in reverse order, so the IRQ is freed
before cancel_work_sync(), including when probe fails.  A cancel left in
.remove() cannot get that order.  Initializing the work first also stops
a pending watchdog interrupt from queuing an uninitialized work item.
Probe currently calls INIT_WORK() only after devm_request_irq().

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Cc: stable@vger.kernel.org # 6.15+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 5bb4817a898d..4d3195eb00f7 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/devm-helpers.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
 #include <linux/of_net.h>
@@ -751,12 +752,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
 		if (irq < 0)
 			return irq;
 
+		err = devm_work_autocancel(dev, &core->wdt_work,
+					   airoha_npu_wdt_work);
+		if (err)
+			return err;
+
 		err = devm_request_irq(dev, irq, airoha_npu_wdt_handler,
 				       IRQF_SHARED, "airoha-npu-wdt", core);
 		if (err)
 			return err;
-
-		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
 	}
 
 	/* wlan IRQ lines */
@@ -803,18 +807,8 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void airoha_npu_remove(struct platform_device *pdev)
-{
-	struct airoha_npu *npu = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(npu->cores); i++)
-		cancel_work_sync(&npu->cores[i].wdt_work);
-}
-
 static struct platform_driver airoha_npu_driver = {
 	.probe = airoha_npu_probe,
-	.remove = airoha_npu_remove,
 	.driver = {
 		.name = "airoha-npu",
 		.of_match_table = of_airoha_npu_match,

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

