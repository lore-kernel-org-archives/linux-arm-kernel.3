Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6980C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 05:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLEo/yuN0N0SqYGbFne79fFwKE8oPU75OaclNkoWfjM=; b=x6Dc2pzr/KfFALe9ZuoeHIpdsr
	UNoEmmrtAS5zh+UdG5Y+92LVV+HOZ9ahgj2ccjhetN/rSCQCQkrgB7Qx2RT8hSAl6PqvYJo7rmt75
	wtQItyIQQnHo7GEEgD+5ojSv/kHUrQzfEwc24kch+UxRtU7cuUnIt9B3mPYsXH27sK8nwFaCxZ8wj
	dgqgPzgTQP+IexGTEeWKeZ9IOwGc16pJACbYzYDSaOjQmIVbMH/Rr5iCfVEYJoEiSMVkOPDxafkai
	45GyUcM7Q0us6J/QDeywG89wWi/uRSKUVPkVqJkmaklp0ZAm6fQns0MAbNO+tQjW90DQNj5Y+wJ61
	JLFuONYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsxgo-0000000D6Qt-2GR5;
	Fri, 14 Mar 2025 05:34:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsxf8-0000000D6K9-2cGB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 05:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E68BA464EE;
	Fri, 14 Mar 2025 05:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9B6C4CEE3;
	Fri, 14 Mar 2025 05:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741930368;
	bh=Gqip2u1dKZM5ihrffxMctAlWaVDbG4jUMPKuit18Zpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RfQoWP7UNXyhVa14p9u5HeB1t3Ss4Pk8U9FROmk/VakXRN9O8U43W9QH75Ya2wT0P
	 oecQf01nK6rnaGaQBWjE1efeNDTDt4CZkqvC+mG6/7Jwo+l78UF6rMpxXT11zZYTZP
	 wSz3x4mxwDPsCW/CP1BR6Xhh9H/pvZdF/Tcpkl4Q=
Date: Fri, 14 Mar 2025 06:32:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6.12 3/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <2025031427-yiddish-unrented-2bc2@gregkh>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
 <20250314-stable-sve-6-12-v1-3-ddc16609d9ba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-stable-sve-6-12-v1-3-ddc16609d9ba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_223250_743598_241556EB 
X-CRM114-Status: GOOD (  14.07  )
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

On Fri, Mar 14, 2025 at 12:35:15AM +0000, Mark Brown wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> Now that the host eagerly saves its own FPSIMD/SVE/SME state,
> non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
> and the code to do this is never used. Protected KVM still needs to
> save/restore the host FPSIMD/SVE state to avoid leaking guest state to
> the host (and to avoid revealing to the host whether the guest used
> FPSIMD/SVE/SME), and that code needs to be retained.
> 
> Remove the unused code and data structures.
> 
> To avoid the need for a stub copy of kvm_hyp_save_fpsimd_host() in the
> VHE hyp code, the nVHE/hVHE version is moved into the shared switch
> header, where it is only invoked when KVM is in protected mode.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Tested-by: Mark Brown <broonie@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> Link: https://lore.kernel.org/r/20250210195226.1215254-3-mark.rutland@arm.com
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

What is the upstream git id for this on?

thanks,

greg k-h

