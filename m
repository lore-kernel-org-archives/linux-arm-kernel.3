Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF0AD37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0On5mUa4Ad9udUf6v9yU0CLcZogBODduyNyvpvin/+A=; b=n68VxHee524BhDO4naVe8lbyEo
	Y9mpIooJb5fX+EmB5duIehJkhdW8WhA0TRFy//Pr3iHX/Ybfb95cp4EaRI8IpKckRtsLOc1tR14YM
	pdVShuQQfgNz9k8NXjxTQJW/5AWKgJWup1Q7kHxlr3KRMBBM+IDiTwxE0YkGENbuoPdvs38QCEogW
	BfOGghVmhs+eOvpru9xkoJtDu6koOXK+fwjb8pxyUrJxEes7kL30z3fazn2C4HhnmKdENHryR6aA0
	C55QTQmI/Ywt/UZMGbvZhwEXdQsOhG2fVRyPsbstkoce9myH+ShdnH+L85uiOUt2DN9PjkP7P7Asr
	7ZKfVIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Gh-00000009oz5-1dgM;
	Wed, 14 Jan 2026 15:58:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3G6-00000009oUL-1Wwb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:58:14 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a1462573caso85355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768406289; x=1769011089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0On5mUa4Ad9udUf6v9yU0CLcZogBODduyNyvpvin/+A=;
        b=Q0KqHFAkzTraGZAFpCz7wPydgcfblKZs36/MAZeCeG880nwD3+BWhCc0qoMJ66c6YD
         bm0vIuGvt7a4c0CWAyEDRS5U8yRdJ+PFdLuuKV0iLUz0fzDy88CRi/BW5/wm2mGO3wET
         jc4iDF8W2uHBB+3McaK4dGohOS3vO+goDNstR+Vr0zUvjAm/JrDZExR9PmiuNC/Bnb6S
         wQpuw/G805iXus9HHlSdQ5ndW0h/xhVUdEL61LbNheiZayZ7FT47qBPkNfjfn65CqUhw
         rhEP7yGf2MeKPyXUFf15N1Zyhw5AT0urniVMXMfXCVps31kWqQamFfgA0xAfTiVetsnJ
         zkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406289; x=1769011089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0On5mUa4Ad9udUf6v9yU0CLcZogBODduyNyvpvin/+A=;
        b=xIxfvygIWzf4E65eX4BpmiGYS/F7Mxr3ZftVbk2eT3Os1aWVVe+wJKvV6aRjvihADz
         MOzJstK745Mal9F4dKsGeY+QJae/Oy+/xks5d2s+QbuaaZUjz8CIKI4mUNbQJymDGMSB
         mJ52AQybbs8eKGTmiE3T7Iv13IUFwLvmTB+0RhQtB+VxdsuzUBmBoIa4oUTi+MpLjbR1
         uL4KYm+U6ADv8r0pmJm8/UdNbRVPH9EgKgIih20bH5W1q8gEhXR5vv9gDQFdbKqe1ZzC
         X2ue9vXDo29zjVR0xG2fX/tFY84B4klb6J5b6Pm220btZBuGNa43xAwA9w6sJ1pZ5pLn
         eQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCXvg9Za5B3p+xJfHC4oqw+0omi/sdU5pWRCAOtBV+HJc4jU8UZ4BkuRV69Y28I0VbdOBjf9f1pQHie6HsI6r6yT@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMlwHzS48/Rqk3LpUIePkedR91KcTr1WurWShQVE0TFdJvQLd
	lckwpILxe5zT0PyTqb/mbswnzvvru7qcMkKnat5P/lwKqVB331jIrb58GNrTY4fbAA==
