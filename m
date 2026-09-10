Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C10C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=; b=ObxbeJx6sn1xTKYakem1l+cpjG
	QyP5kSpR5YSPWdgr136FMo7bl1xuIF7XdCjPr8i+xxpGChqrf2YbI+Fmbi/mmSyHPI8T/jFdiosFg
	CYaE/wZ0BKGu2WbonBe5r259LixvdHN+6N7qHqppUN+nDyNCLcNCSZmBtZxqyI2F26QZbdlT0GDzl
	8Hy4bdcvXTm6a3PhOl5+OwZ1/aldAUMwm5ag61ZfL4yAJGfIlgHc0oib2WKpcI1AQqatOMTPpPogz
	RDKgkZjUJw/bt+pLZNYPuPrXyDduwljVSXrK3mVBZXqIBmhJ1PM9Va1b9i4aFITIpTKLKGnGM36fM
	W1FCo0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf8-0000000DC0O-0bng;
	Thu, 10 Sep 2026 01:33:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf6-0000000DBy4-219M
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 01:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=; b=RQfBoN7uBRcZMYV+RIlojwOAR+
	GKR9OP0aBP7uKMEfuDH2lk8ZyP5FbVp+Y2kvvQxrmpvDXku95qCWjVDNwzd0Igel+0U2qKdPl6wMA
	qOi2vZeiiS8zRG53J2lwu3+n5QefWYJC2apzW9/X4eTMu5LrClutyaY7K2Afc02Nkdo5m984nOVEs
	0mfr7Bt66P1trHnmOqYlaRVIfPUWim61d6AdgX5RJ7zXEmoSUynpeZlGVrBDOpv/5nbBVMD/R1TSU
	RALs/r9FJ8wfnYUS/JG8eXhxM7iaJhyfOC/DKxxNFIKCsGlRHAB3mAEm02Jw43eK/N4dSvSnpzNuJ
	UAT2eW1g==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Tf3-00000001sRn-3rB7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:33:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49b965570d7so72736175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003988; x=1789608788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=m39F87+llHH6/uTU7fjRaXXQBofDwHN/f34B+zuRm4MuBRPv3HbuqNqY4apQE1uWBW
         OOEjxzr53FqegyPU+bjS6hjJUixmVjBi0du3i51GX4kOt/FNw92fLuxhc7IZDAwR4sAi
         paGALcP/exvO4ijZaS1xrR171qEkVOEuSxgUa4POJFa0YGuNqPNhvBWmZlT119mMykJs
         f77igGXYsTfK/MargZyDZgqANvimtesk6RGZj428EusShamFWYPpJCZtwyf8rQc4RFUa
         9xl4anaU+nwvj5RMdff8vX9Q0PKVE9APzUJqwh4f5y+t69FK6Bjbf4PdMlNGVDUstkTl
         KKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003988; x=1789608788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=aaDPiiajwyPXpm4pR94Wmqql2Tbd0X3Axochc7X1aNuTJTMEqhB+aTdRnvCUafgLlu
         bc8U0QoIu1E1Q4raBCX/bjAujfeRoIXxEjY0febNhDrxFYY2sWdhLctfYDcReP42lQca
         lalidSqo/MORqLjOr7F97DNwcaP3YNvMHQp1DJDu0doMnjnach5Lz6cH69kEF9xCYzen
         gvX8CpTqvPCZJVYiu6vwHYSzDajYyqyRZM7hstlOawqScE5nYGCz0wGd1bGqF3tCj0d4
         zNjXziAcGGK7qZWdQCMEKy92JwJDyIm7TD6Y5iakdisVw4ao4Hb7JjtqDyytcfLD87LK
         95Ig==
X-Forwarded-Encrypted: i=1; AKwUvBxofdx9J9BiEeX9H37NkRBpfn4xeV43wn2vmTYIJHwElGA88tmBCv0OOT6OlpU6rCQJHH2qWH6pXmy+MpZVBZCF@lists.infradead.org
X-Gm-Message-State: AFuF++nJmr5TaS8bINShZtFo6DiKT/WvFv5bxaph5ijHJlM2eV/Rc0vv
	zJJR5Gp2+O3XN0p70EzTLqj4J1Zo0wZuoagPspKtV/5VwgFzUjk2ybu1
X-Gm-Gg: AYBFou0JxIs2IJ1sU8R4yYGXnkUO3tunSJ2svkOBjxHt3azKQXhuUoLHrI83f58Bdsl
	V/hpAfvlW1kXwflYxz4Y84SkE5dbCaqJIeDQAO9g7dNRbDkrzyMdVEfSEypdEnv3+F+eUAoc2JR
	A2yhb6MzdoC6RjEf6j6DOWOtvLpBiQIgbjz+/mDQxiNpVJD15SaOUHUUXrPmRULXoFrnTLBcYQ4
	wndT9pFb/c52m0Msfr8TmywiElLg+RqN2dVQukjPyXMAKCD1NAbBYjSuIorUsndh/ob5XDYiJL9
	4RxdbBiy8VS1GbUYKW7Psk5xasaT7wjV9bCNa3GCSROkGkOTZXfp3igF8PwM+ZOSNSAelEA8qDD
	4ge2edqlwoMrZmIWPReewa3TNmZRjWDHKX63h8VxdDdc4nLXwGSPbfVbsMHFwZm5J20grf743Od
	85GxFJh3aDgOzhhMYoDp/nR/+BWza0NdtFTIgncZKZO4yKFxDzOtk3+JWBFhSfOSBEuEhaNGnxz
	Z6Mxrz+bWw6ZjIHcgtvmk7PSM9rSIYd/jFCO6RcIcdseaD/QeMEfif01VTvXjlFC0XNylfZAWRM
	sCevEzyKO7yFk4zNOkiOlxOcRF9ru9ij8Lr/okjGSNKqroPn3KR4fOeiCN9gShANGRp5w8PtPJZ
	KBT5+efRJkPml
X-Received: by 2002:a05:600c:6305:b0:49d:2803:22fe with SMTP id 5b1f17b1804b1-49d28032d49mr11185475e9.32.1789003988252;
        Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:07 -0700 (PDT)
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
Subject: [PATCH v3 8/8] docs: kernel-parameters: Drop the pcmv= entry
Date: Thu, 10 Sep 2026 03:32:45 +0200
Message-Id: <20260910013245.8619-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023310_010964_28A51243 
X-CRM114-Status: GOOD (  11.52  )
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0

