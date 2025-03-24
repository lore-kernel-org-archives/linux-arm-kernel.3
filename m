Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5B4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpLay2NRUxXBZBIq5TN4wg5iG7+LcfQc4wrhgea9GRc=; b=sIPwMzTh61xw81HYEZYvoorV9W
	xQefwDmpU2ZR4Q+bpTbWDdZEyJ+iKA91qNS8mETGuleaB8D0OKJF49rC4yqz+lFspx0Vby2SxfMR/
	DfbHrrExgCSa91AqXn6BD0pZT8nBiWzAu6Z7QDBQGks4R3UMpdhiDu/Z/tOO79q8M7TuEHx1eWPEW
	OsiyG0nvnQRcxp7Vphg4trtX9CEMhPic79xSxQDLja77FnZurx/GxJEqH+dmMfLpHuIT6Lu7U8AAq
	hbpbCiyQvljEgWJ/NBMCZPE8YFR3BYRDnosZaRGEx3I/j84nu5k0tCAfjQzK8yVFwMrL0ApYo+qVk
	KV3xqURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhnQ-00000003EpS-1yow;
	Mon, 24 Mar 2025 13:24:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhlg-00000003EGQ-032i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:23:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso43999895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742822582; x=1743427382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpLay2NRUxXBZBIq5TN4wg5iG7+LcfQc4wrhgea9GRc=;
        b=eKM+IOZBai/l94iTfH+pp6HhwlgykFRDaDlzGV5dhPSvaH1aVZWpeR/yGIJzDh3fQk
         O3+nLbgp1o7wjDxUtzJaPrH+SuFq/uMAgnsj/ttErmDWN/F2Yuvf3+Y60sRu7BM/VoVM
         bngNNp9I8Tg85eOw0gh5AtcQ3AgSZIidJOf1po8+NTnHGLVK53sw6260h7suhDBx6Zfp
         qfi/tgtjG3IXy94Adq+hHVA5RsHyvV7X8VpHvJMxxFtXbUqKGA4OnJbjpgbUjItk1TmY
         51hMYY83DwK44PCcsrYQ+ncNrhZYRmMd11jlEiNECWk//4lyRysikByts0e0UJiA5PXk
         BCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742822582; x=1743427382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpLay2NRUxXBZBIq5TN4wg5iG7+LcfQc4wrhgea9GRc=;
        b=oj7OAoqU1QL+Qtx98slwf4yPix8YOEqtpqbVVkVkDhH72y6oefCr0tTkbzgs7Dxhwm
         E/NmdY+UW9sbEa7ig2mNwEZ8ybtLt+ygau5HsHnRTdfH9JB/yX6Ekexlq8idXHZ1/wOs
         +qttGUCX9CXvOyGVoh3JtyrxAlgy2tsHYL2V9oDDSlAwzoX2wdcTJd3DwX/Zd/UEJ3N6
         TjOyptAM+SH8VIHVVXrGavkOHIohiGbu7/imhMQL/eOF3Dh/b4w7HTbRc+SKhEZb44Qp
         fyAQLU+V0bNqP5zQPn1/TkKyGCv3rOvtCe0s5E9KuGpujiKQavNcVvsykjtLqYxqpAxq
         /G2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhsRBUJaqaZlPYgAc2PbBm1THbCqzosUbM0k5yV7i410hKS7fTnXAHMK35X2uLztVP0rOP8Ke0b15HkgHbyGTR@lists.infradead.org
X-Gm-Message-State: AOJu0YxmF3ulctYH36uPrYngfAkcW1IO+yyTcst2oYRbwjJ5JjAUlnb9
	dooVtkVCxiUUlnVKBR6gQFI2sUVCTECeWK6FUsTlpQM3uucolBG0b+F/MPkUbwxwHUrhYxKfdNy
	O1Nk=
