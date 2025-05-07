Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373DAC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9NQ5htm6TjGvw5gpgQ2pW82RG+dj+JM6DZdm8OVPgY=; b=bApfp5g+/fx2A2y/Ys9xYD1x2V
	7TJAYF0adWe/HSfgP5o8376WeFi7rtfRQuk62+PDEo6UM83AhZy+PD+CG3bC3+DILLdVGJIXbNbZg
	Qg7Ns44/D5di3F9M5YIgpDPfQReULbkujl2aJuhTHoIur9AN974oadjYnj8R4HRSoIUjRCqSY+kzY
	T/FFaBLdLVwod9WOp2WIdxP9sdIqgdJIw9OaKQj30sNjJyhm46/dJMvqdB5YcUaHAkXr6EBa6YxuU
	o6BMbJjBBEhqSjD5z7pvxoozOVJ474/6TfkTk7daNibx5rllp+epQsIxLr74FZrwzxgIk6AEaYkIv
	tpVo2whQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgON-0000000Fu3H-2q7a;
	Wed, 07 May 2025 15:09:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfuU-0000000Fogv-1OIr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c0dfba946so5873103f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628688; x=1747233488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9NQ5htm6TjGvw5gpgQ2pW82RG+dj+JM6DZdm8OVPgY=;
        b=f29okIycqRKra4Y03RdrT+vGksX9vSewwuti78hS8Qb/5vshfGbrgHCEY0o6GC9Ge+
         V1g6h5A7fHUZjmPYqxJSFpjDilAeaP+8gWhXuJpiJ4jssO0f3Yv0nUPWK/ae+T4BqhMy
         +o4t5tZdeULBB0gQ2g01gxxh39LhDisz+eGFWRgpV6Z8tG9lOOfpYZ1ABXB9eHDlcGfV
         jM80dyxuW9UpRYUK3+rbZ6UDjn817J7bk03PvMhdEFgx6KsoBG5xMTjpAaX9BPjzum9p
         HkkKs3aaLNSypR1Lh3y9Jf1hQfMtoHEG4L1yC9zE7CGEE9k0ziVykBSBgt1IlRe8ouen
         IGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628688; x=1747233488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9NQ5htm6TjGvw5gpgQ2pW82RG+dj+JM6DZdm8OVPgY=;
        b=t/4r9Y9tpgteiUpzn0sn53y+Ess5cTbhrkz4pj20wNSdTXhiSzeWzOS7jwDgJ2rfJP
         OGxusPXRgsfgv9Kq5Q8l4T9HcKRk/7S7UYLOO8Gq/umG4oS8HfOtshdIHA3jkWfQY6ww
         PAfAp1VF7dZPsHvzhAMcbf90hcmuMH21FD4jYZYnXfJ0jk6yWcIjvdHMHh/wrVUVqRyn
         T1KTu9gmqlHgVNCzF//8fYr/CnVGwhblOp0V1yt+DelNdlEz85BqQZ41m6aUC/6SCZk8
         QUSLvFJsj5iU2uu03oZ/u5pP021wgHNyl4FqYAmQpjV8QMfTZQZGkOCtpt7XED5FD0Mt
         JjZw==
X-Forwarded-Encrypted: i=1; AJvYcCVehdrRHDqr+W9UGsKD79Z0rAMuNuFikO5UTEyVO+Nw8tlkJbulB3YBhTozFZcO77q1cvN2DG491I7RFzy4+Np9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0OEt/dFXj+yAyxahU5A7XxGl9bmc+VXqMSjYLAS2kxxJ7WToK
	Rcr53M5FNU0M/E7Gp0a9wEsTNZMCz6FyhsiOs7CI1T67otSVTaBV
X-Gm-Gg: ASbGncuZ4LjY7jC0g1PWH7c4QEb8eGyewWga5y/ekP1JM6xG1TCtdP+oQB1V1Js9bv0
	YEgnvN14GrkbTevuqtbQOslN9kpy8z53h6tPE2eF0dCZbJ7Y8Kk0AMji4Q1WBb5cmnLdqc5xaUd
	uNjHvsMvyCTu7SK8YE3lUbRsdFnNXDW1QN3zBKg4rK3+2OZ1JLI51TyY9E/cZ+jhbJRQr2x/M5L
	/tM0JIMkxHll07Wy5mKkkoR6+z2JNcEoCneRaPcp2zIBkIu49UbV/SD5IEwmaQBRk5zgKPrSTb4
	1h6AORlAeb9qmQWe+uayonkTUBOZqygRtoWeLwDn+tR3bxBsrIGhv5X+hjG3LSHRq4QBV4vmEYb
	/DiCeu0EjFBbMV0kkQ6kM1gAqD2aAqqJV
X-Google-Smtp-Source: AGHT+IGEPioJ9LKl2XwGoKUoShBQOdIJsWwwGwPpqoWfZEMwSOLznYljMTyla4CsgxGuyB4sn9Pz0g==
X-Received: by 2002:a05:6000:2911:b0:3a0:7a7c:2648 with SMTP id ffacd0b85a97d-3a0b4a18a7fmr3305755f8f.27.1746628688558;
        Wed, 07 May 2025 07:38:08 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd3aeb79sm2915195e9.27.2025.05.07.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/8] dt-bindings: rtc: tegra: Document Tegra264 RTC
Date: Wed,  7 May 2025 16:37:56 +0200
Message-ID: <20250507143802.1230919-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073810_368394_37C9DF64 
X-CRM114-Status: GOOD (  10.13  )
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

Add the compatible string for the RTC block found on the Tegra264 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
index 17d6280e5515..a86e926ae3d1 100644
--- a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
@@ -28,6 +28,7 @@ properties:
               - nvidia,tegra186-rtc
               - nvidia,tegra194-rtc
               - nvidia,tegra234-rtc
+              - nvidia,tegra264-rtc
           - const: nvidia,tegra20-rtc
 
   reg:
-- 
2.49.0


