Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1C1C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=; b=CjnB2hpAr3i3yadlOLNyjm30og
	lLOrGAUl2XMGw8J/e9ngyacDj7/B69d7k8h7vpB5+86/jnNjsivKtauvhH1dIdu0BdKZTf+9nQXJ/
	m84etn3owmlUtZF7UNbRpVupEzFXlP5Ejs8dWF9NZ0iNLDWCMK/vaeo19OPWJMhKjglJB5dXoFq50
	Us+uRx6JVxUA2zVBlCXJCw4/urBJZIlQLIfD60xsetn0j8WwevcpJVmXQO1A9aQ/3q8HolFTnDPoJ
	2MrA1I6l22GyWAp/Wa8nSQOu3wXxitrOVUsSo/icr+7EOBOVdcd3MGIAMD+Hkf0q0I01mLxYubRpj
	ooRdjTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf7-0000000DBzW-3kDu;
	Thu, 10 Sep 2026 01:33:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf1-0000000DBsz-0DBN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:33:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso62852355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003985; x=1789608785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=S+6LIWXl5x2CZvprvH3A93qcr4aG3hVVq8KrVy+8/5hBmFZWaztGvKxK4vusz4zbjt
         F/wcfWQdav/qnSo9edgS1vB5iqdvIwsboG3ZaKz4EQWfCoJ0HQl2owLNf4DL3tWgyhW3
         yRLvajLCG3ft9uGTY+7BInJF2AbjvPtOlhT5pD1u1m1CIUdNKV/edmjQmOVchXt2x3gn
         8fiC7diycNEwqKGNjUsJTapvV2EQxbZZMTFw2uNDAMu5kqiRZYBtNmmj5Iv+5Dfjjiwe
         5zR9j0DPKsSWH7YJjwCBmOf6RwptiBSI9yYWWfL2DLPtv32ZdgTScWQ96Aolq/htxyG0
         IjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003985; x=1789608785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=ZIascCG/bFHorAqgy4f/KCk/oG501Ajel9dZPbfwrm7ireLcQxR3x/euHsd9y1Y0Dx
         DrxTOHw+b589VQlJ9m/dZSnbxvYvFrGeWVGXqgMC/I/oIJqok7M7wFxAFNNceBNZyTsR
         PtD3+d2HNZYuJgIXA9j4fXjlWoXWkyBGeseMADppfi47Jzz5mG2T1KmBPuxti73LVwtz
         cOX88J6X2JeQACOgr+PlwR3j3Ab5uBLYSJ9gcR0qNMMplSsrB2NibQ2SwDGupKLPqGp2
         Tpg3Q5Y3n6S6TSRlJQIGZody9yCktTDojoo+c3BmOSn9E2oGT6GPmtG9WXACKvamqVoC
         ZxpA==
X-Forwarded-Encrypted: i=1; AKwUvBy/D6Mi1zjRizm3L0pUWsR+2uZqQTHUlpsg+x6oWF9SmqITyTLWytRv6dw6tk2J5KYTQqsC3wRQUynT/DyPn+PB@lists.infradead.org
X-Gm-Message-State: AFuF++naPlhD3S/AeqqFmxdF8JSQOUAAaiAqX7u15IW54S50CUafg1tL
	7Z7Q8fZBaeCYp/wSjy9vPpLHnCZmwopzaLtHE48F3GsYtVRmeeeAxEka
X-Gm-Gg: AYBFou10EhOCICr8N/kTLy4kmvHTh0LyLkmf6L+uLAMFju1hdQ5lSPnpj/dpAM2RtUo
	5EvHiFr8WeskxQ7tPyMmXMuH6UpXL5yDOEj6cyPv0p7KbFmseaNsZX3xqc6M+oI8pfjF3P4dmG7
	HMVx9Ch61H8maGoeDfyQg2UirQQJJv0WOD0EKGE1eVIrZiVBs5iSc5VkgPglub4O1Cs4mllKww9
	u9fxmuFn40ArMiheOILmujPAvK/YtQQrZrG1TWWBdeP8UqotXNjbmGCmKej5haddbjzJXyOQ35o
	OCua19vyUtxOrvaBFgblkynbiex5rR0U+pHjgUleESdAldPoN2f3dRlc6V31eDEQ/PwhtjIA8PD
	eBhrYNS5qVoSm81gzoO807sXq0Z8cTZTPpPfgSHvBep1ewnGzH7HzwwpWzGkjSS9D/msrgrMq6j
	GtsAKFOCpzJ7u9GkhMEVryU+g/JzwL4uEQYhJn30CKG2U2JDvhe8Je1wFD/YcZN8xLhY+NG2CKZ
	zw8tgf86lZSMPoL0ZoSuaZjIt0gW2ZpcbL1T0HecI9jbBg47iR13KPara0+P2j8PKEAUTcGb0st
	hSyrOlkeAlLwfJpMU08fspOQD44h60IHoTBU5DcZC7dUROjcog8qKIoJtejiXFca0BHf75/VRkN
	Ocg==
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr11506445e9.15.1789003985034;
        Wed, 09 Sep 2026 18:33:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:03 -0700 (PDT)
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
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 6/8] docs: kernel-parameters: Drop the nomfgpt entry
Date: Thu, 10 Sep 2026 03:32:43 +0200
Message-Id: <20260910013245.8619-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_183307_111665_AB87A3B3 
X-CRM114-Status: GOOD (  11.10  )
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

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2ed1e2c03c61..d44728a45506 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4553,9 +4553,6 @@ Kernel parameters
 
 	nomce		[X86-32] Disable Machine Check Exception
 
-	nomfgpt		[X86-32] Disable Multi-Function General Purpose
-			Timer usage (for AMD Geode machines).
-
 	nomodeset	Disable kernel modesetting. Most systems' firmware
 			sets up a display mode and provides framebuffer memory
 			for output. With nomodeset, DRM and fbdev drivers will
-- 
2.53.0

