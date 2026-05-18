Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3BCCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1GbpQXJ/ofknuv3pok0THf0JSBfxhfAq6oKYS0U8pHQ=; b=qp5pwklLCaG7+MSpUIBLpHBTXl
	/8AHjiC/+Mf6CcY/7GJYlh+crQN4sSTnXA2YK7zIHLk+4xRgTYeszMQXNlPL4O6gujyZtwabzJUuc
	MGhVLKK7OTXoa26qB6O1n6E+K/+Wy2DKuM/A1qBQYtaXGWHPWBCZWN2JKexuy7rpYqDAjNrbN4Bb4
	+QqH+r5eWQciRfoAuC5b9+l28ZEWJFsc3B1I/H9td5U0mO7MX6pAJcusc9Q39/rVQwWQuNB8XFpQD
	0bykMjwMjpIU9bOJTCH1hWzBy63yOcLQpXf3Oe3740DnEKDputgsF3T2SCi+VLZcrZGAHvLFP6HnR
	rGkqA/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOo8Q-0000000Dz8l-3Nmz;
	Mon, 18 May 2026 02:55:14 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOo8O-0000000Dz7y-209z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:55:13 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-134fe980658so2075141c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 19:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779072911; x=1779677711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GbpQXJ/ofknuv3pok0THf0JSBfxhfAq6oKYS0U8pHQ=;
        b=TVNeJDHC0egUIQa90gRfogzr7MnyVyY+gdBqVF8iLJOOLJ4ohkOsbqz0Q4DiU3SoOa
         J4YuvhDJlja+OrRZTdEtGrlPC137MoY67EhCLdJSVpY50MNGMtZuMyN3UpydE00Cl82n
         USVJSJyOJHOUPUKM7GKIeFXxzfXlxaLVlltH6ZfQ79sxf6esvuaMtAQj+y106DCozfaG
         +SO/X9gZwiA4fbskp1CyzDkqdKD0Km3Bfi5FZH2zg2SdSD3uTIfdI5LWV3BQjwIBhlyL
         otfPIwx9xuhRjj3PWhXHOrpjhzrd/y1ranFwXAqVCqENPevmU8iCZKM2k3SmpOIAk5Xs
         mYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779072911; x=1779677711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GbpQXJ/ofknuv3pok0THf0JSBfxhfAq6oKYS0U8pHQ=;
        b=ZTX2n3uVD0Ax34d57UwPL4EYT3XoIq7Tj1o9/XCbxxdPxAL9vi1/JGenMYujvmD4FU
         9jzhuoHcmRRKiyhcdcPAbiytqJnwEwVfg4vFZjum039BbJZo4fjGzlvNgARn1/yjIyqz
         AMnKpNTiAXt9fMvALjyyCEuKbupHpjc8EEcUA7w36fqrlNuos+r8KtTiCI6cpp8tAeFN
         if9MIZaGkl9JhfYg5jNfcMOXajy3NKipJrhHvC5a4gmg7XC7rukUoV2WoPcb15CJUPy0
         2ma5QMS1rvnNaYsJZuTywv8tJA/i37LjxFWUKVGE223zORMh+SA/yCGjhjM2PM5u3bYM
         b2ZQ==
X-Gm-Message-State: AOJu0YxTB9nn8MbhaPMxWuGFJ8fEmCz2DySwPgQ/JETXxg2/fvQ5iYBg
	ZqJxD6l2mZlbvooj9VldMysa1KMl/5qVvMcGaKFxP5qTNa2lFdD6cfk1HaMIsanR/YU=
