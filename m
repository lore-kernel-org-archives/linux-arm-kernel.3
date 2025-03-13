Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669C0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/j+Oz7cHBDK6gF/9kTqWJDu+O9+gPpwr8SGXRwE61TQ=; b=rFecm71z00B/EqyMbDHwflelKc
	JKPXoRRCRNhBlcE/PTDOdfQwI4X/ujuyAtTxjkf9wd/09uqOR8rWsS81vYPXwzDySRCsR9OxO61fM
	HaJKRDFlqJyYlaxWsApyrzHKzKKtjyBsVjCNHcTSRxJzZ82qaydg18psJP4uwqJE1lUbelPl8D5xI
	slcA2wjbWTEGe4stjJ2Stl+AC6yw+2sDv69gQyrcfWqDbkGspfynl3C5wr4v4MGQB/NZJdDW3Jw9E
	tLFT05t7Sk8TJB5dsdMSVg12roA2vE3EFQ/NBo24k+X/WaJ+N463ja0+Q1YQ53nFOJoPBXfmnNMVS
	qKtMb8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgxQ-0000000B4s5-0AVD;
	Thu, 13 Mar 2025 11:42:36 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvj-0000000B4Or-0ipv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:40:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so6188255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741866047; x=1742470847; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/j+Oz7cHBDK6gF/9kTqWJDu+O9+gPpwr8SGXRwE61TQ=;
        b=2DtRPhXvnnI9JtEj6LmPh/577/V8dPwD1NnPaC4xckNjG1cR/MPag0JEdCtbbpKE+4
         wT20Azoi/Mrnb2TOiNyD+6avtTz7FKDBXXwKVxbui3i+EQbfvdkjPdxmpo0DpJ/GmHxE
         F1WYZPMdTSRiHl9Jhb47zs0Gtkv72hcJwnBtNnD0AqU7gMUre975buhDQqwaaN+MAOOj
         iB4TSz/ONuPdSK1dIdhg12iqjCbu31XghMFUOArP6N1pD4DMFw656c+pnCgnFDtmGAOC
         IWH7OkxN67LhzLXiyXNQYyuQV3Cu5/O7JyK2uKAWN2Ee/XnuLsBNrzqgnUVL0SWDgsEA
         n4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866047; x=1742470847;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/j+Oz7cHBDK6gF/9kTqWJDu+O9+gPpwr8SGXRwE61TQ=;
        b=r83aLP4f1EP68sc77qoJLlMRFOhiRWOnRr2mmMdpi+mCgKYeLqNQTaGv0Jrfl3sE+C
         oSl+07sw0FVev1R3T9aoPE3hoeMxODtiettwbICT+ssUKwDYREEoM1U6T/zBEo3cOy+5
         f6fmna9E2EWjVXpW6hxyaH1BFrfo2WWB1thuhoFmoX50EkI4iXyibHyWQkPzaFQSRpip
         R+yg3JSR/HjjhjUf0BtSml73Zq4tDCGcTcgE8e3aUbKF4uvuEpxLWho11pR/g8kt7R8Z
         ml+9jtNkMXoqLlp6QnSAVTqP9HMkCAPvrjCKUaVT/xyq0PlrU/cjNJPG3Qqf5/3LJtYN
         yqVA==
X-Forwarded-Encrypted: i=1; AJvYcCVZPiqAXeNjVnZvaZ+fPHSnwB+hgL/+vlLS5A/p2RWajZm1i5pOBsgezjkn+KLggQ4fSb2iW1/CFwpkcmC1ihzp@lists.infradead.org
X-Gm-Message-State: AOJu0YxSQP0yvdzAy1EkubPxt9SeHi4bL5ZWtJGBSG/hhKFRAY+l9hH2
	OphfsLg1/2YDpMyNKTpjUrlv//su0el5KbL4f0l+Ei7tUeEpuU6SFmYyPlfQcL7M0Zqyw+Ils+r
	aICb2EEim5zWmKqvGsQ==
X-Google-Smtp-Source: AGHT+IHT/XL50MODZw7JAAt6rGzgQd+Y4OENiN5kXRm9oqFCYFwRAIdO78t5s5DxhHV14BZpOtcnvF2TqxK+OAfE
X-Received: from wmbbi10.prod.google.com ([2002:a05:600c:3d8a:b0:43d:abd:278f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5618:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43cdfb7db88mr180301615e9.29.1741866047681;
 Thu, 13 Mar 2025 04:40:47 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:40:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250313114038.1502357-1-vdonnefort@google.com>
Subject: [PATCH v4 0/3] Count pKVM stage-2 usage in secondary pagetable stat
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044051_211132_2EC42FA0 
X-CRM114-Status: UNSURE (   8.52  )
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

This series allows to count stage-2 related memory when using pKVM. The
value can be found in the /proc/meminfo field SecPageTables.

Changes since v3: https://lore.kernel.org/all/20250307113411.469018-1-vdonnefort@google.com/
  - Remove unnecessary void * cast (Marc)
  - Rename reclaim_guest_pages() -> reclaim_pgtable_pages() (Marc)
  - Remove unnecessary PAGE_ALIGN(pgd_sz)

Changes since v2: https://lore.kernel.org/all/20250304134347.369854-1-vdonnefort@google.com/
  - Pass a pointer to kvm_hyp_memcache instead of just the flags
    (Oliver)

Changes since v1: https://lore.kernel.org/all/20250228121355.1377891-1-vdonnefort@google.com/
  - Flags to kvm_hyp_memcache
  - Separate stage-2 memcache
  - Account for PGD

Vincent Donnefort (3):
  KVM: arm64: Add flags to kvm_hyp_memcache
  KVM: arm64: Distinct pKVM teardown memcache for stage-2
  KVM: arm64: Count pKVM stage-2 usage in secondary pagetable stats

 arch/arm64/include/asm/kvm_host.h             |  4 ++++
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  8 +++----
 arch/arm64/kvm/mmu.c                          | 22 ++++++++++++++-----
 arch/arm64/kvm/pkvm.c                         |  5 +++++
 6 files changed, 32 insertions(+), 11 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


