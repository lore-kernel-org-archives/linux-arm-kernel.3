Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3678FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=; b=r/KIsIoZo6t5cCvD1eaUii1cLm
	QLvWlJMl8Mb7JVKE8KOTYprGnTXrmPVMlvNuaX3Bh0bDf1K2pHja0+/qy/mdubPUn/vCgQHDYkKX9
	vVsYu7+78WQ9ecFpidQgZo53OGIi3WS6DcWIVz0nNq4WjnIVAWhrbSimJba4uA8tT2vyo6+fHfM71
	LJWgoDNj10aM0tL6CipO3hGVCZ5RZVf1LVKyaRblvKOWGuBlH+iewpZB/Dt/uMbrANJBIlqVihkEH
	geNpA4k37qvX0d12wMNUftZjJFXrA90QMdmfRmnX96Rf7/xAyZAEdGAbywgd1PRRfvliWRKoY0Emr
	XwvIcsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcX-000000011YB-0YZ3;
	Fri, 22 Aug 2025 00:27:05 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8V1-0000000HaRd-1DZg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:50:52 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55ce5287a47so1102777e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755795049; x=1756399849; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=mq0N5jIsGo0j3GO++xSQzo5TL4rhgY+3cJ4kTSPp+yCZmHCmmxfL+OuktGzT/z1DoA
         HyTFwSD24oF8rY9/BVQ3jOgCfUD/KBB9J6hFOiBL6sFHKNnQNDj7e6rPC8NGkbvg5aHD
         SGg7YjT3Id2iG7hJRsTyg9oOZ9whFo9JYDzw4dLw+s6C/EGO7ekFw1UQ4PyeRkMKs21p
         60XDmh+T5kMe85yrC5etmEOlmJMLz+Wg8m4sMOKyZlQSSjRvR0ZwrJ+mn0ajLeqn9qoR
         v/s+TT85VD4FIa5sH6h8D7rRmy0DEOQupyg+wd/SUWsdHcoBoDxBjx4XI0qGCuD3agoP
         m03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755795049; x=1756399849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=RcU6xJO9mraPb0Xxb3+xWLSLc9V17gdxwd5pKfY9mQCs4Ap6o/B/bdoibhcvBT6FKg
         NnMmo00xV4zDp68f4Pf8UcXv8iOzm6OUJ8i+sUPMmBKWtq7gQ4LS02KT0pIK+MrI9kNI
         X7CJ7M9gL1GCCW9yLkZR7sF5M7XrQBrNYGVkEV1+K1euojFloLbhbfjgpk3V1nHvfm/3
         XqV/GKVJjuchSPWDxGDAZd/OKfNdvUvoIGgnvpVVP+1lgqDtR59y4SUywWTYSX0R9+yZ
         OiUAPSSM/hSTHTNdxGTJVyD5N4ZUrK+BFhqZY5NP3haTKSGRbSXm9FuCjf9cQbmqL1un
         hScw==
X-Forwarded-Encrypted: i=1; AJvYcCVz6b+iBji5CU8d1DfB6a5nfggTJOykS7GOHgJMGc2LftoeSWfzbi8edFlPoxOF9xfHae0syTSbsG4KteCioyvi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0QhTarr0A8k7LjiNCLBV0Mcejv4NRNgLvlMGCRrSsc0CteQkD
	5oDGL3D+6FUmaySf9oOFckj5IeO6yuBvfWcbHKwuFOMVX3nXA06K7ZveKb2jHXA9Q2t8HnsRvjI
	B4N8Kbn35cO1+IFRPW5M5BaP4wZrkJ+QUWSgLzY3j1Q==
X-Gm-Gg: ASbGncsKOpJyiaM3BeCSrQJ0DdgEESRnlJkHtj04IQxf+nZFdKZqzA1PIrgTJ4mMBa8
	1IJblnxiLJsLudVm0J353TxFNAj6p/XJZ0M2SsYwLox8RzXNxaJr+nsHQTyz/6A0CNDo7Z6TegN
	zl9ZX6knFaXEm8k7CHWpRdNBNvGQIMp0SHb6/4UPdOGJ8nIuuSt4NEirVKj5HGmgij/Q2XsnqKP
	+58VRRD3JcXf9NK7A==
X-Google-Smtp-Source: AGHT+IHXxJmnZpxwlzV39CihpI1fip8jHsQ3wqrQIPStR8+WqibfCJ2j76EEt47pzZKFul7hhblBfkLJ4pGoe6B1jMM=
X-Received: by 2002:a05:651c:23c8:20b0:32a:78f7:9bef with SMTP id
 38308e7fff4ca-33549e3ad61mr6524161fa.8.1755795049223; Thu, 21 Aug 2025
 09:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com> <CGME20250821124039epcas5p34b77813c9936b8b70c801e0e1b67891a@epcas5p3.samsung.com>
 <20250821123310.94089-1-ravi.patel@samsung.com> <20250821123310.94089-6-ravi.patel@samsung.com>
In-Reply-To: <20250821123310.94089-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 18:50:38 +0200
X-Gm-Features: Ac12FXwqIo6zLlw0fIpSEAb-CCiAQ7nCYe-8wPk85-SMsx3heqK_K_zSrsS4110
Message-ID: <CACRpkdbdpcPBC8mwazoXHy+HE+hH-XWDkfHV4Uz38YhZU7UH7w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_095051_330060_6EC347A9 
X-CRM114-Status: UNSURE (   7.99  )
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

On Thu, Aug 21, 2025 at 2:40=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Looks good to me.

I expect that Krzysztof will queue this and send
to me with a pull request once he's happy with it.

Yours,
Linus Walleij

