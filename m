Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DD1C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lRiEbJrzkH/I22ILSwaqJapqGZa7fvSUC1WPmu8Y6zQ=; b=JRl+42f5+xTjNHBTiZRRQSCB15
	PlZIa69XgOM2v1KCGFRa1WVNxSLq/tlFyISl0SW4YQP/thtKxVTxjrGvspgkRv+NsO2/zUhQcfcxJ
	M4UwSaAMY8K64G/WZEhFb9hTX+4aR12fLNWceG1U831unM8UW6Zdqcj7qGRasoUljFz2FxAFWJFbj
	4qjxT1gUqMojLGDkoSKc7tPVPlGJUSeOIpdehgtuFbKexOb9VJ13KXZvbPz0+OzZoxZ30UHH5DhGc
	8Ih7sQsIbCwjUSH9GgnxZHcfg2rVz9US3mM2ly+GDlQUniU2YKrmY4ayiDH1ZbEEKQqCKgplvTQTK
	Xt9srkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVX-0000000EKVB-1FXX;
	Fri, 16 Jan 2026 15:13:03 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVU-0000000EKTr-3DM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:13:02 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso1045533b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 07:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576379; x=1769181179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRiEbJrzkH/I22ILSwaqJapqGZa7fvSUC1WPmu8Y6zQ=;
        b=Aeg0wbHHEjtLpIPStfBUJiViW2+XehiRck2hOge+RV9yz2S68SAvYp76V1clh5IjiQ
         K3LVTvCdp/g07e9xDYpjz2XcoKisr8VUrTdwUfGSPu2M3dFeHUpQgGOwog4ytwkfk/Nk
         mZA9hAXilfan0sOKJ+ERlf8el74pliIkuNlZTb9XrTKqcaI5BIAymCXvlCn3k7zuwsZr
         Wxgb3EgvHqWA4BEU2DPMvnRhgj/u6bAgH6sbF4RSv1F6IJl+SBJKhAT0iHiqsFUfwDem
         7VYiGQAOQGbEUfbow9Y4go51jkXPQ2b7AM8XYnjpb/c3i+SjuCuoaQkxQZESDzn5q4g3
         r8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576379; x=1769181179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRiEbJrzkH/I22ILSwaqJapqGZa7fvSUC1WPmu8Y6zQ=;
        b=E1UKPuGU84ipPlcZfvEnIR3gtSJO5CEVsbl5UQsd5c6hWeCobJS24StnwtMpH9MyaO
         un6q1Ty0a7rTFYeZFdvB4zfde4YRPDm/rQXhCCM3/IhRO2HSm7Vvu8eQjXzpAfFRmeG4
         NVJv019KRDvAMqbYOTYUVFD17sXcZsWfSD37s8FtCXXgdK7e+6Vz1WjhJ7xcD/EwX/UU
         4vTTAqbjPAtoO+PeOGVHd6Id8vtL0hiObJX3nInqYvVvao6f/EfoBH/lqWSiUd3BPreb
         ouhkDddyB6gD6R1+5HNIctNhIYXUUbRtDeLWBZs+T8lC5R1F+GJVNtL/619PT6nG7yKO
         n4QA==
X-Forwarded-Encrypted: i=1; AJvYcCVW0BhVNfH5uNgE9swczkBhU7mPQEdm09WrUvaZIf9npme7PHUB2s2h2HPY8jnvUE12UL7Ccty0u+l/H7ln2nvl@lists.infradead.org
X-Gm-Message-State: AOJu0YwAzJVF2bRuz/EOd77honpuGpUaVdp5vIb557WwZZ9zxiCNmu9N
	dUHCawViEyT72XmUMiEmSWLTyuUxPk+04oVbYN1TzW31PpMv6Xc+VUGg
X-Gm-Gg: AY/fxX6dU7KHU8R1Ib5qHCLz4T0ZU8slnwDpCs+BzdUk0uWMwgxgCNAD+ms2fWq6uEI
	oQBhIGxJBp5DcppmAs6XZIwFj+0T1c1QrnGDxk8uimL3YAVIwz+Fj8lkZqKZ1bhDlljcOp+2NuS
	U1VO5T9mogPN7LDWg6NtQAW/OtFYg9U+fqXtWumtaOoImCCDMyLZVWtue0AKH8DV9AJXBkRxEh8
	0QDoMfET+SJg5fhAFr7KXAGBvq6hGfnDgsfjX0vALkn6XUcLvJxQEr6xcO7t5rjkG41vHByuh+i
	yrVZczwkfv9ZBGO8euLfYUrCQrRRvi/oQRBBRsqCuqkKj0tuQvJtgGcCFkkTTYssvIwfdNnveHp
	EGMP6NU6gQWu4mBe5fvROpdtG6x7IBtpMSZDQoiG4CKF4AXcw2lCP0ITEP8Q6WTdVfhYFSX0qT5
	qyWd0JhbCrqVVG3iKkkJg=
X-Received: by 2002:a05:6a00:3c8b:b0:81f:82b2:ecf8 with SMTP id d2e1a72fcca58-81fa1890ca1mr2604735b3a.63.1768576379447;
        Fri, 16 Jan 2026 07:12:59 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a65:fc91::1001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b51fcsm2345072b3a.68.2026.01.16.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:12:59 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	pbrobinson@gmail.com,
	dsimic@manjaro.org,
	didi.debian@cknow.org,
	conor+dt@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro
Date: Fri, 16 Jan 2026 23:12:53 +0800
Message-ID: <20260116151253.9223-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071300_810988_B0EA5EEB 
X-CRM114-Status: GOOD (  11.82  )
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

Remove the redundant enabling of the hdmi_sound node in the Pinebook Pro
board dts file, because the HDMI output is unused on this device. [1][2]

This change also eliminates the following kernel log warning, which is
caused by the unenabled dependent node of hdmi_sound that ultimately
results in the node's probe failure:

  platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error

[1] https://files.pine64.org/doc/PinebookPro/pinebookpro_v2.1_mainboard_schematic.pdf
[2] https://files.pine64.org/doc/PinebookPro/pinebookpro_schematic_v21a_20220419.pdf

Cc: stable@vger.kernel.org
Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

---

Changes in v2:
- Rewrite the description of change
- Link to v1: https://lore.kernel.org/linux-rockchip/20260112141300.332996-1-jerrysteve1101@gmail.com/
---
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 810ab6ff4e67..753d51344954 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -421,10 +421,6 @@ &gpu {
 	status = "okay";
 };
 
-&hdmi_sound {
-	status = "okay";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-falling-time-ns = <4>;
-- 
2.52.0


