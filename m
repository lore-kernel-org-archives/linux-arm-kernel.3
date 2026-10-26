Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51486606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UrNWTS3t;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a51umk1S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TRZt7x37p8LUgQOIpKaz3b3988dBzwRGltnd5ZVeEBQ=; b=UrNWTS3tLbW6DgXcgHNKpsCXHn
	FfuBdkOR5utVujjXSFWiXoeE3HHNyKgihPk7QZgxRWkB0ozqHIwEKgjKVk3dvtH1eGyBnSZuJ7f0F
	QgKl3uPXBImsc+RW1OpuMNWu+SSMVyOrepw4zQwziwEN8weVxHMclc0Vv2JxhLFAwuQEoNyjHYDMy
	r1//bjtJaNKPSlGn7D1KbpS+hG2EHN5zargu6Cott7YN1aOqGVxd2S6F48aq88mI6rnPJo4FenqV0
	Ohn+rKRnYeopJLBkXJ/ON3DaVQqIeUuaJaixFrWK37MRMCIqaNZnVFO/JnRLKe2AS/YzSza2ZaduZ
	Mgmz871A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJqq-00000002VeP-2ztw;
	Mon, 26 Oct 2026 12:30:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJqn-00000002Vdy-2psL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:30:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F3F025DF;
	Mon, 26 Oct 2026 05:30:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16F583F7B4;
	Mon, 26 Oct 2026 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793017850; bh=X7sXgG5KeOSy1aHvYxzPYxQhid9EVso1C+EnXtpcXiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a51umk1SJn3Qg0uasCVQzZnOrDFKghUAEP7EkrWFXdPPNFIMzLLrV9N8cjkr3aGKF
	 z8GG4zNZ3Tm/0q6VoX6Psp3ZxfySUkB3fkJWOhbNWs22m0DRA+otCMqkcURphbPTl5
	 fFeWa3OFzRFlj5VqI9kqkZNToJ4SuBOlO68fncXY=
Date: Mon, 26 Oct 2026 12:30:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, will@kernel.org,
	Ryan Roberts <Ryan.Roberts@arm.com>, dev.jain@arm.com,
	baolin.wang@linux.alibaba.com, lance.yang@linux.dev,
	mark.rutland@arm.com, akpm@linux-foundation.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid
 PTEs
Message-ID: <at9H9Vkx57pIcPos@arm.com>
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
 <daab2f45-56c2-48ad-a24f-aa4f889e4da2@kernel.org>
 <e0f60526-bb95-4d39-9a7a-72cdf32ca5b6@bytedance.com>
 <cc2e3af6-bb56-41b1-9cde-151797c3068d@kernel.org>
 <3b57c214-6a43-4fc7-a531-fb5eac196465@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b57c214-6a43-4fc7-a531-fb5eac196465@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_053053_788735_C44652A5 
X-CRM114-Status: GOOD (  16.06  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 12:00:33AM +0800, Zhao Gongyi wrote:
> On 10/24/26 4:55 AM, David Hildenbrand (Arm) wrote:
> > If we have the spare PTE bit, why shouldn't we just use it?
> > 
> > It will make batching over PTEs faster. And we care about that for present PTEs.
> > 
> > So I don't quite see why the stable fix couldn't just do it right away? Do you
> > have a prototype that shows that it would require significant code changes?
> 
> I tried a small prototype that keeps PTE_CONT on present-invalid PTEs.
> It leaves contpte_set_ptes() unchanged and makes contpte_try_unfold()
> recognize pte_present(pte) && pte_cont(pte), instead of checking only
> pte_valid_cont(pte).

I think it's worth doing but currently not sure it buys us much unless
we also change pte_batch_hint() to cover such entries. However, if we do
this, we need to audit the other pte_valid_cont() callers (e.g.
ptep_get() needs updating as well).

So, if we aren't going to change pte_batch_hint() as a backport fix (I
don't think we should, it's an optimisation), I'd rather take v2 now and
continue with a proper pte_present_cont() etc. patchset on top.

-- 
Catalin

