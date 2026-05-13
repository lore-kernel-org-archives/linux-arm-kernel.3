Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4F9CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGeQr4vZaey6OdXuMe/F8YfUkluAsGc9AieNXA6tGdE=; b=K/y/ReTy6zaPg8uQO4cW+oaxxq
	ngqgjFLsAKB/jDmTfy7ZtdzP2xH+23Gi4ISsCW9e/gFEwGTXskz6NkEzTynfaeKv7DPvFyPq0Bl7c
	TU3u35p18PmXZ5jnsdLrTVd0QZul87CpqbQAVge9beqWW8uBiGPSbcwe79ajppo1VN/AAFZ15Ybha
	DXDj4JVU0YaoexKRFzFmU3cGScirjzer5ucgQuPDN3jPclNQiRaO77rUkn/4c4xtMwGqtUbgIfQHX
	Zb8z226d0m2tuY2F5JoQP2KhnWtAo+NI66jP2jOGvyrceNbCCOMk9PZo5Pbj5n6JXfXaS52NU38A+
	8cFpofvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9jj-00000002mJK-3dM8;
	Wed, 13 May 2026 13:34:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9ji-00000002mHv-0SIx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:34:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778679291; x=1779284091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGeQr4vZaey6OdXuMe/F8YfUkluAsGc9AieNXA6tGdE=;
        b=r4/rb4w1ezd5HLSeFmfWf6ln0aUkE4/Th5SI7FFcqpavD58NQpPWCEZrlCa319hP8t
         d5SOuo15J2KuFstttpXmjJwecjXTYdZgg5wodxWlfytqaJBPaSVTHgH2IT3uk+RShuOk
         OhFMAJ38tPiKcDn0W7esqhaN5j02geimdCLYz/PeMszQ5nB+7IMIzffZ73EpqocoylYp
         ksQSyHC/rPREUcC1NGzOZxitZG8uDWOj5NaUkm2HF4GXqKci3n+dGdYhGOV4YN90CIjD
         uUrZzVT+J70d9p7MBomNalX1N9g9QJSukHdqZkcs9wK22RTXS+HM6/5x5jqcM1XRPirE
         nOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679291; x=1779284091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGeQr4vZaey6OdXuMe/F8YfUkluAsGc9AieNXA6tGdE=;
        b=AsFz1ka+5vvLJDX3GSaHRwWB/atI8ikcy+IZBCMMtzRVADPcsZxsdDbH4Vm3Smp36d
         2PtlW4ETiqXORupKqRjRgU9QE+XR/ZKN8tqvjX3Qcns39HYwhk7FOs1yjVPJifUo3I2q
         uhMJ7CYf+1ZlyLd9WV7lFeaGyx+7JP0NMiQlaIRp7iTHAiiuGmm0mRF0fYCG5RAlGBF5
         KCwG+KJ3nZb4tMfMAY6IWZV8tdEq1m1vLuXf8NLU3kQ6lo/fGSGw6n7Hk/h5OmwQnjK+
         ccHmPyZDBLU1INdX8dCPoDfaZqEAJtk7X8TONB1M60uCJNEwkT2At++1dw0QEUIlYqNP
         Wz3A==
X-Forwarded-Encrypted: i=1; AFNElJ/dipV1hBWh/9Jnhr4WYnQ3wERftY3Ty6u9c5SNm/2zUnGhQttcgbe3ZuTmpUg7zVzzvyZgWoUk2PksLA0XRmeK@lists.infradead.org
X-Gm-Message-State: AOJu0YyFuxBuA0u+l0TFNn2P52PN0DDF2JsSeEDrsGZ20a9xAdqEDGQO
	gVysyfHwfsSPoIah6ZCV/I4exJ2cVWcSez8tTkKzubQp8hzanzHPHIjJs+KrJawLEQ==
X-Gm-Gg: Acq92OFg8X36+YJu2k9qKOtp9FycYLqKnfN8dMV6TkSRfYKv+NI/CK3IX/yh6t6sNvw
	lsnV4L86vcbk3S31k/hVenzoYYHW6CM67saSL9116EdM8Q4evi+JAi3KJwEjU8rGTdwyCKRDaTF
	zfHc4/gtXd3/ZU1POVMQTkLiSX9MoZjAZb+NmJSUKm+5mzsHBHVU4cUk8lobTdWfSOOgEkEmP7o
	USHUduZtvkneJcE2T038kB9n07GPtpPSEUlAxXJZEUW0c86kK9ue5E7qmcGFeviPrNrr1qyERWU
	S+yIg9eC/h6iSsylZdwee/Uf7VkC7lX1bAt1Rl8sug8R/5oXRndw2wFIk8DO/DQmuEdixNzc3bU
	KZ3p3VLtXV9g2d04smqcYc4Uct1eZ/sdywdQBsB2ZXNjL1skGDkEYXoi2Dgd/sDpCinEeFMtxGy
	w1wYSLpEnIWusR6y5FFlJMvkzvo4w0JXCTwEGkEkI0hQ78fsGIHhekIylJQqj3TB1s454=
