Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC860C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 17:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OG3fQOQ/VuZuHcKcajMtkmekIa5X8h+Q4MAhuhrOcMM=; b=KynpxiZm7381NcsAaxG1vyekjj
	rTNYXM28WWBa+OEKhaqBtBjSlH+rKsF3T1sK8Aeeb47XjvZ2+LQZ7Z2sWQsiFKnm8KtDNpi7Oklv8
	Tt51gbHMotmDrls3rOhQw6SSTPw5SDq7YxIxhxg6QzFf/gydkDR4tl2dE1N0I6JMQSK749hfR9GbP
	Fhom6dyFEnYXO8B8bUfNwApOHIvPhiTgWJw53j9JBUKBhUZHu0iPEmwAWaX2V46mP4qwYfViEKBmW
	rQwPCWJ7AwVAdgfZBWBweOHF+nmiWFVYHqpo9Jo1HsJZ3SmFxbQRTtcIaFJtB3jT0GkmQXT0kestU
	oBib57SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2yg-00000001Rec-1sTA;
	Sun, 26 Jul 2026 17:49:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2yd-00000001ReH-0bKE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 17:49:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49557167508so20168305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 10:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785088164; x=1785692964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OG3fQOQ/VuZuHcKcajMtkmekIa5X8h+Q4MAhuhrOcMM=;
        b=lWiW4uSAVt6sqqqNvUD2YqGE8ffO36l9rJifAKQxvoPsgmiJqx7wuBzxwJAiPlG07m
         2L4o8yJbkQMszDylBZBukSfJFaB6oL4iZ3kYI9aMrLXciB3Yqlsd1SKbwHb7JGW+QtA/
         bEz7+v+8yo9ZDuqoEzRnT31XKNUZCj467SEljqeaGD9NKa3EPNcP8fKSwVtc8xH5BjRB
         v6hp2FqC6XxVo4hUin2szDS+REkoCsKipg99g679SdnCLMUkR/mCrha2fqIFPq02Yq9O
         BXlx3ADayn/zMapETfYplJ0ljHbHSuUlC3TQMBmylkPE0PZZAINFAWYt6fv5G3VFZ/e1
         5pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785088164; x=1785692964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG3fQOQ/VuZuHcKcajMtkmekIa5X8h+Q4MAhuhrOcMM=;
        b=XNwymSXCko9apBLapC6JYf473hogDGRK8WY04Do9PE/NxUblQGQnB9N1Eiyz7jba0U
         odAKrd4oMxTWiCD1Wkgmxn6IeZKE9Icpx1MwpK5MiFi96SHpP0GWCOf5RXGURmlbVVkC
         uwmDbuyOw2NGjk9vK7ewXC5ED4MjqTr1p2UG2B3qTjLaeyRlfk2N7P1qY6eRKTASTfvP
         xD6gZpBzBP4YjQthgtbBYx9RWdtzuceYLkP5j6L4ZhDSqlRBHpHMuEKNNsT8jh/24vja
         /+i6e4YYBmP73LpAELCOGIwVWiqD/7tubH0803nn9Bk140S+kLQQNY/Ty1+eBZEHqOIW
         81Gg==
X-Forwarded-Encrypted: i=1; AHgh+RpNT/Wh5Qg55+e7wqy2lXtRUvw4XEzczATjHJrvPxRBMtTZPIA/VNlhmRIi1pjWzsJ0iBugvVV+rtmwFzNik2UQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7LnnGoD8ykBumBBzvBy+t6uNls/x4QE+XD8qqQ/tWDP3F2PLm
	087X4QG79FhaP6ikW+Pn1TXv2KxyLOrOpDRu7Ahk3SS0/RgJoLJOQCYW
X-Gm-Gg: AR+sD10N6j93PGYojs/gR88UASMhJQpoK6d+La81XeGq5fJxADaILdVQ6HkNTmVYO43
	6mO7vxC1JBemjWowFqHrOqLOPkL/hjPwMxFO/QaJB8RSwy34Kqh1I+4TylS+8Ep1QHwDWfHnugi
	bZHvCLzBrf/FyTFG5AbnbqzDGgctNWFmKkLkfzn0o3GrrCkP6DrOJSE4eg7E9enWiTZv6rgteDF
	NzH6iFlQ6ZcuRbC8Q/cla82HPIOWLqXdvUZu+3Lc/4nG/GbZix/Euj1Hk9byuv4iIpiGsNWsubm
	W9OGWy4rCzFyo/S0v0cY61OtHSArNZgfbVTFAUradMRAgoSRj5TNx+1ZRijd0KY1UBdLT0XLr8g
	u4NqSEpTjXPm//e49kJsqycBHosgX3jHW29XaeswmuSX48Guuk7+4viODOvmAmk8GNo6+BL8kDi
	B3VlC4yFgYen9YArFLykJICphOQ1uUOoUw9GdN6UpsJilKoHjUnvb20pL6cYLsYbIKMCwK0bWz5
	92i1m8TqyO1jQJmOh2oYd1X9ok7Ua4aK1I617NKCT+8+tXiaMY=
X-Received: by 2002:a05:600c:3113:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-496b56bbc22mr70116885e9.1.1785088164322;
        Sun, 26 Jul 2026 10:49:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm45288820f8f.1.2026.07.26.10.49.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 10:49:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: GICv2: Don't WARN on out-of-range GICV_DIR INTID
Date: Sun, 26 Jul 2026 19:48:03 +0200
Message-Id: <20260726174803.5880-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_104927_248077_471740F2 
X-CRM114-Status: GOOD (  13.05  )
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

vgic_v2_deactivate() passes the INTID a guest wrote to GICV_DIR straight
to vgic_get_vcpu_irq(), and treats a failed lookup as a "can't happen"
condition with WARN_ON_ONCE().

The guest can make it happen at will, though: for any INTID outside of
the implemented SGI, PPI and SPI ranges the lookup returns NULL, since
GICv2 has no LPIs. A guest running with EOImode==1 writing such an INTID
to GICV_DIR triggers the WARN, and panics hosts running with
panic_on_warn.

Drop the WARN and ignore failed lookups.

Fixes: 255de897e7fb ("KVM: arm64: GICv2: Handle deactivation via GICV_DIR traps")
Cc: stable@vger.kernel.org
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
 - Drop the WARN_ON_ONCE() instead of bounding the INTID before the
   lookup, which duplicated the range check vgic_get_irq() already
   performs (Marc)
 - Retitled; was "KVM: arm64: GICv2: Bound the INTID in
   vgic_v2_deactivate()"

Link to v1: https://lore.kernel.org/r/20260725154020.37305-1-kmehltretter@gmail.com

 arch/arm64/kvm/vgic/vgic-v2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index cafa3cb32bda..7182f63fc938 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -170,8 +170,9 @@ void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val)
 	/* Make sure we're in the same context as LR handling */
 	local_irq_save(flags);
 
+	/* Guest-supplied INTID: out of range yields no irq, so ignore it */
 	irq = vgic_get_vcpu_irq(vcpu, val);
-	if (WARN_ON_ONCE(!irq))
+	if (!irq)
 		goto out;
 
 	/* See the corresponding v3 code for the rationale */
-- 
2.51.0

