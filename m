Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50B5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxXQXGjA8Ez+LLNGezkt0TxaGdPDqNizkUCvoA6K7p0=; b=TYHcipC04UJB/YhCFixME0/XI3
	+EeZmnaXbHW2nmi0CJ2bL0Anv4P+ERRm3YeZIJ4ys+J3z5GNqlAn9m+dmeNUMLPTL7VcUuvtFzGge
	SCarcAeUtrmkYf+uJ25bcOou6E5UUul0fyk5WcQe1TnsPjGZnYfpUcdXoQCDqfWiIgle1rwx5sCUd
	GMhv9WZXiODIkWimrzo8EwvX3WHHfwrhRQXq8WEThhiBQbWRsPCTFjvL5weBmJ59eKWnet+9YuxKE
	RrT/+m3cJvrtm0qzHbSl0uqD8YkjuDl7uzVlmX3rNq8uC2PNTE69tH3iS7lTJ4jiV8eyZyRXzDBrQ
	Z3m4QyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTEPq-00000008Wi5-1XKW;
	Sat, 30 May 2026 07:47:30 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTEPo-00000008WhZ-1faz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 07:47:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780127229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KxXQXGjA8Ez+LLNGezkt0TxaGdPDqNizkUCvoA6K7p0=;
	b=XlU47XZ7t70fUvpZtLoR7bU5qgPv3nVY/flIm+FlY+aCJVaW/2OcOM37f9BjQ1OEGJvAaI
	OZwER44ej+Z8rnIZum1fy9fCFDR8gZ0vOuRCpNdMO4klHc3Ei1+TdY1vtL2fGXk3go69Md
	ozbTnRO59SwW8/C48shqyJgtE1VzN6g=
From: Lance Yang <lance.yang@linux.dev>
To: dave.hansen@intel.com
Cc: xueyuan.chen21@gmail.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com
Subject: Re: [RFC PATCH 0/3] make persistent huge zero folio read-only
Date: Sat, 30 May 2026 15:46:48 +0800
Message-Id: <20260530074648.33513-1-lance.yang@linux.dev>
In-Reply-To: <54986350-dfd4-4065-b960-e1ba30fee4b8@intel.com>
References: <54986350-dfd4-4065-b960-e1ba30fee4b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_004728_615086_36B424CA 
X-CRM114-Status: GOOD (  16.12  )
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

Hi Dave,

Sorry for the late reply.

On Wed, May 27, 2026 at 08:58:38AM -0700, Dave Hansen wrote:
>On 5/26/26 20:56, Xueyuan chen wrote:
>> The motivation comes from Jann Horn's read-only zero page work[1] and the
>> follow-up discussion[2] with Yang Shi. As Jann pointed out, the kernel has
>> had bugs, including security bugs, where pages taken with read-only
>> semantics were later written to.
>
>My overall concern with this is that it's just a code hack for the huge
>zero page and nothing else. It's a total one-off.

Fair point. I was trying to keep the first version simple, so I
special-cased the persistent huge zero folio. But agreed, the arch side
should not grow a huge-zero-folio-only hook :)

>I think you need to make the case here that the huge zero page truly is
>a special snowflake and deserves a one-off special snowflake solution.
>Because it doesn't seem *that* crazy that there are more things that the
>kernel dynamically allocates that it wants to keep read only.
>
>Maybe there aren't many things that get mapped to userspace like this.
>But the case needs to get made either way.

For RFC v2, I think we should make the arch hook generic, probably
arch_make_folio_readonly(), with a weak default implementation. The
persistent huge zero folio would just be the first user.

But even with a generic helper, we still need to be careful about the
model. I see two possible ones:

1) Treat "read-only in the direct map" as real folio state. Then core MM
has to know about it and carry or clear that state in paths like
migration and freeing. It also makes the possible direct-map split / TLB
cost a more general MM issue, not just a cost tied to one caller ...

2) Only use the helper for folios with a simple lifetime: allocated once,
not migrated, not freed, and not written after they are made read-only.

I'd start with 2. Keeps the arch API generic, but avoids teaching core
MM a new folio state before we have a user that really needs that. The
persistent huge zero folio still works fine with that model. It just
becomes the first user instead of the special case :)

Thoughts?

Cheers, Lance

