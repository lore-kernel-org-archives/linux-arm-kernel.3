Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B13EC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWWWXqBxdZQwhQ7CkoKnQwmEOD4rQL0kmNBKNRws0Ls=; b=u0hcd8d2+FEY2ZG7Vw1mpqRtND
	a3cB9T68yH0iyYYmrVtK4lfCJ7hWW6gvTLHaSv/0e/CDPx3HrS9002HqKqQs2OpwVnIuWTZXOIB0e
	oiRbZERSMuSaDnK/fZLvh2qAH1D6nSW/oMdkOC8jVEenSfk1+DhneOMkt4m3UmGqufBxDX5W9q8xf
	M4nGHnxHX4twcjAo09iIg5UpEaaC9srCmYmlJAYflPRS8UkSyQGEg7vX0VbiVNG6uBjLjBt4Bg7m/
	VFsCqC2yo0vQImZRxe+OKezvhTLDIdOevnrmM4QXbX49ljI3yyzeF6MGP8w2CbPqvxSwaFn47DM2E
	VGnt09Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PPN-00000005m56-28Ey;
	Tue, 15 Sep 2026 09:24:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PPI-00000005m46-2XKG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CWWWXqBxdZQwhQ7CkoKnQwmEOD4rQL0kmNBKNRws0Ls=; b=ju7dE/WSGycz0GZCOrV3NGwutX
	MLsRfbR32LuMe1G2RpLH/psxCR3PlCKexmc8UhAp8FuvGKFhTOj7k4F8mKWKZhMW895ybITrN5ze6
	v+8yKEy3ILF+25Opvto21MeuXUHco8LDEb3VwOnEFaCIosBdB53MrY41m3pl/1znDNHOL4dbI/bFt
	Xbz9iByRkBfNyhUlxG/Rhf1iYImGHZl9eHzYltEeV5lr0G1NKw0IAQXrZyVltctVc4ttHWPen2v2M
	eVi444pjK0Qf2d9uJcMJDl6jQQaWSzAPXnTX41hV2MomKIOAcqQbKoHJJRhJ5hDBDECrmJVUIX/rI
	Ve4WPfBQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6PPF-00000006Uhs-2Atq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:24:51 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633cd78so1495823f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789464287; x=1790069087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWWWXqBxdZQwhQ7CkoKnQwmEOD4rQL0kmNBKNRws0Ls=;
        b=o6EZ+bNViUrxHQRP992a1i66DNdyguFtNLq+Z+75FbOE5/h6SbtD8uE19OzeWTZua6
         eyDSXgfiw3IgWN+xjqjHH2vf9ZdzjCxHxIL5Bjdq+5XLbLR4QGA3yo8AIHKyIKGNzmrm
         9dxTyTbuAQCeBNWROWml1Gki2PM5kgFwOB9cXGvM+3xrSP6PlA/474AvmJJDo8lmatR7
         frOItS2+jHK8y2hBXtFEOBuQGoE59YyCvKdg62hg8UAV4LP1BCbS7IHJwsaVNuGqcVRb
         5zFMFLk1lPNUQj0Pe1Qztip8vru5WdyTvopG6ntLnNfkfaRwSCkXA5xKKGkOHvy7dUM+
         UlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464287; x=1790069087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWWWXqBxdZQwhQ7CkoKnQwmEOD4rQL0kmNBKNRws0Ls=;
        b=qn/zywxQ1H6nxBGaYkdNKdskaMoktmJMLMJsoIIQZ9zc9R0Al+CVApMQvfyV0X0xSE
         vpnYEOJKkJVcLcXSl9nX9EHUAVNwATrYjucLSPkFaAEaAVPaYBMExnBMaUtugKVqUtkC
         Wem/uCKevWiZkkaVb9luc4Klo7Qc12ZHS4sh7uDdthra4lvhjnpjdN+1o63b/P/XKcOx
         zE5DMVQ5g+LkGiI2SALUnZGJzocr0Vw3TMf3PvOt4fgvdnTNW8VFKHHssKOzH9+G6M8g
         OIhjLWOJkxr/egLPp2lEje/Wu6WV5o5Da+OaiT8C5QoDunbyCPbBo3ienRIHoQqYniRK
         z1oQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeBzvNg9ey9TKK4xH8xm/h53RsFIJaMDsLwgU5Cf9gKpODEqPDfGCetG5DKnX0IlzBdWDQ95NZ1s6sPKMIBwcB@lists.infradead.org
