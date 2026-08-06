Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02965C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SVxBCorFWnwDAuAecXmW1rPgG8B8npbUR3574wL1DE=; b=SsJMnAYHEGfOSHU20EaG5C8DYd
	xNG1IjraoD/G+wjW6pf6HHsxx8iX7/tTvAE1K6MeTRrtuNQOd9M+xTv7DkecMpf08+8iPqgigImcR
	ONoaJNJPrmKvg5lZBSfcz6JPC/uQSmf9/OrfgM85G4JNUlqw0FS57JLopXcjl4B2r4PctunekItJ8
	F3V3zJ+XPglDaokQkjRMfs6EqKMl8pdR5aSzWNtGyT+Sxp+wyn3dx4EvxVGAdJOU04va1d2HdOIlC
	hS4a6oe2V/Sv8035PI2xOCnHetHYrP0b8p4h2Unq8syn9wyuUGgbCQFEd3zz6BP8litRS2VmrOMwn
	Sya0afEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpwm-00000004vFz-3JPe;
	Thu, 06 Aug 2026 04:43:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrpwm-00000004vFf-144t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 04:43:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D97960A64;
	Thu,  6 Aug 2026 04:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297D71F00A3A;
	Thu,  6 Aug 2026 04:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785991391;
	bh=4SVxBCorFWnwDAuAecXmW1rPgG8B8npbUR3574wL1DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8WZ96F5i/eogrhOVIrrB+nQUrCTef7IwXFM+DwBzsVBrp60Syip/QwKNOlf2Bsuc
	 KDKfq+OmfJQs8ps7Is1NxOtxu57OVphU0FVT3JGqUNomcrF9opEwTr+7isWZwyhmE3
	 ckIXShRJLj5DKD3S/en55L4sjLJ55/bcvQusw9HLe+HQoqZ0m9MdFNJd64uLXz3tlt
	 0+f7CIXkeD82WO/0uBwduwoVB5YAGvKszlmdE53BEfYbodUEXxJbpLuYKNcyHYHInF
	 k+ELTE6bOam1d0Loz5RP/BOvSRwroZGXyN8dDJFJ3ohG8ApMixA2ebMn6z80WZQ18+
	 T8RazoXxNRouQ==
Date: Wed, 5 Aug 2026 21:43:09 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: arm64: vgic-its: Don't dereference a NULL
 collection on ITT save
Message-ID: <anQQ3dcbk72N1g1a@kernel.org>
References: <20260805093828.3626610-1-fuad.tabba@linux.dev>
 <20260805093828.3626610-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805093828.3626610-2-fuad.tabba@linux.dev>
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

Hi Fuad,

Thanks for fixing this.

On Wed, Aug 05, 2026 at 10:38:26AM +0100, Fuad Tabba wrote:
> @@ -2119,6 +2119,14 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
>  	u32 next_offset;
>  	u64 val;
>  
> +	/*
> +	 * MAPC with V=0 keeps the ITEs mapped but drops their collection,
> +	 * and with it the ICID. Save a zeroed entry, which the restore path
> +	 * reads back as invalid.
> +	 */
> +	if (!ite->collection)
> +		return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
> +

Writing a zero entry results in a suboptimal scan on the target,
compute_next_eventid_offset() should just skip ITEs that are known
invalid. Or better yet, we should just make the ITS emulation consistent
with the migration behavior and delete ITEs when their corresponding
collection is deleted. As you note, this is UNPRED after all :)

Thanks,
Oliver

