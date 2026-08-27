Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5F8C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=; b=gaXeWUEjfUGP7Y8Tf/EV8EJiFb
	w0skroY4sUKrllZZ7hj3RkkXNpGzNYIyaFiFhna4pcjP+h/CzsjkiUt4Zlk9igUuKrQ98RXJmRao6
	RRhezbJ43fISD5kdVoM3XuPHqZhtkvywUKu5pZ7NbbFrspET/rDFVNsmb3iik5POCOlLVBeWSey5P
	l5b/Y1b6fY15haXBIAr+FjwOnmLRBGP5OSMJjoKVGg/bDZ5OEe2sXexz3RE8IAm8XRKxMzrav+5D7
	ipClLtCeUIZorooCZ5KKsClgQBZZPcx5z05D93yQlsc7/W9GpSLnHRtsrmrsABYaccp8pAfO7wpkO
	0rb2uyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXnp-00000003rSu-0vSb;
	Thu, 27 Aug 2026 10:57:49 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXnm-00000003rSA-3xtX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:57:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-39675172593so1810554a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 03:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787828265; x=1788433065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=;
        b=A9NlXGA+a5m4U3EmOblQ8ZnDhLBJxodUenCXXuyeraPnYaGPCN2fMBDwFwJjCrp/c9
         GzykveyFm8do1mnwPF9nd3lxUS27S0OO3ksHX+j+io0PYKagagEcBoJMs3AylROQvWm0
         qX4gLdjZdHNeAEDS06Uvenoe4/6D5yF7vMXKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828265; x=1788433065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntmVipoSayOwXs57Kc1THh0tKdh0WN7s/EHA02RtOpA=;
        b=Cph3MqrVH2oDCKF9wCjn7tqKRupZI/EbiIYXV1TnmrdW5QX4hu+IQ1W0O31DCLb0Nz
         bkvFCtX1SnMBjTPCI1TjFKJRUeEnVmAWtHWTy9qQAQ2Ny4CUmowWguyGzytvhYNfFS7Y
         dPFnESeTrLFIltgb/ZcA6qag9UwB7G+cTPG7qVnKaRFAVXoFDlhV9kv9Rhu0KEHrs2tk
         iQJbxR3+MCZEtjFUMZ0X2FhZHjyPUNKayHhdVqgPBLu7f3ZDVtWRrgdciZ2hu7uX0LGp
         bx1Ru2YygtcV79b91A+VslI/OFkO6mVXdFEhUfHVkiC7X7sTZHKrRmz9ybfLnyyKTtZM
         9i1w==
X-Forwarded-Encrypted: i=1; AHgh+RqBoJxMxp2owscQ0f3H5oh6Akssk0JtUrzCcvt31hoxEeLlkvuDZs2w0jqth0p1uZX0hau/QxV16miwsR4MRpdO@lists.infradead.org
X-Gm-Message-State: AFuF++lgT0uEnkWAcKeDofi6AAxorrl6y4LPdSoFpBXg92A6Ez+lCITT
	Bfdzsq7ySClu+8QUYAvCEP8ONflMVcs9bXj6DxnjCTnR1io3PBCZO8JO8BX27jrHhQ==
X-Gm-Gg: AR+sD12emuuGp7RNT08JVHuJW7EA3m8cHZrqG/hhyC3mjLH14mRqjf2rX5AmJ4OuMvg
	0bCnGB/a9ouT7Tq0ZIbhD/+2VNQIrwlvzanjgWQOTtIKjp0c4KQRll88L9wZY7q59FvEeb1vFeT
	e9ScFW+J1sX34pGHdJrbVziOc8qujBP6u91VnGqUHeFfEK8AGlyvyQrKCx4d9ZxPsqxT8KYVtRG
	u2Qb98u4BypCUs0InsasxBPMNGbQsrU7v8jOzK6+3PX63ZkW1hs5YH+C9sr06S7OlrwukwlBKps
	lwJQKtWwlXojeLpGmPuw8Ozbrfu/C08CgUUPM62rgEIc2VBZdaatG91yONg3aWv81fil96AbLAo
	J8/56afJgLFnpivOXZ5w0tzZalht2YGLH/tN9wIeJgQ7yvaD7arfEAOAFDboykv7Hnzt5r9KnSh
	f6YBGLEJR3b517PbsWV7zIbdSZPC+LGxU/4p3ps8s0O+LAsNus4LTX1NnG2xEafcJdw97xbYiKV
	7zlWZMMYO3TgayKkHdCRiZPKz7fR2LPXLAI1Uqt/KXT6K4pxdjyZWW8qw==
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr29645548a91.12.1787828264658;
        Thu, 27 Aug 2026 03:57:44 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:b7d8:fa42:587e:234d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186807bsm2434123a91.12.2026.08.27.03.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:57:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH] pwm: mtk-disp: Fix period readback
Date: Thu, 27 Aug 2026 18:57:36 +0800
Message-ID: <20260827105738.8570-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_035747_027185_52AC315B 
X-CRM114-Status: GOOD (  14.21  )
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

The period value stored in the register is the number of clock cycles - 1.

Account for the offset when calculating the period in nanoseconds. This
fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=1:

    mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
    	(ena=1 pol=0 281500/499875) -> (ena=1 pol=0 281500/499750)

Calculation discrepancy in the driver was found by AI run by a colleague
while debugging another PWM related issue. Check against SoC datasheet
and fix done by the author.

Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
Cc: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pwm/pwm-mtk-disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index b5409e15dac8..68a4512e821a 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -212,7 +212,7 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	 * period has 12 bits, clk_div 11 and NSEC_PER_SEC has 30,
 	 * so period * (clk_div + 1) * NSEC_PER_SEC doesn't overflow.
 	 */
-	state->period = DIV64_U64_ROUND_UP(period * (clk_div + 1) * NSEC_PER_SEC, rate);
+	state->period = DIV64_U64_ROUND_UP((period + 1) * (clk_div + 1) * NSEC_PER_SEC, rate);
 	high_width = FIELD_GET(PWM_HIGH_WIDTH_MASK, con1);
 	state->duty_cycle = DIV64_U64_ROUND_UP(high_width * (clk_div + 1) * NSEC_PER_SEC,
 					       rate);
-- 
2.55.0.887.g758fc8c411-goog


