Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6832C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loeGi3dRMOkXqttIetgmg8f0p0nt/Zk8xK82xYk1AUg=; b=nXvMGnZd4BeXQOx5+GEKKR8p51
	0wM0B+dh7yl1tPIf2LeFS4IqB5kGidoMs5yZfR9+/mu2r1unBAixiz+dIQw67T2Oem5fbGYg1Y59E
	XyGMEhEGVCm9Vy/6JvqEhn3U3vDYi2nNlBfAR4xLC3w+WX0dJjjhmK8qqqyf/NZfaWXRvnaG+4+jD
	OczeWaXkbnVLClcjsBnYq0hoHIWttOBbx/8Ty5uDeAfPDuJmeHiCh1hA4oVJRj3IXvTwJVkAqvv8U
	iM5SKXjKtjGb9HXAtG/1ba+YVCObS1CUmpB2ZjlC6F6VO88GHbcO3VCAgnJdCWyT2UkHNGQx0cX0d
	+625PcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdg-0000000GnLg-3UVT;
	Mon, 03 Aug 2026 10:11:20 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpde-0000000GnCd-14n6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:19 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-492488f8583so18695915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751876; x=1786356676; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=loeGi3dRMOkXqttIetgmg8f0p0nt/Zk8xK82xYk1AUg=;
        b=uUzG+U7e3lAXqgwEyUR1MVoksIZ2oJQhP8WafNA8k0ink0hM6iAet5tTHQeeMTufYh
         Bzr/b6b/2cFZHq84I9cd6F6PnVjfN2oT6GXeCHeI9LE70rtJj0A5oDugAUakHDICL7bU
         CFuxqa6V4CSwzSibUUwHoN1fb7WO7OzVqTYSH9D+GGGabgsXQRmh3E/T6CkTAirsGS/3
         Ip+6MDGzns/S8sYuWYKoVOQ6bA4jYP0GG5fKTa0goSivJDMnguMJTGdmKmx+SM3vcXBg
         RsoiNZ5Qg2xT66r97xH4GYsaA+OJmy9k6QwHXKtn0xvePiNTH/dGmSpaIuhn88j7mIXD
         EZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751876; x=1786356676;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=loeGi3dRMOkXqttIetgmg8f0p0nt/Zk8xK82xYk1AUg=;
        b=OrmemT/b7UzsIRcvJHzjgfP0vog+Gvkesx+R+ynHsZ3aOCsfyhLZys0eSpIBTFkiea
         e/fxfqRI83rKhUx+ZNouSoFEKn/CBtNCgihqKIpYgEnab3lFSAO9igUMsNo+2LKafExp
         I1XG3nVRj/x8Prvv0nUFk8nGKh/CB2of2XEWrY/gxISB5O8hx18Pr7u10BobCpZmxV2R
         BBYrHc0w78QR3R+WnP96KcyKzO2YqEMNznrXv1dc5tg8Y4YIm+Xo6G55yN03+eglANVS
         bWpAUCQ66ps0qtYG6TTvUScKG9E7q2r8vOJXtYHJN5/OGQLFRFiN8v9wFo16G3im5/mb
         +8fw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0qLrlfyuqfWAYVHI1qXA7c7kFDc1IUjQGQyBFtWXrsifiyey2EldNtjdOB8LbzzcsD6Rbw+KRNaEbLKbfWY7T@lists.infradead.org
X-Gm-Message-State: AOJu0YxZvC99olo94T2CbRFVeYZC/1XfPf8t2EH+MbJVI1WsHB4Dvv3d
	nSBfBO+4+N2Nst5qdBuz+LcMAL3S9XsmATb09L++5zLlysgdnqOa+4n8/qsXmGaGklj0Gf6L7XJ
	Sztx2BYM1OFYoGXm/W1EFUA==
X-Received: from wmoy21.prod.google.com ([2002:a05:600c:17d5:b0:494:133:ddd3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c25:b0:499:48be:3189 with SMTP id 5b1f17b1804b1-49948be327bmr4977335e9.0.1785751875217;
 Mon, 03 Aug 2026 03:11:15 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:09:01 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-18-vdonnefort@google.com>
Subject: [PATCH 17/20] KVM: arm64: Extend pKVM page ownership selftests to
 cover guest block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031118_329416_6BD99B0A 
X-CRM114-Status: UNSURE (   9.48  )
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

Extend the pKVM page ownership selftests to test the split of a guest
stage-2 block and the per-page reclaim of that same block.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 71ebd1856cb0..e22a7991f8ec 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -2070,6 +2070,38 @@ int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
 
+	if (size == PMD_SIZE) {
+		/* [gfn, gfn + nr_pages) was poisoned. Skip it */
+		gfn += nr_pages;
+
+		selftest_state.host = PKVM_NOPAGE;
+		selftest_state.guest[1] = PKVM_PAGE_OWNED;
+		assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+		assert_transition_res(0,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+
+		assert_transition_res(-E2BIG, __pkvm_host_split_guest, gfn, nr_pages, vcpu);
+		assert_transition_res(-E2BIG, __pkvm_host_reclaim_page_guest, gfn, nr_pages, vm);
+
+		for (int i = 0; i < nr_pages; i++)
+			WARN_ON(__pkvm_host_reclaim_page_guest(gfn + i, 1, vm));
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
2.55.0.508.g3f0d502094-goog


