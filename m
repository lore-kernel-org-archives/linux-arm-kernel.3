Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A80C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 03:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wwKF8zU5dP+B8D7+Ra6l9PAIkPkCoCFD7l4115nJcKw=; b=D9CTpKR61hFYpV+FXvpd4Bvx1C
	qhl984hEJoDZY8aGONbcxPV0sx6zW5n805N5zZzZmwW2O+FF665D8n07kQ2dtV4MerL+5IiGfZzbP
	kKJpdVnDIa69r3jyE5Sm2bmqx9FSpqCTP4LTfCxMaJBdLsvFO2lApWoQw2wDy+P4VdMK9DoWMeG8v
	qVRYDPxKGjZxtEkhsLzQZmSX0/uHY9TcVuU+F/XL7msczNTdoJ3z93vIQbq0w56BXaqXY0PmWsNuu
	WaT1Nx32xjwDoqLCFXNiWPy+iHlSM8zNC0NAVqCdSJAUZQiwyLsMilTZNE4IwjAqNBBuXggUx4tuB
	mjDJk9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj80u-0000000Bf51-0TvJ;
	Tue, 05 Aug 2025 03:06:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj7yG-0000000BevF-1uFZ;
	Tue, 05 Aug 2025 03:04:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-24099fade34so41160815ad.0;
        Mon, 04 Aug 2025 20:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754363052; x=1754967852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwKF8zU5dP+B8D7+Ra6l9PAIkPkCoCFD7l4115nJcKw=;
        b=jHvAh31OakeQQWJQiZEIfW3tGtZmKCAW4K+gu9O0lJBUYkD89v3F1OSNBna3Qh1UyX
         f7TknA+aA8sX9FoOncYGiWxjGPpelw2afpRM6eab4WZjORzrBNF++OJi7vD5vbQdK5pA
         yo1+S7kkQrgb4zFtJ1zt0mdkx5S6dB9BJCsYs4SSybqsvOHg997F20nku0toTFYOpbuD
         /M3OFlrmMYp2IUHSvO7X+lWwjSzQn9YgyFyefXKkv3aRex5ke7rH2s9WGfQsKb/44xk9
         +RsAdqDnlXIpTDWCWpcZKNiZBoNIvK9hS9QduP2HZkgw0jGjPF00pKV0aRIfIKDUeemx
         ewlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754363052; x=1754967852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwKF8zU5dP+B8D7+Ra6l9PAIkPkCoCFD7l4115nJcKw=;
        b=NkYxsdWJSmQBftHTvuwhN1BZ6tOHsbJO4muz9EOf/kt79EFZ34RqqoRBg9yqFWoyfK
         P5peG7i1L13iYQQ3u+Z9AG0KKN0ykj5kukCl+bYWt+k5aY+E8uywkeYqKt+tExZ1yBy1
         gzhgujc5gUxzAV6DSLZSzts5wIAybX4xWifHpxnu2rwmMEiodHBRrChUYsIYKSXTQZGy
         DhgkeLuQHqkpw+HswkZaris+l6VvX8mtj7BeWrVEVTgZS5mYt8SGzB19x+b3diIWJjNh
         75BxqqttJgu7ZdSkHEUw10Zt/u/YKJrtMdUll93HsZMhja7EIPLc5/6sU7YGWTr++MbS
         3jKw==
X-Forwarded-Encrypted: i=1; AJvYcCVMTCBgiDXPMl21Wgv96etOoKrpbzQO4Mi3gde2lCn/1YuNGoqvI3iF49tt7SemmBf95zudkP1zTQ0/98c5ZsdG@lists.infradead.org, AJvYcCVuD99ma1MxEZxUyj2VGHlCxw+47+4K+Ob6qLd7sKWxGkjOgEkBJZM1ot+4gRGJ2hm43dIFOsKTvgfiJzzi744=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4aSJqr6hE+urSmdL9BtvYWHNXki4DSKRJatAcbooPAi7IVS6v
	pLrzi9qnLFhGKVRBzQTelji0p4MNB2o+ATx8RrjQK0VBiNAX/yty6oUK
X-Gm-Gg: ASbGnct4MHtKL91+tQROIe8inuJxNbWT8Ipa6WMeSuf2R/ok3ZixakplUzMHuf7aPWF
	E6hNw0p//z6M14fekqia40SleVeIPvJvUWrkaunWI78AC3IoY4YdE1RINEmz6GPmShtSfkAsP9l
	cwotQblugKpt1EzET8ShtCRNZx9LGZEbuVPwjcy4QKgnop2Rkf8hmQc8TZG2skLcbPEzdzbV22P
	fwpCdkR+30qqi1tVdjHlevV0ofZ8JsjRY2Tvj/W4vn98abXb5ZSNIQFh2hdl6JSiVVuYxPgwTk/
	TDePHMn47jxepnyMIwIdVx84k86dqFeWywWUGYZWhwX1TQI4ecK0g/0LFYJ0KbeJ5XXOiMV8g1t
	GI2LrvSVMk9fyTZS5+Lil
X-Google-Smtp-Source: AGHT+IEbc9AVFakYZpbdR7rVCLvCec18sXj2vaHTDGV6a2A64i6B073BsLEms/87izlJzKkm/8wFgQ==
X-Received: by 2002:a17:902:d487:b0:240:4d19:8797 with SMTP id d9443c01a7336-24246f8c70amr191050325ad.22.1754363051610;
        Mon, 04 Aug 2025 20:04:11 -0700 (PDT)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31f63f0cb39sm15390881a91.30.2025.08.04.20.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 20:04:11 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()
Date: Tue,  5 Aug 2025 07:03:58 +0400
Message-Id: <20250805030358.3665878-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_200412_563541_A8EEA4F8 
X-CRM114-Status: GOOD (  11.49  )
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

Replace NULL check with IS_ERR_OR_NULL() check after calling
rockchip_clk_register_gate_link() since this function
returns error pointers (ERR_PTR).

Fixes: c62fa612cfa6 ("clk: rockchip: implement linked gate clock support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/clk/rockchip/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 19caf26c991b..2d30b1e24f01 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -693,7 +693,7 @@ void rockchip_clk_register_late_branches(struct device *dev,
 			break;
 		}
 
-		if (!pdev)
+		if (IS_ERR_OR_NULL(pdev))
 			dev_err(dev, "failed to register device for clock %s\n", list->name);
 	}
 }
-- 
2.25.1