X-Gm-Gg: AY/fxX5fBOACu4YGZB9AfcAhcndsNgaOKb6k3Oem5eQ+cOLAI1NV5bxQL4MzFZ/JU6u
	7IzjIfhXv1dubAZ76Pwi4t++Z+D6evV8y8oltKIr9u4JHZKfjnQrz5y6uoYBUpqG23fp2BWVHru
	008TNNz50/1b7V20XWlfrzT5co9GulAWxkDy1l0Wnzg/8X6HeyLZG6cmALuCdSjE0+IGrQ1biYr
	6reGINvbAhqEZquaFLcaGcMPJiSaqw3ttzzQNDlCqnIrIY3xjcTtl0m28wUHYz0LeSCOmTeRxAp
	aP9cElCfWO0Ir9t7oQy6TyDGEX0I0dllQLCWU2K1puvDD7cRmmEzQNf1WFSh/ONdasww+iLOUvx
	cD4Tn+BoHEJu6vR6jL9+KQDC9tQN6eq+BA9y4H7AbFto8kh6J4julDq/qpSdxWyTUMsNtyHCKCc
	8sKh30x88haFVNb07r0dj3/5zCc6cgWUEht8Mr0EsYaZahyvCo
X-Received: by 2002:a17:903:238b:b0:2a1:3cdc:7720 with SMTP id d9443c01a7336-2a59aa609bemr2426085ad.21.1768406288994;
        Wed, 14 Jan 2026 07:58:08 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b2edsm22922269a12.32.2026.01.14.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:58:08 -0800 (PST)
Date: Wed, 14 Jan 2026 15:58:03 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v6 3/4] iommu/arm-smmu-v3: Mark STE EATS safe when
 computing the update sequence
Message-ID: <aWe9C8wwfszvqxR6@google.com>
References: <cover.1768248467.git.nicolinc@nvidia.com>
 <b8055e0f0f1b4473db2583586350b4f7aa8f3b4c.1768248467.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8055e0f0f1b4473db2583586350b4f7aa8f3b4c.1768248467.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_075811_453761_5795692F 
X-CRM114-Status: GOOD (  29.61  )
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

On Mon, Jan 12, 2026 at 12:20:16PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> If a VM wants to toggle EATS off at the same time as changing the CFG, the
> hypervisor will see EATS change to 0 and insert a V=0 breaking update into
> the STE even though the VM did not ask for that.
> 
> In bare metal, EATS is ignored by CFG=ABORT/BYPASS, which is why this does
> not cause a problem until we have nested where CFG is always a variation of
> S2 trans that does use EATS.
> 
> Relax the rules for EATS sequencing, we don't need it to be exact because
> the enclosing code will always disable ATS at the PCI device if we are
> changing EATS. This ensures there are no ATS transactions that can race
> with an EATS change so we don't need to carefully sequence these bits.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index ccd6357fa5a8..58008fe94ab3 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1096,6 +1096,24 @@ void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
>  	 *  fault records even when MEV == 0.
>  	 */
>  	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> +
> +	/*
> +	 * When a STE comes to change EATS the sequencing code in the attach
> +	 * logic already will have the PCI cap for ATS disabled. Thus at this
> +	 * moment we can expect that the device will not generate ATS queries
> +	 * and so we don't care about the sequencing of EATS. The purpose of
> +	 * EATS is to protect the system from hostile untrusted devices that
> +	 * issue ATS when the PCI config space is disabled. However, if EATS
> +	 * is being changed then we already must be trusting the device since
> +	 * the EATS security block is being disabled.
> +	 *
> +	 *  Note: Since we moved the EATS update to the first phase, changing
> +	 *  S2S and EATS might transiently set S2S=1 and EATS=1, resulting in
> +	 *  a bad STE. See "5.2 Stream Table Entry". In such a case, we can't
> +	 *  do a hitless update.
> +	 */
> +	if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
> +		safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);

I understand what we're trying to do here but isn't this implicitly
saying it is safe to transition hitlessly to any non-zero EATS value,
including S1CHK or RSVD. S1CHK might have other config dependencies?

>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
>  

Thanks,
Praan

