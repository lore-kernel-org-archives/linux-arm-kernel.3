Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3A6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8XicYgOjiTvvGGkoe6RWU7q2u/gG9EiLOqy/Vb5XKI=; b=OxpxHvVwRGNP7eje3RyVeLwsXg
	GHChYrUesBY2XJkbhaf0Y/OfmMsWyFaptejpQDw+SwwB7k0SoCK8CloC/dnaSA2sVgquq7wpchLIx
	uVprhQ4Z1Cq5HyRK3zcPLHM8Jmb4LC402NUJiZcIGdZ6SxTMTmE2v/bCK2IIQRENNnCQ2TB31calx
	3NR+BFwzpFjdSQo+5xMmKAXB8d2QZ0G3f4r+0/Z+OTvPV0JKn4qJouiUulEENJMjd4Xw4A/EJ6512
	TUqSExKzzWmXKfGLkbeaDpy0qOG6Scm7UHWrd9EsrjBOjY8w/fB3j1CsvO4pGnORz7oBfUq4U1HoJ
	qKKjURDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPi-00000001arM-2sWK;
	Fri, 22 Aug 2025 05:34:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDww-00000000pGy-0Fxv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 22:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D8XicYgOjiTvvGGkoe6RWU7q2u/gG9EiLOqy/Vb5XKI=; b=g6jD4jnNqT6HW54aCbqN8Aeu5X
	ICTLuNjpCuzTjFyyN8czG1TYHlGDTfF+wLcA/U1FeZgu0szQNIMWU81BVx94cqQlyaTwiF//hAsBs
	wt9zxdTm94fG8lBi3/FBqw3em4Bn0j5e6IlnSYCl9IIBdepKSnR9l6WLI5eUyvBGIV9n1aERFddp+
	knq9oOMu+6R1vDi691UfNykqv89E1hXD8JexHhHHl2kQ2UFIPfejBg0EZAhREU8yqzOy6yyngHNdW
	KP81phJd9+hueauUaWM06oK/VyWVJr1RkfbKewWsuTs+nF83M3PPZYOHdPXM3spsi+mK8QzRw4qb3
	SEo/chwQ==;
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDwr-00000000h08-2vXz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 22:40:00 +0000
Date: Thu, 21 Aug 2025 15:39:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755815986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D8XicYgOjiTvvGGkoe6RWU7q2u/gG9EiLOqy/Vb5XKI=;
	b=uf+yKkk0lkGd+LdPilwoJoT6fqhHqMP/fkewlLpiiG2lFzUdETqfLTLzi2b+NE41mz1azY
	7Vuef5ZskjXR4AsBJPQaepxaFMN53Pg1JtVAdE28ie1oEpQbgm/e3lDIf6yP1arsITF6y6
	831T4jz9a7i4vLtWE2OkvPeS6koNX2Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Houghton <jthoughton@google.com>
Subject: Re: [RFC PATCH 00/16] KVM: arm64: Add "struct kvm_page_fault"
Message-ID: <aKegF0XyrDF1Z5w4@linux.dev>
References: <20250821210042.3451147-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_233958_507127_5023C1A2 
X-CRM114-Status: GOOD (  10.67  )
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

On Thu, Aug 21, 2025 at 02:00:26PM -0700, Sean Christopherson wrote:
> Add an arm64 version of "struct kvm_page_fault" to (hopefully) tidy up
> the abort path, and to pave the way for things like KVM Userfault[*] that
> want to consume kvm_page_fault in arch-neutral code.
> 
> This is essentially one giant nop of code shuffling.
> 
> RFC as this is only compile-tested.  I didn't want to spend time testing
> until I got feedback on whether or not y'all are amenable to the general idea.

I appreciate the improved scoping around things like mmap lock, so this
seems like a net-win in terms of readability. Just want to clarify the
way this gets consumed from arch-neutral code and actually read in
detail.

Thanks,
Oliver

