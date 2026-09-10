Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C1C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNvpcd2n4jxJTfGRiEyXYuLqoJRCII7SmcuheJPc0Qo=; b=IXUX2LJWNzoxsJLRAD+BpMTmO2
	hc9Dl8vUAmPV8NeEdJ5PypV8b0G2Eu5n1pMZMMVbNyijq2cMrPBJySS1TQ1ZLX+9ZA9SlX59q7nD0
	aYWM1U/CEVKFKu24e9BUMxjiMb5hR/ObUHJf5imqfN5YHHYH0JtGL3anpxKg+okpgxDvX2DWejcfp
	PbIGg9crSA7RmV5Ry8TglaaeZHXWFu5HVTT0h4AUc7VIPZVjx4auCRqVnoMf2iLNh58eocQguL/jX
	z49AKmETQM2l5sMSm5GqL1Fw2k2On9opOJifIiU60wUrywebCJTyeTfMpPhFL48Irzx2mfmzpbD4V
	X/3Wz5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf7-0000000DBzF-3GIE;
	Thu, 10 Sep 2026 01:33:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf0-0000000DBtH-2wNA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 01:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mNvpcd2n4jxJTfGRiEyXYuLqoJRCII7SmcuheJPc0Qo=; b=OSXEvD93pfyTvRv5g22nSgAypp
	ouY9tlqLRAYUsn8aVguIBJG/AsfIjfdtlF4QclSOPRIOqjbvtYt832iF8AZOmPugzC9eKTjP0NJQ3
	Dn0q9pASLbhY0QB5dWXMNvB7FdaUGhMfHZTfLBovvTGzgeb6PAWx5Kyg4bCBpRpAeY/Xc2c0aFiXl
	Zf99xEpcjJJkOMMI1bAUESLXozGy68cA9R2wSelF3mGEiEmtwhOu7eySszUad+uD/YQ0vWszJL94b
	+slIC5chLMhN58gt1EYgjzcdWtztfCiiH1Yy8tMnrdqiTQTGwI6q65EXsU7ZbcVViX0DTYQVd5tLt
	+u7QuCLQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Tex-00000001sQI-3YVD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:33:05 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so10128525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003983; x=1789608783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNvpcd2n4jxJTfGRiEyXYuLqoJRCII7SmcuheJPc0Qo=;
        b=WNXkOSoEEmZ4m61Yst9VYsmMXthKBYd09xw2TFbe7tFj3zlBpwaoEMLZlB/OmlZiID
         8iss9ZRBk6ggHscESxPHRgeOl3FNBbINZ7jau3oX0Gs9XWMcAcUBv8i9TakYF3rLC7pc
         bglueUOnqyuHWqpbH1GNG4QenazszQFtzxHf+nbMAEzHyiEMf/NAy1byqGRH9ENcI/Nl
         ip9BCW9w2/pidJBRMuWRXxbX3ybGfuSyMaJmOc75g4HmVa0dXYC5qWOqxcis/Kg1q9Nz
         iQGe4IQOGE8jwP6w1Sknwfr0gpKT0XpUeBphftWu6oipoLkR2E3G+OsSUyslhdkaTao0
         Lpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003983; x=1789608783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNvpcd2n4jxJTfGRiEyXYuLqoJRCII7SmcuheJPc0Qo=;
        b=CX68qGo3rVPt8mzneGdW6A9vfGeAwfhk/Gssg4EWqjXKg4FVuOUGUmVXZv0Crusz1e
         eikxskFziyHQ5+TZGZ+k7YzfZuUTnlcoFAX5zTqB74nLJL/mxsEiDE7UoJZXrJPMnLIF
         MXZD2i3xFR7v+OTJZSi0GKKsdyJsmXNbzPZKZpJomn9y2udDaxj4NegP+LVa/lrbYlmF
         Bakl2mYE4Ae43bKpNvJcYqEDpiaJ4xUqYLR00NM7YPEl46XPXZeTXEt8ccpm3bawOSkP
         SffkSVQIWPmzPUCLxinsxf+vwmXyFTR3OB4nsESHLOnW727jKjBNbcZp9RcDl+5XA4KA
         rbSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyjbHCAiljcyO89wDzaJX9gMT/Ukgqd1FIROQ2LttPY5mCYDyLKVVnqgcbuAkrJ4M92KNNHzCeGMrMfCxl75EO@lists.infradead.org
