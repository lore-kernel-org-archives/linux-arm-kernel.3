Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B4606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 16:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bTklrIn4;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Y8nqlMG6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:
	Content-Transfer-Encoding:References:Subject:Cc:Content-Type:Message-Id:From:
	In-Reply-To:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vSkKqqPrcRVk3BVNulEaeACxkD/BbD3EQ9kOWBnKbIk=; b=bTklrIn4FA5W3dwlHu08UWmsXF
	up0WdOZaEIGe9CxcE0VhVcjz27++s0+gdUnk71hwTCXa9uKPIT1tULyekpLr7fqbIhpUPmCoVBZmm
	4W4WIJkxtX9k2O6lB/oRqReD3Avs6ApI5lDenkLtx+S+xxJXnAfYrKq/C7iLBuUKTJNBUl84N8yVq
	/HXZ8b++bDNG0ywAGq2j+XrlJpaLpcOdbxVyNBznaaD0X4BBRcyiPP9TGXuOdaGbjC8YwgWygMuRc
	Gu0phIQjv2E8H8/2CQvE+CepgNl1uS19bDqWCNN9B9BOeDFyKnLZz0YsDm5vn0Ec6N4pX99tc5zP2
	VUnJxkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKeB8-00000000LjN-3ArZ;
	Sat, 24 Oct 2026 16:01:06 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKeB5-00000000Lj3-3wV3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 16:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792857657; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=vSkKqqPrcRVk3BVNulEaeACxkD/BbD3EQ9kOWBnKbIk=;
 b=Y8nqlMG6xNk4CE50/o38uj+s9sIqVf8QCKM01PwMWpWmoxt9f3f48NdTZ8IhCJaMhNe0yI
 Degyuq0fWnZ+aqXwVdYnczcV/8uG34ZMqBkG7uLfASajhr2bQEvwkS9XRyp0Crpnnki6fq
 zXYlmXEDd9+zSfLSQ7X36bf3kBOk1CNP6agH4tIF0NPwBslNf1wpC22S2ySwuHDBmv7NTv
 KCkkEWXtHtomxwyFrZonIdeTUH2gVaD7AMmrED3Jl+Pn1Yoe397kVdoFYXfRTSEy96L4o+
 k2/SRf5q5nIew3oI1ciQp3CGUYNJ9AYgrx0JLQK5XWc1KYZq+IT/BBtaffFS5Q==
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, <catalin.marinas@arm.com>, 
	<will@kernel.org>, "Ryan Roberts" <Ryan.Roberts@arm.com>
In-Reply-To: <cc2e3af6-bb56-41b1-9cde-151797c3068d@kernel.org>
User-Agent: Mozilla Thunderbird
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <3b57c214-6a43-4fc7-a531-fb5eac196465@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26adcd637+c93711+lists.infradead.org+zhaogongyi@bytedance.com>
Cc: <dev.jain@arm.com>, <baolin.wang@linux.alibaba.com>, 
	<lance.yang@linux.dev>, <mark.rutland@arm.com>, 
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <liam@infradead.org>, 
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>, 
	<mhocko@suse.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid PTEs
References: <20261013093600.54995-1-zhaogongyi@bytedance.com> <daab2f45-56c2-48ad-a24f-aa4f889e4da2@kernel.org> <e0f60526-bb95-4d39-9a7a-72cdf32ca5b6@bytedance.com> <cc2e3af6-bb56-41b1-9cde-151797c3068d@kernel.org>
Content-Transfer-Encoding: 7bit
Date: Sun, 25 Oct 2026 00:00:33 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_090104_057283_7722E9DB 
X-CRM114-Status: GOOD (  10.14  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/24/26 4:55 AM, David Hildenbrand (Arm) wrote:
> 
> Hi,
> 
> sorry for the late reply.
> 
> If we have the spare PTE bit, why shouldn't we just use it?
> 
> It will make batching over PTEs faster. And we care about that for present PTEs.
> 
> So I don't quite see why the stable fix couldn't just do it right away? Do you
> have a prototype that shows that it would require significant code changes?
> 

Hi David,

I tried a small prototype that keeps PTE_CONT on present-invalid PTEs.
It leaves contpte_set_ptes() unchanged and makes contpte_try_unfold()
recognize pte_present(pte) && pte_cont(pte), instead of checking only
pte_valid_cont(pte).

With this change, the guard-marker reproducer passed 100 iterations
in an arm64 QEMU/KVM guest running a KASAN-enabled kernel. The fork
and PMD-split probes passed five runs each, with no warnings or KASAN
reports. In the earlier A/B test, the unmodified kernel failed on the
first guard-marker iteration.

The prototype makes the reported reproducer pass with a small change
while retaining PTE_CONT. I therefore cannot point to evidence that
fixing this failure requires significant code changes.

Thanks,
Gongyi

