Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14426D74ECB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpS2H3SdIy7+x5vUo7+a2x6ndejrFYA8bNDO09Q1vNI=; b=B3NT/pQo5AkCA0d8+pY++7f+6q
	6w0HjshKyGcZ7OAhwm/QO046kTM+6KAaRSNBgL/1tqXieF+ZLxfpBe9acsmUQcirBXYvQzB2kwfT/
	d7oVOfnUh2gooQ+5SAYrLt+DbqR4GwQ+FAV/Ve7gEaiIUKnFvgJE3FHJAeUFEOfcCiOI/5IiqeOmm
	jHnZJ9dRaijpV3nlFkxpsrieMXtob5PW0mkGsnVfu2g4efWJ1x+yYs71PUcWRpjg7Q4SpiH7S/jWO
	fZLQy99awTpLy77W60bLvv4UmXWs3mGphb60vVBkQA4HHKkdP35rBvyWakreJrQaw4HYMv/8C0yc2
	e7xMm8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHGb-00000008y9I-2MTU;
	Fri, 23 Jan 2026 13:32:01 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHGZ-00000008y8B-0af0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:32:00 +0000
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5f5423b0980so492344137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175118; x=1769779918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpS2H3SdIy7+x5vUo7+a2x6ndejrFYA8bNDO09Q1vNI=;
        b=GxYuNQnLjNKlIO/6u6eyJEcXmY4P+pdFg8rgU4I9wlBHA85OEC3A2HRKNWFkGkh7/C
         8aHn/G/DpKHaRTUgIYRBwrwnRkz8A7zf2QsHJB6f/BalEzeW8AyJn03gXJSTbdquCjKn
         pL9WJCXt8r5D9dqVcUAhQDDh9vqwL8+exVhDFZ+epaDrotq9GOHn4z746lNXatcMkXCp
         pUZhzbC1prT+e6KYJGRH68ZA6FNbPKzYRzzLKDyONwBxfhwGHo6HhCzpCCNnD87NjHwn
         O3+SVTj7YjIwr9GH/ystWLaEA3cQiOXQyY4YvfdhCNr7W2q9iC+Djtr5nU0ej3UWTdry
         2KoQ==
X-Gm-Message-State: AOJu0YwALt30bO7aTMblZD1eKL95d0vqr9qrCBDsVuMnuuAwSLKjWUG1
	9JZhWrSfk+FI/X9aiYXq4grHRb5RBPEC8/oyQVjohGogks5oaKS6qIi/xg26EqAY
X-Gm-Gg: AZuq6aKZF7zmN26yr3CLn0gMAP0FI3emQRNjUD9UGkQojs74yLquaaUj6Lyft8FmPsw
	JBW4n/rb+oNcFg86R6jgLLAcWuZ7vyQutqdUTAmAEQXrJe80mLiMuc0xkxVYI8wMHH1ev/k010v
	cRCNKcVpIojQ4kv7fiH8RcI8gsll9qzkQPpyZPHof8d0lAmkfeikpVnTEYssDMmDyW2koFh1k7h
	WcNZ5EZvDHk69lqm92Pg1Fc1BWmJi0oBniwPN9dUdYt+hNNTuppei6d83OwRaZZ/f0wDYi5XCrc
	eZLmXYxRBi7VXp4FLCkf76ToNHagAhWjbgdkQp+0mty+LN777AyJ6p9bN4qZEhwufdkMpw2zHWx
	L2XPzcuuvSMJYizgIIkOAXHpgFe37E3m75dvE6sdROJzyzWg5VOtbJ6xb44RNaL/I+tPm2d7UJ+
	TM5PPEyR2It9zxLIM/adxGomB2ZK6Yud3mLZnWrwUnG7l4Tu8a/mqQc4PfSOM=
X-Received: by 2002:a05:6102:dce:b0:5f1:b85f:6cda with SMTP id ada2fe7eead31-5f5586d1dc2mr323528137.30.1769175117759;
        Fri, 23 Jan 2026 05:31:57 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2aa79asm505410241.2.2026.01.23.05.31.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:31:56 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94240659ceaso565614241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:31:55 -0800 (PST)
X-Received: by 2002:a05:6102:cd0:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5f5586773e5mr314116137.21.1769175115274; Fri, 23 Jan 2026
 05:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:31:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFjfe-3YTBQ37bbfgH5xXf_1cQZ8_58vLCQNc=5caF1g@mail.gmail.com>
X-Gm-Features: AZwV_Qhn6Z025XcB1tu3nu-plKR7LvAJNMlqwBqF2kc7a-H-YRSLtx_zGjZz-tc
Message-ID: <CAMuHMdUFjfe-3YTBQ37bbfgH5xXf_1cQZ8_58vLCQNc=5caF1g@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] arm64: dts: renesas: r8a77990: Describe PCIe root port
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053159_177206_379C9F58 
X-CRM114-Status: GOOD (  17.79  )
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

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add node which describes the root port in the PCIe controller DT node.
> This can be used together with the pwrctrl driver to control clock and
> power supply to a PCIe slot.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

