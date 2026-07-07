Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE53AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O11o5MEN33Vh1fP73gT+0ZVa3EZdhEdLDt6jcZLOEk0=; b=nteGW6isJs6pSu78sFBtxmPKg2
	DYv987qTB38B7LqqAh5llp15L8sAVrRGyvu4VvvwDslWNV3ZFddBJTxbYFs30mv0MBjuFamUkjChK
	gWbn7xeEW7H2V6d7XWoSvZrP6HqcH7fsmThV4QJaJkioyK+A13BrEGD56yg7mBpbl8RJOCBRWmlbR
	TTGKY8kZayAbFAf7dO7YIwEpub1kkm6+jPR0diQVMwWwBKmq1dwsOKDbauChgWNK8MjXcuQdK6d0W
	qxphJHaVIjSK9n/nglft2w6pM99H78EGlKzqy/Cn0nTszydr4/RGvm5rZ0Hoy0WnP2mc3k/QFDht8
	ClQnf2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCUY-0000000Frw0-3tGb;
	Tue, 07 Jul 2026 20:34:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCUV-0000000Fruv-0GYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 20:34:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47de008b020so640383f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783456440; x=1784061240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O11o5MEN33Vh1fP73gT+0ZVa3EZdhEdLDt6jcZLOEk0=;
        b=RRhkwUCEjFrRw58/vnWJV7zrYOsuSHj8QG/6hT8GAHFb83DVXkqugFukgryt0jDure
         s7xdxpBnwDsGNUtDcYeCp/69ttkUBT/UNPhGqYSDAOZb+hfapYZdtZK1LbaOGDqy0SbU
         7xTQ9eVFx7MsxW/yOwrNEWo/YnPEx/qUGmaVOVL7FzuCyLy/mHedOG9VM/7Xnnt+rRPq
         /T2Zuw0qtBktsqHY7zg1rTFOIMqd6Ln4kmI4QnCYYHkJcZq3U8qyGk5r7WSpItMyNyJ3
         DJnTpU7GFUvRIbKtVxSyJGtqLLlrmPmc9GnsA2cOoUaKe6qusTUHmpK4QF76h0pTRPMw
         GGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456440; x=1784061240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O11o5MEN33Vh1fP73gT+0ZVa3EZdhEdLDt6jcZLOEk0=;
        b=HsxFm7maO5vIlsmTJwekLxMyTMaQytINXlVsyMmLIPIzthYR7tJKuw/VRPDnNXwYTr
         vuE1hDmCHBO2tww+DkmnO4Hihex3YOa/sVdDzMkf7ghcWPT34u5K8qhyqAcQa934Bj77
         CyWqwv+FZKJ+dKDPABYYDY1GvnQUcO1zjqPYV3QPAzgoRgsavrtJoL6MRFnR61aM3MnM
         c2yQOMqrTjng7aBO/Q3+loWob1aMLCwJowIolONrO3G3VJiqSJHqMQ1RUF6UFFOMszsx
         nU+b4HwW1kuDk/zy9c5VuMTLfqr2OpPb9erHJhtx+Cxopq3XVK9ipZ/uv2IWVZKYnI7Y
         yH4w==
X-Forwarded-Encrypted: i=1; AHgh+RqwcxVMzBuqyxWqr2cFOL4MMXh3fyFfYxvis04097Oz5Qa/9IZozOz2vhtCNx8dBMKyIx6QlEFXYXGgb1XS9HD4@lists.infradead.org
X-Gm-Message-State: AOJu0YzXd0XZIh3QEiNoq+THDONNSxiZ01cYaV682x8sUQD0dOP0O+4a
	zLge5K+Vf/91zSMpIEzIcTJ88FVTKVAAZEoQ9HFPQTJVSEW9UU5TztaSgglB+pHpkcg=
X-Gm-Gg: AfdE7cnaV0FlFSnEg+ioQt4h2GQqKgW8aJavCbr8XXcy1/bl2t+FnRIzmxsuuEQ+i4c
	IqX04ybZDCM8agE+CjpqmayY83nG/G6YoDYepadBpaQXgV1+JsaKNrfmhMfDGOC6L2mLctGV6Mw
	U+oA8NL4VPF/9LRG/5XUtskr1DHbI00weWT2szSWqJSwlj0pDnDP2DPbmxWkTenJqoVXPNVLpq1
	8VNLQW5V3+SFVgyoN+rSo5Qw87DXemkH/jnvZ482DLDcaRigT9prImHu3r9nVSGZgUsepCElh/s
	12kSfEMNeiHPcuWcThLaWeK6w5C//2qATpuP0GXc86yGGKK+fmYZwEuM2V2Rr9dx/rwi1A1du+9
	7P1q6kn22rH9iwF6ZQqQfbSyyr56Ha6xbtQztFiIeQBLhjJQmr6hlNgJ51IuEeCjvSbBN4MYXd1
	fznMk2Plrm2Uf+Vl4=
X-Received: by 2002:a05:6000:2891:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47de9a41059mr5106546f8f.29.1783456439812;
        Tue, 07 Jul 2026 13:33:59 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm36801444f8f.3.2026.07.07.13.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 13:33:59 -0700 (PDT)
Message-ID: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
Date: Tue, 7 Jul 2026 22:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
To: Ethan Tidmore <ethantidmore06@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260707012424.1661733-1-ethantidmore06@gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260707012424.1661733-1-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_133403_166376_EBE3F84A 
X-CRM114-Status: GOOD (  23.95  )
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



On 7/7/26 3:24 AM, Ethan Tidmore wrote:
> In snd_soc_register_component() error path, the aiu-formatter is not
> being freed. Instead of returning now goto the err tag so the
> aiu-formatter can properly be freed.
> 
> Fixes: 83b83024cdbfd ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>   sound/soc/meson/aiu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 64ace4d25d92..d6b644a53f7e 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
>   					 ARRAY_SIZE(aiu_cpu_dai_drv));
>   	if (ret) {
>   		dev_err(dev, "Failed to register cpu component\n");
> -		return ret;
> +		goto err;
>   	}
>   
>   	/* Register the hdmi codec control component */

Technically the fix is OK, but I don't think the commit title and 
message are correct. aiu-formatter data is allocated in 
'gx_formatter_create' using 'devm_kzalloc' so, unless I'm missing 
something, the data should be automatically freed when the device is 
removed in case of error.
What 'gx_formatter_free' does is simply clearing widget's private 
pointer (i.e. 'w->priv'). I think that not clearing it should not have 
any bad consequence since the pointer would be overwritten on the next 
probe. However I agree that for consistency reasons it's a good thing to 
clear to do when 'aiu_probe' fails.

So perhaps the title should be rewritten to something like "ASoC: meson: 
aiu: reset widget private data on probe error path"?

-- 
Valerio


