Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D566C88E59
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5DlL13uHjVP1z/ikzLAHoUvg+H32tBZp8pjB8Voqxw=; b=i4AGZpCcv2HSpcyoLYsvV4zSQi
	OVjImYn+t1rldXoxYRtiEVo5bfxVoPtbc9Ft5+7ExoRqElqpbBu9SvI4xW4vbq6Nl8SL0moR/Ok5P
	uOFzxnOdYRRBdBDXv1IAaWu7UsPTJMTjTXTgqtYHY2AUpbw3cGIJ+9esF6yxiIs0VqpMYTvO0SKay
	QgiF7ukiGjlIK7ZyrdFDTS/uskfaUqkjEVyLYAC5rxxqy71NMi32Z0ZnwOC1GXZTvE5UX7kZ0ggvJ
	qfddLsnDqvUsUul1KLtVsEbxSzYK7HYG54kwx5qBL1F63Eh+yqzb78OcIOKzAwOVo7r11WSiEkujW
	qLmyxR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fR-0000000GoQy-40Sx;
	Fri, 11 Sep 2026 13:51:49 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51f6-0000000Go4T-1QaH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:32 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c293a65b577so92152266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134685; x=1789739485; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5DlL13uHjVP1z/ikzLAHoUvg+H32tBZp8pjB8Voqxw=;
        b=a4JsYT5aW/oko3ZRhldioy5czv2MPNfQbNC2YACPZJomeVpdWy8x+oLHBYgdMvWK++
         XM6i/3WjiuPKEFKcRtvrN7HIeF4H3lraszYT6Qed8/U7EyGPJxiP2/b/20k9WK6M4Egx
         eWusIU6YNPEdJNBkTujXy8oFW0x6JbjF1vs5ObCjBmw+Nif4HYOGjzwGihr+akEbaypN
         viMlHiaiU1RZu8NKVOcGAlJy6TqScWfc1oZPqrolCBz5u89bakwdJsDbxji2iM/L2eRt
         taoYlSgcFTKlD/ky0ZoSiVt3BBMeaWzfKnpf1dfDFkf+h9tEvIaHyMr4FZ9TYqNXPc0G
         MRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134685; x=1789739485;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5DlL13uHjVP1z/ikzLAHoUvg+H32tBZp8pjB8Voqxw=;
        b=rcaQgPFCqO3wwftyjNdobhDTsnv+ldEeYogk8TUiHZxCbWteBT3Lt8cD7Sspdafa6+
         ZIPm7DoxkjTXY33joPbHnoZAlGm3GOUF7boU70oZsva6prz1kKIny34yrf2gbFJ4oKYR
         JV17186LNSwqgT0WLf9IH94yghrU/I6khAAD23529uXHZdzIdHWJam2fdvh/9S5cTZCi
         dCVE5sTqEPRhZXbSB3opGT1TnGaR5lc9nxkD7qiiWC6PZnhmGby0I1+1s5rX59XFPgoP
         CbFPPcxAuzDQly13cXMZqXzBWUIWC7jFIrp5sH+4FhUj8iZ7gEKIrghiexGUjg3j2BM8
         7bNA==
X-Forwarded-Encrypted: i=1; AKwUvBwv14KC+The3ZTrcHK77Ao534LexDLwkc7lgrxgf04El1iI5L4rPFCIpOImaassX2WswT6qXFFtno5cuD/7Icke@lists.infradead.org
X-Gm-Message-State: AFuF++luMVymtR8HrTB+TAERrDxq4Bl7dmAzc2hMw9u8p36dOfiO5KIW
	5oBVe4Q+UBYA8Ao8Raz6Klk7i6MiwyzJfpob1HrwnZoukPnMlO3qDMKMuz9ostgEGrLuVSz72Dc
	xTZ1ESUYQyc4GbAuTt5Vv1g==
X-Received: from ejcey24.prod.google.com ([2002:a17:907:b98:b0:c1c:477d:16e8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c1a:b0:c15:e8c8:340 with SMTP id a640c23a62f3a-c296674a92cmr384345366b.23.1789134684966;
 Fri, 11 Sep 2026 06:51:24 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:50 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-20-vdonnefort@google.com>
Subject: [PATCH v2 19/22] KVM: arm64: Extend pKVM page ownership selftests to
 cover guest block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065128_400396_304E5E40 
X-CRM114-Status: GOOD (  10.64  )
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

Extend the pKVM page ownership selftests to test the split of a guest
stage-2 block and the per-page reclaim of that same block.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f4943c2a237f..e318b5a3f600 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -2105,6 +2105,47 @@ int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
 
+	if (size == PMD_SIZE) {
+		/* [gfn, gfn + nr_pages) was poisoned. Skip it */
+		gfn += nr_pages;
+
+		selftest_state.host = PKVM_NOPAGE;
+		selftest_state.guest[1] = PKVM_PAGE_OWNED;
+		assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+		assert_transition_res(-E2BIG,	__pkvm_host_reclaim_guest, gfn, 1, vm);
+		assert_transition_res(-E2BIG,	__pkvm_guest_share_host, vcpu, gfn, 1);
+		assert_transition_res(0,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+
+		assert_transition_res(-E2BIG,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+		assert_transition_res(-E2BIG,	__pkvm_host_reclaim_guest, gfn, nr_pages, vm);
+		assert_transition_res(-E2BIG,	__pkvm_guest_share_host, vcpu, gfn, nr_pages);
+
+		for (int i = 0; i < nr_pages; i++) {
+			WARN_ON(__pkvm_guest_share_host(vcpu, gfn + i, 1));
+			WARN_ON(__pkvm_guest_unshare_host(vcpu, gfn + i, 1));
+		}
+		assert_page_state();
+
+		for (int i = 0; i < nr_pages; i++)
+			WARN_ON(__pkvm_host_reclaim_guest(gfn + i, 1, vm));
+
+		selftest_state.host = PKVM_PAGE_OWNED;
+		selftest_state.guest[1] = PKVM_NOPAGE;
+		assert_page_state();
+
+		selftest_state.host = PKVM_NOPAGE;
+		selftest_state.guest[1] = PKVM_PAGE_OWNED;
+		assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+		assert_transition_res(0,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+
+		for (int i = 0; i < nr_pages; i++)
+			WARN_ON(__pkvm_host_force_reclaim_page_guest(phys + i * PAGE_SIZE));
+
+		selftest_state.host = PKVM_PAGE_OWNED;
+		selftest_state.guest[1] = PKVM_POISON;
+		assert_page_state();
+	}
+
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, nr_pages);
-- 
2.55.0.1007.g17ff1f9808-goog


