Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18926C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17LtOJiNkRUNH3pbiWUfejh+3E3qtVqEY13uGgjonhw=; b=lcprN5IDhbwVL7iW5hU/8YJeuH
	m6h8ZEW4iv5ACkCc1VaWGR6jLGG9gPHqZbMf6AP3evepDux6Il58SUSVU8Yf0PXmknceDWn5wTh07
	uI+oO6pG4RkVoOpl3MwIhpAVPbYBklBYlfR8zz2h/fscb53bo1CLiZvdToRmaGb0ClvY774+zEcwC
	CliYmCHhokZDld6Im6VBaMf4E/V+5QCBzYlqUhExrdunL0Fj9w0rCxozNWUBV/tjaFymo0bsSJLJw
	ovPCqLxXRzotwxgRQQdtH5xakx6MAIcaldiHE7FjoNlqOf/dONPDnLdAbc8IlhCZcqkuqhNVrIJ1y
	Xm1EueJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRc-0000000DRZn-0Dup;
	Thu, 19 Jun 2025 15:44:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDFd-0000000Cq4X-0mWL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A39224360F;
	Thu, 19 Jun 2025 11:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4900C4CEF2;
	Thu, 19 Jun 2025 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750331772;
	bh=jea73dDCsJTbDnvK9qLSZgHnRvFrbqUdo+tNLbeXebg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpjDXNnvhgyelNAPwYMk/Zg6boRmLZoy4OsyTJJvgCN53kEJ9bOHRqd5nFt+KWe5A
	 Jzx9eI/IHaFsxchjXd5uRkht7+rd0bI3lHnzNGwivbQnlb4LKJBZg0eEGvGOWoB3+t
	 xzA5+CHkxoUeF6quvSATgOx0jdlJDhrqNDB3nLr8AAthJO+mv/t8757yq3HiOmgamE
	 eBZm0yFwN+Awj17xBCsdjw3mTq0pMD6WTc5r+McIlDma/9a8i62AwBcpfydl3NEh39
	 XdXxlzenW3/Oa+qXV+ktyUCxWwRwEkWoqRlblB8ZU6MBUUD7bHrRENd5Vd39PcEkSQ
	 EKtChBTGgVlow==
Date: Thu, 19 Jun 2025 16:39:37 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 15/62] KVM: SVM: Drop superfluous "cache" of AVIC
 Physical ID entry pointer
Message-ID: <bknceu6nswhlz2c6lx3zc4afnrmq63dsriqctexincvs5jjk6v@7wlm2lf4czlh>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-17-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-17-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_041613_245140_66EBC52B 
X-CRM114-Status: GOOD (  12.07  )
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

On Wed, Jun 11, 2025 at 03:45:18PM -0700, Sean Christopherson wrote:
> Drop the vCPU's pointer to its AVIC Physical ID entry, and simply index
> the table directly.  Caching a pointer address is completely unnecessary
> for performance, and while the field technically caches the result of the
> pointer calculation, it's all too easy to misinterpret the name and think
> that the field somehow caches the _data_ in the table.
> 
> No functional change intended.
> 
> Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
> Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 27 +++++++++++++++------------
>  arch/x86/kvm/svm/svm.h  |  1 -
>  2 files changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>

- Naveen


