Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F62CDB480
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LuzHGLvmYUwhc8I6yyvP2EEo7aup8Z3LHV+PsMNUuA8=; b=prf+tZJoLDY626H1PXrO7vgJRk
	wAa6MZ/0m5GGYNod3btKdthOBmGYXUqv2qOiJpytCWZTnrtRnmMuPM1OyT2dlVUto8lR7C0CwyPL/
	5uehyfOEhwDV4SV5NddA1ColfrOAKeN7Ci7BL7ZvJ40EWtfVWHBiRqxsGg+woP+Rxo+eCKu2j3/XD
	sdk09yGTibVvGLWvU52xaqutq8nIXeLE057DHx8Pulv2/l4cY6Ie1OyRmhExDUR4hjt/FxzuYMzZG
	At4XzfK2t3wIX8wzaaV0whbnordkpKCkPsi2EdP1Xs1jqYXeFUjq1hDx8VsscN/5lLRLSgmxeLZ8G
	4fTWEFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7bL-00000006q7p-1ya7;
	Tue, 23 Jun 2026 20:20:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7bI-00000006q6v-1rZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:20:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45fe59255beso181815f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782246003; x=1782850803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuzHGLvmYUwhc8I6yyvP2EEo7aup8Z3LHV+PsMNUuA8=;
        b=G1WW3fD1bJQgTbWgxgA4y+oOftpuBhX5oj42MgCySpgfXabxIZlKtNjY2/+YnUDoPr
         bIuZZkAKC0cVdk9cpfMWo/tmfr2CmI5BX4RV6vTzZG6NbRLbn14a0J2s8k+bhjfLW115
         q+3vL7qbp1lvpefWksHPR1AYpcxcQPH2SmWOzkMNxO2+WmL5kbqmkF8ePQbO/RrV7a++
         8F9rgS2I+zObvlDhCPrAXpMdVxErUgMMzXf7YPZPMFxjOPxTVPCf8dqhXc6S9wEvHTBV
         rOBi4ScDHmXrbO88wBS+3vba1ewvRx+dplz7I1kRKGboNihqA36xn2CDZGua9Z8qRIWB
         cMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246003; x=1782850803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuzHGLvmYUwhc8I6yyvP2EEo7aup8Z3LHV+PsMNUuA8=;
        b=a2PGotZnhl+c5nYMeyOPAf0hPi2XguPCX47Pb+wBm1lRy0mgoVk7NT9sLY/jmrrCC9
         5LUmarXFguZsfo01MEvr50XZPFYOLvmAacWeiZfUFpU/EtZL4UnWmDS3hAaPrU2gDzLk
         FuzWEwGh98Cah79lZ5AOLWRXPiy2DxQwr/RXTnUS0hWnjjH8TmQnd6WArlaUPjDNnWvh
         GLVSOtsflLOHU0FWINZtjFs+gDYkU4wVQcBXVSkvh2rMpbDBDuY9CTDQ1HCQm4m0tmWX
         6e9xfV3FDMK2t43bneY299B4xgrbmvrCWXuZPMAGqinR0IxJKGrW1YRGRe2f89/yq7ba
         ztlQ==
X-Forwarded-Encrypted: i=1; AHgh+RodccDKJCj3SE1NnpU7RaM7QFUvNcDtn0cdT5dpvGqEbQ+ZIqnP5Dff61Q3Gf1y392BXBsrDfs/oESGSLFveiIM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0QIjI54DB6vI3i5jHkFJWM12yJcC/xC9Z6GmLGJchXDI8vNUO
	CR9GfjsYLDTzSBHwroXsYr3kjTQWJi0oOvk2yIuH9XsNBrKp05/9vD5G+L52mw==
