Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4F4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEjv4F6KSOcClNbcVqHshoCAEKi/vQAT9lN/7mgczII=; b=yz04wdj32Gtq23D6lE+JwyCBaQ
	tVhyaxt954frtPtU2H+hNBKiFyH47Q5MwCfw/PPO0dm1kEsUNL5LEmdu88joUCkoa9Sb6u0OGD0nf
	U3r0Tt9DV0YK4r/z6iGra8eP+tX5asA0uskTuihRyqFXWjkm8bjOZR0fB2ii7YaQs2EfwWP62z9/h
	beSlTLxRFZdzy7IpbTR2V5XfXvXvf6UR/Es0ousIEPuMDSXH2XeZpTrbbdjG5GNl2OPwG2lYq30Jl
	4aS85LfxpdUQM9y6DFuWIklypcfBUjw3I3RK9grcI572xBHffTZmZpurHwZvABsFCmNnIURJG3Dc+
	0dmmdnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9s4-00000006j1u-1gCI;
	Tue, 24 Jun 2025 20:03:56 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8CC-00000006Uc7-18Tp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:16:37 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso10425249a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788995; x=1751393795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEjv4F6KSOcClNbcVqHshoCAEKi/vQAT9lN/7mgczII=;
        b=LFzzc1DLctuO3lIQQ40OYc68kgQWq7YcBAcxKgn/KU4wPRBtjG+ckiWSvycv577DRT
         9/rzXIxmbKNhlxoUg40YSlXk6xU+wLi9kgKvXJeY0ysAjqTuvFLkd2qBz7m3gUflejok
         zp4tlJS6N4Jdep2fYk9V3AyWtXL0qYnku+PqDy/Qb63Wm3TJFZt4Wmv/2s3P+lNuBQiD
         ni2lQsHjIoCsg55BHMPN3gfxobuYdUrS5Ibt4Xha6P+lvTZ0rXw31Uf+qu3EwFAMmtCr
         SJvFA0updJuMoQPHbF2NepHQIuV/8U3zZqTmY0YOAZtY1iAJKKDwmGABbbs7Q/J5X1aY
         TNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788995; x=1751393795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEjv4F6KSOcClNbcVqHshoCAEKi/vQAT9lN/7mgczII=;
        b=m7YVBCggOEdSjYCGI+6yZypLKajrfslMk/ExFtVvHkcRK40tpuR7Zg6LiebLL6JPJw
         nd13Ly73He6KOe2EFJ+LKHhnybHF1dOHsywrBToCxfz7GJC3CPZhYQk+nfovQa9monqM
         cRWz7VmL8JzxrbE9VjqJow/9yBKZNAbXMqYXzyXxbIovzZS0n8Ur114Fb1Eo1wQeAzLW
         I7evqUX7/mp9Gi5oQ8PqC3ASm95rsZiBd18r4AqQPnOF825X5AZJyezzfQhP9pqPbsKR
         imwgv4opdUvwGZqsDdFAq/8lyRekNSrDZx6nYLsQY3YEo/TI446k868rDlvv+Rel3LFR
         xeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/pvUyQHgRIhiz/2MQVrYSBJ89KDZMvyZ10HZ4mUrBPOnsdZ4MvooBWE5NXeM2HVzxy654jNZQ2GOGvOrZgbLP@lists.infradead.org
X-Gm-Message-State: AOJu0YwhizZekWXQy7hYpxn7ivbnj8PjUbbJfera7xG4mHUwujevJPrv
	VpjtwIfJHrgmc9FU29gD576lXqxR/o/XROVmdgwjZJFEbDJ4h01IormZvSZht6exY5w=
X-Gm-Gg: ASbGncuCJtPtCRzPnhw9a/Ioy34NG76SJCXDMWjYvelqW6g5s8G2j9AE4zYUG10ezgm
	WfPbPP4TosXxZv6vsOxhhaZ0bqific5xINeIO+kv2XX/4YZ0J7rfY+kAjL9PI6GGh4U8rb5T9kN
	wmciqVM12TmSNS0LSC5YqX64P/x5VvM/Er19FtE8/zNkX+YtGVn7Yugr3+BeGn9q0JJYA38znkl
	UdiiD8wPIeSWDEUKIdF3eaqzl+df7pXHUEw0qCERvscPwmtXaY+dBTlyz5hKbQCByDrk+xp27hq
	hF+Y2iBaQlBcNMu8q2Tkts27kR2D8VriBjAOGghmiUDg4bsjzaSLgKfvUt/6o+9sbu0=
