Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2416DCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaMShUTRriq2NwdLSX1GB9WCdbB2Myl40xA1sGisL+I=; b=QFJ7EqupSDOYY65P26j4sp8rJf
	GChhEkdntOa9FSKA96XUiq/um/+StZohqmw7CRM5kUFz4VCQm1HyuJEySyPPM9hMYHFFQSpiaf9aA
	woTWQNFUo1GSQW/bzvouCDJp/hX4FpfmUhopt8Ws52bevgMigmkjTu4vKWIKKSAN5yGrggGWlMx7p
	MI5BM3I4XY/dGaydEr1ZiF4F+Y8zRIUk7Jw/DZuc3e0acq8wBM3/6mUf68YrlrtwXns7N/8ZGuPJd
	0UrobtsLWTsK+DHaT83EHKRMAAo9WtW/g0fu68aaQ7vtprvgsxqVzfAU49st7/wBgYQ2/dwVus68N
	9ogOI6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaAi-00000000FFk-2JJH;
	Mon, 25 May 2026 18:37:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaAf-00000000FEy-47wA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:37:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFB931762;
	Mon, 25 May 2026 11:36:52 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F36053F7D8;
	Mon, 25 May 2026 11:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779734217; bh=ODB6xGlrwcnKH1QF6A1ykosIkQ2EzhR13IqQJwbKqp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+preeWitGIDjHGugeq97y0YaB17KXp9ePoo2igRjc9TlECLgPrdtJTu55RbnmYJN
	 HArcqH8mhQ8Bfz8B/KwtuRolhz2uxRv34ZXNMWEG/ytMfMrWr6apqsZXdf4FcdNYW1
	 xlUYs2+tyskkO6qGxI9c6uCJWOmyf72vGPTTDEr8=
Date: Mon, 25 May 2026 19:36:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Preserve all guest ZCR_EL2.LEN values
Message-ID: <ahSWwl-uCv4ZW-nE@J2N7QTR9R3>
References: <20260522-kvm-arm64-fix-zcr-len-nv-v1-1-ec254e9078cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-kvm-arm64-fix-zcr-len-nv-v1-1-ec254e9078cf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_113702_188263_EA427AC4 
X-CRM114-Status: GOOD (  21.65  )
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

On Fri, May 22, 2026 at 07:00:04PM +0100, Mark Brown wrote:
> Since b3d29a823099 ("KVM: arm64: nv: Handle ZCR_EL2 traps") when guests
> write to ZCR_EL2 we have clamped the value of ZCR_EL2.LEN to be at most
> that configuring the maximum guest VL. This is not the behaviour the
> architecture documents for ZCR_EL2.LEN, the expectation is that all bits
> will be read as written. Further, writing values larger than the largest
> available vector length is part of the documented procedure for enumerating
> the supported vector lengths so we expect to see this happen in practice.
> 
> The reasoning for the current behaviour is not specifically articulated, my
> best guess is that it is intended to ensure that the guest can not see an
> effective VL greater than the maximum that has been configured. This can
> instead be achieved by configuring ZCR_EL2 when loading guest state:
> 
>  - When running at EL0 or EL1 configure ZCR_EL2.LEN to the minimum of the
>    guest ZCR_EL2.LEN and vcpu_sve_max_vq(vcpu)-1.
>  - When running at EL2 configure the maximum VL for the guest in
>    ZCR_EL2.LEN like we do for non-nested guests and load the guest
>    ZCR_EL2 into ZCR_EL1.
> 
> This will ensure that the guest sees both the ZCR_EL2.LEN value which it
> wrote and the effective VL that resulting from the values it has configured
> in ZCR_ELx.LEN.
> 
> Currently all other bits in ZCR_EL2 are either RES0 or RAZ/WI, values
> written are sanitised based on this.
> 
> Fixes: b3d29a823099 ("KVM: arm64: nv: Handle ZCR_EL2 traps")
> Signed-off-by: Mark Brown <broonie@kernel.org>

For context, I mentioned this potential problem to Mark, and described
this possible solution at:

  https://lore.kernel.org/linux-arm-kernel/af4bWxiOogfPz_dp@J2N7QTR9R3/

I said:

  AFAICT, none of the values for the SMCR_ELx.LEN and ZCR_ELx.LEN fields
  are reserved or unallocated. Thus all the bits of those fields should
  be stateful, and a read should observe the last value written,
  regardless of the effective value of the field.

  [...]

  Either what we're doing is wrong, or the architcture requires a
  clarification to say that values corresponding to unimplmented vector
  lengths are reserved.

Have we sought feedback from architects? While I said "*or* the
architcture requires a clarification", I think it should be clarified
more explicitly either way given that the pattern is unusual.

Given this is particularly subtle, please keep me in the loop when
speaking with architects about this.

Mark.

