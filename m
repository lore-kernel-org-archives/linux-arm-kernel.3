Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB6DC79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=; b=Nr46QqDohTu8niC6LsBqhLUDsu
	cZe8QCgBRLMFFdJsmw94D336f9s4HvRI/TS4q+VzPQmy7gIAXlIAvTH18lXUfYSy8So49xu/VUv7q
	0WaBbtNkCl7dnHTX4MJMJws+IqGbE4/2Mtx9BzIg1mgi2TEIQC/qLPUP1xpfuhKg4WfFT/950I4yb
	SoJOy6whHleaQ5fOlm5hjpGR/d7BlAJIM2Rd5uAcXLAqBJc5Fc6IAJEeAqaUX4fFgSAnlA8q7zG/W
	tRIRRXnd8oObsEC/0p7ac2wechOYrJZv969wTovCsuddmPKOxfMe6p0JlMkSKgqSUTdYS7Nc5sshp
	D2lVcV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzX-00000003wMI-3YWL;
	Sat, 05 Sep 2026 09:47:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzQ-00000003wFt-48wj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-485850cf499so1065523f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601631; x=1789206431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=pKeys+K6x8odyHmc3GtM8QOdFUMVTvKURhA0tCZlHsU/08Ag8kzqGvCRAJy3MjGTk8
         emrQH3gbTWZRaeaADlzVNfab5b9AAKSs83rPcpWD8AToVCV3AbJ6uQgBvzaHbvYQOMxn
         JrLPptFZgd/FmhGRDK2XAep5YQefxxh4+X2eyKcI5IGJjI9c2WcLcJXv0We+uY5cNBKs
         JX4cZOB+xg5X+CfZnD2yPmgMxLeSQEVV8SylNoofpuacxDA1IO5v0JWBXR8YskToOE5d
         kuLRg60mUYHdbB+hhBhJ+lpXmRhI+K0vt+5RmM+rs4lvTHC8KopGhAbCkTKRLA+A3zmb
         jNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601631; x=1789206431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=lCOT7GZpDtIi546f43JE+nwQ8Qjn9epHX4LVQS2Au3I9j7bQtiuN3LIcIUjvXPdrYf
         Hp2UaYny8ebAf7BJokt+Ccq0QStXXLlcxkgkQMN4jWtWAI3+x8Bew+HiJZB7GiiuvGi6
         s0JYKdV1MZE8Y0e4CwJDojX1YXkJp5briYqShiWVIQMETzT3uwtdsuBtyjTPKmoEh6xE
         eSpsEa38sBIzU8U84AMTTG2rbWjvDjYqQQ4C0MwZYBIuTl6RsHYZ1drqJwYsl5P1kUrT
         uqojBs7ZKWwKhSMNAbQ1XoqsHR42US7RN6a8w5d293eZnjMsI914Fc7OsmPRC78z/5p9
         uVEA==
X-Forwarded-Encrypted: i=1; AKwUvByNczzwzRKp7rSA4f/dJqIAZ3QinCNtFekOtH3aQe/7LR4CtAvfSon/qArZgGXwm6DugNnktVsb0/BkdefLxul0@lists.infradead.org
X-Gm-Message-State: AFuF++k0ZjyEyGoWLSnu1uovIuDoY8yquFKnYYWoitNNP5V1plPracDk
	1hrfHkmJ+4ghXocRThC/Me6TvLtQjIb3o9MXIINI47rBR2DAA1OreBbF
X-Gm-Gg: AYBFou1bjdn6CNa1BwmuNjOj7DZfyNAI138y7nAtLlmPHLCN3y/5DVN8uWP0d6dJ4KY
	m+sl5kXz9LPw4/PGAPKDIsBcbcByTb3wTWoT2tilCdkjClOMK7dsrvKDykkcV8Nmnsr+hF8bKer
	o2qsANLmxBPwhwXu6ip7GIgGaR0CUE5axhcBZ3DlFyiesWDl+O3EGFZek/3BrXZJ4AOWJtyfewo
	2G49yYF7H0Re5DNckSGifVBYBVRS4iWBHMnQNXZLStrkSmPEfv0ldInqz/L8U0jFD+/9jxyofr0
	MoClbfHpBQUP1iqjdznflZIH7nknd1u5dXtZmjVPH6iyYQHXFGldeihDwFAixCHOEVrz5zUoQnP
	786rWnoVsE3RCD0JF4jvzyd29tnKA4y62bTEnzw8r/9y8jLKR1NSpRs3OwSYBSeuTwxdJ65Zlhz
	7Gn8I84HF5a2v1WD4Y/iZeLdHIPZw4TjSs414xkdEgzFJpe1p2forSMNcDQn7fTyUBWx4jzgjOL
	qrRe1P9UwlXvsKoj/iXVqfa4F5hvPiGyuDmO3PZTZGYO198URJ+0rXoABzXlQNB7+jrlpUX7FEf
	n4MsMtAR4BNRfKOdxywkQOJK0VBdjibxwW/UC2WCDKubxsNkVDFRuucc+snEpbUT14O5
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr14547032f8f.21.1788601630963;
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
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
Subject: [PATCH v2 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 11:46:46 +0200
Message-Id: <20260905094649.41996-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024713_049593_DC00E317 
X-CRM114-Status: GOOD (  10.41  )
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

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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


