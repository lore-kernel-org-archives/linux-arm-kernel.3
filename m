Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE67C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z56Y83f+ojrrsd3GpgSgBFA2lIExVUESQWAv2+ulCQ=; b=lRJlZlH36TrpfrDZ99yHMV15rL
	OY5UeNyz7NoKB3slmc+InU/KevKsJA4bq2/KNezWJFdSHeW0zUEZqBkGZc9PqEgRo4P69BvzxRX7u
	zHmu1/km10HM26h2pWGj/EepZZ0oRmGEDRvVFX1NPBUSCfb8W3UNShw4tfigTEmvylm4Dt1/MBCMF
	Zz0apaqkA9yMVypnUw42glnLrJ20IO9Xc0Np4p4cVxBUyTMJxdoQaCQV8xhxe2ibCtf+l4ZCsmWj3
	cZCOrKky514MuhWQUP1/x0pqrnMsLE2p5KxOQ7gBe/RHHitKhVGmeRFeKf7ZtPsrZDaZH23dO+Mfa
	SebJJ/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYWp-0000000B25i-2oua;
	Thu, 13 Feb 2025 12:41:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXQC-0000000ArQt-1dcd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:30:21 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5450cc1669eso633093e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 03:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739446218; x=1740051018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z56Y83f+ojrrsd3GpgSgBFA2lIExVUESQWAv2+ulCQ=;
        b=dwfMQzo5pnhI7Y6zrqsQwUz6mJCvM1ebPgVS55vSTUA0lc8SISBNKs7NZzaGzJf13F
         TSYE90tRJcCu0s8OMY/f+bF12g0IerMUDLJ7tJ3h/dTeN3MnubBJiQT28UoBEzNS2NyM
         g7lbsw1hXo+V2eSenDlIvZLZAY8IJWDIwsGA8FzzYJGXicAAMEOyVjRggPqkmNlY1jTA
         WCRQ4GKnZM8Z85S0KnWWOgb31XiIJeW8jqNypR3VPVWFY9/pH4MSv2S43v8ReHU2x+jW
         zq/xWOG/UR4LJY4PnkfP2a4KKUs8cMSqBJ6Ro0hQKS9NNTTcIAxG15ufvVRzykL5S9rZ
         zrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446218; x=1740051018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z56Y83f+ojrrsd3GpgSgBFA2lIExVUESQWAv2+ulCQ=;
        b=gGyIiBhT3vPYeb8nIPjiSeJHE1nNBqyUTQEcsG1UwwA3lj3o13tXBdkQDwgMj/AnoX
         r742J4z0CKR8bSqieLBjeNo2in8NOErjuA6KJXmX35c+4w2tAOJJnPtzTXAWpvTUsSnQ
         nTBttvsFVni1DasgtxYYtCk4lJRC922r14NuhV2faq9tta1hzaeQ3xIj1Pn6i5jS+LxJ
         BrgAcyc+Vp5PF7utEDXN6UcEXv4JYFb9t2WVoTPzSBqccAwJYgmM42MW9Oq7gxE9g/XH
         KkLetMTUW+3CdQGy+kT8BAsuZ/Xle3V8nJJ9jKPddEcSabt3cubxBXu5EzySqtIdyups
         qHGA==
X-Forwarded-Encrypted: i=1; AJvYcCV4aZdkMnjZxei8mWI8D1xvz5qvej3DqPkwYj9y+C9UPtnsLRVdOmPlPBEoj7bl2HOUfCc3Ny9a2iaIr5CGpBo7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzc9R68KP1mI5QwAjHyFg+pcYC2/t4q3i/7vXbnEM4HehNzmfq
	ofY0EbpAHh4t6PwYfxkJ4iMnYm0wiisXAA9gp5e6DbaeUMHZCkKLDkO1JyuhavYnOeAmMNkbLdl
	F2pAhRukMnYXyx23dK3GXhh2JZNQFRCjjl6eORw==
X-Gm-Gg: ASbGncvYjO6h7c36+DTDVGh25e2exrihVfmEp9SiXkcIgEClEWpsgyCO9XZSK7oXigd
	MeWG9mikxQzTGN660m7B5ng4Xsn9RVYyHVmlf21g7SH0q5oigaGlSgElIFwbwvnd5QxTy3xJN
X-Google-Smtp-Source: AGHT+IGtr+B7QUg7ovhczdnIrY54CJufjoazE+Gk4x6uF30Uby+ckGzBKyKIc+SyfPUrY3/AAaJl/Zu1tehVGQNXynI=
X-Received: by 2002:a05:6512:3447:b0:545:b40:6566 with SMTP id
 2adb3069b0e04-5451ddeb857mr591146e87.53.1739446217812; Thu, 13 Feb 2025
 03:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20250203144422.269948-1-ninad@linux.ibm.com> <20250203144422.269948-3-ninad@linux.ibm.com>
In-Reply-To: <20250203144422.269948-3-ninad@linux.ibm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 12:30:06 +0100
X-Gm-Features: AWEUYZklvT3HDVtZsVqTrXdrtQL7QNdhFrM_NmeZwuKBhmtHfAH-J4BH0prCplk
Message-ID: <CACRpkdZW9aNbrQk-zz4G0_W-HXrxgpWi_QzuLvActcWkh+U4Tw@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] dt-bindings: gpio: ast2400-gpio: Add hogs parsing
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: brgl@bgdev.pl, minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_033020_430735_32F26B49 
X-CRM114-Status: UNSURE (   6.33  )
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

On Mon, Feb 3, 2025 at 3:44=E2=80=AFPM Ninad Palsule <ninad@linux.ibm.com> =
wrote:

> Allow parsing GPIO controller children nodes with GPIO hogs.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

