Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F8CFCEEBD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fcVZ4BQFpRmLHwxh/g2dVLrCTqrD1Ac4Q97XzCkzEyk=; b=MKIGpHR6EwQc9oCHa6klWxj74t
	3h/zZ6PAGzZ7Z18LnGuKQ/e3+92pJuxQtvyZll3cJb/VPuG1Nh2kDNVuuzw1drlFQrFmV+TGawSng
	vkNjsOVJ0LlhaBhZBAWt2i42OSQTLWkgkis0GG4oTbF2QiaHfFHY5qpmkOkIjbhbckwiD7LoyXAFY
	I1hiY3VzKT9YodvNYilMgyLzTehLzyg+AWNCF6sttYGFNeWohJYwt+mogHFOoHLfB6h9RrFq9Dykm
	jk7Azhwe+iKV2lekBv+QdDn41uSon3SrUAU69UnyDfckeNwlKHTDw5QGWZJR2pusXtQLQ6VeDioAm
	XkPobMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUaS-00000005THL-3TeD;
	Thu, 26 Feb 2026 06:11:00 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUaQ-00000005TH2-29mH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 06:10:59 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1273886efc6so517005c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772086257; x=1772691057; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcVZ4BQFpRmLHwxh/g2dVLrCTqrD1Ac4Q97XzCkzEyk=;
        b=r55R99G+n0B9bwGRgNjQlouv1o17IYPjFAb6mLYNdA5YdlxIo1CX6WNZ44rznIFOXJ
         HO5uAOe+6GJvS6XnFxWvRiDhwgjzuk3NsAx45NQQhisRQ9QNofv3bGF0gHnBgsw5NMU6
         4J+VEDapWUMDR/KDQkmdpeaRKub/nrWU6tN+gx6rzK88fz8BerxI7Ukk5sKEs/ft3kld
         D2kj9x6q9UD/V71MrWs0JR3w02/bBmi8jf/qmYQkDhslWItYT7Yp1FXtFgj6uKED+BfM
         3iCijG/nl1U9kWjamFnyhVNzTASq4QxcryLxaZ7vgl2HLuaK+esQ7t6uXK0jNNynPZBN
         bejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086257; x=1772691057;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcVZ4BQFpRmLHwxh/g2dVLrCTqrD1Ac4Q97XzCkzEyk=;
        b=SmVRJeGSmVwJeUIE6CnBxulngh5vXPew1Idy2s0ZWXgaKkdIsDsATJObihGUlyuf6o
         7deXierwDGMCcH3H1EtvfSDZ3y/R5EmiUq8ZehJb84QYKalT+2nTCRvRktZ3SJx6c6NC
         wZUzJBHOJfTr6V3knCxbjFyPoLxTpe4rMv7etcp9IzCkwVJFPh7AQWI8tKLNVfyAxvkb
         fNy9a7KrvU24HukD47XMhn5WYBMqXNjb6zPzRO7Hu+N7XsPpblzNchRjidfWUa98YocK
         oCraQX3gwGT6g+NcDLg3UONXaVdlCbYYyu7/ifunQgZM8j+XMVb9BqUHQlBLi71/fm/l
         WOwQ==
X-Gm-Message-State: AOJu0YyEE+h5CpBHr3HbXg3Hk7P/hxNfu1zniUYk3E5XGjsmRGEponWB
	WJU6hg+uh60rxxb0y8wLa6/Idwsh40yOHl9VckfzLsxuykuBTdku4JIvJX3hBDc0nFBtjCBb+Xr
	zhNwfrA==
X-Received: from dlbur21-n1.prod.google.com ([2002:a05:7022:ea55:10b0:127:8aee:c50c])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:11c:b0:119:e569:f61b
 with SMTP id a92af1059eb24-12786963bc9mr1496401c88.20.1772086256595; Wed, 25
 Feb 2026 22:10:56 -0800 (PST)
Date: Thu, 26 Feb 2026 06:10:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226061053.2596167-1-badhri@google.com>
Subject: [PATCH v1] arm64: dts: exynos: gs101: Enable AVS APDO
From: Badhri Jagan Sridharan <badhri@google.com>
To: Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Amit Sunil Dhamne <amitsd@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_221058_555031_D67B2964 
X-CRM114-Status: UNSURE (   9.37  )
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

Enable USB PD SPR AVS for gs101 by adding SPR AVS APDO to the sink caps
pusblished by gs101.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Depends-on:https://lore.kernel.org/lkml/20260226055311.2591357-1-badhri@google.com/

 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..5a689be61432 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -174,6 +174,7 @@ connector {
 						| PDO_FIXED_HIGHER_CAP
 						| PDO_FIXED_DUAL_ROLE))
 				     PDO_FIXED(9000, 2200, 0)
+				     PDO_SPR_AVS_SNK_APDO(3000, 3000)
 				     PDO_PPS_APDO(5000, 11000, 3000)>;
 			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
 					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
prerequisite-patch-id: 4dacd8bc550e317d67134d030814765fb9f4c6e1
prerequisite-patch-id: e863378fc602b6bee2e9fdd8c568003c00b2a38e
prerequisite-patch-id: 202a9e1e9cf27a0b9ff7ebea76eb45cdac2cb581
prerequisite-patch-id: f3817c560d0e701d7499fa1fb9ee40d22816c09e
prerequisite-patch-id: c071913307a6eaa417d1345485d7a9c165d40834
-- 
2.53.0.414.gf7e9f6c205-goog


