Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D74C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jxbZ035QFkq21lpMHfGFtYoYGFOwjubRluiFPGrGTY=; b=u+tl9ypBcKRjjgWb8sLebfB359
	uHadLqb6EZoDlOa1BAVgJg/qksu1j16WGzboRI/c/cL9qaifeFN5UtJISU8feVTYSkOIpvuOYg/ph
	zFrBbGzb5oflfhhaKQR70vMdP6evmfiN+zTqx3W6/t623rnkAqO5JXvdgnvA77lUDtJz9qtPRgwNo
	oH6H4bMUJ6KMu521aIyIBVvyJCqTIpS4twaAxYVJipaCESuCun5D/cnUbMtqDBlKMwrOsrIEMWMGn
	Q8ixL4TKzddtT5JnpuUvBt2PPxx5LEXZig4Wt5kU4r9BApxT2LWP0Ws8o4ekhNBKrN9lF0C88wmVB
	ysH2ShGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCM1g-0000000Cq5X-2Rul;
	Tue, 06 May 2025 17:24:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOi-0000000C8Fq-3EXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43edb40f357so29419525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538307; x=1747143107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jxbZ035QFkq21lpMHfGFtYoYGFOwjubRluiFPGrGTY=;
        b=cxVrgV4KnoAmzl6NJQNv1PvcDl7SiVutC0xy2ajSfjQJhadp11qXQrGxy/KhdEbww2
         avP3Q10rJzvJj0J4hxukOCfcNvuwFNwl/D6x4nvpUL1THuE1Pvjn6XPFT4LEr5NpUpQn
         Xa3Z1/NV2yLEVtXxbPghBfPAvXhgyQx2hzLGb59Wa3uBwW/2R4PFmOFzE3l8/ZbtnHcY
         13+Dcn5BO8azJSRArZJzCbAFsK+fESzS8Tsqj5Fw84wVDageb77R7Fb6yXOnjq/kYvlW
         LgYzr0cGyOr9ux4qFTEoQ/NRRY3OVyNL9o6drDpeILqrXemsDg83cWdLadQlNHQTYX73
         YJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538307; x=1747143107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jxbZ035QFkq21lpMHfGFtYoYGFOwjubRluiFPGrGTY=;
        b=pf23YpKiPM8ROUxtHZD4DVIXMQkBoIxJSi6nHdrgIENpKprv094Tmw5MwAiIc+QNBW
         b2rgF7xK3G96/IbMkrY2op1/UU6gZ5RWyHX9unNl/gzD8+2FxSnWUkxZaaW7irWHuA5e
         mFxqL1k+bK/JnVc9AzYh30uq4kqcHUXfLeNM13Ba38FJqadKn9koe3nZVf5Z5ti/rWdF
         pJ3GHBAZtDIj1A4QB7MA3KW3cpxjW4PuLsMY+dRdJntIkygSnXPomOCFYpOuu2PeyTBT
         IL6+d7y5Geu4714V6yIWM2dLOtliijvqKm6jdID7PH+yN4zNRm8M39T+YgyCpSgsjV/X
         b/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO6IOiVdOX1y8XjjEsH40Tn1np2jgiFgZ9m47sMMuYogtJnjStJ7O8ZdEWoTqH0LBPs9pgV7Q9IKBXz8cgis0f@lists.infradead.org
X-Gm-Message-State: AOJu0YzoVsU3II84J66CmTMMRNTZ2mzVZyRcLF5Jf1zu+4GvVyC6q0oV
	R4i7oAyhosBkHQRK6d7JYlcfWi+c0aaiiCQkRiwfpNTBngMpYUIE
X-Gm-Gg: ASbGncsSgUpmlVQKKuImtik/dpYob7Fgj95nzslWDAM8CQWQW1bRVK5HungzZz7Hm97
	Oly472hzKHbcrTSuPISrnbcdJtV/y2szWPRwi3edsNbMzVbGTVQ0IuHsqFLaZwr24zkv6HNMca+
	gUAav8QoOFhafhljuo1O5fYpWMB6rMm4JPVRAgZqsMeU6SLwr1oiAnWszy4XXfziWQmOmGdwHiy
	vzhtzCUc88C0Z4E2LhU3OzxCrLPwKLpeaHSFtSLMOSFwki5S/gAUeykC/tQ0QBV+UKTdESeCadP
	O+XZiMabxIl4SsFdBBEN2tnd0dbCeW6eOOerJx2qmc5u8843OoLYpojxpt0QMYEaU53g32bMIJ7
	JzspKjfBXYzoJPsKmVc5n4+/yAxo0dwYJ
X-Google-Smtp-Source: AGHT+IEvZa9BdGXkFT5zzPGwBPqXPa2EzOboT5eW1NmG8nWLxf29uTsrdNSthXrYCAxweDBMMj3blg==
X-Received: by 2002:a05:600c:821b:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-441d0fd2cf7mr28337405e9.19.1746538307016;
        Tue, 06 May 2025 06:31:47 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2ad76a2sm215973025e9.6.2025.05.06.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/11] firmware: tegra: bpmp: Add support on Tegra264
Date: Tue,  6 May 2025 15:31:17 +0200
Message-ID: <20250506133118.1011777-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063148_807088_7FC3F3A3 
X-CRM114-Status: GOOD (  12.60  )
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

From: Thierry Reding <treding@nvidia.com>

Support for Tegra264 depends on the Tegra186 support, so make sure the
latter is enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index c3a1dc344961..e74bba7ccc44 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -836,7 +836,8 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 static const struct tegra_bpmp_soc tegra186_soc = {
 	.channels = {
 		.cpu_tx = {
@@ -884,7 +885,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
 static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.49.0


