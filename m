Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F4DD3B9B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 00:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilMDGW8UNTt8uBA1iI/ZrRFGv0N23URqU+KauXizwwY=; b=TVwitAZtwD23USYjmdAYmrJv7D
	gcemEtMFGqjFDEoDLJovZCOynDIe9lTba8KaZzak9Nv7zxINo1MTnpKGE7q6HYL41PZZq/xh8CZ5K
	YICSkpfmGIMGmmn3bxgA3cOkKRNWi27l54l2eVFQrwgLYZoJreOAiMT3zj1PEB7w3ApdGSvsBHlDG
	CGl3/Nb+oS0XKqWPEgQrro8TtNjfm0cVCYyr5L6Po72n8+BB9UiXZvCr/rexNUlUYrJF5hrd9aesS
	lsr21aBazFgyAzCMTF8aIzTdas4kzR9hBXQ+gvs0kdRlVStJgaAU7WgTJz6ump3ZK3EjDvlRaT1MC
	Z5v0jvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT8IJ-0000000Ewor-1vQX;
	Wed, 10 Dec 2025 00:43:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT8IG-0000000EwoU-1gqc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 00:43:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC21441723;
	Wed, 10 Dec 2025 00:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16E4C4CEF5;
	Wed, 10 Dec 2025 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765327378;
	bh=xOgCRFP+4w6YG6S/mNVatZH0mEsx/CiZR0vSHkmK4ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObvfvVfymT8TZ9aiwyV18VidBzybvNOlNWfWZdtQlEQcb4ETc7caTqzSRPzoojxtK
	 QL0VJCC3ncA8FwUOSsiyod3oPakTuWSyvc9Tbsk6nKEbKPntCO0HydfEWy4wYxU093
	 2ap/GM2bfMfaY+/1lWnOzEjo/i+lHfB4tEmxEYJpPDOutWHrzO3/6yIEXDYeQdYjjZ
	 n2G2LbkdQDCintGnBakeBn5e9av7i6d/jaDIxU4AgbUikSpB3myNVzPNIlCR1wNUxM
	 yEwSQ2G0pIGAeFY6xe870byBEkHwAIZBphL8+1uMmUWHRlu3FOxcuEOMlpwBSKvDS+
	 jox2BIMND2HPQ==
Date: Wed, 10 Dec 2025 09:42:54 +0900
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	joro@8bytes.org, Tomasz Nowicki <tnowicki@google.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
Message-ID: <aTjCDvtANr2WIv3L@google.com>
References: <20251130194506.593700-1-smostafa@google.com>
 <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com>
 <aTgX9qhaLyrQ5iye@google.com>
 <498bbad4-ea64-4a24-a63f-e131d271990a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <498bbad4-ea64-4a24-a63f-e131d271990a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_164300_465465_18DE6A42 
X-CRM114-Status: GOOD (  21.82  )
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

On Tue, Dec 09, 2025 at 01:33:36PM +0000, Robin Murphy wrote:
> On 2025-12-09 12:37 pm, Mostafa Saleh wrote:
> > On Tue, Dec 09, 2025 at 11:34:34AM +0000, Robin Murphy wrote:
> > > On 2025-11-30 7:45 pm, Mostafa Saleh wrote:
> > > > arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
> > > > correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
> > > > as IAS would be 40 bits.
> > > 
> > > But that is only when *using* AArch32 format. The bit in chapter 3.4 of the
> > > SMMU architecture is talking about the maximum IAS that an SMMU
> > > implementation needs to be able to accommodate based on its configuration,
> > > but it does then attempt to clarify that the actual IPA size in use by any
> > > given context should depend on the VMSA format in use:
> > > 
> > > "VMSAv8-32 LPAE always supports an IPA size of 40 bits, whereas VMSAv8-64
> > > and VMSAv9-128 limits the maximum IPA size to the maximum PA size."
> > > 
> > > Rule R_SRKBC in the Arm ARM lays out the exact T0SZ constraints with this
> > > AArch32/AArch64 detail.
> > 
> > I see, thanks a lot for the explanation, I got confused by the this
> > statement:
> > Note: If AArch32 is implemented, IAS == MAX(40, OAS), otherwise IAS == OAS.
> 
> Indeed, that appears confusingly contradictory; I've filed a bug.

I think the spec has always been worded like this. My reading is that, in
isolation:

  - VMSAv8-32 LPAE always uses a 40-bit IAS
  - VMSAv8-64 has IAS == OAS and this can be smaller than 40 bits

so if AArch32 is implemented, we know that the hardware supports at
least a 40-bit IAS and in that case the VMSAv8-64 IAS can be bigger
than the OAS.

That seems consistent to me; where is the contradiction?

Will (jet-lagged so may well be talking rubbish!)

