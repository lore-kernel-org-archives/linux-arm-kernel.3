Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC8FC618A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2n1sRQgq5PofB8SvJ7IWjTYippNHGIcuVtOJgLyqyw=; b=BVVjFZwkJR5tM2KUVUABnhia/J
	vctHxXMQGjaCCg+o6oq1KDUsu3F1w13s+Hgu/csulx0s3UuWNfmxXRceiibwCXF694Gg0KV3MLMVT
	rpOlT3U+tnPzHYWYCgatLdSZx+b4REdrZoD1QZniRpOlodzVsOCtENAPD8ZCnHIXKw/F3uc+pLT2I
	cuK69HoPcbfg5y6joMa+aaZt39zwnEBWsA7KB9B0gaBRBu/hoA0wcn8yail33Mv2C07oZMd+RF4vn
	vW/Qmh7R6nmsmFbcFggtqRTitdP227+vZjkVrcsKG1QplsgAbw4olebkhBYwI+K6ht7aJNsOW7siD
	LVETFC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc7Ds-00000009iai-2mP9;
	Sat, 03 Jan 2026 19:23:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc7Dp-00000009iaC-2hdN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 19:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E26B34039E;
	Sat,  3 Jan 2026 19:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DA3C113D0;
	Sat,  3 Jan 2026 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767468212;
	bh=kFPBzT8l+WwHu+3My5hbLBVwoqHKka5P/1LTiFfRdf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngReHhb0xBx1x5fvYtOfgcpLEILzqu49lQW1bMb2wRc3+BW1vWJdoV/liivSukWbi
	 Wr1u0+WC02baG/7qzxuTHFHic6PVnSamdiPxhEqTgA1S2pA1eqYyInnK8Yq7O5/pa1
	 cl2RU6O4se6+wNz0wv5fa0sTosXv7JI6nHpQxOqCzUdzlR3V5lzLornbt5v4CC52Wv
	 K6NU1UCrStxzBWELoCL6XaOEUwgpoF1/dezzddv3CKdw8etbedWu0aGGeJ5bgKxD0h
	 Hx+Y7xYCdQlhaa0yCF5YVhge9J70WfDqFLK3pVNIX1+38Kw2MCSO0IgV/T3FqAtpNA
	 9fVyAIlQ2ZFFg==
Date: Sat, 3 Jan 2026 21:23:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net,
	david@redhat.com, mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
Message-ID: <aVlsqdgXSBLIE9Xi@kernel.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-19-eugen.hristev@linaro.org>
 <aVImIneFgOngYdSn@kernel.org>
 <4b8953ac-567b-4d68-9c25-72a69afdf1b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b8953ac-567b-4d68-9c25-72a69afdf1b3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_112333_743650_68E008D7 
X-CRM114-Status: GOOD (  25.88  )
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

On Sat, Jan 03, 2026 at 08:36:40AM +0200, Eugen Hristev wrote:
> 
> 
> On 12/29/25 08:56, Mike Rapoport wrote:
> > Hi Eugen,
> > 
> > On Wed, Nov 19, 2025 at 05:44:19PM +0200, Eugen Hristev wrote:
> >> This memblock flag indicates that a specific block is registered
> >> into an inspection table.
> >> The block can be marked for inspection using memblock_mark_inspect()
> >> and cleared with memblock_clear_inspect()
> > 
> > Can you explain why memblock should treat memory registered for inspection
> > differently?
> 
> It should not, at a first glance.
> 
> The purpose of the flag is to let memblock be aware of it.
> The flag is there to have a "memblock way" of registering the memory,
> which inside memblock , it can translate to a meminspect way of
> registering the memory. It's just an extra layer on top of meminspect.
> With this, it would be avoided to call meminspect all over the places it
> would be required, but rather use the memblock API.

memblock APIs are not available after boot on many architectures, most
notable being x86.

But regardless, I can't say I understand why using memblock APIs for
meminspect is better than using meminspect directly.
I'd imagine that using meminspect register APIs would actually make it more
consistent and it would be easier to identify what memory is registered
with meminspect.

In the end, memblock_alloc*() returns dynamically allocated memory, just
like kmalloc(), the difference is that memblock is active very early at
boot and disappears after core MM initialization.

> And further, inside memblock, it would be a single point where
> meminspect can be disabled (while preserving a no-op memblock flag), or
> easily changed to another API if needed.
> Ofcourse, one can call here directly the meminspect API if this is desired.
> Do you think it would be better to have it this way ?
> 
> Thanks for looking into it,
> Eugen

-- 
Sincerely yours,
Mike.

