Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912BFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1mankBQsqTlkT/47qns+yAsg9e8OdnU7wK4bL7Cxj8=; b=P0LENjNjJCfYFjSBwXiCEKfgy4
	NfywCDUBLAM5KHasucDuhrOUFFzbWPDBcnb8BPN2Q6qf4aAYayhIxV99KqTEZ6zKylzUDsrqcCgW8
	7RlEWK0RHPpIXU6d4tgwlOMrRFaGurJuNcIeiC2kjJ/3dAtkr63FECrHAzNBH5PuIqoNPXaR2OwQe
	ZkGPye2M6nImq5lw/9nNbep2slDOFAOqiral5ucrYmv8xfjK8MQxGaBia6YKBrCWLJ5oc/aWElHt5
	EVr8ZTwlZxnbF0VfwVz+TV27FaqDgQgH+AgSFpPWTi+hXw2kkbuuYvty40Zuej3GK8bKJ2RHr4hAM
	/5+siDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4a03-0000000BnWj-2fZU;
	Fri, 03 Oct 2025 07:14:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4a02-0000000BnWd-13Oy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 07:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FA6B620CB
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Oct 2025 07:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44500C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Oct 2025 07:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759475681;
	bh=e1mankBQsqTlkT/47qns+yAsg9e8OdnU7wK4bL7Cxj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aLyCd2oVtf2DcvfOJky91OkbzYlTEZi1+DlTuOEtGFTSN6icVr5TpD9iqHaqkBNYs
	 E4VYNcX4Kospmj+YXNOe16UjGYD5aUko9tdw8AMqg1J6xhoM8ybrgpsbHZ6QkA9yqC
	 enViwZ961D4vu2LVAiscUieKVf/WBx12lQMN2bJqMBdeIPw0ycdD/p/fafvc7vOXTX
	 HI0dftFRNzD/CmLVRANCgxlCxRgR+68Z6CId37VTehPUE05Qq5hz7GepsdEZsKKFnp
	 QgyU/pTm7EEOHtgKkyea+BgZZQqckVrFrwvQrotljSRBNM6c6iRnil7HRKMj8Z3yLo
	 JgDg8qXm8dfHA==
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b57d93ae3b0so1284740a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 00:14:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZvG42BU47IBw1OJUEEdKjkUaMrXqzb1XQlSIIpx4PKXUis300BIeSUQmRIj8xsu1EodMqGrCtblwzJETUAHsd@lists.infradead.org
X-Gm-Message-State: AOJu0YzdybNpRnDhP1YHzo/drTNTjbO1J+oxtKvnX3WgG1DIdk9NbwiA
	Xa8Krsqmc5iG6LJZsD6V8dLLBuverUnsDyhyiUMa/zmLA3NMOhTOYt5NClV91Mqe68tTSY3ZX8u
	rod8hKdEpCXZ6JaI6xJEtcCwTzie2MiY=
X-Google-Smtp-Source: AGHT+IFi1G5SGzoCfQoYo09oOXzVchVUQnwqXoK2qsgzd7cvdMuGwR0SLJFyyWeKdqGyWBExudnAw/kwmPrFyMTs9Xo=
X-Received: by 2002:a17:902:e78e:b0:269:8059:83ab with SMTP id
 d9443c01a7336-28e9a6639dfmr21972375ad.51.1759475680482; Fri, 03 Oct 2025
 00:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2@epcas5p1.samsung.com>
 <20250901051926.59970-1-ravi.patel@samsung.com> <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
 <000001dc3428$dc2990c0$947cb240$@samsung.com>
In-Reply-To: <000001dc3428$dc2990c0$947cb240$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 3 Oct 2025 16:14:28 +0900
X-Gmail-Original-Message-ID: <CAJKOXPft4eHTbA6qPA2MzyKZPhcxGUbJmfR3ykPaGuXRvacnEw@mail.gmail.com>
X-Gm-Features: AS18NWBorturPBW47S-AOdo4x9Et0GYnS5dR5FsCvXZoQdPFULPyyy5QFJ7b8vw
Message-ID: <CAJKOXPft4eHTbA6qPA2MzyKZPhcxGUbJmfR3ykPaGuXRvacnEw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add support for the Axis ARTPEC-8 SoC
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, 
	pjsin865@coasia.com, gwk1013@coasia.com, hgkim05@coasia.com, 
	mingyoungbo@coasia.com, smn1196@coasia.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 3 Oct 2025 at 14:45, Ravi Patel <ravi.patel@samsung.com> wrote:
>
> Hi Krzysztof,
>
> The dt-bindings patch was merged earlier in v3 series (https://lore.kernel.org/linux-samsung-soc/175664688891.195158.13270877080433356384.b4-ty@linaro.org/ on 31st August)
> into respective maintainer repo.
> Then I have been asked to drop the applied v3 patches and send rebased v4 series (https://lore.kernel.org/linux-samsung-soc/15508cb4-843c-42d1-8854-5eabd79ca0df@kernel.org/)
>
> Since the 4 patches from v3 series has been already merged, I have not the mentioned dependency while sending remaining v4 patches considering
> It is going to same maintainer repo and it will be applied in sequence.
>
> For future patches (like artpec-9), I will mention the dependency even it is merged in same repo.
>

I know what happened, so no need to explain that. Single maintainer
repo doesn't matter, it's irrelevant and you mentioning it means you
didn't read the maintainer soc profiles I asked. You still don't get
the problem about what happened, at least judging by above expansion,
and this means you will repeat the same mistakes.

I will not proceed with further artpec patches until you really
understand how the process works, through existing documentation.
Please do your homework, to reduce the workload on maintainers.

