Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A165D4979A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDhrWjqsitQOm02p1yx3Crr6aSKeDzrUUQOFa0Mc4Mk=; b=sILsfSf0trs9PTIdfTnGHEyKxk
	6nCosFcVRzO3hZA+c3C/Lc7OoazGw2CJd21id/YHAHQePOemlUkfGormj1Uja/caXKee/DZPHxeX3
	2pp41qtIejLZN939zjlKaZvYCliD3tTG1VSCuqlMNiWD9PA00txN3dZwQStUoF3uMsMSikzYD55R/
	Fu0DZCKMZVRAyt6m4qVi+ls9kcEjPyVj1dyMhVHICb1ZqCoza1BvqTyWjDbDaB1n2iWIzhuAwv8eN
	RcRGmigclTZvQcrvhjdk8xsihalHAjZSNI26acuOV+vbg80eV6x2sWGZWfbrKxP/k633zsnaT0HUe
	Gw9R6SPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPpU-000000091ps-2Jqz;
	Tue, 03 Dec 2024 10:08:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPoU-000000091hl-3eEn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:07:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso48817355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733220445; x=1733825245; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rDhrWjqsitQOm02p1yx3Crr6aSKeDzrUUQOFa0Mc4Mk=;
        b=p70mRmfluqkmNJuJKuo+/FTwz2VZatsSxUCjNdMBlZycjPVpLU5sPpk8kw0CFET8/N
         4slYfBlUap+9kxjwQY0aCvIUnhBfwhFRk70f0344MEy198UqFAA40av4jvrbZhOewDxJ
         +Y0CLKj12GErnXwIQ4hiRi6KXrO0yUJctVuwXEQWz2HONNsM+iAETob5GluQnZFNpj4x
         5vwKnEXWOiDS0cIN5CGeENRpOKOGmk+nj3/L4vw012GyaOLZjdYF8o38cmc1fUarT/Kr
         kMIeEL1GSwroMh5u42mQVsx/ZhCfTvqFUxa2Ge1H+UGe56f++tfx4i5vHtI8L8koaeec
         8wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733220445; x=1733825245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDhrWjqsitQOm02p1yx3Crr6aSKeDzrUUQOFa0Mc4Mk=;
        b=iG6F+QSUF41WVy8vLwI/3KxjPeMDpT6/wtQMrM8mrrOWD+5sla3HMY3Aw9crbE1Tpm
         JiIjTs/4m6oXl7aOvhlGfM8whhkamSm3ab7aTmBQRJze/B/Sj/2COR2OkUjDJGePw70E
         g4EiMts+f580ZsCKLyYFs51NAHYp38yKqsGrAuoWh5eIYHRg+5mvjXQvNF4hyepY9Z9h
         clOFNSbpPhnJ3E7LFIYgk46VnbSqHYoIxoG71gzLO3syTH+C+J1UQ8mgW0lQPvkm7qCD
         8bfsoDROp/5UKe/ybXtmzgtQNualxkx1+SB5nUlEUu6jgZ6+42KrSvQzbNDWDXDNrTcQ
         JvhA==
X-Forwarded-Encrypted: i=1; AJvYcCUykq8xAOLxrT2GqmODjfI7y0tm1+aZEhJwGC/CP1y7hssiBhH5eOnd4TGRSSSV5ZM+QwBmRJ8aSNFPC/IXq/Hl@lists.infradead.org
X-Gm-Message-State: AOJu0YzoFQvgnyXLSK16DWq5XdL/rN5y1uxRstHRyEORis8bYW1hU7GG
	dBvNAM2vimOnnx4GYB69kaOn+t3rp0x0KTtpgt/7/eXDbiJGpJc35z5XHRYHw34W1DHHZNDhAQf
	eBfA=
X-Gm-Gg: ASbGncuBtLZuXEuE6PhQTxNohO0ynynADy1Tre3j3K2L+4Dq+IsocvuH87gPjawKKhA
	vKqtGDzIBcz/r32Do3TDX/Zepc0u+7KIOA2JlxgP1aPDma9+V77BiWAIQBR8enzcIaiKCrWXQ4G
	fhtpNpKiAhjwKo6Lsp9J9Ahg71H5fLfwOlHaENw1xovdRjni9bD8VkN6Xgu6YFyGIXpZZpgxpic
	6OhepiVroUCrOgfZ9gq3+lDbXac1rhKTtodoz0BgahOctU3hU0JKYk=
X-Google-Smtp-Source: AGHT+IEX3CBzUR11qB9xMFFVxV7orqiKJB6nzE3kEEtb8duUyFuW0fDSGHNnay9m/wWpgm8QQt4SVg==
X-Received: by 2002:a05:600c:1f8e:b0:434:9efd:26b0 with SMTP id 5b1f17b1804b1-434d09c0c12mr16633575e9.13.1733220445220;
        Tue, 03 Dec 2024 02:07:25 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm215194865e9.43.2024.12.03.02.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 02:07:24 -0800 (PST)
Message-ID: <b311b50e0f54959cd8dac1ef21dd798dd6204331.camel@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor
 and don't require nvme address
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 10:07:23 +0000
In-Reply-To: <20588923-a660-49fe-8efb-766bee22f215@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
	 <fe254a002000f2bbfbe51d074cf28f7427a27f9a.camel@linaro.org>
	 <20588923-a660-49fe-8efb-766bee22f215@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_020726_925618_DE5940A2 
X-CRM114-Status: GOOD (  18.80  )
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

On Tue, 2024-12-03 at 10:32 +0100, Thomas Antoine wrote:
> On 12/3/24 07:57, Andr=C3=A9 Draszik wrote:
> > On Mon, 2024-12-02 at 14:07 +0100, Thomas Antoine via B4 Relay wrote:
> > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > >=20
> > > As the Maxim max77759 fuel gauge has no non-volatile memory slave add=
ress,
> > > make it non-obligatory. Except for this, the max77759 seems to behave=
 the
> > > same as the max1720x.
> >=20
> > It also needs an interrupt line, and the previously mentioned shunt-
> > resistor-micro-ohms, and probably a power supply.
>=20
> I will try to add the interrupt line for v2. About the power supply, I
> didn't see anything about it in the devicetree from Google. Even it
> there is one, I guess it would be a single power supply for the whole
> max77759, not just the fuel gauge. Wouldn't it be more logical to have an
> mfd which activates the supply when other functions of the max77759 have
> been implemented?

I've looked it up now and for power supply nothing indeed seems necessary.


Cheers,
Andre'