X-Gm-Gg: Acq92OEv0mc2ZLzDdXQU3nWJQslzNlN64n8LHeP+j3m+YyTcFWid/nC8/EfNTNuV8mk
	BpJQNkN6I3nLz8noto3IVqbOKOFRIRWq/oA59Ar7gBuDk96nhlFSh/C6WtyOfuowKSyR28EaLwA
	0lHlH0w4NfaDvhX6TMlCgwXk9CfStL1sVUXIOz2RD4ac50Ym3K1aIDOxjiupiUgEnteKZBmANhV
	PcGOm2FJhx7It0XU7MFgts2v4eq8XNQc/CT/2vYtCTuEYoPjeza2CvF93a1OKDPJi6O9gphBwfT
	Mlo1lxtnGJllBM4iWUjqlk3ipV/RsYQcYk6ii5IX0XaYdmLbJEvDL6u1K3VrZPjYFI/NuVWtbrL
	MgmLwSidRAZDeSNqOU97w4q/iRw69Q5bpQfailjYf8GbuQriNQ2+NZsFER89Kas3uroAkBjHPd7
	33jiEQYzkhWGFwoMr++/oniZWFQbxnjJnj6FCHzgWfVtFNi6+DMeC8AAZcRIEb+1S0B2YfFOm7a
	GBCUrNdsewF5ayr7UV0DH/j2CsR1/UIV+gHlbE85Gw7Qsz++igpqAjE5Ur2GSLBur4OXBrPjYz/
	enU0sseu3vULJdoOzg==
X-Received: by 2002:a05:7022:ea26:b0:128:d24a:a5ba with SMTP id a92af1059eb24-13505433c06mr5903550c88.20.1779072911200;
        Sun, 17 May 2026 19:55:11 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdce9fasm15751271c88.4.2026.05.17.19.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 19:55:10 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: footbridge: resolve set-but-not-used variable warnings
Date: Sun, 17 May 2026 19:55:05 -0700
Message-ID: <20260518025506.238288-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_195512_549673_7450E348 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

In several functions in arch/arm/mach-footbridge/netwinder-hw.c, the
value of the variable i is only used if DEBUG is defined (because
dprintk() expands to nothing if it is not defined). This causes
compilation warnings when building with W=1 if DEBUG is not defined.
Resolve this issue by only defining the variable if DEBUG is defined.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-footbridge/netwinder-hw.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-footbridge/netwinder-hw.c b/arch/arm/mach-footbridge/netwinder-hw.c
index 85367ea15c5c..a33f4c3b9505 100644
--- a/arch/arm/mach-footbridge/netwinder-hw.c
+++ b/arch/arm/mach-footbridge/netwinder-hw.c
@@ -469,13 +469,17 @@ static inline void rwa010_global_init(void)
 
 static inline void rwa010_game_port_init(void)
 {
+#ifdef DEBUG
 	int i;
+#endif
 
 	WRITE_RWA(7, 5);
 
 	dprintk("Slider base: ");
 	WRITE_RWA(0x61, 1);
+#ifdef DEBUG
 	i = inb(0x203);
+#endif
 
 	WRITE_RWA(0x60, 2);
 	dprintk("%02X%02X (201)\n", inb(0x203), i);
@@ -485,13 +489,17 @@ static inline void rwa010_game_port_init(void)
 
 static inline void rwa010_waveartist_init(int base, int irq, int dma)
 {
+#ifdef DEBUG
 	int i;
+#endif
 
 	WRITE_RWA(7, 0);
 
 	dprintk("WaveArtist base: ");
 	WRITE_RWA(0x61, base & 255);
+#ifdef DEBUG
 	i = inb(0x203);
+#endif
 
 	WRITE_RWA(0x60, base >> 8);
 	dprintk("%02X%02X (%X),", inb(0x203), i, base);
@@ -507,13 +515,17 @@ static inline void rwa010_waveartist_init(int base, int irq, int dma)
 
 static inline void rwa010_soundblaster_init(int sb_base, int al_base, int irq, int dma)
 {
+#ifdef DEBUG
 	int i;
+#endif
 
 	WRITE_RWA(7, 1);
 
 	dprintk("SoundBlaster base: ");
 	WRITE_RWA(0x61, sb_base & 255);
+#ifdef DEBUG
 	i = inb(0x203);
+#endif
 
 	WRITE_RWA(0x60, sb_base >> 8);
 	dprintk("%02X%02X (%X),", inb(0x203), i, sb_base);
@@ -528,7 +540,9 @@ static inline void rwa010_soundblaster_init(int sb_base, int al_base, int irq, i
 
 	dprintk("AdLib base: ");
 	WRITE_RWA(0x63, al_base & 255);
+#ifdef DEBUG
 	i = inb(0x203);
+#endif
 
 	WRITE_RWA(0x62, al_base >> 8);
 	dprintk("%02X%02X (%X)\n", inb(0x203), i, al_base);
-- 
2.43.0


