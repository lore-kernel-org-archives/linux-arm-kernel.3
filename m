Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9DDE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNZVSXjVxH1eQkOT7lQSAOIyjM/HYvFDSZC+egPazHI=; b=lRmsbuH+8eJdb5BgNrXPaEzByP
	tH6ajhrdh/kck6IUi/t9tjUEry4gmyl73NiqzPY/tsLRAJXYjbqlTcjHkD6QOeyc0TTzZ/Zh814jv
	/WVXnjk1YuC0fIkUVw0UTUE/HWYHXYXzB6khTi5vJECCTg1PkPOZndPbklAzvANFIQNCEgYeoklSP
	LalmstMTWFtiTK7usbS2bQSgjhG0lcGiObkl/16Cxh12GS/YgbRZQKIklCi0Pbn762UVOH70b44ZF
	QfWUUc1gObA82XWUxZai8swRFlo59Z4n/FDiYPqBLry35YMQY34efPvxpckdpyXwRQBlxoagra9Gf
	WLTBH7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1G6-0000000BDkh-1bd9;
	Thu, 19 Feb 2026 10:27:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1G3-0000000BDkM-0Riv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 10:27:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4359a16a400so701437f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771496861; x=1772101661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNZVSXjVxH1eQkOT7lQSAOIyjM/HYvFDSZC+egPazHI=;
        b=Mng3NJU3YZDeTgk6MFlL43y/35eyk1Y5wvCUDlv/FUp0uK8DNlWUGXglgMUy+xWOxf
         rPqk4rYl6lU3drygyJwnxlPUKbkEHt7rvORNkhUSh1qq3zIIWwLenA8dG3ajTax68Wxy
         KHFDZBa6lLPLDkHQPkAkFTj88iUefuL8pOAzmVQv1CRCynsjDtxB/Zw1OKwEcPR2uR3u
         tVaSoPzK7R8PHUPNvyAnTtxYnkLeQrSSCB0VnUPCLVUkKMxgHQj+kLQF4OXgmxlEymHX
         o6Xbbv+ZxDu23GkXmUMpD70DU5YkmyMkcZvViopoTzQ82oTFyns7BClmXJAiRjynUiPc
         p5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496861; x=1772101661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNZVSXjVxH1eQkOT7lQSAOIyjM/HYvFDSZC+egPazHI=;
        b=wWGe+z4OVCiHgWHaKUbPdZy7l/9lEJUul80iCJnVc1gVEWZXxKeGegkPnkHcFZzEr1
         loCceNlqpTW/ajG/qhH1JQfSm/KnU0GaBJ69BeWcOc9nmk0qOgrnSRXfMsr/Pon7f38h
         xZztkbUeQLr8UjMCneY5kKSJhcBpcDqlUifMCoeyTtu2HB1OsIaH8GbzQT8LM8nXILq0
         O6hEDkeXxyQuaKlq11utuE1dcKUuKYnoTn4RqJnU+ybZRAjUq2PDU7WRtIoV7ohxarju
         UqxQWkLDPXoTaL4FImrv3wWMlO09pydAS879nKmT0S+gUVaKJ5/6GsNJKnAJx5keei2r
         7LkA==
X-Forwarded-Encrypted: i=1; AJvYcCVMknjk2zB6AraRqalZHbj7RIF5SLMXe1OeUzlajVsIo6QRZL3/QQ9QjI/T6dN8A1/eE8WDWEGPmxtnjy8ZXdQW@lists.infradead.org
X-Gm-Message-State: AOJu0YxbgFXTMHEEm+mQy+G3Hg3YpPzUK0FgodxjLvXsXDblOEFW+1/Q
	Aqj+IjzMfNd1IvE0WIzSTItQINY96dyJ51CodzVRfIA9GbOX8C4l/NDjLOyVC2LFiXU=
X-Gm-Gg: AZuq6aLhx/Ptm05Dtghm+Ulfn7TWGqi1RbFQLMzDJYXmEIdkGo01vXMc6voloTHVlqX
	ryd+KBvN7nENef3QWTUVDND1LDbZMHQg6bJxcwxMOn8lT26dCQwn2+qLyFjdowNhUkUIrlbzb/t
	2lPaOK1TBysVrcEsFMH6mw7hEcQVudpcf+//+rm4hDXxoGfu/osSImGbxhhYfvPmHG93XJA0kj7
	ojm5Zi4DL8zRI791QQJhrDMxid0G303QrkQR/Wp5NeMDzf/RfyQfmQi0iOdHWObysyNsRGRS6om
	QDL/xhmDwslzhguioiDLmRsrielnVbGqZqYYo0vWcjhr+Pl4QvqtGd/NhFK/lM+ZYqtL5gKRDtG
	b6kxT5jesJ4AershKfj1XXyDeCUwPBEzabVROXmsrHSvSdaO97Kav7XJp9cfA3Wp2g+eAaFWaeL
	AUIR8yfTHvI8SHwslhAUHg56EBGNGpyl7G
