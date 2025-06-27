Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E46BC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AMsankqQ7fXut//cwhaRHpcwwLLJJgqr0ZblnCJIz0=; b=UY8gGk0MQPJf2QT92TAXMMnKR7
	cnjNa47wDy4MOyZGooJl6MGafUjE0UUiOw0e/G5wbHx1sZAMPuOP8xZGDNoZ4/qLyljL+eMSRCUn+
	p9w1206QOf/psfKUeHPBMyUeehXgkblMkm0NfbRAEt5rrIAxzeyALaMKncCJXfzGiWSwRGxB/vDtB
	URQ+gXmdhkRkv0/swRd3WniH9tSkPqBdB3M+UojzU9vyo5TRABNWVVSIl8xjoW0O3yS0adI3Twb7l
	6B/E+zAsXgw3SkYVGDE8NCl4DgUa3o7YcHYXWCfqsn/2vdRWgq49lw97bzk+PZGhfP3h7Y4UtPaaU
	9+/Ub2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGD6-0000000FoUk-3a8G;
	Fri, 27 Jun 2025 21:02:12 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVG6l-0000000Fnth-3q5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:55:41 +0000
Date: Fri, 27 Jun 2025 13:55:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751057734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1AMsankqQ7fXut//cwhaRHpcwwLLJJgqr0ZblnCJIz0=;
	b=ryxq9xyOHz5HcEmHKXHWirB5Xpi7L1zTlBdjMXx/7++C8tCcdl/h+rYXtM3iVSXvEC7B7P
	11j/UAoaFs0ZNl9IKeMbblgKhnCbvPA0ZkwN1k+IBnrMoa6O9wiT7rXXgf42CoURxWxwZk
	pXvRVVgsa3Hiney2sAnFfkyylePCAqU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: Ben Horgan <ben.horgan@arm.com>, kvm@vger.kernel.org,
	pbonzini@redhat.com, corbet@lwn.net, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	mizhang@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 02/22] arm64: Generate sign macro for sysreg Enums
Message-ID: <aF8FPTupC_VnAldN@linux.dev>
References: <603eb4c7-5570-438c-b747-cdcc67b09ea6@arm.com>
 <gsntecv49aml.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsntecv49aml.fsf@coltonlewis-kvm.c.googlers.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_135540_241795_B3E3B2D9 
X-CRM114-Status: GOOD (  25.71  )
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

On Fri, Jun 27, 2025 at 08:45:38PM +0000, Colton Lewis wrote:
> Hi Ben. Thanks for the review.
> 
> Ben Horgan <ben.horgan@arm.com> writes:
> 
> > Hi Colton,
> 
> > On 6/26/25 21:04, Colton Lewis wrote:
> > > There's no reason Enums shouldn't be equivalent to UnsignedEnums and
> > > explicitly specify they are unsigned. This will avoid the annoyance I
> > > had with HPMN0.
> > An Enum can be annotated with the field's sign by updating it to
> > UnsignedEnum or SignedEnum. This is explained in [1].
> 
> > With this change ID_AA64PFR1_EL1.MTE_frac would be marked as unsigned
> > when it should really be considered signed.
> 
> > Enum	43:40	MTE_frac
> > 	0b0000	ASYNC
> > 	0b1111	NI
> > EndEnum
> 
> Thanks for the explanation. I made this a separate commit because I
> considered people might object and HPMN0 is already an UnsignedEnum in
> my previous commit.
> 
> Do you think it would be a good idea to make plain Enums signed by
> default or should I just remove this commit from the series?

It is presumptive to associate a sign with an enumeration. Generally
speaking, the only fields that can do signed / unsigned comparisons are
the Feature ID register fields.

So please drop this and only keep the change for HPMN0.

Thanks,
Oliver

> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
> > > ---
> > >    arch/arm64/tools/gen-sysreg.awk | 1 +
> > >    1 file changed, 1 insertion(+)
> 
> > > diff --git a/arch/arm64/tools/gen-sysreg.awk
> > > b/arch/arm64/tools/gen-sysreg.awk
> > > index f2a1732cb1f6..fa21a632d9b7 100755
> > > --- a/arch/arm64/tools/gen-sysreg.awk
> > > +++ b/arch/arm64/tools/gen-sysreg.awk
> > > @@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" ||
> > > block_current() == "SysregFields
> > >    	parse_bitdef(reg, field, $2)
> 
> > >    	define_field(reg, field, msb, lsb)
> > > +	define_field_sign(reg, field, "false")
> 
> > >    	next
> > >    }
> 
> > Thanks,
> 
> > Ben
> 
> > [1]
> > https://lore.kernel.org/all/20221207-arm64-sysreg-helpers-v4-1-25b6b3fb9d18@kernel.org/

