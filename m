Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319EBCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSUd6Iu5swY1yI3rOZ1kFsJAdObQXxI7F4AS/dEiKfI=; b=OS2NaMuSXIUpv60ewIwS3v08LN
	JHUBujdAC0kz/ZSWJW0i78T61cbDiiETl1Tjyg+GV7j5Ywl3MbhH1CVmVGS2AQVC/Um88edEMU+i0
	7kPY96T3f7vU09M+6gjtVyDTraFRn5MOGK1pj9Q4YDvVs+fmmCKljcPq0Lt8Z1n7P/v7Q39ey2Xq3
	HV22bpwX/4fI2dGr/k7P21gxLOdHByIvAWsaeswPlIrfZdZlvcEzfOHnLjYH+YCtR6YX3X94Q8ZJd
	srFlsBwKk18eT1jgmhBamNlGXhstvKte29OwfNFP/hioIYyl/XlyHwYZqAbnsYClJIWGXNMUN58ie
	ObixUQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSsX-0000000BLe5-26Xw;
	Mon, 24 Nov 2025 09:29:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSsU-0000000BLd9-42tL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:29:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so35944155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763976536; x=1764581336; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSUd6Iu5swY1yI3rOZ1kFsJAdObQXxI7F4AS/dEiKfI=;
        b=Ak2HaKGyKStPV31Zvg3vHaToYgzVKGflCwrbyMeNjI6C+x/iWw30bRVACL30CYQQsz
         vSoy71n/vemxLqDhcpyhHqLHLvzMEiG+GyZxAR43tsCd5SF0i+OcZWRFF5K/8QllG+pK
         eD1TVJuqevbfZfRnvN8z04qyFuXLP9dRC5nVKnYZz8QMlAFunFDuHgpKea0NkhqLzP0U
         AGSWzDoDbV9Z8//vRjq1IAfEYwXtCmoYzMn5zl7FHKPyzUf1PfCsB0/hCh2dFSf68jO7
         0h8/JD9Q8aLCRFIo6kH/PGnABLJp3J1j/H6BiQbkobYmODYStQvWwMe4INk6247EURIr
         bIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976536; x=1764581336;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSUd6Iu5swY1yI3rOZ1kFsJAdObQXxI7F4AS/dEiKfI=;
        b=I6wiwpaCC5tOOfk5WZb1UVLBRr3DoXGv6ofBRNZ72ZflJZZTa/XmxHc0WMftiRqBiY
         YBjMu7ae2zOM+vRLIHxpeOamSJ1KOi8JrQS9i4WOKG8BwcVMhZNNNOCdaAaeNcJb7V4p
         ho7L/9CBCm4oPtOlYHtR00Rzo3LBMxYb6mkwkA4npY9lZkfH/+eTUHreRw5R3hHFo4TJ
         TMEDTd3lJYrXrha6lgrj8cDnaZ56zlAx49mPKLez8y119d/IojgZkS/8Otb+zZarc8D5
         Ws1Wg9rAfQI7355FtCxuagDtbibOAdLeWEAmEevlF8Tk+tlrO5+f9Lx5IvfFUwP7RWyU
         JhRA==
X-Forwarded-Encrypted: i=1; AJvYcCWGBraCCcd6PQCvHjbTIvX8ZVr93tdlPUpjx7QqC2pk3nj/X3xRasDR4oPy9YgsohgiURBNRLvx0APm6gJNQSH0@lists.infradead.org
X-Gm-Message-State: AOJu0YypRcefUgRh8VjJICH4kyqwfZk2g7BIHmzVhCu2CSZXgJQAIayu
	jXLR6+nmZDU3xwMW1N6Cyq6ul8ettW7cO+2GE8owCPk4O0ajV+040zpwYi5sFooUGAvXzVT7Le9
	8jE5W0x74uA==
X-Gm-Gg: ASbGncs5W3T/fhQFZLSbRtXxRctfrIQX5VcB7y5vKcKiAoRx8SieqYpdjBVCgs4Zy2W
	F9WD6HBiB+F7W7w0cOtGswe9lueLwnlJuZ570Ae3SFdO3HgysOUB9jH7lwIEX4CTouC+zxL5ULo
	J7s7NOBpbdnGHMZzM+rSK/5PCUdEaQncUJYUyBxkV1ermNhUkQ3eB1aBXCXFU3nQrTkdU3hI30n
	bwlAIw8swhz57v1sHVLBmje1Y6/VG2NF3ZwNfspNWOiMHXONnIO5uWSzwgIY7EjB3aVpHO4++0b
	5t8PQVmq0Foe+O1YVvXwKmECJaYXqPTxysqjuR48qqkYxjsmob2AhdRoBWNBFbAPPV69PB12ipE
	OLUczvKXbTlVoDHG9VpLrSkwGwdMGq6zSlSUXieUVRVcSbv0FymKyDRyl8rY6VJe30U0NneI2wk
	i2MluztzqQKIz2YBQwIfCuIwOilxHx2g7KSFXWScTZ
X-Google-Smtp-Source: AGHT+IGqX87Liusvu8VA+P6vAK2NQvQqKGFS75x4fPSdpk7QAnEFO6Q86alRxbuZVhECcom6UWrp6g==
X-Received: by 2002:a05:600c:1c0c:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-477c018a099mr145588045e9.15.1763976536416;
        Mon, 24 Nov 2025 01:28:56 -0800 (PST)
