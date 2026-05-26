Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6B7CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snO0GPCcpAIumJIbbpDl03xp41IGS0xxxbEpNFTS3AA=; b=O5sAQ6McrDaVJv1otsN/xcAFJJ
	icZYv3EGVwU7ysyYSrQGHxc0MlQX47F+thEcvoII3+eOqv9YQVah2fJGUv2ASypgDItV28Sf4Njt+
	co5Wt3ffXSyMGj71fExLBY1+1Vp4Ed46mWGiuouSI7Nnh6fxCs0RSLJZTyABThOBCbS/BJ4s8k+Ya
	botSg1tmTEV2CSQVNjbUr68oi90zMLQbW10L29fLFmoq90L7DSac7wfKmeaQvIiS6fJDqPHhHvYac
	1+Izd6dK1ooUE0t7NyhHgVA/YGK1d2QlKt2Oy0g6z7WxYKo8EABsi9NfKW0lQgV7Jld2KBLdPBBRF
	NiiwPH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqVR-00000001s33-0mKb;
	Tue, 26 May 2026 12:03:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqVO-00000001s2b-2T7o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:03:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5B89169C;
	Tue, 26 May 2026 05:03:23 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF7E43F7B4;
	Tue, 26 May 2026 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779797008; bh=FlkpAY2X0Yf6Pfxqf2EFeAIJYm7FxKNht2VVBPprLyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JocWluzfka/6ENtOHIR4dFPNqvNa8CNewaA4hKshW5Dw0uZjcQsvUUIhXmf4AIjaO
	 0pGRR2jmTc0GcfqCJTAs9/uh/FJ1Evnjc8x+7gw5zRF5zyqTbGZZ8/7HJfVRkQyGXE
	 XdHOXd086EHrfmvunqN2WcSHj0m9rz1IbmlbrMtg=
Date: Tue, 26 May 2026 13:03:19 +0100
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
Message-ID: <ahWMByoIme6_oECX@J2N7QTR9R3>
References: <20260522-kvm-arm64-fix-zcr-len-nv-v1-1-ec254e9078cf@kernel.org>
 <ahSWwl-uCv4ZW-nE@J2N7QTR9R3>
 <b4fdceb6-5fa7-4829-a60e-6f80f47f032a@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4fdceb6-5fa7-4829-a60e-6f80f47f032a@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_050330_721181_0C4B9C39 
X-CRM114-Status: GOOD (  27.60  )
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

On Tue, May 26, 2026 at 11:19:38AM +0100, Mark Brown wrote:
> On Mon, May 25, 2026 at 07:36:50PM +0100, Mark Rutland wrote:
> > On Fri, May 22, 2026 at 07:00:04PM +0100, Mark Brown wrote:
> 
> > > Since b3d29a823099 ("KVM: arm64: nv: Handle ZCR_EL2 traps") when guests
> > > write to ZCR_EL2 we have clamped the value of ZCR_EL2.LEN to be at most
> > > that configuring the maximum guest VL. This is not the behaviour the
> 
> ...
> 
> > Have we sought feedback from architects? While I said "*or* the
> > architcture requires a clarification", I think it should be clarified
> > more explicitly either way given that the pattern is unusual.

The part I asked for clarification on was:

  AFAICT, none of the values for the SMCR_ELx.LEN and ZCR_ELx.LEN fields
  are reserved or unallocated. Thus all the bits of those fields should
  be stateful, and a read should observe the last value written,
  regardless of the effective value of the field.

  [...]

  Either what we're doing is wrong, or the architcture requires a
  clarification to say that values corresponding to unimplmented vector
  lengths are reserved.

> > Given this is particularly subtle, please keep me in the loop when
> > speaking with architects about this.
> 
> TBH it didn't strike me as subtle, I don't see anything in the
> architecture which would lead me to expect the current behaviour. 

The point I was trying to get across is that I don't think this is
specified clearly enough, and I think we need to get this clarified.

There's a general principle regarding reserved values. See K1.2.19
("Reserved values in System and memory-mapped registers and translation
table entries"), and specifically note "reserved values of fields".

There's no explicit statement either way regarding the values for
ZCR_ELx.LEN and SMCR_ELx.LEN. The statement regarding the selection of
the effective vector length implies *some* constraints, but
(explicitly!) doesn't specify the behaviour for direct reads.

It's possible for a reader to come to one of the following conclusions:

(a) Any value written to the LEN field must be preserved exactly. In all
    cases a read must observe the last value written.

(b) Some values written to the LEN field are reserved, and don't need to
    be preserved exactly.

    For example, since the only architecturally-defined VLs are
    powers-of-two, the only "legitimate" values are: 0b0000, 0b0001,
    0b0011, 0b0111, 0b1111. Hence any written value could be collapsed
    to that set.

(c) Some values written to the LEN field are reserved, and can be
    replaced with *any* value.

    See the statement at the end of K1.2.19 regarding subsequent reads
    returning an UNKNOWN value.

While one simple reading is that all values must be preserved exactly, I
don't think this watertight, and I think while some people will take
reading (a), others will take (b) or (c). I should have spelled that out
more clearly in my initial mail, sorry.

> The psudocode all just has direct assignments for the write

The pseudocode doesn't capture the detail I've described above.

> and there's language in the ARM (eg, in the ZCR_EL2 description)
> saying "for all purposes other than returning the result of a direct
> read of ZCR_EL2" which seems specifically intended to cover there
> being a divergence between the written and effective values, though I
> guess it doesn't explicitly mention writes in the text.  

That permits a divergence, but does not define the boundary conditions
for what a direct read can observe.

Mark.

