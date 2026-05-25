Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12CACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 03:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7LePE+lQEDtbUjTwqwb7DITUL2X+56pGvmOXgAAh314=; b=T59VYAA0YhHAAYxV9EawjiA3A5
	K84rOxtBmF9yXUxrtKzibNoDSHnkUM6jNaE1luYtvSVMqyzM3d2YqmFWAsbw8CE9SbhAC7hUfPpES
	/qK8lIWFmk1giudNMrNbVcTqD0yEckm7e2/9xbf4zmyF+JKKyLt8dHLWVkBh0MNKvu6eQUZKqfrk1
	5x01v4h6FGOIYr7dUOAzt7eOtyVe++Cuor8n1pWU9RAtmVbePwLYemw4lBY88WVEA2KhxaYYftkap
	u/rAJ/cCt5lQWs4GiOUM5UIMQol5/CE98RWt4hlIfaKufspy9YZxve9sMqCmT0Okrih/tJNV5RA5Z
	S3GIx+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLkm-0000000GAl6-1zQx;
	Mon, 25 May 2026 03:13:20 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLkj-0000000GAkB-2Z9R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 03:13:19 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50e5bea4045so71517901cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 20:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779678796; x=1780283596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LePE+lQEDtbUjTwqwb7DITUL2X+56pGvmOXgAAh314=;
        b=rIoj7afNM8MoWRxjvnAH56NRelTMq6/vVYcmqFuhRmVnDl0Uthju51S+vFaIuDM/7C
         3bAb51kflUHgXJvy0gYxt9q+G3i5zbj9mp230XZEOn5zrMIzw0L6sVyhOIa7+6+2UmVF
         W7Zz/fI/7cZEKCex+RzS59DCryJTO1sWeIdctDIIT9YVfxmgu0IpwYPvTHJOTE233rK0
         CpglRYGO9T/muwaOYcSoT2bfuWDOk/fX5Iu+u9FyCaZzad7OpEJ0Uepo5/tu7F0wKw7s
         2w4e29BeeJyIiCAbCjRZXL4MbZQkQj4ZB/KNgI89K+/TIUK3EW6SxxMs6jNzxort4bcY
         SjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779678796; x=1780283596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LePE+lQEDtbUjTwqwb7DITUL2X+56pGvmOXgAAh314=;
        b=in9TdmwV2RSUyaKoc7ZyvYIdhjsEfxDpHJlGBkyPDHkZiHbF5nQLeEiIJ/Dxy0IzfJ
         iAIedN9792V2xwXdshD1IyYL8M0f1IbPPT094aekEmsiYc57EC+LmRUUZyH22JZJZPYD
         tjtUhFIOMwaEWwRyMf+upVkrJhvtPFAH3WcK8KJXoeF/kvcdwpXKiY0BRwXBGoIpDqGd
         sl5WsNi1Ej8vJZWVzk9Rq4JDPBhk8g+O3sRHRm0tqajwJZRAxxS6KroeGyR02baRDFwT
         0aIpEMnwFQh7XmU/mHvgJiMWiWp/icVhA+1IduGMYAw876Su4GoYb4LJ7QDN+zlA/FjT
         gNrg==
X-Gm-Message-State: AOJu0Ywa8dzoMatsqkdo8etPFfCFtUK1t1uLDcn37igyYMLKp4LvaCTh
	a3DbGdcVVoiI0fLVPv4QYFD3G2PwqgxQCrnBfYr5LY9x09OVXfJI5Hw/
X-Gm-Gg: Acq92OGiIPPbgizRs0iYyylg8iyS0tr2Jyezo7RbRqGzOnv/yIx/yLGz1eGHaKbTeTe
	x/5HGitzI+qXBcMGQ9ZsC3pOU4WkyfVjD3rPcosUY2GAHWDjN6Yba5lhEBq/Tzo5GW5jMoRH4sf
	wpgXFkg7y0WY8CWXqEfXJEJ8tbZheiTptv3VMmuuaMBrxxRP5ZnU+3SBj2IA2brlSt2WXjVMk3L
	rcVNW0AX5lN7T2hlnwv8ijMB+Lz6TCdzvKpLocIMgdQy730jBcRQe2Hd0EREu/I+Pc/n8q1bJpu
	afrUcAJ7v4Dm9BGvyze4Nml4dKPjNYXJog2rw4qy3UT3kieBaKUwYpa0C+FNJwQp1f4vokLXYPU
	a3HL1BzllDSU3QGa8k+llsrxVegCVweKL6tHmydC9KRNyhSVjFgqFjVdHfrJKSKpIP57pP9i123
	EtsoG3IWWf5ppLzKPF2M8sJWFF115uAz1VE7F2Q0boiQE9PIjULO8=
X-Received: by 2002:a05:622a:5a0a:b0:516:dcbd:aabb with SMTP id d75a77b69052e-516dcbe03ddmr147747701cf.16.1779678796278;
        Sun, 24 May 2026 20:13:16 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516d8cb8faasm80335381cf.21.2026.05.24.20.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 20:13:15 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: highbank: Fix OF node refcount leaks
Date: Sun, 24 May 2026 23:13:12 -0400
Message-ID: <20260525031312.1341109-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_201317_654156_E251A013 
X-CRM114-Status: GOOD (  13.65  )
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

highbank_init_irq() checks for a Cortex-A9 node with
of_find_compatible_node(), but uses the returned node only as a boolean
and drops the pointer without releasing the reference.

highbank_init() has the same issue for the Calxeda system registers
node after mapping it with of_iomap(). of_iomap() does not consume the
device node reference.

Release both node references after the corresponding use.

Fixes: 7a2848d369b2 ("ARM: highbank: abstract out SCU usage")
Fixes: 26cae166cff9 ("ARM: highbank: remove custom .init_time hook")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-highbank/highbank.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/highbank.c
index 47335c7dadf8..430f1ca125d3 100644
--- a/arch/arm/mach-highbank/highbank.c
+++ b/arch/arm/mach-highbank/highbank.c
@@ -50,10 +50,15 @@ static void highbank_l2c310_write_sec(unsigned long val, unsigned reg)
 
 static void __init highbank_init_irq(void)
 {
+	struct device_node *np;
+
 	irqchip_init();
 
-	if (of_find_compatible_node(NULL, NULL, "arm,cortex-a9"))
+	np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9");
+	if (np) {
+		of_node_put(np);
 		highbank_scu_map_io();
+	}
 }
 
 static void highbank_power_off(void)
@@ -141,6 +146,7 @@ static void __init highbank_init(void)
 	/* Map system registers */
 	np = of_find_compatible_node(NULL, NULL, "calxeda,hb-sregs");
 	sregs_base = of_iomap(np, 0);
+	of_node_put(np);
 	WARN_ON(!sregs_base);
 
 	register_platform_power_off(highbank_power_off);
-- 
2.43.0


