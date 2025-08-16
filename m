Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C050BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDWOGAR/V8qhS+DEW6fYz84GWwsYflwCKKabdx3FCTA=; b=z4AquzbNha4f5UUt1JeSlXTgef
	vkMX4+1rto4Ffd5hyOKs0iVpseqoyJDqOILAxjNnCyxayvo/mZ8q+tcnIrtJRwPztXWLyZDJVLVn8
	PtrD+EhCHwuVBoSuTGFC1+K1p6GVsuw/FCYliIZlqD0K6JPlbJdo1vBJh7/WUAtdMURWV/J6Z06Nu
	Nrdc69KfcZJVaubYbaagsmD1rg2MRomTNgRIS8mXE94CUCjl8zF9D6yhSWbwuVT0EZ0NO/KJxG2ZA
	X5s+GKgBn/nTlZrtzh7GWdmD4yXQohtKCDdGwRWeWB7yGuZx2okJKBmhmXv6PBm4n4UgPkiFtK4z2
	f3W/jsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCtf-00000004Mhy-0dpF;
	Sat, 16 Aug 2025 09:08:19 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCaV-00000004KHx-1AFv;
	Sat, 16 Aug 2025 08:48:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76e1ff326bbso2859595b3a.1;
        Sat, 16 Aug 2025 01:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334110; x=1755938910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDWOGAR/V8qhS+DEW6fYz84GWwsYflwCKKabdx3FCTA=;
        b=kc9JqcYlYSWttZRxAgHjNzNZsqIKBqjxaUZOxWWmZW0CvnvGOsb1b6DHdEb91nupxe
         6S4uviahfOnfwKfpnjCezhbH1LbBfeyMMA9W4q2ryDzVzthTm/I4qiPbmzHZwFwDIs0D
         bSHRbqlPJ03yY8hpv1hwPZKpW/uyb6bLZdrgho4fAVovOTAH5v9zh4XwzzgDyVr6ehHU
         Lhm+hSWcJ13IfBnYrBfbUP3r8CACgujAC2/aHyGJ3KcOnDGEYwQnqFehbmMO+FQDWg7w
         rbvXvpJvzwvON4nL4Q6CePTeQIYk9nZlSHqrX9Fso82IfwZKt0ON9rWCvZ5hbu8nmEAt
         etEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334110; x=1755938910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDWOGAR/V8qhS+DEW6fYz84GWwsYflwCKKabdx3FCTA=;
        b=KUWw75CfxNsNHgIgH0N+q4Ppr9Tlo/euWojqMaJcsWkspmGbdI7qlB1zzW5j/DsjcV
         Ji9sfZePBSRJLH+45Y7aeUF8nam+v2VjsJA5AsgD4YFoQAZ6FOdPWlw8M/FxLJYPH5VN
         j6/cV8iGTpdltu8AYmkc6mYNp3DntFJEK6EE/3xA2czLOuuIg3rkbx/GJjIY8V8mNVh9
         z1OLzbWAa2Z09KvI3Vdc86K4RN+V/homC8umi5HP4xoBnC3Q7UmFeqdndzG4ShgeqdMH
         xmtgYu5L5CCkpbXWz5q/HbXvHn65jjWBhplvbqbm3YoAdgQVjRDGGRvy/zS2nNah90v0
         BDag==
X-Forwarded-Encrypted: i=1; AJvYcCUQB+LC82VMeyz9dTf4NmmmXrpiZJUEJ/BdTISwxpuLFqx0je9yTETejo7vvxE7/JAjekZfpjEFx7Bs4YQ7G5qd@lists.infradead.org, AJvYcCVLMqwpAZDF5Y0Z3QqRYeSpyQfNnjX7RDp4u9yf9TkIm7yqkTAJI8MdCa+uLNbFqrvgqZfDtSO8nxdU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmh97ju/zCjC0OHyv2ibOVaRPE7PWD1Tib37/Q0qEvAxl249yk
	YvDp75T+CIkVxnN2dJ5gZ4z8a7Jl99ffCqSzBGn8HmcbnyaGgwDWjq8bg40q2ncfQ8g=
X-Gm-Gg: ASbGnctYf8ZRFKB0Y+yCPGqNlHGcDVsCLIX3VKBTI7PMA5q423+L2MQVnA0muqb68Eb
	Jpw5J0hwCg1xMsUE0QfSCtuy8kTjBM5wxYhS/tQN7VqQO7QiFnc0rnZukJCTSKU5ErOXkkIWmuE
	j9Y4plAZ1exbnt9Zit0WFCK7jd/0XWN69AjmNT8xYMbhjhbMrDJyzh4YyZFbzFkWn1hD7PtlNvG
	A8ZqyXIqfh6Kj9Ru5qJv8184+ZKjCwCq81YxYK5EEbasjzhdhp9ANMcx4A7p5HLW4pe00KT4akm
	VE5hiHXmafzfOJ2G92t/+iyyeMFg9fpwkNSk57iGTOTDsc1z/ufPSdbEpgxh8h8RyXKPxridpgl
	QiPpiIMA/Kig=
X-Google-Smtp-Source: AGHT+IGsQHajlRxkkJKhsBN5q8Xue9SzeHzYvWpvVEasktK/+7UqcjxhnXytQgxkbXL5divXvBb2fw==
X-Received: by 2002:a17:902:d50b:b0:242:b138:8110 with SMTP id d9443c01a7336-244598679d7mr146468085ad.24.1755334110487;
        Sat, 16 Aug 2025 01:48:30 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:48:30 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 7/7] arm64: dts: allwinner: a523: activate USB3 for all boards
Date: Sat, 16 Aug 2025 16:47:00 +0800
Message-ID: <20250816084700.569524-8-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014831_315403_76F65A10 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Currently, these devices have a USB 3.0 port. Therefore, we can activate
it.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 553ad774e..6842f8e8d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -47,6 +47,14 @@ reg_usb_vbus: vbus {
 	};
 };
 
+&combophy {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbd..19388bc11 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -46,6 +46,14 @@ reg_vcc3v3: vcc3v3 {
 	};
 };
 
+&combophy {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index b9eeb6753..6f05cd297 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -57,6 +57,14 @@ reg_usb_vbus: vbus {
 	};
 };
 
+&combophy {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
-- 
2.50.1


