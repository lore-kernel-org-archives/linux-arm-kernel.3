Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B248CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=; b=0v78emxdc4yb+yQXFFxke1uh1i
	QvVdk1jLtn/jVO7XbrUTqpcZjMH541Ng14XKoMavf3Cy5zrnRXI+Yran04ONM8V675cQXdjPZyFGk
	FoCCOKJj15Grfw2S92p3PfTAXn3k0a1OBMQmUeFENWNdD28m6lKdteFHgHZnbT9vv6krG/aNnpQn2
	o0cRr/wuAY7QwgLPGLbk/vmaOrGVxByG2/nxfiTl3LJIi7q4wnL+nkHV5RzUorqmAOddAgX4b05Ex
	KyKg/djhxjLMhF0NdcbgfAwDs38fRwyzq11Cf3VOAXBSPINX4MY7cWckLekwXO3lz8j2r9qT4gYf5
	AINp6GqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVFy-0000000Eozb-15k8;
	Mon, 27 Oct 2025 22:00:02 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVFu-0000000Eoyh-1SiV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:00:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-592fb80c2faso5732909e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602396; x=1762207196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
        b=T8nRKa11no/l1HdUP0RuRfvARLSMCbhMycjUB0Bl3IM4/RfJM9DBFhGciZv2Kc0FmK
         Oh78sJU/+0KzzrEuR2m7NMUvLw5bSMVyUtTtPN6eJsRmv7pAQKuW1UUv6bOQFnmWwk+1
         aQVPWkr4DlGVkJVF2KLFPYzYhEtlpnCwaoE+zmsOLZ5/ao2ZCwuZ7efEyj+tiQXJfjF9
         9+9vPgx4C9cquartz4/+ZtPl4xtCnT2q8w4AG56Mi8+ot5j7+guwaMyDTLBkHjGlzUa9
         AqqIaAeEAbD3iBh17VXS7mL2CHLLwCsYFN2T6iaHMd6gTRyiLsj4Tj/BlMIcfRmNn0el
         NI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602396; x=1762207196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
        b=a4MhB8r8n31PTWTroBPnA7HnHIN9FPJTJakExD4c1uPlOeDhcYodJKTap3CXsj+oUn
         /M5vQyBUHBuOG/JFATE5tU8AmpXmvIsduZ0kEFwqJ/2D/v2rbWHtcdALyTb+s6bZnmcM
         sfnOuPkze75FbTuE86dxfNgx7p6aylN52jyackHU+1dh8oLP3Oyz76BMSYMxJFd/z+Zg
         mSCrUPZSVvO1m54LdHVJ37Cs0I6yAf0ZZekuO8OTPQMchYL49F2DByRtg1AUvB65OraS
         wQpWEkF87vC8+FZHSYwR00qaHy/57pIp2tf4kC2e25Fybc8TKjPU286LhlH0+8hOjMEU
         fSOw==
X-Forwarded-Encrypted: i=1; AJvYcCWhg5MxNygncbCzNBPAeoqJ/ii4ZVUslNvkax3TNwyQ8+T8t7eTBEpvn+iQSchqbWDqqxh2CTk6+3J60cAAbVRL@lists.infradead.org
X-Gm-Message-State: AOJu0YwPuhoBPrUY+GJ1VCpmLtrXT1/fwa+8634hI69C9yl6QKrUGjT6
	kXe/ZFxoXXPb9lLLgSVJtZKmU5C0Y4NYBRe85IERGHcYIHh1Mi9zP6/P07I67R8E7viBL7bgRVS
	dAfLgG36oTQYpt79NAGecB173dqvRhGFxriFWZ1h57Q==
X-Gm-Gg: ASbGncsfyPuF/PEnMCVbxZ8xOshxe6jbZ3nfwjMETBycAYbrqMS9TkpZGX7v65WFT+b
	4cDxKnsYoWFao5uCUhyaeXayXkhsqJLQHBu0isCjTXwmAwvijmaALQojV0QE/l1ylpp8GtpRlVo
	5T9djFAIufw4nip8P4FKU/OK7tKugyNP0dKcVVT2h3WsZwjReaBoG83FF3Xc+U8j00Y7ERRBmkh
	Ie9k2C2g4nMe4X3JobP1eBurpZd3ikigxhh/gW/f/sTqv3r0klpAaPs64BIU38gXQAIEEk=
X-Google-Smtp-Source: AGHT+IGENMuTPrZutUQ46wuswD5BGa1TjRpeG2e88psXFvOk1H1653TvwH72RHt6gkUrwbtJPBtV0+X773X1GDUqzwQ=
X-Received: by 2002:a05:6512:2349:b0:591:ca21:e985 with SMTP id
 2adb3069b0e04-5930e9dc52bmr571986e87.43.1761602396255; Mon, 27 Oct 2025
 14:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251014153040.3783896-1-robh@kernel.org>
In-Reply-To: <20251014153040.3783896-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:59:45 +0100
X-Gm-Features: AWmQ_bnaFR_aOmEFaodrc7AgItv72GvXAJNlQaZ0Wjyw4FDq1FooRjnsolDKmfs
Message-ID: <CACRpkdbiJKy2KrCO2wETQzLAkFate4miWNJ2Ed=a=jzS07wqsQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell AP80x System Controller
 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_145959_751994_33F53E19 
X-CRM114-Status: GOOD (  11.99  )
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

On Tue, Oct 14, 2025 at 5:30=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the Marvell AP80x System Controller binding to DT schema format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

