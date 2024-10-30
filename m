Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F12D7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/obSxVgLXYAZ3S4bATKBujgO8U8oWR6WSGb4BNz1Rc=; b=12ApaKMuAgVWMsqAm6PfO6E5iQ
	C3PY6ocNS/aA8C9/4aDRFJf2X38KyoC8GFJ6FJIHnk8Bva2KNQQ/nXm734uNjhFQFnRVmwkqozcWg
	uX8EekB0GLoOe3iMkqU/yBEzDEAIOXpQbqJKF0Iw3CoYuBZxjDB4YEGlnC9EVtxj7I3fgPL2cj/6N
	ZIbP9xW83y+BTd/AIHUDiHdzyBQwkuu9gCokzTpeoaktmYdF19HktlaUlFrklUZQZJW+0ibYY0zQB
	xTJXzi9e5oztLjbVrGMu6H8+SS8N+OcSuDqTDFUKbGsHHONlWDjVM5d8U9Zzk/RL/+MYnVbiSlGkt
	RfAr/Q0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63Ny-0000000HC3P-2Gvh;
	Wed, 30 Oct 2024 07:44:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63LW-0000000HB0o-0T6n;
	Wed, 30 Oct 2024 07:42:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-431688d5127so59495555e9.0;
        Wed, 30 Oct 2024 00:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730274144; x=1730878944; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/obSxVgLXYAZ3S4bATKBujgO8U8oWR6WSGb4BNz1Rc=;
        b=P1g/JVyqQKVc6cbdtc4UsyuegJUf/P1Or3TVWm7b+eiU+pXpsaY2FxpHYvXL3nRWQT
         /tQ0+5okPA2cvZwGs4ywPtaQejXawQqG9zyKcWmVBvqpzLtqmHSW+zRpqW7O9uw7eR+o
         DSLVJ+omIsIjbB73PnkCSlaio4IxVc8mLOo1p6XR8bTxZGY4aQKFHyb5pRT38mFvfuoK
         M3ir61wDfnUsjoT7uRY9riwzAuaA/BIonHMZEWwOM32sFrbguGCfodRpTSA6+BbUMOAl
         5zCsc6JDMrNaDO3s8SwgEWklvt73Cuo7omano9h9C8X+jngubXDCyox/xusjoahqx80K
         T1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730274144; x=1730878944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/obSxVgLXYAZ3S4bATKBujgO8U8oWR6WSGb4BNz1Rc=;
        b=RzxlxRKGT0ceWrq7T1k/MKoAL1dOrbqjs60nWAbwXwVron0ewHgpBA1BYcscEOFmt0
         Jd4YS23xYCQuXWIie0hYtQZelvioiaIrsk+oM9RRuYFXJFiDa68+aMma0HT+Y+RneGe+
         /FcjrTv49SoPaSRqOtKfcDcYmgptzjZT2EQ2HOcD7C1dP+wS/fXP8MIUVukcN8bXtixq
         mK/Y3GYdUTeCp1j8XWEKhBJscMXehOK5gyXSOCmUon56Ujc+1D849fj7ztour+WxfEf9
         HnncDkuVAfTDmJXSmwtG0hlFjX8vWASZ8w6aHnAExBYEt90BelSa6RKODmh4lTlSWe6P
         0k5w==
X-Forwarded-Encrypted: i=1; AJvYcCV0DObWBfennYLxnZZ4JMH8ZYPVHXboqeN6ywN5sWtO2t/H8YiuL+kcz4cYRrzX23tCQQa4RUGdIp905nKDGpo=@lists.infradead.org, AJvYcCVm1qY34KMa90cZlGJkqMjy+b1TSX+2Zsp0JWP1tl39RajBvNJQqoCb2bCvgcLOVZj1VS32rlRLgQXuzTk4zYWm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9QIMDVVMw7fNL8QNS1VLzx51hWNydAtike88ewNugM6aVfYfi
	Yai3SlHtr8PsQ39/6oVUiak0rcuKXTOz/xwCvHqYF+mPfHkA8DVn
X-Google-Smtp-Source: AGHT+IETsV7UXMLp399BinpD0w900qG3hOgbxpUxgRBwxez5FYrcNIGJm85eQ9FYoXQ64YlW1Wx4Ow==
X-Received: by 2002:a05:600c:4fd3:b0:431:60d0:9088 with SMTP id 5b1f17b1804b1-4319ac9acedmr136064005e9.13.1730274143634;
        Wed, 30 Oct 2024 00:42:23 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd91096asm12658425e9.13.2024.10.30.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:42:23 -0700 (PDT)
Message-ID: <6721e35f.050a0220.b8d65.2cd0@mx.google.com>
X-Google-Original-Message-ID: <ZyHjXKFEqqbkJkHz@Ansuel-XPS.>
Date: Wed, 30 Oct 2024 08:42:20 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	benjamin.larsson@genexis.eu, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
 <t7i6lkx5oedjma6uauiygnvbgzixnsqmolmkse3j2qiy5znf7t@kfozote6mm2k>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t7i6lkx5oedjma6uauiygnvbgzixnsqmolmkse3j2qiy5znf7t@kfozote6mm2k>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_004226_175763_A46A8011 
X-CRM114-Status: GOOD (  18.51  )
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

On Wed, Oct 30, 2024 at 08:34:01AM +0100, Uwe Kleine-König wrote:
> Hello Linus,
> 
> On Tue, Oct 29, 2024 at 11:03:14PM +0100, Linus Walleij wrote:
> > On Wed, Oct 23, 2024 at 1:21 AM Lorenzo Bianconi <lorenzo@kernel.org> wrote:
> > 
> > > Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> > > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > > needs to access the same memory block (gpio memory region) to configure
> > > {gio,irq}_chip and pwm functionalities respectively, so model them as
> > > childs of a parent mfd driver.
> > 
> > OK someone has to merge this and I suggest that I merge patches 1-5
> > (all bindings and the pinctrl driver) since the different bindings have
> > dependencies between them.
> 
> Fine for me.
> 
> > Then Uwe can merge patch 6/6 (the pwm driver).
> 
> The pwm patch needs some more love, we can handle that separately then.
> 

Thanks for the feedback, so I assume we will detach the DT and PWM
driver from this driver and handle it separately.

-- 
	Ansuel

