Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9ECCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3aytJ2sZxSRYrfcuOc3im2xCWGoA/zkjwdoYJLrsf8=; b=rQ2xCnW0S8V5pjWfdQpnG0dfP8
	qUJDADIZefZxzpR+wLvJ3El4QVsIqfpAJn11w89gzjD+UR0onlVW+jmgyjpLRNeqSH/8V0TFVjx41
	mepUJ8b+b8m3ypnY6okVl5ce1uJFfax43tGRs9kN4j4kKd4CEOjQk4ZPiV949HesAmwFmPAzliPlx
	tGxbQlLgB3g7rkRaz7xyH0JlaV6lw3ghLBChs+ooHnyCLqWu/k1a9ev+ELGPHaQS8We+f/hfpEDo+
	xWiBa98MS+3ipwnj+qmX2yRcuc+eGwbJGIHqClstODL/aAhCHzc8+UNX9VJeYB1zmrCCHerU0G1Zs
	HREqCZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNStv-0000000BLuD-27kA;
	Mon, 24 Nov 2025 09:30:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNStt-0000000BLtR-2TuM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:30:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47790b080e4so21081845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763976624; x=1764581424; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3aytJ2sZxSRYrfcuOc3im2xCWGoA/zkjwdoYJLrsf8=;
        b=EdT6H0SW0DwMXQEXOwYI8VNRqXPW4gNIOIz/+0aR5slULTpiZFL6C0nXz8Cpo5msRh
         VB9ZsZgFPnIklvZxsoYRhi1FaJXYeJBQ8ueKYXq82NF165kF6n7ORVt+Cf0DCM8eJjnY
         BNVSqntKskBSzU1kdhQ04sMJM+k4cosPskhtVEH/ieVO54sYbVVQfzNDJWznbSHFLKYt
         +kHn8FS0TYRToM6GZgjvGz2H532Q4a/hFFXepO0yn/TNdDA/uorD+YzDbSBUwa4I4bc7
         ap+WkAsBJ+ECqXisfS/hmfvo1ZnHq4Gr5br+gJklUrU5B0GwDiWe5nRfbyjBLquX/73I
         NQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976624; x=1764581424;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3aytJ2sZxSRYrfcuOc3im2xCWGoA/zkjwdoYJLrsf8=;
        b=k2L3A1WNKGDe9bDVse4X6ziH/EYW6Q07aijdWHJ5z+8WEycugFRQ18d6iugRRH/kQJ
         jbYAMLgfOUE42k5AuJiJPieyMazckM6a/UWgnA7rDLqOFixfblzNDpB4hjMw7AyJK+D6
         KpIXlec6mbmxHnWQpBquf3R/JXXVDXo2AYltlN76locqq7ljvYGlGYZc7MBK9eAXEQde
         gYfxEjO5RfbiJW6A1tHp+iZ/DjLkWRpD8ZkMJXyi7EK3EzQSS3IWwKO7eK/kELWfsKiB
         LXS9fOBiqmZWOZ/zmVp7NBLUV90BcjTGmogom9NpXI/59KdA4djw5bu70gf2KylQSSAM
         Zn+g==
X-Forwarded-Encrypted: i=1; AJvYcCXI2X1GZvB7zBC16OzvO4M/lGt5QgLtN0UgAg29+0DXM1Vwz410XxUDpcA+DgHWz4XQh34zETMYQGGe9MgVgG9B@lists.infradead.org
X-Gm-Message-State: AOJu0YwFip8Vw9Om+LqhFLGRTUtcKHFEyh1qT2HNAbp58s23XYOjVKLH
	lZmNnYlB7WuTZ/VRVYq8b/7ISipvoisru0gl4bmAHNfE9UnYa29NWhQLuotwFGirJCY=
X-Gm-Gg: ASbGnctZI68oIBGgOhU2gglv5WJxZzGn3UBhvHTKZ9E80QDREjE6NxwQUFAbvISFRbk
	qF875lI/MgZwYsWQS5RXPuHLpiQnuZvguyRm6MBl7Zhy2ka8D+u/wXPJUt687SmMmxY2AfFUFk6
	cLtckqpMtTXdXFAVcKrJqGZFtNladaEoFyQB2DLqrJqXQj3Nre3vAub6EyJL0pOkafZXwqj3EGZ
	bTfXLaEBLWC/gn0jnS0hF6Foe1U9Bff4sPTTB+3bQGUVbbNCChRFuI+ZFRfMbPiuMyPFXRx3PfS
	84kKzanKcbFeojeeGrPHSxXjS1Q6V964vchlZwVolvnjMtABPWuLau2/xBnZZWavMTl6aKRYDSr
	tyS9+21UqFk9KTvz78GNmNw56u3OiXQ+8UGOQVlZM/75cbwqRqtzzDjNE9GWmL8mje/kQ6jBZJV
	zp2Rlm/l4Ss8EQTIfSM1C8PYyp33cGZPMTxJvT+iVPvjKna1PfGvk=
