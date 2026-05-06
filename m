Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A46CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MErtgJ01ux0KftOTULYSL/LrPrLq4iBEMS2wRNoZ6W4=; b=UI5Oa7dX9Ea6tm48krYKCk0LzV
	UV2asgYBKDCudgjn3eOqAbPXuXLDfTzHxAVX/oEta9pkpmVXK4IAJ3pMZh2UOZh5PIKiY9fJsk1M3
	hqZ1c63qcylQk3FsGrBdZ6zjpaj80mfMOFdnrZvwx/4UwqcuGfYug+RJEtgSeuHfiNbJaebJCMU2Z
	CFDmVVsLsgqTPWy9zYuWQ1taMIxz74WvPLKK4Lf3wQyUujpWvvnmbjYpVwwR5dff5cVXxkussjZmt
	Pl2mMWkylZo3E9p7wyX5+0BGWQ+jGwr/I+WmAHT5+8Yi3V1ieEfcM6CsAjm90rh9oFONIbtps/09b
	Av9l4slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbNb-00000000lMw-42oc;
	Wed, 06 May 2026 12:29:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbNa-00000000lLl-3KKR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:29:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso47938365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778070569; x=1778675369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MErtgJ01ux0KftOTULYSL/LrPrLq4iBEMS2wRNoZ6W4=;
        b=lkz7nBWIq4eLDkXEHcnwoFzLlDNeh991VU9k/ah3//LpLG69C4KKbVC/mOT8tvfEgw
         VB8E7O6YHY7iNOyWCUYEJJDnNhUq3YrT+LvMISIhW5uGr74I3A+tlB2yfolHpfjIEa8r
         KihPKjRMbIDbvh/5UQbqjdMOIkS9QEa14orDiJnB36MyVR61xKpUJH69zcxxTaTeQMQp
         d11ERtllBFtNjg7gtbmKX/YULpOejkg2DeT4Pbi/Xuyeb3U7kblXkVHaV3WNrOCsGnwb
         dIgLdklTEY6Z628Pyxcv/FrTbYwCQz7tQO7V2Fco69YygRLHpXbsOvs4/PGSexuyIfcM
         GZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070569; x=1778675369;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MErtgJ01ux0KftOTULYSL/LrPrLq4iBEMS2wRNoZ6W4=;
        b=loQYahl+sOFyRayllGve1+85tSMe8bvFOCya+K/d4W14qxBIN0rWOMOnfXIVzaklWA
         UstQGibJRB3Xc9p5gIkFHlJ8GoD74I703rduwsSe5jbgQ27hgK29uVI08m92SxzfGEXf
         qMZDzi8IgSqXpBdYimWmn6jnDRk9DVJaKymiVt39MmIj/Fi+EJqCJQTbJ690pej7QDZl
         RxtRG7XiEWJKt7z2rohMTJMRYsiJ/DI7a0bjsMv/tZnhIPQmVFbKSZaMqIAe0Jymeb/I
         WcsKbB6r0sswZOYHSxu+OSJcCmKbTqJ+pC2NKJYcluzWXJ6CuBSd3/201dT81ngE7DOF
         gskw==
X-Forwarded-Encrypted: i=1; AFNElJ8WVylGA+7K1iv9KCKCsRIE7+OLaq6EZ06CxwSFCSkuAoerj9sNoeShIlxHNnoTzNU67WmFPyvdW+S4b+LFJvOx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx31d6bmHy3zhnXHkQGP2RhQwcPMyfun4QoM5uSE0HcFyJbqzS
	JsS5CzZls9ERzFUqq+vuX45k2OtLApzjffBYbFNaFFD31cRwnIAu0EEFh6qg0SADeXQ=
X-Gm-Gg: AeBDieukmp4yVJOrRTCt8Bopn0mlAv4R/liWgfpWYQSTEdXK9l+Ch8gHl6+SC2xFdoT
	+oeURJQW5AgW05lxQjLo0AO5YI+OsB/upioJ26un1jKM3D5X1jhyNHj11FnaDmH1OcjkbGQebIQ
	NNCml6geFRH2t+8BBNogj1SuOCPkOk3aQcHC8pmKQ/21qliCh2G7SEq7gLhp8h4qzi40ydajdil
	MG3oOw4e2kINuYGMUYrPyGpSCoZr/CUKskpd3hKpdHktL8uFYXpO17RmjG8zFNsGOC+ka6NmjMV
	c+Fb+tkzCTyL876IfljlUesurFsXGME3ZNGlSUdr5uoSoleNFob5P9zLKdVBoQAQk/RC2LBcR8a
	lKj4eVkKomjgGVAdQOF9acxgSZPq199a7eq9ZkRrV89rTXUfx4DmVXC2lkIOuLsudvdDCj6wOA5
	dMP9vDcYxGnKT/Mnsp9kjgNR1pEPm0elIUrHrzJgPYR9x4uLtzOPMksw==
X-Received: by 2002:a05:600c:c096:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48e51f444ffmr39137505e9.21.1778070568779;
        Wed, 06 May 2026 05:29:28 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f249bbsm10865842f8f.36.2026.05.06.05.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:29:28 -0700 (PDT)
Message-ID: <d5e1e929-e24c-4876-8590-030db9e95b52@linaro.org>
Date: Wed, 6 May 2026 15:29:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: s3c64xx: fix all kernel-doc warnings
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Juan Yescas <jyescas@google.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260416224056.985233-1-rdunlap@infradead.org>
 <06406c7b-c141-4997-9921-9358cdea7641@linaro.org>
Content-Language: en-US
In-Reply-To: <06406c7b-c141-4997-9921-9358cdea7641@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_052930_837550_F62C93B5 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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



On 5/6/26 3:28 PM, Tudor Ambarus wrote:
> Hi!
> 
> You missed adding the SPI maintainer. +Mark.
> 
> Also, there's another kdoc warning in that file. Do you care to fix it?
> 
> scripts/kernel-doc -none include/linux/platform_data/spi-s3c64xx.h
> Warning: include/linux/platform_data/spi-s3c64xx.h:40 struct member 'polling' not described in 's3c64xx_spi_info'
> Warning: include/linux/platform_data/spi-s3c64xx.h:51 expecting prototype for s3c64xx_spi_set_platdata(). Prototype was for s3c64xx_spi0_set_platdata() instead


Ah, I misread, both are fixed.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