Received: from r1chard (220-129-146-231.dynamic-ip.hinet.net. [220.129.146.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b03c7515sm9757191a91.5.2025.11.24.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:28:56 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Mon, 24 Nov 2025 17:28:49 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/6] efi: earlycon: Reduce number of references to global
 screen_info
Message-ID: <aSQlUVPfQrEwXPWm@r1chard>
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <20251121135624.494768-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121135624.494768-2-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_012859_022267_06EA6240 
X-CRM114-Status: GOOD (  21.25  )
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
>  drivers/firmware/efi/earlycon.c | 40 ++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
> index d18a1a5de144..fac3a295c57f 100644
> --- a/drivers/firmware/efi/earlycon.c
> +++ b/drivers/firmware/efi/earlycon.c
> @@ -32,12 +32,13 @@ static void *efi_fb;
>   */
>  static int __init efi_earlycon_remap_fb(void)
>  {
> +	const struct screen_info *si = &screen_info;
> +
>  	/* bail if there is no bootconsole or it was unregistered already */
>  	if (!earlycon_console || !console_is_registered(earlycon_console))
>  		return 0;
>  
> -	efi_fb = memremap(fb_base, screen_info.lfb_size,
> -			  fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
> +	efi_fb = memremap(fb_base, si->lfb_size, fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
>  
>  	return efi_fb ? 0 : -ENOMEM;
>  }
> @@ -71,12 +72,12 @@ static __ref void efi_earlycon_unmap(void *addr, unsigned long len)
>  	early_memunmap(addr, len);
>  }
>  
> -static void efi_earlycon_clear_scanline(unsigned int y)
> +static void efi_earlycon_clear_scanline(unsigned int y, const struct screen_info *si)
>  {
>  	unsigned long *dst;
>  	u16 len;
>  
> -	len = screen_info.lfb_linelength;
> +	len = si->lfb_linelength;
>  	dst = efi_earlycon_map(y*len, len);
>  	if (!dst)
>  		return;
> @@ -85,7 +86,7 @@ static void efi_earlycon_clear_scanline(unsigned int y)
>  	efi_earlycon_unmap(dst, len);
>  }
>  
> -static void efi_earlycon_scroll_up(void)
> +static void efi_earlycon_scroll_up(const struct screen_info *si)
>  {
>  	unsigned long *dst, *src;
>  	u16 maxlen = 0;
> @@ -99,8 +100,8 @@ static void efi_earlycon_scroll_up(void)
>  	}
>  	maxlen *= 4;
>  
> -	len = screen_info.lfb_linelength;
> -	height = screen_info.lfb_height;
> +	len = si->lfb_linelength;
> +	height = si->lfb_height;
>  
>  	for (i = 0; i < height - font->height; i++) {
>  		dst = efi_earlycon_map(i*len, len);
> @@ -120,7 +121,8 @@ static void efi_earlycon_scroll_up(void)
>  	}
>  }
>  
> -static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
> +static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h,
> +				    const struct screen_info *si)
>  {
>  	const u32 color_black = 0x00000000;
>  	const u32 color_white = 0x00ffffff;
> @@ -145,13 +147,12 @@ static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
>  static void
>  efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  {
> -	struct screen_info *si;
> +	const struct screen_info *si = &screen_info;
>  	u32 cur_efi_x = efi_x;
>  	unsigned int len;
>  	const char *s;
>  	void *dst;
>  
> -	si = &screen_info;
>  	len = si->lfb_linelength;
>  
>  	while (num) {
> @@ -174,7 +175,7 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  			x = efi_x;
>  
>  			while (n-- > 0) {
> -				efi_earlycon_write_char(dst + x*4, *s, h);
> +				efi_earlycon_write_char(dst + x*4, *s, h, si);
>  				x += font->width;
>  				s++;
>  			}
> @@ -207,10 +208,10 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  			cur_line_y = (cur_line_y + 1) % max_line_y;
>  
>  			efi_y -= font->height;
> -			efi_earlycon_scroll_up();
> +			efi_earlycon_scroll_up(si);
>  
>  			for (i = 0; i < font->height; i++)
> -				efi_earlycon_clear_scanline(efi_y + i);
> +				efi_earlycon_clear_scanline(efi_y + i, si);
>  		}
>  	}
>  }
> @@ -226,22 +227,21 @@ void __init efi_earlycon_reprobe(void)
>  static int __init efi_earlycon_setup(struct earlycon_device *device,
>  				     const char *opt)
>  {
> -	struct screen_info *si;
> +	const struct screen_info *si = &screen_info;
>  	u16 xres, yres;
>  	u32 i;
>  
>  	fb_wb = opt && !strcmp(opt, "ram");
>  
> -	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI) {
> +	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
>  		fb_probed = true;
>  		return -ENODEV;
>  	}
>  
> -	fb_base = screen_info.lfb_base;
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		fb_base |= (u64)screen_info.ext_lfb_base << 32;
> +	fb_base = si->lfb_base;
> +	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_base |= (u64)si->ext_lfb_base << 32;
>  
> -	si = &screen_info;
>  	xres = si->lfb_width;
>  	yres = si->lfb_height;
>  
> @@ -266,7 +266,7 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
>  
>  	efi_y -= font->height;
>  	for (i = 0; i < (yres - efi_y) / font->height; i++)
> -		efi_earlycon_scroll_up();
> +		efi_earlycon_scroll_up(si);
>  
>  	device->con->write = efi_earlycon_write;
>  	earlycon_console = device->con;
> -- 
> 2.51.1
> 
> 

