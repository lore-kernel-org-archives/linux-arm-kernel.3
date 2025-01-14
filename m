Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20852E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4rykRosxrDs/XntXu5KrgDY2INQy7eN85k18sGRgzP0=; b=dWwpqwhlLLP77nrZ/BXc1x3Sik
	Wtl4z8HEYA+vkTeYUZdJ8kRadA7SWZLnTlzpwDcztsNbbJzH6qL+fgAolQ5VFjpU/FBUVvhqHZJOi
	D7Ip5yAFYiZlyjrq5kmCeHylOqJzFv2nqiSoHdulfKhfFb3Sx5MHrJuJ3ItZ7VbHguqemSHGXL8Xq
	FD26NLBgUmvWalYhAye039ej+lah+hlID3n8SipHp395KTYnoDCxq+5Tru0WvES4Zbp2Vcy/L4tI+
	0FcOOHYrPndVJApxu8NBI59MvReIPJfCz7EXf+DPNBdPiSS8CWsMzlqfH6sABVuYOjbhRjtxqhlZB
	ILrMfHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXefA-00000008BZo-2hZ7;
	Tue, 14 Jan 2025 11:00:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeat-00000008AjA-0SWX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:56:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so964257a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852181; x=1737456981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rykRosxrDs/XntXu5KrgDY2INQy7eN85k18sGRgzP0=;
        b=fNqzm53ZIhZ3bcHu6+gXccXHIipnAhvyBP6WekhYqUS9BITRETwt0jSW13vrmTWM3w
         3W+KGAZL68kkYfsVv2xD6130+KJ5y3FxMMeRWRxJ7p6SZ7exXK9APUkERs0PUdjPvXuR
         ddkTJD/DbbYTBtTwNfMy8U4jIDMWKXs/pi7ZhhJLRgc60Ni+XoTzJJPf7SC+oR/C9sGB
         en/NdXfF2GofX+Lm6I6obZJkD4zyeWuNCrsFpgoHmYf54k975EBKXtwkrWsFLrqwO5ex
         QXWcgDq/WBSeqKiI14LRNkDmlh8H0BfW63yE7NTNhCmr7EnX4k0J1cYPXxCP0m8oPV64
         Su8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852181; x=1737456981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rykRosxrDs/XntXu5KrgDY2INQy7eN85k18sGRgzP0=;
        b=mxUDbo9l9tSh/mG/yXUrVtUdwIIKJmlygd5H4RfXsGa3VnWRM4/UY0AqMNSsBKiXFN
         lYIklNbNqjH/W9i+sdT0eLhbm/TsFSu/BvPtlUdmM4F/XC9gLaUENQrYBbmpOdnHsYyE
         +SO8uSdOTfPm8o4YmVnMqMc9xu+5DYT56FzDaUkVX3UlBUxDZ4uL2i7uzOGjkxPV7dHt
         PhPujpl1QDkZIGngmORe9jzI5g8+LMNfP+Rs4cIFfp9zpqjKIwj8T1aHFEP906zaDVYK
         rUgXd2P1KU4bBA1hcjYyy0BtP6yU7E7HZ+N4k3IpQgIbUl5FTtttsRhffA/0LaClNmUW
         C9CA==
X-Forwarded-Encrypted: i=1; AJvYcCXcyNc6KGIpbbYeRndN8YzJbfEld3jd5pPpkdjT7N+UaOOkjcATfVvUOwy9b1YDoBtbmKXap6VLbwI2o+XAtZo7@lists.infradead.org
X-Gm-Message-State: AOJu0YxmKhmuBTjaoeMiNlGWVFfdreX+4BFGgab0ZxLxOK/HmZymmnkZ
	TwixlqVHgot52aKSBljdIewMtR1GjM4BHz1zBwdm6wDXGLE6Dz4A6/fD27t4LrA=
X-Gm-Gg: ASbGncu6sQV7ylX/Iim8bEbJCqQUjRfWNoxlDnFsXIXPrH6xD6OPdk9zNA3FTqO9nhE
	4Y9qj7qRX5TF7rFIlS2mpwEM+2ekqqWEuuqVy5xg0aIQ/2j+Nl3NRwtGGxp72RyVd2Bqm4LLJBI
	ND8tiEuKii6zotdXxTctjr0t+M+2I9WD6oyl8kQfLfOA0qVhId8Bhdy2k5Z98Uen61//GrOwgEp
	Bl3A3WTuCp1Zr4rfTVDQIno0G4IVo38G/hp7hmkQxVZVDlXhDD9NnpELIh7ufhVTBX/2rU=
X-Google-Smtp-Source: AGHT+IFVeBR38XvGrfM1ABZ8o3cSy39ubNwiQmJTMlI/28V9aP4xs9GINfaB9e0nRKdDsH7KYOVo0g==
X-Received: by 2002:a05:6402:1f4c:b0:5d3:fdf5:4b28 with SMTP id 4fb4d7f45d1cf-5d972e88f88mr8233931a12.10.1736852181413;
        Tue, 14 Jan 2025 02:56:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a40e8sm6118257a12.76.2025.01.14.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:56:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 11:56:18 +0100
Message-ID: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_025623_150917_38BAFEDC 
X-CRM114-Status: GOOD (  12.90  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/bcm/clk-kona.c  | 3 ++-
 drivers/clk/clk-nomadik.c   | 5 +++--
 drivers/clk/qcom/clk-rpmh.c | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index ec5749e301ba..2b0ea882f1e4 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
+#include <linux/string_choices.h>
 
 /*
  * "Policies" affect the frequencies of bus clocks provided by a
@@ -502,7 +503,7 @@ static int clk_gate(struct ccu_data *ccu, const char *name,
 		return 0;
 
 	pr_err("%s: failed to %s gate for %s\n", __func__,
-		enable ? "enable" : "disable", name);
+		str_enable_disable(enable), name);
 
 	return -EIO;
 }
diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index 06245681dac7..f3a73ac5a1b9 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -17,6 +17,7 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/reboot.h>
 
 /*
@@ -116,9 +117,9 @@ static void __init nomadik_src_init(void)
 
 	val = readl(src_base + SRC_XTALCR);
 	pr_info("SXTALO is %s\n",
-		(val & SRC_XTALCR_SXTALDIS) ? "disabled" : "enabled");
+		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));
 	pr_info("MXTAL is %s\n",
-		(val & SRC_XTALCR_MXTALSTAT) ? "enabled" : "disabled");
+		str_enabled_disabled(val & SRC_XTALCR_MXTALSTAT));
 	if (of_property_read_bool(np, "disable-sxtalo")) {
 		/* The machine uses an external oscillator circuit */
 		val |= SRC_XTALCR_SXTALDIS;
diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 18de31889525..c7675930fde1 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <soc/qcom/cmd-db.h>
 #include <soc/qcom/rpmh.h>
 #include <soc/qcom/tcs.h>
@@ -206,7 +207,7 @@ static int clk_rpmh_aggregate_state_send_command(struct clk_rpmh *c,
 		c->state = c->valid_state_mask;
 
 	WARN(1, "clk: %s failed to %s\n", c->res_name,
-	     enable ? "enable" : "disable");
+	     str_enable_disable(enable));
 	return ret;
 }
 
-- 
2.43.0


