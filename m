Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64028CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 02:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PcSo8RFa+0/2ySKkmfJmXSREIu83Q6JJsPeDJVxe7g4=; b=GqFPKEBtja8I0jfjbUur7gMaUj
	QBlR3+eRr0TYRn87OQs0Gv7HDkWX1/Fv8B7X70VUCiZBMy0BYT5RBpmPImPqUvOVSmozeQ8dNkfc0
	WVbhG4D144Br9owyov7MTtyKZEcQiKSjfqQb74yV919UQRG+fDy5XIbdDXNZcIhT/mb2eiLQAvjot
	Dk8Dwo1zRBskafuSTzKJvTqdwraml9K4ZHxDj+92bXY582EYoqjuG12JO4GzwDgudGMtniKmxeF7S
	l8Pc80KVBRGf6NfPcYsChq/t84Balk2ryKLwJJz1eHlvFoMmvBk2nN1M8SfBmv8aSLPFppp3aazA7
	fH501ocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLu5x-0000000A1VL-3IcV;
	Sun, 10 May 2026 02:40:41 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLu5v-0000000A1Uq-1w2K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 02:40:40 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so4508643eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 19:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778380838; x=1778985638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcSo8RFa+0/2ySKkmfJmXSREIu83Q6JJsPeDJVxe7g4=;
        b=hP4fsjV/FGVX0/lfHpB4CEVjvsPdSrz3CLqWh95T0UTUe0QFiGvDstINltewmj82Pm
         ll4atiX13pqoRoxOklnuS+5AojBQYcFCIfV/lVHfdB+NV8wvyXY8otbSoJaoqaEWk3Qv
         Qh8ifOY6rC1vhviJX6/yZFXE31P2NQlksbmd6WOVVKVXS9ROzpC6sc9BpceKv8vyWHil
         1TWUvf9RRYSPG3nDWuOe+qXUrYmv5GUgij59Jyx+nUZJ54gxkp6qQkwMvFUjCCyB31JC
         QJaIH4nZu5vfaP01uiY6gj8/tMrAHq07cy3mOiweBxfa9d12Tx3jsQeugpq6LZmcuZDE
         uCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778380838; x=1778985638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcSo8RFa+0/2ySKkmfJmXSREIu83Q6JJsPeDJVxe7g4=;
        b=GgWzBWc9bYRK2RVJILPi8cylbQNZdYj5ANLPzX4IyFaPXTersHqmd7tWiRT2D670An
         /Lsf7c78WGwWQHlujhcY1WmOPblsIkLoypFTwNp8WTD+n8UKz6Ia1TBvMtXDVG/kKqU5
         TK0oW0Kd6GeKoyHktKJ0e7KzRxOxjiws/LePaRAtOhhOZDeLx29P755A5p7n+qLxW49I
         c2WQ1x335hZlmu1r84gSZ1PWiShjNbPVhD1ZclR4em5xJmaYpAva9a6Q0mq5nKDLrVCh
         GMqMGYQAh6/tsnv3yQufvckGg5q19obp2bBqKv+084kVK+Xrqc5FvrmaoUczO7Nm6AXQ
         iZ8g==
X-Gm-Message-State: AOJu0Yw61NvGn83xhA+b1EVwPfGjJLzeiUS1NlikCMJSfcx9tmQX8Ksf
	dnfkRDqYTMY2CBHF60u/091IHQNhKf8DdDuLmXodeAxFiA2OKz4fYswOiRrBVDKjW7Q=
