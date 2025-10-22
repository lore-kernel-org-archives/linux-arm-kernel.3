Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E53CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFEkpBnXxxmtKA9A7NePAhbOQjlfQfUvDI05XZ9mOos=; b=cG/ZmZCADKZ9bvZqAmsWjyM/FR
	nqYZ5fYVUWbtCXyx+iiLTjgtpG7yTHmQtLLF1Pk9PZE7hQEdB8PtqTt5DyYT6Yep483JqM5PEtf+9
	l00NDmaI3/vHCmB/LQOHm30hawDuJHNDcUSvTaCDvqgXvdN9MJtEPElZtgPW/qxDL3/v+Ao0daJwN
	ar7GyChWxrdWEum/AEJnclY6sV6CVy0RhjPJ/rmO8w4d9DAlR935+h62YNn81IB2BqrlwZi36aa9/
	ZOJH7Vl+2OXmMTAoqpANbh9ys7sxkVYkTMJzvtspE/NQdV7RasxoZ3oWJ7EpHj7xDFqvV4FZN5VYi
	6CHLFUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZRn-000000038OR-3NR4;
	Wed, 22 Oct 2025 14:04:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZRl-000000038N4-0Rjf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:04:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B6B61063;
	Wed, 22 Oct 2025 07:04:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF2633F59E;
	Wed, 22 Oct 2025 07:04:10 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:04:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	james.clark@linaro.org
Subject: Re: [PATCH 1/1] coresight: fix issue where coresight component has
 no claimtags
Message-ID: <20251022140409.GR281971@e132581.arm.com>
References: <20251021234520.3355-1-mike.leach@linaro.org>
 <20251021234520.3355-2-mike.leach@linaro.org>
 <20251022092958.GQ281971@e132581.arm.com>
 <CAJ9a7Vi+Oq3Zma0Cs+w8m0kRE0pG6ax3=26EQK=u7d=vQfNFQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vi+Oq3Zma0Cs+w8m0kRE0pG6ax3=26EQK=u7d=vQfNFQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_070413_265658_A432B8C8 
X-CRM114-Status: GOOD (  22.93  )
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

Hi Mike,

On Wed, Oct 22, 2025 at 01:35:46PM +0100, Mike Leach wrote:

[...]

> > - We can add a new flag ("bool claim_impl" in the struct csdev_access),
> >   by default the field will be zero.
> >
> 
> I considered a bool - but the correct place for this would be
> coresight_device - where we keep all the information about the
> hardware features.

Maybe coresight_device is suitable. But this might require to update
furthermore for claim function arguments (e.g., need to pass "csdev"
rather than "csdev_access").

> > - The drivers support claim tags call coresight_clear_self_claim_tag()
> >   in probe (see __catu_probe() as an example), we can call a new
> >   function coresight_init_claim_tag() to replace it, this function sets
> >   "claim_impl" properly and clear the tag if supported.
> >
> 
> I considered moving this initialisation to the common coresight code
> where we create the coresight_device.

Seems to me, this is dangerous. If a module is not CoreSight compliant
and claim registers are absent, when access we will get unknown values
or even cause serious result (external abort or bus lockup).

[...]

> > > +/*
> > > + * Coresight specification defines a maximum of 8 claim tag bits.
> > > + * The precise number is implementation defined, and may be obtained by
> > > + * reading the CLAIMSET register.
> > > + */
> > > +#define CORESIGHT_CLAIM_BITS_MAX_MASK        GENMASK(7, 0)
> > > +#define CORESIGHT_CLAIM_SELF_HOSTED_BIT      BIT(1)
> >
> > Now we only care about the self-host bit. Can reuse existed macros ?
> >
> 
> I feel that drivers should be written to match the specification - the
> macros above are a correct mask value per specification and the
> correct bitfield comparison for the MSBit of the protocol.
> 
> The ones below are a protocol masks field, and a specific protocol
> value that is used in value rather than bit comparisons in the
> claimtag code. I felt it clearer to differentiate between the uses
> when reading the code.

How about change CORESIGHT_CLAIM_EXTERNAL and
CORESIGHT_CLAIM_SELF_HOSTED to MSBit ?

Thanks,
Leo

