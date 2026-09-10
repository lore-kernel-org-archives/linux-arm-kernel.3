Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D33C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=; b=VZPSV8L/N8aIhDAgCEnM3W+ZDR
	LrexPphrLj5pkbUp8A08kJOcK9TYWr3LuiIPailokzqAUmmrnD09DYdSRp1oOFWkpEA65yCKxYCyJ
	xnGzCj012gtOqeI5omBEMx+a6Bjim+4hXBK9C9PkeRAjGOS2vSwTU+/SpcY03MK+2ngwnNAV/TyxW
	+0VtBf/oQNAOsRB5eDfWqtBmCqore+82UeyVUalcOSmE2UOdh25s8lHXbprrqdvuy1guc2O7U//UI
	msntmh7LLthTSFn8myDizq/3X+hsdJQhVm6b2FmBHB1ZBb/fUHDJP2BS2mXp8vM03E2cX6peyXu8x
	ZBHn4dWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tez-0000000DBsX-2C6v;
	Thu, 10 Sep 2026 01:33:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tex-0000000DBqN-3RCo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 01:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=; b=mZLb6IEmPlipF5sVmv9AKC6qBh
	72agV/uEP25groTucFo2XV76zwkIW8bjrGei2Hj9OhjyJZ21WKUOaaVcvLTyYKBOtT/7PYFJln2jb
	54Cdc0mOU1fzyREAfFAgkX+qXLoe2GGrNW2bKhQY3mmAHizJ9Efcni66eZm0epCviqK2uc/bmL7M/
	nyoMJ2x3tgPe1bmvH81OBPQ5gIMK1jHOqR4UomuQF9vsFyfHRIxuzYFyuPPGscw9kcyhGCcoE2HBe
	jyOifp20wbwzQIA1v+R7THdEtmW3j2KQJbaKb7O5ekCECTkJSOQ8jKE1TBhZHV3qbr/qc+zHe+CjJ
	a4VQtpBw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Teu-00000001sPS-3dJj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:33:02 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso6036005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003979; x=1789608779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=CVk6DkW6jwIvhFcty8iC2kaVUO3ZYTLfx2gzRj4LuWUG0SZLNwC1RVoV0K2m4nOTCu
         ns1JMu/+4wXC/6kcV53Lc9IAWAd6mnxRxNV/HggpD4seZvAKFKccp/r8o/ptMoetqsb1
         ywHusUD7KLBsPh9KoeFW3xo/T4LiZHGnELdywUz3ANd4qBfdzRNv4Y3bLkZL14gzmKdy
         lx8jyIwpxnPhvtRsvT9+tJb7YB8xI6sgXRMFpGV2/Yp2p1sBN++rv9a/TSR3gZGlF0dt
         9u4GjXIi0I7XkGSytHJJdmRKx/wUwlH3iK2Uj8CvGXi3L/A1/oEPiBxUd++vnKQeIFrn
         Fjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003979; x=1789608779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqEAObzkBokG6giVkbje5sCVJ4bEsrze6B8AG9wEiz8=;
        b=KJHURazZgMb2qYjFOySRcnriNBM56N9+C62QEXVYC6Lhr6SepkKeiFME8ufFZadPrX
         UVdPTLBbMDPOvoXrx+IdBHXMjKKXCij7af5aSu7xVvDJ/4TfUnNK/0BwGKJvN0r2Yoxx
         gie6JEXd3HIwgqdE7YwXoU9YYKsd1876mgYH9wKUxeIt61n6w/oPp6xu3wMKTTefsGw5
         N+oUpH0PhYARu2pFS1q/8pM1U86LXvt+SLWBT5gDdJQ0mILYmzsNwPXVdeH/P/iMNLN5
         ibyDcrMPQu4SP+KZxe7z1/C2bUnCA0+13SfhFtHa5S2gtPHal/Xys6hkg8xAQja2ZXYK
         9ZuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbJNNHizJzzVvgEX+EcC3rt9I3Nsw7KCugCQ2CgAJD2AuHhIxj+9ttPI0Cjoyz7UghKnfwXxEWUFYMfyN0vRnm@lists.infradead.org
X-Gm-Message-State: AFuF++k/bunD9HbrcVjeTPMzEWVp8zaHOOhUvvflGm+1+dgt+ekHgt6j
	Bt2vNbRt7Ths/95ICYmpMckYP/rig/DB8z8HHgGvQaLPjRmwR9UDa9db
X-Gm-Gg: AYBFou1CgxocCzt/fRfmu1ZHaaQe8pgIWFSYQln68ACN4Gif/ExjSyY7Wll/6kUZ4UM
	3JFUPbP5omD+Kx+PTWZk8dRjyDth5orSleGe9V1rwLLz7l7kkshEDfb+rfAmGjCiV5QcZQvShLZ
	KkrOw/YCxbTFTdCo1jdhLnV7Us+QILC6g/M1sdeKdEMbnDO5E7CmZZAImKbidbWSM58hvPiuNhm
	5/52KW1UINHLHRsHi0Q5Y6wJc5tLDqpktmiz3+yWMUlRnMLIKGVqn0PJ4dCDWH9jWe41LkaHCvR
	betJfdz8AUxEvcSqn9Y7gwr+AkwO7Yk0rk8mHjyl8GDsxPpLO34okbeH7tySZXzI0UKtnnhYQOx
	EgeRzSoriI9ayNAhO2PKtjMVZE+Tj37osfAGmqQ4jwbT8L1Fa7aasjDGJXUMuzqFCw1Coi1N85T
	Y9lBEE+YhmikIXi6QF+NebfBK6Kxh3qDDwa03r59vmavlxPKEzF18wwPPdp49uIOwrZbIYxtx/T
	kGQbt+7INtB3AvvcPU2axYaR4dQsPFm3gWYDGKGP8M1SzjRhC+hiEyK6WyN1xyEKFO5eTB9Qpyf
	Dmm8KhfPxCHy6b1W+yNjYfnjXf+rFBiuQmnGaExqF3CDxF4rpnkId72GrAHNfgxXWnj2jdiI2jK
	kYQ==
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr54568515e9.13.1789003979463;
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
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
Subject: [PATCH v3 4/8] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Thu, 10 Sep 2026 03:32:41 +0200
Message-Id: <20260910013245.8619-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023301_114432_8238ABD9 
X-CRM114-Status: GOOD (  12.65  )
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

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0

