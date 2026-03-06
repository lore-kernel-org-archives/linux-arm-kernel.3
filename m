Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EDEFCB602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KUjQbuHQJ21p2RQALWJdLghrvcyrBZVXJ9cfGciG9M=; b=zLyOlWV4CreZun92bWkUmHzJJM
	173U0dcf+v2U3U1365kouHi7qlUzQ0dJiTbBQGAdMrJyFprtt+0/bZItwhTXDpHUafj8ThxSOcGuq
	QW4jc1Vp1CEgvc4ad+QLM7h5gfrqxj4YK4mzbG9c+JbKG3O2bczuD9QX6/cLvFDjHeH4YBKZt1e55
	jT0qjh8r82TP4AbYKRUoMiIisbHr1Gn2UCTeU7gNI+fnK743b/wg7idoIntW49+4/Sg/mPoMCA3+f
	L+5w0SkV/1WXpMyM7QZKcxIo21I1fHFsworXqpjO/4vkOniACLwnI36waphEio0ArJVQ94RU8KZqC
	LlLV26lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIQ-00000003vzr-1TMk;
	Fri, 06 Mar 2026 14:36:54 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHp-00000003vDl-2TuN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:23 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-439c4d71603so2182996f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807775; x=1773412575; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KUjQbuHQJ21p2RQALWJdLghrvcyrBZVXJ9cfGciG9M=;
        b=OSY9QEJXKUjFvt+bdJwpJhcAXQee1P3BBVKzMrjm4LPeXfkX1kgoMdjtRvk5HRyaJj
         9mwyOWoAUwrgp/jWtgbgXjeujW50nkfo8M2dN7wkWHhiZl4wHQB4QMAKCwkxmdcF3NrP
         0OUW5LcG+VWjeV4dOmlccXjsNtTmQjdJtRgfdcm2jmu7DRxmHMVqKU7Sg8h5khtHeW2s
         S2EqGFPqoinRz7Jqt8/wPq0mzG9nAnpZwPX59iBnfCaSgAFJ6ebiZ5KZDcbX7228/ukF
         DuMPLXBsuzLP+xJaL8t7xFc2VRZkylprcHCwtK0hHoUJ7C+8gHM0oaSzQ60HIwcJ7Nhg
         vAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807775; x=1773412575;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KUjQbuHQJ21p2RQALWJdLghrvcyrBZVXJ9cfGciG9M=;
        b=E8Dfdohvj3PZRp/xp0l9Ofs0yfsRj0a+3EyHT9sveBvd5ODWMNgc0qJGblbei9HB0V
         gJ8E12TaGKgC1HHsS/VPHki6MTcLWL6XgYi+HPuRCJFc+zWhKxrEApzEN/8f7pnVdw0M
         9EWIGdxJ02Tev2HnQ+I4s8ZEo7y/RYtGiGBulAVutCA9SkVOrrFstZXCQABiqQSSl9bQ
         bEc/bg6cYunCGKPqtfkBhdS0EIpcDXRrHZoulW/KHBc5Jf+MquhSG6JI8tKoH/5eMKaN
         5Vb/S6IN3+M15O6uO4t3SM9P/0vLOYFi0AKLQB+OrRcvEP69SQpWuKcwZgDOD+TU41I0
         mPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZAUOcnekii6xybvf5Ls1d3C0lcy99oNSxlRWx3O2X6PATmbVpO4WJdflHzHXi0Nk3yyEKa8g5BYOLOGPkUxwi@lists.infradead.org
X-Gm-Message-State: AOJu0YzA9P//f99LV+ap/NF7JIgnu3ZnkM48gxcbyrDjHsKrMNBpwn/7
	f/VF7C3p2vRTv7KEfDyKFvdqhv9GqIsXDBldxfg9Y5qjI4cfyQlmhnHvibQhmsI4yOGg32o39PQ
	W2eeEfrJbPJp95Fi7ESoRIg==
X-Received: from wmcn3-n1.prod.google.com ([2002:a05:600c:c0c3:10b0:479:2d82:5535])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4446:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-48526715248mr36686515e9.1.1772807774527;
 Fri, 06 Mar 2026 06:36:14 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:26 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-23-vdonnefort@google.com>
Subject: [PATCH v13 22/32] KVM: arm64: Support unaligned fixmap in the pKVM hyp
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
X-CRM114-CacheID: sfid-20260306_063617_745397_526C31AA 
X-CRM114-Status: UNSURE (   8.91  )
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


