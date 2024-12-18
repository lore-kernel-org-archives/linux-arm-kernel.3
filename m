Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4B4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGDd3GsS7X/LEUACNFlLUz77SGjMRwi8NjI74LtUWbY=; b=j8LwbUEl/bk8Q7LU3O7PhU75Q4
	IWf9LJF+aa9Lk38bX1Nlq214qb3vjc8LulxWEX8Ai9+GkkFVN1SbAp3wBQtUwntOIpNAAy5JRbQyH
	SZVOAbciW2YpZ5ma4/yBCO3VTATZRAPShrU54NGf7GS6z+gKtAaDEZjzYufdnnEw1WA3YuJkI+o6w
	x3YTqnbF2St6d2yDETS9OskPopSZZAcnlztmhgljWoWFATgZF0WBzqfRGc1brtweIPCJWn9V3yjeo
	jVKLuas3s1L283rOnOkdCqdFyQbb285MNgaF2dBx/8dnn+xc14uoUPckjom3yx3FoCdLEmiI/kJJJ
	XrkEj8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsAl-0000000GRZ2-0Fcu;
	Wed, 18 Dec 2024 11:24:59 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNs9e-0000000GRQk-3UyR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:23:51 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5f2b21a0784so1387215eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734521029; x=1735125829; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wGDd3GsS7X/LEUACNFlLUz77SGjMRwi8NjI74LtUWbY=;
        b=kDdJXKQNq4NYVKEPl+uqeWikzcP9S/4yWuifhvjMwjCQHfx1fLUR4Tt0YbTfETWUNx
         WdIsYw+pBw1zeb1wuea508+rkczzhyc9r8GCSrBNlo2YDN8vk0HOSaGX4HhiGE27DhG/
         6vrP9pc5ZUWsQtsX92eUS8pr+RuXn/tCikOXv+42pmOmDd80/nFNz1Asd6r83/PdTeGs
         tPzbfZyAUTFrRso1YSoCPCTE8a9t769opttM52Ue6j82S39gbs3KoeDWouUuqC3oT5wf
         LJn0UsG2vYzCoQbLnTTPbILTT/daWGlYumb8yMqlIAN4XWU1s5sHfJfwjQ6XY3iqiyo3
         c1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521029; x=1735125829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGDd3GsS7X/LEUACNFlLUz77SGjMRwi8NjI74LtUWbY=;
        b=IjV9q0GHhpxf+u2Ev7npoePFivWQgoZh0e0q4zTg9T6RFBvC91aez/6m5eEoa5Wc+7
         c1S4q65upA4+Nn4yUEs0PlRcSadTg1gN622pi7qo612lNyEhjQcw/W1xWbVyDjGjjsvy
         js9tCe+FQJ+i+qxVX9bXHRI+MfaC7zY9rOMyzTYbKa04dV/NMlD7s0LvrjhqEBcE829E
         xkdvWwpgHoAb7/awJqZF+f3WbEuj7KO+R3zbZmwne0h7EDFgv8WEtvbIL6LeHC4wUiSj
         ETSuqox/dW1hm/JMj7sC7xqZx0DNiAx3jgHR0NwsWOBn52w3gBoWqNxfQj0Wxdk88uBj
         h65Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1K7/YJlKTe4Ql54a9X38T5+YJIlkqukNHDKtYLArRg8W11w1rhSBthDiUha7skWilwyFbDeSuAiopEzWfxl9i@lists.infradead.org
X-Gm-Message-State: AOJu0YwtICl7L6tV/LRsxAtjc8jIT4xFqX+VyMrL0pjnRFBD9jOdV2IA
	dc9BMdzp4/axOLS8TuhCInZ33Uk4Iiw/et2NKpUavxuWNDY2rKQl8HUKbc6NNSDLXrOG6eEUJ3a
	nRYps3ZtwNH+1ftqu093KewqOBhoEeGGoWAjBrQ==
X-Gm-Gg: ASbGncsE/SDbIeuxxH6RAvTSbIgEyxIXJoJ/ZrzLY19zXFigIoW3eAdvWq9NDgssuGQ
	/JhcgakSg4E2UFie7QnuPzZlOwdZUdCcg5MdnFKE=
X-Google-Smtp-Source: AGHT+IE0SxJTQLNEo9P1nttPQbjieAU87Qbz/OG3Tx1qyRFpKK7F0I23DhhsjQFVOLFLQOC0Fg1O4vAzd0y7cFEiLlo=
X-Received: by 2002:a05:6870:fe95:b0:29e:51ca:68b4 with SMTP id
 586e51a60fabf-2a7b3145c1bmr1357208fac.19.1734521029643; Wed, 18 Dec 2024
 03:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org> <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
In-Reply-To: <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 11:23:38 +0000
Message-ID: <CADrjBPq4mTsvCivBJPmADP3pfUORBV8hGeP5GrTg9YxASJLHXg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_032350_886154_E19E0407 
X-CRM114-Status: GOOD (  20.50  )
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

Hi,

On Wed, 18 Dec 2024 at 09:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Dec 17, 2024 at 09:40:20AM +0000, Tudor Ambarus wrote:
> > +description: |
> > +  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt
>
> If there is going to be any new posting:
>
> The Samsung Exynos mailbox controller, used on Google GS101 SoC, ....
>
> > +  generation and a shared register for passing mailbox messages. When the
> > +  controller is used by the ACPM protocol the shared register is ignored and
> > +  the mailbox controller acts as a doorbell. The controller just raises the
> > +  interrupt to the firmware after the ACPM protocol has written the message to
> > +  SRAM.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs101-mbox
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    description: IRQ line for the RX mailbox.
> > +    maxItems: 1
> > +
> > +  '#mbox-cells':
> > +    description: |
> > +      <&phandle type channel>
> > +      phandle : label name of controller.
> > +      type    : channel type, doorbell or data-transfer.
> > +      channel : channel number.
> > +
> > +      Here is how a client can reference them:
> > +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
> > +      mboxes = <&ap2apm_mailbox DATA 3>;
>
> This ordering assumes there is channel "2" in doorbel and in data, so
> two times "2" and of course the same for all others. If this is
> configuration of one channel, so "2" is either doorbell or data, then
> type should be the last.

My understanding was each channel is either configured for doorbell or
data, but Tudor can confirm. With Krzysztof's feedback addressed:

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.

