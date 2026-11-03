Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26406608361A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zM0fxoy8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqMVTiQ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R5KebMrP30ezLBHH/l16ZB4uhpyuj80SZyzpDuBB8fQ=; b=zM0fxoy8jqKHRZ9tWR7MIaW0c/
	34Gw2NEx2KCFJnRiYkUZ00cNc8sWtkSjEViGhFDYLQ65LbxBT81Dudyl6N9FrG5spgF8X53bh9nhE
	8WYcOE/i0RSEPdjlTjO0VecJEhqXVcPWfo9X3/vZ2auCfCe5aXDUMH2HkyYPTUmB83jkkx9yNm2sv
	hdz8jz3GbdTkHK3ZDloN8qp3ukz2hsLvK3rvfV4zCQv1CoSxPGVVjBXAVQQNoPmXHin6NSr7e2xvb
	0+OjhX37cV3jG9BEz9KZt+OIKPw3BFXCYcjGd6DMvj1TvYsH9bgkVRXVMlLU89+jk9pB+XcCodSGN
	SgVjyv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFxg-00000002oxA-1BUb;
	Tue, 03 Nov 2026 14:58:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFxf-00000002owq-03YD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:58:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DF6F601EF;
	Tue,  3 Nov 2026 14:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6DC1F000C1;
	Tue,  3 Nov 2026 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717885;
	bh=R5KebMrP30ezLBHH/l16ZB4uhpyuj80SZyzpDuBB8fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bqMVTiQ11kQrPh08m6vf2W/1y/Yq+ERpo2flIy7syEbmDuUsIXnYa9MREKvCGHR1y
	 BETlCNZa6S8o9/qfiN3BFUi9RlgM73cRhKpnXJ3OFF/ThgHSvzeF3eFxDGKrDrfsn6
	 7RvCBcadGgvLGIEUtjuHyH5I42vY+yh2Fp4AOJ8TdWDOIhkROEepmHUX1nzbxb8LqF
	 2lQADF8kccluSgYDyd6F4rsIkMdVkxesdZNrIJO1MpaOKxylQp2QjOhg+7rz6E6aTA
	 KJjkpxUwHLkyZbl3ErtA2eXJarRes0907Tuh0ujthctFsMmfIdAMClA1nqDwcuDbwp
	 TR3Oxq2qXevMA==
Date: Tue, 3 Nov 2026 15:58:00 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 05/10] irqchip/gic-v5: Use linear DT and ITT when L2
 covers all IDs
Message-ID: <aun2eFXPsccWexvR@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-5-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-5-743b61626fc5@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:32:58PM +0000, Sascha Bischoff wrote:
> The DT and ITT level selector incorrectly chooses a two-level table
> when the selected L2 table has exactly enough entries to cover the
> full ID space. There are no L1 index bits in this case. ITT allocation
> correctly rejects the layout and device registration fails; the DT
> path instead allocates an unnecessary one-entry L1 table.
> 
> Select a linear DT or ITT when the L2 width equals the ID width.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 6d98f3dbe34b6..866c238f08dfe 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -337,7 +337,7 @@ static bool gicv5_its_l2sz_two_level(bool devtab, u32 its_idr1, u8 id_bits, u8 *
>  
>  	l2_bits = gicv5_its_l2sz_to_l2_bits(l2_sz);
>  
> -	if (l2_bits > id_bits)
> +	if (l2_bits >= id_bits)
>  		return false;
>  
>  	*sz = l2_sz;
> 
> -- 
> 2.34.1
> 

