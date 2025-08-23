Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B123BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 23:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=; b=myXNGw77+iFLusBtrhvgi+anSh
	Lt+8KUQDRG2JtSc0MY2p+hB4Pz6Py/m661mRxcANn+HHwwUSOUlwB/Y0HQuc/N8sGf0Luc+cJxfsJ
	Lz5siWkazWLIWBuyYsq1kO5EbrDr4KeAO0EouosugbPsnZtgL5LKwvbWiDlgSnb5h5Q2FCDziXZTM
	rcpzzvDY8uCkKpJRpP42UlJoLdzyOz+XF5dJiX1qb3N6nU5m+62o1M0LoEQL49FphdN7P5KwB3gu4
	JnwqPW9bGJ+T+nYb4iojfihhKgC7VeCvWNi6tJMhstE3cplFoM3JJwEsqsmBbiziacdxYdOAKXUJU
	dQ0yo/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upxPN-00000005RDH-0Qg0;
	Sat, 23 Aug 2025 23:12:25 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upxMh-00000005QhW-3DG8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 23:09:41 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4b28184a8b3so38127501cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755990578; x=1756595378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
        b=WpAXGkHx1KdRkm5KgOh2D4TrGta1MjBaAHxTnvHRVtl/gon36XITt2iJYNXNrGINFX
         Pex9yFO72suj4vApMvjCKH1x/J2r6chwe17v/83dQaXa6te6l9PCbIgzgDX2QizI12Vp
         xFkyq7FvyKjCS6PRfE+hsyUDnZvJI90yQCyV4L1UgZ+u7dzH3XUz0T/KHDi8IlfIURdD
         O9l72n02CdydRq27UGSKdmnDccFmJXl0kWm29kK6N/tb5MxLa8FrN8VVLoTX3vmqMILl
         KJMu2QSOrQgbvzLXWjUE+7tjUWUC2AouF3J/8tkH/GSNOKywEeaUNz5+5KAqGIm1ASoW
         AOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755990578; x=1756595378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
        b=ijGJ6XlJ2GRCHcMNtOGr21nTkZOY8yT1CYAKo+duBEqS9Pfer2dCCLNfoZj9TRbn0f
         uneuss/0KgFSof5BGH1efz/X6/rGADdDtVeNggrq8LRTWsVdLPSKPujQ0h4RjFNiJOpp
         XybZsSySSHqUz8IWeyEZSMbR6rzvKz7JX/8wSGs4YBaMtxyDEiJ8w8UIdqzr2BWA6c8u
         agmhGKXNgdE1NL9q8y7GG6fSIlNsXktf+pZAmI5qE168s6+7vPgqORbos0sVlrsjMWss
         vJzJPZgvuSSp0chSFu9Zfl7VkuKOFCaJmC79uLh3CgsAjgclIWXGoM14shyZGPf40r8x
         h19Q==
X-Forwarded-Encrypted: i=1; AJvYcCVp2zfXEzF7uFhDRtzgKW9zgmAuYPQ2JtdwU//6QWc23HJmf/gJEC0lcS0lsWR+V3VFICSEUFh6kYYcUbaPuBlw@lists.infradead.org
X-Gm-Message-State: AOJu0YxlGSYHbCvgNQ1cQrHPVO+PMsPgrqPOsPMnSupnd8nNM4GNMVEZ
	QgUKIU7C09K7h4EFtM0aR/ZZvnyk4WInGMP1ZisU7mVB+bISVC9kny0uZr5RR7zzcyfKG5HBcXN
	76Z9aOas42pT7G5Ag5eauu2toQJzb3Bk=
X-Gm-Gg: ASbGnctxJSVPXuNHC6O74SuFz6UjAYxdAeAQ/FbHcPgRdMMJQYZlzt8tl5GQ/9qFbdx
	5N3rn966UjlNmJsVMMVeXoiTde9k7G3mpol9tzXnJ6TbtCzHI4ijIxcYVfUov99LFDeMGydyumx
	P1umqe1N/VxoyuzGJvKBWyCnQ3hkzMZWKFSTRstX0jNamidMK2iJ/G9/L05U0EB8nlK6KraMOlH
	RjXHAo=
X-Google-Smtp-Source: AGHT+IEkAzV8H+clwN6tL7gqmSvk56dPwvIVT4gQVPsLgXNkLSqtTBC6lbcVlarR1iUNCNSl5l1xmo1oxjBxcJoE0Ac=
X-Received: by 2002:a05:622a:1449:b0:4b2:8ac4:ef76 with SMTP id
 d75a77b69052e-4b2aab27f7fmr97527041cf.69.1755990578167; Sat, 23 Aug 2025
 16:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250821004232.8134-1-andre.przywara@arm.com> <20250821004232.8134-9-andre.przywara@arm.com>
In-Reply-To: <20250821004232.8134-9-andre.przywara@arm.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 24 Aug 2025 09:09:24 +1000
X-Gm-Features: Ac12FXwXg3BBSbryJoDW3xmfP_LFIAOgrCsFqUWYjsCuW9pa0DyK6tp1OMBe8g0
Message-ID: <CAGRGNgXsG5FmwFTSE1BM5qDHz_Jovb4EuRtt-=ipavBDf7AzJQ@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] pinctrl: sunxi: a523-r: add a733-r compatible string
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_160939_806751_58BF96A3 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Andre,

On Thu, Aug 21, 2025 at 10:46=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> The secondary Allwinner A733 pincontroller ("-r") is interestingly not
> using the same new MMIO frame layout as the main controller, but is in
> fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
> each. From the driver's perspective, this is all we care about, so we can
> re-use the a523-r pinctrl driver for the a733-r, too.
>
> The individual pinmux settings are different, so we must not use the
> a523-r compatible string as a fallback, but we can surely let the same
> driver care for both the a523-r and a733-r IP, as the pinmux values will
> be provided by the DT.

If the bank and pin counts are the same and the pinmux values are
provided by the DT, that means they _are_ compatible, right?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

