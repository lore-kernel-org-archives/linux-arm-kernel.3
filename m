Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9086EC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 01:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LauzpK5k+m8ljBN6uorqAHomRi6T7VJzQA2WK3Zl7bA=; b=LbS/jk6p9n3bUFYUbjZobEHbQK
	WBf0EJT5IZ3k8dHwWs5k4QZelypLqxp4FqPsLCK501c1GWnhBmzntX2xiMt7QeBCp04BvwtD8yKq1
	fEDdcnNWy96w4CvHQXj4n0ip0xDPSj7qxLahyXpnD/P2ezJDzTE5y/KUQp8rwfkvvF6KcLgbZcWDD
	tSkazh4IbruIV5E3WisJv9WhIPRscJme5tASdCkQTLywvOPqueIc9WSjlyNdpEwE6f8dVoDAPsU/p
	oNV5Bn3vrarVVCAqoYm4rQs54OSiD3SNfIoao1ine4KWMVSIFaRuET8uXEy6Xyagco8R4VcCD14Gy
	zPDDPzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4v8-0000000FLw0-3N7h;
	Fri, 24 Jul 2026 01:41:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4v5-0000000FLul-0IcD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 01:41:48 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so1199856a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 18:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857306; x=1785462106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LauzpK5k+m8ljBN6uorqAHomRi6T7VJzQA2WK3Zl7bA=;
        b=mTxJ1BEbCRrGvsJpPta7gMO70CbM+RYcNxbKA2godtH/TLFNPzx5pZM8Wx5zXssk98
         J1KCIf4cTfthCBmDHgmO1MNkarp/a36E6Kcw/34c3uK2NjBujMKxaXUYf0voSw3A6oC3
         /+9liEe9+zR3i8P7aRNP1ORsONXk2fu5+HB7rgr2uKH298vo+qDEmte6v6DlX5zeMpFQ
         U4ivFMoSAUlCm42bNb9mk+Xv6pDYGHmNYAPO08iOaJbZkIJVIFG5Lr3QtkhwG+ZsWOQO
         Ax5JIcovTiEil7Q04MthGi4+Nqst0TJctlM6iTZ/eRaijTfnQ/AFEPCQMNsf5FxDobk2
         ooKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857306; x=1785462106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LauzpK5k+m8ljBN6uorqAHomRi6T7VJzQA2WK3Zl7bA=;
        b=SFQjNvQthp4y/bP0AXSeJYGnsAB2iv/1EBVjWh6crC+SSNFUOoeZeWSGdA1q/MvBBR
         VdrfKRe9XEPJd5ayXDYWVb/R/L8bjtdfvlh+PI/K+F8BV+h6xMOPHRkLtsYxKPwJ6UK+
         FMNInGeGmJGbkNIlEz0/FM/ogo1gaihWqbR0hYY1Pp9jzjGEinH9ADTasQwqZOvU87rH
         Jf+MtbzVhm6Jj+ynv/MByvzjLuHNZBA+j4hRLdEKSONYlAnAfgr9vilueWrs0ocw/pmF
         zx4WwmV8HtVnAlAVGbb4K6Fj0Ue4lSnLv/ivdRyeovubOypRtmLL1F835SVoKuX8OyPF
         9Srw==
X-Forwarded-Encrypted: i=1; AHgh+RoJ4ep21dsVKrT+4iYSE2yoiyfyf7fiyyl2q1yilu+qxZnkN6zulSuC7z3unW6ofehr6I/OXJRr3mTHm8KmsFQg@lists.infradead.org
X-Gm-Message-State: AOJu0YyJHhpZjVjcDHWujmB+iCsvqp7i5JZlJU16ATTouR9/3hBXmPYa
	ZO0BHJU3Q26ANJD/ucImH/7teG0TYMyARJb/9K/F5FB4NTtqc3b+atIs
X-Gm-Gg: AR+sD129MoRSAt6ZXoU6rLOFBlHSuQc11Ysyckz71KmTjy3VO3pO3LWgCEhtLDCrE3E
	pZ3PUaTd0ZoKYLnmxkE9hUchP1vEcHYteLBW53aTs/QH5fLJuJ0XmzYcVS/4i+OBA76t7zXaYIb
	0zPvXuyDeXzasjdQHx3/VmEOkJpF6IzVIKULAhpTNL2vNVa8Cy0fmaNp+qUAJDbvJcqj0+WD00H
	nrUaCEnkvBLqo5NEONidJC88Y2RghLKiwO6b+WFqrFlM9+TJmuFevAb0xBBID9HBSaWqV7Qv3K3
	xrRWQcjBiOIfhp0R0+Lqo8R6SsMy+YavItgHJ78SV4D9Nix0uLgoJpdpBgiNUHif9zFtGoVXhfw
	TCUX+2PTD6YDgYl3M6OZDbO9lc++E0lRY7ljjT5Enlexz0X2laEmUiy46+PGGLG5SzPXQoKMwiE
	DpKCC6S2STngkNv15bv0bSRuOMFgvwtkIbec9JpTKJ8avd0GCf/qZO4P6H8LsL8Mc=
X-Received: by 2002:a17:90b:57e4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38ec694a6a2mr4903557a91.7.1784857306433;
        Thu, 23 Jul 2026 18:41:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:46 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Fri, 24 Jul 2026 09:40:39 +0800
Message-ID: <20260724014039.1239552-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724014039.1239552-1-a0987203069@gmail.com>
References: <20260724014039.1239552-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_184147_124333_999A66D9 
X-CRM114-Status: GOOD (  14.89  )
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

ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
unconditionally before the switch statement, and then every case
branch overwrote pll_freq by reading the current hardware registers.
For CAPLL and DDRPLL this means find_closest() ran unnecessarily
(and incorrectly, since those PLLs are read-only) and its result
was silently discarded.

Fix by moving the find_closest() call inside the APLL/EPLL/VPLL
branch where it belongs.  Split CAPLL and DDRPLL into separate case
labels mirroring ma35d1_clk_pll_recalc_rate(), with a shared
req->rate = pll_freq tail after the switch and an explicit default
label for unknown PLL IDs.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 31 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index eb9d69d2077b..878b23bb5918 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -255,32 +255,33 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
 	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
 		return -EINVAL;
 
-	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
-				      reg_ctl, &pll_freq);
-	if (ret < 0)
-		return ret;
-
 	switch (pll->id) {
 	case CAPLL:
+		/* SMIC design: single control register */
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
 		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
-		req->rate = pll_freq;
-
-		return 0;
+		break;
 	case DDRPLL:
-	case APLL:
-	case EPLL:
-	case VPLL:
+		/* Standard design: read current rate, not configurable */
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
 		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
 		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
-		req->rate = pll_freq;
-
+		break;
+	case APLL:
+	case EPLL:
+	case VPLL:
+		/* Configurable PLLs: find closest achievable rate */
+		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
+					      reg_ctl, &pll_freq);
+		if (ret < 0)
+			return ret;
+		break;
+	default:
+		req->rate = 0;
 		return 0;
 	}
 
-	req->rate = 0;
-
+	req->rate = pll_freq;
 	return 0;
 }
 
-- 
2.43.0


