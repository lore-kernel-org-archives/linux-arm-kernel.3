Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i3BxSlwk;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Jg/I6ZPx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=; b=i3BxSlwkqNrqBj
	vWyvzhBrCfrQEJ0/omaqo1xuKRhXNnARxe8IHstTOeVGRZixWks1BunZENqtBKHxaVHSEACI17oS/
	n5WCliYJMSLhm7CMyZ62Cs6SCH7e/xmDxqN+k48L0RITk0dH09Qv9efKM8Wlk1cEBHaXMyGPsdOYF
	H1jbOT1tcWgZrUDfZzEK6xwjzCSsPRg/iR4ff4L4m4W30M4Dd7MEW469y09UU+Y2bKyi8J5YOJFdO
	QQ6g31FDzQOtPQCMz3MFT4TTlSQqwR6UzsS6tRTS5w2U5/fKxCj0grt4mBjxUzmr9X6fG/M2gia7Z
	GEH5mVTSDRJH+iHOM+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXvb-00000004xZZ-0v9S;
	Wed, 04 Nov 2026 10:09:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXvY-00000004xZC-0nJ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:09:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so5532645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 02:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793786946; x=1794391746; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
        b=Jg/I6ZPxFtl74Lu/eQ629sy18oeeu3hY6UjFO1/17O59AVOhY2WlbkAM+iphEW0udM
         8f+C8+3cvX7irtEbYFJDbP9hCv4ZJVm0PkPUKRpfB4xM6aa891edqNhnCnjME6AxToUa
         NLhqLqRImdbIpLjA7YC/Ry4p7YpRiu/gghC4k2FhdE5NGYHmbqVDAKYWqOjI6R2i3SOe
         lcn2YqW3l2lvz5BL21xVkm1tt8T3X0cMa0lr5TvAZS8A4L+8Hk6valJQe7BWI7CT2vqI
         +IG3r6+BkOzFLHOAyH+o9cPklVi0kzOW0C+YTGLEPmzRIqtmg3JVBL+BAmRUxInchvKj
         ts1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786946; x=1794391746;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
        b=kHy/npoyLMpsPJPFo8CHkKP3Tefg+lEnNRwuf53IrjBu72h+LZtFys7L1mLObt/hJo
         wIcBniwlqfz+SDfkBobeUNV0X3Ookavg0ovRXVAWjFoojzAj76ult9Nbaq14Mp8Oq8eH
         FaC6a/jgZ7Atbb9UG5B61MU6haZFpmjebzBWvBTYP9SsW0WpW9F/px2d036LNx2OKYJm
         Sdw0jyNu9T5gZ1CGLnk9GnYPR3RBn79yi90uFi34sANgE6MqUrm2zUq+rSISPP6w6BUD
         wexrfg1+XxBarV8oQAyE0X23XiHEVS5K4SO4cbU3/7McQybXBw/AtDg9JCfMfnWk9faR
         HzNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf3P4oszdk5HGyrH2MTyI9tPpfupkaJcn3BEsEQcX+GTm7DHi09EmncwS3skUDbPJp3CBkzRRPcRomxPhg/EDf@lists.infradead.org
X-Gm-Message-State: APuU4Z8fePiG5vC0QHWxJr6zdgC0NMUO5Zz4qk8jgzRVaryZnzKAdP0U
	oQxjQsdM6Wn1kHvPTAgzUxh9/56Qr/IKYz0bFMWlhmQWygGnx3dHfXHFfb7TGW71Tgg=
X-Gm-Gg: AYBFou1ympuJefMb1AEYR0xSJnsdWlaiRZVd/f/zTq+wMsA3Ad18EUzOPiqBNQk8Dpt
	KrO26jE4TItOdccW+PH9nSlv//NrUTtaqFUUb8xzLqkLnzntkd2xnCktzfSDbSyKacLcbDCigO3
	/odAAMKVRkTj4oM9VXdbUab7kaN9c69/BbGGA5VtOu+W7Ax3dU9h7GBLQdB8kJfaydm2d6OwC5W
	UnYg8Z/nTbGKhzRfQMLSL2rtHkmtsO6U/nJ2fyYR/k84BVGVpoBZ9W7ip1AplU45A8fDZrejAPv
	j9T7DEm4RX03OaI700uP6/t+yD2Hr+PpJI10OjAiFsgV/GEfhdhZmQsHvHt8I6nP9Zfg8agslyp
	P4P/TTf9yI95mQpo8EQa7m9uKkaAbFWU0TswwdN+Du+j3iViF6j/0ij0qwErBqvnTATyYoYQdMJ
	8Np33t4EvhGjJWx0sJqcZuAD/kG2RMMxj/SVPbe8Jw2vwKxEAaFoDd2v/9LwrkS6BmhMxTu45A6
	GNcEPHBFljIBt/j6Io0z8Jp2Vsv6fM9exA9ORAe012oELI+4Gaag7SAgx0VMKUuxZ9y8/SpAeZ7
	Omomru6sH6OnB99DTooIRxhFc2A=
X-Received: by 2002:a05:600c:c48e:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ac16bc4829mr363600885e9.10.1793786945653;
        Wed, 04 Nov 2026 02:09:05 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4134ff2a3sm39589745e9.2.2026.11.04.02.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:09:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: drop codec device reference
 after probe
From: Valerio Setti <vsetti@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104022815.1484320-1-vulab@iscas.ac.cn>
References: <20261104022815.1484320-1-vulab@iscas.ac.cn>
Date: Wed, 04 Nov 2026 11:08:52 +0100
Message-Id: <179378693284.334584.13927162303295738761.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=wL/4+5mCyg+xHnS2SrTRtqVLLJgE36IXiOGlWrvNvw8=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmvWWy2cK3/fMdg3YIfc7e99+hZeW+t+as5t+fmfrjrt
 Ufc7vq2Ix2lLAxiXAyyYoosLNPv/S4oVXtonHCyAGYOKxPIEAYuTgGYyMp4RoYVm6M7BY1U7+87
 E29+9dDXyEd5h26eMPjcvrpz48t1a3/OYGTY5KYQV1DCM2NZXKFpseyp2lsnU37m7v729NqmlOU
 qU1UZAQ==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_020908_275639_7BE40B5B 
X-CRM114-Status: GOOD (  13.68  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> imx_sgtl5000_probe() takes a reference on the codec i2c device, but the
> successful probe path returns without releasing it. Only the error
> paths drop the reference, so every successful probe leaks the i2c
> client device.
> 
> Release the reference once the card has been registered.
> 
> Fixes: 81e8e4926167 ("ASoC: fsl: add sgtl5000 clock support for imx-sgtl5000")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
>
> diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
> index 8bcf54ef709e..8ce333eb47fe 100644
> --- a/sound/soc/fsl/imx-sgtl5000.c
> +++ b/sound/soc/fsl/imx-sgtl5000.c
> @@ -177,6 +177,8 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
>  		goto put_device;
>  	}
>  
> +	put_device(&codec_dev->dev);
> +
>  	of_node_put(ssi_np);
>  	of_node_put(codec_np);
>  

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

