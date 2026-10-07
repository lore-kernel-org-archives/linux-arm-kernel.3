Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1D2CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8FWqswNObLYfcWOqQ6/Pb15Xj4sKDNQtqT1jwVfTss=; b=2In/Wt5ufyHvN2mymwGV4oBQ/B
	EFk2gZnzJ981WMVpSQzag3mjQFyUZ1tVcPlx37KiUCmrwbMEQz1Z/R24EMgWi7H2aCFaYmiNURq09
	yJul3H60uHZc1W4Xqtyk3Xh6ReUJ0oCfyEYe9cE8eKGmNcCFeyF+it9wFHi219PMdvtRZat70WXrh
	hPpz/YXvgt6hqMtt2nEXpA5+7PLPtQ8FGbzHS0C84wTDSoRZBXIJJTBsY6F12lOQG4y7FMvc4AXp2
	IM38xjvxP9pkZKdGd5b4HzEni31YmfmDsMXlfETjfmdPmvTreiZSBoPRdaOOnMRhMdH83kvBp4Dku
	bXrjIHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB9-00000002fsW-2xlI;
	Wed, 07 Oct 2026 15:03:35 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB6-00000002fqW-3hyz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:03:34 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-486f9d150c3so2386898f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385411; x=1791990211; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8FWqswNObLYfcWOqQ6/Pb15Xj4sKDNQtqT1jwVfTss=;
        b=f68/+EZ6KhOtNPbr4mVzpdKkXFNtrb5z3pd8yllEsq1TM/S/paEwqqY1Ichshp8kc8
         gpk/dSFp8JohsNssc2+4KvOw/RjDzJLGUBFo0k7M80PODSm9VNSk62lgBeg7q9E2QC/+
         HkVSXmQiuDzZVaiIvsNJZvlsbVcvstezwVG+9U1bo5RJkEN8ekcs0ThfO4vxcwW8EtG4
         xelgwO9bR/eWmczs1tOM6ZeIhBCf92fQFWekln3YAX0kXP3Y69/1aYxXCh6cAb9nst2+
         3aHe5Yqs0YwJ/LVNmBdnMnDydAz2vhUE2p4N4GH1/EiOt/XfcBIJOoWvokqt/klqClcO
         UWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385411; x=1791990211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8FWqswNObLYfcWOqQ6/Pb15Xj4sKDNQtqT1jwVfTss=;
        b=mV7dkj8OX7ZGO5O0cdJnIpOh5dlcNsQRGdxUe5kSOOMTGY2kPDaATw6ye87/Hd9VKH
         8841kUPBWreFTjtCf9zYZCOAd1S2VsruaeY+eEKo1DlFWNpcrtAt9X7sBUEOwBbniwi5
         R5/1uvgfv/7n8neUYN7wlBAdKDEH8chc30bEjXGT4l7rs3U1wnGIGvoxNBJzi09uL+dt
         GEU/t7was5V2dDy4gk8PPHxvQg7PT2vPMKJq1YFDGvI9Qfri1ovHop+Xie8EcPyG6avE
         8NBeLyPXY3gQkJvXnJ/3g7mk9aNM0VoQrU+vyFtompyvcHPH9Ije44BRkMH3yXRgTc0t
         N80w==
X-Forwarded-Encrypted: i=1; AKwUvBwxu+Xm1wlnfC0vk+wa5HmPla6oOn5O3NDjcKiv4nMZyUNzNWLN8szQzSiW3USURc9HyAPOGzsNU5fpc7JAFsmS@lists.infradead.org
X-Gm-Message-State: AFq9FYKmCV4oNDVuU/nRvrh8NjWgzahLqo9K8qgwgqfmU6rcwV+/Zcke
	6+k6KxWUizU3qIA0tco/LzW9ty4+3aHpnpSFYXAuRtYWTUYYZsp2XBURl3quTcoVvQgp7MPr4DJ
	G0uO2ZuAviBS61UyVnauKDw==
X-Received: from wroq15.prod.google.com ([2002:adf:f50f:0:b0:488:8365:8c38])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2284:b0:48c:490a:336b with SMTP id ffacd0b85a97d-48c7270327bmr5179418f8f.5.1791385410421;
 Wed, 07 Oct 2026 08:03:30 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:52 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-3-vdonnefort@google.com>
Subject: [PATCH 2/5] drivers/virt: pkvm: Make pkvm_granule __ro_after_init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_080332_965402_9997E8E6 
X-CRM114-Status: GOOD (  11.88  )
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

pkvm_granule is only written once during init in
pkvm_init_hyp_services(). Mark it as __ro_after_init.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index e7d7cedf7f6f..fbcb57c31186 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -17,7 +17,7 @@
 
 #include <asm/hypervisor.h>
 
-static size_t pkvm_granule;
+static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
 static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


