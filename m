Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A94CC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6flG7QTM40WRBnQasBWOXHpa0T28XTCqXZkYS2D79xk=; b=WXuzey9vA/bpNs3Mc4Q6EgXBha
	Ahqb928KRntQ6wB0qohLGnyIMddkXw2aC57axAKxkYt7Xp1IpFOvMR6uNIcQ3juiu2r5YlKiHqde4
	KTSdD+OEH7C0ddCQ7LeoRpTUMSKM9+/ctOmpBN+/GAFgG4l2hldQUWTAn9jUpjrrt9BW5CgBavj1x
	H5O+U/Z0umpBX4PPbld4E8FxjoJACLS1idD+EZJHeVWkxgUce+mdpMRE6LyC3fZ/FT/WFVaaexp9K
	a7DJ975UpSo0HVr1WdUbFc8wAJLvfrfWUkPXzTLgWK+po+p3Ba5IixTMIDG4xgrob2zeun9rFfA/n
	1eq0po1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6Ee-0000000EQlt-3O6i;
	Fri, 14 Mar 2025 14:42:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6Cy-0000000EQRO-1Yn3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 14:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AD445C473A;
	Fri, 14 Mar 2025 14:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C2CC4CEE3;
	Fri, 14 Mar 2025 14:40:16 +0000 (UTC)
Date: Fri, 14 Mar 2025 14:40:13 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6.12 3/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <Z9Q_zW_mM-v2iPHC@arm.com>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
 <20250314-stable-sve-6-12-v1-3-ddc16609d9ba@kernel.org>
 <2025031427-yiddish-unrented-2bc2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025031427-yiddish-unrented-2bc2@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_074020_462733_2A1C0913 
X-CRM114-Status: GOOD (  16.92  )
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

On Fri, Mar 14, 2025 at 06:32:45AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 14, 2025 at 12:35:15AM +0000, Mark Brown wrote:
> > From: Mark Rutland <mark.rutland@arm.com>
> > 
> > Now that the host eagerly saves its own FPSIMD/SVE/SME state,
> > non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
> > and the code to do this is never used. Protected KVM still needs to
> > save/restore the host FPSIMD/SVE state to avoid leaking guest state to
> > the host (and to avoid revealing to the host whether the guest used
> > FPSIMD/SVE/SME), and that code needs to be retained.
> > 
> > Remove the unused code and data structures.
> > 
> > To avoid the need for a stub copy of kvm_hyp_save_fpsimd_host() in the
> > VHE hyp code, the nVHE/hVHE version is moved into the shared switch
> > header, where it is only invoked when KVM is in protected mode.
> > 
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Tested-by: Mark Brown <broonie@kernel.org>
> > Acked-by: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Fuad Tabba <tabba@google.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> > Link: https://lore.kernel.org/r/20250210195226.1215254-3-mark.rutland@arm.com
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> > ---
> 
> What is the upstream git id for this on?

It seems to be 8eca7f6d5100 ("KVM: arm64: Remove host FPSIMD saving for
non-protected KVM").

-- 
Catalin

