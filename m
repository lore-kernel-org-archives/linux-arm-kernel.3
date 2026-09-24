Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1B0C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LkhgjIPo4LQGHd0bFnsw+pSTli362MQLpClW50HsSw=; b=Bn1VlX3IDTQhY9k028A5kwtrBk
	thI4s5Ndjz1M8l7sYBqDlkiIHY3hFxsZg+bjA8Tn3uzk+Kiv/V7aP+3N7AFAaewU9g43EKCin9dX+
	wKTtTCUVHca5+C2KYV+gH4GswWzTb7Wjm7g8tHNsvwX3kad54x1j66LqIg3tpHZ8vj3Lt5orbguwu
	Jq1hPuCtZPyTVtjUCSF/XlnQ+UTwXd0G+p6r+2ybaM+4Ya6Hpv+fAV1egifFxUpeYPqdaKAYZIjFo
	cdQQOlk7jpC0490pE+JXeneVQ1/rHug0FUMr5mQutGpWqELvqArvNDGLes8NWv6uub+Iub8ktu9qo
	XdwHwfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rNU-0000000CFez-0Wwp;
	Thu, 24 Sep 2026 21:53:16 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rNQ-0000000CFeY-3XPB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 21:53:14 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc73ab90ae7so158487a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286791; x=1790891591; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LkhgjIPo4LQGHd0bFnsw+pSTli362MQLpClW50HsSw=;
        b=KqWIDN8zuFEO0I/e2eKDxeGAA/99oumNtoXDyBcdhzGKWuhQ6t0benoM8cl6aHW8pp
         vXlRUgbVkZUtBcsJ+4jqmsZq5L7CaYNV+CS9i5ko5oLwkvjLIVU2Q5JV0YkRAvfxAFmi
         p77bTc0fTCAVm1uOfuW1oY2Onl56ur8lAMLI/cszQITVkBLmWrbjYkmRHH9k8V9zQ/OF
         kc1FoKPIaec61jLLaEEG0ymjUD5Hp+jCAkCQpmIQdoJM7p14VrEPWBg69zpNLEAqpG3W
         t0B5pbwQp0tnD9OUund+Z4yFoSEJzEmOTRflK8PwOPFEVqaljAEXcv/Spgj12KIpCJHh
         XMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286791; x=1790891591;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LkhgjIPo4LQGHd0bFnsw+pSTli362MQLpClW50HsSw=;
        b=X/KVN8Zpgzg0op9NX1WedBqdfNIR6aDRe/FevA/wLxYinnTL2mU8nlLiHyFOjJ5+BB
         IfL8R8Tta/wRNgZ7itrocoTyc90DQiAbZeG8xT+jYCKWjINDSVHQlbafpfgfDIO8gCaw
         znPcAL5Bhj7CX+fxkO5RNoKInZDZ7KXquT6Lwd8zSoxioVvo5q0UUDn9fWeqyljym+VS
         4XDZM5MjYvVEqOYkRnrRasPcUUXgjH2ajoxRxlORX37mzJHJq+I6S/aC/LHJXc3yAN4V
         dee++nwPMi3xGCg2nJ9Xj5ocRY/F4gZdfc3fSCkYUxP3J0fPIMyDGm9VjA7b0pnksbvX
         JSSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwaUEahQdVpTjrxZnOT3gakSHaiQvfk4eahwF7BF0f7dmzWyHwiV/JsQ+jnhew7Bzi0YCYW+iTi5LaZ/N+oUiF@lists.infradead.org
X-Gm-Message-State: AFuF++mpzh38Mt8FZaXQzVnwG1w3ax6/2V7irxvhUNtm+eRL+G0nBr/u
	8QHYVMDmrINilJUbmFp0IqoUcyTvD+JmAE3jzK7B2sS1e5mPld8WniToLNEcCzvSx/iZ8WBe4U4
	bThIhrQ==
X-Received: from pjrv22.prod.google.com ([2002:a17:90a:bb96:b0:3a0:9658:1de6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2703:b0:3a0:2ffd:1a4b
 with SMTP id 98e67ed59e1d1-3a098ce5269mr3354853a91.25.1790286791218; Thu, 24
 Sep 2026 14:53:11 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:51:51 -0700
In-Reply-To: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
Mime-Version: 1.0
References: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028368772.2007408.8775233545709825615.b4-ty@b4>
Subject: Re: [PATCH v4 0/5] Stop returning struct page from guest_memfd PFN lookup
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_145312_918708_B8C850A8 
X-CRM114-Status: GOOD (  11.69  )
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

On Wed, 26 Aug 2026 09:01:45 +0000, Ackerley Tng wrote:
> v4 splits out a new patch (3) that makes use of KVM MMU invalidation logic
> introduced into the RMP fault handling in patch 2 to avoid warning on a
> benign case.
> 
> Other changes in v4:
> 
> + Took Sean's version of the changelog for patch 2
> + Picked up Fuad's Reviewed-by: and Tested-by:
> 
> [...]

Applied to kvm-x86 coco, thanks!

[1/5] KVM: SEV: Treat unassigned RMP entry as benign race on PSMASH failure
      https://github.com/kvm-x86/linux/commit/211606532680
[2/5] KVM: SEV: Drop page refcount early during RMP fault handling
      https://github.com/kvm-x86/linux/commit/375b32931b5d
[3/5] KVM: SEV: Check for invalidation before warning on unassigned RMP entry
      https://github.com/kvm-x86/linux/commit/acafcf32c83e
[4/5] KVM: SEV: Drop page refcount early in VMSA reload
      https://github.com/kvm-x86/linux/commit/3c427e5c0347
[5/5] KVM: guest_memfd: Stop returning struct page from PFN lookup
      https://github.com/kvm-x86/linux/commit/89fbe3de01cc

--
https://github.com/kvm-x86/linux/tree/next

