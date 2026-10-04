Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA06ECA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=; b=nTo2p1A1ub/3st9GqpnI+Cjnj2
	7o54agzJzHuBXigCoS2DZEgAs3Xw2nPFKg21Zo1ptWjg3/8u+oLXPw8a3kMuQzzX5lBnRbqVQz3Ox
	OL5MHxJcr/YXk/WxSjMrtTF5Y30bKr6zP0+Cc6KGUko3YXfIWLiTI5tlFZ2TFxa4wgxWBFyIPRP+z
	/+SQAicZ5mejsw7/O2XqYNNjrmdej3Y7/CDDx26LuNQgNQ4qC5ockuJSrvLcsjUEJMR4jfKTxuaW9
	d0kiEQGbsLWiTB5NrWiW4FyLJDtv+NUjYIAHfjntonxUkDVOjik914B/2TA6Qr1Vn/kgbTo2A8HOe
	72MYsP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDRGF-0000000FBSB-3OuZ;
	Sun, 04 Oct 2026 18:48:35 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDRGC-0000000FBRA-33CS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 18:48:34 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-33fb4680717so3181931eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139711; x=1791744511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=MCfN7MErIuup0HyYSVcbaYa1nj0dyV4WqiMjcz0YM/6R28nqajvGvMv6YBWTufWJ+K
         L71Akhf7ogKrJLke+wUB24m4sqLJl2dQv/ztfCWJu5MfdMhTEBKTAyRkW0h2DtoJO4w2
         BnEexTFHYEg7UwJva0K2HAq+PdP0GvZXyfkItbOZF2QdA2HMCqeN1Q0XozrgERDEGm0J
         HnFDOe4Wo2ZFwimSBshmCrsxcrpyslk7k+KxsW/+DdRwmIMTlsJ1oyTV2QwQ/4F2JSxA
         vwZdlEGgJyBA+zyOWHu+oNxK7D0Xa1QRXrv2tjgQviw0ZsIBydLz8B9Uq6HmCgzg9dRQ
         9k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139711; x=1791744511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=uWPGfqTKD5u3OuqkP6qMtx2E5PNeZuj5MVUwf7BPvyGpi+QsWP+Ht3rhc7z50AdH7K
         Dm/RQV/BwS3vfkVIPYga7wJJ7i2k0N5Flm8wS/JV4/TLwfyyQxSeFOOA468yM87eOVuE
         28cuygZZWMpnMv/AtP+Opf93Snxk1Ozz9XFWt7nGguEK2MMt0brnXteWFQXCnzZxxDf2
         xJsgi5U78w1mI6fb7YSgyh5pJn6gvYA/z/CGZFjZv3f/iZHcw/Gnw/r8GEzdKmtmZIF2
         NLN2buy60SPTypxUpXFY2OW3fA/D7Pk4ZoAYn3vVNHvinclo2p1VzQt71MWOQ4gKCNds
         HPeA==
X-Forwarded-Encrypted: i=1; AKwUvBxUMiqvcuoeFhPvEKnIgu991tJJN6ep30PnKLVDfK/zrsx0pNOe0+piXvPd/rmNPRyA7nh5DeOWCcZvXNHpBn3w@lists.infradead.org
X-Gm-Message-State: AFuF++mtO17K323exnJvO8hjJL/JtJ1y7aPINy0qpTk72PjXXH+m+5l3
	z0y3zOrKLpg9ldyQU8WYn2pfMzNhFrwBVUGteg7WYfmht6J2+/TsDKi5
X-Gm-Gg: AYBFou2cOY0jCtLc2gLUfMcakLBLK/v1baOqMuYgqyrjEY8djG2jusSX9lBUImIvCap
	UC+fw0iEQcRdoRcJl47sty7tTU4+qP4alfjmfXt19vaTi5CNQockCicJHCJ/fqr9mWzUUZ/yGRo
	8cWc90N6fVkKaokYEGMhHOOqx7/tglxL1KDfGX9NtRK2IkdsKEDCV7y6Vdh/eloJt+bV5UEcTvq
	Qid+CoBgv8bvaAU38vMriBSZgYEAcJwxGYJdwo0l0Jlzu425d2NyW2mEKGCNAMz4uJ4/rQThRSY
	8/rI/NsshQvU0ho4b7W98IVYQtt5RuOvpcBE9wIHya9CnzLSWPEqmLa31+sUPht26+zjMNXh6aM
	wGYoNV7QeGT26LQFnQCntdOakxUAEap28Cn5gcTB7i1EeK7HjtVOYM5gSbY8irT6pAhWmJ29fxz
	I8OZwv8rhmRlt3fKqrFM3xZHe48GmZD9NI0ueffETKGYQBqQkCOutjT+s5iiGd4EmAs89sf3xFh
	e3z0jC8UNxOU/1gvuWo1BhFefvvblDj2Y9pLDHLJkxkQx59pCD8mSvAhcIPvyRulPfRBvfD0326
	H4bixP1MCWd0hDZpA4MH2D9aVjaABT85Ot/yUT6l5kN+Jr6B
X-Received: by 2002:a05:693c:41c7:10b0:351:13b4:9c59 with SMTP id 5a478bee46e88-35113b49cb0mr6822345eec.2.1791139710731;
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351270204e0sm7754374eec.1.2026.10.04.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] mips: ralink: mt7621: avoid casting away __iomem in wraparound test
Date: Sun,  4 Oct 2026 11:48:28 -0700
Message-ID: <20261004184828.31284-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_114832_762369_B4FABB3F 
X-CRM114-Status: GOOD (  11.76  )
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

CPHYSADDR() casts its argument to an integer, which strips the __iomem
annotation from dm and triggers a sparse warning. Compute the physical
address from detect_magic directly. The result is unchanged since the
sum never exceeds the 512MB KSEG mask.

Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610041411.uJXWXF8i-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ae7b8cfedd5f..2d10c74b13c1 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -65,7 +65,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 {
 	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
 
-	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
+	if (CPHYSADDR(&detect_magic) + size >= MT7621_LOWMEM_MAX_SIZE)
 		return true;
 	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
 	if (__raw_readl(dm) != __raw_readl(dm + size))
-- 
2.56.0


