Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F40CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 01:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQHAOKYoNq3MrKqMcGhimP9jof0s1tqXQowtY/BWP0g=; b=flXNM983BaiMyvmKoHnNXRu+GT
	KSS25K2yAzSYsftHbKkSZraqNCuO0WCmPzBVlHvv73WAG6FLYX2H0uosDxbBUOmlcFzP+Dm8rhOiE
	nDLV/q+OzGVfNaKINqUDow5iJb763M0NCeY8Wk2BUMTfYm4I87BvQecktYIQ70qhudXueJBVcIC2s
	k8Dhp5rqd5qC/xnauaCliJwhTZEZm9840yR8I33AWz5O/CllRpO1XTwwfo3lmj5RajbBSLWvhNrNC
	4W+WtX0TKfFrdshIHeTWHJ9+XQserfXAqiQbGe798smjWvBd66ai8NUBlDJjjc2KWD6lTJEKCmKu/
	6CctH7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsUd-00000006P20-3mmC;
	Thu, 21 May 2026 01:46:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsUc-00000006P1Y-1UsZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 May 2026 01:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XQHAOKYoNq3MrKqMcGhimP9jof0s1tqXQowtY/BWP0g=; b=i4tHn2HXAOPE+mDxkHivk6bcLB
	+rb+YZaA2qX6c3XDczm7WHOnk/k5pzVRk1m0Eue1XCJnkOI9sGfLX9mHIN2qrYPUGIh1YQgE3Ay3Y
	va3dPnZTO8RO4TCGrGZ3xAo2++XCuyeBKbgPyzU2WnwtG6XjJgrBFLqsLFXjA70ZlcHOp12WlA9Wx
	ZYIXP9V3QWp8F+eTrNUoVJca4k4WwGxmhwqgi7LTgComRmQ37nB4tnTdW10WYQEDe5YyDlL1DoC2k
	NEI3kQl9wjuG1oR1uxkJHzucRMyFjNGx/4Oi4NjVvSN6SfOXD0Dlaf5COfG4bCQk9SNH0vpgIX1aw
	9Kew1pAg==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsUZ-00000007rKb-39uu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 01:46:33 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so2269689b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 18:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327751; x=1779932551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQHAOKYoNq3MrKqMcGhimP9jof0s1tqXQowtY/BWP0g=;
        b=CB+e6yQwlCappDsaJO4c4eXTyDRKRXA0hzNfeXLRhdhcXvaBjio72X9xgktvPNZTmF
         vMDopk2N0AgK3KK1HihCaCr1htg9NJZwJDgrK1mYPnkHWLRQ8I48gQo+om0Tlo8gU6Dp
         lhFZQBDJ9x4ljdfers4nSSJjlpKvSegmDOy15BFehwA3ysOUZ1WpXmSCpt9FdStTaim3
         kvgExfuVhognTDyvg/b909uTZwyqA1Ma9r9r1YVwnYHBVozltIOqGL9sxP4ZRiIRZ4BJ
         ND9iq6iIBdx0SZlYaiIeAI0NHA9sFaKZZSeBFTE0ZKs0ITJiigZR56CjHckJS30mjxh+
         PPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327751; x=1779932551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XQHAOKYoNq3MrKqMcGhimP9jof0s1tqXQowtY/BWP0g=;
        b=F7RouE7ZWaZlfN4+tfTkdW0gY60xAFTvZLSjb/pSSeAwTOaPoCNp9iRTw6QpHb9LKp
         L+nY9dpBplbS5z3rpu1x4mRPpmd8fWLYLoUf3dDPLKUuBpGAsNf1oheHerWCszW3rGM0
         /KnitxbEC1VJKMPU6k1QrIabK6K9jgLByDnp1P6LGRspdPMrMeieRNbzcwmpOAjgm6SF
         k157cgS3TFgiC4Lrnu0rSrjJXMT5HAmbPbMX9CsWvyareyuhA3n75WHCevu8gG+o7UkB
         hwxE8WARR54qqXn1S21cUUfbYthdFijkq3srEsybVNKI4zy2gogNStdW7i3jNw6aoaz6
         xkyw==
