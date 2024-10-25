Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EB2D0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVymUEFYtCdDV1FOK38WH8kO5JMGTgBpUO5mA601WLQ=; b=huPJwwtxqxN3bomhON3VTPc0aJ
	J9ITh9mYDQLlM0F0+v1H9J5dcM55ivJYYSDpRwdlwKHBFw84Aec2osmUOajDO6PdWcL+5UgU6Fbnr
	s/qk4v9L4PedRE4wSTLq4F15CUvEhKdexF2Xxn8xM3SIxB8M4x7H50aFKN8SKANJdSPh1dVC1WRhz
	RkUp9/L74h/Naz2OV/BgYzJGUq+w7pUh9BcanKoXepsCoJBqzu7v8LCZ87fWKySPCv7rEer0sBUDh
	M05KtU5bBTuyB9n6SWpwDlBK7CVgwttiS89947wGZmUs/vupXqLrs3zTtnM4nLfqZQmuLywlD651r
	qL+gJvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ITB-00000003VRH-0d5M;
	Fri, 25 Oct 2024 11:27:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I78-00000003SA4-1bSq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:04:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0115E339;
	Fri, 25 Oct 2024 04:04:47 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066903F73B;
	Fri, 25 Oct 2024 04:04:14 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:04:09 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com,
	broonie@kernel.org, dave.hansen@linux.intel.com,
	jeffxu@chromium.org, joey.gouly@arm.com, pierre.langlois@arm.com,
	shuah@kernel.org, sroettger@google.com, will@kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
Message-ID: <Zxt7KQ2b0oyMp1zR@e133380.arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
 <20241023150511.3923558-4-kevin.brodsky@arm.com>
 <ZxoooqtuqTK5CAMR@arm.com>
 <80688edf-83dd-43c6-a1a8-b69acd30f5c3@arm.com>
 <Zxpq0k3b9q8nWrYa@arm.com>
 <ZxpzexqNIfys3MnJ@e133380.arm.com>
 <d7d00ffc-2e92-46cb-95c2-c877723bcb5d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7d00ffc-2e92-46cb-95c2-c877723bcb5d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_040418_486463_4A0D704C 
X-CRM114-Status: GOOD (  24.25  )
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

On Fri, Oct 25, 2024 at 10:24:41AM +0200, Kevin Brodsky wrote:
> On 24/10/2024 18:19, Dave Martin wrote:
> > On Thu, Oct 24, 2024 at 04:42:10PM +0100, Catalin Marinas wrote:
> >> On Thu, Oct 24, 2024 at 04:55:48PM +0200, Kevin Brodsky wrote:
> >>> On 24/10/2024 12:59, Catalin Marinas wrote:
> >>>> On Wed, Oct 23, 2024 at 04:05:09PM +0100, Kevin Brodsky wrote:
> >>>>> +/*
> >>>>> + * Save the unpriv access state into ua_state and reset it to disable any
> >>>>> + * restrictions.
> >>>>> + */
> >>>>> +static void save_reset_user_access_state(struct user_access_state *ua_state)
> >>>>> +{
> >>>>> +	if (system_supports_poe()) {
> >>>>> +		/*
> >>>>> +		 * Enable all permissions in all 8 keys
> >>>>> +		 * (inspired by REPEAT_BYTE())
> >>>>> +		 */
> >>>>> +		u64 por_enable_all = (~0u / POE_MASK) * POE_RXW;
> >>>> I think this should be ~0ul.
> >>> It is ~0u on purpose, because unlike in REPEAT_BYTE(), I only wanted the
> >>> lower 32 bits to be filled with POE_RXW (we only have 8 keys, the top 32
> >>> bits are RES0). That said, given that D128 has 4-bit pkeys, we could
> >>> anticipate and fill the top 32 bits too (should make no difference on D64).
> >> I guess we could leave it as 32-bit for now and remember to update it
> >> when we enable more keys with D128. Setting the top RES0 bits doesn't
> >> hurt either since they are already documented in the Arm ARM. Up to you,
> >> it's fine like above as well.
> > Can we maybe just have a brute-force loop that constructs the value
> > using the appropriate #define macros?
> >
> > The compiler will const-fold it; I'd be prepared to bet that the
> > generated code would be identical...
> 
> Fine by me, I suppose I was too eager to use the one-liner I had found
> :) Building that value based on arch_max_pkey() is probably a better
> idea in the long run. (And indeed the codegen is the same, it boils down
> to a mov w0, #0x77777777 in both case.)

The one-line was a neat trick (after the brief WTF moment) :)

I guess my uneasiness comes from baking the number of pkeys in via the
type of 0u and an implicit relationship that this happens to have with
the number bits per pkey in the POR.

[...]

Cheers
---Dave

