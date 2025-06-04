Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBFC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGyEvteZgKnU06vg7rbdizKIZLoS7zNjKeoB/6iPxjM=; b=3kAGQAz92JVZw6797BUXp9w1oB
	a/S83p951oiJdgVJ3eo5FbGZI4TKO3vUae/alcvBvBioDuY0aDKbVo3he23F1HBa5+HdgGkYLlUv3
	cS1pt6qodwq4b7Ou2P5mfLVFZBtj4T+ZFT7zs21rHahRkpUPcKX6CWzlNpGtG0gV3n05WSuEGJPmb
	D/iScqqYYIQaGydZljmwpKWBwHdXsqpy9lC07I0fBFUrNn4phLbNaLcbOBomEKZ+D7qR7gvWikxzG
	+ZthhOH0rIOYQkogBQNhRdg1VB13gtq4BBEriek8ZooSYmFD9WxB/p8221hxbOysqBziQhOW+HCSX
	5ijXeIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMijH-0000000CmfV-3tc4;
	Wed, 04 Jun 2025 07:40:07 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMihA-0000000CmQj-1OiA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:37:57 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6ff4faf858cso43796197b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749022675; x=1749627475; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UGyEvteZgKnU06vg7rbdizKIZLoS7zNjKeoB/6iPxjM=;
        b=WSxnlr+E6rM1beswjFin8YK8Ex4dhTo4JL2tSy5OEonrbRexFjrrtkJsrp90y88yx0
         mtTYNqJqk5CzI4aFLeWr02BzBImP5z1q/dY4+iVLXXdb8/umkbplDEeJ1+To8VHl0hva
         icQJ0wIKQMPgvfwzrBHkJzl6jRdU14i8SBjoepAbnNV2QfjbYCaVli8eK7kmeiVVHfKD
         NPdqRYgANTixYw9tioRYnCI0o6onhu6eaMAz2GEPbvlFf1Mjc/DN177QbrHLcHhBuGUz
         BZSBGc+dKnwVTZjpVJWLzjgRvput+pkFy+hBq4muJsyRiWVHonp7v5YuQOn3GbGRKsxn
         i9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022675; x=1749627475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGyEvteZgKnU06vg7rbdizKIZLoS7zNjKeoB/6iPxjM=;
        b=bSmgrnCiDSlYbya4ENIigY76DiYSCl4CnNoVqLXHSq3uhEkkaJAzQvGaOoZuRMS0BT
         hmWJWt5swvZ+k+Bk2Nva1yqe7AyIFswjkZJP5TGjAsppSs3UIv3ZiacPdtSPTfwcvAdb
         JWHs3t6vVNPOcrALPvgpkQ4ApkayjD3VoJJc5nvoXXc5Rr5D4jhgMOXjC8SpalCrXFHC
         h4rUwFQTH/J1BHF8jc7SG7IkKtYx5OYFYtztnDrLlClFf7hwuv9bUGXsiw35p4lMb1LS
         Ll3KOZ0I4l+fcUhvsInks3QKsdW3gzLOp2Cr3Qd/sSf82+kbWt1id1+VQnBQBo+wDHof
         paPw==
X-Forwarded-Encrypted: i=1; AJvYcCWCZ2LcGGDQLIEBA4at6iYnCtFl2muWoWL6POz9tML+iGRX1A1jkx+/xQmBlrKrlvCB5AYcbElXOAhhURvMW3DO@lists.infradead.org
X-Gm-Message-State: AOJu0YySlhPNEws4aVYbFwlAhzxUuKUHl0vGqkjjWW6/T892MgcU1p0H
	8TK8bSEiiiQn7ylWWBU6vvl08VLKkmE8nWiAFXLElqwuPLPIyqRr5O2iP5l3fu07jiNtAvVQRj3
	+8XJmlj2V4r0ddEUIfZXqgh5ktB83IWk=
X-Gm-Gg: ASbGncsOzzQ9819lO1QNUgWaLXOqCC3r37oi7hSr8w5g2hrbgfppxotLzAUFH2hCxIj
	A5j65bRcGGpZLpIXGKQ5FXektIqhijIKHxGV857IKAFRtqIRcpsJd/KT4Y1kOi7spTPi5y54MTx
	mz+YQyzMZEWrnVG2TBs7n+ZtwjXe6/+vo=
X-Google-Smtp-Source: AGHT+IGHg4yQNqLxlEDyCRgZJI7fvT2fCV18b3MewIJSWl1vbtr5SlMeusJ8GHaIW23IfmQnep32kSeTquJrDU0sBd0=
X-Received: by 2002:a05:690c:fc1:b0:70d:f6ff:cc6f with SMTP id
 00721157ae682-710d99fd79bmr21852057b3.4.1749022675335; Wed, 04 Jun 2025
 00:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com> <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
In-Reply-To: <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 09:37:39 +0200
X-Gm-Features: AX0GCFseUcNPKK85MVzyXpWJtxDlkMihOveN5Hr-KtFZ69h6Q8KR1YgWhWyHsUg
Message-ID: <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_003756_387517_718A07A1 
X-CRM114-Status: GOOD (  12.86  )
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

Hi Andrew,

I double-checked with our hardware team, and it turns out that all required
RGMII delays are already handled by the hardware on the SOM (trace
tuning + PHY config).
So "rgmii" is indeed intentional here, no additional software delay needed.
Thanks for pointing it out, it made me double-check, which is always a
good thing.

Best Regards,

Stefano

Il giorno mer 4 giu 2025 alle ore 03:19 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> >  &eqos {
> > @@ -39,6 +26,7 @@ &eqos {
> >       pinctrl-0 = <&pinctrl_eqos>;
> >       phy-mode = "rgmii";
>
> I know this is not in the scope of what you are trying to do, but this
> is probably wrong:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
>
>         Andrew

