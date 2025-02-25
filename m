Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902DBC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/rgH/M1iUBKHpKR73DrjoPuwhXP790ErvaX1sQ/4T8=; b=dcIixXHzBMXmQeXo6mrrXtZyIi
	egCl6awuJG2JzgN4XKdFAxOvw8Fyl6YHk/+52oWLMe/G5NR77w3gLdCpk5WmTyaleaYN6EVda6xqs
	nXrE928uUPiq7yaQaPi3SIiDrUINnEv7HrbkhlkcplsndbqrA9ZIwqBYwPcJyTpPfkUHbRCLcT7Iz
	ji5wIb09WBw16IzJpzrmSH1QH6hMzoDvtukELhCwm6wUoieZAgmciGuUePqelLIsioJdKLGsK02c/
	6kPmlJGqMng4P5cIBu6Z4DCclTi4bwzBzLarZHlEXsuYZJtiJdJuOQOl8ri2qVAJfpw/qGBhdPlD7
	SRjz+lOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3Q-00000000PKk-0e4o;
	Tue, 25 Feb 2025 16:45:08 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxQB-000000009RC-0P66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:04:36 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30a2d4b61e4so42333021fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740499473; x=1741104273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/rgH/M1iUBKHpKR73DrjoPuwhXP790ErvaX1sQ/4T8=;
        b=tyXbdRD6ZuNFoDAPFYmM9cVTo3ci1iyrOPwCbZrNgJMrGG69k05DNhKnPI+x6fc8rB
         YvpRspG4twkvT4J7NIf/6Enc3OadAH4y1QlTj1ttOPVi0/mrD0dIs4XQ7ICEUsi5oYRc
         Fg8bxjl3o2Lygwm9G2qwE++TlmNkYh87msxCqtVn+016Fi7kooR1SG5q+fIpgAAeX2+8
         O6hAevnc5/PqHp/NpDV1NJWb6Ysv45dpdwzihJ91OLKMt1Ee3hMatDQk+wdWx/W/sOaA
         GvhPNKFC2CN0PepgHwKekkrhPbI5m6PUMVaY6hfq25qW23FpPOuHzX8nj564ib6yi2az
         KvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499473; x=1741104273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/rgH/M1iUBKHpKR73DrjoPuwhXP790ErvaX1sQ/4T8=;
        b=XmqzdEJhAC3lMavSxPaChz/B7Q8FG6MpjQ6Sqg2MX49O58HHe2Koijp8oeUsxTQq1n
         kB7xq86dCd3343/z+yfrMhH4VFmcRSH8teNEl71jFT51NBCSKYLTUzhqScuQWMkiCm9X
         XwHeLZG07dlqNcdzqOnGCgoG3s1zL3Pcqc2/hoPS7ppE2VUwBm2A0O4If7ZC4W6d6buK
         AsX+KPRJX/6rc/Nq8Mq/g0Hto0/kc8uq4fhP8gekAjfNgNzOnR/ZNLyYZjTgFkuKdm5a
         fPg8D1wzFx2ijXDL7IStRx1SeXzPYaEwVujDSi7qtKirijLti8goOsbZ0AO46v8T77Lt
         /zvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc2jHh0UZCxj1NgKmTJie5hu5RUnz7Uf1P7X8D5IZGzIhiMGv7Cxj7l+Wx2FPrxa6W4socKnStVe/Psf3WbkQA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzftfn3q4pFzXzqR6Pog7euPewZXcLS/0Ui/4x47Rxs3HYw4RCi
	IO0pig//8Tcy1sj2BJABdTzDEYpcwkepyqxccXmVOVKpYX6tGGp9kaQ7NtocawG+23Q97DcDfhc
	1Td6TP+DDmI+Z8Eh8r97PfEnqQVgrY+8Jw5wllQ==
X-Gm-Gg: ASbGncvaKlTSomnhGnnw3RBlJ3X9DAWjnMk59Ef60jEbMiMOYyhjOlris9Vu674meL1
	75mjPXKGj4djaau1PCs0geF1IQ9dHUX0IE/fPbbWjhYiIFQm6cY8Yo0hXYp5cI+n933vB9tsuvW
	ghg9THTho=
X-Google-Smtp-Source: AGHT+IF86ZQ2QJdD1PYLoHc/m9ZtOYqwr0UmqMcIQEFbtQ0FQsDcgEhCVOpxamexsFp+Vfr5eRxzkLGXB4FrbPdhpD4=
X-Received: by 2002:a2e:3504:0:b0:308:f479:569a with SMTP id
 38308e7fff4ca-30b792cb1bemr791481fa.29.1740499473413; Tue, 25 Feb 2025
 08:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-11-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-11-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:04:22 +0100
X-Gm-Features: AWEUYZkiPGUqQKYojawtR4pOItmwYFS0sJRpfMeD4T6KUl4OYeOcmPtqW0dPiYo
Message-ID: <CACRpkdbg+SRziBUyFXR64H6P3w+ZU-Ngp5GdX77VUHwqYTRCYg@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] MAINTAINERS: Add Vincenzo Frascino as Arm
 Morello Maintainer
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_080435_132225_F61CDC3A 
X-CRM114-Status: UNSURE (   8.43  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add Vincenzo Frascino <vincenzo.frascino@arm.com> as Arm Morello Software
> Development Platform Maintainer.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

