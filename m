Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86EBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QHNamPKjhT26TDn8HJD8lZwpsva7nZLItuVVWrKgxw=; b=avg0tIDEzyw6GTnHLSNal3NMTd
	sk2yWEsAJMgzrmmSjKbQUe4OHbFBSprqDGD0Kj67oGW4bQgUwjRAs+TD5kC/DDwpHunSRLtCRFxHT
	vmWsi+VzZaQJDAmaBDkjBcsy3JOG5lWCzx2fM39MaLb/7b00dSBj57b7wVKWyWKitfXdkDuctA3w9
	GSyvCMVGELuGe1By/p3zVuMP/T9l8DFFxKKzItlREsXF2zbZcj43sR5f8kgUEWae2YJLWTIMY74qa
	4Xzvt9T/7Zr5FEzKEuLwjtSSSozvyYMyTY6lX14tEOAHjJoD2p0gPCcKD4uDHUe6HPWypHWdJRTYq
	iFt5MO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghbi-0000000CNvY-0RmL;
	Mon, 06 Jul 2026 11:35:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghbf-0000000CNuy-0DcO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8588A40BD6;
	Mon,  6 Jul 2026 11:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD121F000E9;
	Mon,  6 Jul 2026 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783337722;
	bh=0QHNamPKjhT26TDn8HJD8lZwpsva7nZLItuVVWrKgxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LnZg5pDEl/YbyVjvwLOdIOB1fd9xeufnLnBVYTn0yFjkwQQIcH/hNpokUZSQy81nI
	 Spk/ZSjZ9g7PzB3NrgPGutQ6yasP/oh/KcXyhOA7G+NNoDKfyVkahcCARefSEusPPd
	 9ESC0k1S0n21ErvIbvmbVNonMDp9tDga79CSgtxsK+iQDTZETBcdpeon56Z51rmBuq
	 Pd8iZquPGPJmc1tKS/jqug3yEQQV5ne1CjuIlC/S4fVHYPp5DPp3DhY+Y1/m+BphcR
	 jB3agjkuOkEyqA4LZShAiXpXsEVdLsZxMJE4MIAH6qAINS4fzz5Y/z3aMvjcdGDBLI
	 JQJWBfcaB9XSw==
Date: Mon, 6 Jul 2026 14:35:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Brendan Jackman <brendan.jackman@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>, owner-linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Message-ID: <akuS8uhjPBhI5mzZ@kernel.org>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
 <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
 <aiuyoy8Kmr9yU4GM@kernel.org>
 <ajK6w3YTFpVaUl3v@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajK6w3YTFpVaUl3v@google.com>
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

Hi Adrian,

On Wed, Jun 17, 2026 at 03:18:27PM +0000, Adrian Barnaś wrote:
> 
> Following your suggestion, I can put together a preparatory patch series to
> refactor the set_direct_map_* APIs to accept a nr_pages parameter. This
> refactoring would also allow us to drop the redundant set_area_direct_map
> helper. I could then rebase the rox_cache series on top of that.

I've been looking at something related and I was already half way through
adding numpages to set_direct_map when I remembered this conversation :)

Here's what I have for now:

https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=direct-map/v0

This is only lightly build tested for arm64 and x86.

As this is WIP, things may change there, but I hope it can save you some
time with your arm64 ROX cache work.

> Does this sound like a good path forward?
> 
> Thanks,
> Adrian

-- 
Sincerely yours,
Mike.

