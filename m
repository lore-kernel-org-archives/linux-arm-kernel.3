Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C22C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrxD2n0/TPw17Uc8nkUtK6jXpsmer9Xjurk1Z29eM00=; b=sg5YCLsLFBqYythj5I8vE6UpBg
	lAEZpfGlsJYIimwD20u3UAwSMhPHkC0RGu64+nvlpI3VCKwboLoYPGk86aXsOoON3Sg6WeuNoZdpe
	U1MW+DrPfVqqYoDQMrLF//nJC7yLcGJMNzn0bv776Anixs7SMukZ0JoV1Y9W98gkMEedtjYV6FvW+
	FOgdJXt0MvElyctVqN9ZuEYD1L1tqQxExpDvuQUWbbcLcr0FUYwbFVwfE/Z0OuJK4+oikZqMYT3KH
	0W2/gUuYBQKMxLzcqk7teQYU9PQ02EN4Jm1qdOIHqm21GNcPboJ3LZTzSOXp5iKQwfesdOvGSmvSI
	f0gtkhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS2BT-0000000BZEx-1NpB;
	Wed, 18 Jun 2025 23:27:11 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS29E-0000000BZ0T-0RsY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 23:24:53 +0000
Date: Wed, 18 Jun 2025 16:24:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750289087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qrxD2n0/TPw17Uc8nkUtK6jXpsmer9Xjurk1Z29eM00=;
	b=nOQhMYcgxS/j4foBRzM8x72Ps/2vwu3podTsW2GdwB6L5WptAFrt2zoVmkn7ZjE2CtMxwI
	Ke3zJFXq2P7kMgU6W800fjEMmLCr8l1IMicqSUwXSi5dq+M0rO/X3yznPChqY0NlwTkFdL
	Qqvfl1RmsbEX+p3fnUWdHkfvrghENe4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 00/15] KVM: Introduce KVM Userfault
Message-ID: <aFNKuGVWGn0dzKuV@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_162452_355237_4B21B2A9 
X-CRM114-Status: GOOD (  16.08  )
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

On Wed, Jun 18, 2025 at 04:24:09AM +0000, James Houghton wrote:
> Hi Sean, Paolo, Oliver, + others,
> 
> Here is a v3 of KVM Userfault. Thanks for all the feedback on the v2,
> Sean. I realize it has been 6 months since the v2; I hope that isn't an
> issue.

Not one bit. The only thing I look for in patch frequency is the urgency
with which the author wants to get something in.

> I am working on the QEMU side of the changes as I get time. Let me know
> if it's important for me to send those patches out for this series to be
> merged.

It'd be good to know we have line of sight on a functional
implementation here, i.e. uffd-based handling of non-vCPU accesses. I'm
not expecting surprises here, but patches always speak louder than
words.

Don't want to block the kernel pieces if that's a time sink though. And
FWIW, besides the nitpicking I'm quite happy with the way this is
shaping up.

> Be aware that this series will have non-trivial conflicts with Fuad's
> user mapping support for guest_memfd series[1]. For example, for the
> arm64 change he is making, the newly introduced gmem_abort() would need
> to be enlightened to handle KVM Userfault exits.

Appreciate the heads up!

Thanks,
Oliver

