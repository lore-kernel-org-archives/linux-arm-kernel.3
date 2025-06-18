Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86813C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=; b=SsM+1jPkfdJhLuIRdaeBeIFO3l
	U7nBqMyfe5K2eBmz9vT5vczAHXEASXxV7AIfRtetRqpcpLpcXnBEy7gOYGDLpx0vxDHi7FT6cM1hI
	6OFLXR9JEUy5F2UzZDhkoTWqr8z1NVXlLt0xdSli5fiu+0MOqpEuTILhtuzBAYRMYTovUwifUa7Fz
	qCmtLzkIEsXJYCHhhc1Xyxf/skCfnJnl4G+fECBJzphA/2iG5nLkHHMwN5WhM9hlLz4Sxx26o+Ffv
	wtM6sGs1sL+uO9USP79lt0dYseIL8C9TAMJTQObBzIaeqtWz+r1umaEDnIpTdp1zOLdQeB12cNCZE
	becEJb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWf-0000000AEWC-1VgH;
	Wed, 18 Jun 2025 13:08:25 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr1c-00000009wrj-0aQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 11:32:17 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553b165c80cso5813373e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246334; x=1750851134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=EKqWDH20QK05Yf9eqv9mZ/mNS0BQBJ1P/h0bxPKiQxuOKG5i4BoAF6+bltZm98KN2/
         cVBI3Ng2yJqcmOiOEK2bKvQI9jeRYlgdF8a63E96WrjYzV/barOSz0576jPaFvMBkIiC
         EJ+7W3yluJpq8u1VqCvOljHEw3eCcdokmuDYn/ODlzJl5l7LlqW/UBo9rvV5gR+s/bUc
         pd+LMxhnwaKlBgh2LCsu9IxIsygyCVZJe4/PII1ZUablH+08t1RUht109xuNW6CTTr2i
         dWBPcErxzoU4vHs8LMFcx8SIuPkmYtKRAIEWfmeSEjdSqqp9b6HOEodDUD0u0gCvOWEz
         GJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246334; x=1750851134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=g0vsDUMVrvev7ZmCm5onf0ynIuYywtydG5unjPe+U9VIZek7cAbqfNDVeVWWCKjWyb
         uETQGZn8wbxE3nDqMlLoslxw3O0t0jNLK2JjlfX8bH3fUmRb6EtUAOxueTTywr+a6rUH
         6YCXnhREnHtLIl9OeiAEo4xqjdPUWRGsgmBG/3bJWXdmdhOZh16GIo3+c0trDa9F7kKZ
         jBfSLWaM8x+yXz2uh8ytq3YVNeSM/5377RjM3ocojRGJ48eYyaFihuRcc1rqvt6KzUvv
         COz7W+x27XtmrOP8SertFIr8bIPtrW18w74KhHs2lBmSPBbizErVOStlNt2yCJIisXsP
         Yj7w==
X-Forwarded-Encrypted: i=1; AJvYcCXaia+Wpc9dsNNyco+yhq9E3OmorAPU1kmO326DtSWz7dbrAcFl/G5ZudLvPntMapPWE0lUXYLCKsyR7/6jtZjX@lists.infradead.org
X-Gm-Message-State: AOJu0YwCsJCKEsHLFWlOtpubBp84tSomtxktsduaVTKKnHGkndXGIfWw
	y+yJxmees/JlS2ERS/8+gfm5SEAtW4byKiSSa0tvibkweGlaupPE1jPkWCBUvq4Bhv3XAcqkeJS
	uEHafco/HvLUBHW1LmVc5b6uShqkAsHHMYxZbHqMoRA==
X-Gm-Gg: ASbGncuWOYPXm1rSv2kc1oyEPoFGudN5ceFJ8N6FdZEf7lQfHO3FB4qpP0/MbGDwrX+
	6/LHThs82BsPnhk6pKhO6KkjND4PmLsbTKx4Cgzu+0KPW1fq99rvh9FQsqlZ+2V4TcBjLe3S5qc
	F3aG4XTId/d1oZEe5wBSJpXj0rGn7wCtA/LHqgH1lhA0s=
X-Google-Smtp-Source: AGHT+IG/cXE1HQ3EEXy0cPSnaDLNTuKJgzCF0qLdhOb/5CcGOOw+a/DTjj5TWhlAS5cXMjlqM/mbx0AMV43GUJjmW2k=
X-Received: by 2002:a05:6512:31d6:b0:553:2e4a:bb58 with SMTP id
 2adb3069b0e04-553b6e7337amr4658199e87.9.1750246334530; Wed, 18 Jun 2025
 04:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:32:03 +0200
X-Gm-Features: AX0GCFvVR50_3aX2UCUBcxsZuxXj9BpNTfKCs9hxZHJvTphADGhBSjR3yjyWU08
Message-ID: <CACRpkdYkgHzEnqN3VA2MqBChjtwjC+Fhem7Bo3PdnfGZQgQ99Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043216_184891_A20307E3 
X-CRM114-Status: GOOD (  11.23  )
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

On Wed, Jun 11, 2025 at 12:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied!

Yours,
Linus Walleij

