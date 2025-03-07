Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942F6C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQCeoUjMBLTYpmAs11rMjACGL42XfpmjLxOtQHXk+DA=; b=0wZiqIWmWzs4MtRJG9O+kp1/QT
	PNR7DroxAGDUxYHlX2kn2C5JORT54vs+JGe6vD2KHVn+avx36zDo5l3JxZbpZrbKsXWFFzeJBORUf
	KcEq1uGIgyVXsHWRAS2KteTSLfsp+PYHqYOEKfOdzZOc0koZqu9iU2vrka5GlvT792gMmiCjR+YSe
	zOVXm8h6pyBPeHdlYL4Uwwzw0XVhWH1N/X4HyVhCLrLPI5jRvHiaHhwU0mvwXm3DEnhtIqkBIWb+9
	kPXbCoNy76mQsi58LN97beM4vAOZggreL4TJvFWvnmYNq+hCdnU3Fi2lChsT6AMXfJrJzI5ECg31u
	JIRw4eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaI9-0000000Epsd-0N5v;
	Fri, 07 Mar 2025 16:11:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaGV-0000000EpbN-1lSB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:09:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0495C1477;
	Fri,  7 Mar 2025 08:09:43 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 962E43F673;
	Fri,  7 Mar 2025 08:09:28 -0800 (PST)
Date: Fri, 7 Mar 2025 16:09:23 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH] arm64/mm: Define PTE_SHIFT
Message-ID: <Z8saM94ixmDNjZzV@J2N7QTR9R3.cambridge.arm.com>
References: <20250307050851.4034393-1-anshuman.khandual@arm.com>
 <17931f83-7142-4ca6-8bfe-466ec53b6e2c@arm.com>
 <c3dddb6f-dce1-45a6-b5f1-1fd247c510ab@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3dddb6f-dce1-45a6-b5f1-1fd247c510ab@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_080935_502969_C6F5B375 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, Mar 07, 2025 at 02:50:56PM +0530, Anshuman Khandual wrote:
> On 3/7/25 14:37, Ryan Roberts wrote:
> > On 07/03/2025 05:08, Anshuman Khandual wrote:

> >>  #define EARLY_LEVEL(lvl, lvls, vstart, vend, add)	\
> >> -	(lvls > lvl ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + lvl * (PAGE_SHIFT - 3), add) : 0)
> >> +	(lvls > lvl ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + \
> >> +	lvl * (PAGE_SHIFT - PTE_SHIFT), add) : 0)
> > 
> > nit: not sure what style guide says, but I would indent this continuation an
> > extra level.
> 
> IIUC - An indentation is not normally required with a line continuation although
> the starting letter should match the starting letter in the line above but after
> the '(' (if any).

Regardless of indenttation, the existing code is fairly hard to read,
and I reckon it'd be better to split up, e.g.

| /* Number of VA bits resolved by a single translation table level */
| #define PTDESC_TABLE_SHIFT	(PAGE_SHIFT - PTDESC_ORDER)
| 
| #define __EARLY_LEVEL(lvl, vstart, vend, add) \
| 	EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + lvl * PTDESC_TABLE_SHIFT, add)
| 
| #define EARLY_LEVEL(lvl, lvls, vstart, vend, add) \
| 	((lvls) > (lvl) ? __EARLY_LEVEL(lvl, vstart, vend, add) : 0)

... and ignoring the use of _SHIFT vs _ORDER, I think that structure is
far more legible.

With that, we can fold EARLY_ENTRIES() and __EARLY_LEVEL() together and
move the 'add' into EARLY_LEVEL(), e.g.

| /* Number of VA bits resolved by a single translation table level */
| #define PTDESC_TABLE_SHIFT	(PAGE_SHIFT - PTDESC_ORDER)
| 
| #define EARLY_ENTRIES(lvl, vstart, vend) \
| 	(SPAN_NR_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + lvl * PTDESC_TABLE_SHIFT))
| 
| #define EARLY_LEVEL(lvl, lvls, vstart, vend, add) \
| 	((lvls) > (lvl) ? EARLY_ENTRIES(lvl, vstart, vend) + (add) : 0)

... which I think makes the 'add' a bit easier to understand too.

Mark.

