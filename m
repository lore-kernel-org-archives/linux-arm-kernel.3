Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FC2CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 01:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABTnhbbS7L5HkpCGOSZTEM0Im5AWWxZ2DgMSTWPYRFc=; b=zidXWr+PjpSJnfl0a3SW4cAGdX
	BldkEjhI9ZAE7jG69GEX+WXC9HV2cLkqOJYz1KlPtGQ8YgK7QHIs0mj89fjZs3W6N0tVKT1tBc9lf
	ot8H6Eg4Qv722xDeueh72XZOYsaremS54qutcq+fT8aPo21YOdM+0/9MbO5wwl/+uzOIpelW/KSH2
	n9++oYNzeZ6IBiETtkDL1+5eU6ztqcxm6qqGT0J7ZLmKzOGHaCSUOv4VUGJzbOQyGYkIE/LW4oRM3
	3XdhAoIcR4rUv+acCONTt2LHP5bRKnGPy3miyXtcbqvCPn3nWaETtcPYp2Up5Dego3C0IPvtNexDi
	RPEjr8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usAnD-00000007ItH-0KOR;
	Sat, 30 Aug 2025 01:54:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us7cz-00000006wqz-050p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 22:31:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f53efe803so3074831e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 15:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756506683; x=1757111483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABTnhbbS7L5HkpCGOSZTEM0Im5AWWxZ2DgMSTWPYRFc=;
        b=jaoqhGC7YjR98/kxnRCJwy2CJpLoyUZaPMBRVFP9eDaeB+fX6YwRP1I2RhTlwFakG2
         b9J4aAXS0VaK5kpqazu5NDJLwKlHP/FCaaGPM+CGc5C7nkovTfusZDyH/bUMzKeiICrq
         yV8AR0rhJDtaiiRxgj3B5UgTlq6YPv2auyLmHi/CzBRkbKII7qH3dKmdaOe+/NLizctz
         w6Ou7I3UFM12gK3wLQIDizU1LK8i4CXWYr4qyAWh7dwYoLU1u9S7V9pmC3w60AF1ym9M
         wjPp/xcYHfW5gwW+VmT2bIG3Ecrmwr83jVC19r3B8fc9QE0THfpiKH0FXezpGKljMCe6
         QxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756506683; x=1757111483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABTnhbbS7L5HkpCGOSZTEM0Im5AWWxZ2DgMSTWPYRFc=;
        b=Mj4PWWqDa+vxm5lSxyhkercVWNJf1MLsa9skkzMneEl+MIzjOTQqz/Bl3FlN1V/BOc
         U2bY3p/+GEyjcgNKYKoRTWJxawz9/nxp9lOr+ixXn8Kyg7XlsOKaoohqOm/spRHkq5oE
         YFygbxXOK/HJAHQZusKustA65L6gU+GH7mJQJ453mXXpLE4ozSJkXGPoYKsST72ihje8
         vhr9tyZmjKG1zvc30+NExZ5A1qiIaw+87MtpuNnDmxOix6/FeOh8JMzhBwGycg+9EvRF
         wGbNufwhLZ4OHPB3arkpfDjIcfdu4Riq6XvzJtY4mVp8GL6ISzbYhvxOUGM58RQMSIhi
         0GKg==
X-Forwarded-Encrypted: i=1; AJvYcCWTlovXS3nDY3K6ju4pI24WY9365KATUHAU9WwsYRuvAYjrAp4gocC8Y2pHHxX36TMuFJOz/JYNIuSWVEhZNu/5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy30znt3+7TVidu354PPzUcf+6iyuzSbXsd2WE8Kc2EdB94iZ7f
	uK2XyloiGujTX4wBmKFrzhZyELm2Q29doPEVWK7LPFnCEcNys7B2ijrkzt48Jv80SxVdqR4WITb
	PgaKTvKwm+EtGJGbZw2rnrGXJj33PqnmcPlHo5/lW0A==
X-Gm-Gg: ASbGnct5lIY/5fnI/O40TE8nMMIooPiHxCahXprjD6kTiu3WaBsgYXMhMOfBFT9s+9/
	7mJZ22/De8VzEJNAHIF6meQzy6zmj20zT1XrsD/5yATJfPUiBSXh+mERGIAOesMQ3756MHv+HyK
	aPU+oaVEPrI2FtmaLoUgHxsZ2DfBt+EZTlBRxYHB0u+hUDY3781OGJjXkKNRw8ZfEFBDO+n2wIy
	IPQvpQ=
X-Google-Smtp-Source: AGHT+IGEsnYhsV7tsgFN84KPDIRoOPf0/B8DKbI7M0URReevQxuA0Bzr4lMQoYrnOIFpony13QSt3vd1Z/GbWsefU8c=
X-Received: by 2002:a05:6512:b06:b0:55f:34e8:b1a6 with SMTP id
 2adb3069b0e04-55f70a05aa1mr46987e87.57.1756506682752; Fri, 29 Aug 2025
 15:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250812203337.731648-1-robh@kernel.org>
In-Reply-To: <20250812203337.731648-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Aug 2025 00:31:11 +0200
X-Gm-Features: Ac12FXyB7pgkBvR7Aj25d5oehVpWxFIRJ4xjMg8x9Wn3iT-JlQETgMnYYiDN10o
Message-ID: <CACRpkdb9NKKeDT_b40aEHW7qZPsKA6omzw_OFp37zf9pF8dptw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,bcm2835-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_153125_073664_4CDA7578 
X-CRM114-Status: GOOD (  11.90  )
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

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom BCM2835 GPIO (and pinmux) controller binding to DT
> schema format.
>
> The structure of the child nodes wasn't well defined. The schema is
> based on the .dts users. The legacy binding is a single level of child
> nodes while the standard binding is 2 levels of child nodes.
>
> The "all banks" interrupt is treated as optional following actual users.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied. Why didn't I do this to begin with, I think I was
confused by the gpio in the title and some stress :/

Yours,
Linus Walleij