X-Received: by 2002:a7b:c455:0:b0:48a:5d95:d33e with SMTP id 5b1f17b1804b1-48fc9148926mr763185e9.6.1778679290836;
        Wed, 13 May 2026 06:34:50 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce065732sm43837465e9.6.2026.05.13.06.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:34:48 -0700 (PDT)
Date: Wed, 13 May 2026 13:34:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	sudeep.holla@kernel.org, will@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v3 1/2] firmware: arm_ffa: Fix Endpoint Memory Access
 Descriptor offset calculation
Message-ID: <agR98uWCHQBHuGNg@google.com>
References: <20260512124442.1899107-1-sebastianene@google.com>
 <20260512124442.1899107-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512124442.1899107-2-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_063454_175048_E967DB50 
X-CRM114-Status: GOOD (  23.03  )
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

On Tue, May 12, 2026 at 12:44:41PM +0000, Sebastian Ene wrote:
> Use the descriptor's `ep_mem_offset` to calculate the start of the endpoint
> memory access array and to comply with the FF-A spec instead of defaulting
> to `sizeof(struct ffa_mem_region)`.
> This requires moving `ffa_mem_region_additional_setup()` earlier in the setup
> flow.
> Also, add sanity checks to ensure the calculated descriptor offsets do not
> exceed `max_fragsize`.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 14 ++++++++++----
>  include/linux/arm_ffa.h           |  2 +-
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index eb2782848283..56b166290b24 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -685,18 +685,25 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>  	struct ffa_composite_mem_region *composite;
>  	struct ffa_mem_region_addr_range *constituents;
>  	struct ffa_mem_region_attributes *ep_mem_access;
> -	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg);
> +	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
>  
>  	mem_region->tag = args->tag;
>  	mem_region->flags = args->flags;
>  	mem_region->sender_id = drv_info->vm_id;
>  	mem_region->attributes = ffa_memory_attributes_get(func_id);
> +
> +	ffa_mem_region_additional_setup(drv_info->version, mem_region);
>  	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
>  					       drv_info->version);
> +	if (composite_offset > max_fragsize - sizeof(struct ffa_composite_mem_region))
> +		return -ENXIO;

nit: This driver seems to use sizeof() with variable name rather than
type (except for one place) so it may be good to keep that.

>  
>  	for (idx = 0; idx < args->nattrs; idx++) {
> -		ep_mem_access = buffer +
> -			ffa_mem_desc_offset(buffer, idx, drv_info->version);
> +		ep_offset = ffa_mem_desc_offset(buffer, idx, drv_info->version);
> +		if (ep_offset > max_fragsize - sizeof(struct ffa_mem_region_attributes))
> +			return -ENXIO;
> +
> +		ep_mem_access = buffer + ep_offset;
>  		ep_mem_access->receiver = args->attrs[idx].receiver;
>  		ep_mem_access->attrs = args->attrs[idx].attrs;
>  		ep_mem_access->composite_off = composite_offset;
> @@ -708,7 +715,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>  	}
>  	mem_region->handle = 0;
>  	mem_region->ep_count = args->nattrs;
> -	ffa_mem_region_additional_setup(drv_info->version, mem_region);
>  
>  	composite = buffer + composite_offset;
>  	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 81e603839c4a..62d67dae8b70 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -445,7 +445,7 @@ ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
>  	if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
>  		offset += offsetof(struct ffa_mem_region, ep_mem_offset);
>  	else
> -		offset += sizeof(struct ffa_mem_region);
> +		offset += buf->ep_mem_offset;

Does it make sense to also set buf->ep_mem_offset for the other
case in ffa_mem_region_additional_setup() and then add this
unconditionally here?

Thanks,
Mostafa


>  
>  	return offset;
>  }
> -- 
> 2.54.0.563.g4f69b47b94-goog
> 

