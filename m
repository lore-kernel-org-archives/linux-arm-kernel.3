Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2270C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=; b=EpeE23+ZdKFKesuQXj6vVuYfTI
	4BbGfe4t83typxSIBqr3upZOV1Xwpu0zRB5HPjmXq7wQQYx8PzE72jLGIamOxXK+8FBv5coLFpbKg
	o8IG2rEzFEGQeZJ09ImQJvf/wusv1JhbLUx0NBsicLePutxUiynHxuxqrxW4S5dzUBNjVnxldfA1j
	GaTWqyH5CPp7aF4tBJ3EHxv9+d1OGiFcQcOr5+yHMLWtXX62sqx1nnQ2/Ruwp1c7YvfebgldX/tqu
	cefSUbbJ1Oqw9uGiKN46/PI0xxKwoe41xRKRA/xf/njs7AcCQ4Tcka2Iip/p0/xY+Ty3whDxZpiME
	1N6Xm/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yk-0000000EMWf-0geh;
	Tue, 07 Jul 2026 07:49:38 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yb-0000000EMPt-0wkI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-381ed661712so3511482a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410568; x=1784015368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=;
        b=dU1l9TiJIcjvry19kPWGYIt/HdAGeFSDVuc0xlX1qeaOkhw8YYtx3dY30YEZgUY4tU
         pK6mfG28n5ab7pjIsWgREso/V03L4fCpYUVNKFPKHbTGGOGoZMxCuGw4yot6/YbZeuSo
         +kY6bnkqRTHPABF/pHzdTE6bUrgjanF9Mu5FFw0g+RGKo5DIRefFym6vaZ5w3o0Si1da
         yd7m/wK2+gpaT2wgi5hx/b7fP/whIxhLJSezHUVnVOKmDafCjy0ZdIBvDAImdr8TzRQK
         5HuIjjh3esWCZ4Od05wgadBLXZxZyv8G5jjPUXqxqKxIUFTnYaAzkuX589J9xB7oayol
         PjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410568; x=1784015368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=;
        b=X29CkqTFmM+KOzHoHBkJIJqCLHF83yT9pft5xt4QCJ7pKanCTLbHHRVCc+7lHCYDYf
         o5HBJ7ky2AleXk7lVRSvXbmapFPeMUzRMcjjSp+YJuFQRHFrgablLnvxGbpqZhz1xmeL
         NoqTOrlVPNktl+yTFyA61jO4qrTZYWfC0SQO0P3hZfXzX3b24EkAt5mIKTu8Dx0VC4Zn
         L+fjpxN461Aqjqz8nqag+K1P/aExd85VqRC3cDCPARmA1cQHK76/qSpuuEpMFgO+lpJo
         Spg/u6ZB6r3Fu2VQn4tvB/LKXaMxt/XPf5PFrZ8P5l6y6OU0c7JRCQqKv1GZB06SNWDz
         4tyg==
X-Forwarded-Encrypted: i=1; AHgh+Rrk6YtfcxaUkD/dBE7e06Yru2rkNAQz6QX+/slTU5f1x6ipJw4Bd3Iij3Bkpl8HjI6HC7qzOva65aPOZv7YJjna@lists.infradead.org
X-Gm-Message-State: AOJu0YzCvIJYUdU5vYBtK5l2xMO9H7116JAJ1s1cfN2AEGNtWXrZiRfF
	4i1UtF3FHZ2G/8x0wEiF+ONiuM7wjAtne73C7M5p22Q2q4NH4ZQvp+ls
X-Gm-Gg: AfdE7cl0eA+kYQZGMQh/SJvt8FrP1xdUsFqbhrvkzMRKj++L9AMB1SoTWe08TYDRdCQ
	UmTK2Pql2xo3OafQ61IDyuTiGoPCzBTFWk3ghg6lcc28hQngF9YSVbQ+QxuJU6TibsfxBgnXcNs
	Of84Aug38wuIOcWwybNwp0zrqMZgkK7OtuqCRXhoeKGljL/ROos4+W8OPpCXTKZJjFMU3MaOphW
	ODzC5pxzRdZ5TWdTXK9WwVjxZqu90ILcig+o8cpsQveI8/U/tJmcVamTxWWRc8PBR+bFyji7bU0
	qid99tf0rQUCw/P7k3XfRG6IGgUzlW7wUe+9uUHZwfPHD3TvnHtmTthE7v5On7VXAaVgQ96AO4a
	o7VZdJaYkhUNnlupYQ4qhN8xvzHIkNY1RYd/y4U6STUYslSbvw7GkITNg+yBRCp6YHryMdFlnuK
	JgQOKK9joFNaj7eZnonuWxO/Q4TONJxkwx+xqsCwdjW6J7
X-Received: by 2002:a17:90b:4a0c:b0:380:873:49cb with SMTP id 98e67ed59e1d1-387572b380cmr4047566a91.21.1783410568403;
        Tue, 07 Jul 2026 00:49:28 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:28 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 4/6] clk: mediatek: mt8135: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:33 +0900
Message-ID: <20260707074839.240676-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004931_729329_2EF395E0 
X-CRM114-Status: GOOD (  12.72  )
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

clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..e3b7dc13b458 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.54.0


