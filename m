Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0437FCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMlv5sWG4rQ4mDu/88J9tsbgaPKRoMu6C9AqGqZiHXo=; b=gRmXTdDONyMumW/8QimywSNrth
	XCUVGzdepnyZQpTH4e6Xed/GJqjDIQABpdJwJMbuEAVa5+bYNUrrtBAYfh/aavpG3tgXRXSY1FWtw
	uoTton/7UrzRl7htQPUGwvEFtI0IiasRak5t3FsVPK7Z6f2DPmaiMtYXZMOaXvWFK2zKC/8UMm1Oq
	OENZe6KjBzOMAwhU9J7ywlAV/E9uBaDWNggXtcXpQeBp9Wje8LCwcb/Xo9aFgTY61dnHWctHWJF4K
	MdcU2hBVtAtgMErlxJIIfv9V4iZ+g0A80DoAmP4av1woxgLs1Me0lhCNS49AR29xIeKAIM2imUatT
	qC8wg4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wba65-00000004fu9-2x5n;
	Mon, 22 Jun 2026 08:33:37 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wba62-00000004fsn-31h3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:33:36 +0000
X-Forwarded-Encrypted: i=1; AFNElJ9Hg3ilj7WRIL0dJ1FH2JRYUsRKoOadWVA0YIhtTADBYQj+ZwvR8KMS+07ZwTh6VINBq1v9e1EY4LwVlUT/yNqB@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782117210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LMlv5sWG4rQ4mDu/88J9tsbgaPKRoMu6C9AqGqZiHXo=;
	b=E/kSRl/w9MIZAvnJpp0HrlTDa7dtVtHHgrOW6zr7LqXBwA7tysYYpPHlLPK9Z4r6Qbtufz
	VtX0lCQ/v6iw1Lj4r4DOM8N1L36fvpK1TCIafj8yDmrUx3hMIT40DiKo50GEI0tVwpPbAB
	UHfKb2tlEqiaZejmr71DHyZbxdW7Uhg=
X-Gm-Message-State: AOJu0YwxT5D9aeImMBr3Qd7U4o5BbtoYWBpwvRBf6Vjg7uoP3/0bJE62
	M26MhpTWpVuvwr9Ju5/jNhYpYtx/w7ppCpLWEg7mUiTLi2KrPvZsff3WbX8c0TndLqh8DD+lWJY
	I4yHv99cfFhu47TlMlT5fPtlwZ883lWz3LV5G4FqH
X-Received: by 2002:ac8:5812:0:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-519e8937418mr20106801cf.15.1782117202105; Mon, 22 Jun 2026
 01:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260621213155.6019-1-include@grrlz.net>
In-Reply-To: <20260621213155.6019-1-include@grrlz.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 22 Jun 2026 09:32:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTztL4O6NH-sNpPywchgER6SswetOCgmaaSGjtKaRtL8XA@mail.gmail.com>
X-Gm-Features: AVVi8CeGmftOBXIGaXfHmUYTToXb3vtN5VWYlAu0NuHDiDaZP2CXGjkjPm4EAHs
Message-ID: <CA+EHjTztL4O6NH-sNpPywchgER6SswetOCgmaaSGjtKaRtL8XA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
To: Bradley Morgan <include@grrlz.net>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_013334_913421_F9F32E16 
X-CRM114-Status: GOOD (  17.29  )
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

On Sun, 21 Jun 2026 at 22:32, Bradley Morgan <include@grrlz.net> wrote:
>
> Protected guest faults charge long term pins to the VM's mm. Teardown
> can run later from file release, where current->mm may be unrelated.
>
> Drop the charge from kvm->mm instead.
>
> Fixes: 4e6e03f9eadd ("KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()")
> Signed-off-by: Bradley Morgan <include@grrlz.net>

Reproduced by creating a protected VM, running the vCPU to fault in a
page, then forking and having the child close the last fd reference.
Without the fix, the parent's VmLck leaks (the reclaim decrements the
child's mm, which is freed on exit). With the fix the parent's VmLck
returns to zero.

One minor observation: account_locked_vm() also passes `current` as
the task pointer to __account_locked_vm(), but on the decrement path
that is only used in the pr_debug log line, so it is technically wrong
but functionally harmless.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pkvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 053e4f733e4b..428723b1b0f5 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -352,7 +352,7 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
>                 page = pfn_to_page(mapping->pfn);
>                 WARN_ON_ONCE(mapping->nr_pages != 1);
>                 unpin_user_pages_dirty_lock(&page, 1, true);
> -               account_locked_vm(current->mm, 1, false);
> +               account_locked_vm(kvm->mm, 1, false);
>                 pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
>                 kfree(mapping);
>         }
> --
> 2.53.0
>