X-Gm-Gg: ASbGncusV04pWQZe1jhna4DRJt4xWowl47Wcsu3Bj9czyBcSsADUoqXjlmPaxKnms1q
	lOoUXKN7Hl6MGGjshkLdXD/mUSBP95cdPf6jWzV6ulzDtgL7MIZQg7knBCXJXEzp1L4uz7NTIIJ
	IxFUGRnSrS9zhGVaBGLfNwmTW48+swIOKnr5CW+Eg+Ug3lBPXxTO3EVCxq0FbIejQYYxadPCR6m
	R5AcMHKMYJpKU5tDG+eGBY9NpMBmw0RZnsC0wGk+++xQA5BgjufqAXcNxaEbukfQS8nLdh/Pfso
	yii54ysCWxPcV3cS87MgjTssSk19Gb7imdG+fKEkroFr2UuPj8q5e8g1mGGC0oxtbA==
X-Google-Smtp-Source: AGHT+IEf/zzI0Tp9Ahcexm+a6tN9Lg0kiY6AKaxAwg/q8l9R6KHv3dKYwSmrj+c+Gwc5IajDQJz/DA==
X-Received: by 2002:a05:6000:186b:b0:391:4684:dbdb with SMTP id ffacd0b85a97d-3997f9039ecmr10697036f8f.17.1742822582202;
        Mon, 24 Mar 2025 06:23:02 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b4ce9sm11091922f8f.53.2025.03.24.06.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:23:01 -0700 (PDT)
Message-ID: <9b372589-1c52-4f3d-9f5b-8f729489b545@linaro.org>
Date: Mon, 24 Mar 2025 13:23:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: exynos-acpm: allow use during system
 shutdown
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
 <20250321-acpm-atomic-v1-2-fb887bde7e61@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250321-acpm-atomic-v1-2-fb887bde7e61@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_062304_057197_D4C16589 
X-CRM114-Status: GOOD (  25.40  )
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



On 3/21/25 4:40 PM, André Draszik wrote:
> We need to access the PMIC during late system shutdown and at that time
> we are not allowed to sleep anymore.
> 
> To make this case work, detect this condition and use busy waiting via
> udelay() instead of usleep_range() in that situation.
> 
> The code isn't switched over to udelay() unconditionally so as to not
> waste resources during normal operation. acpm_may_sleep() was heavily
> inspired by the I2C subsystem's i2c_in_atomic_xfer_mode().
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
> udelay(10) causes a checkpatch warning (it suggests to use
> usleep_range() instead for usec >= 10), but that's exactly what we can
> not do.
> Reducing the udelay to be smaller will generally cause the loop to be
> iterated more than once, which I wanted to avoid.
> I could reflow the code to hide the actual value from checkpatch, e.g.
> with the help of a local variable if that is preferred to ignoring the
> checkpatch warning.
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index d7ed6b77a957af5db5beba7deecce13ac7b30fd2..33cde6e88e2c0773fdd36c80927c77d3bcb44135 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -15,6 +15,8 @@
>  #include <linux/firmware/samsung/exynos-acpm-protocol.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/irqflags.h>
> +#include <linux/kernel.h>
>  #include <linux/mailbox/exynos-message.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
> @@ -24,6 +26,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/preempt.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> @@ -272,6 +275,17 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  	return 0;
>  }
>  
> +/*
> + * When ACPM transfers happen very late, e.g. to access a PMIC when powering
> + * down, we can not sleep. We do want to sleep in the normal case, though, to
> + * avoid wasting CPU cycles!
> + */
> +static bool acpm_may_sleep(void)
> +{
> +	return system_state <= SYSTEM_RUNNING ||
> +		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled());
> +}
> +
>  /**
>   * acpm_dequeue_by_polling() - RX dequeue by polling.
>   * @achan:	ACPM channel info.
> @@ -299,7 +313,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>  			return 0;
>  
>  		/* Determined experimentally. */
> -		usleep_range(20, 30);
> +		if (!acpm_may_sleep())
> +			udelay(10);
> +		else
> +			usleep_range(20, 30);
>  	} while (!ktime_after(ktime_get(), timeout));
>  
>  	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
> 


