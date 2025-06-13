Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EDDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8Sut+fy8lfu7/XvMjml4eUjNedvlzjM8vX8iOh3OUw=; b=Jkl8AwQgYH+ok2kpNFKptnyheT
	J4fS20VJICT55jNPLls8yh4GbWYXD2Q6wdcTX1uprQQNo13Ra1iO/XFNg048cBI6kfHDzK5IZ5dMr
	Y+fAyZT/sY0o7woYfye/vVCI2+AGrOeYpKL3eMezEwFYO27jGUQblEtBv5OsP3xTTd/s8ZHwfQzI7
	wKZf0+e4Q1WuCOyfsou/tx41ICpI+E6y6EXRLrt3OFOgurR+hTyBsV4mhrCevcyOgBqMo23KTRE0k
	NQkVe36u0I1QDUkjRMlEzxYZzcK/O7rS+VciVhcz/6svV7MqV+5WaUj94oXVxF1BLQj1tL6852a2A
	6ug+W6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBO3-000000002Pj-2Q1h;
	Fri, 13 Jun 2025 20:52:31 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBLm-000000002Ax-1fBl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 20:50:11 +0000
Date: Fri, 13 Jun 2025 13:50:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749847808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I8Sut+fy8lfu7/XvMjml4eUjNedvlzjM8vX8iOh3OUw=;
	b=FhCqBzeAOonQAm/50ztUH2sE5JTslXDgXCcfs+hGcy47NGTjBpPPfky37vSgwj1uD0nT3g
	BJBHYE0HEaRuDzhBlKzYL2qF6h/Jd2aLZTgwi2ZxfSY2joUdPRuO64zBYIyeKzn/H0APC9
	3z3bxhA8fRMVhxeAk4sWJnUe0AVBnas=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 33/62] KVM: Fold kvm_arch_irqfd_route_changed() into
 kvm_arch_update_irqfd_routing()
Message-ID: <aEyO-elphq6t1G7o@linux.dev>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-35-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-35-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_135010_579348_174001C6 
X-CRM114-Status: UNSURE (   8.12  )
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

On Wed, Jun 11, 2025 at 03:45:36PM -0700, Sean Christopherson wrote:
> Fold kvm_arch_irqfd_route_changed() into kvm_arch_update_irqfd_routing().
> Calling arch code to know whether or not to call arch code is absurd.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

