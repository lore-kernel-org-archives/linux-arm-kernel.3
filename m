Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CFEC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqsDr19JXvidHyyqxIyci4BA4wq1OiK0LXdbSrmZDL0=; b=HRmpcss8KEwRB6CaSq+3IoYJy0
	C/SAt8Ed4Jq5SG6/13Y1H23S3JXp2olLiNnlQZCY6RjX/NiROeB9J2InihBzl8Mm9lSe06o1GgPPL
	tDC9DvOW+/nepr+Rs828PwJSTsFbiyo2R4+amJZMmyiSNEAL7Arn89+J4MDlmxNGO672ZNcpJra4A
	+hH01n/rgxeV7Jo7Uy4uL+IRqBo5fvlVHkxiB87OfN0vxAohO55Wb53L3i9/fvHtXNKq0OStLGDlH
	92ioBsLYk8fXYNHFZQ/8j3OXOgvfN4r2AF+HMt46jZ/3C52rJMSNjBUWsf/7vfutq4YzY8gm5IfA5
	84mH1zrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS3e-00000008k6C-0cZH;
	Wed, 26 Mar 2025 14:48:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvH-00000008iS7-0NVU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so6991685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000001; x=1743604801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqsDr19JXvidHyyqxIyci4BA4wq1OiK0LXdbSrmZDL0=;
        b=S8e0lfDZGYQNevpsUVsMr5CunYku4xZtUhHKSep/qA07GTcfggXqFFpQY802ihzyds
         n9f6TcQ3eKz9+rSlOUsqWOcj1Wnu1PQqeTImeMI3spNB5svsaBDYzuqOo9n1yjvbJ331
         l99uQItY/SSSV8Zk7SCN/avJYLqTIduwxM5/ArdiIXCZv2v3U/ssOnVJeLj7QTYTW5hO
         cGLRXyrPL/lLbGkaH/hwdm4I4Da5K6I6m1nRMlNkzQKsLYIOXVNqLg/wfODpm6smU4hG
         Pi1Tn5LDuiTlLYrkgr8cm8ABNkyT8OALLmdsd9HAp2jO1IfDY8nKGf3L7w6vXzIvz0PU
         lJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000001; x=1743604801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqsDr19JXvidHyyqxIyci4BA4wq1OiK0LXdbSrmZDL0=;
        b=fH3eu0UJDULOcjT7I1ZFRWXmy+/UdG5WFqDRuDB6Azk+c0TQxYXj99LtJlf4yJnX8V
         d5t0l6mHmF1JuECiwWzZ49/hVhoYHkXFyKqNoCezwN9FKCi/EH6qKcEXMpVrmUdsQ0X+
         Rm51RQS7TqjJvtb1/mzBydTbyfCnXx3EE7cUA/sAfEMCdrNalRJR1Qko2CUorauxb7z5
         oSgn3CvgocVc0xMDFH9E8AZRbSVRHPxo8pxsMKcYPeUrlM9VEtA3prwM1M4HyUL2rOc5
         osbqX7zPuS+Hq4FJkCqOltuVVx4i0jqLw325k1697St8pZFyrDIbecMZIifdDz0kJnA+
         Hd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJnrBrmqILI+B1Py1TkYLBssLJIKPFqpvZSA8IbxtZnjgjZCVT5qt8Ej6Ydu1DGtVTVELlTi8XsjPV43cJVePh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3qe7IsM7r2IlcofHec7u1N7tSXO6LSliaYlC6gZNmkB5Aexyv
	rQ0oMY2bdOW/0Lk+2NaFVmI+QOQ0DQ3uIR2P70fp1zpg5wq1tq/H
X-Gm-Gg: ASbGncuHU1aXbktr/7ZspfRmoVkXbj8XK0i6Z/jEL8KzxmcJxgO6iC1+EkRzijnhosN
	pZytv30HGU9CS04TfZgAUDpUHyy8ygS8Air10dy1abzsjTnpdUGgPiHxN2d1zbkrnjAp0PpimAc
	Ox9kkFqf1tw4SzgJwxVpRitL4Gp6n2b4Ax4J/yDhCBPToXmp6sCMcAOu/jXcGXSBkT0eL5awsBy
	S5P0UXHClQacA5zJfqjLMvVSAe5xIuKR9sg0W/8KAIK9hEzzhLKHV1G92Vwjnl73HASIV7VSkoU
	ITIOmd6vxNWXPcF9pvLmVD2+rs8XGE8susjRIOoUvsJTWJLSF3dXuKZkkXChXn5taqb9
X-Google-Smtp-Source: AGHT+IGhxObQ8qqvBlkojpEfVbwey9liws3lzPxH9s7ZyCGPh8xlJSvklFG6Hxw2YfZBFS9UCG8znw==
X-Received: by 2002:a05:600c:5126:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43d846b0f81mr454215e9.4.1743000001044;
        Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 03/15] soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
Date: Wed, 26 Mar 2025 14:39:33 +0000
Message-ID: <20250326143945.82142-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074003_130066_F0DE8784 
X-CRM114-Status: GOOD (  11.92  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a configuration option for the RZ/V2N (R9A09G056) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 49648cf28bd2..764aba6d1ae6 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -352,6 +352,11 @@ config ARCH_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
+config ARCH_R9A09G056
+	bool "ARM64 Platform support for RZ/V2N"
+	help
+	  This enables support for the Renesas RZ/V2N SoC variants.
+
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
 	select RENESAS_RZV2H_ICU
-- 
2.49.0


