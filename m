Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223D7D3E785
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 02:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXYY3zsf55QJs2o4RxpbIB3RgrL9Qx0QlRrrCQo3lV4=; b=RgemWYu2c6eygkgAVloS/JzeEn
	swxwJkajdnU3DwGxb3+U8Ad3CCMiANF73L5LS7MOBJ/hCpX+vvbrUngGexAHhCinnWJmuxNCkiJsa
	J3vC1hF4AgRxROb25zk6r6zTATgZMVHSLTWi6QX8sOAvIfkjylon+xykKkkQW9/3/RJ+xy1hW5yy/
	X+WvSP21r/k5qr8PN1ue1gntKK3gr4VIbJzqpMM3o6yORYMR4ylzEfCEVv0xRpFsWtAN8pPZkTvNH
	R27TtMsIWrp4GSIpBqu9AXGHtgKeeL1HST83PX8kYFPFHS+7KDZAiLjPUKyfeIHqxtA7b+aIUbENU
	3HrTYhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTW79-0000000G77p-2nJs;
	Thu, 11 Dec 2025 02:09:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTW78-0000000G77j-3tJ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 02:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DE5560010;
	Thu, 11 Dec 2025 02:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74F2C4CEF1;
	Thu, 11 Dec 2025 02:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765418945;
	bh=egDUsmzFUgT0cMVS1Ed4oetYkzW+oJD9H0RGli/a7nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLvVhuH7lME5566L5dfEQTVjdYBofRfisuTEepXXp24SoKCHnRnL523hjJteQqzrn
	 REe4/8OceDuqZGT0dY+P3o6NIwoaUJKTU7fz+Qo14LMI+Wpkj6IFKYHo56atfhEhWh
	 FJulC2HzIlijJuCgRAE7CeHWmx3urqRVO7OPyi7CdhtHsAEv/J6yNZl2MC5tycWH0n
	 qetyBmdeoVAnP42+hvJ5V+lqnpKf8zRvdr2gjSkN8L0siDma+RbzrVYV/Mh/sYXCnw
	 GmX1JkWSnaAo//u7HSemUaEbRcDz2fYN81KQ3LLghpvWMQSH88lI3NGyl9+dHwf+IZ
	 wDkwiNCwv6yEQ==
Date: Thu, 11 Dec 2025 11:09:01 +0900
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	joro@8bytes.org, Tomasz Nowicki <tnowicki@google.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
Message-ID: <aTonvd9_4hY4-CpS@google.com>
References: <20251130194506.593700-1-smostafa@google.com>
 <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com>
 <aTgX9qhaLyrQ5iye@google.com>
 <498bbad4-ea64-4a24-a63f-e131d271990a@arm.com>
 <aTjCDvtANr2WIv3L@google.com>
 <8e058f60-60da-47c2-9947-2ea26cca1639@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e058f60-60da-47c2-9947-2ea26cca1639@arm.com>
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

On Wed, Dec 10, 2025 at 12:06:10PM +0000, Robin Murphy wrote:
> On 2025-12-10 12:42 am, Will Deacon wrote:
> > On Tue, Dec 09, 2025 at 01:33:36PM +0000, Robin Murphy wrote:
> > > On 2025-12-09 12:37 pm, Mostafa Saleh wrote:
> > > > On Tue, Dec 09, 2025 at 11:34:34AM +0000, Robin Murphy wrote:
> > > > > On 2025-11-30 7:45 pm, Mostafa Saleh wrote:
> > > > > > arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
> > > > > > correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
> > > > > > as IAS would be 40 bits.
> > > > > 
> > > > > But that is only when *using* AArch32 format. The bit in chapter 3.4 of the
> > > > > SMMU architecture is talking about the maximum IAS that an SMMU
> > > > > implementation needs to be able to accommodate based on its configuration,
> > > > > but it does then attempt to clarify that the actual IPA size in use by any
> > > > > given context should depend on the VMSA format in use:
> > > > > 
> > > > > "VMSAv8-32 LPAE always supports an IPA size of 40 bits, whereas VMSAv8-64
> > > > > and VMSAv9-128 limits the maximum IPA size to the maximum PA size."
> > > > > 
> > > > > Rule R_SRKBC in the Arm ARM lays out the exact T0SZ constraints with this
> > > > > AArch32/AArch64 detail.
> > > > 
> > > > I see, thanks a lot for the explanation, I got confused by the this
> > > > statement:
> > > > Note: If AArch32 is implemented, IAS == MAX(40, OAS), otherwise IAS == OAS.
> > > 
> > > Indeed, that appears confusingly contradictory; I've filed a bug.
> > 
> > I think the spec has always been worded like this. My reading is that, in
> > isolation:
> > 
> >    - VMSAv8-32 LPAE always uses a 40-bit IAS
> >    - VMSAv8-64 has IAS == OAS and this can be smaller than 40 bits
> > 
> > so if AArch32 is implemented, we know that the hardware supports at
> > least a 40-bit IAS and in that case the VMSAv8-64 IAS can be bigger
> > than the OAS.
> 
> No, the VMSAv8-64 IAS can never be bigger than OAS, as that would violate
> VMSA (see rules R_DTLMN and R_SRKBC). The SMMU spec seems mostly fixated on
> the notional maximum IAS that an SMMU must accommodate in general across all
> supported formats; the limitations of using any particular format must still
> apply though (similarly, the fact that AArch32 has a fixed 40-bit output
> doesn't mean that OAS and S2PS don't still matter for AArch64 format.)

A VMSAv8-32 stage-1 could still input a 40-bit IAS into a VMSAv8-64
stage-2 when the OAS < 40-bit though, right? If that's the only case
where this happens, then I agree we should ditch the complexity from the
driver on the grounds that we don't ever use the 32-bit formats.

Will