X-Forwarded-Encrypted: i=1; AFNElJ8SpGyifRl31OLFsU/ETslXBpvXhdKQelBWfsN1EjFTHdy3q0pLVzJP2XDYfdl/iATH3n4BQR9nURe8cYAzrdf4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbi3p45sg0uqeXJlwrvmZllIyUiBZhiVYku2XppuqfEvHuCnLN
	oIh7dFjX7SYbofE0F5MfT8THHNl/konrPm7DTlY/Yr5QCjOnVhxfb5NqeaPS6Q==
X-Gm-Gg: Acq92OFhWWOBZg8Dt5kzUKXEBH9bh6SFuaAQZn8e6/BFY+iXsF0TOFpAqX94t6Ika1S
	iEQ52+fg8YE0Ax/ucOHAbQVY44UMGQOGHxQL2cKpjywhiD9BZkIPGgEki72XK0oji9MJKkS5cQw
	rp/B+CevwaFD/EREuyaFkLLlQbj9SIl9zqTvRo1uC+DCU7ya6/c74qcS03VxoSmCLUwJ7qjMVTT
	KLryeerV8wHkpQGI//wF8YnVlCq78bL8a5WrVme/KfgLDzdNsiltfDEPzrue/Tl80ld4AGTG5kz
	W3ebtZspyX8sFV0NMdT/yQSGs1nwUYqVoVDlFQtiqr8A/f87IlJnhj2CoFhRt2HQ16I1a0HSIwO
	JH3W4STJWDdt/HtICdC344MUSyrtDxVZ4uqJapQpTTRI6E+A+bVmz3nBfRwhk1VDBa0sUBOSqve
	ss/xkl8nogUZa0V68KDDlaxmURBE71gLfq9WDZRNT6O5xInUvKYZgEhaDevCF8JfBTGgUANYTVU
	hrk+2cSkN0I
X-Received: by 2002:a05:6a00:2e9e:b0:82f:61f5:1d7 with SMTP id d2e1a72fcca58-8414ade9c4dmr784283b3a.25.1779327750726;
        Wed, 20 May 2026 18:42:30 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:30 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Thu, 21 May 2026 09:42:19 +0800
Message-ID: <20260521014220.77955-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521014220.77955-1-a0987203069@gmail.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024631_838020_41FB6333 
X-CRM114-Status: GOOD (  11.89  )
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

PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
The hardware fractional field occupies bits [31:8] (24 bits), so the
mask must be GENMASK(31, 8).

The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
as the denominator to obtain 2 decimal places.  With the corrected 24-bit
mask the old divisor is wrong; replace the arithmetic with a proper
24-bit fixed-point rounding to 3 decimal places using the kernel's
DIV_ROUND_CLOSEST_ULL helper:

  n_frac = n * 1000 + DIV_ROUND_CLOSEST_ULL(x * 1000, 1 << 24)

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index bfedd45bd04b..eb9d69d2077b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -48,7 +48,7 @@
 #define PLL_CTL1_PD		BIT(0)
 #define PLL_CTL1_BP		BIT(1)
 #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
-#define PLL_CTL1_FRAC		GENMASK(31, 24)
+#define PLL_CTL1_FRAC		GENMASK(31, 8)
 #define PLL_CTL2_SLOPE		GENMASK(23, 0)
 
 #define INDIV_MIN		1
@@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
-		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
-		pll_freq = div_u64(parent_rate * n, 100 * m * p);
+		/* convert 24-bit fraction to 3 decimal digits, rounding to closest */
+		n = n * 1000 + DIV_ROUND_CLOSEST_ULL((u64)x * 1000, 1ULL << 24);
+		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
 	}
 	return pll_freq;
 }
-- 
2.43.0


