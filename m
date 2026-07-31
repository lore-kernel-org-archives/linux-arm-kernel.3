Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1448C55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WScly32cO/pWys+NwDAhbqd6QITQjPoTI8up8SEAyk=; b=wCTww7+pLH12QMDceUMnpX0U87
	wq6U33dCvlUAfTlTvv9ZmLabDNsPsV8O3mlVqaZcfaiTfiZdTXe00sm6PTwmaJhDi3NcoOuOjgyTo
	JeW5Wz5qVVuJdph1DTedY+JMMJoUWV0DqP+THWk6EMNZUjyDm1tI386B1QLKTY6QgJ1kUe82n2gH9
	NSDP4pHn0doFimi67Lgd5+WlGyq0jdc32rVO/GDNA/kgo4fCpn6vHK+mJFQWbnLiqf9+twoXSBGV/
	v2tLtmUbwxkOLC0dw7yo2SqMuqeuXsTL+tsqkBgJBR+Plhm/PAR8nwW6HO2Q/jlhJOxvBn/X4ApnI
	PJZBTi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLa-0000000CjjT-1Lcz;
	Fri, 31 Jul 2026 14:36:26 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLP-0000000CjZC-3YuB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:20 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-69c033344cdso1038469a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508572; x=1786113372; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WScly32cO/pWys+NwDAhbqd6QITQjPoTI8up8SEAyk=;
        b=HQGC6fm+nhM8Lmn+fTWu+4cfmFhvPWqiYl4opR83oznn1qN1m+iRG86jYy3RY/ld/q
         Uks3DkOlEAMcNiEehinNM5FdykOJ8z7Y0AQ2ijVk5vesXY/ob7J865rptoDkOOPWqq5v
         bIL+3vMdNV5RXTqIsWFavjvywSGyePosRMr4LKPIc7ppH/6bbE9gBOnnULUibzC/ulOQ
         AdZR2/Pvo6LtCGJyEe7z9A5qqE6CYO4ON8Sr9few2dwGxB3F9+YzfEvE9Fhr/NtEilIW
         12hDOgadEy1SkVAHOL9ND792znOqSF4EsjPrl4dHzvH5VWrm/L2qGBxB23ct9C8CqNnP
         e4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508572; x=1786113372;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WScly32cO/pWys+NwDAhbqd6QITQjPoTI8up8SEAyk=;
        b=cSf2bQZ297XISTn7m7Y4DnTIbxINIT2mRHtROw3a0PAulRJYIHFbByQ2Hb3ie4dfSQ
         p6fjOVfErb8iV26GorFrq+FhP4/5Brpscoc+3MEdoV07sNWrzGkJKD6QO8hnqtbdU5Fj
         GmwSDEWdW3VMz5x7hAWP+joeUDjUtIpJXfzYZfRfssG/nxL19zybySZCoBKuNciAMDpy
         +WdPP/c2ttArQPt4hpoBar5f4ekCv/2bYblcZDW1eMhgMFOWLiC/QlLdxO77LskaLMPv
         xs7ESKYxCxcUuGah0HWdYke76+5BVy5UNMwRfKmBvSgy0PpB43Ual3QmMTi+2fpCzYBq
         dkKw==
X-Forwarded-Encrypted: i=1; AHgh+RrKemdnu8hWCqyLEZu6u91FkkkgfS+Fm2lxPaxfqWI7Ur2bIHiNwYzSVV7EDwJxGkyZx24c/XsilTVz2T+owRqL@lists.infradead.org
X-Gm-Message-State: AOJu0YxXffZ6wPA87+aRbldJdcOtH3Cq78JWKVvWFRMn6eA1oJqRKoZ4
	xMbiO3VA6bSnfFBCzqPrepVl0H55QTJTwLFSumqCH3/uBzXdI/d+Kd3upNMisqZhdheVSPlhu5z
	EIjSgN8sumxw2o9gzM8L07Q==
X-Received: from wmjx19.prod.google.com ([2002:a05:600c:21d3:b0:493:c42c:7e97])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5046:b0:6a0:9465:3e0c with SMTP id 4fb4d7f45d1cf-6a098d1bc48mr1448179a12.32.1785508572350;
 Fri, 31 Jul 2026 07:36:12 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:40 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-17-vdonnefort@google.com>
Subject: [PATCH v4 16/17] KVM: arm64: Reject hyp trace descriptors with fewer
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
X-CRM114-CacheID: sfid-20260731_073615_960226_6F17CEAE 
X-CRM114-Status: UNSURE (   9.28  )
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

A trace descriptor with 0 nr_page_va allocates a 0-size bpages
backing region, which makes the ring buffer appear unloaded. Reject
descriptors with nr_page_va < 3 in hyp_trace_desc_is_valid() as this is
in any case the lower-limit for simple_ring_buffer.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 6e716295247a..96afa3d6de2f 100644
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
2.55.0.508.g3f0d502094-goog


