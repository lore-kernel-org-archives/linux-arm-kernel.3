Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D84BCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUBZuTft07Gz370Ru/23Ib/O5tsFjxExNVXyt5Ku5SY=; b=qMkjqZ4SHH1x70Yx+DPgjh/QhQ
	QhLdGmPJnz6ds/99wHP2FFnnQX/9jaN66vMLP73XcAuJZfz9UQSCgrEEgDxbUXc5cVDUXnHuG33ng
	ABeSY5/1hJdVFCfRSnigmlr22j2Zcuss2p5/jBxUD3WUHZzsibWcb/OonTCSjU6jvw7IQFLw2KhXG
	RwEukSLw3HpiFtVIHZ0mpcg3COSIEz1CzPAo8r8GOI9pzB1kMue5ag/n7SmzMqMl27RNKk4Hbn/pj
	3bC6Cil3CiYr1U7LrMdzmwazL66SBzMjp+/HsjUSSsVh50QFVPN6ICdfGuaHPfkYSBfofdQMZOL3O
	/8I0hPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Xa-00000007Rpr-0JTP;
	Thu, 21 May 2026 10:22:10 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0XX-00000007Rnx-18Fe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:22:08 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43ff19e54beso3963222f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779358925; x=1779963725; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUBZuTft07Gz370Ru/23Ib/O5tsFjxExNVXyt5Ku5SY=;
        b=n0tFTc4OhCI9pQsBqUXy4jIHAq0hBZ4N3U/Rry2yP4V1aH/X7MXwCycsHjKtZumduP
         Te89njSkcNxxg02VlihLIr8SHg6P82IMKRi/dqczQ6xBCCoeF29Fq2mbKH58vUK/wlrV
         EEykVws3vBPwunTXub2Pm9XRb5RwnB5tJYkk/rDPN3db89ENDUhqELmkZpDr4+wQPq+D
         9Lf67IEI2YkBlW1tfMJ5JkMB587o1/ftFYIqUil9bcdYEU5F3ZeYCsanPB4+X9XCmOxW
         rERpH5k7FfTbN3hrMoqyAazaIhqPw9R6/PZQVPPZlS7JJRkn2bgcOqp4fAEXG52kjFTw
         b9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358925; x=1779963725;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUBZuTft07Gz370Ru/23Ib/O5tsFjxExNVXyt5Ku5SY=;
        b=mS3u0UpMu5kGEPxHJ9tf8BFIQRSbqdBjC4MHMBjDGqn69t1lKAzfxsveU41Kq7KhW7
         N6PpQM9hCCUv3oCZxwOftwxTI2BHyj6/1U18QbUmnifOUlLbqZc1N0bCdqE9q7YraMaN
         5DYRc2ippHklzu4vphwkQYZEYW/fQNgVEN3Jv3RkzAc+L6OvrhZpnK2zsvAt2oIZRAYd
         U3IVdPgxjIREGerirrLKleFRNMRkwtWYjU2uznGe8T1h1p6rUtYt1tvew+sTiJrYdLZt
         hMl3/0EMcnLGPPve9RNnAXQv/fbDPldT3sceLIbbvOWfjAW9a4Hk9G3nCRnfvhzPB790
         fZvA==
X-Gm-Message-State: AOJu0YxxkEhnc82bbiamJAqZi+pUDcc3s4vRi25W8P4wHhehB1e/fvwZ
	EPJ8DmayVCNgzOHnbJx/PcS3DnLh0nszqKKzEvLqdWkLkxCHFZ4k7QfhEq7lC8HGm5I8ljNb6e9
	y1/GWPZFT4IK/IC0oQ7L3rA==
X-Received: from wrup12.prod.google.com ([2002:a5d:638c:0:b0:43d:7c66:de1f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40e0:b0:44b:ad5a:cd33 with SMTP id ffacd0b85a97d-45ea4165a80mr3528391f8f.40.1779358924813;
 Thu, 21 May 2026 03:22:04 -0700 (PDT)
Date: Thu, 21 May 2026 11:21:46 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521102149.804874-1-vdonnefort@google.com>
Subject: [PATCH v2 0/3] Fix __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_032207_341691_8634B065 
X-CRM114-Status: UNSURE (   8.61  )
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

Sashiko reported a potential refcount leak in the unlikely case where
insert_vm_table_entry fails.

While at it, I have added a fail-safe to __pkvm_hyp_donate_host to ensure this
function doesn't allow leaking refcounted pages.

Changes since v2:
  
  * Proactively init hyp_page order field in hyp_pool_init  

v1 (https://lore.kernel.org/all/20260521081250.655226-1-vdonnefort@google.com/)

*** BLURB HERE ***

Vincent Donnefort (3):
  KVM: arm64: Reset page order in pKVM hyp_pool_init
  KVM: arm64: Fix __pkvm_init_vm error path
  KVM: arm64: Add fail-safe for refcounted pages in
    __pkvm_hyp_donate_host

 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 34 ++++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  6 +++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++-
 4 files changed, 34 insertions(+), 11 deletions(-)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0.746.g67dd491aae-goog


