Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8079C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 11:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+C+oKW8vl0hrKNajRnw5L8GqZ+JbRx4hfaPeZn1Iws=; b=wxVmYmXJfNZRa22yZW5XEhsz3D
	rVRjI4y8A4wdASYytxiYCzh2aKtOPwbe/+VLjmbrtkN9bhFsvp93spCnUAQYPWDickD6Dam2rIbJI
	KkVdGbF5R+8AOCk0q7I8bfS/HGhP/npKzBlAqdH4xqmirb1GE8AP/DplJpJIOltvWWa2kdy0Msc1g
	OcSJdgwxo3OzFDbmS4lOj1Y56w8h3RNg0z3egSktAgFYzNBsD+c2Au8gHyeDCHZGmeDhdbamPStmb
	bY8ZHI/33S1PzVHMKT8iQG/S/sgxIeEMBAeREG893zOkeCHhVyyQnSxWtDPgHlymCXsYAb2SjWGhw
	/I8dC7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBSu-00000002Kpl-3PF7;
	Wed, 26 Aug 2026 11:06:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBSp-00000002Kp5-46PL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 11:06:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177281713;
	Wed, 26 Aug 2026 04:06:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A5803F66F;
	Wed, 26 Aug 2026 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787742394; bh=rqhiwOhjqHsJII2jfGpA8O9vesBfzfteSUcW8kNSejQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYTgWaAukS40EsG28i19V4Mr8mkXPq1ub6mJ7ZeXr9d/byyH7IhKk/sqxMicqKGJ3
	 dlUSDaa9qONKGJiG61htps7UUt8O3F0vBHH5r0QZBJTo8qL8OpssYjEsZHyvNYLHi3
	 OZMCg8Hj++jEluBxHl62WBVm4+Z56dgoylrO9/54=
Date: Wed, 26 Aug 2026 12:06:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <ao7Isu9sxUEeECOZ@arm.com>
References: <20260824184155.2644646-1-fuad.tabba@linux.dev>
 <aoypji6EJ8zToWvh@arm.com>
 <CA+EHjTwueqEAVq-7_ioRN+1h3LNPAqHX3rTqbXODViJJM-D_pQ@mail.gmail.com>
 <ao2jNDv8tOjnimEH@willie-the-truck>
 <CA+EHjTx93ERXZV1visdfBOGtH7wHff6TAoeJe+pNtikPrRp8Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx93ERXZV1visdfBOGtH7wHff6TAoeJe+pNtikPrRp8Qw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_040640_252907_EFDF6639 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, Aug 25, 2026 at 03:46:15PM +0100, Fuad Tabba wrote:
> On Tue, 25 Aug 2026 at 15:14, Will Deacon <will@kernel.org> wrote:
> ...
> > > > If you are worried about additional trapping of the MRS, we should go
> > > > for Will's improvement to always read the cached values in
> > > > __read_sysreg_by_encoding().
> > >
> > > Not worried :) __cpuinfo_store_cpu() has already read ID_AA64PFR1_EL1
> > > a few lines up.
> >
> > But if you go with __read_sysreg_by_encoding() then you'd still be
> > reading it (and trapping) twice, no?
> 
> It would, and I'm fine with that on a CPU bring-up path.

For backports, yes. Going forward, I like Will's idea of reading the
cached value in __read_sysreg_by_encoding().

-- 
Catalin

