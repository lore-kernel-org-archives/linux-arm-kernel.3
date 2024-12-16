Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC5CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXY3tesl8YExTBoRcw67hgoxH8ssmnuEEg6P9MtnPaI=; b=RNbGAYI0N5vE/U1hmSGB4k2mfD
	y2OiOmbi1o3eeBXsrfjwd5GEcjzij+TVViP6LrOLDHEX6d562mjgGgl+0A6Y+5K/rqtf7I6dXRQ0R
	hDLW+4yixByEN+B2CiMULN7t9sm2/4h01vglECGpOdWd8kLnjkOmwndmw82WvkuG1Ol/QepaJZfEO
	80L3ZPBj+0N5Qncs5Ft8ur03eUH7mxYFQ84whT9dRSyzQPRb/fTLiKyCRvWTFQGE3jei+OU1xy0N7
	citK9aTSjke35hCZR8epEONQbk1D1rw2IIvtIEgHrSLKKCXrn8jtAKnUmxpyXsEMfErRkmAk3zMt5
	EB1FuXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCmL-0000000AMoo-4BTE;
	Mon, 16 Dec 2024 15:13:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNClF-0000000AMeD-3XAd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:11:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A9CB113E;
	Mon, 16 Dec 2024 07:12:21 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C4613F528;
	Mon, 16 Dec 2024 07:11:52 -0800 (PST)
Date: Mon, 16 Dec 2024 15:11:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <Z2BDMpPYRFfio8lr@J2N7QTR9R3.cambridge.arm.com>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
 <709a0e75-0d0c-4bff-b9fd-3bbb55c97bd5@sirena.org.uk>
 <Z2Agntn52mY5bSTp@J2N7QTR9R3>
 <855dbb91-db37-4178-bd0b-511994d3aef7@sirena.org.uk>
 <Z2A502_EpqvLYN8g@J2N7QTR9R3.cambridge.arm.com>
 <864j33sn60.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864j33sn60.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_071153_923873_AA7FF804 
X-CRM114-Status: GOOD (  30.46  )
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

On Mon, Dec 16, 2024 at 02:44:07PM +0000, Marc Zyngier wrote:
> On Mon, 16 Dec 2024 14:31:47 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > On Mon, Dec 16, 2024 at 01:23:55PM +0000, Mark Brown wrote:
> > > On Mon, Dec 16, 2024 at 12:44:14PM +0000, Mark Rutland wrote:
> > > 
> > > > ... didn't matter either way, and using '&boot_cpu_data' was intended to
> > > > make it clear that the features were based on the boot CPU's info, even
> > > > if you just grepped for that and didn't see the surrounding context.
> > > 
> > > Right, that was my best guess as to what was supposed to be going on
> > > but it wasn't super clear.  The code could use some more comments.
> > > 
> > > > I think the real fix here is to move the reading back into
> > > > __cpuinfo_store_cpu(), but to have an explicit check that SME has been
> > > > disabled on the commandline, with a comment explaining that this is a
> > > > bodge for broken FW which traps the SME ID regs.
> > > 
> > > That should be doable.
> > > 
> > > There's a few other similar ID registers (eg, we already read GMID_EL1
> > > and MPAMIDR_EL1) make me a bit nervous that we might need to generalise
> > > it a bit, but we can deal with that if it comes up.  Even for SME the
> > > disable was added speculatively, the factors that made this come up for
> > > SVE are less likely to be an issue with SME.
> > 
> > FWIW, I had a quick go (with only the SME case), and I think the shape
> > that we want is roughly as below, which I think is easy to generalise to
> > those other cases.
> > 
> > MarcZ, thoughts?
> > 
> > Mark.

[... dodgy patch was here ...]

> I don't think blindly applying the override at this stage is a good
> thing. Specially not the whole register, and definitely not
> non-disabling values.
> 
> It needs to be done on a per feature basis, and only to disable
> things.
> 
> See the hack I posted for the things I think need checking.

Understood; sorry for the noise -- we raced when replying and I only
spotted your reply after sending this. I think I'm more in favour of the
revert option now; I've repled with more details at:

  https://lore.kernel.org/linux-arm-kernel/Z2BCI61c9QWG7mMB@J2N7QTR9R3.cambridge.arm.com/T/#m8d6ace8d6201591ca72d51cf14c4a605e7d98a88

Mark.

