Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F008C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OcF57hu0+g/ff9yOn0KrB5lQwjHMKCpuTDcWS1ABzmY=; b=jG6HeKyJz+ZVTT6DgwTvbuOQJp
	CYvDuYebygNR8p/o1J7ya0kj6dO953bORlAh+d/BwFHWOlyYc9p01ZRZpJZEutw1ruDTKo2i6npwr
	UY7UAcuvCDBE/MZA5kI/uWZq70QIHVRphMDWNxTAozuHEBonlPoGjWdXfEI4Xq7ma5Ktm8dovrrpy
	85dRPbPeJwKF8xUAl9Jp0taTjQHSW4YGVN92VUknoFbHq+PgaLg9nOJahXeQl/BxDl/1Z+pYfff2U
	WUsYAPEOo+5K3/wByRNh3JqQthf21T2PC+99YvYk4dOOpU6fGenXwLiMbleEwlC4SvNlfC51H9V4u
	C64ud99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Sot-000000060uN-1sHk;
	Mon, 07 Sep 2026 06:27:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Soq-000000060u2-3jm8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:27:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d8fd3b729dso25544825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762424; x=1789367224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcF57hu0+g/ff9yOn0KrB5lQwjHMKCpuTDcWS1ABzmY=;
        b=Z7pne5RxxUyfnazf2iqvYS5U4WVToHwrqGj1FgfYxmqnFo1LzqgC5gD59/9IdN3Wkd
         NYMKesH24PZ0TPPdR5d4oicrurDSE5Mfn25xHU+DNtNdVOfseS7hP9APlFz4fNQi99bm
         cbQLcehDgS47sHB1teQLMw82fyZuZqA5Er8fYrF9jv7SOIQr/XZF2soafi/RjzY9H0A9
         ANsAM/yT5FuV6Cb6ZAgLtue+mXOHDQaOIFTcWxfbSvWI1jS89YvkxTjpSa3TBWrQ6HPr
         Jx2pXaHcUnGsc+8D3OltX1IsuvnGlXS8Q6OqAqYBg5qyFJW64dfHteMAppEGQs8JjOhz
         mcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762424; x=1789367224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcF57hu0+g/ff9yOn0KrB5lQwjHMKCpuTDcWS1ABzmY=;
        b=Tikv/rRyKflw9kmP5jHBFw2Dht1QZ3I2OT7V6oTkX4vjJTUTOF+x1U/NrSXD6mt4ej
         CliCMiqnOxGuf/W+klu6Ga6YgTvi/DijlLOOEayyLWBOn4YM6yZilA5yb/mzBp7r3U/n
         DxMctOWoZRChzVMfJlPVVfpWDWiQikGoxlgF9sIjSLZWbhNqUwc+UkvmaFY+4kxWXXAR
         EPYVyaWicCnLWSdsPdjy2ubxbGDKSfK21tesAcx8X04Yn0rJnldkqH6PVt3MNoVqwi9h
         IgDqFF8eAofZeyeBJGS243B4pdtSyiAEKlki66py8mZdD8nkDaheKgC8dEOHwW5eCvUw
         8nRw==
X-Forwarded-Encrypted: i=1; AKwUvBzjnMloH06NgxX6ESjYnBiinnD8drDRlXrM9CcVAscnn5tklcGsq7wk79Cmn5vFWzW2paIFF//QdyWGpYX/AZ3n@lists.infradead.org
X-Gm-Message-State: AFuF++kIyy5CckRizg1jd/Q9SYBlgFG/Utf7Ex8EXsQzIFZmiW3Ik0D6
	gSyfaYy8NQ15uPVSukorIh4q0wtwR4U5y/5FKzemesAWEYSUN31DzARf
X-Gm-Gg: AYBFou1UIbx/U5uDN0zh2E01wUR4wRakyN33OnD6OgpOCPxGEMTprhXX9rabb7SdGHv
	yVbx6Xp8Swg51+7sU7ZklmAsucIt1Fk5kffoS2x0RkjkYfb5U3aNVfiGnfd4IJH69J9TYvRIgNz
	9WfMEqwuE2mcSGLLZLNuioS07uRizUyjyU0vd0UzOGKXqftlQYosczAOKPT6HR/AqfWPc3LJr7L
	yLfIWMgvEggXlnq+TswLn/ctSm/ulhiD21TTd9cVUaUmAmiFR9Y7EvvdmT1sIvvfugefYIdim25
	DLdpfCdaj6OEQkasvB6CwlGo1APpY7bThuvmbG2WFS7MuKL8w+IPI1bJdPi/Thq/XvX5AztZGDv
	sTOLU+mibX84OVNnwwMWg8GjaNxc5Uu14tRLnsQXHDX7zJJBu+KPWEODPJ8qm0KF5gZPBS2+IKs
	eebNWWheFGskmN5Iw4U2Hgay+zNz74FSrYw0s0JgTdo1rf7II5QvN9qJjUTxSni+ik8PkdBPGG/
	WgJzDv0YvpO9g==
X-Received: by 2002:a17:903:1b4c:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2db1262325fmr342823045ad.17.1788762424119;
        Sun, 06 Sep 2026 23:27:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm20404392eec.4.2026.09.06.23.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:27:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pwm: fix typos in comments
Date: Mon,  7 Sep 2026 11:56:58 +0530
Message-ID: <20260907062659.15500-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_232704_933796_F30C36FC 
X-CRM114-Status: GOOD (  14.35  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pwm/pwm-brcmstb.c | 2 +-
 drivers/pwm/pwm-pca9685.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-brcmstb.c b/drivers/pwm/pwm-brcmstb.c
index 790ef7ffbbe5..78378787e4e9 100644
--- a/drivers/pwm/pwm-brcmstb.c
+++ b/drivers/pwm/pwm-brcmstb.c
@@ -101,7 +101,7 @@ static int brcmstb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 value;
 
 	/*
-	 * If asking for a duty_ns equal to period_ns, we need to substract
+	 * If asking for a duty_ns equal to period_ns, we need to subtract
 	 * the period value by 1 to make it shorter than the "on" time and
 	 * produce a flat 100% duty cycle signal, and max out the "on" time
 	 */
diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index a2792b803643..3374ed76f8d3 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -54,7 +54,7 @@
 /*
  * The time value of one counter tick. Note that NSEC_PER_SEC is an integer
  * multiple of PCA9685_OSC_CLOCK_HZ, so there is no rounding involved and we're
- * not loosing precision due to the early division.
+ * not losing precision due to the early division.
  */
 #define PCA9685_QUANTUM_NS(_prescale)	((NSEC_PER_SEC / PCA9685_OSC_CLOCK_HZ) * (_prescale + 1))
 
-- 
2.48.1


