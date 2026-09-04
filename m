Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C804EC79F85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSrYA1DkzHEof4sMwyJ4ZJLRu5Ytzn/ZSPLCLv7l2KM=; b=ZTwUzy8HdJPKpfmg+k106/VnRB
	/W2J0+XCZUyej16+kvS15EGWlAhDwDsrt7hi3mSE3vkfSnFUvSMS8/sZov3kcjQ8SwK9npesY6dMo
	GXia00OI1skWAmNYv97FzTNHwD/k9w/ciyx2aYL0mLclJLKcGjG4RckTC8LvhGYvEWKGts8kKdjfJ
	IsGGAx43mmqinY0ghdc6j3KZ0VxoBwNWSM4VKiBz/t6qCjnVSg6lNp/49H3dSQMLHEe4GwvwJvRLl
	cuicU+sDIIGmqGFcip9/UWGv/U5up7BWXTSUvYk7VfEJ+slpXFNCCE+tauJI6KcT22mY0qS16bZ0k
	cWtoC78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SyY-000000021R0-0381;
	Fri, 04 Sep 2026 12:24:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SyV-000000021Pl-0x3o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:24:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso706240a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524694; x=1789129494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSrYA1DkzHEof4sMwyJ4ZJLRu5Ytzn/ZSPLCLv7l2KM=;
        b=g1i8AKNo1T6yGNXF/qwFRLL7/kjer22Bc7Tpv0eXORsdjO4ZaeKdsT1eQK1tWafXlV
         2Ye38GHl0zhL3HLnjhX1wN+wkS8SR9UHJHj93gMm0JinZF7KYkqw/012QIVEyjdoGjpA
         sPN9BSZi8CsP5ybELktm3/TbWjZ+vdDGINqz5VHAlpGyO5KYlFNl8P1CFp8fsGIplJl+
         1lFEV/B79os6yPag/Ra9nj4w2M778FNKaewKsZcuDGke2Nc1hN/DCHhcAJL+w/W282uG
         jw2D6hkFFxX4Oo6vzNLpQO9S02z2HEIYMU0eF7wANbqWqKNC+56zVu4NRjqL+F65GaDP
         60Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524694; x=1789129494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSrYA1DkzHEof4sMwyJ4ZJLRu5Ytzn/ZSPLCLv7l2KM=;
        b=pRRJwAuRIWtqli6FbHuEcJpgNA+v+byjp0Qs8sWGpQ/hff9nJFCYkDHnoZr5TG9Dho
         gF8YMyxGlUkvSq47mcp5MkpWX2s8uolwFAZLscNkk42VkZf9y8AjWhx+MXWDDxcqWerk
         HX6Ns832ZItfsuhP34h2dmbKPtUxKE8G5GnNyCsMLTYOeGOUnmV9oCnusA4H1YIPVy8K
         VOxWagnU6xTiuzfk69ga5PThH1Pl40pMb5dw9YgjUMwsfKDmKyf/Jz+UQhtOG0mwNbzg
         Gbo3ndy/wSzEmAUDhXs+ksFr+9bnQoFKCM9hdbRzf7rd8k7MgS+SvkfFeEOSTZVEuCx/
         mLCw==
X-Forwarded-Encrypted: i=1; AKwUvBzvSOuSKTarenuZvrra8fjcanKtgL6ma/J9GDMKaeuQjB01Dv0JJQVv5xXUrxY9X/uCsrwiXWz1BXtAq3ojCe9A@lists.infradead.org
X-Gm-Message-State: AFuF++mquoL3ENEzeFluD4OB5C7NVfA2MBHRCyTRyX6BpKfZBv7G3fbp
	MnM+Oa6Pa8XONLZEI4MLRr4FPuES2sCWY23CZey2a4h/RLNszQiU3wI5
X-Gm-Gg: AYBFou17fScsANLRWjCwbcCzPlppnsYQ5wTLnmn/nwvVO6b9diHfDvJm09SWpomk291
	uMDzEcH9ToE3a3ambvfN4/VTgzqEs/8PzKJ4yMLPCoh5ifPujAWGEwDgJ3UeXu8HNmwjMn8mvDi
	vj3HbM+shbaptEB3evVz/nISDsYfuLMBfwEr0zxCNcIUnKywxpDfd/DPwHxPBrAdNJFx90qEvfR
	7ty3FYoiuhcJtF8Z326HoeyAEh+3vKDkZqYukB7D1JqPT4t4yl3hGLKdFnLzaAcQpAdHmmrkcJ6
	vK4aRuVLkIK/PTCYzfsNyoWyeGSkvLTOy9Wb0yiRntrfcsISd0i1faGZbe2gP/A30TTgReGB9wr
	cp11ehb0pCgvm0PT7F6x/GNv4UO5D1dpTX6T1GEINoznzzDzCMdQ2XeU89u37OfYccfk8dutWZW
	BUCD8RxhPvpC7u5aNou6AcJcj0NQtm2PajmnBFY1H1dm6nUuVqvTU8TLoX1QETKgG2fwK77xo2m
	WeVNAwnUps101Nr4QFC2eFVHUY=
X-Received: by 2002:a17:90b:2e52:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39b260dd3efmr8705280a91.1.1788524694319;
        Fri, 04 Sep 2026 05:24:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5880860eec.23.2026.09.04.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:24:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 1/3] arm64: kvm: fix typo "synchonized" in comment
Date: Fri,  4 Sep 2026 17:54:40 +0530
Message-ID: <20260904122445.31163-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122445.31163-1-hemanth.selam@gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052455_272568_11F02E7B 
X-CRM114-Status: GOOD (  11.86  )
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

Correct "synchonized" to "synchronized", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/hyp/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 308100ed25de..9709905f21b5 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -46,7 +46,7 @@ alternative_else_nop_endif
 
 	// Ensure that __guest_enter() always provides a context
 	// synchronization event so that callers don't need ISBs for anything
-	// that would usually be synchonized by the ERET.
+	// that would usually be synchronized by the ERET.
 	isb
 	mov	x0, #ARM_EXCEPTION_IRQ
 	ret
-- 
2.48.1


