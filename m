Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0596BCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NkzMeWQq9/t/u2bdlw+uhtoNBaTO8eH6v90H2x9qVU=; b=VeSsONb+cUbPx21FlUImzX50Zj
	wdUnpxRkude8NdRWIzKiB+x2hv64hBqZYeqoqjximWWadE4H4h+JRukapchKSA9vuzEjtpHzFnGxl
	1TgrqVwNw+7pp0zOkh9OkjYMfHsct2IPc0vhPZSCzGJNye5fjuh37klDgkLYu7x5XaLjivzkx10TP
	XdzahSS4AXAbG8mMJ6o+TltO0SXA6NeQMbX5cqApSCvvmISYvrXEzrHMK7+WXuAAwSXsYjVERA6nO
	Z2xoSJmyXbMS2+vUhkdow13lPGwzELSGD4JF/wnTKW6RWjGqDqZ3qhREqm3ZdHZRJqFrFhfXHuuE5
	O0BV7WjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlmp-00000007JUc-2XWy;
	Mon, 19 Oct 2026 11:44:15 +0000
Received: from out-14.mta0.migadu.com ([2001:41d0:1004:224b::e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlmZ-00000007JPy-46Wj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:44:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QkdzoORvtgg7KQohGDt3TNHW0PH2R3Zz6T0ndc+56Wc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792410237; v=1; x=1793015037;
 b=LKmpTjE6NlXhvyA0a2/Rfs0iI2As3QBkMkf9I12fIV9QfValtcDar0Xq4y6w7Sg0Ao9TA8sv
 6qtEYQ8anC2SlLILaDhX1b5CrUrDk7gYRmqxu3M9W2nonynBOSU0nFz0r9QuURiZfG4wR1lZuSv
 ycsa4wAELOeJOwPiT1pY7h+s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e578383164884499;
	Mon, 19 Oct 2026 11:43:57 +0000
X-Mizu-Trace-ID: e578383164884499
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM
Date: Mon, 19 Oct 2026 12:43:56 +0100
Message-ID: <20261019114356.3528479-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <as-lgxiD5wFBWEOc@e143914.arm.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev> <20261014125510.2928306-3-fuad.tabba@linux.dev> <as-lgxiD5wFBWEOc@e143914.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_044400_164294_AE2BBBC7 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Joey,

On Wed, 14 Oct 2026 16:53:39 +0100, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
[...]
> > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> >          unsigned short refcount;
> >          hyp_spinlock_t lock;
> >  
> > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > +        int *last_vcpu_ran;
> 
> Trying to think of a better way to reword this, it's an array indexed by
> pCPU, not per cpu in the normal linux way. Unlike `mmu->last_vcpu_ran`
> which really is per_cpu. Maybe I'm just being nitpicky, and it's fine as
> is!

Agreed, "Per physical CPU" reads as a per_cpu variable, which it
wasn't. After Marc's comment on patch 1 [1], it's a real per-CPU
variable in v2, indexed by the VM's table entry.

Thanks,
/fuad

[1] https://lore.kernel.org/all/86y0buyo5s.wl-maz@kernel.org/

