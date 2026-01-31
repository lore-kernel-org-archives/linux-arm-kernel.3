Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19CED7976C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lkvUxnOL7dR+fW3oGs9jB2Diau2Xz6VAHarHsYQOkoI=; b=YEZc1Hp1AYa1mrXNsKwDx53CC6
	d7DKYM2YA9YRBg+WRLCDJteQ7N9pb74mVhrEp5rwKSrj68Gdufcp4lqbN/G6vK0T6Q0W6ETBvmslt
	UMMDNaQ55twBvoi4/wAOkSDTATTGbNCygyBiVl0QHhFiMyfGazeAWvtWfGKPv3cCU0YN01ZZq1Szm
	Aqagik0byoSHqZPZSjNWXTTKluO0GNtMCAMH959NSdQky7TrMxYCXU1oJ3gIvAQ9aNmiBKej5vhDI
	XOf055kBB5bry9CPW6m8qoL5SHeG6QO6d4RM8g1Mfw5uVju9pfYgSLeMPU//huA/mRmPy5r4vKmxr
	MIrRCnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBqf-00000002gg8-1QmR;
	Sat, 31 Jan 2026 14:21:17 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBqb-00000002gfh-45Iw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:21:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so1554890b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769869273; x=1770474073; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkvUxnOL7dR+fW3oGs9jB2Diau2Xz6VAHarHsYQOkoI=;
        b=FjL9x7nrzbJH4240AVwfctoewrwxZyx1zEV7boPYHxuJTSbBDflfsSgzlKINHyAa1W
         EwqYTPJrQ7a28mbmPUNe+q9EkEJKwvxVgy/7XQmNirK5FjAwi+4H/UEmnmM6E3I4Ob0m
         vPHLAZT4tG9bo8sH8QDTFbF2YUZoVFgIC+JN+Zl+OrwYkp5af+dc+IH1ilTkhhmdT7Ra
         sQDkFyh1kqGyVW8Kos4B3NxQSD+0i1wcGrhrQV1Vr2p9nE8UDlaa2SKZHH+o6kJ1j7DN
         HqeXsbepp/2NtBWU85Q2r3hocxB3WgJVIXRbeiNPogUaAlAYplrUdLjwR3g7aTNE6aU0
         r6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869273; x=1770474073;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkvUxnOL7dR+fW3oGs9jB2Diau2Xz6VAHarHsYQOkoI=;
        b=Iz2Gu8D3xmkI5MeIBggmQ/ahIAUKH48fosKnQ51iosb5HrrY48NjYYlJaGiFRR9K5W
         YJAqdeU3HbFDQ/VlW/wnMbOS8qYV2nW2QY76B7M3Frl7BENx4/yyGcHUoHpn6ns6bLbR
         DkktE/usNUPu6nGzAQni7f5tpWry5hO4LryH/TV43Mhz33DBNCeAMJ2fpoPbgOiH94be
         bqG1jr66A00lLr3e0YfMFRbQ1U2XlbCX1kzW1qiOdvcF8S/OI22HoXJnDp+2oP4IOlW4
         +IHMUpR0meFUnVCOm3JJXCAR8vhP57fMPadlBBWuam6ixbaTON8uAjg7BH6p0m6IsdTz
         JoIQ==
X-Gm-Message-State: AOJu0YxdCmLSlQkIrcsraiB8KC3iJ2eTCiLVnwNaaCbjHw42JL/5FEhP
	SHfKIejsFga7Ou/HzAx4IW9vKjdY7lcv1KsOaYk7Hr43R2hkcNNJAOXM
