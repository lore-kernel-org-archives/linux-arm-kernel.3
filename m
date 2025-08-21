Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F938CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1yHBNPn96c3V7CQ1BaXqtWREVYjXTs5jbHzOGvJ8fk=; b=qplfYdxHF8ZrB/xFXc4nhixwO+
	zg3XaQ1r9+LtCrNq/4aMqVFlPtYvaxFZ1QSHE37ctGFODyUZw+tqA1FB5YrFxIKbiEj7g6YULdt4I
	GJXquwAN3IW5EtxAVEb9LzVLlYrOlAWzdEB7Nx7F9RnGb7unstpCW4KwRDs6GNCNPvn9JOneJACD8
	IgQO1Kw8ReSuZN/UGsgXymUqFoT3vBU4WzUOEKt665nOdMjgIxcwCjTeW8L3a+xyxZuhQYfKDj7m1
	wWGRf2AsIxHrBaEocdOlZ/Rr23Z8VfHW79ZyT/fPLbnTeHo4vZolkxNbhQbmlEoHrDsSTyUz4wkQN
	Ur//CvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7cU-0000000HTOu-2TpK;
	Thu, 21 Aug 2025 15:54:30 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3wD-0000000GpdE-0nXX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:58:38 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce522d6deso914340e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777516; x=1756382316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1yHBNPn96c3V7CQ1BaXqtWREVYjXTs5jbHzOGvJ8fk=;
        b=xzVuiMj41O7BaoECbcxJ6QurT7X1SWIiqICokk0aVF2ONmuKZYdVysCsuvws2biV+6
         Dd6t/hVFFOD+2wZzJvAb5uwbV11boy/qhgU99MRK+AT3lb9MGMF4iVogCw2Io9UZ9CE+
         6abYxZYSjcMsCW6XVrfpgvlL/kkh97Y/M6RHGoSxKdJiIrOFKO3Mr5OjRT3t/UBtnqJ+
         BMSVCXUqYIt+imeKV0Zi45VfZUgN72f68IBFJu8RhwgfursxvwoR+3HhBu9yvD118M5i
         VcrlJG4E0wZFFDaw9aW27szYwDfi+B0clO6SJka8CNkvm6OeJPCyfTrdO+IZSV617Kx6
         y8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777516; x=1756382316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1yHBNPn96c3V7CQ1BaXqtWREVYjXTs5jbHzOGvJ8fk=;
        b=TaTlR9mbUBwGuvOM4BWaaX5lSoW737hGUvqH+ZWGMKrWa2EPAsuTdeOPiYKDynDmue
         S/ZAwjTov2wV2giARdlvFwOcXje7HYTu9sAQ/DLxIpEl4DRrtq+VETT8eOn3TExwvBhe
         qRZK0uNL5X7Xl6VvjiyXg+GbYL1XKFMYodmRaGWEvdFwMkWcMYJC5QshGhR4xqd/RODm
         qDsZhgEZ+AZbtuhUSXph3biIh+ueEfDQZSm6MQcyt5N5qiJd6TtGBGzMIqL9gbvV+Dfx
         id9dOUwq0x1rONze0Ol0XGFVk0dxNcEsk4G14GHdTUCW3bxJgHXbjG+jIdywMLmv5wzq
         njtw==
X-Forwarded-Encrypted: i=1; AJvYcCUvoL9LmLo2wgslYbtk15VdEglrlP27DvdDPtkWt8gcjHa71ISXBIabLHczlqDsjtT7rWTu9vFkkhODtxeAOvO0@lists.infradead.org
X-Gm-Message-State: AOJu0YwMxP1FRFtY4zVaVOTbZB2ZAReLxcXbY5nFIvki3ALnvzPZ43ZJ
	gPdi+u9K1rtG/34va2FdPHyO9OuwBG2OWhTHUfdYvFK9mPKqyb+XBTcj9g2eFBXDDNkZfczvYux
	tM7AWy3GaaDeKvd4FXlRB55+XIlThI/IGx9qzO11tjQ==
X-Gm-Gg: ASbGncuYrpKzLDG3PuPKv3w/6VZLQLW+X5eHX/098drEa8DEBGvElcR3ahpoB3aFsPb
	EdCnhKKozdYTa92awFfQQwYSY1kT5wsWYCvPKMjRvDgmOSTMa9Usm5r/5tWLhh2U1q46z/RTQM3
	vacYVyq1Lnjcb+3Z1lw3IchPJzPGf4XYP963LkE/auTHWZ45CzWD4txZr1eKGqAitoFb6Rx85OA
	6hRYCY4631I7ztDYg==
X-Google-Smtp-Source: AGHT+IH58fB2HF0XIYb9mpaGtP+eqBvxII7AxaSZMaIMfHYj0Aglieg7CeivWcXE0AOhVbRVIpo+wetUS4Xw3r7Sv6Q=
X-Received: by 2002:a05:651c:f01:b0:32b:9c54:4ca1 with SMTP id
 38308e7fff4ca-33549fddaf7mr6881041fa.39.1755777515598; Thu, 21 Aug 2025
 04:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250812084639.13442-1-andrea.porta@suse.com>
In-Reply-To: <20250812084639.13442-1-andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:58:24 +0200
X-Gm-Features: Ac12FXxsqYADEtH5a5dR5PUdlqrKLGpwt68yMJcS6gbSE3gVttgWEaGZaRZKzIU
Message-ID: <CACRpkdYPyp7p9Pe6KU9yq+1V7OTykCJrNFzv8KxuzxSDYJ93sA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: rp1: Describe groups for RP1 pin controller
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_045837_229119_E9C73FBB 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, Aug 12, 2025 at 10:44=E2=80=AFAM Andrea della Porta
<andrea.porta@suse.com> wrote:

> The DT binding for RP1 pin controller currently lacks the group
> definitions.
>
> Add groups enumeration to the schema.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Patch applied!

Yours,
Linus Walleij

