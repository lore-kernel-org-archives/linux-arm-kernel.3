Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31033C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKsx1Y0DBxO5LiUGbdeLz4euTGTr3L8Ie2JztiqIkG8=; b=2qKJ6l9WYBdP4P+chFdHRjSL9/
	smCMjrTJ9mOspaf9fDbH1ko56oykJuO7hL/bV2cKjl+dChj5ga8YC+UrIfiX4QK+kiShNqoFMjyBa
	Cy4kbGM9gXsL1C7lvaL9BhDYjc3s3eEgayx+ZZI2hG+izr8zlAwkaz1/tEer7McX+1Monq3vveyaN
	tJZiCXVUWEOHLGboeCf6Ml66M8MMGI3+rEDDFrp0ZTqon768NSmqfjBlby81VJVud696d+43Gc+ZN
	Is1w/BrkfGmZ/DEAxVhiHX/ih4iC9jfGQXbUyS4mjRS/X4K8QgpbiYPsfvyafBR0RdImn2s1TZ6cL
	jjDPfQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wo0-000000037oR-42dX;
	Sun, 27 Apr 2025 07:52:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgP-000000037Dl-33kL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27475855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739852; x=1746344652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKsx1Y0DBxO5LiUGbdeLz4euTGTr3L8Ie2JztiqIkG8=;
        b=mgsLJMzn2mJGskLNHsiHFGjswLOW5h0kmGAejZYLOKNF7rKYgKIv5P5AjAwUokc9mB
         /682QoMxqTy0RmKBrkebsNK6IlQjXqZixZ5Xet1NSWI/ThZeguZ/fZXnDDbB91sASaQu
         JB6JMWE+4i5F3vJOnxzLU2DoT8EtQ9uann/Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739852; x=1746344652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKsx1Y0DBxO5LiUGbdeLz4euTGTr3L8Ie2JztiqIkG8=;
        b=Ssc5IJK8L5odbN67eFlt7lZnUWXZKjgCe7ELYP6xQcLqpAuimhAANawzffDLIg9cBF
         Q1+6g2rWq+g/Tq5VzDQmDnH7SWsdgBBWR0VgDbOCfkNYQ/RKJfjRz4/fa3V66G99IRZ0
         Ir6QkTXz9tNCgXZ91BX5tIAk28oa9lSfx9XHV0HaJsyLwM/t029VVApAZvqceVb2A81G
         eKnPjZNDzr0gcWmSuJF9K9GqasC0sMyFmflgr1StQ9vbZKRG5NsSvGLtQ9x41/vpag5M
         GfzM6fhcegaVDpG8wlo1m+6yG56oFBmKIIlAtxL3xdh4ic53u0g2LxKtkFfbPUpbwv6s
         DNAA==
X-Forwarded-Encrypted: i=1; AJvYcCXkFlRAVmMdZF3m70rDAnu2oAg1yI4OC29nBFzXj5zUTqr17R+DTjw5ljt6Ymb1nDiRLKxG2H0PC2fIyeVZSY55@lists.infradead.org
X-Gm-Message-State: AOJu0YxdBfuXomNnldDGrfSe2lb7TmUammEJJ6KQYTV4a0IbPLLp43hJ
	9LRBO/8lsvzL7WPc0p4b0g/yqViOoanbBDojJUb/nFRVVEtbll9QaHo//ZYp+P0=
X-Gm-Gg: ASbGncsADOm6aU5Bu/IpkpFCYUtnhAEO3/AhKCi5JQlMrijkbCS26KPRovDSo5WuqhM
	7oLj1drSoqu2RrsSC80+svjvRIZ05v23i5Cw28MzZ3U47/E2k0eXS4F39I0u7l/VrxvwS+FOqma
	yb/WDwIaanqIWpGejoSAC1rDfZxDRZJygM6tm1dPTYvvlDrUfulCzcF3F+cAEJ5fDkG3eOWuCEi
	opFgy7Ol7Zb/TLwX1N/p5jorKcD9vPd01B5wts4vm1A5EeyRlDI+omLQuGM2HWq+cylQdQm3OWM
	kPoFbL7Qg6XOqdFQOfTeOV9ffZlworDdDPmDehMfKc7dnLafxFcNwKYQyAg9qrLcmQbk1c91pMf
	NT5CT7Q==
X-Google-Smtp-Source: AGHT+IFCEy8x0o5oo3zFYyMXFfS94FwDsXqBWsDjwWzSNdIUrFG48zSXY2rcjCPvG2HDuHNuAL8VeQ==
X-Received: by 2002:a05:600c:1c18:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-440a66abe22mr49622795e9.28.1745739852516;
        Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/8] ARM: stm32: add a new SoC - STM32H747
Date: Sun, 27 Apr 2025 09:43:22 +0200
Message-ID: <20250427074404.3278732-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004413_763577_0F5BAB5F 
X-CRM114-Status: UNSURE (   9.13  )
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

The STM32H747 is a dual-core MCU (Cortex-M7 running up to 480 MHz +
Cortex-M4 running up to 240 MHz) containing from 1 to 2 Mbytes of Flash
memory and 1 Mbyte of internal RAM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/mach-stm32/board-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index 5dcc4ddd1a56..e6233c8725ae 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -17,6 +17,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f746",
 	"st,stm32f769",
 	"st,stm32h743",
+	"st,stm32h747",
 	"st,stm32h750",
 	"st,stm32mp131",
 	"st,stm32mp133",
-- 
2.43.0


