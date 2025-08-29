Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43714CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHsFOCN9HBPfTp+3qJi0ndRfEXrSipRtZtKnzK1hfrY=; b=c4/XI/PMnB1CD2UcVrr0GJCi00
	Qipbht6JEyViBaZ+stptTDz/DaqipvYHOEypVoFOh8LPK4Foir78FguFTPd8KjSsZR8qZHU+LTqb4
	qGY9bOBBHttvCTw8Pln1a0EX7QQlLa5iqtPtpj0DJ2Jt3nK2lfJTl+wDZLzkjdUpaJCnx27ldGBLR
	peKIwftUWbX3gNp5Wyt1xZF8IL0BydheM1aly2kvUHR70PwCRGMT97VU0g45lQg4ty3O+N6hUukss
	yXp7geoTbaEMVFcqiNuNJa1Phg+Bc8zJN0UF7+buveZmgcOar0kAw5O8nkg6lvbyIGH4cnqt24vpY
	NoX1qKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwD9-00000005IfN-0V2N;
	Fri, 29 Aug 2025 10:19:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urv5D-000000055RJ-1jGg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:07:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3cbe70a7923so1488595f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756458461; x=1757063261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHsFOCN9HBPfTp+3qJi0ndRfEXrSipRtZtKnzK1hfrY=;
        b=KMV2TUf49yq44ajGEUZvrG/KdZNmZzt/nIbprUuH0be4ZAjAId70y3R//mrpDaFrda
         u+FSUZa+Td7C1uxsbSfLNJJ/CJp2Za/jBzf8g5Fvg4k9z9+fnCb/O87Lms9t8G4jiWlZ
         ZEonYROBSZTnIC9o/H2WIJlpTeUFAypo4OzH6iCdBqsydShGYRotXMa7n3pqrCuXY94k
         lkpJNd18GwYOOkXvTuH8Fr3zuk/t5zyedlMigxZd58OSedAKmEd6ULg1YGJTGyUBxloN
         IlMC3t8rR3ZvGln2dY1RAinILKr1uxbPt3qVEPQsXr99FeGRA+IqxwDHcoUOvuiZdfqw
         X+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756458461; x=1757063261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHsFOCN9HBPfTp+3qJi0ndRfEXrSipRtZtKnzK1hfrY=;
        b=CccitDUYhz0daAEfTnY/l7Oq1efEio22FRO3jxdhc8IPihz0QUTU5Hn5OdfyYYwsJX
         RNAcWJzzdXXPttcA2upyOXpYYQVaKr/luulDJ1yeUB94NbZ0qoZy1juUcrtQDOYh2RdY
         OgHDeyiS6KGKlEGWPvT7TT3rq1UWQI0o7JDpvI+2E/vpyRkajYbk541VyNUIpHzPzM3m
         V9IoSw/z+w9iKVkp/5iSorvdv11sC7Lf/TgU+g62Nm3rxGWYBGFvqcySEoo/vItTz+F9
         /03++hvpqbSQ683ksF84yZEeEb0NiBFmjAfHjivD9p1VvZNslNDyaE0J9nWPXqobK3xy
         fEkA==
X-Gm-Message-State: AOJu0YzWO9nwkV+A7BE0qKSnt5nany9oi+pg+pJXFE25uKGk2RJePzuN
	KOEjG5oSl/kB0hNdyW78uRoP7urqhyLLZNrGd0nIyNUj5feAQ6z+fhNM90uxp7H9ALvLsqwXthw
	RcGhp
X-Gm-Gg: ASbGnct7SKjXttlfacvi/aH63po6YQtHd3Kk0NeUKRNYPL8idWZt5XB17eLl8gIlhw5
	JqR29q7IB26rpToK0MRygo4jmBqdtxyJKo/fzyRNwMbhn9e0JmqJmjXlvKWoWnDD0xRhIULMEmW
	REG9RH8AxIrd95l4NOQ9KnwuTXp7p8JTq/hKZYWMJp7ETUpS0G3tDK8TjpHXe/2bqitQX8Has0R
	hJp/RwCU2rFG8Uf7IfWg8ONyK3a2SuEdaD48So6X0UovVjSMyJ+VwCcgffHO9EmurdMufsOxwMg
	rDqWJHPljEMzslfaSpElBJgIHMXJC2lmq3Cl/cbTsmBOfMa4CX6H8z9LQESx9wxZYbw3Ym8zfoS
	xHKd2QTX3tlSRs43bRziNy8NOx7bgd7DSslEv2JUnqI1/kqI/Yg==
X-Google-Smtp-Source: AGHT+IEQlpOdkOq6rxIeeWmNaS5Lz3aiqP1fn1/KRHgTvSLr3fliJD6VsAF/Pvip5DahmMfXaaxe8Q==
X-Received: by 2002:a05:6000:401e:b0:3ce:2116:bf8c with SMTP id ffacd0b85a97d-3ce2116c444mr3732921f8f.51.1756458461226;
        Fri, 29 Aug 2025 02:07:41 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d8ebdsm2560942f8f.28.2025.08.29.02.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 02:07:40 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] ARM: module: Ensure the override of module_arch_freeing_init()
Date: Fri, 29 Aug 2025 11:06:44 +0200
Message-ID: <20250829090726.834456-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_020743_449850_9E8FFA98 
X-CRM114-Status: GOOD (  14.02  )
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

The function module_arch_freeing_init() defined in arch/arm/kernel/module.c
is supposed to override a weak function of the same name defined in
kernel/module/main.c. However, the ARM override is also marked as weak,
which means that selecting the correct function unnecessarily depends on
the order in which object files with both functions are passed to the
linker. Although it happens to be correct at the moment, the proper pattern
is to make the ARM override a strong definition.

Fixes: cdcb07e45a91 ("ARM: 8975/1: module: fix handling of unwind init sections")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/arm/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
index da488d92e7a0..55ca3fcd37e8 100644
--- a/arch/arm/kernel/module.c
+++ b/arch/arm/kernel/module.c
@@ -484,7 +484,7 @@ module_arch_cleanup(struct module *mod)
 #endif
 }
 
-void __weak module_arch_freeing_init(struct module *mod)
+void module_arch_freeing_init(struct module *mod)
 {
 #ifdef CONFIG_ARM_UNWIND
 	struct unwind_table *init = mod->arch.init_table;

base-commit: 07d9df80082b8d1f37e05658371b087cb6738770
-- 
2.51.0


