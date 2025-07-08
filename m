Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E804C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3A242zS5MYAQYfJ5usGXncBXPwZ1AAMz4fXvSN5Omk=; b=rRZjAjtwTK5zls0W7r5EBb5I2u
	e15ZKa5u35Wl5QfGgxRb48MhZPP6FHHFMWoKIqfkKuVehj/ZbWnjCrVIa+8mgE/rk5PlIn0Qn5Ejl
	uK37vyiYkSBnk4nWemnbuWfq5ftvW75KOCigK7f22AAsIunpBinLpuuf4Y6y/Y/RjCSCA5Q3Ay8d7
	iFaZzrnBW8Rvyzj1rL7rFfQTwVtk28EuArBRtLc0ZuKK4ULMOVVijReg98raXGggnXU/0Rernaktv
	eOfd9C0717DXx93PxNgZPhNkOnEhqUIQx+cQOIXcJXNHTOPUUppASLCmEYxwqLqVhP50QU/NAy3D5
	aHQiLP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3us-00000004mUa-1M2C;
	Tue, 08 Jul 2025 08:43:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3gk-00000004kPU-0ohZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:28:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-453398e90e9so27464685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963309; x=1752568109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3A242zS5MYAQYfJ5usGXncBXPwZ1AAMz4fXvSN5Omk=;
        b=Z0K2/w8+8UOy2bmRZZslMYoipZJytj/AikjSNMpAdUVauOJTkk6ES8mxOqtCdyWmAd
         6pcA7p2QFvzm5vp2jZiDz3IR70YKIBajCKqrvCJ/60TzODvUQVF/AmROCC2jQjevW4oF
         BhF+t8Hj9qQqAr7n5RgTjoVNORTFdRxHBU9WITdvBPvZXPdfvPs2k4bgnxaMg8yVcwB0
         YqkIVfU5lQ9Pz5EKmiLNEot2OmR4P6tqEsB+xu0PWyOzWVCUGxNSubxzY7nMaq/wd2h+
         6fUUpXcMBHNtOrT2+tlURSNiL1mG5jCcAhSyRroKQEHg8DC7NBfZHBTJV28VyFaXhGZD
         WStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963309; x=1752568109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3A242zS5MYAQYfJ5usGXncBXPwZ1AAMz4fXvSN5Omk=;
        b=C7FMicWYWocBibJJJOFzHGLCCv1fU0eabZ2J5la22gZelMBQSpfe86lVJZQbJxOX9d
         LMb5cU8AcTtq4CnfkEGTSrjU4VgcacUFcP043RdN9oBFlIOOt3eOJ7mkDZxmrHnJP/Sm
         bY2uVbrO3RpjPiP5DciFX5tcmcQS4XF4Ip5Mh+pNqqdSegOOPHjsjf8LDcmzyW6Q4STh
         GIBA/PDcEY4Da15AVby/6O2MQvxg6crmWKRRqUGXe5s2NezJvTm1/yU5k8qYh+Wol5pr
         s3KcHfl2AT6s4gIIb6Jj+/zoNHNX/cfsNf7BTwp6J1459qC5jW+Csleca/5FgRSd0O+0
         x3zA==
X-Forwarded-Encrypted: i=1; AJvYcCXjQ4+STZYuB9rOjyHIa6UZZfLsfsAmvjg6yqDU8UCUHW9KshVviSQDOR1/iJZfm/plAgC40LsZFQoY04lM6pqD@lists.infradead.org
X-Gm-Message-State: AOJu0YwsbvZN7kxr1Z6mG/04jSu0bE5byRPaklpal3/vI9VYANa833l0
	uJ54vVwI0ezciYBSamQ4rJGP1RHEeJ7sXteS7SJHKxiS+UVDvS4YWqtM
X-Gm-Gg: ASbGnctY/JcPOLqCUTdld7dLUyvLHYuqIEcO7FXITEYnhWu/K+zDTnSokO5M3J7rNTu
	D3UM0it3MTr9TwFFRmABbiNy1LpMxONoI5XEUxj9i04e1IjU/3dW96Kab8xx3vfdQsD+Rn7+E2V
	LcabDPcaZhGG7ccvmvsZh+JAtHbo9/vr3t3r9KDj3ULm7WCncuS3x5PJGKbakkjed5EaMfmMTPf
	DbnCskBZhzMZ0HoHwViz0qZcCWJyT/PnaUxifoZ3V2qPoipLS+U0MtTpihq59DH0NMl4n9WQGP+
	oilSKyzOHdqjAdFOg5ek81K0uQZeiKLwqbE4SdLMnJib1oeGPnl0bORC2zuNx7zVdqi9AWaGC2D
	4/oOiEHx2iANXPDQBZkwS/1EMuvaDtVcIHenF1k3KbFlKkqieDEONdg==
X-Google-Smtp-Source: AGHT+IFqMZRDLhvnw8G2AnPyFJea5WWnS/+DnHR/RTAqsR+1cKvrrb5iYIN0wdm0IoMdGl5fRhTgcg==
X-Received: by 2002:a05:600c:1549:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-454b3122455mr168049345e9.15.1751963308819;
        Tue, 08 Jul 2025 01:28:28 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c4f9sm12208359f8f.88.2025.07.08.01.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/5] firmware: tegra: bpmp: Add support for Tegra264
Date: Tue,  8 Jul 2025 10:28:13 +0200
Message-ID: <20250708082814.1491230-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012830_233501_8C61AD1B 
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
2.50.0


