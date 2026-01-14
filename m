Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA2AD37E3A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngcbeZxEgHt+JNZ+WGmatkfACIVP9YV9ttrHXNi6YxE=; b=4QsgxW3cuO4MhI0oK3xjk12UnX
	lgHkqysVsQVtz5uAO+Tz6yAcujvrXDHP0iq8T22nAEtDYSAZLTkOC2LPqwQGkOMpZkZPRcmJb/pzj
	GkwHYjeHqTCJzPyPzUumdgPMPEfD59Kr/urOq5FICX6oUtT1YlsQcYNcMZH/ncord/skliYRjbWh5
	lGlIuuGJHeHOxDscE5i0jKuF/l6BCbHd+SthMjwxLK89FbOUiG3GF/BLfTWAgmTA4pK6wpIv69Ksq
	qeP1Hrk66Nsa4cgahzBzUSmkElcqj1Ljotgr9vHpgNz1m4s4vlC7ILBSTCXYoYAOQy+vVbWF0xkiL
	rmqLVPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1e1-00000009Tf0-0vn3;
	Wed, 14 Jan 2026 14:14:45 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1dz-00000009Tdk-0YS2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:14:44 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8c52e25e636so168121085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400081; x=1769004881; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngcbeZxEgHt+JNZ+WGmatkfACIVP9YV9ttrHXNi6YxE=;
        b=ILvbjAwTEZPEJhmwBA7r3+yIIXZsvkhOi9zf0LDsf9Qea005XzAswxxHmWLgB49iq3
         ytvn/rvEcd1YRu5Kts0QnhIZSO5CrenbsJFzhJm38Huc7up6N8jj4PZp/q0N0zl1G26u
         0OXfZd2JnC0P0J402B+qI7nOn0hwVsiOvicUpL3dIvvwkqdlzgiAorfwV/dGCF+5cgoC
         W7YWlk3l/vskDN4CgZW2b7VfWm/TBKDuuFV4jXCtICqmLHnLGWYAi1WAULmdBkMUPF8o
         zgKbsypB+C+p2PGGwZ6ZPo5IDS6fmizKb/W6ShqXKu6V7Rc6yB+Epg9WRNalk72xTt2D
         XpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400081; x=1769004881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngcbeZxEgHt+JNZ+WGmatkfACIVP9YV9ttrHXNi6YxE=;
        b=pIkDR5IGiOo5S2UV9MN8B6MDw/7O7KtH/AGOb9SJX+e5kmaUbAirKhnsaur3kvP8M9
         +I+Cv4MPdydlqZRHqCbQn0VL1UEzPLQTtijh4FUMxSqXHhbxG6UgD/8eP8KN/6+OxDHf
         /KXa57UxmZALQ0pXaKakuwxqmqDWtB3XGyj55wyOH9BJMcttuvnLxt7oiKBxSftLaKHf
         Wk+lbW3ivjYkEZdSwrH3M8IiksMNfkHtkUv7p/VjImgZXqbQp+De/K/BeHnVGSlEYmvx
         /0C9i/7U0y/w3x/wRWetEoW2DQo1UEdlfV/lpu3wlgIcRLDYJYCbmoXTt5jNs3i5wlU6
         s45Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4k8F6ZPvwSe1BvXagtQ8Axp6vMUVFhz9gF1vtwlEkjcXwAkz+F5xfJ1x9FoeuBmlKQGpl0guKycG1hDfd1V8I@lists.infradead.org
X-Gm-Message-State: AOJu0YyruSJGl8+OTXZIpyb1eUWJWxbFUkVAaMIbZEmFvRBkhzBcsQLe
	aWpDBM9NkLt9qv0mLlH7ycZhjayZLqh4fXJiJNKRfh8wnUfYA3sV0R7b
