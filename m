Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A31C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=; b=dOoc94xBGiKkc/Fpzqawj15NZc
	VyKg1bE0g4A/5gZ1aVx7HjVvfs9HimI1DcnmvErf1VsqaqSpaEjRneWSgUSIHB8ZTIl7cdy2bBfdq
	hPQcMD7C1cge25MRDI9I2XGZnMmRroivbc722kNAaR2rdRBiok4QycM68U2/lsyZuTPl33CbPNySe
	/ZMd+DDGC9kM4njz2v1+5WthntJDpVbasbYEmvuMPugotcA8J4djZ3R9pwnei3IctsJGPWOhRh1TU
	CjT1W/l581NFU3ylsh3JYm3u/t697VRR2eIWiWZ42g0llLypA7jbpKQxF+Gp0bBpiPHhyJEN9T82N
	tlpnDHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzL-00000003wBw-3wxE;
	Sat, 05 Sep 2026 09:47:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzI-00000003w95-0TEZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso20983025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601622; x=1789206422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=Q2TX/RLKCF2whA8/DAXi204Q4ziRoUbsn8dq6MzHwmrC3EmMeHwixiZDxbhLmwuus0
         1dXIkVHaO/QHZ29yIPsrgqnokJfDUBjlidm/twbLyNsgRSTHJqhN1PMzwNLpYa/0oNf7
         X07LXS9pGJQiWlsJCZ3Wakbv/aIUp8l/qvTS2Jx7N1dG9dkOXeg4NCvlfSjN5dXdTcY9
         ZkMYXADYCn+VBhL8G5v3TBRSJMeJIJzm+/wXGU7Te4LbZBqfq2Xl2Mpd7Aty2OWRuy34
         ED6A/o8NxvvAi7lnbxupg2i02A0uPhxGvVOwSMqLxKMm2ePJYR+5DW0QGgKP29uE7n1J
         6xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601622; x=1789206422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=DTBt4TnE5lBWTSVA70VLVXk5d5TJmD4Bhtxd+MlwIf/nkmbE8k423KSE9nYZ6qs4cS
         gFvMz2f2ern8CRQgCI6qVe57Fk4rpuF2wN7TXwuuQZHWuUjmHPL49xgSoc/Oy/uyQ8QQ
         OW34zxq7jLefaxYtELvGUxp9sdmDNuwyjz0BS6J5iWi27Dyp7lNximxBf093PmsJC5cW
         6+rWnb0MvCyxqWDJ/WAVHPohM65c5u/H45IWKKXXrzF7gtXepnKGhsCL4o0NDbXQ3jdA
         +uaEcN0O5dysUMokBL1FmWGu0J385YQueszYsFtYBWB2zhU1uvvhmYJ4DclKMWyOGmLi
         HM9w==
X-Forwarded-Encrypted: i=1; AKwUvBzSqAC8jKnwwswS9D7LpvunH5ZyCovtifZ6i0odIxXfd3P2up/gzZ88NZibukcH7HcJIBhG9XihHm6CQ562pJ2I@lists.infradead.org
X-Gm-Message-State: AFuF++logHfndpnYkBwT1LOOjeWDzymHQe9UfyKuSCsgTOiRMrFOsE9c
	1Lms1E/SfEEY2VSOjZHAH5Hd3dcygXc2felJ1eqR2n0tt9YTiFCuHGvy
X-Gm-Gg: AYBFou1ZeH4L9HhIAUHv8aCMAafGskTVFGqgZhxbVlYxAik9pIsy1skjCj2h7GUBFxC
	tTzxPUG6tHpzBI/ULcDkTiBY2C62IjhjkU6PPr2gs2MiVI82hfR+kZenUFEV8wXY+WjvB3EPOaB
	ro3jG+Jhu7N9s1hZJKOcuz1mAY28S19tDJzGRpgNyujIcxckucThRTSpL6U/Q5a6KjdKZkkSeU5
	+kxFPuARLG/rqeRtj7+iDixDf43l6+4h1gwJ1Uw3pJXAqad7cYSENh/n8UzawBv65moFAKcXVVH
	yUBiikLD35yM0YNsPf7q62/8yrqxiCUa7iqtovF7B7z0GLpy/Gd/xaR398Yl6d0WUq1Met6XzmP
	HHVsP1ych8FW3+Dfudw0Q15etc6BLHPEPeyVuW/XNz4XuG8TP+AF77TBQhpl0bTlG7GSRxrqHU4
	zMxVmVL5qp7wZw4Z2cj1SMzF+luKk5OREzrLukW7AwJEN4HZ3XbbcbFJilIs7GEEaJo5wkz1F2c
	ZfBWgIfxoQz16tl8raW55mN3xNODDrcBQOX9rurksH+3lj0zSfrXfRbwZSPpSr0iATxSeLzYGZK
	vSmtkVk8NmcdcRhpe54QeV2dhN0imEDsv8zh//1CUN24layNl6J6SYuWISVpEJphnlM=
X-Received: by 2002:a05:600c:138a:b0:49c:fc6e:8cba with SMTP id 5b1f17b1804b1-49cfc6e8e34mr84919655e9.30.1788601621962;
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 11:46:41 +0200
Message-Id: <20260905094649.41996-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024704_164977_01315141 
X-CRM114-Status: GOOD (  11.90  )
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
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
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


