Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MHQNdhGZ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MdieU0Fk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8a32jiRIHg8MgSuY0NmSAXzTQgRPvZ2S02jS/vgMnZU=; b=MHQNdhGZ+SyEXXtE2WwhnIo+4h
	P+LNN+520gboMHMHO4WjHXNpzswewaNEjm+myhcw6C5uYn/GQui5ZWccpFRLdzPGWbHfO3jofhsgB
	uBlCoNNb/CDYMHdbO3POoJ9v1Xgu8R5p2WYFSBOBycV3mZ+blLNSwWm08F5WWLaujiicLZRb5HMKw
	73LkH6H3XcCbMF/fketk8hLaFvdfyTkX3J74ky8vSQRKWlQyt798p79VvAZW5rlj7tuBEC2TTfK9c
	7aohTY0wbS4PIFnVY8Co+E1yvAacV3f/UGOzZEz/e+ScTucteHjIvaWFbsyJJE/DS6pz/jbDqXZ2i
	Fv4qYDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkN5-00000005Pfr-1gz9;
	Tue, 27 Oct 2026 16:49:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkN2-00000005PeZ-1sEn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:49:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93F4415A1;
	Tue, 27 Oct 2026 09:49:51 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 152893F59E;
	Tue, 27 Oct 2026 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793119794; bh=Wi8JCvfDMPalrSXsQQq726qxz61LBuEE0WYkMWBem1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdieU0FkgBD9jO+oaHHb+PAU9kNPVL8ASMuIuRPu9Bb+9eQH/ca8vRrM3DvNmi2wv
	 P0JcOZauSNMXB9JRYOb4jbHCvFXAWy9LbhupAt+49YAEvtdX52igbRblbRKxDC6vHv
	 muZXbhgWDd0yQKEsjKHTxULFBhdUdGv5Zxyp0Tsc=
Date: Tue, 27 Oct 2026 16:49:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, will@kernel.org,
	Ryan Roberts <Ryan.Roberts@arm.com>, dev.jain@arm.com,
	baolin.wang@linux.alibaba.com, lance.yang@linux.dev,
	mark.rutland@arm.com, akpm@linux-foundation.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid
 PTEs
Message-ID: <auDWKd-kXH22WPjD@arm.com>
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
 <daab2f45-56c2-48ad-a24f-aa4f889e4da2@kernel.org>
 <e0f60526-bb95-4d39-9a7a-72cdf32ca5b6@bytedance.com>
 <cc2e3af6-bb56-41b1-9cde-151797c3068d@kernel.org>
 <3b57c214-6a43-4fc7-a531-fb5eac196465@bytedance.com>
 <at9H9Vkx57pIcPos@arm.com>
 <c267c29a-5678-4c0f-a15d-e5c12ae8c427@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c267c29a-5678-4c0f-a15d-e5c12ae8c427@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_094956_558923_97823449 
X-CRM114-Status: GOOD (  22.55  )
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

On Mon, Oct 26, 2026 at 11:33:31PM +0100, David Hildenbrand wrote:
> On 10/26/26 13:30, Catalin Marinas wrote:
> > On Sun, Oct 25, 2026 at 12:00:33AM +0800, Zhao Gongyi wrote:
> >> On 10/24/26 4:55 AM, David Hildenbrand (Arm) wrote:
> >>> If we have the spare PTE bit, why shouldn't we just use it?
> >>>
> >>> It will make batching over PTEs faster. And we care about that for present PTEs.
> >>>
> >>> So I don't quite see why the stable fix couldn't just do it right away? Do you
> >>> have a prototype that shows that it would require significant code changes?
> >>
> >> I tried a small prototype that keeps PTE_CONT on present-invalid PTEs.
> >> It leaves contpte_set_ptes() unchanged and makes contpte_try_unfold()
> >> recognize pte_present(pte) && pte_cont(pte), instead of checking only
> >> pte_valid_cont(pte).
> > 
> > I think it's worth doing but currently not sure it buys us much unless
> > we also change pte_batch_hint() to cover such entries. However, if we do
> > this, we need to audit the other pte_valid_cont() callers (e.g.
> > ptep_get() needs updating as well).
> > 
> > So, if we aren't going to change pte_batch_hint() as a backport fix (I
> > don't think we should, it's an optimisation), I'd rather take v2 now and
> > continue with a proper pte_present_cont() etc. patchset on top.
> 
> Your call, the version actually looks quite clean:
> 
> https://lore.kernel.org/r/52e7e1f6-3535-474d-9b46-6bb62f96eefc@bytedance.com
> 
> But yeah, audit needed (e.g., no need to flush when shattering such entries that
> are not valid)

Yes, the fix looked clean but I didn't particularly like the asymmetry
between try_fold and try_unfold w.r.t. pte_present(). Well, that's more
of an OCD ;).

Going forward I think we should move towards pte_present_cont() but
together with changing pte_batch_hint().

-- 
Catalin