X-Gm-Message-State: AFuF++lNunVKsbyYAN0wrfSk2XtI2W9Mh9Icxyq7A1XadbfsRnkLN+oe
	zuMV7nLiKXCcBjGkMQwyKUp03bL9qBfz/a3eeEaQZHu/AgqulJ9plTFe
X-Gm-Gg: AYBFou0Mu8KTpA9IU+EkpxdMCpvR2WCXVdP5cgfMGr3+hoXV/tLZcgjWr/EJHx1BJxb
	eA2WdDEGUKfMWlDvQf11u1aVyowQpxKTYbxNPewY2P2rDi9ptZOjhVJkSaUWWEmlTL3GQfE/zrP
	iu2tyvdAI2Ejq3CNLc6+0s7RiOpXGI70q/AolCTrd/h8rkKB7asfjnG5l+jR3+002y+J0XcOTOy
	rLEl5qdO+K1F1wgfxJmhH5RZncFrMcz0VfKXIWeHfqGh/VfxGmREaxf0c8s6+qbTeWnM/ci3Wc+
	tJA/wnCS6OYiQFw+XvjuKU50AyNvY4fXMRJg32JTVr1oklGCaOGQ0c0LY0gJqdX1rcjjDnT432K
	G5E8dHES9OkjjnPzzEDpz3YsTElhgv2grS9OqVYiyqfiK3oJ7dtfsjwyaWbJfsPgpCrPVzcjTKd
	q7XoAiMZnxJUkWAwti4RHK6/4dNgkJmkv0gUpqmUGWW9QBgOkS+7OyM1UBq4MMzrx80PGZ34pjo
	esEQZhZznwE7hQ7Nwcoq859RwDQgzFONjSQlWtytG6ZgSZM3D3Qia+FI78zvreHbiFiPWxw5EKj
	Ya1fztLVYLmc7mwGNElKunbtClLHPXZf1Tss+42RTdg+bUFNdDAmLboGRODtEKGHW8vWRVZ0s9a
	kiA==
X-Received: by 2002:a05:600c:3786:b0:49c:f13e:e50 with SMTP id 5b1f17b1804b1-49d26dc1012mr14683375e9.13.1789003982600;
        Wed, 09 Sep 2026 18:33:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/8] docs: kernel-parameters: Drop the mini2440= entry
Date: Thu, 10 Sep 2026 03:32:42 +0200
Message-Id: <20260910013245.8619-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023303_986830_4EE692D5 
X-CRM114-Status: GOOD (  16.18  )
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

mini2440= went away with commit 61b7f8920b17 ("ARM: s3c: remove all
s3c24xx support"); nothing parses it any more.

Drop the entry.

Fixes: 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 .../admin-guide/kernel-parameters.txt         | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f4314492953d..2ed1e2c03c61 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4052,27 +4052,6 @@ Kernel parameters
 			Enable or disable the microcode minimal revision
 			enforcement for the runtime microcode loader.
 
-	mini2440=	[ARM,HW,KNL]
-			Format:[0..2][b][c][t]
-			Default: "0tb"
-			MINI2440 configuration specification:
-			0 - The attached screen is the 3.5" TFT
-			1 - The attached screen is the 7" TFT
-			2 - The VGA Shield is attached (1024x768)
-			Leaving out the screen size parameter will not load
-			the TFT driver, and the framebuffer will be left
-			unconfigured.
-			b - Enable backlight. The TFT backlight pin will be
-			linked to the kernel VESA blanking code and a GPIO
-			LED. This parameter is not necessary when using the
-			VGA shield.
-			c - Enable the s3c camera interface.
-			t - Reserved for enabling touchscreen support. The
-			touchscreen support is not enabled in the mainstream
-			kernel as of 2.6.30, a preliminary port can be found
-			in the "bleeding edge" mini2440 support kernel at
-			https://repo.or.cz/w/linux-2.6/mini2440.git
-
 	mitigations=
 			[X86,PPC,S390,ARM64,EARLY] Control optional mitigations for
 			CPU vulnerabilities.  This is a set of curated,
-- 
2.53.0

