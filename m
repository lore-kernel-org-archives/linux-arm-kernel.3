Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7103BC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RxzX09exhIzgLmhmiaw9DLQIcUyhzaVuL7SP9vsi7Q=; b=jbUxYHI4G+M76IjR/4CxP6pnVQ
	S1IzfrXvg4UhAclVRZQZ5lijnVKrhEbcbkIczaBSX0H+Iy1YkK6p6D8iPIQueRoEa77w4aj2jVc9o
	W5EzxepkahiEWdcCPUicNNG8Hahqzav/QkwuGe01C037KJcKXILQsLMVcYbY0wYpykUYO3Ce1wlHS
	gPczJYwbxdHQyryvz/WgMdmxfEiJdsAwPJOyCPExDvMg5q7SgiFuq3sqqXbgNLm9CObxqpMkLKVP+
	L++zO2KNKxyoPkPw3u7XimPIO5STCGUKXsbEmU6R/fKHiM7GWV2ow+Z1oyotzGsVXKBsTqtE+RfVY
	WweBb9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K4k-0000000CBLo-3aOb;
	Thu, 17 Apr 2025 07:54:22 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JzZ-0000000CAOJ-1xmX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 07:49:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso649932e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876139; x=1745480939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RxzX09exhIzgLmhmiaw9DLQIcUyhzaVuL7SP9vsi7Q=;
        b=M5v8azTRatI01VKpfDI423DiRPhyz1Z5GuT6nzlJIRm9owhERUyd8iq9xrBgtKINnW
         QSiOAxUegBWdAaoMn44bVZY5L4kmZzt6+W/sfUmS9FezzENDRVMN3sgHrdoaKjVNvbwR
         QEpykh2mNM8hfJhI0/RViyW7cryw7T9XsRlmbcs1+71K86YBoBqRY+QhUh9aDHgz58QZ
         XcT1YL5pY6At2RszyZpDSQG8Yv5nvtOvrBgzPy1PItcRLBX7VdmRr7qVXZcyb8PbqCX5
         5ydS6skGNfpfwTWwvf3g+H/DTLW5mmMVYwwW2KaC6kbUPVN608jsurGYCjjfibP0qyUE
         jyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876139; x=1745480939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RxzX09exhIzgLmhmiaw9DLQIcUyhzaVuL7SP9vsi7Q=;
        b=JConzY3TnjmRfA/qFq72OPslWlgILz7xrKJV6u3mFBGGPmRqszHeStfAmnMwCfeBkS
         DAJXyvbkmWS5GUBC/uw6IQc7xJkAPZjfAtLu1I0rM60AvDYn1aviShzrLnpCq0z0epni
         Qkf0QSsxvDa/JUN1HK/DLrcSE0mUA1m6f6pwLP6v81lbf+oqsyVyABOMERNxuKFZnqLb
         lDr7tYL+GV1TEivX4xxsQdKPfILLC/h8OniFs5t28fxmdShR2DdU974qikvkk9e9CBt2
         WaNTP1n/VXtR5qpJLNQaLQw1Y+bjtTJ8jOBuGbHW5kfMNh8539gYVym2nBtmgvkMAbZ9
         lMQw==
X-Forwarded-Encrypted: i=1; AJvYcCXxXNCYa9G9mV7BEewfalgIR/YWnZb6ef2Rb02xDokz5v1Ke+dLpZad/7fQm2/dbH+MM7g5dWj2IB8yh1V02kso@lists.infradead.org
X-Gm-Message-State: AOJu0YxePOMK2hwo8g8GMkxH+Sxq4R0l7H33HX4I2H2Y7ev99KLbH1lk
	QU1zUQf8hbZhu71aYMw6XnzRL97qfd5P77O+BfZG6MBbczxLbiwim9UlW4x43ElhZ7pKCRv2qLZ
	7baAjeCdVkht40kLM265kGTMcSvYbqwJQJgtNeA==
X-Gm-Gg: ASbGncvcsFJNk46w5yNDQKycR6KOhXeWsnpvQFelVk9S5n9Ll8FC7EC4hNAhwF84p3I
	cPnjzm6EczHpLvdy+fZr9/19QML3rXvKK2T33rEfCclNk3W9TopB4njuJz+O3eL3SHEh8ialm83
	/+elfsrloBy3+d7/jDzSxcbiRW68QGze/2
X-Google-Smtp-Source: AGHT+IGl0yTbl1NfzL+pnA73vcbs4ZATHO5t0DMm0OPz1AIrbTpPp3OJ9FYZF3EeE/MV9ivlE2ZNC0B+frJYLn4K+3A=
X-Received: by 2002:a05:6512:3a87:b0:545:2ab1:3de with SMTP id
 2adb3069b0e04-54d64a98d9amr1453654e87.13.1744876139576; Thu, 17 Apr 2025
 00:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-3-manikandan.m@microchip.com> <605ff021-0770-4363-9734-ad8114a429f9@tuxon.dev>
 <fcdb9283-07aa-4d50-ac4d-317b0a4e5f7e@pengutronix.de>
In-Reply-To: <fcdb9283-07aa-4d50-ac4d-317b0a4e5f7e@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:48:48 +0200
X-Gm-Features: ATxdqUH-NaQn7pZOyf2E47r3u7Tt7v9sT__5pjl_S36lgww88eFiiLrSfCpmg08
Message-ID: <CACRpkdarmBy1nd903SmyXPNhS+hxxRSyKNOxdXg51Emr9MgRQQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: dts: microchip: Remove additional compatible
 string from PIO3 pinctrl nodes
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lsc@pengutronix.de, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004901_502751_812E158A 
X-CRM114-Status: UNSURE (   8.71  )
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

On Wed, Apr 16, 2025 at 4:04=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:

> The correct resolution would be to add an extra compatible to the
> binding instead of breaking non-Linux users of the device tree.

Ahmad is right, the patch needs to be reverted.

Yours,
Linus Walleij

