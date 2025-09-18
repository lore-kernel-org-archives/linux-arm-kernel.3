Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5C2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=; b=oHLaw4PQ4RLVDsaeMoPN0XVbz+
	GBEqoAobui1j7uR2ogjr3IXRs74jEIWzYNOHaHot53DvD6+PIkyzrQTJNuhcso8ZHyne/am3QWLoh
	QSC3tCFgDt+6ls/ivNghP/lvnJD0pnC3+T3w3I6jxwRNe5nDDnITTyuxoJEt4ZtMR3Bueh0eaaIPc
	Nvvk38Lff7K/mfIt7jRqO12h95EGDVhj4V8tFK0kZTlAfnqmCs123Rng3/6WW4Z1DKB0HeDkjqEi2
	zZf+sIMRf13Z7/akSKNW2+ismMcmMAvEAfyExYS4QQFuHErTnp52ubv3p17pLYQYfoWgo7E8oRR1U
	Pjn8TSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwW-00000000VxL-2X00;
	Thu, 18 Sep 2025 15:53:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwK-00000000Vmg-1toV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=; b=NN4xm5XrtVfoWF5Na/PM7LjZNO
	DcHeLDWxEO5oLi1iTo1egMPpBqOY2dhiIniDZbM80M428g/b9L239DSeot+6sxkOx9j3ped3+YBjn
	JAL0MdK32w16ir6DhmAJ3MXGJTGhn428oiaAU4FCQ2qHg5cjD4RVDcB3gzyfDJie05QZ0Pi5xkenh
	rrW0mVUJD+FlpMyjE3zwVFRTcyzlWxXH8UQVXtx+5ZaYf0tnNg1b1/72Gjp5uO2YyCXvI/ApZTlah
	j5WebRmnr5R/1bHk3nv8vUdy/txcq0R7oqhoX5ajJNYtzWlJIoEs4YKJ0kyl8sExWpGYZHJI6Mrpf
	+cYQ4u9w==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwH-00000007eAq-0BmH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:52:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b0787fdb137so173092866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210771; x=1758815571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=;
        b=BAhaDYSChIvSy4tqn+5GSvqaJIrNiN4+JJKgYrwAUWrcoTmlEnLz1wTulIbOkuVbGp
         mGNYoeYOUkgM1wvhHeveORa1V3Ew502/RMxDugRzZsKM9b0JbSrpNBcA75adHM9GDw7T
         ej1SI4pTwWTBPlzdic9Z/bov1npcbHiJxK1gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210771; x=1758815571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=;
        b=ZKxcraTpW1LauVQObaZxvzvilzqqQltTZOW0wjN4V9Rx42sEvZpUC+s+r2AZO2IAR5
         PVH5MiZLujyb8LrIGrM2EKXEYt2edvrtaklfyTZPCuZAuV0VL6+OsAv5cDxuXCujS2Vb
         Od7CCLJF2jFOE3I9CyioJcaSxhbrqX4KIn/axpGjtN+phMXVtn5TPI2FXY5SUKiHBmme
         sNB3R6vAJQoTAozwO2+t09LIjxfOysFi39YVNOszSz+z4kffnsPb7AEns61Yb0qJp/gN
         1HCXs4LiTZYLunukE2ohG9dMYf2nIwQITh6oxY3UzaUKyZQw6T8eD01UV7fbEuAXfhH2
         t8vg==
X-Forwarded-Encrypted: i=1; AJvYcCWawhvF+oMJm2jNegc5jxoCgQ026BJPE/MY956mzcspSsEcb6NPgm9kS9U+aES9jKIbBIVSTEJqENiJbZedXyHW@lists.infradead.org
X-Gm-Message-State: AOJu0YxYmkq05SZmUu3a/fxE7fpfSXhpEuSUPeZyCxlgEW8Rxbygywa+
	NDjVGrb1yg7UI+HrkPXgpELlMuO4a9IUK4Le1Lai+MYCZYusUPX0HFXiyrpzElCNz2c=
X-Gm-Gg: ASbGncvRKwCr+X+j2HiZlR6rOiOyP3h4tvkc4zGfnx1N8vEDm2o5r0QHX0agAH3vmAz
	PFJ6MEdD03UMLr5uH0Jt6K3Ei1NRoBU+cMldiui9U5jUmtoFAaMLXGP56NtWezcT20foVWzc9Q4
	ktgl6KJKW1R+rsbuEVlvppl3DK/DYxWJ5MUO+sExe2Pbt2Ug9CgGKaLt2k2+DUcg8LWzRRHG3+h
	Kh51ML452s6PltajHjMBbWHNXoOrxawvfKFBXjEcn9HWHY9/Sme3w8O6yV0hykJdsUsFljkAQ8O
	Ox9d29Z+Ib+YqEXATxJI1qp30tO5tcJWnTchAaRXXEPMw51Uh0fmLVuhuaV7KTFiK/yVhBnrsT6
	s1PPNgMka6/8K7aWOvrWmKztwaiDds9xn6WAn3u41UMLZtYRMO5M14kQ0VRhKXpXbdapemNThkp
	nv9IcaMvoTWXqg2/C55OIJrs76ZShFvAaafEyXImhYDp6E5OxU4RryuzmIaSC0rob+O+0+08Xgl
	Eb8xfMbFTg=
X-Google-Smtp-Source: AGHT+IHdHnn6wGZnvdSsol0igEGKm/m7Cc1hmskwoyS0/5RbE78pl/2ywFREK0jIWPVIywFZyPEDcQ==
X-Received: by 2002:a17:906:730e:b0:b07:de95:1c70 with SMTP id a640c23a62f3a-b1bc02f66d5mr759256666b.31.1758210771452;
        Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Thu, 18 Sep 2025 17:52:34 +0200
Message-ID: <20250918155240.2536852-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_165253_334661_316F600A 
X-CRM114-Status: GOOD (  19.48  )
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

Set the glitch threshold by DTS property and keep the existing default
behavior if the 'touchscreen-glitch-threshold-ns' is not present.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v5:
- I didn’t remove patches:
   - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
   - 1/6 Input: imx6ul_tsc - fix typo in register name
  even though they were accepted, to avoid generating conflicts detected
  by the kernel test robot.
- Re-work the commit message
- Add Reviewed-by tag of Frank Li

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.
- Rework to match changes made to the DTS property.

 drivers/input/touchscreen/imx6ul_tsc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..0d753aa05fbf 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -79,7 +79,7 @@
 #define MEASURE_SIG_EN		BIT(0)
 #define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
-#define DE_GLITCH_2		0x02
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		BIT(12)
 #define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
@@ -98,6 +98,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -205,7 +206,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
 	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
@@ -391,6 +392,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	int tsc_irq;
 	int adc_irq;
 	u32 average_samples;
+	u32 de_glitch;
 
 	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
 	if (!tsc)
@@ -513,6 +515,26 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "touchscreen-glitch-threshold-ns",
+				   &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, NSEC_PER_SEC);
+
+		if (cycles <= 0x3ff)
+			tsc->de_glitch = 3;
+		else if (cycles <= 0x7ff)
+			tsc->de_glitch = 2;
+		else if (cycles <= 0xfff)
+			tsc->de_glitch = 1;
+		else
+			tsc->de_glitch = 0;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0


