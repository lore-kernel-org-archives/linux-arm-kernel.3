Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7ABC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSVZnyl33hU0dXkrobfXyrVOZKlqCn75gAfkTpJqmhs=; b=urH9uTKMS916lm8Af/SyhcO/rl
	4yn/kWl7XHZ1Lu8Nb7iEqJOA+N8TwZCvuaUYw58j+Ed5V+UjdEKJYtDtW0HducwbqSauw4Vt0S8AU
	rfeVgpZ2facnks2MJqAVMP0Az9Hqy3nfOnJsTgUj7BTYKRS2NqeRwGZ8MxjysnCRIbzn69RS2r1li
	B1E/b8EiejTSD0d7Nuc8iIR8xh33thN7w33TEdBDhxTwTApuYRBYKpLu84cqGMCMs7FyiieotrMbw
	WZIgGo4s4jW7MFz/z00Q7aag2S7u1kiAm6040PJykkVfvYNSpExbPpcmBL5pUqsqwnks5kPHVUqgs
	DiFn3StA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZO-0000000BDBf-1Rlg;
	Tue, 01 Sep 2026 08:10:14 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZL-0000000BD2e-1Zjt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:13 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a5d7e3ac13so3762128a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250209; x=1788855009; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSVZnyl33hU0dXkrobfXyrVOZKlqCn75gAfkTpJqmhs=;
        b=FPTb+jp3wtwUwRZgWTTKjxuLvYSYok2V7Ogam2GqhMcOjACWntjvpAWUWm3AZotR0V
         lOml3Zn104wIUaNG1xXD1//PjfQLEZWvS9qV+Mct4dWig1qQwcZaFxtaSjGSpOlctaAi
         w85tZ407seZS6K6GW4KBOg+X4MDtiTBVg9xGFurd08ZHl1CY2NM5NU5/22+x/VO+RzJC
         Cqklgpe5fmO/GBKzzUvzi+1nqGICOM2s8zsVYMBNuh4KpSoduT+K7vZoU9dg8Z5w1A4x
         tw6kKv8WipARwzQ2wJN7JWhGPfxTwsLL1MNxLYlHnlS6i2cSL1JmDsH7/KsZe4X46AfX
         rsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250209; x=1788855009;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSVZnyl33hU0dXkrobfXyrVOZKlqCn75gAfkTpJqmhs=;
        b=DgtnrmFFThX6suSI26fTdS7vOb+vYmn8Fq9CqGtoJv0Dg0t9BWgz5cgNxC9WLXPdWs
         dM2wODscYcsGmCvXsbcJd8wZy8PcEzHt7OxOC8CsjfKuRU7O423c3qKulHa7B9erStnq
         wnfwPpcNTr3H28Qiliy0QbDf2/pcaYvx8PyaFH/mFVSzskh+hyU4zbHxIUpO+8/6pHha
         n2jt4anOaVmnDtw/HG7nbCK/1D1nIVRBrPm6i+ye3qU/z4j2J0coLwuBMkhY53McGz4E
         yliO0ABgoJD5K6PswBd/zy0Ph5IhWHP18gbXVVRgCr9IYyerKBLnMICi/oQPl3mrbKYA
         hM4g==
X-Forwarded-Encrypted: i=1; AKwUvBwDgKCFq96t9v6yA4awqqsza+ktwxdlk1xdgHpX3XGxnkmvlRULW5vSbBfs6rvqFVKFQz0EmTQDvQ7cES0b+gHm@lists.infradead.org
X-Gm-Message-State: AFuF++njNeLL+HbJNEpyZjq8VUCYS2MbooHd5n2/dblbAutxiFahqCTv
	dOqAmGhJnzqfW+AEh+zVAJgrTbNWWLOgoCMIYWobKE7DKXX+eBfT9048pzG4Px+y0NwUkrH+jCy
	ed1rmiSSFPi3qjGvHO1PJ9A==
X-Received: from edxn4.prod.google.com ([2002:a05:6402:5c4:b0:6a6:45d:a371])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2382:b0:6a6:2434:7cd8 with SMTP id 4fb4d7f45d1cf-6a663a0cc34mr3639971a12.5.1788250208768;
 Tue, 01 Sep 2026 01:10:08 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:40 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-18-vdonnefort@google.com>
Subject: [PATCH v5 17/18] KVM: arm64: Reject hyp trace descriptors with fewer
 than 3 pages
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011011_431897_10A01CF9 
X-CRM114-Status: GOOD (  10.37  )
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

A trace descriptor with 0 nr_page_va allocates a 0-size bpages
backing region, which makes the ring buffer appear unloaded. Reject
descriptors with nr_page_va < 3 in hyp_trace_desc_is_valid() as this is
in any case the lower-limit for simple_ring_buffer.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 59349892b1e6..e34f9133e5d9 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -189,6 +189,10 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
 			return false;
 
+		/* simple_ring_buffer_init_mm() expects at least 3 pages */
+		if (rb_desc->nr_page_va < 3)
+			return false;
+
 		/* Overflow desc? */
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
 			return false;
-- 
2.55.0.897.gb25b4bd76c-goog


