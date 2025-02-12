Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E9CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pZ4JaDu880aYdD64xQr26gJgkpLcEjZGdougVKZC6A=; b=Oi4NEp+aiVIiat14PRg590mIyK
	QkPYFILr7zTT7FRHw/DC+UJsZ57kCw8QMc04yAcoFYG2xRYU1Y/2l06RuEs6QDT4iAgL4p1ufIY1F
	dyY/+yp+sTd4UF4y0xB3roA6h8izHYtVMwxkLrfrMQBY901xHsyzZGu4EmmVAXfJ5zHWViQJ+JfZQ
	XHSVUJBXkrLtX/CQOIixE3t43fEbQZYOUOpr1PJv06c/HJpedyKEzwjbRkUOx1d5kwjbuh6rINLPW
	k6PpBQ1+vu7TOR8OiXDVVGuA/PbdNq0bizOLhSK3B92vFOK6ySgIVzicMWF6loGJpLVFfxCF17eEc
	8y9MAspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHdh-00000008VIo-31Te;
	Wed, 12 Feb 2025 18:39:13 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHbb-00000008V08-3d8i;
	Wed, 12 Feb 2025 18:37:05 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso3669e0c.3;
        Wed, 12 Feb 2025 10:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739385420; x=1739990220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pZ4JaDu880aYdD64xQr26gJgkpLcEjZGdougVKZC6A=;
        b=lk4klJTuNE0puKqxsFfgpGXcCmc5fyEYELjqV82afXFKn4OP6+6YLupjvxVngLU4Iy
         XEqHJ2Qx9TdtJfcovLWPJuPheIEMgZhYUljSXxrkn9kDrbDZQmqlJFvlOTBXQetJacor
         NuKilxc5c4IXillQWg4V7nVk6ZKnKXrYAS/k1nKffWxBQ5cqRJJmFMPdXGaRhCUdGxsr
         YUhFAQB4bC57vLPWu2G24rIdm+A31ctPByLVQrxgGzwlr7Vmie0URTpUN1Qvl61Jt8sq
         4/VImQL+zcmipWTD7oipIFD85RA4Jg7BbmT1xEYTk1qUZy0G1C/aR+44uP7CZdwEhzD6
         YvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrmt0CWCDLYqRAsydiYHIdcw/E15Dr4+k601JT2TS0PpMVh8BvHiUDNn0qBtya+Tolx6CPM5/D3WwrUW6GYqo=@lists.infradead.org, AJvYcCWQ4+8tLtAy0k86pIU+SyXVOikhhim1y4vSaM7HlrUUAkwgSBhxiY3toUXpt0SavtxlSCkEe6GstI6koEhDw5KK@lists.infradead.org
X-Gm-Message-State: AOJu0YxbcMCMkbChacOCEswH4TYxKXx0+/WhJYKYFCc0MjEoJD3k/Q2p
	VEIuDlSM97XH7Bcu1mcejYstj2KVCr4F2RdfAESRTEHkm0BKw3dhOY/6RUtyQoU=
X-Gm-Gg: ASbGncuW//tZgI7h4xCxFIDFL9gYE48vBiCZ6i82YMJa3cDapNBarY7un9BzS4EpLeA
	AAr5lt+rKTMDJiLdDe7jg3go3eW5v8I2PCcNngdD8qSDUWw/H4dkZU/9eFw8uFXaU3+qaAOya47
	ePb7peRXgz8t3dKNBuj69LSNn2jwRRDfiWOXag/PJ4T3Z4ourlnWbfCJ00SNfbj/IIMSABEc0BM
	wqVMJ4aKb8PvhxmfRJqG0TE6nxQb1mzvktSlKVqaK6MpcB9mCugZoVH0ssxcmmgZhwbVqYsbZsC
	Ubk2RqVQlFCMH6m/OcMPyua3B8VyaYX5XlMcz776jXxUEhnRNyGZ3w==
X-Google-Smtp-Source: AGHT+IHozOUGMFJDcg43/NCKNqDBX1vdcuOBRxeltT6spacEzGh8xEUWXZEh7xBhbdrwk7F5H+yzLg==
X-Received: by 2002:a05:6122:1689:b0:520:652b:cdf9 with SMTP id 71dfb90a1353d-52077e263b6mr403661e0c.5.1739385419876;
        Wed, 12 Feb 2025 10:36:59 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5205267841bsm655047e0c.39.2025.02.12.10.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 10:36:58 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-866fe7d07d0so29515241.0;
        Wed, 12 Feb 2025 10:36:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4bjyXNgE9UqYPgvVeDDefZ7L3+VzLedmLgwBEyLGsmO+LhYar9HWpbIeJs85OxxcswQW4fceQz2s7YlfyTPEh@lists.infradead.org, AJvYcCXW2T7YdjoFsxbZKWZRMEUkGXOyZx8bFBQRvTL8Hv98iiXb+k/QtMvcAM9N9qWpSjR2KqC6bIp7rPF0Iw9h6pg=@lists.infradead.org
X-Received: by 2002:a05:6102:2912:b0:4b9:bc52:e050 with SMTP id
 ada2fe7eead31-4bc0351978amr1135729137.2.1739385417570; Wed, 12 Feb 2025
 10:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com> <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 19:36:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
X-Gm-Features: AWEUYZmLM0E1ki61JdMJvvq0q2FTXGeHJ8gpiMKPNt5HXp-8AeEKkxybEg-3nNk
Message-ID: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_103703_903437_F5A1259D 
X-CRM114-Status: GOOD (  26.30  )
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

Hi Andy,

On Wed, 12 Feb 2025 at 17:35, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> There are already a lot of drivers that have been using
> i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> to have the similar for 10-bit addresses.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
>         return (msg->addr << 1) | (msg->flags & I2C_M_RD);
>  }
>
> +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)

Having never used 10-bit addressing myself, or even looked into it,
it took me a while to understand what this helper really does...
So this returns the high byte of the artificial 16-bit address that
must be used to address a target that uses 10-bit addressing?
Hence I think this should be renamed, to better match its purpose.

> +{
> +       /*
> +        * 10-bit address
> +        *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +        *   addr_2: addr[7:0]

I think the second comment line does not belong here, as this function
doesn't care about that part.

> +        */
> +       return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> +}

Probably you also want to add a similar but much simpler helper to
return the low byte?

> +
>  u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
>  void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

