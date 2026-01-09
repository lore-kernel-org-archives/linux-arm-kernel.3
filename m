Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CB4D26D7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbEfLJ4u1F6rmmqMwJST8J/obe8HukQ7PMnp0NdA1o0=; b=dWw4yW8edzOhI1aOe1XnK7XcJ+
	TfNhBht21/9IA9/1urCv78FsHMLrTgBu9WJkB8p22SpKQV2zvXp8T4yMIcnpyBAN1YfoyCJjc3f3N
	LqK8zfGQD307mFm6RvppK57UtMK0q+IlrmIMxiozdz90QsrUM8hF3QVzX+sclaoJEvdqfga6/CHV7
	sOr5MCLe5HMrMr3yXx51ngre70KMl/gEfXvCaht9S4HNzOY2r8yp5MjaOlpy0NZmLhEvr0Ri5W8Bm
	f1Hf4Ibb/6WSBcea4+LSIzIKi71IILAlaVuFUZ+7f2wZXWZpXp2EhOcWAUNbqhnEWQ2wuGS051Yuu
	WQGLFHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGai-00000002qmp-2ScO;
	Fri, 09 Jan 2026 17:48:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGah-00000002qmh-3m4v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:48:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0E97600B0;
	Fri,  9 Jan 2026 17:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338CCC4CEF1;
	Fri,  9 Jan 2026 17:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767980882;
	bh=3QWiObunfis5djNAZb+wYVWjctgr/CRj7eFG13KqXOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOe29o4myh9rammqInR8XR907tp2YDqfTVO0BMC2z+tLY1hPrk5Yf0UQVMkt/PWDn
	 sHYR/PYrw1n2J+3XqK74pSWke2E1J9iIY8Lrp2NsVroVYE2yJ/0m41EmMYZ4TToQIU
	 kW96DoZMpyo5kHyQYFvE/r6RjJ0hCKPBCDT/03WXoiiZqzlBmDa9O7uMa1aSelA7VS
	 9R4AtC6J4zXMFv8XcN6sbRGMpM1azZeG5xJryHYpTScU+WsH63ZhlEC+NWxW0s3NpE
	 Q4KRhwYT02Yuuxh4XhywQplK59m9sOKBGBKMBNqammRn+h8/YtJ2GgrCDAoM4jBLXQ
	 dTTgR/dephUVw==
Date: Fri, 9 Jan 2026 17:47:56 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 20/30] KVM: arm64: Introduce hypercall to force reclaim
 of a protected page
Message-ID: <aWE_TGDm_makBPhi@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-21-will@kernel.org>
 <avfs64mpioh4ckdo3gokndinpjdrgfzz2pjhkyyh65v6spuai3@nz4zih4rbv6m>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avfs64mpioh4ckdo3gokndinpjdrgfzz2pjhkyyh65v6spuai3@nz4zih4rbv6m>
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

On Tue, Jan 06, 2026 at 03:44:06PM +0000, Quentin Perret wrote:
> > +static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
> > +				       u64 *gfn)
> > +{
> > +	pkvm_handle_t handle;
> > +	u64 meta;
> > +
> > +	if (kvm_pte_valid(pte))
> > +		return -EINVAL;
> 
> Nit:
> 
> I can't think of any cases where we'd end up returning -EINVAL here that
> isn't indicative of a major problem (e.g taking a stage-2 perm fault we
> don't expect) given that we've extensively checked the state of the page
> already. Upgrade to WARN()? It's fatal, but the system is unlikely to
> make much more progress if we return cleanly anyways, so we might as
> well make it obvious where things went wrong.

Good spot. We already confirmed the NOPAGE state, so a WARN() if the pte
is valid makes perfect sense to me.

Will