X-Google-Smtp-Source: AGHT+IGVswGY/a4pp84AoicemWlC3EeMp/CJWZpQbwJ08GptGBtnpFm9nq439AWBsTFVAzH/O3MyVA==
X-Received: by 2002:a05:600c:4591:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-477c10e1cacmr102371425e9.14.1763976623630;
        Mon, 24 Nov 2025 01:30:23 -0800 (PST)
Received: from r1chard (220-129-146-231.dynamic-ip.hinet.net. [220.129.146.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed470ff6sm13929073b3a.19.2025.11.24.01.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:30:23 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Mon, 24 Nov 2025 17:30:17 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/6] efi: sysfb_efi: Reduce number of references to
 global screen_info
Message-ID: <aSQlqZPTAXHvTnrG@r1chard>
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <20251121135624.494768-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121135624.494768-3-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_013025_681847_0CCCD983 
X-CRM114-Status: GOOD (  25.46  )
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

Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/21 14:36, Thomas Zimmermann wrote:
> Replace usage of global screen_info with local pointers. This will
> later reduce churn when screen_info is being moved.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/sysfb_efi.c  | 81 ++++++++++++++++---------------
>  drivers/firmware/sysfb.c          |  4 +-
>  drivers/firmware/sysfb_simplefb.c |  2 +-
>  include/linux/sysfb.h             |  9 ++--
>  4 files changed, 51 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index 1e509595ac03..8e0f9d08397f 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -92,7 +92,7 @@ void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
>  	})
>  
>  #ifdef CONFIG_EFI
> -static int __init efifb_set_system(const struct dmi_system_id *id)
> +static int __init efifb_set_system(struct screen_info *si, const struct dmi_system_id *id)
>  {
>  	struct efifb_dmi_info *info = id->driver_data;
>  
> @@ -101,14 +101,14 @@ static int __init efifb_set_system(const struct dmi_system_id *id)
>  		return 0;
>  
>  	/* Trust the bootloader over the DMI tables */
> -	if (screen_info.lfb_base == 0) {
> +	if (si->lfb_base == 0) {
>  #if defined(CONFIG_PCI)
>  		struct pci_dev *dev = NULL;
>  		int found_bar = 0;
>  #endif
>  		if (info->base) {
> -			screen_info.lfb_base = choose_value(info->base,
> -				screen_info.lfb_base, OVERRIDE_BASE,
> +			si->lfb_base = choose_value(info->base,
> +				si->lfb_base, OVERRIDE_BASE,
>  				info->flags);
>  
>  #if defined(CONFIG_PCI)
> @@ -135,49 +135,53 @@ static int __init efifb_set_system(const struct dmi_system_id *id)
>  
>  					start = pci_resource_start(dev, i);
>  					end = pci_resource_end(dev, i);
> -					if (screen_info.lfb_base >= start &&
> -					    screen_info.lfb_base < end) {
> +					if (si->lfb_base >= start && si->lfb_base < end) {
>  						found_bar = 1;
>  						break;
>  					}
>  				}
>  			}
>  			if (!found_bar)
> -				screen_info.lfb_base = 0;
> +				si->lfb_base = 0;
>  #endif
>  		}
>  	}
> -	if (screen_info.lfb_base) {
> -		screen_info.lfb_linelength = choose_value(info->stride,
> -			screen_info.lfb_linelength, OVERRIDE_STRIDE,
> +	if (si->lfb_base) {
> +		si->lfb_linelength = choose_value(info->stride,
> +			si->lfb_linelength, OVERRIDE_STRIDE,
>  			info->flags);
> -		screen_info.lfb_width = choose_value(info->width,
> -			screen_info.lfb_width, OVERRIDE_WIDTH,
> +		si->lfb_width = choose_value(info->width,
> +			si->lfb_width, OVERRIDE_WIDTH,
>  			info->flags);
> -		screen_info.lfb_height = choose_value(info->height,
> -			screen_info.lfb_height, OVERRIDE_HEIGHT,
> +		si->lfb_height = choose_value(info->height,
> +			si->lfb_height, OVERRIDE_HEIGHT,
>  			info->flags);
> -		if (screen_info.orig_video_isVGA == 0)
> -			screen_info.orig_video_isVGA = VIDEO_TYPE_EFI;
> +		if (si->orig_video_isVGA == 0)
> +			si->orig_video_isVGA = VIDEO_TYPE_EFI;
>  	} else {
> -		screen_info.lfb_linelength = 0;
> -		screen_info.lfb_width = 0;
> -		screen_info.lfb_height = 0;
> -		screen_info.orig_video_isVGA = 0;
> +		si->lfb_linelength = 0;
> +		si->lfb_width = 0;
> +		si->lfb_height = 0;
> +		si->orig_video_isVGA = 0;
>  		return 0;
>  	}
>  
>  	printk(KERN_INFO "efifb: dmi detected %s - framebuffer at 0x%08x "
>  			 "(%dx%d, stride %d)\n", id->ident,
> -			 screen_info.lfb_base, screen_info.lfb_width,
> -			 screen_info.lfb_height, screen_info.lfb_linelength);
> +			 si->lfb_base, si->lfb_width,
> +			 si->lfb_height, si->lfb_linelength);
>  
>  	return 1;
>  }
>  
> +static int __init efifb_set_system_callback(const struct dmi_system_id *id)
> +{
> +	return efifb_set_system(&screen_info, id);
> +}
> +
>  #define EFIFB_DMI_SYSTEM_ID(vendor, name, enumid)		\
>  	{							\
> -		efifb_set_system,				\
> +		efifb_set_system_callback,			\
>  		name,						\
>  		{						\
>  			DMI_MATCH(DMI_BIOS_VENDOR, vendor),	\
> @@ -284,12 +288,13 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>  	{},
>  };
>  
> -static bool efifb_overlaps_pci_range(const struct of_pci_range *range)
> +static bool efifb_overlaps_pci_range(const struct screen_info *si,
> +				     const struct of_pci_range *range)
>  {
> -	u64 fb_base = screen_info.lfb_base;
> +	u64 fb_base = si->lfb_base;
>  
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		fb_base |= (u64)(unsigned long)screen_info.ext_lfb_base << 32;
> +	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_base |= (u64)(unsigned long)si->ext_lfb_base << 32;
>  
>  	return fb_base >= range->cpu_addr &&
>  	       fb_base < (range->cpu_addr + range->size);
> @@ -311,7 +316,7 @@ static struct device_node *find_pci_overlap_node(void)
>  		}
>  
>  		for_each_of_pci_range(&parser, &range)
> -			if (efifb_overlaps_pci_range(&range))
> +			if (efifb_overlaps_pci_range(&screen_info, &range))
>  				return np;
>  	}
>  	return NULL;
> @@ -349,25 +354,25 @@ static const struct fwnode_operations efifb_fwnode_ops = {
>  
>  static struct fwnode_handle efifb_fwnode;
>  
> -__init void sysfb_apply_efi_quirks(void)
> +__init void sysfb_apply_efi_quirks(struct screen_info *si)
>  {
> -	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI ||
> -	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
> +	if (si->orig_video_isVGA != VIDEO_TYPE_EFI ||
> +	    !(si->capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
>  		dmi_check_system(efifb_dmi_system_table);
>  
> -	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
> +	if (si->orig_video_isVGA == VIDEO_TYPE_EFI &&
>  	    dmi_check_system(efifb_dmi_swap_width_height)) {
> -		u16 temp = screen_info.lfb_width;
> +		u16 temp = si->lfb_width;
>  
> -		screen_info.lfb_width = screen_info.lfb_height;
> -		screen_info.lfb_height = temp;
> -		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
> +		si->lfb_width = si->lfb_height;
> +		si->lfb_height = temp;
> +		si->lfb_linelength = 4 * si->lfb_width;
>  	}
>  }
>  
> -__init void sysfb_set_efifb_fwnode(struct platform_device *pd)
> +__init void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd)
>  {
> -	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
> +	if (si->orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
>  		fwnode_init(&efifb_fwnode, &efifb_fwnode_ops);
>  		pd->dev.fwnode = &efifb_fwnode;
>  	}
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 889e5b05c739..916b28538a29 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -155,7 +155,7 @@ static __init int sysfb_init(void)
>  	if (disabled)
>  		goto unlock_mutex;
>  
> -	sysfb_apply_efi_quirks();
> +	sysfb_apply_efi_quirks(si);
>  
>  	parent = sysfb_parent_dev(si);
>  	if (IS_ERR(parent)) {
> @@ -200,7 +200,7 @@ static __init int sysfb_init(void)
>  
>  	pd->dev.parent = parent;
>  
> -	sysfb_set_efifb_fwnode(pd);
> +	sysfb_set_efifb_fwnode(si, pd);
>  
>  	ret = platform_device_add_data(pd, si, sizeof(*si));
>  	if (ret)
> diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
> index 592d8a644619..71f542e37732 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
> @@ -117,7 +117,7 @@ __init struct platform_device *sysfb_create_simplefb(const struct screen_info *s
>  
>  	pd->dev.parent = parent;
>  
> -	sysfb_set_efifb_fwnode(pd);
> +	sysfb_set_efifb_fwnode(si, pd);
>  
>  	ret = platform_device_add_resources(pd, &res, 1);
>  	if (ret)
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index b449665c686a..8527a50a5290 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -82,16 +82,17 @@ static inline bool sysfb_handles_screen_info(void)
>  #ifdef CONFIG_EFI
>  
>  extern struct efifb_dmi_info efifb_dmi_list[];
> -void sysfb_apply_efi_quirks(void);
> -void sysfb_set_efifb_fwnode(struct platform_device *pd);
> +void sysfb_apply_efi_quirks(struct screen_info *si);
> +void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd);
>  
>  #else /* CONFIG_EFI */
>  
> -static inline void sysfb_apply_efi_quirks(void)
> +static inline void sysfb_apply_efi_quirks(struct screen_info *si)
>  {
>  }
>  
> -static inline void sysfb_set_efifb_fwnode(struct platform_device *pd)
> +static inline void sysfb_set_efifb_fwnode(const struct screen_info *si,
> +					  struct platform_device *pd)
>  {
>  }
>  
> -- 
> 2.51.1
> 
> 

