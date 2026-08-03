Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57101C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=; b=qKdiw0ZIKBB9keRV94l6bw7DFK
	a9VDFLmYRdXqN2XyzPbRa6/wtJ4He18ygIa4SzGsBc0IDf5T5MEyLvI8V7axX1438BVLR74pyc/i1
	n1qXRXv6JYBtPwCEferbsixfY0MMpghzLsu7q5Zkq8WflFToeNcY50xFWXUKFNB2tmav9qmuGMtdb
	9qrX4ZecBrlknIJI4UtT0FxP4rv+LuOmImKLa6Tai15JJD9fOh3E/8dTLowyeDC+Z6NjuECcO8xrD
	BzZN3xWnQZKmv44sXvx74/KysyDt/RghaOnM8cB9tmJ9qw5El2aQcuTy02miHMzpfcstd1/Z88n4v
	YyT20VXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUV-0000000HKGI-1ULn;
	Mon, 03 Aug 2026 14:18:07 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUR-0000000HKB2-3hot
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:06 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3811f512167so3468792a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766683; x=1786371483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=;
        b=eWeWpVg+B25Kt48JOpVvbuzXeOPyER+sbdLwkTY+TFj+8Ebj4QdvZnoneyRuqlUcUG
         z1xWrGa77O7WN1LAwA2oUEa2dR0W8/iiLbQoYbeQ50Vs02h4tdfQwSP/TvhJFqGoV9MB
         T5yDyLpO9Zuu30f5YcAL7PR0c0kSyvH3/BeJJ8gAaqyBureIwPZ8oxjbyrQRcC8up7/0
         b16nlJMJIT+Y6RaNm2x36M03GVJa+t4gSY8Sq994hTtN7OwQk+gNrM82xUMn+KW2OvI8
         rK1kOfjlg9FOrHKztU50JsHGaOt1IqI9ieZfwePEg3BgU3eInwZ9Nn5jyNklrom3QEvI
         WYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766683; x=1786371483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=;
        b=cOlk0NXOomd63PFhj6CDwuUpQgcE+EJpB7OPXNR6H9qNqjdPdxZyT0wAKCO10Unjf1
         JArDvg9XXaIgtAnUdb3VRiwzkTSwCnreC8ej3m1jiqac7ZX7GU3ioLGIrHbW2ZfZgrQU
         pFMTo+GKWu/2gXIQ+2fN3gcpxUVWPXn0PdObPhNzbI7piCQCs0SQ0jLI1Y3J9ZVgCU8y
         d/y8ju9CLD5d1jGDEJV7oCYMiucWQWhzDXSQd4fwI+souU7g0kjQDOWSSPwIvh0OXOHd
         IgbbNPJjmq6v1OdaRqtYPAw0jGhz0VnksTffzbhzWbPuhKELcUokkCD1GqIN8Zh6Nw0M
         +Gsw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6ebcR+hHPbfS/qVY8Qt5jtIVKoAmviU/42p+j2F1f25a9ZNyl/m3bHjchg+jcchVB2sB/p8GvY0vpiYRvj3Kf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/SYn2qS4203T4jK5BDe3S5/czaRxpfmabQw5vVGuqGboP1u2m
	wgKZg1TOCg0t0QydswHSCTS7EbaA/p76IvHntZjayf2Qy4AigxXJ9kKn
X-Gm-Gg: AR+sD1223gyg/L2PmhKlcvzarC0+A3YkpMcx23EUtTH4yRpXW0YHxXaS3bUMBr/N3lk
	bppJumSsG9N5ljY7yy9VbAIOhscVIwb3+G9aj9An/vYfB2v17FgmgVs+M9uFzL1w8Wdi7YUQGSB
	7jLdClp0U5IYvT4m2QZpMrX4OZhk1vBmH009x4XGTSOP8eMy5uhDSlvWAhwyldaDYMpjgTcx0VE
	3riwXGSRYjtYhh3ocN7zQX4PtABRNF6w0jERqvqqH5Nnq4dSdeRtV6nrSseErEVj3tbAaXiIhxK
	Lk8LiS+aU3ZiHTeO0Xf7rTD1Vvf1mEklCCGhSSyUuAPBstdPBRFuKqpZQKzK29EtwotcukkbOuM
	cpHzu98JCjCKCowoiEFRrYVx0tiYHqBqJUQ474i4/9yMLQoW+FzagJqez6GBqD+Pb5WNisxA/jT
	jqPSf+JQRGieF4IYWu+9D3XCzy9qMiBWKR8oDxyhtKz4WYmeHtfw7LkYJt+Li+k1NKRUsdgx30Z
	w+YQNNLXoRHmJR3l0yV
X-Received: by 2002:a17:90a:d445:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-38fbc53109fmr9002290a91.21.1785766683087;
        Mon, 03 Aug 2026 07:18:03 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 08/32] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
Date: Mon,  3 Aug 2026 23:16:35 +0900
Message-ID: <20260803141659.559129-9-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071803_962758_B20CE0FD 
X-CRM114-Status: GOOD (  13.02  )
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

Add MODULE_DEVICE_TABLE() to the MT7988 apmixedsys clock driver to
export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 416a4b88d100..24f4e7b87a31 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
 	{ .compatible = "mediatek,mt7988-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
 {
-- 
2.55.0


