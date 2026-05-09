Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF0DCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 01:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJhfFQR9+98S4XKgeWbqpNJRqJ3OzaJN3o2IixMMcYk=; b=bbtazQiNvCJ2D25Ffs54PcQ1DF
	06uzXSr2uJDnzChfL8u+gAMJy82AGhmxFUzu+AIhpcLEAlWMiEEf8bL+2qZCIoBFWNWV099O1UNJ+
	9dfP37v/4U/tKJ5hzo15RY6kHiPK3qzB9sPsmfbggclpvyRcrKO2d8AmoNZa6aytVifQ8aGTOZo0T
	ke3WRWIUAPE+SZEIYNAeU+nDnK1bnI8SKZ+ifAbRmEGL0RZ9u1keF/CTqKO3URSJH6h00rSRrHZyl
	JlZcI5947IB7ziWGxV1V/p1sXpCijvPOgeuFH9nzBtR24wZ468WlyFcDVG9ghLFUB73Ng2UjcIKOA
	MxyfymNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWjL-00000007vN1-0JQI;
	Sat, 09 May 2026 01:43:47 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWjI-00000007vMV-0WAZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 01:43:46 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so6749201eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 18:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778291023; x=1778895823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJhfFQR9+98S4XKgeWbqpNJRqJ3OzaJN3o2IixMMcYk=;
        b=MaC2pHjRs0doa/xlKNHy+fnDDBgwkclLvjB/AKQW3fmk+POPhvwUjOHk6asgUCUCI7
         vaHUj2awIn3H+xIZC5KOWX3Lh8p4tAjpdDDq9qisU5m9/EEDqLc35EIppnFjERjBqkJN
         agkiY1TdzqZGdQP2oec5eCfIi1Uk4hrZdSGht071f+HwDk2IzlAAWyeSgtKvLnEs3rJH
         kkB6S4ENueEFBPXJXjyYkiCGZk8tzF0JqbQJuprYgKGQ+nPortKieDJkLz0k84idqibI
         eSJNTJb01SwiEXP/hADSocqH33XII2YzgsDOPlHeOJok86TgG9Q0G7juTsg31WXwTVcY
         Ni1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778291023; x=1778895823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJhfFQR9+98S4XKgeWbqpNJRqJ3OzaJN3o2IixMMcYk=;
        b=l47VGUn+INIOxhwSU/fQZpv6b15ca0XmqVoXeSWQiW/0oEiWbvzKfQMGXxx6R2QB44
         o/qtkaVWpmKKI2ICvADQmI/e23SBVHjrriFlS1ZUJVtz+lohR+/5KzDcnHkst3RHvl8z
         27ql+kf9964Xs/DsgQHzblAobfJ2J+CeEzTY7yGArk8StegCWWfiVgApT4+0XbLdZX4S
         6VVffGHpAq5gvPRRI+aTtkn+TMdsY8JUFaYPbeoEg7JTz8p0h0JkGNpCvgv06uhJBwhD
         fI1Os17kBiEJSIYAufFY5+MYNjBr/XKHhImeisQjUsPc/CTytRwfF+bs9fXmvpHqxSKk
         nb/A==
X-Gm-Message-State: AOJu0YzYUWW2fk5pPskiFucHrFVW/LUmn1kUTu7IR+CPUJXJ6/uLIqYp
	gYBGiIH0nbAxVp47qxmMyIQm8rkWqm1n7DpEMERZVddSa9TG6ULTvuOiewD7myopyyE=
X-Gm-Gg: Acq92OEtHB7+Z+qx3VMDO93YY+OFlnuAfT7XQdQpiCEysmHkyUekU61wcvLr2OHv+YQ
	b6egrVozbV6rKCxyRHFD8tTO40flb3+JJxxdYbWc7PY410M7706Ea+CWGsLhu9e7XxRO1Pi2qTI
	B+c3NKTx+U+oABLnQOLhLLdoY5EGnUmlhsQzNTN91+SZC2Yuoa6d+wM4LnHPzJscBH6o3olPEi+
	dhIeSMcWTYpJVSokwkMXzTJQwWrQCzI9E3+KB6i5wK1SpSnx+7IweDXC2QJCETL+8fDxyxghxRd
	RBrUVfIWI/3HWR7s7idc1bEabEioco3eJh+otEz75kvrt/nL7G6lWwIU90UMVPTciW6MysaPl9F
	C6VQxY7i1/fV6bbdh6Ru/9UC/GkShdPfD85kTx8h2pHjrOphRfr+w8Zv+fSGjYXtgQafZ169YzB
	t8ttse6Wyt8+C286IIsLKQqbw7jiQRxN25DLnh7zGsswUnbcPH5257oj3ibw53MLN8YlpQ6V7V6
	oV8Ab+OpOa7aFRL8S9+2S+7pMkyV5deK8S3KCqg0AGf+47LCDetXarR+1TljlhvKVSt6mH3zwLu
	5bMtwuZXcieZlX+Ebw==
X-Received: by 2002:a05:7300:6da5:b0:2ed:e12:376e with SMTP id 5a478bee46e88-2f54d67a686mr7456372eec.30.1778291022819;
        Fri, 08 May 2026 18:43:42 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8893441absm5991640eec.31.2026.05.08.18.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 18:43:42 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Jon Hunter <jon-hunter@ti.com>,
	Benoit Cousson <benoit.cousson@linaro.org>
Subject: [PATCH] mfd: twl4030-power: fix stale ARM machine ID checks to use the DT
Date: Fri,  8 May 2026 18:42:46 -0700
Message-ID: <20260509014246.21649-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_184345_013990_02DB3EFF 
X-CRM114-Status: GOOD (  13.71  )
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

The twl4030-power driver contains two checks for ARM machine IDs via
machine_is_*() macros. These checks are incorrect because the two
platforms concerned now support only FDT booting, which does not use
machine IDs, and therefore they will always fail. The legacy board
files for these machines were removed in commit 1b383f44aabc ("ARM:
OMAP2+: Drop board file for 3430sdp") and commit e92fc4f04a34 ("ARM:
OMAP2+: Drop legacy board file for LDP"). To resolve this issue, use
of_machine_is_compatible() instead.

Fixes: 678fac419382 ("ARM: dts: OMAP3: Add support for OMAP3430 SDP board")
Fixes: bd5fc6fa657c ("ARM: dts: Add basic support for omap3 LDP zoom1 labrador")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/mfd/twl4030-power.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
index 0bca948ab6ba..fc1cf316c236 100644
--- a/drivers/mfd/twl4030-power.c
+++ b/drivers/mfd/twl4030-power.c
@@ -30,8 +30,6 @@
 #include <linux/property.h>
 #include <linux/of.h>
 
-#include <asm/mach-types.h>
-
 static u8 twl4030_start_script_address = 0x2b;
 
 /* Register bits for P1, P2 and P3_SW_EVENTS */
@@ -294,8 +292,8 @@ twl4030_config_wakeup12_sequence(const struct twl4030_power_data *pdata,
 	if (err)
 		goto out;
 
-	if (pdata->ac_charger_quirk || machine_is_omap_3430sdp() ||
-	    machine_is_omap_ldp()) {
+	if (pdata->ac_charger_quirk || of_machine_is_compatible("ti,omap3430-sdp") ||
+	    of_machine_is_compatible("ti,omap3-ldp")) {
 		/* Disabling AC charger effect on sleep-active transitions */
 		err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &data,
 				      R_CFG_P1_TRANSITION);
-- 
2.43.0


