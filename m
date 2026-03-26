Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C07109E53C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 02:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DClgII7euPARd4Aw2OGYINNJTYi6FW2MEXDTcwKQgeM=; b=ZT/Wq54rrUwA8hqHsaF7ElZ6gs
	1+2q9hp8AYUud9x0zlhY+tJeGZDWFq7LazU/kF0fu4J2Bfge4VDM7QS6enxiIpAQsc6vSJLpKvEu+
	psfElhke8qlf1eSqr4TOPwA27OIA4LeEZnC/vWXz97ZuqEpl6Qi4AwRf9BqUcm6A9CSK5kEfwQfG+
	uN+K2utF7q7LMxerUD/VffiSdrpHCvmHI35M4OouhrETBYUZaR96A9tebDKrfSf1CFM2INi6u/RIl
	1t53sYTnM6tsBmk7y4gy4Fq5kDNNrAJaouG5fcV7beVXtpV8QKXU38XbIkS7l+/XZq9xkNiKqn/n2
	Zs0fyx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5aYg-00000004aP4-1c1S;
	Thu, 26 Mar 2026 02:34:54 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5aYd-00000004aOf-36ue
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 02:34:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82748257f5fso810225b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 19:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774492490; x=1775097290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DClgII7euPARd4Aw2OGYINNJTYi6FW2MEXDTcwKQgeM=;
        b=soF1iX9AMsP9PBwHAIrSHEiPzxC0vQEdvq2v1ByK+2v9k+TaoEFEYbvhJiaxtSSbW4
         UsGgLkDQ9KxOelf2KcAgh5KYKfnm4peSeuaEEnAvIe8rkjtu1cezMab3EYeiF4OW7L0g
         ODy6q2Cx8NBN+7wOSINIOZ27KdwCu7kWOybOPSmO8K4h2/OOvX2/w0sn5arzajzmql7p
         RHc1pWZXok0bWP/6cTmLcBjQ3pSu3Ji4oHnS+B+igq17jtjjBKLpYa5GIg94umWQTaFX
         yIO+jhrRoAt9hI/YkEV8HI5NJHskOT+nv+IXVlROVmyQQTOJZnz/2hpSPt3VahiOQPCw
         iD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774492490; x=1775097290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DClgII7euPARd4Aw2OGYINNJTYi6FW2MEXDTcwKQgeM=;
        b=CdpyFH5eJlQhE6rjlatBFrNjRISQr0m+3R6CFtNyNRwlylpE2zEGy5c0jgOPP1+TSP
         +psUrm8O4Anf5Fc2yhCv4rbN74jAh9EebwktK+XX96B8zfxBtW1v36Jrf60sG6qC36td
         fCdIPKhgx+duDLHGUVYh8WD+76wHTSPNMm8exRwQEWLDJ8hzc8itiw3mQbInvRg0F3jS
         ZKHShKu5NBCjRH42/fxBh2zPvWCVEaRqzCXIrxYWrDp3KEoeglQmm+a1jinm/SV4MkVi
         FeinuzXcbhzshxb3+imPgkzvfHB5Y6ljt5lH4Me9nE1Cr7de7hJplHPTP1tSddmRAnQc
         yaDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzb95UQ81MCG9wdJoJ9DjV8HGo51rna4R8dgty5p8mDgMyZaFzWnL2L+XqWb8OqYFqGqzAxzg1VT8PEUbo80si@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1kxeZJyGuJk6q9s3alQdH2iwjuVSDD55N+Ai8DCWpQv6uxeNE
	kaYlbiWAifyGS4gtRT21rzvn0SOWqWKDbhV0laquDz5XnqkB3LuVCSPhFZvRWbpW
