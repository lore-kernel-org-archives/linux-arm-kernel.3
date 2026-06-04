Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A0BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEYxqRws0IUSMm1LUk7BAiLRYO6LZtAhsNNeVVpZ2Ss=; b=PTKKva7TZcA+Tv9G9WRTyYcon/
	ELgjZes5KtDdhFo3KafywQIMWGBDOdNJzDao5c95tHoZEPP+8ohyseWwXqEfDIBgwdcwIi8FH3Twh
	Zbyi3XdZZvTjF22kDUvcRpKpuEIfyYLruA0wn/4yMjiqZG3CdNoPJdu3RCp8K/97KsXZ1vjwZHJ+S
	JjJsyIT04luifoxLboMmIXhiXvgXeorGhq7D1d7Wvkw0mGSns2TuDcbqkv8fWRj6bo46+BkymkpYh
	SrRFOZA5+adkVBkUUAsoBuBhYderjT/9rzHpGFgeMVCYEG6Lq6pOaVZ50savupYYtHTUq9pG/biis
	/IuOtE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kC-0000000Gy21-349M;
	Thu, 04 Jun 2026 15:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kA-0000000Gy0C-2yz3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oEYxqRws0IUSMm1LUk7BAiLRYO6LZtAhsNNeVVpZ2Ss=; b=i+LQGoa5+Eh9H3K+seP5w4YSbT
	O+WfJvd7Ob01GRJ4tN67RwLUrhhUJs3uCFQyruKxgkiSEWR13CvHrmN1x8L+BYgD7uQ5ifuCRtMBj
	aoF1uh3EjU/Ta/x6fwtbeEvoew1r3Ap/lESBD2rE2/8KP7oQQvdnUILzsFEsTOrmr/g+lTPmp2Moh
	5uvXzCwYeUkpocgXqFUP6o7yJ2cvZBHI4Pb4PZH1oaEv1atSwTH3trVUxf2PEPDUH7VctJXzy8Xrc
	fbdJkvVGP1ubuElBLCq50wEK2IViil5TzfUyWJSWQZ2+WY8h7FHI9EwUyn70L9Pvi1LiLCj8Y9We1
	qRt8DlZA==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9k7-0000000EUc6-35sL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:25 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-46010392f89so709657f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780585941; x=1781190741; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oEYxqRws0IUSMm1LUk7BAiLRYO6LZtAhsNNeVVpZ2Ss=;
        b=VTrjs+S5/sHZpzZ1IC0OSW1OvneTSX1i/S4KBmwznZFkIhRqf+VE8P3IdRt0ZeB1mH
         g3q1tQy6bduunM9qP7X+bULDSaJh9xvOP2jWL+MRSvlB+x9CTiEc/wpH60pYlf43vZqP
         mJiIrlSlSpJFAkkJvRzPLyrIZuupNHHaOmm8SrO/eQkKtJEZQ8BVOfHSW3u9GUy8KVr0
         86pPNrY2fHqfjxsuVESLQjzR1froDiyuRXikOvZydICLqoQekqkAbhlmCXn6DUmH1mI4
         npcbdYU2qi9WagnzskOBMKcRWnZS+1/iUvSgImpIa8g86f9NnfDnyygI6cCi5R6VMFHP
         +qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585941; x=1781190741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEYxqRws0IUSMm1LUk7BAiLRYO6LZtAhsNNeVVpZ2Ss=;
        b=fYDD1v2SkCqsXq8TafO44fVmkn5m0VpuLW5r4ThY7lzk/TqqAFY4UDSYEcXgK/rC9e
         UZYXfa7KxF+0lrLOKC0ruWfqd1RCihmJadCHFHbsVZAgIxjehJzOCqEZr9u1/TiWgBeV
         DCQ5Gk46PhatPeIQ6f3/z9ReYji4MhlymKKWnEaLTF0REPrV8fbyaxGyhMiAIN7AUXB9
         I5Q0WjYY7fAKSRJvnmGGYXq5bp6n/W1V7jXY6d9UMa/lD665+5gkTR6NbCkJKsx4HTen
         l/kyrgVUv5NJicQRnjsUdRXVHnUjHk6k09sY1e23LFuzOS/R7jC1Q2J8Sqxx1IzLi2Na
         Dpvg==
X-Gm-Message-State: AOJu0Yzs/MRJLA5aOSVvfG4yVuSUsn/tUoMMdqtjmVOLHv33pITtvsA4
	GDBXXIVG7BD1vfH5oaYBphGEKWFMLwboTIRnl98+xjacrkdp6MwF4neu6Nt/IJFtp6JxtyDH0Uc
	VdG9L1NYFPSO7k08e0Sun9wnCM/fXea+yn36SQ0z0CuAKTIUsONGY8UxurEp5DhymivGi9oeFdi
	yINS1PIxqtpHmUs8nA5d54EI2GwH70KuGofm4QFKTmQ94P
X-Received: from wrxa17.prod.google.com ([2002:a05:6000:1011:b0:45e:f34b:e7e2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:508c:0:b0:45e:e513:f451
 with SMTP id ffacd0b85a97d-460216bdfc2mr10238730f8f.7.1780585940926; Thu, 04
 Jun 2026 08:12:20 -0700 (PDT)
Date: Thu,  4 Jun 2026 17:11:56 +0200
In-Reply-To: <20260604151151.150377-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260604151151.150377-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=ardb@kernel.org;
 h=from:subject; bh=dgwiIv5ocMLxRg+g7B0P7cuef9P7d1jooOl8YYuWFh8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtx6j7/xBdu7ww3VF8umHhOrTxmv1X/ehmmq7us1DyOv
 i0p29bWUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaiuJuRoTl9/jm1B92rg88s
 qn5ctuPIxa2HebZOu21xL9pGok+oyYThv/c2me2fBNfc1z/w6F3xuZ0hWWpsYfkRcSH9aW1urJd 4WAE=
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604151151.150377-11-ardb+git@google.com>
Subject: [PATCH v2 4/5] KVM: arm64: Omit tag sync on stage-2 mappings of the
 zero page
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_161223_916563_A6BE0645 
X-CRM114-Status: GOOD (  13.37  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Commit

   f620d66af316 ("arm64: mte: Do not flag the zero page as PG_mte_tagged")

removed the PG_mte_tagged flag from the zero page, but missed a KVM code
path that may set this flag on the zero page when it is used in a
stage-2 CoW mapping of anonymous memory.

So disregard the zero page explicitly in sanitise_mte_tags().

Fixes: f620d66af316 ("arm64: mte: Do not flag the zero page as PG_mte_tagged")
Cc: <stable@vger.kernel.org> # 5.10.x
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kvm/mmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..445d6cf035c9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1479,6 +1479,11 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 	if (!kvm_has_mte(kvm))
 		return;
 
+	if (is_zero_pfn(pfn)) {
+		WARN_ON_ONCE(nr_pages != 1);
+		return;
+	}
+
 	if (folio_test_hugetlb(folio)) {
 		/* Hugetlb has MTE flags set on head page only */
 		if (folio_try_hugetlb_mte_tagging(folio)) {
-- 
2.54.0.1032.g2f8565e1d1-goog


