Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95257D79761
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=orvFoFtsARH+IScJ7lixNcwmtmfCsu6c1Jr0HIMXzBI=; b=iRmrrkD98C2D5h
	XBh1FfG/m5u8m2u/UPtRm24gv508mvp6lMPfTtRWIid1BWGaD+5ssqwRdkJ8+1N0gHjc2zBYv4pPD
	K/WHw6ksKxI/Txht0nCnAZ6/xx/Qxx0DCy4fEYElPZlkzF27f0rQPIL0hMINuff6TgSK+OgBu0HAT
	b//TtaVssn+9uYl5ldsMqnaui44Drqi/ycR8JGGvx8tW9SLp3CKHh+bnBwzkkkmsLK8sg/SYfnbON
	ZU7YdvuBO6QCNKYSEsy6XIIcqhRPVoGCfiy81XBhZduxD3dSu/6cFoeHft5YBPo7fzl61kjJslb4s
	/WUUjeTsmWbuQv3G47nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm651-00000002PDx-3NOC;
	Sat, 31 Jan 2026 08:11:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm650-00000002PDd-0dUK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 08:11:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a871c8b171so17313455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 00:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847101; x=1770451901; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orvFoFtsARH+IScJ7lixNcwmtmfCsu6c1Jr0HIMXzBI=;
        b=b6FV2W7+5GHVi5uwmRYFSVTx/WZsczDQh8B5XxcRLkzsyADAH9O3jNoPbva2CWxKt+
         9PrCN4wHAYvPxmteYm3HvpcI2pioif6S61ISu7ns3uDD74iBcJ4K64z6qJhk+MFRIEXp
         pzo3ZFjAXeIhP7g29l4apWl2xK8XTz1gg6ws46JReM2T+Em8ii76LN9ExJpw+P1Rxr4t
         KrZg21Cz6U/BNb4lFgOda6spHa/hsNlY0867Wk9CIY6EEe1PEIyWTZBnZfkp4y4D2OP5
         pm19nBSxjfir0XzGnOXehQvW4Kg1K0h81QXTT157vesl7SuVoBx6qW8WG8UZbkUOVSgV
         tbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847101; x=1770451901;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orvFoFtsARH+IScJ7lixNcwmtmfCsu6c1Jr0HIMXzBI=;
        b=EvGJMN8Qqailrd5uWmJlT5avCVxNXjRBKxpa/QMFmCMHnjH2XOnuhmaCBGBcteNnj8
         bftzruuf4K66C3BVrIkpR7dDAhqNm7luV2jejyN8czxftyxPPIHPAtbIvvNRp3wlVbLb
         J4c9cGIgxYZyqk7IzM+ZbgAN9D5gCtzqKVYN7z8HOCnMqdO54nm9NjSpBj8QYO/vI9GH
         ANWGQ+8sDd+H1+k01o0b/owiQMBsiciAY/XUCLtQAcvwtyPm1Du3Y36IKDjoLlXIOvBF
         Jj9n55dNSZHtyN7H7C8trY45KDjlve4hHeGLr3AnrLqrB+/PfZ/eRuLaU8KAyp4XiZCD
         SLGw==
X-Forwarded-Encrypted: i=1; AJvYcCXYwf5mzDM7hTsFWXalGIn2Fe2htCtB3Gk94MB9a7f69lG/4H1VdBY1KbJdARaczIAjcdDiWfng9lRaOXsVJN64@lists.infradead.org
X-Gm-Message-State: AOJu0YxrVlx9M+otbb9r7f9cVbY7CrhRA3YTl/Mh6n4gK+RlRciL+GjD
	bHXTOoPUiQs9zbgwvci9z+98DYV422DveRd4ZuXix0Y+M4V4PULmgB92
X-Gm-Gg: AZuq6aJHdfwTzJH6dh5Tm3IBheoJOlA2faS2sZ9dDCoFQCAbovqN98MIfN9Ef+D76+X
	k6PwIyR5h1OLFPmeZtihYGZowOp7gdg96h401a2aTz7QbHMEnJqAjXVyTTxrxcJk2IfZuvQ5A9M
	5tLVopBJnM1hRQmGsreHn+x8hAwDrYzPjQEYfIiDra73L0r7EDT60nmVsDxESJBIulnC8vxpFJ4
	rrbr9pGnuVja+Vf6AZxL0GKXkxVqdPfGfaAw/XACG5rGPWg6KnOvbp+DIexlX+tq/YDX2n55Pg9
	8yOWMhBmtA56d74Efmpj8OCaUwmV4u9Op+G7RU15PeiAmPfDBxZ3zOEZqxIg0Ikno50QNDMIP9l
	WCjJzEX/JoeA3Dbf6WMLq8aJHYOknkQaJPi+U/LgcMUjYyakG3K3ICgMWb5s2VA3cNtealw8xDy
	q6D/4OZWY=
X-Received: by 2002:a17:902:f689:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a8d81503famr59926225ad.32.1769847101113;
        Sat, 31 Jan 2026 00:11:41 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:40 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Sat, 31 Jan 2026 16:11:33 +0800
Message-Id: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADW5fWkC/23MSw7CIBSF4a00dywGaCHoyH2YDiiP9sa2KBhS0
 7B3sWOH/8nJt0NyEV2Ca7NDdBkThrUGPzVgJr2OjqCtDZxySVlLiZkfBJdNvsjFdINSrfCGS6j
 /Z3Qet8O697UnTO8QPwed2W/9p2RGGOFed1YLqwclbuOicT6bsEBfSvkCEr9ATaIAAAA=
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=644;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=EC+hbL4fy1RDBuD3ijyTuRjK7ngIuSwyzpe6h6ynI2w=;
 b=SF5MP4ZPO/jYldFRUAkmUvBShoXhgUIO110zw5ChaX4rFg9vK1NmvPTMYmkhIUqBssqF3N9R1
 kUY3rQpu1bPAR0kzx1bLdy4lfZEHnRa4s6C51KwS5qLjnZPNVls/JRW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_001142_201000_2B6C1B8F 
X-CRM114-Status: UNSURE (   8.13  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix device node reference leak in of_assigned_ldb_sels()
- Link to v1: https://lore.kernel.org/r/20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com

---
Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

 drivers/clk/imx/clk-imx6q.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


