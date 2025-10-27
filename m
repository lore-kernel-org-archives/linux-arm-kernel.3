Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05498CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=; b=PmqN0Sn9zQxwpSMGMz9uQ05SXL
	6wy9HtlAzwrRxCY/MzKfMR3TkgRG+IJu+gX81VZYIvT9HI/vLo7UIoUGl1euMsL0Q1/ZrWwTWOFCY
	i2ucr+YejMIt67IH2SBUTNrm+DkTeaIGCT8di9pLxFPfbTl7wLIbYVJjXmfbfQCn9gif7452Gvs2g
	xztLO37JiCZ1GttJd2UfwNOeIrE4ICqf8NlQfCyo2owPiCZtpCOrgNMjPqE8Mj3eJJLjcDQUN/BmD
	O0LNkJWypuul6aWfRnXhwJmrGhCBlMzW0DNUryts6ht0lHBK1qsvYcJVIZQodExwhM5u4kpaG5mS8
	+K5QlNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVVB-0000000Eqbd-1c5J;
	Mon, 27 Oct 2025 22:15:45 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVV9-0000000EqbF-0Ta1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:15:44 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-378ddb31efaso62058901fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603341; x=1762208141; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=;
        b=a1CkvPXYXurIC47tjUtXVkqG5maKJDVD18GWO3CfKXORAq28/DTVWgGYykf3nb0kkp
         +YXHq2zteUnuqokHYgEzpZ5avZExHv2+NVO92jFjcv0qEH65XTpKBNHUW6I7VqNRp2sT
         WpDl7O5KIP3oqP2VuJmMyO+jMHKILSyvsmgvEBhDyqtXGa5/0qaNf4FSZDCIEk5Zwfap
         e/an5GayqHZgvYi9DMWcCVEE2WsOuOW+7allLDfdTkPgtPnHFf3NhOlfZvN14ngdsdxP
         7KwQjM9WrfHfl/euvfPUVxwLTrMjOG/pXnOXEyHJ7SPbPFRe+KbASV2hfL0wVVYmwFoo
         oQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603341; x=1762208141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKH8vYMf6SqqIJ4Nr7m9tVSkocGsGWocEbO61fBw+IQ=;
        b=DnJ6jm4ybqo4HjiUArJrxIMSnHMoXJuRQWb+8KVaFTNAoetvcg4RTiqvD1ELkFgaxd
         +oNGdMNRejMkhlWUvg1OmrafNob73TzisTR9b+XwX8x9+FwHeQhpxMMytDY5lOLYFq/E
         oEm6AMODXfFsVIQjmja1NQzgLkw+Vm7XtJ6D5PyorGubUrr4PooAxvZRuemLRYUBtBtG
         142Lit1goV+eKQoqQmJxRuiymitmcgKOAgKgYB8riUfS2m2Cutg2/xQDlP8JI+GqTNwp
         dj7Ii67l41iFh73x6WE5ERsI0ixn2rDrAU1RNC4L6wozTJiOBtYHySbBpHY7kPutVXDe
         ot/g==
X-Forwarded-Encrypted: i=1; AJvYcCUsAi/dck7bjwMa3VlTI/ABJDLxM9FKSKbycDZg6wmQbaFeCRzngGAuWmJFM6s7TcEh8zC4QEnq6YbN4v4JprWf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8wONdoKHEJ3pKflY/OACfjUQGK+FCftljKb9/TiXN4zGptNdg
	xMYzGIN0eCArasXtE227cEmwohlz5Vc4Ek4NfVvqx6FgoTA72pmZNi/6XIcOZUghOguM39Mt8I/
	OpTPkPwZfZx7lW7HFWfpzW9e3TcxQ4tova+ExEmGVMw==
X-Gm-Gg: ASbGncuTuLRM8I+SrG/W07VgYQCUa41oKpLd6V2BT9DmBDrzxQgMVzK+SLwkGruIYd0
	FJUhioqX2pY5VWo95qhZbFPlxUJBLJV+MoxTgdrMb7x1zTcxEk/+Fhz31qCDnhaBZdlWtbHZvjY
	/K5h2D6kNG2UYivJ4xvBc6xrtHPh39GU626FQ1aA11pR84Hz6LulZQRWrH4jihXmSXv+u9aKFBW
	e+KrKHNGzKfkZ9dS+d04aKIRSwiugjDpUFG1IMWETa4D38fcwcB3l5xLQWVRBgcjYdskNE=
X-Google-Smtp-Source: AGHT+IH6m3DSKBdAo1TUZBBV1Cir681XUQKPd2M1XukvdECylY8ML9HXimk23Lw5yV+XpOoav6hKjxByUPzz5iNTOgg=
X-Received: by 2002:a05:651c:1107:20b0:378:cd74:a289 with SMTP id
 38308e7fff4ca-3790774e9edmr2648271fa.42.1761603340965; Mon, 27 Oct 2025
 15:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-11-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-11-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:15:28 +0100
X-Gm-Features: AWmQ_bmjdTr7EUx2uJYxfPf9xIolvT4VGvVXwZyfYUonTVISSkwT-eVliP6qaRY
Message-ID: <CACRpkdYzT3DaqiXTg2swEKxxh2UQbhw2=uF6Md=RON9rWz+6ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] dt-bindings: pinctrl: stm32: Use properties from pincfg-node.yaml
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151543_154780_3945DEFC 
X-CRM114-Status: UNSURE (   8.19  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Don't re-declare the standard pincfg properties; take them from
> the default schema.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

