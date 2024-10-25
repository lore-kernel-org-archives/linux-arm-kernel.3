Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D26D149DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUMbW8c4fnS4xc6t+S+xmsFii0Nh8WSEhqluNBn7tHo=; b=xhEdL9EEn3GE5RKCaRDGu1STNc
	/sXNchD9N4/pn7H/DFEwiy6XnW6bqbJkjuu2Jvfq6M3rEA/dzzgAPW8pnYzFwCS4avAsUh+ViKCEc
	p61MsGqN5mDDWDasgluuXiu6hzzM3wVOUKReB1xPmxS2EydN8EwzSqW/SISmyCsL/T9wil+6PZ5o1
	X6KAuRfq1/GrKHeK4BR0pIG50T+oVAx8GrcZgXfifPc6fLpmlLyvh68Gs4lPZLElDHF101dn3WSqe
	7h2gCImQ4rSObMKGW4A1J5LmYQNyIfX4+pQ5si5Yzlply3eXr6TztkJBL2Wkhl1t9JcE3VvHMQdUn
	9sxizkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OZO-00000004hab-2Hcm;
	Fri, 25 Oct 2024 17:57:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvN-00000004Y4I-2NuU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:35 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1498935f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876592; x=1730481392; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUMbW8c4fnS4xc6t+S+xmsFii0Nh8WSEhqluNBn7tHo=;
        b=gI9slTr6DaAkzAEzQlBKHCRNq6HaxFuUdpZhoIz0hTLfYXFAIHQCYeXnhvlS01AcMJ
         eOJnHDu1Ho48pyR3nkUNDAUYr6TuJD43dglTmIi4laP4+e60k+Dd6akYhtC8xkEcoXeH
         ssmqQWN2uBSLzlbCWln3/qVfYwU0sLi8nvzgO8ADIf0pCozcG8iwfNaLT0fpoCJv5BJ2
         C2WTTIc155/vj+xK4G5DBcsLMHHiBbKjE3u26BjkSB3rdznDcY067lYy+UBFog7GJkLw
         TkXQfqzWUlzk7H6or4CxYGteN3gBtRR1xsEkKSsyevy0aFysE3/zLrrvgmSDZWKCNRRs
         5zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876592; x=1730481392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUMbW8c4fnS4xc6t+S+xmsFii0Nh8WSEhqluNBn7tHo=;
        b=xBhlgfs1C4HLeHFvnInuy+sYsGbXfL6Cp9FJcxSh9DTBa3764hXiKD8G8QYHSpjKs+
         Qu/kQC8CSfkfR/kFWh1T/hIvB+qsooou5KhcuBuN9D1PQp5FxtLqAZEgmdimg1yMqHUS
         UIpcxoZy5wmpIGa45E+eRmlqRIvXztp5jbE70VJC7cHkxRy2wfOnguvY1ztc9P4ACQnq
         wR9NKACiCpiFG/dOrGa1MWenzeguffAIDbD9bweEHQV0uc36gQ0E8vu9EKhSRBEBZ7Rd
         GZSnOYi9vfIVYCq+Rvt9XZwWAg3obm5rSJkH8MpJ5oqtoe8jvnNq/cEAAatwLm9zKHmY
         hDWw==
X-Forwarded-Encrypted: i=1; AJvYcCWc/ZIEBdoD2Zl/BhqzaxgeaVJ2hxn+Y8PefHGJQISFHYWLWJioePkSdDyNkAXW4jJSA+W5tDUi7z8ygPKv8aIX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7+3VF9CkPStRigvlBhdQD1PaVJnSu4Obhdjz2hhAXVStrkuab
	u9azLwRYcyi/53/cWdP2Ws+IQIFk5/XebvmUkEObcVR4Uc5BZv2Lf55Cc9crSqs=
X-Google-Smtp-Source: AGHT+IGlWiJn7Ozkgg+McXgEdyvgzuVLywKtK/tT5oVLgmb42gKrNvsGZclRa3uCRrKPuzJCn2aCmA==
X-Received: by 2002:adf:9bd4:0:b0:37d:4e74:687 with SMTP id ffacd0b85a97d-380611e1392mr111275f8f.41.1729876592186;
        Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:03 +0100
Subject: [PATCH v2 32/36] clk: bcm: rpi: Create helper to retrieve private
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-32-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_101633_719126_2D6C6DA6 
X-CRM114-Status: GOOD (  14.99  )
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

From: Maxime Ripard <mripard@kernel.org>

The RaspberryPi firmware clocks driver uses in several instances a
container_of to retrieve the struct raspberrypi_clk_data from a pointer
to struct clk_hw. Let's create a small function to avoid duplicating it
all over the place.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9f716b2223ae..b12d86720207 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -56,6 +56,12 @@ struct raspberrypi_clk_data {
 	struct raspberrypi_clk *rpi;
 };
 
+static inline
+const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
+{
+	return container_of(hw, struct raspberrypi_clk_data, hw);
+}
+
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
@@ -176,8 +182,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -194,8 +199,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -211,8 +215,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -229,8 +232,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk_variant *variant = data->variant;
 
 	/*

-- 
2.34.1