X-Google-Smtp-Source: AGHT+IEBuy6MlT6u62EQdRkXXyLoqvydf3fc2sW2sY8y/XmffxoA6g93x7kLpzH/nKHARpOTaVXeag==
X-Received: by 2002:a05:6402:2787:b0:60c:4782:e4e1 with SMTP id 4fb4d7f45d1cf-60c4782e825mr471973a12.27.1750788994579;
        Tue, 24 Jun 2025 11:16:34 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60c2f4682cfsm1357564a12.39.2025.06.24.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 7/8] pwm: sun4i: Drop driver local locking
Date: Tue, 24 Jun 2025 20:15:43 +0200
Message-ID: <87b71c46b82b787959f0cea314d3010f16a50a29.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=E/uUePM7a46y0UkgtyPdkbBAs51qHEH/jq0OTlEoicI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWuthUg2J6w2ChMNVvit4yXPA5cDRrT0c/S8gW 4HHQIQNG0aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFrrYQAKCRCPgPtYfRL+ TjNGB/wO0hqOPlv69u2jHFp28EXbuBIuakfzbJR6Kdu2hu2gfU/7Osac8aAdtKXPA98M/zP3KSD zMVYhpn+mGKi2Io57AJuIcfNYVQSZUT3CqXf6QAQmeXAOFxCi0g1nE+wSUIsN9NJyIC6n7+65Xq O27FjJEQrrhrNDzXNvGfWJn5O2hk0Hyfi/t5aENoWcy6sg88u3sPAsgzdHvG9UYOQc/9yjEaR6m /jPX9EWcS7ZewwKR/tZf4MgxzQr7/Ov/S41lh31r7KMi09KVWOV18l1iT0dQ5+UaphXTk4jvKAT yip0E/lVsUngTPdTR+cONqYKBxPOz+Rw07St5K7dzBdJMRtn
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_111636_309224_328A31E3 
X-CRM114-Status: GOOD (  13.85  )
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

The pwm core serializes calls to .apply(), so the driver lock doesn't
add any protection and can safely be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-sun4i.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index e60dc7d6b591..6c5591ca868b 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -21,7 +21,6 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/time.h>
 
 #define PWM_CTRL_REG		0x0
@@ -85,7 +84,6 @@ struct sun4i_pwm_chip {
 	struct clk *clk;
 	struct reset_control *rst;
 	void __iomem *base;
-	spinlock_t ctrl_lock;
 	const struct sun4i_pwm_data *data;
 };
 
@@ -258,7 +256,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 	}
 
-	spin_lock(&sun4ichip->ctrl_lock);
 	ctrl = sun4i_pwm_readl(sun4ichip, PWM_CTRL_REG);
 
 	if (sun4ichip->data->has_direct_mod_clk_output) {
@@ -266,7 +263,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			ctrl |= BIT_CH(PWM_BYPASS, pwm->hwpwm);
 			/* We can skip other parameter */
 			sun4i_pwm_writel(sun4ichip, ctrl, PWM_CTRL_REG);
-			spin_unlock(&sun4ichip->ctrl_lock);
 			return 0;
 		}
 
@@ -297,8 +293,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	sun4i_pwm_writel(sun4ichip, ctrl, PWM_CTRL_REG);
 
-	spin_unlock(&sun4ichip->ctrl_lock);
-
 	if (state->enabled)
 		return 0;
 
@@ -309,12 +303,10 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	else
 		usleep_range(delay_us, delay_us * 2);
 
-	spin_lock(&sun4ichip->ctrl_lock);
 	ctrl = sun4i_pwm_readl(sun4ichip, PWM_CTRL_REG);
 	ctrl &= ~BIT_CH(PWM_CLK_GATING, pwm->hwpwm);
 	ctrl &= ~BIT_CH(PWM_EN, pwm->hwpwm);
 	sun4i_pwm_writel(sun4ichip, ctrl, PWM_CTRL_REG);
-	spin_unlock(&sun4ichip->ctrl_lock);
 
 	clk_disable_unprepare(sun4ichip->clk);
 
@@ -456,8 +448,6 @@ static int sun4i_pwm_probe(struct platform_device *pdev)
 
 	chip->ops = &sun4i_pwm_ops;
 
-	spin_lock_init(&sun4ichip->ctrl_lock);
-
 	ret = pwmchip_add(chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to add PWM chip: %d\n", ret);
-- 
2.49.0


