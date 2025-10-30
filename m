Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DFCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZJJ6B3uYYLoBtjq4vJO9wTVGgaHhOQ7y4gs4N49pOw=; b=yRS/EjWB8s6GjDwzbPT04yhbZj
	c5ixfwO0FrOWju+Pziy6FWy52+qngY7sxHS19PawP/E4Lh5XAcWYWFA5RZVGd67nR3Tp9+sj3W6nb
	iW4lS9yWA+jkUSxi9Qa5gXUlzsIeb5N1Zp/aIDMhEJY8liTkdrf5kR9FBeRRGPhsZrXjupaWMzLAZ
	u++xkFgX7pQPWGGC2uKF6drZppspdP9Jl3Nrh65lXnza/ZHjjuUI5XLbjDvvh37uSgd7MDf6dqmTl
	826fIId9m38mgd5urjBIKiDdAv7XzgfzSp+5wqYmbj8Dz3raMAJbnFeJxg3bYOtfqm02EY+Utev3r
	X1zxtwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETyi-00000004KPn-2qFW;
	Thu, 30 Oct 2025 14:50:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETyf-00000004KPI-1ywm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2561446E8;
	Thu, 30 Oct 2025 14:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260AEC4CEFF;
	Thu, 30 Oct 2025 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761835812;
	bh=a2l+lxTcIFw5IJSa8u8l0dTzp3oi3Ag6lOoC7YA2XBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iX4LsIJ2OGPvGBF2tKeDBl4+9u+fSdXswdeKVLd/Ip1jXBrzR4M37alug5EdMD4yf
	 u3oSQe0pZQD3+K7TekxfZlpV2i/ElVNGWjJLKx4dIFb0zvr4+bYZPP1Mbt8VV6hqgi
	 bgwCBO1TUwmMEhq+ycgH3a4R7XpaCAuP8xCuUBezQjMJ6yUAAEEdaQILKGoKyQ2ZCV
	 km0IYAQnlUAfnnR3DTOLbuSikojJrpynA20G33dZTz1NUISY34LlqrAmgPVoN3dZ7T
	 GEMpL2CTIB4Fyrs8b/TST7btUl9WkHxSQg20EbDp4AoIc6p4UtzPhYLKf3BgZ7lKmQ
	 oz5xzbbve1+qg==
Date: Thu, 30 Oct 2025 14:50:07 +0000
From: Will Deacon <will@kernel.org>
To: shechenglong <shechenglong@xfusion.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stone.xulei@xfusion.com, chenjialong@xfusion.com,
	yuxiating@xfusion.com
Subject: Re: [PATCH v2 2/2] cpu: fix hard lockup triggered by printk calls
 within scheduling context
Message-ID: <aQN7H7qfXbQSHEjA@willie-the-truck>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20251029034554.1839-1-shechenglong@xfusion.com>
 <20251029034554.1839-3-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029034554.1839-3-shechenglong@xfusion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_075013_531997_971B814E 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 29, 2025 at 11:45:54AM +0800, shechenglong wrote:
> @@ -1197,3 +1185,15 @@ void unpriv_ebpf_notify(int new_state)
>                 pr_err("WARNING: %s", EBPF_WARN);
>  }
>  #endif
> +
> +void spectre_print_disabled_mitigations(void)
> +{
> +       if (spectre_v2_mitigations_off())
> +               pr_info("spectre-v2 mitigation disabled by command-line option\n");
> +
> +       if (spectre_v4_mitigations_off())
> +               pr_info("spectre-v4 mitigation disabled by command-line option\n");
> +
> +       if (__nospectre_bhb || cpu_mitigations_off())
> +               pr_info("spectre-bhb mitigation disabled by command-line option\n");

Is the compiler smart enough to store a single string for the "mitigation
disabled by command-line option\n" part? If not, you might want to use %s
to avoid wasting memory. (I was going to check with llvm but I'm unable
to apply your changes due to whitespace corruption).

Will

