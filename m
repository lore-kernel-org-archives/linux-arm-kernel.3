Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FF9C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgLz+wxMK3cB0CjJ97zDR/iMoodve9Fd9p0FjX989r0=; b=SW5szKX1DHD2wp1SvvoexMRsjF
	N8AtF80xsaOmVGtzhXoE432FJaOuZjJQS4uX2KvmTV8m+ICN++AItn59aNo+ljx85UJi3lSIQKKXI
	zlTQkXNZx4zvq+a2HonvxNcW3DqdpE6qvF0A9TswffA0ctMYfnJ3GP1nyetcVFWH/zeYfiBk47Ihz
	ls3BkGENqtvxbyXLsdmBAbJ5AGg/i2ckVxI146TUl0ASOqgZ+t8UsH88SDAYIdD2VQFIeweRXsKMR
	sNITOgw6adghVaG9embVMeCngNMKpvy+3sJp5rU1Of12iT1xr7kqzSMEAWO/VeDArPjogiQfj9OlW
	hhI2ltOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32VX-0000000C9we-0AyC;
	Fri, 11 Apr 2025 00:44:35 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Qa-0000000C9BK-3A4I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:39:30 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30c2d427194so13622551fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744331967; x=1744936767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgLz+wxMK3cB0CjJ97zDR/iMoodve9Fd9p0FjX989r0=;
        b=UnwMgS2UYBQe8LDiN8AsoaVg0YoYE1BIMfepLSbLyClwXTZo8YyCvVKU8pru58j2vp
         HZFAOBCNGLphp8RMR/2nmz8g8srHwXnRmdur8ksWy1vRPHU6XsJj9JMmSYuMoHh/u5Wx
         tNHxpVb5xpGxs9cjhVzorCweLaB+06TdMDy5gSsAxquOsYPpoqB5wpPnReQUQB7ew8lv
         kMHSJ0N0To+0zF2GqsaYTUD+MvWmeZf9nDhDB8wgJfLnQULtT7OrXDZ62C9lHHhf+NUO
         5S4Elej7hEEK3GdFOkCmCi9N8IZu4HsgPq2bXVEXvOtIvWbXLrNvDDQFCH51xVTOJ4YZ
         2zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331967; x=1744936767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgLz+wxMK3cB0CjJ97zDR/iMoodve9Fd9p0FjX989r0=;
        b=oLUBqIpq/2aB6NmodfS/cINBhKN+zCTOT/dtGuOIkLzST9QLHvIXaZhh4KiSrd5wfo
         wKMTBLZ+rJ1gvVtYzfVDDYV+o9VrmYhUdDwHCIS6MoPXkOzyM6Mx60PChjs5/xLcLEie
         NVHzuInR1MYymCPPeKdhvGAY0GauoA4OH/J9mQafuRMQ/vnGg8AonHJOBIwtHteGew6i
         TPB4az9/fdG0bbaQkcQsU7xYVu2wSjIKZuqq1nFhZAoE6v/+5Yub5i4xRO6K50kjTvUZ
         TE0kv01423oBYTpNNm45ekIBT/hXiGMafWcPMnkgP9qNZoh5hAa0jn3MfXg0HY/Fgml0
         j41Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw2wkw2/ljB6HU8LcqpTWjXTjI07T/IXShOauv4gm6URSNMySIV+/nRFeCzAwkURVUV/fm0EkWXLqYItqZqbbH@lists.infradead.org
X-Gm-Message-State: AOJu0YyJvIQQgQLoCNZQN0r+xeyyrW1c1imFbSbXXgbfEsiGBDEoTOhF
	81q4x7UDxzz+2RjxsPrbF8STdUmsa24DIH0UYTuaK41Ro8zbTMSg
X-Gm-Gg: ASbGncskCxfNTsC40UZyygDVfa4G2hg/FEIWgnrUPoGou/i22blVwd4IPqIfmuaShZu
	JMXjwFuHDwfWhaYddQQhUKjAuv5NrAIIzwpCGQnBgZlR3fw/A+PkeEEXVAcYBI+62rtM8Gatri0
	gc91c9wlN4rJwFr8weYCbZqiPxkzhFi7/cL/qycupQjg5qKC3oYrAQ/8rw9aSWsXRZL6bb1Zch1
	fIV5KWUFAGofJElJBm2kTBUJS73Pyjlr0PvlrKsqQSMXx8yGOGGnaIsTPeJiaGHXQyEpGI1Ady9
	6ryiMHyj3pM81qA97Ft/eU85aAdbyu997gtreDWneuWAFXJO9Ws2lmX9SH0u
X-Google-Smtp-Source: AGHT+IFsLLiiBQI5ZLGY7lfwqEqas7w6lvcmymmKeoSRpIy/66PmWCqCbglM7RpgOnvLMZAozSYyIg==
X-Received: by 2002:a05:651c:905:b0:30b:ecfc:78bf with SMTP id 38308e7fff4ca-310499d40fdmr2095651fa.5.1744331966765;
        Thu, 10 Apr 2025 17:39:26 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:26 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 1/6] thermal/drivers/sun8i: add gpadc clock
Date: Fri, 11 Apr 2025 08:38:21 +0800
Message-ID: <20250411003827.782544-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_173928_792863_AA27A591 
X-CRM114-Status: GOOD (  13.83  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Some processors (e.g. Allwinner A523) require GPADC clocking activation for
temperature sensors to work. So let's add support for enabling it.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..1f3908a60 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -66,8 +66,9 @@ struct tsensor {
 };
 
 struct ths_thermal_chip {
-	bool            has_mod_clk;
-	bool            has_bus_clk_reset;
+	bool		has_gpadc_clk;
+	bool		has_mod_clk;
+	bool		has_bus_clk_reset;
 	bool		needs_sram;
 	int		sensor_num;
 	int		offset;
@@ -89,7 +90,8 @@ struct ths_device {
 	struct regmap_field			*sram_regmap_field;
 	struct reset_control			*reset;
 	struct clk				*bus_clk;
-	struct clk                              *mod_clk;
+	struct clk				*mod_clk;
+	struct clk				*gpadc_clk;
 	struct tsensor				sensor[MAX_SENSOR_NUM];
 };
 
@@ -417,6 +419,16 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		return ret;
 
+	if (tmdev->chip->has_gpadc_clk) {
+		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
+		if (IS_ERR(tmdev->gpadc_clk))
+			return PTR_ERR(tmdev->gpadc_clk);
+	}
+
+	ret = clk_prepare_enable(tmdev->gpadc_clk);
+	if (ret)
+		return ret;
+
 	if (tmdev->chip->needs_sram) {
 		struct regmap *regmap;
 
-- 
2.49.0


