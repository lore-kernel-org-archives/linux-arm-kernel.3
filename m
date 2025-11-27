Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DC6D10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 06:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=; b=fGb21AokZyx7Q5wAzvQ7LIMLAO
	F2EC++epHJXql9RC028M8hIknmnxki3IwpQpuhibDy/c5gDgISfrqVgArigua8EcLZht3niIv/pzz
	vdE2bk7pe6Syn1D+csDT0oi7COi53aZHb10S1/Ryr7GasnZNqolMbv6lmlLYJDKSMY+qcFQOHZF7j
	uijDr68s2rjKZDX/Fk35QS8siw9wQzJli5fiQ/kYH1sIkUWw34HOKMWxcah9+MItcvn/OVA9uHekq
	qZ2FJwAO2AG7hK704C9QplW+DmqM/z42pFkKe8IoIx8paCqWZjAboN74qOO1f0+8XkXPuDS7IxFpc
	+YNj/95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVqW-0000000G48F-2IYQ;
	Thu, 27 Nov 2025 06:51:16 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVqT-0000000G47V-3xxF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 06:51:15 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59578e38613so592004e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764226271; x=1764831071; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=;
        b=kVIEqmaYog99+IGAua0BPW4RZFfTu9Mqufi3Dm3pHSrqM4pKDaQJmqWdf75l/roUru
         YFDfrDU3bmCs55NGCSoMhR5u1/4VS+uLeMEORnjOQ8EPdPqWkNzcni8bhhn21XpwezWP
         BaJRyeJlm6rwA3ErUIPfTlsf0ZwqLz6texTGpr+vlBJTo+F+q5MPCRY1VaXR7rk9T9I6
         5++TL0kZU+pxW3MEHB17hxWwFeZJMMR7+GLlLDBZekS5JFwjxNlsTbx4fddnZA5tsaLM
         SVHb214n9fbkGkiRZCr3UBa0qGps0WLkoT0HvbBzTkV0qQCcCUA0r9aSWY6HVtjcCE5i
         eLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226271; x=1764831071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJB5bHuAo0V2i3Tn47zuebL6o/cGCmIFZCCZXXdSLeY=;
        b=k/BcL7tx9dUOuLkUQxJRnAt7HllzynDvnnJO1JRUwQHqTmdUHcbfywRAf68KsyYndi
         laE7ocSt7Wp0qC0N6Blw6RKcI5p9rkTyR01esH5I8gGo0hy/tDo1YmK4/pLIpJ7/NKD3
         P3M+bbBDcz7FqVVYtom7yJ6qrHOEonfPgz1esayp4zTyOxkwrbJ6vDqCZZry1E/nJlLF
         71UiC4CDVUeblZNOmzwhrG/eRd3qy10dcRI7uwJwIzAb4oTrWJBTqV7+/HEuWiDxvcsu
         qXM+PkJ71YT5/z457ZkTmwJw9QXmTVGmwMn71y1UGCgx+WqmFq+EJwdoA4jOxUlJkOI8
         TCwA==
X-Forwarded-Encrypted: i=1; AJvYcCXkli/Zw4VROQuQRh+q8RII14byLPb1S2RBZ/Hsda8wqdgs8twyEEPE0IZyr0IgAHiRH6snstfYob1zJfErkNoK@lists.infradead.org
X-Gm-Message-State: AOJu0YwGmWBiSojWSJ8mmCafENACGSyNS7Gt6siNG6oxhaj14WtRLSlk
	6U8mJtQ2YlYiMYH3cP+jUSE2AyB0IY+OyMQ30Kc7GAggPh7+vFoYYwUL
X-Gm-Gg: ASbGncujm6Ln/Jjj8DsZqYCl1uJ0LQbE1UnFmTuRYFSAO07fScBkHuLg5meXGrViIL5
	8/UJ4qVr0UOB9zXMN8Ay7+4I2RD484kK/eJVx8Dcr035msrDYcBuPCPe/8iIFRcu0/keAGnuG5B
	fBpRch6/idvS83eb8X2NjvO59EP2wEHuoi5BXVlf3l+qf7LT7xdkPIeyuFYrCM3Npg9xZVfRf4u
	pMugVM7ayedU6EEdwhRXRJoiP7l9GVy2iQOUi9XNKcgHdFLRz4O3cSfDHpvFBW3z/czmBMRn7uD
	2h/0yQiSd2t+t0yQ8jI9nrTohzD0r+mGYegHJpiyC0VciUgRXGwZukRogf2Gsmot5sxGLXkv3dn
	kZyvJILTdG0btyRWhEUnBv0UJvgT3H1ZuwvCkXXHxzJXAJHIwvNt28TiKHKgMAGMiHVJvqrHzzU
	ljQCa7Q+mnRcD+9m7i8XjR9T1piLGo8by7JBG9oIq13HUzATTVydyY5Gk3MaWCQwES0+Mx
X-Google-Smtp-Source: AGHT+IFTmDfrXh0KvI1Xxo4ZUUZvVPNdz6X1okMoprwygPwEBEGqBxEtkR2sAlEnAGDtHntZer72Qw==
X-Received: by 2002:a05:6512:159c:b0:595:9152:b932 with SMTP id 2adb3069b0e04-596b526c87bmr3380986e87.47.1764226271085;
        Wed, 26 Nov 2025 22:51:11 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa440d8sm152329e87.46.2025.11.26.22.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:51:09 -0800 (PST)
Message-ID: <f4d4169d-796b-49fd-b4d3-b74186e59b82@gmail.com>
Date: Thu, 27 Nov 2025 08:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] regulator: Use container_of_const() when all types
 are const
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Samuel Kayode <samkay014@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_225114_024504_16A3E047 
X-CRM114-Status: GOOD (  12.19  )
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

Thanks again Krzysztof! :)

On 26/11/2025 19:40, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Rebase on regulator/for-next, which does not have pf1550-regulator.c
>    so drop this part.
> - Link to v1: https://patch.msgid.link/20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com
> 
> Use container_of_const(), which is preferred over container_of(), when
> the argument 'ptr' and returned pointer are already const, for better
> code safety and readability.
> 
> Some drivers already have const everywhere, so container_of_const can be
> directly used. In few other drivers, the final pointer can be constified
> that way.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (8):

>        regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
>        regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct

For the above:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

