Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D5D7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1Vepb6gWbmfw10H3EWIgkkfZunr0icHCkKhsRxDAh8=; b=rrSYkulG5vi3xNYutF7hb3C1M0
	VSBxZ/bwX024+ReC0IRayYmtjtBWD9/SiAfgKlXSKqoZEMAaZ3ywIGv+C/nCBqWbQCskEimPF5+m+
	cleBdgi23VMVqItXuimV1nu1Ms+PNh8ilfPibOHW7pMM42U0CEsj2OEppOBqCpONPVqyt9rZVnZDm
	wqnPZkq78QvgPCxhqAzRHo5UswDx84MX87cojbO8Pah1ZBV3NROnfo9o2BUzgZDsOAcCzwCO5ExsW
	rrCu2GPd+3MUzSe2HUnL7arP3qMdaig7SbPmjDxnsomhKehwFN3fAGWyq+bijFBq0nCaeKDteRm7p
	1KNN6a+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB3n-00000002cjt-3Ubj;
	Sat, 31 Jan 2026 13:30:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2m-00000002c2U-0mDj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:45 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4806865a01bso20485925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866182; x=1770470982; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1Vepb6gWbmfw10H3EWIgkkfZunr0icHCkKhsRxDAh8=;
        b=hMfMAQyqOmoGe/A67Y2qgH/PxZqkYXOghUIqsbiWORdxDfBBycKAWyVvtvhqVIOErF
         iKEB8P2CVm5UXamyGbLkwdxd4qTfPJ53MW0hGsBauEfPneaPVDj3o7NWvgwW5hViKHKn
         NmPEruaf7GyQpWlKx1dlqqArz2Yj4C/yIdOYfmDxGWDON/HwIuWVxGXousjBH70SNYAo
         W8O43az1/5zKSTBSxURJIlOg2avGNyuSbFcKP498FKDt6BzBMT9up+ENKPs5aEbd8ybv
         ODTdyC4Rn3uA/kUV/kfjkoLqNc/3vJ1yD/fIrRURn2GIo2K7/vfM6FXbuzyIwAunq1RK
         TEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866182; x=1770470982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1Vepb6gWbmfw10H3EWIgkkfZunr0icHCkKhsRxDAh8=;
        b=ttOenbZMEKjT+zxH9uSH+Fbw/0i/9Zx9SKKAWUoQo76fI77ay2GnXVzTTaAKJxMncp
         y0GkmdmPEZN08g0T4DyHswRv0ro1LihyM3VCbuFfSXOCl3CWe1iLQyrzCIg+/1ahLmro
         fGFT9Pu6SXmIf+OX3HQ2ciROt78a2NT54qwU5MPvdEGPraGVnQ/6X34TNK21Pf76rSg6
         caHkZTfrRCUq/eYRMvuemLV4WUSl3AiK/QXjXPfREEr6q4xQOyMltzyGCfmJc3iRukax
         bbjsIxX44FM92VWRSs2jFTXz+E15eLPnngvLRWxG9hH6UFCvbLxGj3bd5Lq1xd9rc8Ir
         /jkA==
X-Forwarded-Encrypted: i=1; AJvYcCWyQeSJVTwER5KmbzZK8+Iq/iHEp2d3ww70uvWg9rtfYW00lnn+IGIN2VD1UzrmHEmo3AfwbYTsriZawXUbTAEj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz77CfixFsfvhq6PQLMO2PhH8hUl8RqSGZmmGCPllURv8JomUW
	JacWuwwNxK9WwgtBq2Mad1GMRjzSzifVWthUp+R72P66taPY9Oe/ClF/J1iH82sKSEa1SzpFI3E
	7v+P/uTPzTMDbq2C3m2ECgQ==
X-Received: from wmcn4.prod.google.com ([2002:a05:600c:c0c4:b0:480:6afd:1fd0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d03:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-482db4567d6mr85643685e9.1.1769866182054;
 Sat, 31 Jan 2026 05:29:42 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:40 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-23-vdonnefort@google.com>
Subject: [PATCH v11 22/30] KVM: arm64: Support unaligned fixmap in the pKVM hyp
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
X-CRM114-CacheID: sfid-20260131_052944_225604_B1A85D13 
X-CRM114-Status: UNSURE (   8.83  )
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
index ae8391baebc3..a6eafd72f87c 100644
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
2.53.0.rc1.225.gd81095ad13-goog