X-Gm-Gg: ATEYQzzjnI6O31OuP4y5mfpxKL0xkF1uJn/W8nIgVTlNmyHbgsTKOZhVmT9+6HJimnB
	/BnxSetULecMYdqi4ZRj1By0X2iSyG7e68CJwqvG4UrMY+tffGO5PQXS3cSk03ObFX2w26Hd8xw
	VBHsDzswdSTNJHfEXcfAdvOku883ucUhDEoV/ygK1ivAQlk72Iih51f5ODRROU65ad4Y6a7hLf8
	IKYLW+xtZ+a+Di9AX+raXDSWHGPpDWjCe+CCg28y1JiuY5t6UuylcR6s7xfkOeys1uVxGY7A4BY
	2UlvCt/QKc8vtt3EzPuQgWLGXWllcG3Jm1HfqS/+IYVLegvXN2akwLwd15LpknRKwv3KtyIGW1O
	i6NAyu1Jq4Gzm6rlE82X2kFhho8/n18/LuLHmRuBZPQMtrQ9Dfb2GhKvab7FCMbsl4yC6W3YthV
	GnspKiQuwItMMVBjCuRTckQilHCB0iiAWq3X5N28ezabLGz+z3omG8KWw=
X-Received: by 2002:a05:6a00:27a0:b0:829:7b30:92f4 with SMTP id d2e1a72fcca58-82c6da3394emr5062994b3a.16.1774492490469;
        Wed, 25 Mar 2026 19:34:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3d5e81sm998465b3a.51.2026.03.25.19.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:34:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-omap@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] ARM: omap2: simplify allocation for omap_device
Date: Wed, 25 Mar 2026 19:34:32 -0700
Message-ID: <20260326023432.54127-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_193451_785065_56DF6994 
X-CRM114-Status: GOOD (  13.31  )
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

Use a flexible array member to combine allocations.

Add __counted_by for extra runtime analysis.

Remove goto paths as they are not really needed anymore.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/mach-omap2/omap_device.c | 21 ++++++---------------
 arch/arm/mach-omap2/omap_device.h |  2 +-
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index 79db4c49ffc9..55f2a9d5f4df 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -309,17 +309,15 @@ static struct omap_device *omap_device_alloc(struct platform_device *pdev,
 	int i;
 	struct omap_hwmod **hwmods;
 
-	od = kzalloc_obj(struct omap_device);
-	if (!od)
-		goto oda_exit1;
+	od = kzalloc_flex(*od, hwmods, oh_cnt);
+	if (!od) {
+		dev_err(&pdev->dev, "omap_device: build failed (%d)\n", ret);
+		return ERR_PTR(ret);
+	}
 
 	od->hwmods_cnt = oh_cnt;
+	memcpy(od->hwmods, ohs, oh_cnt * sizeof(*od->hwmods));
 
-	hwmods = kmemdup_array(ohs, oh_cnt, sizeof(*hwmods), GFP_KERNEL);
-	if (!hwmods)
-		goto oda_exit2;
-
-	od->hwmods = hwmods;
 	od->pdev = pdev;
 	pdev->archdata.od = od;
 
@@ -329,13 +327,6 @@ static struct omap_device *omap_device_alloc(struct platform_device *pdev,
 	}
 
 	return od;
-
-oda_exit2:
-	kfree(od);
-oda_exit1:
-	dev_err(&pdev->dev, "omap_device: build failed (%d)\n", ret);
-
-	return ERR_PTR(ret);
 }
 
 static void omap_device_delete(struct omap_device *od)
diff --git a/arch/arm/mach-omap2/omap_device.h b/arch/arm/mach-omap2/omap_device.h
index aa8096ecb23c..9283c15c2403 100644
--- a/arch/arm/mach-omap2/omap_device.h
+++ b/arch/arm/mach-omap2/omap_device.h
@@ -51,11 +51,11 @@
  */
 struct omap_device {
 	struct platform_device		*pdev;
-	struct omap_hwmod		**hwmods;
 	unsigned long			_driver_status;
 	u8				hwmods_cnt;
 	u8				_state;
 	u8                              flags;
+	struct omap_hwmod		*hwmods[] __counted_by(hwmods_cnt);
 };
 
 /* Device driver interface (call via platform_data fn ptrs) */
-- 
2.53.0


