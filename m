Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A386C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+us5LkeXEHXP7Bo8YO3vnlZ8f5jwklcgg3vudwCzrL8=; b=xUI7c+IIMIB98fIyPOViH6brIk
	yH46cdzQ+FdwZ/QhVLKsCEiqR+wssd9EfyCo71z4HuNJwcRFTDrmeKnFR6bL8/rB6PkhPweTEmt2F
	LttBNXlWoJby5ZcPx74cLHw1rwnNct7j17aWndHobFUo4TtPc/bZzX3W+LCVzqRRLRYk0yr2KAf/g
	+mbpnQyHHVn6PQIry7SPKBj6jQof1k6rIEOxZM6EgKfAsa+l+Y5VEwzfHCGDiS1mMsfO2eEnc5CQA
	3hL40jOJ/+zwEELc76gF2bpcAfyZaUkk7QgAMY/b3QgCcqKTWzrEqmx4xQSIi73bO/YnbMgtiZvcC
	6Va8ASjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFLx-0000000GyXV-2HG6;
	Wed, 12 Aug 2026 20:15:09 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFLv-0000000GyWe-0Y0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 20:15:08 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so845971a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565706; x=1787170506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+us5LkeXEHXP7Bo8YO3vnlZ8f5jwklcgg3vudwCzrL8=;
        b=H45YY1o+Tub0G0CW+vo8pR7PWBqVQw6c6qqzwiIbzJluqmz2xaEIsz+JGCkshp7gEa
         goaW4U96BURANm7pH3hgGwDsudijBD3aVloNcYRa8DhxLyOlzXbGP9diav3uFcQNrLHo
         ezLRKZIz37mi+Mo/cThuCxhNXUXae6vT+LC9+MschW31CVtCG2hR7RgIJvpabqHrhfDw
         WIGh1CTh2bSzV2RVnr3ADUSZ9reBr6ClJGcu7bbBgqpi0XJyqDl+xHPYROitqRVbW0Le
         1oPvHvdIS4diwrWTd92P7Nl0U4EOqdk51nrB/RK424hV2DZ7AfRwH2NLdOzb2OjGyUq8
         Ualg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565706; x=1787170506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+us5LkeXEHXP7Bo8YO3vnlZ8f5jwklcgg3vudwCzrL8=;
        b=iPAGz+3p7RhVbrAqjyvJOFAQWcK3rcLEmHUES5t6EdOAE0ihVs/1t56EmPXJXKXH0+
         RCI2c5371LVDfp2z7d7zk946BD9QjL8lkAkj15d+Azdu6IBG9m9qTA68cIhHe+7rBtQ+
         Ypwp4mFhmMh0YGtd6u1uYHoyWatIReBlbX3ybEwzl0gscg2FwxbX2cW+HaDJvSrTwbaY
         M8z5yMkxQhPA/d7WBGncasYpbZVgIS2ICe6derDK6eKoHm/nNETrCuRwER+Uk28E38g9
         PEpODlOky48bi2inlOjAlwxvEnJeK6F6bxjwXJ/r4xYRuuHjusIOxRoH6Nn53RI/ehTj
         UF3w==
X-Forwarded-Encrypted: i=1; AHgh+RrrcdDix0lO8pHAymyZWXPzj2tvY1JQRmkm2n+SYFJm7DWFYqyXcY6cO5w/+mO1Of7nMY0yhjyI+l43NPXOS9N2@lists.infradead.org
X-Gm-Message-State: AOJu0YxpUbfYHo0zFTZ4eu6ytQB0oDBoMbl2nUCcYsy5CtEk4b8UJ6Rm
	hZ8SL3wJ44IlbqIDCnZb/4dzHrJQp9acWe0QRYSNITMC//1+oGjcPGy7
X-Gm-Gg: AR+sD10DCLvdnw6dRHFd/0apCUJnrysReaCgmS5/cy8ukFAVFJNgi6bMCpvAoCPGD8i
	P9GXsQfKoMF86izdhgJiRoAPLuGe5jWPDjyRXI72O4RwGzC/S7kaP/ONPTiLAB2v/ubus2K2xWv
	I+JSvJzRQ+6ySNVVh7AGUYJgy3PEL2iPWwsxYGHeoJBt6wSv1Hj8pHc0IO+ra3RyNXBJuoq1uZF
	ORy0EYRyaaJQ/IbRAHl/yvZCtyFNN6GP2sumgic5DXKCPJQKKUMnSXSEU+a153/sC1Hg7Cgj/4K
	c80Mvi1EFczpndd7rxc9Azb0565RPHZpW+/xSIKnNiP1QN/OjM0EAI7hb1HgBVKqcMmT/aC0ze8
	UAE7gjzzwddzBFH/V8CV11LG7GwAEs2it/igwFAU3AYHfabVi0iWAXq8sVxKMR+XglFMpmSNQCq
	1uAlR5+vI8mc4apfpJqPtuXwLiYlcmGWCZugYKNbgsgCECUOLS+W/ce70QSVKduilUWLDQO9/o0
	CiOPnVE1jPd2tn2t2fbNzXatxKVVkL/m4X+H8dk
X-Received: by 2002:a05:6830:828a:b0:7e9:c102:333d with SMTP id 46e09a7af769-7f3ca8b718amr328737a34.9.1786565705503;
        Wed, 12 Aug 2026 13:15:05 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:04 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider clocks
Date: Wed, 12 Aug 2026 16:15:00 -0400
Message-ID: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723004856.55158e84@ryzen.lan>
References: <20260723004856.55158e84@ryzen.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_131507_202170_5C12B0F6 
X-CRM114-Status: GOOD (  10.75  )
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

Andre asked whether we would post the A523/T527 conversions for the clocks
whose ccu_mp descriptors declare one divider field with width zero. This
series implements those conversions.

Patch 1 adds a feature-aware M-divider helper so M-only clocks can retain
the CCU update-bit handling. Patch 2 converts MBUS, IOMMU, and DRAM to that
M-only class and converts HSTIMER0-5 and R-TIMER0-2 to the existing P-only
class.

I do not have matching A523/T527 hardware, so this is deliberately an RFT
series and carries no Tested-by claim. The series has passed semantic and
register-bit preservation models, KUnit tests, strict checkpatch, sparse,
GCC and Clang builds, full arm64 Image/modules/DTB builds, reproducibility
checks, and hostile review. It also applies and builds cleanly together
with the current A523/T527 GPU clock-model v2 series.

not tested on A523/T527 hardware; testing on actual hardware is needed.

In particular, testing of clock rate changes and affected users of MBUS,
IOMMU, DRAM, HSTIMER0-5, and R-TIMER0-2 would be appreciated.

---

Enzo Adriano (2):
  clk: sunxi-ng: add feature-aware M divider helper
  clk: sunxi-ng: a523: use single-divider clock helpers

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 +++---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 136 +++++++++++------------
 drivers/clk/sunxi-ng/ccu_div.h           |  18 ++-
 3 files changed, 96 insertions(+), 95 deletions(-)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.53.0