X-Gm-Gg: AY/fxX59ogbisKAjUwiu4DrgV0Yn80P8croOo6QAmoWZ13jq91mt71OCg6+mc6IrrcQ
	tHuFKFoRXy0kl2sMt2ZZgMdNDVNhAhqAd05aRzWkTfXtagX5Hv8I3lwdyjyCxxBCyLbZduZ4MkF
	zLjuJv8ikoKGFLtMqAJ32YeXM3zab9tgWm5GW0FieLZVEJ53+LEEXlffCzXN51K+ZqkP/gaGYsO
	vpHR6J2rJuc+a4/SlGuvNJSOfI1FGUk27b3LXtE3AKZAkJwiddUXNvF9Z12OI36//Z4xHJ1C23l
	qVPFzSF8nY+zof224gOcXyZuI8zxTKUBrAXpCuuoJLdWTqTzrnfrU7NXsN+GlD5GK56u4MtDuO7
	YcF6RLusQF3wEqPUX50cp0AyWTB8G0j+6dkRbtYWU9gNXV+BGqrXd+t77KZqooACaW7rqW1DrE1
	OaeIpDjg7HNE59sathAxhWrVecLNNPY3gUG2Y+LigWpkp/L2IhyBvQ0sUKK+jTfv9jqzNBlsRdj
	Y8k
X-Received: by 2002:a05:620a:372a:b0:8c5:2eb9:7be8 with SMTP id af79cd13be357-8c52fb9a133mr375377585a.47.1768400081038;
        Wed, 14 Jan 2026 06:14:41 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cdfb0sm179880536d6.6.2026.01.14.06.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:14:40 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 14 Jan 2026 14:14:35 +0000
To: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	broonie@kernel.org
Cc: linux-spi@vger.kernel.org, michal.simek@amd.com, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] spi: spi-cadence: supports transmission with
 bits_per_word of 16 and 32
Message-ID: <fu4ujdxwlhyhuwjtsiebje5pyc32rfs52vo2gyy7nay2krkxeh@wpls44xdfgy4>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
 <20251031073003.3289573-3-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031073003.3289573-3-jun.guo@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061443_181509_BFDBFB21 
X-CRM114-Status: GOOD (  14.35  )
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

On 25/10/31 03:30PM, Jun Guo wrote:
> The default FIFO data width of the Cadence SPI IP is 8 bits, but
> the hardware supports configurations of 16 bits and 32 bits.
> This patch enhances the driver to support communication with both
> 16-bits and 32-bits FIFO data widths.
> 
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>

...

> +static inline void cdns_spi_writer(struct cdns_spi *xspi)
> +{
> +	u32 txw = 0;
> +
> +	if (xspi->txbuf && !IS_ALIGNED((uintptr_t)xspi->txbuf, xspi->n_bytes)) {
> +		pr_err("%s: txbuf address is not aligned for %d bytes\n",
> +		       __func__, xspi->n_bytes);
> +		return;
> +	}
> +
> +	if (xspi->txbuf) {
> +		switch (xspi->n_bytes) {
> +		case CDNS_SPI_N_BYTES_U8:
> +			txw = *(u8 *)xspi->txbuf;
> +			break;
> +		case CDNS_SPI_N_BYTES_U16:
> +			txw = *(u16 *)xspi->txbuf;
> +			break;
> +		case CDNS_SPI_N_BYTES_U32:
> +			txw = *(u32 *)xspi->txbuf;
> +			break;
> +		default:
> +			pr_err("%s invalid n_bytes %d\n", __func__,
> +			       xspi->n_bytes);
> +			return;
> +		}
> +		cdns_spi_write(xspi, CDNS_SPI_TXD, txw);
> +		xspi->txbuf = (u8 *)xspi->txbuf + xspi->n_bytes;
> +	}

cdns_spi_write(xspi, CDNS_SPI_TXD, txw) needs to be called regardless of xspi->txbuf.
Otherwise, there will be no clock for the read operation to work.
This is a bug I am seeing on a Zedboard running on 6.19

kind regards,

Rodrigo Alencar

