Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78348C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt/9/LzPfx6RB2Ri4REYVqp1qcpJjg1U1nS59zQ5wMY=; b=zv3XOg0RQrk7dzO+WL9oYy31U5
	8ZjeP898HEXRd4fMivNEzzxjlBQ153w6irTb9CG4WkyGAIZWq0z7C+H6F9qasLDz/so7yAxbZmnbS
	xKmTVf012rvmlKD4vTBQTxv+RZkXnAWCyBoZkBqEySGqfFlPXbaQNYSarN6mnHBdj8g1dePEGsXyE
	5raq3dFkMbVDyPjyn4ulhONvw9JX5RVUoR+fS7D545EQaeE0VEbGxOiPzbGiWjd1/pNBOGTmfZ/0i
	8EY0hWgTa9d2ewWa3CsNwcHKgA5VAyQEG9mPvlI9AnKNyHOR3lJMQulgr8dS0FddTSvTSXcdhq7zl
	ZT3lBbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Dq-0000000Dpgo-23Ts;
	Fri, 14 Mar 2025 10:24:58 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1xq-0000000Dmbl-1iti
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:08:27 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30b83290b7bso19470841fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946905; x=1742551705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt/9/LzPfx6RB2Ri4REYVqp1qcpJjg1U1nS59zQ5wMY=;
        b=v3vzhmyTXKvVVkwB7zto+zo5ZHEhaX2JXeB2S4ON5xM6TRUwYwntvPpPOp46cTZUMV
         Ty4BoR8m38jzasDl+xIyqKEEF4X7pvv4TFOKp9vjoAzuiyC77lS/zyTXf5MBMnJvHlY8
         9Dv9VoHYILRuQ/cjVtqEl+S9Me32L4GUxktyeenYjaTNNnC+P6L3CmzkZqCDM6BWutFN
         e+bIyfmcqF5qPhY1kGfmXxtNV81cT5fAxpQfsgDEFvJZ8v7Ga4FrrlAB6LKDESE92pJv
         HphwtB4liJyEpwSpJYkLnaMR6+uQCM+5CloWvBsP9BlyBnGFcGZNDa0eo5p+Zv2am4pZ
         jr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946905; x=1742551705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt/9/LzPfx6RB2Ri4REYVqp1qcpJjg1U1nS59zQ5wMY=;
        b=ey0PsQMMsUYeEpLeg3+9Fqv2TiNCf+TuESiP0zPYnuxv9CVNN+KHUIqONU2sd0bvQt
         a08NY+6uGxYgtMZJ8aZV8XAUSLDjbcwLIecni5Z7Lypvmp4ySMOzHohb0AXAp55Wf9uK
         2ywkU58XnbwoQASEC9vAPZP83s4+hhWfgKjVgwl6lAmQJelJiWdnLm/EMEP2Uaf+OkYw
         5AjIEIgx9D1yyFtljxzTP2jUXsiH91itKIik78eBh0AJmp5MFsDr7cLop8nujcQOYrdU
         IWf1J0KuRRftPHTaZ/2A80sJItGL6kNFaY+LiDzFyFOVoDiZzmYNQdOeG8GCJtINMZjy
         bnbg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Kc3qrZ9Y9L1mmCi8GN9aa+MCcMSmVmgmcq/BfRakFAVEPwgPRfVuBH+7s7oOUpQbq6GSeLN777HEmvfVs2Pq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd4AP/ZP86078TdyHB3muc+0CroeNH92sN+spDGH3LsTQ+tjou
	zgB16tKWvOs/UDhW+PIberDmX7lVJzaXHQpItbDv5MyQG6XxVe/vXV7cYmoGGB+ft87Pc6McWCp
	s6mdDC3PGrtrt+49Eh21NLPz7CKgL0kIMTdWzLA==
X-Gm-Gg: ASbGncsYK3g1vSyCf9ZqwapENH9vjlAO3GANnz6ezl+9a1JyX4icI2t/c7qFxZvbuoE
	bEkaBTyafYbRoxbOeOF0R3rGRYp4myx06Y4n429KlY7nDTfaj8/Ni7qJxh2+2PTs8vFkmlQF/Xs
	uglveoYBdaYA6j5bzFTyDff78=
X-Google-Smtp-Source: AGHT+IHJo15rlSs7Va08NHOofodKMD1H1XNIRjRaa5BY0in+MTDIERdp60qoDZO21fZpfDmKsEUFpvdk8Y2VP5vuLUk=
X-Received: by 2002:a05:6512:b94:b0:545:c1e:65fb with SMTP id
 2adb3069b0e04-549c38fbccdmr671564e87.18.1741946904682; Fri, 14 Mar 2025
 03:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1736522006.git.Ryan.Wanner@microchip.com> <821255840c09d8d9cebbb1f2daaedd8a7c138875.1736522006.git.Ryan.Wanner@microchip.com>
In-Reply-To: <821255840c09d8d9cebbb1f2daaedd8a7c138875.1736522006.git.Ryan.Wanner@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:08:13 +0100
X-Gm-Features: AQ5f1JqSOmT4FHz5UOAsw4lJg3-dP8L_NWpCJ5kNHWtjrkJLgD54yy-3c3bbVqU
Message-ID: <CACRpkdYYeC+2G0u0LYSUjAX_ex7MjWLhEcu7QdNXudj8BEO4PQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 2/3] dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
To: Ryan.Wanner@microchip.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	Dharma Balasubiramani <dharma.b@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030826_459031_C56A4A2C 
X-CRM114-Status: UNSURE (   7.61  )
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

On Thu, Mar 6, 2025 at 5:03=E2=80=AFPM <Ryan.Wanner@microchip.com> wrote:

> From: Dharma Balasubiramani <dharma.b@microchip.com>
>
> Add pinctrl bindings for microchip sama7d65 SoC.
>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij

