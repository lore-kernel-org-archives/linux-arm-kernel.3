Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC17C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=; b=jMGysZVfnOcA0Sjcw3XINxzcdq
	QCI3IX7vfPC/tX0Y+eKb3DsU3g0CXnGZ3ftzbm9B0sIL8VTm9bqfpMVU29bPbus5jMbjJLTXYvfie
	HXvdFWbTinxrHzDW+VS0Xcburd7FJc2pLroy2/b9Umj0h2vmPMmPQXHd7acbXp/Vysi0oNoUejZcX
	IR3kk5fXzfI3zeSUvq5AEov3xA4VizD4n1mDev+mU7UEqG9hGOw0BqPNATGwA/g1i3qxKLWPqJ30C
	pzbxsR4U2xUanhPbBg8pcnZXR+0O/n+MjZHy1TdGRdUoGonkGE5m8wSJyv8xBI5Isg4qUHwjjFVWf
	1lH/7A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDDH-00000002Mft-12oC;
	Wed, 30 Jul 2025 20:15:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrR-00000002Jec-2YCR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b77673fd78so115661f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905192; x=1754509992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=lhYJ3Zga5zM7C1PQ7uWpjH6RFNCelPVW6DuRAnOYs2Uq2g5kmQ7sMKwrStaZaQACc/
         bwquQovy5mV9pLw5dkiRcjcr2oIjRO2ZL6rs76sDRyKExJjlSUYKadDKRZa1wll0NVzF
         ZN8J2ibpGG7/evGXdyLa0vJH6L09cOKHV4HHssfCj9uJXQNe2m+AHZgJdKfnrI1Q2G4l
         IJKe3aa4gTwkRktvhIyQESD+7ttzpZksbixb/w/x2luz3HGBzphidv7+0i6+R3LCrpC9
         7eUL4t6VZk9i2DnCYAHPai0Foon9FJu6RUlp09aIvuLR/D7/t0GMgI51c371NzSK47gv
         3p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905192; x=1754509992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=mcO265JMPSln2VQHlZtxjTG4MeQRxFYZBB8b6QELOUw3Bt8vaFBLrxxl1EBpQv81jn
         gGtXmoQ2SRR584boumpSqQW/KkYbxNOpmtltL0UriAEB1MFgNPzfpLD8Wi87oJD9AWlv
         kiYCOpZbKQTU+Yz9L7BazgzCyh8Bpwakkzled4xKzWwa7oDeDQgAqj/hmy/CFmZjGSFP
         pFGoytQzG4d8h6gVh6PzPCQmTz70VEZKtd1zsS0cf87CIflmRLpcchS2mg5cgxJxpvS6
         34GzNKtzUC31FtHxKODbCobCR/5PFbePKwBChf4/bPMbqkWdnrt5C2AETujRkZg8O+Ch
         6zNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVWITxTB7ldHhL1nhyxybUGvKR+St6PGqazLoncD+vXGgYg9wzJEZLogiJUSqtZsKzZVx4JUO0+0d2Nkc7O5pp@lists.infradead.org
X-Gm-Message-State: AOJu0YwP54J3mzkvkdB3afgLZ+Ud8tgF01vzPX7nPTeMk7knkZj0p4ly
	JZUOlWLvx9W1ZMJTdXG7ftChLvUvgFbXJjqIKT1m0w8INMKGLalfPGSLy0mj3dwKQkI=
X-Gm-Gg: ASbGncvsFwAX99ONuFW/rH9ovkDeTUEpGhMMCv8hirvANa69qL/L4jj30Od6g431QDg
	s/Hy3fatZJbuIV3OYQinzDh59kuysafpFxXiezGzUGVZxpIdJmyLHZMZqyT8tLNBPaHQiYt0dQ3
	XBR+Iy9Xgj9+MwF5quxo+m2bEMPqgnxfSL+MO+Xj9LPKZaxkV1Ff5BTBEPKmj+jvLfymxekVE8f
	4xoScqrShjIqbgMDoO2leiUy5h0QNeA+K+A7BmQlGUXGa9xkgNPdPynNwf/4DL/4xRKvqfKrrPs
	PWp//F4mNgEaAsMdK5OD4HTg7qGA6gsScn3T89snKLKbU4gV1YNKWXND7CoItu+IakvasTczJ3d
	VgWEziGCdN+AJ7DKw5wIV9UVckrCohIYgC/IwFhvrC/Nlph3B
X-Google-Smtp-Source: AGHT+IE2LPTXnX8h2UuSalEhXHbjsRWmwclLkvmu+DxN2Fzf9KDzutosLelRCaCEJoECy/CePHIhyw==
X-Received: by 2002:a05:6000:2212:b0:3b7:944d:e5e6 with SMTP id ffacd0b85a97d-3b794ff1593mr3557546f8f.36.1753905191682;
        Wed, 30 Jul 2025 12:53:11 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:11 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 8/8] arm64: dts: s32g399a-rdb3: Enable the SWT watchdog
Date: Wed, 30 Jul 2025 21:50:21 +0200
Message-ID: <20250730195022.449894-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125313_662564_3B64D8F2 
X-CRM114-Status: GOOD (  11.07  )
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

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it on the s32g399a-rdb3.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 467e0c105c3f..e94f70ad82d9 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -72,6 +72,10 @@ &stm8 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0


