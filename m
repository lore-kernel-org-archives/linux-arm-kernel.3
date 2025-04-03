Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20507C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RAUmoadrt4LgkAajp/0Serm5kZVa1HxkqsvCZqwwdbs=; b=x30SQfGjSVFWuFA3oMkxNRg8kT
	vSU+Whzc5Bx4tGYFBVQyJ3Y/7phsEmH8BK4rC1dDfetQltBv9WgRufx93T7vrGRftZGzCDJbL6Q/M
	PeI+i3yV7JZ8xAkrTwqxvu+OlhSMTxT5+RBhdv/9C+2gqbVeS1DF8EKTXKDmX2AaO/d0o4hksIaDd
	L7zsDozBLDpVKewqtjeVIvUX4ImP4jb5VfjA68IgZSsC7xHzuAqHEwHI2JOdXL/Qd0xw+6yOvlDvd
	mI09wYiLsSHRcHXRxyCXgPi0NE3/lLD3cmSWiw/2ExTJDz31JJKI8EacI2r/IVxD5fc5Fvox9F6ji
	LZ3Ee2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PTt-00000009b8S-3obz;
	Thu, 03 Apr 2025 18:40:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PS6-00000009avO-1Ke6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 18:38:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso13320735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743705488; x=1744310288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAUmoadrt4LgkAajp/0Serm5kZVa1HxkqsvCZqwwdbs=;
        b=GVpNXE8PkRO6VDyJ1zNcGfv89jPTjJG7nh213Ty00PR6fFlP/5QNLPwbY1DxJE+YgF
         xgkawLOHQp2K7o8ySzvZfOirAO+mYs+5+rfC8mpKVjoyeb+ux2rQ0YFL5wOuuL0S3i8n
         WuWGFGkab8eG574hm6cwQcVTr6vocSwG36gRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743705488; x=1744310288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAUmoadrt4LgkAajp/0Serm5kZVa1HxkqsvCZqwwdbs=;
        b=XmPwCMy6xE6jaZ4WEnCQdSUJo5+QaVKqUEipk9DuTufkcqrkatK+DoPhwQdNqkYKNL
         WJ9NUMLb6WdAX0ontLwH8Td6uyyEF4sh3sEZUOt+lEJCxXBSqGsi9JeG2WqIxtB2yKfM
         gYBW9ReZkq96U0TzXras93x8AmvCohrWJS/VIO4ReV7M5BlBFDboEaoW6cPGavclwKVL
         SQh8ZYAbkLK7JM+qMj1AAojAUJAUFVLrGheZO0dbj2zvo2kD5S8Rce2eiVBf4gd0N4h8
         jlo5Aa8VPjWn2ofK4UvW1eFPRUHvgrGlsAa+/RPw/wW/O2GT52vuOU6ylffnJULf9tz/
         NzBA==
X-Forwarded-Encrypted: i=1; AJvYcCWw2sgBnDOpr7eyabsV4iLX7A2rCECYTNfQSkrtAa9dVTve+c5lu8iktoNBR4jQZtsBT3D7nSqbZPXBv3eeJZRs@lists.infradead.org
X-Gm-Message-State: AOJu0YzUnyhjids1FuWsAcgBefx7L6b6XEDECB0nNBW2x0EJPBsupEb6
	mJT2JLjAJqwzUzhslwMXUC3lhijrKs+5IzKVjwNL/SoLiIuHVtMDCa45BgRMLQ==
X-Gm-Gg: ASbGncv1WX3fs4RvHwWExYaW4opAevleWe7DudmUHoV3SSs3MqGpacq4sBCsVIKpImP
	W4V9VQN6XpVMY/thfthVlrrxfGNAs5R+t0VIs8/lipFzZrVNLexgoD8Pgmr+SJs5oc1PuN7jREI
	Bs+CJx57t8CJTa0UgU4MGFwAnpSd++T1Cjentl275XyTpe0tG7iEGAcco27xLZEkYedxgsHoCwl
	ZmW13UktXpVBwqE0FCe+6Npdf03lpYoziOqVZ36degAuwwRixkIa+y5jTu5wdR8HPoF3OnRDLaz
	bi9DsMJJCjJwk4DicIAdvhg9vzLnAVNmbn+9WkIL+XcXsDGg1b/1GHF8wFdY7bu4UieUfbQndsV
	69yOsxh0osx0LYcDGW1+co/MNb17V
X-Google-Smtp-Source: AGHT+IFU+JA0wj4Gwdhmn0pvtzq12d4oTDVMfB0PZk2I2SR11ArXvCwfIkLV7Wt6NWMVRvs/m32Wsg==
X-Received: by 2002:a05:6000:400a:b0:391:2fe4:de0a with SMTP id ffacd0b85a97d-39cb357b0ccmr382060f8f.2.1743705488199;
        Thu, 03 Apr 2025 11:38:08 -0700 (PDT)
Received: from orzel1.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096896sm2503496f8f.19.2025.04.03.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:38:07 -0700 (PDT)
From: "=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@chromium.org>
X-Google-Original-From: =?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ssradjacoumar@google.com,
	chromeos-krk-upstreaming@google.com,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>
Subject: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
Date: Thu,  3 Apr 2025 18:36:38 +0000
Message-ID: <20250403183638.3386628-1-korneld@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_113810_373629_74C89321 
X-CRM114-Status: GOOD (  12.95  )
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

When the 52-bit virtual addressing was enabled the select like
ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
Because of that the rnd max bits would be set to the default value of
18 when ARM64_VA_BITS=52.
Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
be used if 48-bit addressing was used. That's because the 52-bit
addressing is used only if the caller provides a hint to mmap, with a
fallback to 48-bit addressing.

Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
Signed-off-by: Kornel Dulęba <korneld@google.com>
---
 arch/arm64/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 748c34dc953c..38e0bac567f5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 24 if ARM64_VA_BITS=39
 	default 27 if ARM64_VA_BITS=42
 	default 30 if ARM64_VA_BITS=47
-	default 29 if ARM64_VA_BITS=48 && ARM64_64K_PAGES
-	default 31 if ARM64_VA_BITS=48 && ARM64_16K_PAGES
-	default 33 if ARM64_VA_BITS=48
+	default 29 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
+	default 31 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
+	default 33 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
 	default 14 if ARM64_64K_PAGES
 	default 16 if ARM64_16K_PAGES
 	default 18
-- 
2.49.0.504.g3bcea36a83-goog