X-Gm-Gg: AfdE7ckTkW1597RUQ/yz/LuhQ13ofZNxgX2GT55LCq3cwMpkJXsW0pHaEEDuBkHdq2n
	BneKrLDLMcwejfemHjB60CLa4tvMkKrWgLu9BD6bxh4Fe9ruZWL72m444aQ7O1OtjrZJRpyp2RF
	wOq3pku1E3Dj6ufnqrCTllxI/jx1okydqprvrV5iAaCduXlcHWaVnDZWvCvZ3Tn22cfxxWzSzGD
	NFlDRkLnhgx684B1AXe/YfILkyWnDd51ushmZes6d+b5lRfDTi/BWzWpIEpI7gBUPksvS6cmM3R
	c6r5jaq/jjsl1JGRZQDo5+J1FHBN1r25AtT3kQpHUe5w+UXpRQqSs558Y4KYc/DquMQyy8FQEFD
	rCQ1h7LALAbysBQTpXN4atVeKBDatevbR0ZW7SCdWyXRnkW+70Lmf5PUUh4xTQ5E1DM5rj97srp
	bgAlFZErqoWQMUvqvS/vuPwrFTE/fWynSNcDqmNDjNbz3l2crBUuBADt+MUZ3DJEdxHlze6mJtK
	wnlEsH9IF4T1Hp2Fxk9IJEz4lCT6I5OfbXP5RvzdTg=
X-Received: by 2002:a05:6000:2507:b0:43f:dbbf:6d93 with SMTP id ffacd0b85a97d-46adadd2122mr7876270f8f.27.1782246002550;
        Tue, 23 Jun 2026 13:20:02 -0700 (PDT)
Received: from blackbox (dynamic-2a02-3100-a9b8-8b00-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:a9b8:8b00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c3bsm189460f8f.10.2026.06.23.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:20:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Tue, 23 Jun 2026 22:19:56 +0200
Message-ID: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_132004_502892_C88AC9A0 
X-CRM114-Status: GOOD (  15.63  )
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

The following out-of-bounds read has been observed by Christian on a
GXBB WeTek Hub:
==================================================================
BUG: KASAN: global-out-of-bounds in __clk_register+0x1b70/0x2418
Read of size 8 at addr ffffd66320cf88e0 by task swapper/0/1

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc5 #1 PREEMPT
Hardware name: WeTek Hub (DT)
Call trace:
 show_stack+0x14/0x20 (C)
 dump_stack_lvl+0x74/0x94
 print_report+0x164/0x4b0
 kasan_report+0x98/0xd8
 __asan_report_load8_noabort+0x1c/0x24
 __clk_register+0x1b70/0x2418
 devm_clk_hw_register+0x74/0x15c
 meson_clkc_init+0xd4/0x20c
 meson_clkc_syscon_probe+0x5c/0x94
 platform_probe+0xbc/0x17c
 really_probe+0x184/0x844
 __driver_probe_device+0x154/0x35c
 driver_probe_device+0x60/0x188
 __driver_attach+0x168/0x4a0
 bus_for_each_dev+0xec/0x180
 driver_attach+0x38/0x58
 bus_add_driver+0x238/0x4c0
 driver_register+0x150/0x388
 __platform_driver_register+0x54/0x7c
 gxbb_clkc_driver_init+0x18/0x20
 do_one_initcall+0xb8/0x340
 kernel_init_freeable+0x49c/0x52c
 kernel_init+0x24/0x148
 ret_from_fork+0x10/0x20

The buggy address belongs to the variable:
 gxbb_32k_clk_parents+0x60/0x400

The buggy address belongs to a vmalloc virtual mapping
The buggy address belongs to the physical page:

Memory state around the buggy address:
 ffffd66320cf8780: 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
 ffffd66320cf8800: 00 04 f9 f9 f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9
>ffffd66320cf8880: 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9
                                                       ^
 ffffd66320cf8900: 00 01 f9 f9 f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9
 ffffd66320cf8980: 00 00 02 f9 f9 f9 f9 f9 00 00 02 f9 f9 f9 f9 f9
==================================================================

Commit 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock
parent") dropped a non-existing clock parent from the gxbb_32k_clk_sel
mux but didn't adjust the hard-coded num_parents field. Fix the actual
number of parents of that mux by using ARRAY_SIZE instead (avoiding
similar problems in future).

Fixes: 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock parent")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 at [0]:
- fix typo in my own email address (apologies for the noise)


[0] https://lore.kernel.org/linux-amlogic/20260623201522.1322463-1-martin.blumenstingl@googlemail.com/T/#u


 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index f9131d014ef4..d432e08d1777 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1394,7 +1394,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.name = "32k_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = gxbb_32k_clk_parents,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gxbb_32k_clk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.54.0


