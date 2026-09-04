Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A8C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sD9Hx1FwVR5Eafl6UTBAMgGfntaRlJCf0MQwhh/QWi0=; b=j9ybSJ+WHoH0Ago8n4Vg5T2xni
	yUxziGPuT8OvXUQdfyazgD5PgN7zfm1DlKiVcK97/5FauXiM9I44liKYw58NdcmrIU0krWqImV2jY
	445zalAudaHFpbpJyPIrP7a7rZVdeqRpcaSZUBnjlz6ERqtyfHp8NeovbQBPxVCoyxkLnhaIknrs2
	ng1NG9YGEIPtOSIUQ/a3LFPuSEeE0dvsmZviC4ZCkaZW5I6ptlRpa3Ug87iRtSybC0ysqXY5e8DCq
	n/dnEmD8jmjW29QRrTQRdBHZrOpOWac2yxLyWGKN9RCpUDF57dXHvoCVOGF+f/v16+O6dU1A7gsT4
	6pc8XCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bng-00000003LYA-09FD;
	Fri, 04 Sep 2026 21:50:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bnc-00000003LTy-1UQJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:50:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ceab75934dso13673135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558615; x=1789163415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sD9Hx1FwVR5Eafl6UTBAMgGfntaRlJCf0MQwhh/QWi0=;
        b=GZd3RZy0V/7ZKia2Nf7S0j0ohg1vvzpXfbqaZsg/r2CalmtNyhb0+oqJ9w/E3V099i
         oL/KzVAvXkS6Sh6Ijy58SYBFdWITQdFDDctriwsETNlwS9oOr+AW2h+CB1yhjillPuaW
         nuB7eAKwAHjONrP01FfT2XycZgnwkqU1C4OlDzVTHvH1jtuYZq90E7em7mj9X+FQoUoi
         Ib6mkBJV2HC8s9OwwpKExDGfgIPAbLr6PYFO7csYIC8u2hZywl8e6lKfXFynPEe4x9WL
         qBxhCk9a0YHXG6b1lfKkuQHancpUh41H5mNMz5VDeExD4W4WRvlj8Zi8n1sATaDsHGAd
         z7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558615; x=1789163415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sD9Hx1FwVR5Eafl6UTBAMgGfntaRlJCf0MQwhh/QWi0=;
        b=Ip6bpqco4Afi5/wUU47I6BZEicAGk8gwikQ4ckIrnqW5L13aQXPZ3/waYPM9I6SrhT
         CP0uPJTupxhWYIUAtRsfvztHmCZwOeZdEYeP+0iTnerDUydnFdOgcLK2vsvmyQIWI88z
         MnwG6DKZ0PYSLTkerRl0K+j89O0oqjn/DRbSQr7e5NfnjC1okFg4cL1SWm8bTkP0JM2e
         DfUe2cpK0z9rbFPTdnvVVcmfLOtPdfAUB1ep84uwSH6mS9F6SHwK18qcyrJdaBV5dcHU
         +8uNAmArTgXioQzTX50NbUKEdZMr34gkXagU+YtCmfUSJCP6GL/XEhgghzl6xMzlihwG
         RkhA==
X-Forwarded-Encrypted: i=1; AKwUvBxKF3xFLrn4sAY7DQPAP0qzYJ03KJxjJRVgnrTQ03b/30hqpXPDZWBIgeLMuL848r4ErLvAryhsHNGO7aI+MUPD@lists.infradead.org
X-Gm-Message-State: AFuF++kkKKMWLRQZvVfvOnU/a3aWrsMxpQ+9f9oEeYn2ZAJh8wdawGDc
	yLiJPpd3nLSJWudZc6RRjlsRTF8+9A+mrBXMlp41qzQS90XktCjmeg64
X-Gm-Gg: AYBFou33ISS9bcYdwo3ZKHutVX2q1Zw0naq7f9mimyHpPVvOGfhDf/aD79X//an9Nyh
	zJxbebQLxz2ZTte9zf6IRqdeZlgjC4BOGNv6YqAOHVwTdQ04WULyuSFgsm19Ab2Itgrc7KcWDzG
	EzniyGbQBc+/ZQpWVdumkg1BMg5QUOUtBC43BoY77xQ4LEhXoqRcAmPuTA+xt4D0bxJezuT2d8E
	5TR8YnGVbg0148ZZqxoHXKTaYMmWOa54GyHqP28zmePD3kUIgyeZpXoJNQMUd0BrjHCuyAkKPsL
	u4SIBSHFYx0y1JvWzbEbO02nZT11UWR4cNmqtZFlNhOm5ja3YB5t08HcG0WX4KnP1wIpzcSxWb/
	gM6i+ciInAHo/At/NySTWDMUvG/zKm1lASl4fcNQJri1R/geFcAg5+49U1/jGXHpksfqDO3JXho
	yRwL+O1Mt+EeSvAja+P8kxN8tc1yILswBMeqYcx7EWh64tOLktvxHNjQ05kv/mYSsppp8Y5qj84
	d9njG6y9/LQAQVMucAmdww6l1DsH3Op4KZJmQ/8hiJWXPoYKLHELoAdguVFQyBpSlLdvTUVGOV3
	srpF0hnINsYdZfN9KxwonNPOI0nQBPa/ha2o5Q==
X-Received: by 2002:a17:902:f64d:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2db125c83dfmr131050775ad.1.1788558615405;
        Fri, 04 Sep 2026 14:50:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cb5f0sm14512185ad.67.2026.09.04.14.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:50:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: actions: owl-pll: cast delay to unsigned long for uelay()
Date: Fri,  4 Sep 2026 14:50:13 -0700
Message-ID: <20260904215013.98283-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_145016_521190_0C3BA578 
X-CRM114-Status: GOOD (  11.56  )
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

The 'delay' field in struct owl_pll_hw is u8, but udelay() internally
compares its argument against MAX_UDELAY_MS * 1000 (2000). Since a u8
can never exceed 255, the compiler warns of a tautological comparison
that is always false:

  drivers/clk/actions/owl-pll.c:189:2: error: result of comparison of
  constant 2000 with expression of type 'u8' is always false

Cast the delay value to unsigned long to widen the type and silence the
warning without changing behavior.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/actions/owl-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 869690b79cc1..5e30ce35f2f5 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -186,7 +186,7 @@ static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(common->regmap, pll_hw->reg, reg);
 
-	udelay(pll_hw->delay);
+	udelay((unsigned long)pll_hw->delay);
 
 	return 0;
 }
-- 
2.55.0