X-Gm-Gg: AZuq6aIPW+QIkMnVxsx/zw+b7hvsKid6S6ts6C56okSalAPcl80XycbcQtBC7AO0FRj
	lm34/MkMmKi3AlMXN4B3wKgniiFx+gTDJ5nXOxo6UvgvzzunWvBQlwSqKM9zMNib3UirQuFoN0S
	4gYiyrpeHnDcfj40UlLFkQP6LjOWX/OoHF7/zcsOEQMzhUA2v7+TWsxsoyXSLK0QmKigSM3c6Xw
	fn7AaeYJk+THnv9u3S3l83VY0jZMunOVWHWYOxlyD7fj4ZOkBsTRkFAc8ILu0AcGJZeExI23zhT
	pCy0hx/kH7hdl8AugkVDCcK6pni/qYJ2VoHf+BgOOF+nF+eTI/x5Y3/3PCKn0uBKYIRCwpQV318
	I9HDpwE98SvLfTFhgpF1hzE7OS3fEiwk9PrVtDyNjCC0PnC0jFjtUypCZ3blZ0ETLa8oYYDg3pt
	ZrUoqzxk0=
X-Received: by 2002:a05:6a21:690:b0:38e:9e4c:ed5c with SMTP id adf61e73a8af0-392e0108c9cmr7004530637.52.1769869272764;
        Sat, 31 Jan 2026 06:21:12 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cb5adsm11122965a91.3.2026.01.31.06.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 06:21:12 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 22:21:08 +0800
Subject: [PATCH] soc: dove: pmu: Fix device node reference leaks in
 dove_init_pmu()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-dove_pmu-v1-1-1b40989778d1@gmail.com>
X-B4-Tracking: v=1; b=H4sIANMPfmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ2ND3ZT8stT4gtxSXQvjtEQzk7QkQ7PUFCWg8oKi1LTMCrBR0bG1tQC
 dTumvWgAAAA==
X-Change-ID: 20260131-dove_pmu-83fa64fb16ed
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769869270; l=1738;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=0SqmNXMiDYeKhpDqhKZq0p/LgtJ8W3oHQkpkBHWvFaU=;
 b=mQoe2/qhHtne+vtIPeXSx4DDLwMyGRe3rzQKgSeUID73vUpJbHLAoljnJguQcIg4Y8UfEKO9E
 QcyqV/SUAjzB0+DTc7M7iMttrQJu2nLjrgcXAd4g2xg37KMwEOnU38H
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_062115_693074_4B484679 
X-CRM114-Status: GOOD (  12.09  )
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

Use __free(device_node) cleanup attribute for domains_node and add
missing of_node_put(np_pmu) calls in error paths to prevent device
node reference leaks.

Fixes: 44e259ac909f ("ARM: dove: create a proper PMU driver for power domains, PMU IRQs and resets")Y
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/dove/pmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
index dd8ade8e9ee8..3b2567f20649 100644
--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -371,7 +371,7 @@ int __init dove_init_pmu_legacy(const struct dove_pmu_initdata *initdata)
  */
 int __init dove_init_pmu(void)
 {
-	struct device_node *np_pmu, *domains_node;
+	struct device_node *np_pmu;
 	struct pmu_data *pmu;
 	int ret, parent_irq;
 
@@ -380,15 +380,19 @@ int __init dove_init_pmu(void)
 	if (!np_pmu)
 		return 0;
 
-	domains_node = of_get_child_by_name(np_pmu, "domains");
+	struct device_node *domains_node __free(device_node) =
+		of_get_child_by_name(np_pmu, "domains");
 	if (!domains_node) {
 		pr_err("%pOFn: failed to find domains sub-node\n", np_pmu);
+		of_node_put(np_pmu);
 		return 0;
 	}
 
 	pmu = kzalloc(sizeof(*pmu), GFP_KERNEL);
-	if (!pmu)
+	if (!pmu) {
+		of_node_put(np_pmu);
 		return -ENOMEM;
+	}
 
 	spin_lock_init(&pmu->lock);
 	pmu->of_node = np_pmu;
@@ -399,6 +403,7 @@ int __init dove_init_pmu(void)
 		iounmap(pmu->pmu_base);
 		iounmap(pmu->pmc_base);
 		kfree(pmu);
+		of_node_put(np_pmu);
 		return -ENOMEM;
 	}
 

---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260131-dove_pmu-83fa64fb16ed

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


