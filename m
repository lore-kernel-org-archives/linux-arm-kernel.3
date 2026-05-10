Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEF8CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 23:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t4PefSaSzTEmvdfkeNozvymUG2H1u48S+Re2rkV4Dcw=; b=PnzTIWvWfXzbUWVKbKeMYUi+iZ
	Zv5o5ixW6B70vrAyBXPk3GZBAHAaeVHEwFlxy8pKICuP2Fw3QBqJaQN8/0Hs5XSwBNS6ndQX1R+G5
	nuPIg/ALe3B21BRdPSlkLTpCJiS1OMJD6XtdW0rY34VdYv7xhiov7+H7KGtUFZymVNFLMdh9evtu+
	S1PUsc319ENMqd4Jgc+Qf9yY/PltGO9PXlc9Gfyfh4wIwv+RmMb/fmfyBL0dy9GbBTgAFf6xQlBRF
	mxPH1QJu4tG8Kn7pLLf4Qi+ON7VqK5f0U8/OqB87QLfrVWUIZC5FCRH+ShQ+FXkP8L+s+syz5hw1s
	q7op9Tnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMDjk-0000000Br0N-2QQn;
	Sun, 10 May 2026 23:39:04 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMDjh-0000000BqzZ-1dwk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 23:39:02 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-132c338a537so626994c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 16:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778456340; x=1779061140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4PefSaSzTEmvdfkeNozvymUG2H1u48S+Re2rkV4Dcw=;
        b=kIGkHIzmcCBcvqQAI3rvTvnxNJRkR64w7ubpRWvHH5e0cZAgWX/DpUTV5MjUJMk5X3
         SSac4JuQjx2WO4FtF1qQ5uh8q6C5Yd2RWTtjdQU2UB1g5To1AOx30wN3+KZY9Cf1o6VS
         RwqWlMp/MQzIaGB2YgulFWdwIaBXSFWsLMgA+YNm9fr0R6QI4UcO+ow9m7Pn3L1RTP7H
         E3FHaplPuHcjiBeaiFOzlPjjK0azFcsGY/Ke+B/f/eUotaYlbiqLOcbEudgZY6S+I+Xb
         2bQd2MxYxhz1kFkwkjUw0q/bmSBSi9WP/w4fzI4V59NkcbJuEPa/Ut0zIzHu2uIRqvCO
         +4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778456340; x=1779061140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4PefSaSzTEmvdfkeNozvymUG2H1u48S+Re2rkV4Dcw=;
        b=rkRrDGy1vizeHNGeiVA/WTN+WoaI+bNlFfu4sfI2ZVWkbBJp76WcALqCHtnZA6zlAw
         I2K5B31Y6arMp+5pP7YkQh0fn8U8G2funOnkNlf/Z+jMjLxXS/gD7m9kvPrUlW4Vlt3W
         +Xtg/tB/X7Lz0i6BL8xG9M3glioFc9RlpElsYjwA7CCObtc1JBNA7/Jg2fXUazaOUAln
         Fnrpz1xvGmehvsDwep5gzS9rDmhuh4Ds/JNAW3avgRD1AjxAX+jK13712PzWVn4eYb2e
         pAt7gHMPMZ761YtWNBENQXpqx8PWWUXDzPAmjcNX2/w80ceypbiQlpI9YYaz5GTzfJq2
         9XYw==
X-Gm-Message-State: AOJu0Yz8Es3LfAGo76b/PtrG8FtxAOa/DUjcWjr45vc107Wf8x/RY42E
	joj6gPXJV00JZKgv4113aKZLddBh96Xl3i0/KNgTyu04OadrUMW6XP37x25YQNnmUyA=
X-Gm-Gg: Acq92OETSnXZhqE/pcqzia/dYLUXyXRzU9dwJmscRIF1NUNkSVWY9RGKyWNgzBInFCg
	5lSn0EpVayhBjaKh5WGoFStIEOik8Vij9sN7YSphdygNVtsd2XuOttMBSZhr8fpev5PLBmewZuW
	KlmWRnOHvmJqTXrnrTuiVfeMFNziCxTSRHVTDj2IwjtXfM9a3glZXUBoxjqdBJ738cv2rE0gtaf
	n6MmA91vG3VRgZcivuxKJ5OxQ7Rzsgc7H2TuU9mK/q2WpzLI/LT7vPi+kYXFpduTMMARs7zV356
	yiNesa2p84q4JCQ9RJ/SejDhTYhE9bhUgzA61NCq/Uk5Jv/HHo+mYUTrfPeHBaluHoaO3Z1kJMZ
	c4ifWYG2U4ps+IjwR3EUE+4qzpB0mFDY6bl7gp9Y9hILyUyZK8vrl0CWz4/5dan3Gw2EmwmXxTP
	C1GRgos0qELYTHrm3Sm0t3W2YbO/FLbuTtV4twFv+8Gx33xIcsr2gH82FENHfj4Y7xFkktioI7V
	aBq2kep5FYrMeRoSS9D48C5CBom+/kt08hlchy++72/vxF2XkSquup7cl5JF0rbqLFuLUpfy3de
	5OJUgmifjJgEVGmKYFfvxalpQPLm
X-Received: by 2002:a05:7022:e0e:b0:12d:ea50:31ad with SMTP id a92af1059eb24-1323aa56f32mr7144058c88.5.1778456340189;
        Sun, 10 May 2026 16:39:00 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327875a269sm12150239c88.13.2026.05.10.16.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 16:38:59 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] ARM: riscpc: simplify vram_size calculation
Date: Sun, 10 May 2026 16:38:48 -0700
Message-ID: <20260510233849.22141-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_163901_432182_58F16794 
X-CRM114-Status: GOOD (  10.18  )
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

The code to calculate vram_size in parse_tag_acorn() is unnecessarily
complex and inflexible. Replace it with a simple multiplication.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-rpc/riscpc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm/mach-rpc/riscpc.c b/arch/arm/mach-rpc/riscpc.c
index bdad13226c6d..14d78b7f9493 100644
--- a/arch/arm/mach-rpc/riscpc.c
+++ b/arch/arm/mach-rpc/riscpc.c
@@ -43,17 +43,8 @@ static int __init parse_tag_acorn(const struct tag *tag)
 {
 	memc_ctrl_reg = tag->u.acorn.memc_control_reg;
 	number_mfm_drives = tag->u.acorn.adfsdrives;
+	vram_size = tag->u.acorn.vram_pages * PAGE_SIZE;
 
-	switch (tag->u.acorn.vram_pages) {
-	case 512:
-		vram_size += PAGE_SIZE * 256;
-		fallthrough;	/* ??? */
-	case 256:
-		vram_size += PAGE_SIZE * 256;
-		break;
-	default:
-		break;
-	}
 #if 0
 	if (vram_size) {
 		desc->video_start = 0x02000000;
-- 
2.43.0