X-Gm-Gg: Acq92OGOqVeLdqcYKjxfDskkMV8S5C38zMs0wNr1HHpnbMKVDNNgtOd40Ux6gsJRhPh
	P7w8L8H6c8mJ/4kyWNhmkqsfHtRGKKxMDIlJG+kFJZoaFFHXWkk5Yu0pE7OxubDzAZ3goSx3jv8
	NpATwK1HKglEy8Gg3e0Xj3D2QUKbEKq3pg9DWcq9mPXhQd/PRmNCR3DNed6o6+/TwGDQg2f707w
	gNQuXyxSF+tdMr7IniI4YWS1o+AQDB8XPJ8uIkOANZtz1ZKfx0i/gkQgcHQMuC/0kU4YNIwfkbN
	69J/ZpeFpMM+SZRrHJXUpcIk8tuyypJQMW3FHkLjRSe+XiLyzNc8Fw+0wJ1kWLH316D3yKfvzsW
	hWynh8iGezhubuCSdUL0bCHGaY+qiZqpdi2VHboyyHvlgXj/Y0dkDPHmTXqJAnFsU++MSxA1Exq
	GBJke8k/U2W2i3mnc4yr1f1vI6+2HngVW4iOp70l34VgxzBXu7O5JCkLwZ/Cw24zEy8jTtR8y6W
	2CutbfCGtqLXfjqPQrsD58nSyvg/Hlh3u1YZZto+CWbx6J/g3p7ucmtLUcMwyZM1QBmPqPNszqS
	0Lq8qKAiBvrqLfqDofxfU9B0tbOe
X-Received: by 2002:a05:7301:4b15:b0:2dd:5641:ef2 with SMTP id 5a478bee46e88-2fb4bdffa2fmr1757235eec.25.1778380837843;
        Sat, 09 May 2026 19:40:37 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm10003795eec.21.2026.05.09.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:40:37 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] ARM: mach-rpc: fix zImage build after recent font-related changes
Date: Sat,  9 May 2026 19:39:38 -0700
Message-ID: <20260510023941.190396-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_194039_532205_5AA906D2 
X-CRM114-Status: GOOD (  15.61  )
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

The text display code used in the Risc PC kernel image decompression
code uses arch/arm/boot/compressed/font.c, which includes
lib/fonts/font_acorn_8x8.c, which further includes <linux/font.h>.

Since commit 97df8960240a ("lib/fonts: Provide helpers for calculating
glyph pitch and size") <linux/font.h> contains inline functions that
require __do_div64, which is not linked into the ARM kernel
decompressor. This makes Risc PC zImages fail to build.

Resolve this issue in the least intrusive way possible by preventing
the inclusion of <linux/font.h> (and the definition of a struct that
relies on it) when the decompressor is being built.

Fixes: 97df8960240a ("lib/fonts: Provide helpers for calculating glyph pitch and size")
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/boot/compressed/Makefile | 6 +++++-
 lib/fonts/font_acorn_8x8.c        | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index a159120d1e42..0e198a6ce447 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -157,4 +157,8 @@ $(obj)/piggy_data: $(obj)/../Image FORCE
 
 $(obj)/piggy.o: $(obj)/piggy_data
 
-CFLAGS_font.o := -Dstatic=
+# Defining _VIDEO_FONT_H prevents including <linux/font.h>, which contains
+# inline functions that require __do_div64, which is not linked into the
+# decompressor. OMIT_FONT_DESC is used in lib/fonts/font_acorn_8x8.c to omit the
+# definition of the font's font_desc structure, which requires <linux/font.h>.
+CFLAGS_font.o := -Dstatic= -D_VIDEO_FONT_H -DOMIT_FONT_DESC
diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index 36c51016769d..6b5291c23fc8 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -265,6 +265,7 @@ static const struct font_data acorndata_8x8 = {
 /* FF */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 } };
 
+#ifndef OMIT_FONT_DESC /* Used by arch/arm/boot/compressed/Makefile */
 const struct font_desc font_acorn_8x8 = {
 	.idx	= ACORN8x8_IDX,
 	.name	= "Acorn8x8",
@@ -278,3 +279,4 @@ const struct font_desc font_acorn_8x8 = {
 	.pref	= 0,
 #endif
 };
+#endif /* OMIT_FONT_DESC */
-- 
2.43.0


