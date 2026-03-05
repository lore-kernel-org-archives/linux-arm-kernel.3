Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5525FF33A6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAuFRx7gtOPZDHLYd8gki/p+Ss0pYYeA/wECrBUdLlE=; b=XLJfMC77DBqqp3tyXzg0Cl6ugR
	ttVkyUzGymy5dz1mnAazpqTTYBho77RLqwTjxh+Dcc3DqaSIqbjlz9u60wO6Sw3RCih//7+ims1dc
	+I906cVXeYpZ2+A0vUHe2X0969zXD4ie1cMTXzb9D3lbFVmtRkxxBJ0phCKIQBIIF67igP+HJVITs
	rYR2HR1jIV8YiZJFj5I36f4RSwLACcKfwHJB8/QGgKBiXLOcmDWOFLFzwePTXm2EMRPl4lxWliIzm
	XKntgyy8W3UetOB9mUQEY8CFpkR1xeLKtho7WHXLMaCXNkMT3DaLp48W8ZrNj5swituL3IMdrjolS
	FrNPJ2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9Yq-00000001w7z-1tet;
	Thu, 05 Mar 2026 14:20:20 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9Yo-00000001w7B-1AuA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:20:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so1877384e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 06:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772720416; x=1773325216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KAuFRx7gtOPZDHLYd8gki/p+Ss0pYYeA/wECrBUdLlE=;
        b=X17Aqw53O2LoHVhIhyCXs/mswTsLHBOQtRthkkx4vdcdZpkUBzxDLywwt874dHrVQD
         ghkkUtrZW1JDbFs4A4/As7+ktA9MzBw0klJqZvozd9BSXuFw1uJFR1sYURfBLb+swmWC
         V4LkWSrrux+4Q/39ddP//NhO2fSF7LJxnIwthim6oNVZ68OsdufXkciQbC6kiyoNsPyR
         m44WY6UeBJjPttoogg7q2d9TEZK+rE77jxI9dpRAtClA02ydnlAmarIVpQEWeiD6+Lix
         l+1cNM8hZBwGewK+uRiKFm4pDdGeOjyMkwv+ZBilHEU1irz4FIOYd3Zvwrz9UYm8fwcx
         SHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720416; x=1773325216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAuFRx7gtOPZDHLYd8gki/p+Ss0pYYeA/wECrBUdLlE=;
        b=KD3ZDBlQMAV/V1hFt9Rtai9yuARmkY844lltPp8KVGz/Qrpe4WNm264NmF9BGKkDnY
         GEulu9QKY/lTmy7MKP+BIAVkj3aMEbRSoj2qfO3ZbiVLWnTsRmwhXpFAUlD57v/DKANv
         NlbnvkkPL/p8w2/Emb4EjvgDXitaj4SK/hKfV6Gsn7Xf0Nncyou67O73ShvKj8I9w/VY
         q+PTnsQ2w7ARVOCeQewlXZZufGFBJbE+OI2nOefJNRiT2cRNJMaZ7t5JaSTEjSdrzPT5
         P8XaNpsQTY+y7LfooJrlQL9BBYmyoAiXpV5LVG+jHecHNf7X8el5/P36FiwDlxECdiya
         vYzw==
X-Forwarded-Encrypted: i=1; AJvYcCV3EFvnGV7EgWgwdDr35eYrwLLq4PVjSnFQU05b/d5crQUZz1eQLwQ5NQ/QtDzTv44z0KgB5FvikY8oD0jA0LPJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+19PZkGMz7hpCWZL2TNWBPufnLrE3LdoWyUYMGfs8opcsFZoF
	U5cO7uOeEeqVk9Op2c3/79ZuxQ1uXrBTIlJ4/rpssR2S4m7ZHIK1BXQUxXSXTxGlDA==
X-Gm-Gg: ATEYQzxEb8JItL+lkL32siG6hfbn24AlXubPjDEm3EspxwNpNyErOO0oNSxd4b5dY+M
	A2sbHWbePeaq0jxnMbxOhoqC+3yZ9B97uHGEW/S7zA1FsIE9WWD79CoWQcAsTMOe7lHQ+Y2CxLZ
	Ql1v9cYfU27E3PCyBV8CkDF4KEmu5F/O+W9SAejehhp9O30OI47A6pc395BzzERFsvlMkA2t56w
	tKCq0hUYecpwZAY1OSM3oY7YK4sg7uFAcRynEXFvNSNnm2p2XRCT1LwPIN5PsF57mlNW3RZu0cT
	gnlVK4vP/qfEr3OxN4yjjclYZ+pjM/jkHttzsTco1p6jHN1tFDyiBkYpiDZRi0h5VgC+JqPsZUO
	9kWDVTZS4s98Z0/AgPIgFHeTdISMTm8oFteqceMRBJCGWgqTgkOkW9S6DwZuD6qKcp6aA7eTokf
	/HjGmMs/60j6PYLYClkQh3AwphIVwjTz5AtYDBqTpV6jxO1owc9sXQJ1Y=
X-Received: by 2002:a05:6512:145a:20b0:5a1:378c:11e8 with SMTP id 2adb3069b0e04-5a1378c1480mr17473e87.14.1772720415482;
        Thu, 05 Mar 2026 06:20:15 -0800 (PST)
Received: from google.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13555df8csm249863e87.25.2026.03.05.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:20:14 -0800 (PST)
Date: Thu, 5 Mar 2026 14:20:13 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: pkvm: Fallback to level-3 mapping on host
 stage-2 fault
Message-ID: <frvqntoya3r5by3vx75eicvggmjnkrhqkxn62ealjjiuuuiwyw@rkngsfqxkxbn>
References: <20260305132751.2928138-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305132751.2928138-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_062018_379423_795B124B 
X-CRM114-Status: GOOD (  20.61  )
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

On Thursday 05 Mar 2026 at 13:27:51 (+0000), Marc Zyngier wrote:
> If, for any odd reason, we cannot converge to mapping size that is
> completely contained in a memblock region, we fail to install a S2
> mapping and go back to the faulting instruction. Rince, repeat.
> 
> This happens when faulting in regions that are smaller than a page
> or that do not have PAGE_SIZE-aligned boundaries (as witnessed on
> an O6 board that refuses to boot in protected mode).
> 
> In this situation, fallback to using a PAGE_SIZE mapping anyway --
> it isn't like we can go any lower.
> 
> Fixes: e728e705802fe ("KVM: arm64: Adjust range correctly during host stage-2 faults")
> Link: https://lore.kernel.org/r/86wlzr77cn.wl-maz@kernel.org
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> Cc: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 38f66a56a7665..d815265bd374f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -518,7 +518,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
>  		granule = kvm_granule_size(level);
>  		cur.start = ALIGN_DOWN(addr, granule);
>  		cur.end = cur.start + granule;
> -		if (!range_included(&cur, range))
> +		if (!range_included(&cur, range) && level < KVM_PGTABLE_LAST_LEVEL)
>  			continue;
>  		*range = cur;
>  		return 0;
> -- 
> 2.47.3
> 


Reviewed-by: Quentin Perret <qperret@google.com>

Thanks,
Quentin

