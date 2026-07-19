Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB7C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEZSCCPTXF+79jewlZrbFumF51dyS7Eb1UAau5L87rc=; b=LrrfDX4O85/GeZf6GizLTdra5v
	Q687RrmbcwkLGXlWAhht17J0dHY3H2dhUBw9cJNT4cmBXnJAV4dKAj73VTP8nJS08gs0WVRbXgMYa
	8Pj6bzJtuC4O6capAWUwRPzTnF+JY0wn62az1k2jGHutoy8IaU/S9RKcrzHyNvvdsbFlCZ6SujXhn
	LNgcEO8tlifj+EKidmA3MIdxSAGN1UHhb+I7IT7qZ0kXnuDAcg+WBXe6UgBM6ibd3u6Nei/ntvdEJ
	Pwn8o6pAa17rDbE29gcJGq/yFTO131K2rb4L/8iU8zqP7cewWOlCQLYvin+pG4+bKoWGhctY3TtcN
	Uw4aNv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZPW-00000005OmO-1a9R;
	Sun, 19 Jul 2026 21:50:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZPR-00000005Ok7-27Yw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:50:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ce7d2adef4so88848485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497852; x=1785102652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEZSCCPTXF+79jewlZrbFumF51dyS7Eb1UAau5L87rc=;
        b=n7zeSNK7a6LF91nDo75mdApyJKmlH3Mxhfbsu5kdAH368KOFjVEHuu6jgDpENJ38XM
         SOeKm9K5baLJQrEn7e1XiTzGKm5a0qjKBCrr1s1D8Ic4LD27VyS1U6DObIsLXfD5vcZW
         SBANg875bXdEY7T8f6e8kNANc8g3Nc8tbCYG4TnH2kIkXbVqiDisI3MggYunUXajzMb+
         rnG5TzkGq3Qc9LiP0HMANW2jhxaL5e85n6mSozQrwoUV9cs+Rr+uxyWrNjOxJ6WqaQUT
         mPYTOliFDWw7s4/fW+JjGqCeXfh0j+XzhxoWyyDsWSDUasRNk7drGI7plruVfmFix1rs
         BdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497852; x=1785102652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEZSCCPTXF+79jewlZrbFumF51dyS7Eb1UAau5L87rc=;
        b=JCHnqtD/VcoWe94DRsBa58EHJfd+50dWB17rpCZVjHygQ/teAok77pAtgnCc84Jx7d
         zB+UxyoYCuV3Yr6FjLcxf6+YXo4bhcFlPaOZwt9bIZqk4M/BeCdCUCet2EYqbSjryPa1
         kfzHfmjbVZo1PQer+w9fLdnnvKvktpJCWv70Kx61ibZ+40gWeRE/oB1ORY2fzZNBvd1y
         Aip+4jmWV7RlhtVjUXo4y3uyPcHOVObjs8huo8mA1sLySEPjATKwQV/Lt6A0UZeCF8VV
         Sus4JB8LdDlOFLZDFxXQNcEKOZ/4ZNEWVua7QJKzNtQWn/QG8VihcuS8Gs0SO5zvVesE
         QzsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpfs2hRQ5eu5/q96CIwc+2ECBwtz+2uhXl2H6Pih8h884dwUTcohpn3l41Qt1e17TfyOmoae6btz/xuV+UY3Wlx@lists.infradead.org
X-Gm-Message-State: AOJu0YwNR1PSKtKdiurcEVH9WxLV2p9TLTegLaWYtlTatFowGPaPexwR
	V9trgLNdAOJ84eePcsVrGuOR3n9P8sPtnPbwHBJ59bFj9fZtKPiikWHX
X-Gm-Gg: AfdE7cnSjxppTyDNSObcS+r/l7UHEGAYc1LFm5xDoCJe2aDYouktI6PYs2InpEOW61f
	AqY3DtLmO6o1wj/P8/LP/1VhJzpunDgo+cOwc87x1zwpd9WZISgmjjwiNJlDdeVy3VR98EUjzG6
	pQO4s+2bhk7I51UBwiljpkGeKTcJihjU63LwsCyjGRY7sZkEf53u685GumFl0O5WhGPFcNRIvE0
	aw0HNrCU/ubgWYUL6i0h6uUBlqQSN1Yo3jeELISF6QGHfkQ22Pp5vx+uO0GO0eoe2L4tIQ7f5aA
	aF4buNu2Sb389R4SVC8vkF+BnuMoDC8kYRNxUZ0QYmBhPvk9Y9HuHP1IsgA9GCyFxTGF1j3/xOP
	xrrSAJOTqMvfn4zGJ+jF2BQlzP7LoQu1gq6V/9dWpiHAx/4bb3VKPnrcrB7C96+j3DBP7WnwhI8
	8NANZ3+2mvcJDynfiTYPgCY3aXVAwsWMc0JI66R8mmo6dVmE+aBdiX4SXboor533tO2afxoAiC9
	F0UM3SICnVQ3RMpH6smaA1q9LmlACQli5mPLZawhhUubZ3gmgyZEBRBJHcZn2avwA==
X-Received: by 2002:a17:902:ec8e:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2cf3494afcemr121576355ad.27.1784497852491;
        Sun, 19 Jul 2026 14:50:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 2/2] clk: stm32: allow STM32MP COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:50:40 -0700
Message-ID: <20260719215040.767232-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719215040.767232-1-rosenp@gmail.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_145053_548611_C3D9914C 
X-CRM114-Status: GOOD (  10.64  )
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

COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
STM32MP clock symbol for that directory gate instead.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/stm32/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8383f9f1da51..bbcedf5d60ea 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -151,7 +151,7 @@ obj-y					+= spacemit/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-obj-$(CONFIG_ARCH_STM32)		+= stm32/
+obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
-- 
2.55.0


