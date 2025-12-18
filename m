Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CECD6E2B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVStRMWg0rfP2fEwAd11bQqAyXNa+0/i9rP/tVPAzuw=; b=LjJJsvTI/kurTwD+0zIkFRBd3J
	iH9vGG9MzT8hpMjdkzExcHyC71xsaKCQawIVXuWWtgXg2oSsvsc9SOaC59IeV2ZeIpQ3H/CkmUbrp
	3gZxKfg0MJUTL3mdf5U1T/ogPOwdOs36PH0j6/zAgE5LTb8mnIYZnTC28FlKoFHzC8RUIonjweEwQ
	C5tXnwERvn6k55z/84dBOxOnsNEdYwTL2pkVKpxZUGZZQMi/6Q1mMDFyg/o3pOwc9zm96Y/Xtqnz7
	0yFGKU6rvxttaA0WGtExbAQGBhZfE01NfXkpZHAf9pAZcn7+zzun/h11Wxe9ZCFTr9R9S48ORe4o4
	Novl+JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH3O-00000008qAW-3MQc;
	Thu, 18 Dec 2025 16:40:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH3M-00000008qA1-1Bg0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:40:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso66065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766076034; x=1766680834; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wVStRMWg0rfP2fEwAd11bQqAyXNa+0/i9rP/tVPAzuw=;
        b=iXa34aPOFLO7kXekiMMD7HvvZsXzwACUBpzmFWBSUh7ImsEX2CLvSNIk8fqKvw8HlE
         NBHwZek1v4Iqd2L7+57B0IJUjIVW8Ss9GHpETvUCPnm43RzDe/mcbdGGkX6MhfwbhvYA
         fmR2ET2Zpfa1mJsdKlU33Zt+QNAFlthQF1Io4J9IPzLl7R5n9EPsM+Jz549oF6pvk27/
         L4sFIngogfytp0OCKO7QRca8pfMw7wv+JaVXB2v58/kJL/iD3undH3Arws1B5eQtf+td
         y91D0mzX0vM32djxbfuj7wpKmOoPzBje2GU9Ki6bP1mI2z9/zVOuQIZH+Z56f5HILXHT
         eilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766076034; x=1766680834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVStRMWg0rfP2fEwAd11bQqAyXNa+0/i9rP/tVPAzuw=;
        b=Eyq0cflPsZNNFShYUtq7+oJp0I0KWuVQnWrZPU5KLwACT/q7cZ0GG/a8ZCab2vbvu8
         dht/+HFeZasDJoUKg8dnwBwdTxDIuDwzoyH/wQfN3G5upApCOKR4xn8V36qy0HlEBgth
         5518dW1QQN/HAOkFXe56ZUzOjYPVDl62qZbhyf2qaDmbQO+6+VyivV+b00iU6djIeIbU
         53+zSS1PkdwFWPSstJZJ22CGOZsrlARv3t3eJhNipi2zs9HmxhMz+wg9QjLeil48Vi+B
         V7I2xQptjL+qE/VrdQrMGCihC93DSK+trtU2RLDyc3dTr8aH2e/NcxXls2nHXtdhV3pT
         GddA==
X-Forwarded-Encrypted: i=1; AJvYcCX63hEpKr8KV7UXpsYaUs+JyPEp8el3NjNeq+Uk0/hfFFM3pjfa7CgTaHfCZsM+0++JVByhulyO/cBAAnw3WPEp@lists.infradead.org
X-Gm-Message-State: AOJu0YyuKjN8dxdYTzxUQ3qLuTA0NQSe3XKgdLoip0qPp35kYrQfhdSu
	FSvD0YGu2COglRCH2l0FCvegTdwIOnWW1wYjzLh7M0geOOC4/W5gaLElct0yUCODjQ==
X-Gm-Gg: AY/fxX6sBpsZit2nl7MKNIbnP7i48Vx+qud/LTEtPrXbwCQAvZm/YhvxRyWFvhy4+W2
	ZxhybFVxlKNUh90l99o3Kw03exsaVP0CxbTp6+CN4XeLzBSuGcWhSl5UReYkQdcbIPfszBx7E2b
	G21JhmKPy13retzxjmaJEowzPLYPYT8x3mu50sb8d+ppR0pZzl+NYSdwu6cMtPuKTud5IyJ9t2c
	6IPoqD4eB4NJe5Dt3prP0mK3rmu6XkoaVcO9L+EV+vAUV4gw/KxtBVUrJMR+LRfX8Sv/ahxm6J4
	EFmP+Vil0c680EI5SUN1Dsbup6aZmUasvfVbtC/CVG84gXSeX0/DM63HIx5YkDSe7vO34SAnhXD
	M4P0Cmc7gwc7vL6VLBRUP3FZL9eD/RDJucs6yGgs9G2s+8+pfZMtX3za+oTscTd2KtNCVlim9uJ
	pXlMk06r4jOWNO6chuQ0QKknKzFSRKnk7+gw8x24lQN9le3fKYewht
X-Google-Smtp-Source: AGHT+IEo5WDa5tT3Thb5LCrx68hS9Zizs1jUbVh5VWo2CFXMBk1R2s+dqf9FAll8MkOddqKisw01vg==
X-Received: by 2002:a05:600c:686:b0:477:b358:c0cc with SMTP id 5b1f17b1804b1-47c010b90a8mr342415e9.17.1766076033956;
        Thu, 18 Dec 2025 08:40:33 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432449987a4sm5776517f8f.31.2025.12.18.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:40:33 -0800 (PST)
Date: Thu, 18 Dec 2025 16:40:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v4 2/4] iommu/arm-smmu-v3: Mark STE MEV safe when
 computing the update sequence
Message-ID: <aUQufkkJYrOp0erD@google.com>
References: <cover.1765945258.git.nicolinc@nvidia.com>
 <83f991cbbb1331213aabe7c1fc5f725e79f60ecd.1765945258.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83f991cbbb1331213aabe7c1fc5f725e79f60ecd.1765945258.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_084036_339283_0FD023B2 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue, Dec 16, 2025 at 08:26:00PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Nested CD tables set the MEV bit to try to reduce multi-fault spamming on
> the hypervisor. Since MEV is in STE word 1 this causes a breaking update
> sequence that is not required and impacts real workloads.
> 
> For the purposes of STE updates the value of MEV doesn't matter, if it is
> set/cleared early or late it just results in a change to the fault reports
> that must be supported by the kernel anyhow. The spec says:
> 
>  Note: Software must expect, and be able to deal with, coalesced fault
>  records even when MEV == 0.
> 
> So mark STE MEV safe when computing the update sequence, to avoid creating
> a breaking update.
> 
> Fixes: da0c56520e88 ("iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8dbf4ad5b51e..12a9669bcc83 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1085,6 +1085,16 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
>  VISIBLE_IF_KUNIT
>  void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
>  {
> +	/*
> +	 * MEV does not meaningfully impact the operation of the HW, it only
> +	 * changes how many fault events are generated, thus we can relax it
> +	 * when computing the ordering. The spec notes the device can act like
> +	 * MEV=1 anyhow:
> +	 *
> +	 *  Note: Software must expect, and be able to deal with, coalesced
> +	 *  fault records even when MEV == 0.
> +	 */
> +	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
>  
> -- 
> 2.43.0
> 

