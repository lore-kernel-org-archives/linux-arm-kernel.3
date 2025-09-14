Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED52FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5V5EvIIFmYlE3GyO/jzMM5XnNife2k0lUvzm2HmsfY=; b=1Mp6yDOvkFwq1xGTBPKq2O2k/X
	5h1g5KNU7FfJwzAyC9e/hd9oPM2HG2wnooD03FWk7a21oYVAsruJQamZXjuNMlMb5HQQ6KrpXhmHK
	ye4S0WHEBC7Md7lL/xkA16MdzL/+d7+dFrx8tglm8gxWsGZkGmEEmRqz91zV7hdbhlOQcleb0C9bs
	GhC+aw2RJkL9Jjzmwl398CVjfd4NG6TszPZNOD7zl3wvWhkfSNVqttXbzO1dPublMiD1/oJqarW2o
	CJGlVDj/1rX6xw4ax8s76eO2ElQiyLBCrF5K5hz/9SsfZqAcInIbgPITYwGLjaEcNgOy9+q+zdygQ
	DW+I6Wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljU-000000016oB-2NXA;
	Sun, 14 Sep 2025 12:21:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljS-000000016m2-0MMI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:21:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so2740615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852484; x=1758457284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5V5EvIIFmYlE3GyO/jzMM5XnNife2k0lUvzm2HmsfY=;
        b=jxW0krLUgOvyAHz5YyeiBXFql3b7OPWBolhUwO8iXdL76qh8hnjGK/C4JnYR36LquH
         DGHOhK8pRUn/S7jerwpKDcwJP0Jpm2LjW1I3rRiJ4IDQ/IU7hxmmallnDdBxKCi6DZaH
         C8FuiZ+6C3x3X7zjCyTd9v1nL1haht//GmEeIE542z5zWidycDwOy6YhR86dDp2H96eH
         hJwFuxZR0Y8YqIOw2OgRbGtcw/lA2kjhBtfcSN0afOMjGJhckWPmSVlloZxwYgZ27C+Z
         d6RlADp/O101reCFMUFtc6RQwFbyLGpgV8puDxtsY40iE1NGysgH09H4hpn91rFWYO9W
         iQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852484; x=1758457284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5V5EvIIFmYlE3GyO/jzMM5XnNife2k0lUvzm2HmsfY=;
        b=u4eqr9P2oN1tLHjGoS+yojxGcqF+PJ8A1tTRtO+ymJ7/K0s8CJtSchk5nE4ASd7Wta
         9LBqVuhFcu36Hxrb4FiUnh9YqbDteDmdN+YNnbPLlxm/jP2TSbnUSTs4ILXgf9qzgSBH
         zsDT82hfz7CKuZKRLDxmOMzxtfs16LOtOGl4P+Vf0W+0To18LiQaiP4rLj99SAXPOAN/
         WjeJBApISiEaPaJWPy6OLWOsWEbJc5uqQpyXDql4mP+IJmsYhhaNIpk1Wd8tikjI11EL
         fHoENHovQVDCeaD0fyaRg5QvfVSxgoPN8ih7H1zYznx3gkhIYDBHlUXqWrobkE73yMuC
         w+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVz4qB3eSihL+yb017kV21CWpdHQfqMWwa/TzRhSyCXEwoLyNDwY0WSNnA9GZKYCblfLWzm4ChVlhAQVI5GUP44@lists.infradead.org
X-Gm-Message-State: AOJu0YxixnLVJripBMluF6D1mW7r+ZssY5oPI9oIoxouwvw0XgDra1qv
	EwCNUSLbr5RLaii7ptrdrwoeSNkKDClM4QyYic/2MCBmZcMvumllwq8s
X-Gm-Gg: ASbGncuyiXRkEuS7CAS0T+eVQVERMgO83x6qjJ5t+CxEnRHrImPdvvgHqPGLfStDfO8
	gtVgrd0N92rKKDEdHICgQf9b86E/F7ds2Lh+Eso0fR55e55AFWSn9n3kHH5cR/n4+DwZe/MfLA1
	btEBwEvduURcTM8evQVSGuOjWe6FNlyffGc+0VpGhzPtMyqE/VAfmY53kAlWj1WPkuvZopAtLpn
	jHYc9j9G4zvPpyRmhYR37v9gQHcgWjse0GfEIkV111idRltf1o6bdXpBtj6wQK7IYh+RMypQi7B
	mddgIECJ3f2vAHgVTMHDohUpG/usHlIloGozf8sEhDN62iyc6sWa8hLQASxRtkb2yLaiRwWF6ys
	10I7e1uSvXQRb6SHofzY/m3q7FtaoQOWpLTI5ZK6ogR6UEHAZrosaTG6Bsh320n4t3MIWPequkw
	==
X-Google-Smtp-Source: AGHT+IG0ZXg0sjBbUNfdeanXFe0dMTX//arWD3IfNQ77haSimowawRn8wcMXpw44W5JXi1TEnscc4w==
X-Received: by 2002:a05:600c:468a:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-45f2126253emr91249815e9.8.1757852484220;
        Sun, 14 Sep 2025 05:21:24 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:23 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] clk: samsung: clk-pll: Add support for pll_1431x
Date: Sun, 14 Sep 2025 15:21:15 +0300
Message-ID: <20250914122116.2616801-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_052126_144114_EE818D0E 
X-CRM114-Status: GOOD (  14.08  )
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

The PLL is similar enough to pll_36xx that the same code can be used.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1431x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
     PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
     pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 1 +
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 6b3593445..e52e010ad 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1420,6 +1420,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	/* clk_ops for 36xx and 2650 are similar */
 	case pll_36xx:
 	case pll_2650:
+	case pll_1431x:
 		pll->enable_offs = PLL36XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL36XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index c07d76121..964c35ddc 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -51,6 +51,7 @@ enum samsung_pll_type {
 	pll_4311,
 	pll_141xx,
 	pll_1419x,
+	pll_1431x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0


