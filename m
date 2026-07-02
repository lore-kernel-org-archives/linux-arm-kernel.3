Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B73C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/B2rsvapQSn12m5d81J+topBC1cosRCvCMomhxQt+E=; b=mNxbVXLPYxogVxIOTbfm1NEWqM
	AFgGJUUGN+0xHpICSlegsDY3iNwlTTQ3VAH3uUiHOgk22ztmDqWp8SzME52aOds/cDPFk+YLJhzZp
	FykryLPomcBewLw2M+LfelTqrmnulr9YwE75HKfEs9vmQKHuMEiAVs6RlrLlyw8sAxej7eXbHtgwc
	mFV4dJVk+4bSUuSD/Le+CQlR/7B0fDKhb0e8yoOFQkmx0hvLLbZbCG23KbKGYQmjSdoliZPGlyTBj
	ZTmailFJqYPWYZh8SC7+QFmnoy+AnS43sIkAoJd/mJhSHuXNuNWZn/UORe54fgKc6eHcEmx+cNDxF
	HCm1NIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEpG-00000004BkZ-0JLm;
	Thu, 02 Jul 2026 10:39:22 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEpD-00000004BhL-0CSh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:39:20 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-c12c2d67af1so25880866b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988757; x=1783593557; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/B2rsvapQSn12m5d81J+topBC1cosRCvCMomhxQt+E=;
        b=ZcyDmFm2vN84eRPDMmJ8+0oVP4MdZTvUJYKJJJ99lvic6xzwmFlNmaA0sDd6BF2X6v
         PxS22/drI9D8DGFgp8LLSTkl4TJyOfIZkdspohXJ5o08PwSRCDvlu6TesqPPZ40htTq/
         4aRA/KFizhLEwa7nFfVZvMT4UO2EpsHztxArtfBEuC4yThQgXJE4/ZVf/NoNhgTajvC8
         h8+NLG7x2Jz7hbdJ3gNHzhHZ//pzkK6Okrp9To3WTQF87CXWpb8AuIQGx//A75cbs2/A
         jOyzChFQMN60+qdW/pmu78gxGijO4hour3l2qQSuNNMOLktS3751arQJTd3MebC0goPs
         qgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988757; x=1783593557;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/B2rsvapQSn12m5d81J+topBC1cosRCvCMomhxQt+E=;
        b=JxkdIAm7VBZ4aGgOEZHermGyjQs2Ox060RbkOjyaUDYeOwNlEOa9gyl5HZpsd0pqfC
         5Y1NqsuZcbka8awbbpxSndsmEgn0Y0Egx2p49MUsZ+a43leHtI5FpB5xOYhiRn1r4Kly
         NvALBK1il8vsJQlItvU6rLhB6ZZFovaH6Hpd8x3soTtLnjWUrwKBHivijWVJCL652WlD
         5bfxjGHo8vSL1Ezog4eqS2OPs5OzyTsRkwW4yvQgH4MfysyY6PAtYYtEuCsnI6dGPMGL
         2j8p0pjp/sfRHTSMuT6xCEPLWsP3sE6imjiC0ZCo5OmeqIVOeQYufX+jzOGgMzoTN8I1
         MxWA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2n63VGHew5hKbySBH0CooiL7WkkHtmIUQWM4PVLxUvq4sbnGd/YFrwlcUJgLi0bTADQ2VYnFOu664WVi0Jrpn@lists.infradead.org
X-Gm-Message-State: AOJu0YzHHcew4TdqBRvdD2tmDe7YYGVE9ZNv6Qayf3oCAzfnmIF/mmA8
	5D1EpBBYS2gbBDNVMSxnIKwkH76P8wrNdqP6VKuTgZNsotB5lhJ/E4Fboznolvy2mB+MG/s675Q
	6ydu4q2Rt7dhV1Sriy1KPJyfMX6XSAA==
X-Received: from ejcht18.prod.google.com ([2002:a17:907:6092:b0:c07:60f4:6d56])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6c12:b0:bd5:18e8:1ac1 with SMTP id a640c23a62f3a-c12ae3ab429mr242035966b.5.1782988756892;
 Thu, 02 Jul 2026 03:39:16 -0700 (PDT)
Date: Thu,  2 Jul 2026 10:38:42 +0000
In-Reply-To: <20260702103848.1647249-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260702103848.1647249-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260702103848.1647249-6-sebastianene@google.com>
Subject: [PATCH v9 5/6] KVM: arm64: Ensure FFA ranges are page aligned
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_033919_256494_2EEC0B8D 
X-CRM114-Status: GOOD (  13.03  )
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

From: Mostafa Saleh <smostafa@google.com>

Harden the check for the constituent memory region page alignment
to prevent over-sharing when the negotiated FFA_PAGE_SIZE size is
smaller than the system PAGE_SIZE.
At the moment we only check that the size of the range is page
aligned, and truncate the address to the page boundary which can
annotate more memory than needed as being used by the FF-A.

Fixes: 436090001776 ("KVM: arm64: Handle FFA_MEM_SHARE calls from the host")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 2e7ab7e3319d..9c96e72e522e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -352,7 +352,7 @@ static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
 		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
 		u64 pfn = hyp_phys_to_pfn(range->address);
 
-		if (!PAGE_ALIGNED(sz))
+		if (!PAGE_ALIGNED(sz | range->address))
 			break;
 
 		if (__pkvm_host_share_ffa(pfn, sz / PAGE_SIZE))
@@ -372,7 +372,7 @@ static u32 __ffa_host_unshare_ranges(struct ffa_mem_region_addr_range *ranges,
 		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
 		u64 pfn = hyp_phys_to_pfn(range->address);
 
-		if (!PAGE_ALIGNED(sz))
+		if (!PAGE_ALIGNED(sz | range->address))
 			break;
 
 		if (__pkvm_host_unshare_ffa(pfn, sz / PAGE_SIZE))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


