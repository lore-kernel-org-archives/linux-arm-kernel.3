Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C28C79F8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5lgSAOpNjAXzpb467QfOiibQnaDkCl6BQceKsplpJE=; b=D9Ipgbo+zrB0VjCVQGkwpoOSs6
	3WKqT/WV7CVJ6HNd+lTRFzVB/2yDl/oJaBlP64pw3DIWwq2/9hxqJ6Pwym1fmc/bRqRZYOCs22r0k
	Z5/IY68CxZIjQehOa1jo75qh/mQoFZGtp3nKnqgQipqYfyFWGZPBRzUGKXb+G2szz0ygg9f91vbcW
	icmEm4VBWaoWVagfTIsguJ22jGf3C23SGgVkGyq5NBSm+J0wqCpDxKoCQwUwelr8M4lTnzWxPWE8p
	T9wHir9x6AIFm3nd0aoSkG8D0JRAuI6Eie7HHal1e05PiReWw4VJCU0Y4fodpKDKcpGmGopCRFXHI
	biiC3Idw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRc-00000003lEm-0kll;
	Sat, 05 Sep 2026 07:04:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRa-00000003lCx-0HFb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1208117f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591844; x=1789196644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5lgSAOpNjAXzpb467QfOiibQnaDkCl6BQceKsplpJE=;
        b=q3O5Eq34WwD/B7IdKBXfmT7rJWmQf4FU+k6t7I85EOnEEETNaSr2Z/18Gb57UScAQu
         EkSGHLqJEoKA+Os1Xp0zq48uvtAonvq9HpI+jIiDxg127RAaNJKY8mHdb5hUKNnSocb/
         M4/EI79Vgv9FsA2fJd7vljtpAj+oKZeEUdl2aN7PkIFHWnAFDrn3b9esdsDP17udJqBk
         LofIljWCNC2Kj+q/t0dIcY+iHDGhguYWtAb814cWJ67R1aLjatxHf9bEcwM746QRy/US
         svwopVhXSMyre4l+fFFZ7c8/UL8gu/lvjhR3Vhz28kRWEegbkCjrhWhzv0fsUdxssL5K
         ZCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591844; x=1789196644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5lgSAOpNjAXzpb467QfOiibQnaDkCl6BQceKsplpJE=;
        b=kcccMljF6cuUgvWe7wxBtz+tfxW43juhZPSjggpRWLztsleDSAjsYzKEUGJBJzK8T2
         YHuO7id+mUcaJypG7ysm7ogjtPtz3ve14T9P6rPmFEEszQeMvdzMGK42X8GRCIxKrOBI
         I1NHj2ZmcWGSIdc5tj25TsnueRRYTo2gR+tTcoermDE6yjR6f09j5poDI2US0tTQh/yA
         jQIDC7frGVJ/NzAwGEdRb9XYcNeEWRCxvcfP9Y+0sJ68RruCTuCNJcIaqgTt2bLBMMwF
         2NLNDaTnR+jX+ZFHoy0azhcVzh0RWC7Y2lS7S//LR8EH09BFmbsjsGmPaJWz9w2FWflW
         6Wwg==
X-Forwarded-Encrypted: i=1; AKwUvBxzGkNs949SW/EA9Mqi67hCa69KFz3aYOiJWmXu+9c51Tc6O5qI2BIPbsYmpxtoVPLRqI6eeJhgKc+XW/8p2QlL@lists.infradead.org
X-Gm-Message-State: AFuF++mLXVVeeHXFy+EpPFGdyNEUjAONzkNhbzx+Fr8enU7U7MNxzaTr
	x8aweaoZwsnOo735ise2Q1H7m/4h8jdlTJjsVgHsyyzai3cPZU4ix8jb
X-Gm-Gg: AYBFou2wt5+HCjhm4CtXkQNnDlVs9+HZ0avkmGd0HPZAlF0QKEGr07OS1Ctb6AwQuX7
	eA2fhwJjHzkbCNGUn6Zb/PuWSjrhpZQ+YVvQcTTcDVHQddqo5HywuKUUhYFZm+YsAKERsz5IVVK
	S4aIopgE8zwZGQU3kSYjdsybCW6ZwrTchBImNpTbLnRjpdSsoOMxBT/s6I+Gmui1Z4xpRvoZCCj
	LqbZKCF/WJt/VRdFz0+XEiJsbckCFyU4ESrZIfRsJbrNgTbYqUY/kt7IfmM4X8riuCwb0a2Er4f
	u4bOEIil15vx7dweG2aywJtux41TvVMDv16kIeqTOGvbNcipwtmsRlwhFrv8fOqS2JJdg69h28L
	UTYGDC6ClXx7ZWoCeiI+0bpwHKuZYMEBV1Or+sj6DeXYL0P2V2wW/c3PQvJl5qUNuq2CoiLP/Dd
	YXTk7synpreDbcajFsAHZl52dItpI2bX101sDTF6vryDO0xH9hyslm3aPNmw+k3fsQWDmWLZIdk
	+2Bye2XibwjNw4db4Gx0wfgjstWKj9QaM9AJwqbn5BMiKyDEdzRzYzDqxBvOp4AXXqT059akqzV
	rGeUhlZLxGscngh4q2fhWlPXuW+DP9juE1EtEia/gG9+DbPdNnp8ChMM16BcWda4sXvVTHZQ
X-Received: by 2002:a05:6000:1843:b0:485:8c17:9767 with SMTP id ffacd0b85a97d-4858c179a7emr8752866f8f.41.1788591844264;
        Sat, 05 Sep 2026 00:04:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 5/9] docs: kernel-parameters: Drop the mini2440= entry
Date: Sat,  5 Sep 2026 09:03:43 +0200
Message-Id: <20260905070347.25902-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000406_129717_7D456BA9 
X-CRM114-Status: GOOD (  15.41  )
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

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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


