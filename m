Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64677C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 21:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1ZMUuqxcnvd+DUeR/RMfMUUTtsKUO/qlLecFMsIoTQ=; b=dUaPlPXXRXUnkouFcOkWiLYNyc
	PBQt+JvsKBtJAEaCYBva1ERHi5zkjwM4FMkv01nmJp++Bm82TxDUVXMCw+07eEaqrTJzRrvu992VF
	EiMz3nLA+tdNQKTrgmio+utgxLgyuxUKAXgeF7bZWV/3uO//OmMjDllgpu3YigjGFY4PzXkASmMJj
	SA8Xp/Jrs5sGMBrj2vKYclUkHQucWBIDb4gWuXWZQ5TaHlgHovvMT/NS/ByLR4qlWXVwtqnwHTZWI
	Tb7C65eVte72aT5smKBn7I7GukH3wcPDXB0J/zlQ25R5rBrypPk09M2jbpVhAM0e4Z/n7JQVcjlE+
	8pTmV2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJsh-00000008r4u-11H3;
	Wed, 12 Feb 2025 21:02:51 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJrF-00000008qsr-3HPB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 21:01:23 +0000
Date: Wed, 12 Feb 2025 13:01:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739394077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1ZMUuqxcnvd+DUeR/RMfMUUTtsKUO/qlLecFMsIoTQ=;
	b=LdyeZg0LYJkM16jmF+N4f9uccObhtqQZwI6qWB3hW5h0sfJe9tTF6cr+UB0Pe9Gy8Ywgjs
	cpGfAlreNGGy8/goRh7K5vCWc4HYOIj4U37rfSVCLGyRLOyfvOYgpYZqVT3RXndW2urXbv
	IgGI8CEmZsk7LReXCIi+NulNe8CrwcE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] KVM: arm64: Convert timer offset VA when accessed in HYP
 code
Message-ID: <Z60MF6KLM44-Gnu1@linux.dev>
References: <20250212173454.2864462-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212173454.2864462-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_130122_027958_CE7EDFA5 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, Feb 12, 2025 at 05:34:54PM +0000, Marc Zyngier wrote:
> Now that EL2 has gained some early timer emulation, it accesses
> the offsets pointed to by the timer structure, both of which
> live in the KVM structure.
> 
> Of course, these are *kernel* pointers, so the dereferencing
> of these pointers in non-kernel code must be itself be offset.
> 
> Given switch.h its own version of timer_get_offset() and use that
> instead.
> 
> Fixes: b86fc215dc26d ("KVM: arm64: Handle counter access early in non-HYP context")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

