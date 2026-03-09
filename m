Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABD1F417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KUjQbuHQJ21p2RQALWJdLghrvcyrBZVXJ9cfGciG9M=; b=M28NTcN5cuDqcYL6bp98JkDXMd
	pSD42MgD3IevqHkgt5XuvqZQtuU730D6Y20AetcxeOQWO4D8sJy0H1r+5NiOONEvQBUXe31G7Y9pW
	piiFyeAUChTHs5BtPWud4L0F53AwpoLH1IbhkLe7ELiobWEu1S6cyPRJPoRS4yMOne5OffLYaYOmN
	18STGIYR1YqQ+DmPxaaijkTsXUFVTE1HBX+LST0R+Wl/+TTum9onWGSC1ePBit72DcOu0AQ84NBGh
	Wvel8Hs2fpyp0EVvl2HqCzIBnmwVQjUoUFVZoMC6rGyxHidWEn76zyN0fAtMm02GRrMQ6RwDsC28P
	egiCW0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRR-00000007hmo-0teY;
	Mon, 09 Mar 2026 16:26:49 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdR3-00000007hCX-2PT3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:27 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-439b50dfca1so6452724f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073583; x=1773678383; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KUjQbuHQJ21p2RQALWJdLghrvcyrBZVXJ9cfGciG9M=;
        b=EBp6VF38ss3cIvkiV84+VFQKIntpdhIb2F2Lfe0ycTvkxQX9lwEFWiTGkt4IMCzTNg
         A+8p5Hlipq2GVc/wD3AQ3XeiyNGfZzfNje4FXsWyIJOkfsfS6G0fUWmsaZv8JCDyvR9G
         eXtYR/MvxnBDthusRRl0dQqCUZBBhhTuLxAm3rmLtxHy8V8YChphs4ltf48ki1dC3tz1
         FLqNfByqW0zCdBAO8+ydAq4R6+HstghbHmlrSTddZLjHXqNdW0N3E5pmXoA6/AVvcuuY
         dz1sRDVoZSRTb4hQES2UiKZ6xA2ZcpVsHvC6engrJf7W12LfPjTflQlRQOdwhQ9lFevB
         BMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073583; x=1773678383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KUjQbuHQJ21p2RQALWJdLghrvcyrBZVXJ9cfGciG9M=;
        b=IGe/Le0l0Lk5RqG3t20JlTEzwWJVMmCpOJXp9rdSDYcIFLqWpr1Bnk5foAlSZ4uHOf
         WMeq01o6K0Vb0GcMLzYw7kQFvsuS2N59Gf1OZPHa1XW+mSUBLSxqbdJmcjkEAxYS1+l+
         IqcZNgC7hE4NwRWLmuioBmvrpQUl55tQ0HIY4qJx4p/bAoqSvftkBXb0/pL2hPfxkKHU
         7qlL59h9z7Ses8OWGDjERZt21VQQyFUhG3j6FBAJwZqP85TT6L1HUTcdP6v0Qvomli23
         PJ5W6vWtAXNPLV0lSvFGSUVZA5NdmI+4oPzx3wPFH5S6n3HKQwoOCDuvKzwlHzJjBwgw
         s41A==
X-Forwarded-Encrypted: i=1; AJvYcCWbw5NFJl1cD/MhhNxZeMJ6YTMq/diCiu+d0jiaaCGTDErL7vXqtLuwUJSoj7F2ZiI7SMPamZaCQWKAgZjw/mWR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2xsCELZNInHIsM3c03fCdSRSjO9CKlcrynVsou+8vzrrMS77d
	w2ZzLdcrW7gHI+Ky9JD7W4vuresW5dHB+jqKFwHbmjJ4ZiSotOA4tV9mo02dTooviism4lbsArj
	vXQioXuuMH8RFe1qIBkQ3ag==
X-Received: from wrbfu7.prod.google.com ([2002:a05:6000:25e7:b0:439:c9ec:823])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:178f:b0:439:be3b:ddb6 with SMTP id ffacd0b85a97d-439da653249mr19834479f8f.59.1773073582885;
 Mon, 09 Mar 2026 09:26:22 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:08 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-23-vdonnefort@google.com>
Subject: [PATCH v14 22/30] KVM: arm64: Support unaligned fixmap in the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_092625_652428_196C7250 
X-CRM114-Status: UNSURE (   9.54  )
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

Return the fixmap VA with the page offset, instead of the page base
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment. While at it, do the same for hyp_fixblock_map().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 218976287d3f..c98cec0c150f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -244,7 +244,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 
 void *hyp_fixmap_map(phys_addr_t phys)
 {
-	return fixmap_map_slot(this_cpu_ptr(&fixmap_slots), phys);
+	return fixmap_map_slot(this_cpu_ptr(&fixmap_slots), phys) + offset_in_page(phys);
 }
 
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
@@ -366,7 +366,7 @@ void *hyp_fixblock_map(phys_addr_t phys, size_t *size)
 #ifdef HAS_FIXBLOCK
 	*size = PMD_SIZE;
 	hyp_spin_lock(&hyp_fixblock_lock);
-	return fixmap_map_slot(&hyp_fixblock_slot, phys);
+	return fixmap_map_slot(&hyp_fixblock_slot, phys) + offset_in_page(phys);
 #else
 	*size = PAGE_SIZE;
 	return hyp_fixmap_map(phys);
-- 
2.53.0.473.g4a7958ca14-goog


