Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOVYg7z7CFz6OzK6aoZCvfA4lRKGWxPBEQ2vsHHrQGA=; b=3OM/XtOSPEMnImYSX7kA/B1ess
	gjPqRBw/xsz3BjEapUZq0g+qFDyCGMcwAaAkSGhpue044miET6I90AKkBm2pApVezQ78UnBQHUf+/
	qXhk3caQ4+HUAjN+zc8G5Lpq2KjA9+WYbnRjm/jReF5NS4QOCasyRV6NHW3Hcoojj6PTT7HPUYAOp
	MJcZSH2ISNlvupF5aqUcT13zR5C+L2g5uWDuBlYCkEa4icQf5T5eDL3JYZTcYXsmRixBS6trb5QIW
	HeSApcJScSwhm2k2lM8Ebjd/Usp+Vn//yHv2FnYqFCjOH0980DzOXo3aFebwh62fsJSQfOMGMo7kO
	7Prdoj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Ya-00000001ZVa-2HRc;
	Tue, 25 Feb 2025 21:33:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2RC-00000001Xfj-1IMk;
	Tue, 25 Feb 2025 21:25:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f3486062eso5120074f8f.0;
        Tue, 25 Feb 2025 13:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740518757; x=1741123557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOVYg7z7CFz6OzK6aoZCvfA4lRKGWxPBEQ2vsHHrQGA=;
        b=TmEY85ekfgbRpYn0OwjUJrqy1/elzLN9Aq9wtHj2cuvvPWXoBwWMrewoXRELoxFnKn
         Qh6f95o/0ajxkDHWmmVQqdTQqmhfxnh00AzXPoA59sblQT5s7Yz+fSDjifkJT1hRBG0i
         e5HUPztdNBAofXPOQKlpWLezK57pcicAFjqXGVTyLJWPxs82/EDdQIEXB298P92Z6LjZ
         9iBTjQS+uavy1X1WOcydmgoY09g+tQiHM3s6XLjicqlXiD/TawgEVS9LJj4xS0RsQrDR
         H6wcI2aW5K8Tg1B5X1mi8J4ZNRz7hXNygGTW7cahsbskBaxO0RFAzTMRya3uI+SvOzap
         Hyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518757; x=1741123557;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOVYg7z7CFz6OzK6aoZCvfA4lRKGWxPBEQ2vsHHrQGA=;
        b=d6iPg71jvd8pW74hjuks7OsiqFOEFI9nWYna1L2Tf7O5OmWuSaWjCdd2jkpwr9WyKk
         NBOIZhAY+8n0E3PFuJbPWC4+yqelPu9jN9Ei2hbygZZWA9TPmT5Avl50e0nbXOULXPIM
         xiR0H/9ga5eEptI8qIrTYHdUUSdV9hG/fHwDzmsWyE3QHGtvkeGgwRJp6hNXECYwXotf
         uv/xvxZ3KXItVm7wq5zi0mC3elrhJ3vR/aUkBjGNN6cwEFYTcsoE74FmK0NsTLlppJix
         y5tUMBgc/lWRFRznUtBDvKDTRz47OrWQQKDg0iiQzTp8C70meI5imCR7jsG5R8a2JOnY
         TJQw==
X-Forwarded-Encrypted: i=1; AJvYcCUTDclwWStQAcEi3bpsLIBuZ3158YoDKndKMSxWjhoYyp5k7d3ymCz3ZZWfeCqcxy+CKr8VxU6ArSrFmjtk9XIY@lists.infradead.org, AJvYcCVyPJ2rI8kW6eWkhbl4g7iaj90tiwQWe62zotzqb1E+BRDNRCXNC7gr72Yz/ymdKe0a67Ak9x5fzfwsKr35Tr7GDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoc1Os3tT+Uvolor2N3uniwKcRvOJlv5wKgcUPjk3LW4HeEhrN
	/fBimo7wjE/6s4GBMzAhM0X+3A8XxCVHx+fxLmiVj/duatS/8JU8
X-Gm-Gg: ASbGncsmFDgwIIy6a6k4Hv2F9nZb7IV2EavvxP9j31GJCl3gJzGGnozJHgDXIYWAvoX
	agszN5xgjs0oLshedyq2N1gPBNR9O0KmiqsF/VxlPr0kzZUcYw6qFLyG7J/lcb79QKgbKEaAlvM
	80D061h3NKJxuVjunvu5hzZ0Tfu7ISfKprgqoIg3I4MCpTGqRW9S6Fg7Q1St236otJ0WWtbDtzE
	lCcczdFtyYfGzPAjBFs0IKhh/IUVhnnr2Ix+ZBg2SIDMNQ10KtsDIDryimOyYpzbyyFjo1FKbXG
	eeg2rVd8eljJdcn+VxBL/sn6ywDrL3pS
X-Google-Smtp-Source: AGHT+IFfqGmg8jaTYe3aHYa+NHD4Q/7RkKXcFvEdnIfsyLNJdQHUHBv+JCKoX8hHOdin+Y9uJL5Lww==
X-Received: by 2002:a05:6000:400f:b0:38d:dc57:855d with SMTP id ffacd0b85a97d-390d4f8d921mr716558f8f.35.1740518756474;
        Tue, 25 Feb 2025 13:25:56 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd867144sm3521950f8f.7.2025.02.25.13.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:25:55 -0800 (PST)
Message-ID: <04572f32-4203-4a9d-96dd-7974708f4088@gmail.com>
Date: Tue, 25 Feb 2025 23:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: rpi1-cfe: fix pad in call to
 get_mbus_config()
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250225212031.188987-1-demonsingur@gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250225212031.188987-1-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_132558_354061_552B7211 
X-CRM114-Status: GOOD (  16.37  )
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



On 2/25/25 11:20 PM, Cosmin Tanislav wrote:
> The source subdevice might be using a source pad not equal to 0.
> 
> Use the already existing source_pad field of cfe.
> 
> Fixes: e7bad98c205d ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")

I used the wrong Fixes tag, this is the correct one:
Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")

> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>   drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 69a5f23e7954..7db4fe5e0fd4 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1206,8 +1206,8 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	cfg_reg_write(cfe, MIPICFG_INTE,
>   		      MIPICFG_INT_CSI_DMA | MIPICFG_INT_PISP_FE);
>   
> -	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config, 0,
> -			       &mbus_config);
> +	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config,
> +			       cfe->source_pad, &mbus_config);
>   	if (ret < 0 && ret != -ENOIOCTLCMD) {
>   		cfe_err(cfe, "g_mbus_config failed\n");
>   		goto err_clear_inte;


