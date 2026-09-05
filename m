Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2D5C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=; b=nmHzFEFsvWM/s3vLwhh7vw/qWw
	12KiURBj4qGMAmB3naHdz8f8AQw1kOzdKYNquEKynXjnIJ8fJ56Cx0GEsV31k/V4D37pNXTjsWKuf
	4ImtOMPKIgCEx0DzGATpK1eAd6E6CiafmD5jtQQ0f2Xisicy2SYz2JsMWI3Tp0J2Y0wsIzIEaNNQ0
	0L3bNuJXWX8EO+xTQNWY5DF5uR/WhlvG1DO/ag0SNld55PBUd5XmgMIIf8V1+pkGtut7O2anQ341v
	M4v/D8j3tF/VNFQnkVL2I1SmTnFliP3tc3nZoDslxuE6ssBsgpb4w3nCdKqU33cvuYWBdV6TrEmpy
	dyxVthIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRX-00000003lC0-2k4P;
	Sat, 05 Sep 2026 07:04:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRS-00000003lAM-3Tie
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:03:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48436216a98so1173851f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591837; x=1789196637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=agRuW9PSCb/TvhuUBCM/BhtKZ0F5uhRTh0tnFRBBcR3n3VDY3MZWgcpFlJjl4Ct/uV
         fwG3KoQRP4yNyLUBqR/jvJEFnCuXLAt7VHX9+mdm6gy2pzsAhhUSTMGcVTgJ3R6MSYe+
         zRrmQGNEmzTNz6wh9b3GlmY4LyYb+Boljjh3Qqk5BKFJeZfnkpRy3CnPdRKDy6JbEios
         5pRCraLhJ1N86Hl7tje0sUF/IRjkyHizLyS5ukb8k0AKsnsEZqVjnl/xSjTJSPV9sUwj
         kxjm5Snk2sbe3IoN7kAbutI6oVVojkS2LCEAkbqKnrxMeO7/WX7bdJ2CwvwKjc3FBFtg
         jY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591837; x=1789196637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=Pfi0zdh07p2nk60jzORkApDiMBA3Mi54dPomguWH/XZYVc4KDIlwmlAFbAPEuFS3jx
         jKO6XWwJ0txWIulzHu0OjB5VAZ6s7GwkNEW5ZFWZw4HgFeKFnYZADOrmgn8w32OoOv6n
         J+8R/g64RPvUrdYYMfEV0M6+8e8ybEx+9rEr2Go/L4suf7HNfSgjRjPzdbxDuvWyfMY/
         t0kOwpL9+PlPYRNA3UMhQPRFW9zO78spAoDCXmIxagTCtL5b/CPKAt8ERRbalS8Bt5TL
         wI+74OTBEllshzTMl/u+PLDE8mchdIYEG2IidVwgq49xNEK70mQJLkzJ2XrIXkR2FFNb
         MOkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1Db/J1j4l/K918bnc2sR2c98POKNDyIvVJVo6CKKspx7KIJkUl91IuJ2UiPlXAPwoPs2KdjLD3GiDz5UmGk3S@lists.infradead.org
X-Gm-Message-State: AFuF++kLn8reQjw8lzoaLu2niaut/CeRh6Vr0BOa7nh7vrEWhixHdjX9
	XrtAqMjR3tai2YeRKZ0ZfpkhhPMeooZ2pHDQ04iXfw78F2jJ2/lwS2tv
X-Gm-Gg: AYBFou030dWsyi6/5/jjwGLsnQs20U2nQxEo2H5e13sJoIKx4+6Yig+/gOlXuMQMbgl
	VyfEVSQ145erq49Ty0enkSynHsFmK27WxMkg33pKj+uqrtZLLO1aPCVm/QGxXkrwyG0DXXvQF59
	hSEXXf9cTapJvcU3eI67C0/GxeE1txUVMDQFfpu3iKtEPJm9+gdjzb/ma+kDentKwJUrE4qSldR
	sTYACP6a3whx2icBX2hiYWCro9Fnxe4wM2fmHWCGurHEjwLy1/YriUcNS4Jv548ulighhzE43XB
	gJQF4nhO87sUKdODFdiIoScMFoMxGzCJ4RTjE7BS8aLxXAD7u7snpL9v+t4xSHeTkjCYeM6ZUZd
	B0TTv04xwJJ/obm/ma6laiMy8uWXTq1DAve5YLw6gFOITc408EDdPvKcHiVRUaI5muqGtiVTFKA
	5JFZ6OOJdmkYLw6yXK8CCzJnFBX78MP+kNoEtioe+MgMdOFhhv/LmkbSe1XouwzG8vrFaDFpUqY
	i9jMtyJnJT9BItreEpovfuICXsfFNTJbG42qo7SdkUvQgcoXjgEFxhLgfk0iyVPy4McYu+f1WtY
	s7Teou/tChNUX9Q1hEZTrbznh8JsylyUZ7SX3XBwh1FHSNRVTiQ8sVUJmF4vLFf3/NGo0lqJ
X-Received: by 2002:a05:6000:1a85:b0:485:8c17:9775 with SMTP id ffacd0b85a97d-4858c179a0emr7751270f8f.55.1788591836769;
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
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
Subject: [PATCH 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 09:03:39 +0200
Message-Id: <20260905070347.25902-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000358_882954_E82904DD 
X-CRM114-Status: GOOD (  11.68  )
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

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0


