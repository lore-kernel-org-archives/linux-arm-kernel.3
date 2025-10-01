Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58994CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VPbUyi3Q3nq8aPmPA0ZDBlB+APZ2KXXf6wjKaFOxmBM=; b=iWimEUj+NTZ2pfsVlymiuWPDIF
	I9oHEHsi77tgjuxZiblJZzedjesWPwX3igWkSi/qqUKr5gKtuJXsWUT9qvAbTYl86lQDw/pW7v2Lr
	7jxFdfnI/Orls4xMdQhHDNbn1mI7gRyQ2nDr3quatcp0AgfU8rCvGSAJ8L7chf5Cl8yyUwDgdb6PZ
	f9vv0acSPcyNVMxeCiJogwD74tTlBOkDy8aIpCrowD0ImCD4RWnLj3euhFe1fF+3nEiRRwEUgpu9m
	artcGor9PhMxifp7XxZCpy9BovfFKt6heb5mDuH4VLZ33BG89aa1gYXkzxZULA12j4roPUbfvUCHU
	FQBNpG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3q3Q-00000006lk4-43Ap;
	Wed, 01 Oct 2025 06:11:08 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3q3O-00000006ljO-0kWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 06:11:07 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5797c8612b4so9577956e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299064; x=1759903864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPbUyi3Q3nq8aPmPA0ZDBlB+APZ2KXXf6wjKaFOxmBM=;
        b=lMLFfSLtJNRsZb8HS/0Aj1Tq73QRwepMRgGK9/BMUlfvvxvXkx74hUmLHlWeIOHDyC
         SH0C5C4wSqPxflO6mYbcNUAKdK8UCAnisur/cfHDSRYYAGlcRVjPIcPBWIDgOyZ/Ujye
         FUGYTLZhdN2eNQSAOZ6HY8mkYBZUVFHe/Dl40xOLfJR+zuKGSg7Y+QslNb6TM2Whez1t
         QGJPnPdlRJHZjXpOzjppJdB4Qsg6ShbT7B9f4uFuL2Xoq5xGjq3GjRIcbzKyVgnkWTLe
         goC3Qv1RVIzc3m4Ho9bCOiJqwjJEX/FgwBhmXjNT9sFdFA2v5rOLhpTzbyc+NRrNnfK0
         ffWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299064; x=1759903864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPbUyi3Q3nq8aPmPA0ZDBlB+APZ2KXXf6wjKaFOxmBM=;
        b=cd9LDyCocPrWZXemLU/DuX0Hc9gaz/lxDL/zJ1vtEqxFGz6sNewdbvmBxmyDe/bxgF
         O+YaTZwxuO219MZumniiTrfB0+Z43u6GM3xQiIQWc5pLr9cZeasGAwDpyVZhH/kcPVHC
         W8+EBDGZMeZap88LalvoPDx4DzQjCP149UkBj7L9LolGbHzAJjuap69ULG8AI7dVxBC7
         4jNhMBl9hgpk0liz8HT7MJNpFdcxxIQTNXqPU+ppMOCXsL+if750s9E4eKQJVCoaKR9o
         Ws6XjvRzzKJFG930mtGj2B7/oQwJ+XIhyBCSfFvZoQaO949/fDvSCGaLLebtiT+B6O9r
         XVgw==
X-Gm-Message-State: AOJu0YxCVDrnjygkygfqFAvG2zuSAuru9/xXYg22UnQCzEkfjvFskYRY
	iFSk64uU+bioFbq06xMUYE+SvhYjDZ4U7MESxKdnAropH1EVz2pDtz1gMHLWEw3H5Ho=
X-Gm-Gg: ASbGncsXyDx7TycNqUfSzgGs7q5cmXG7Dn20ZMZtHsI9lrYItnyYjfI/MueF3CVWHMR
	sXGW/jU3vRWRvy4uE2MWDpv1W44tph5nBNV9Iq4Xg0DT6kVNqmI7QyvUOWQiXQFj/xQt9EXClbo
	V6QfFa16sflgIAioC8QclGW0bnzSSmSTSxh1DqhVqfWvm4dhj+bQkjKYlKky21VeOR0uekVe5Ij
	O/3pAlWpFIrhR/hOJ6XUEwVjOSXasYsHWEjtB1ClIP1obD0vZfRPqrQFHFFN5SoPUqrS6a4l4Hn
	KaaTkx6uWpSRQmMytAPXHdAaRMgfBtsBig8m/yPYp43XNfHYblL/DKwJGqvJ+Lw6v/MpB1FQ+pH
	wvBjtNmjpuaMQCDnaFv/475s9sYzzbu6nTLhFy+tdDFS3r/L1
X-Google-Smtp-Source: AGHT+IGb9ywHHlzO/N5tYvmZ6pYH+F27XDf42oZw/2wC3QwlBrNCQNAD/c4bdpnGO5yInEix5KS6tQ==
X-Received: by 2002:a05:6512:ea7:b0:55f:4b01:30ab with SMTP id 2adb3069b0e04-58af9dcee09mr665163e87.0.1759299063818;
        Tue, 30 Sep 2025 23:11:03 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm3984553e87.43.2025.09.30.23.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 23:11:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Brian Masney <bmasney@redhat.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: versatile: clock: convert from round_rate() to determine_rate()
Date: Wed,  1 Oct 2025 08:11:00 +0200
Message-ID: <20251001061100.372737-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_231106_409991_EAE6DE93 
X-CRM114-Status: GOOD (  13.84  )
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

From: Brian Masney <bmasney@redhat.com>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this patch directly.
---
 arch/arm/mach-versatile/spc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 790092734cf6..812db32448fc 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -497,12 +497,13 @@ static unsigned long spc_recalc_rate(struct clk_hw *hw,
 	return freq * 1000;
 }
 
-static long spc_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *parent_rate)
+static int spc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_spc *spc = to_clk_spc(hw);
 
-	return ve_spc_round_performance(spc->cluster, drate);
+	req->rate = ve_spc_round_performance(spc->cluster, req->rate);
+
+	return 0;
 }
 
 static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -515,7 +516,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static struct clk_ops clk_spc_ops = {
 	.recalc_rate = spc_recalc_rate,
-	.round_rate = spc_round_rate,
+	.determine_rate = spc_determine_rate,
 	.set_rate = spc_set_rate,
 };
 
-- 
2.51.0


