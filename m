Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35721C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/y7c/4lG8eevhNAw7vtPbWQQOLv7HTFTCbAr3jVwm4=; b=APzqYeMtpj18sRhVQodzEp9nmQ
	ERibVISrvofrgqkxU8R3oLRioO1sJhVIM988wMIDBN6JFN9gSt2qnskSMogBD+xp7vF0DEdTXOOM9
	LWJcQcMwZvBi4HOUKRQsoNjxI2Frx1zMYsuiMuN4k9jo9VFMT5W1+jkyAnxNLyC/qlCHtt1XdUqAw
	wOhO0S1LGnUwX3EJ2cyN0JXSTEBnaqjbKrwzjfr5MMBkUs4R4f4/BZXf4veUums/d3GPGvZX9rXF0
	eJRE+Ldtin9pNZZu1aOygobDAt+Q7JLs/YeCePPUCEfb6vdQHCGwm39rNpaqmbpea2r+w8PAoH8yF
	7rGTb7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscu0-00000009Bpz-3a2M;
	Sat, 08 Aug 2026 08:59:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsctz-00000009Bpd-1RGu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:59:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce7d2adef4so5234915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179574; x=1786784374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/y7c/4lG8eevhNAw7vtPbWQQOLv7HTFTCbAr3jVwm4=;
        b=CStdP+zmimiSAZC8VLmd4Q4Z/Vvx+xRK7sbdKijSzC4NtnTyjp6Mdmx5ckgYJpJFOa
         t1st8ieR2/Odf8Sf/w7m7Nq+TwyohyMiB4q9XgSclMoVPvNek4yjFzNNn8Z709sJj/S2
         LMZFJPWRYJWzOQtYgkV7bXxCVwxgbO7/YvXislJhkAuZySBVUkPhVgVyUPlsvyMSh2+d
         PjgF7tRWnT1w6x6/qAKyLEETiXLxSiHzaSaR6AK3qLP61Cn3gER6LfxAIOuhrHf+YYyD
         4GiONPxZIknptHs+zyn8QeLJaDcXLFk2/tkKCNlrDPnHqyqZ4LOwid0uOLNMUuMMs082
         sy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179574; x=1786784374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/y7c/4lG8eevhNAw7vtPbWQQOLv7HTFTCbAr3jVwm4=;
        b=PtQmu2oSuX64vB4BZ/xl6i4AOzlFfyZmD6Dpt8Iu5SJKhj3OW2h+4ZVuh+FHyaDGdw
         Q8wfu2fK0qVYOvKmEFlbaYZiTN2fcJD8teSAlx660XHHbavWkd3lmm4RhOf3ECuRi/MB
         0C/CzJmwimVKF8HBV37gEoLagKYYO0cOi4MfGkjkB6mUQV7RCFwtZ8W2zewvLl7zzvJL
         koyOtwBbVN67hEGtZGz8Fa+n4siQJo8jjwmHo5/ZyV2hYhcIak5ju7u0yoNuGQZBAUQm
         DiRUIMYuvfkKMk16EWET0sUYXnfXUCb0J7AvieHmfdXyL6IyEojO90N+fCyE4K7na8Hu
         UE3w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2nqk1GdLDrUwwmfoCjno8mvBXgz1KZAyIOtdqetUgADKNADShqu3tBySxpI/7tk6tbJDrJolZnNPW9qy+8g7/@lists.infradead.org
X-Gm-Message-State: AOJu0YwL05mnpS4WxctlG4mXJrbuIZktG6jjoPNI9EsSZEIS3s5p9nmH
	tBXhG2xe/UZrnBlnnDkekTz5JWcXVfWntRv7sCG8PDzvdVPNCGMrkd79
X-Gm-Gg: AR+sD12qn8A7Z6GBHeI0fQYxy+xSVCg2pIPyqciChm/o3WDpDwaLFRMwJQX6h/i+YrE
	YM2CFBgltR2Ur+RqOWWkPg3miVkansyKbnCLJ53Q+Vov5v+vW+fyFJQJ7+y4BO+orkgj8jDrE6I
	aapzMrckMTMwqywVA8MjD3TzrYpgJZLMfTCUMkxcljvtm6WULl9xTsQgsWhRhsCoQlMRr6wq36U
	RJPC780La6RnkG8LkwO55nDebD4fI3R7UPWIvfATTkcCM43jqr6rTdrrBvvyWCMVAIQse5rgWpS
	QGK1Tj2sLaktIWd8gvmOSJMEA7EW4KeIWZzFFCqIeibrGI3s+RtsCXLEXY04uqiCSEyBcYNZsMI
	6F1jGIvD0hMUkeUuu052V2exQZtIorhUfj19uWHzFBhkTSMGIFTrfK93adruaZRPcWTUaK34znv
	rzekk3k99XQn0d7c4TZhDQISiSf4dbYLhdm2LZpbFhhKM=
X-Received: by 2002:a17:903:37cd:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d294b4b5b1mr126407935ad.9.1786179574331;
        Sat, 08 Aug 2026 01:59:34 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a6db2sm17431155ad.64.2026.08.08.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:59:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] crypto: sun4i-ss: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 16:53:37 +0800
Message-ID: <20260808085337.2715506-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_015935_379990_1117CC4A 
X-CRM114-Status: GOOD (  13.42  )
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

sun4i_ss_pm_init() calls pm_runtime_use_autosuspend(), but the
autosuspend setting is not undone if pm_runtime_set_suspended() fails
or when runtime PM is later torn down by sun4i_ss_pm_exit().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Undo the autosuspend setting when pm_runtime_set_suspended() fails and
in sun4i_ss_pm_exit() before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 554c42b4efd4 ("crypto: sun4i-ss - enable pm_runtime")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
index 35ef0930e77f..10c0f05994ed 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
@@ -304,14 +304,17 @@ static int sun4i_ss_pm_init(struct sun4i_ss_ctx *ss)
 	pm_runtime_set_autosuspend_delay(ss->dev, 2000);
 
 	err = pm_runtime_set_suspended(ss->dev);
-	if (err)
+	if (err) {
+		pm_runtime_dont_use_autosuspend(ss->dev);
 		return err;
+	}
 	pm_runtime_enable(ss->dev);
 	return err;
 }
 
 static void sun4i_ss_pm_exit(struct sun4i_ss_ctx *ss)
 {
+	pm_runtime_dont_use_autosuspend(ss->dev);
 	pm_runtime_disable(ss->dev);
 }
 
-- 
2.43.0