X-Gm-Message-State: AFuF++lCZivmoav80pnfjXuiTAYmiVgLgUeqaAeuS41YiecCrRRi/3bz
	trACgMzB7jGlT3wCFrP0zZTKyIORUu1csvJRJ5u2W/EAfXRCmuUUsdtg2nEt3u2r3w==
X-Gm-Gg: AYBFou2DpfH0OO5TB09SaaUCfx/ytRZTgNUxeY/+WLzLBxHzLbxI5vSxJUnvsGsy8cG
	Jtlr7DzEPZCrHZuFz2/SVDim2acxIbfdskkJhvRMSm52wOXkH/x/wAUH0TLt9YHD1fGBAPdCaUf
	3WinGoSgXEOvdkVIt7/vK1BWYQWp4MX3BOL8Cu8L2G1tqkZtisjvnBUh7EJIn9YS9dC3Ni1y2tE
	b6b7YHbV53dP0Hqx1Y9L7VnUmsNnYMtjQfJnk/LP55uMK5ilNZ5mH15nxRxCfdlRjwEDRkJTxLQ
	wKqQkUSFtE0XylAmIETyJZpeSD+XNAbCV6jpt0T2ot0MmRS2ZjXS4jAklM9jZSQQuhqeT0CjWT4
	L/v0ASCCREkkz8xjnLnwxbSCTkoLlF9APg3FewaGs8OV/g71A4Q30lPsskY/M06DgIZvoGOPI2h
	TKhrD7av4Wi+XQAvfIpwS/6Re0M9N5aJqIZPBqseVh8rW0MWdfXlI1DN8zVRgp109LdipZZexgL
	tNBv98zAdcaNYT13unhXloMtEs7iPLI5cfZpqK+Ginh+qY07re5Pg==
X-Received: by 2002:a05:6000:1785:b0:485:8a46:b3c4 with SMTP id ffacd0b85a97d-48702b5e64bmr7485672f8f.44.1789464286268;
        Tue, 15 Sep 2026 02:24:46 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33e020sm34764203f8f.18.2026.09.15.02.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:24:45 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:24:41 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Ben Horgan <ben.horgan@arm.com>, Oliver Upton <oupton@kernel.org>,
	Sebastien Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v7 2/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
Message-ID: <aqkO2eVkF4bdS41U@google.com>
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
 <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_102449_691493_F7906F05 
X-CRM114-Status: GOOD (  22.04  )
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

On Sun, Aug 30, 2026 at 11:08:14PM +0000, Per Larsen via B4 Relay wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 27 +++++++++++++++++++++++++++
>  include/linux/arm_ffa.h       |  2 ++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 9e8bb95e8845..96cf6be969de 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -880,6 +880,29 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +			      struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u64, endp, ctxt, 1);
> +	DECLARE_REG(u64, flags, ctxt, 2);
> +
> +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];


For a next version, ffa_check_unused_args_sbz() has just been merged. [1]

[1] https://lore.kernel.org/all/20260907171930.4037166-8-sebastianene@google.com/

-- 
Vincent

> +
> +	if (upper_32_bits(endp) ||
> +	    FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != HOST_FFA_ID) {
> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	/* filter out framework messages and validate SBZ/MBZ bits */
> +	if (flags) {
> +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	hyp_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res = {0};
> @@ -938,6 +961,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_MSG_SEND_DIRECT_REQ:
> +	case FFA_FN64_MSG_SEND_DIRECT_REQ:
> +		do_ffa_direct_msg(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index e71d83ee0aef..a3f44e7c08de 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -269,6 +269,8 @@ bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
>  	(ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
>  	 !dev->mode_32bit)
>  
> +#define FFA_SRC_ENDPOINT_MASK	GENMASK(31, 16)
> +
>  /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
>  struct ffa_send_direct_data {
>  	unsigned long data0; /* w3/x3 */
> 
> -- 
> 2.55.0.897.gb25b4bd76c-goog
> 
> 
> 