X-Received: by 2002:a5d:5d82:0:b0:436:da9:4371 with SMTP id ffacd0b85a97d-43958df1144mr9512620f8f.5.1771496860699;
        Thu, 19 Feb 2026 02:27:40 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc8b1sm50341008f8f.23.2026.02.19.02.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:27:40 -0800 (PST)
Message-ID: <c9d056fb-b2ae-4631-a2b5-f55f214adecb@linaro.org>
Date: Thu, 19 Feb 2026 12:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] firmware: exynos-acpm: Count number of commands
 in acpm_xfer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_022743_218031_5C722C24 
X-CRM114-Status: GOOD (  23.28  )
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



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
> counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
> so could mean length of the buffer or length of commands, and these are
> not the same since each command is u32.  Rename these to rxcnt and
> txcnt, and change their usage to count the number of commands in each
> buffer.
> 
> This will have a benafit of allowing to use __counted_by_ptr later.

                    ^typo, benefit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
>  drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
>  drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
>  4 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index 1c5b2b143bcc..55ec6ad9d87e 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -25,11 +25,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  {
>  	xfer->acpm_chan_id = acpm_chan_id;
>  	xfer->txd = cmd;
> -	xfer->txlen = cmdlen;
> +	xfer->txcnt = cmdlen;
>  
>  	if (response) {
>  		xfer->rxd = cmd;
> -		xfer->rxlen = cmdlen;
> +		xfer->rxcnt = cmdlen;
>  	}
>  }
>  
> @@ -50,7 +50,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
>  	u32 cmd[4];
>  
>  	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
>  
>  	return acpm_do_xfer(handle, &xfer);
>  }
> @@ -70,7 +70,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 44265db34ae6..26a9024d8ed8 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -63,8 +63,8 @@ static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  {
>  	xfer->txd = cmd;
>  	xfer->rxd = cmd;
> -	xfer->txlen = cmdlen;
> -	xfer->rxlen = cmdlen;
> +	xfer->txcnt = cmdlen;
> +	xfer->rxcnt = cmdlen;
>  	xfer->acpm_chan_id = acpm_chan_id;
>  }
>  
> @@ -86,7 +86,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -119,7 +119,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
>  		return -EINVAL;
>  
>  	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -159,7 +159,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -199,7 +199,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
>  		return -EINVAL;
>  
>  	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -229,7 +229,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 0cb269c70460..242745e8394c 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -205,7 +205,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
>  	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
>  
>  	if (rx_seqnum == tx_seqnum) {
> -		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
> +		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
>  		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
>  	}
>  }
> @@ -259,7 +259,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  		if (rx_data->response) {
>  			if (rx_seqnum == tx_seqnum) {
>  				__ioread32_copy(xfer->rxd, addr,
> -						xfer->rxlen / 4);
> +						xfer->rxcnt);

now __ioread32_copy fits on a single line, without bypassing 80 chars

>  				rx_set = true;
>  				clear_bit(seqnum, achan->bitmap_seqnum);
>  			} else {
> @@ -270,7 +270,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  				 * after the response is copied to the request.
>  				 */
>  				__ioread32_copy(rx_data->cmd, addr,
> -						xfer->rxlen / 4);
> +						xfer->rxcnt);
>  			}
>  		} else {
>  			clear_bit(seqnum, achan->bitmap_seqnum);
> @@ -425,7 +425,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
>  
>  	achan = &acpm->chans[xfer->acpm_chan_id];
>  
> -	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
> +	if (!xfer->txd || (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen))
> +		return -EINVAL;
> +	if (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen)
>  		return -EINVAL;

how about:
        if (!xfer->txd ||
            (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen) ||
            (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen))
                return -EINVAL;

>  
>  	if (!achan->poll_completion) {
> @@ -448,7 +450,7 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
>  
>  		/* Write TX command. */
>  		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,
> -				 xfer->txd, xfer->txlen / 4);
> +				 xfer->txd, xfer->txcnt);
>  
>  		/* Advance TX front. */
>  		writel(idx, achan->tx.front);
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 2d14cb58f98c..422fbcac7284 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -10,8 +10,8 @@
>  struct acpm_xfer {
>  	const u32 *txd;
>  	u32 *rxd;
> -	size_t txlen;
> -	size_t rxlen;
> +	size_t txcnt;
> +	size_t rxcnt;
>  	unsigned int acpm_chan_id;
>  };
>  
> 


