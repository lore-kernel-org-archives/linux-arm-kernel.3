Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644E2C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC9+Z8O8/eDUGiGPsOZTghyv70tTHYewS6bn0ofwswE=; b=WsG+qVnSeWhYJMkU+QH2i5gzsK
	GU1BNLQaAcgC0V+UEjL8gFd14LRJGgpHN9jYexfEscdrnXnrAqTWVTOkF+oaE7UueexhqJLvyzHU7
	ANhMWSLA1RwXfb8qu4A+eB4Qbsgas2ZoLfRS5hjJVoJcJitsuxxoh3P+2McWNEZwVDxU6+iyNo5Na
	t7/20TrjByDQrVaxXSJgRVnQR+71heStwRQjc4T2InMoS502JrkjsKJjVrVm2pfawYEEAGsrr7c70
	m6olDUFCvMXB8PHR1twtGh5JRdYqwu4aZckyUdGelrpn48F6wfc4KGfNaFrgySEMTf91YIPLyvezh
	+Kri8Vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SxZ-000000021DL-3S3F;
	Fri, 04 Sep 2026 12:23:57 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SxW-000000021Ca-32bo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:23:55 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6b1afdf98dfso594745eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524633; x=1789129433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC9+Z8O8/eDUGiGPsOZTghyv70tTHYewS6bn0ofwswE=;
        b=lFUiK+4j9Ykqn/7ZXX8bRDGInQY4OSSqW7CLU08dKk+Ll8s4nbVm2dywdIHIfWGDng
         43H4/cVEzBqCmbmKGyoyfN5JiWiFFlDmxP/vaWtJMlICAuqGxy3MvAk2s6M4ieGiVlqz
         Ga9u0V90uS1YdW35OE5wXWQzudKWlcd/n1FsResgXT9M4LPAulCq5uS5LeQfcvQov85U
         Pecz4BzJ/mhG6qwUT50gN1S3mL5km7V+8inrGsnQn6j7W73n5gNWnrYvXpR9t7YbZYoi
         k7YOtM63apLcnIVE+hSbDMullP39HDnbYEGXedxHo57E5RIdIKbw4nM/GjPSjU9ZIYx+
         vzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524633; x=1789129433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC9+Z8O8/eDUGiGPsOZTghyv70tTHYewS6bn0ofwswE=;
        b=hLVnyjzHVinkpO8UYCxIPdFBRj99sj4fYgTmc5Hq8Y26NGDaZr8CAmG4i36WOIUxwF
         hkFYRFLecrN8mVohN8IeDA/UJar/yuLA8imewuYzZIdf6dAaJhqMEO/mMkEKs0ZwCI4p
         lu0JEqqjz8c5ghWOC7M5rptSeXDM3DOznkM99vTywVlbBixTygRb21QU0+ZaWqji8vtK
         +7GchX1f1EZ4YksXR3XqyXR5imUuaHk2EljwNM8xV9grR7zpUuoomr78WNiaSgyeuK9R
         nsJta2Vf3NBAechqg+xo91bfYIIUEfJR1qtyXGrum2HCHyCqMXPCYzGnk+6rloUueJH8
         lLmA==
X-Forwarded-Encrypted: i=1; AKwUvBzI2Gf3IlIsIGVAWtT2Dzo51WNKtOP3xk27iN6uL1r2TwssfYTjsCqte944sdpp9sX/G3O5ptHeK640mpQ6veJn@lists.infradead.org
X-Gm-Message-State: AFuF++mBL/9XutCakZfk4+gcF/wZuJSAYJPpjfCpz6gb0og8VixEyMtZ
	zG42qPqZI5tiIIVM7fByhatWHpHyHSn1XEfPzHtTb6P7k+rL90oPKgPw
X-Gm-Gg: AYBFou2z5PDE2rRfTCe40SL3lJgtWhO97GC4E8A4kHQzFtbG9NHI9EAOgFsbKH2ahzB
	en7txo5bOqTw5WbZUx5qDPRZalgKCyP/pM0Vduh97+BFnNAg4YHT6dKb81SYskpPpl8IPfodoRI
	gJtY0BhM7XHqIAA02WMy+efk82v6IukLhgQcp4Q7n/LX+YEkCaFP/gWZ1X30v6aUKLPjLg3dMVY
	Qepv37mE+9VeZasS6Jy3gvAdGv+qZOSdcdB/0pSsxQQGv5KzCAXKBsn/XRyE+LhMMVZ/NkmboHL
	NJaEkX8liYrdRG10osV+cwDNQrHWJOHomyqfaoHkao/M2ztNtBTtkLWy9AK3FeuZM7hh3fupzmO
	iblQoOvM5jV29kdmJZvYX1WTBFbwmim9PPQCJ+CnOmuCZ4WGjEK8lEuVWq6LtuQKQG26pj7A+Lf
	akemVF2860yf0POaW91TRese0+gLWWqjYMl+P5Hbjgzu3kuymXSHb4K3KFJjbVGCMDab0BBGg5T
	TvC6A9Ji+64JwU=
X-Received: by 2002:a05:6820:f023:b0:6b3:8240:b2e9 with SMTP id 006d021491bc7-6b6fbcd088amr4336612eaf.21.1788524633505;
        Fri, 04 Sep 2026 05:23:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6209359c88.0.2026.09.04.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:23:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] ARM: mach-s3c: fix typo "capabilites" in comment
Date: Fri,  4 Sep 2026 17:53:40 +0530
Message-ID: <20260904122342.30456-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122342.30456-1-hemanth.selam@gmail.com>
References: <20260904122342.30456-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052354_763152_0399E498 
X-CRM114-Status: GOOD (  15.36  )
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

Correct "capabilites" to "capabilities", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mach-s3c/gpio-cfg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-cfg.h b/arch/arm/mach-s3c/gpio-cfg.h
index 2dfb0561001e..778103412cd1 100644
--- a/arch/arm/mach-s3c/gpio-cfg.h
+++ b/arch/arm/mach-s3c/gpio-cfg.h
@@ -36,7 +36,7 @@ struct samsung_gpio_chip;
  * @get_config: Read the current configuration for the GPIO
  *
  * Each chip can have more than one type of GPIO bank available and some
- * have different capabilites even when they have the same control register
+ * have different capabilities even when they have the same control register
  * layouts. Provide an point to vector control routine and provide any
  * per-bank configuration information that other systems such as the
  * external interrupt code will need.
-- 
2.48.1


