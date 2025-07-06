Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69350C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0y9e3VsPZwS3i8gc70lCXlWKvcLrZlEitoiyjDH0k0=; b=GfqB4SMhdnlDzd
	YnMT2lV6Om77pmagR9bD2bRwm3ZF+XMiz/WxoZs+4JQExLU5OZjnwB9e0vRC5E4T2TakSeoV8Vdbr
	RzX05CEw/cMTjOkTk76Sm2uV/kajV/kuOz80yVM+k16z2KKZicqxIXCPGAvb7X/56SqhoEVuC2h9y
	NdLaoW0MEAPvxiwUqSRJyAlVGec0Yxcj0BVQQx+mAi7Ykg1LMFC9Bgj8uAcVLKjtMeW3faRTX8tE6
	scAkUJon/wJQxwxyhsqA5olgbfZSAwZrnD0B6cZ+vzUtddsEbZdpaZey6+VErninJd1Mq218wsx7X
	VP1OUtVlRH/576qKxKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPHn-00000000HYu-1UdS;
	Sun, 06 Jul 2025 13:20:03 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPFQ-00000000HI3-1uS6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 13:17:37 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553dceb342fso2273110e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 06:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807853; x=1752412653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0y9e3VsPZwS3i8gc70lCXlWKvcLrZlEitoiyjDH0k0=;
        b=WGIpQfeJ7Edl/Ej0dQ9bZG3CCpRQuclZtWCpGA1g1qHpkTIFoHkYqOHynSAvWURoKB
         J5QC5Ufb5n1UBqprS2rZx9IKCD5wXiMbfNANcZes0CyN833YKRiXOlh3vbuehkloGDkp
         vrBiUFp+cQl40jMAP79SF+K3Ztq2rQeq7AQGI2hsPhf+97/YljFlDgTv1TVOOQP4JKgb
         wBrdpqoCHRDIfeigl5tLYBDDUZscHnaLCBd9DFgy4KBiNc97rzXgVgDw+b3v/mXjoq3g
         cRmUfEOy4OSxnfjxnbop6j+08w/RRuU3LVE6vOxbQFel6Cgg0YXkHIDAEuae98eyZIS1
         qBbA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1s94a/B/H6nh8klgF1lFZbPj0qlwVv5wt+uGgDTlxnaGM2e74KRYcKA6utzgJ0KB0Gaypct9n/qbK7X3H4nY@lists.infradead.org
X-Gm-Message-State: AOJu0YybHKXVT3oZtHU3+6htdTnL6sXeQh8mJBfG9IApzHNVnI372Ox6
	NFsElKkgcdO2Ktkf95/eYR7fqZxE+HbZJkPNDkqi1aTXlkKZzjZUrL/bmTTumoMmIhk=
X-Gm-Gg: ASbGncucvvf3tsnf1jsxHfh58kQWOkBSQtjCN4qIE9Vni1KMmXI81a68C9Xi3dpPXCt
	T0qyMk5wYH7GMOUpK62remWxDTUDk5k5SmmNv5qLJWD+CPl0Ug3xOy5hhbTF31bznsNSILD+hkV
	3R4aTQZvSMqpD7rtJBr1CzVFAOWjoWkmR02c68M7SZP7NCCbUyCsfU6UbJqjq5IbPbFIorGWIx6
	iadY83vn+RTwSGtqVIOWkE1WV/58AVVx8U+3i/8UiGjhfe34Ypikb2o6GARbz7mjmekTG6QlLAA
	//tD8gmSGbNHkDgOq9OyBLzFyqQnsD2A5XOO/D7hL8lsDEKOHrJUHDyGUxycFqtofm3DlHPS3Sk
	Eu1uiJl+TGYYnDnUOQlQ=
X-Google-Smtp-Source: AGHT+IHSYZsj8v4DrucXu+CDFC74i8rnNQ/41IDYEPoLcKUgEQAQPHAQfkA1x40R3Lt7reaNzKOQkA==
X-Received: by 2002:a05:6512:2386:b0:553:2bb2:7890 with SMTP id 2adb3069b0e04-557e5521b5dmr1134209e87.25.1751807852858;
        Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b5d7fsm937672e87.186.2025.07.06.06.17.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso22371771fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGy2Js1OBxioOIH4GQQ2sopYDDGg7K6xRShk26p+DHBd8CyBQfRsuKDDGj1RbAwYZBs/81WMBn0tMjhWhBOXxO@lists.infradead.org
X-Received: by 2002:a05:651c:1104:b0:32b:755e:6cc8 with SMTP id
 38308e7fff4ca-32f19af1307mr14177851fa.31.1751807852041; Sun, 06 Jul 2025
 06:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 6 Jul 2025 21:17:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
X-Gm-Features: Ac12FXzvgRNdcFpttWg_IhO6gnULQzwACTFMlrJqzvSYihRttnVAncFXhqPJE4A
Message-ID: <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: sunxi: Combine board variants into enums
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, lukas.schmid@netcube.li
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_061736_493268_2D3C9DA5 
X-CRM114-Status: GOOD (  13.25  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Jul 6, 2025 at 5:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The common style in all bindings for enumerating similar variants is to
> use 'enum', not 'oneOf', so all boards of same variant or using same SoM
> should be grouped under enum.  It is more readable, more compact and
> makes easier to find actual devices from the same family/type.  Also
> there is completely no point to repeat the compatible in the description
> (incircuit,icnova-a20-adb4006 implies this is "ICnova A20 ADB4006" and
> pine64,pinephone-1.2 implies "Pine64 PinePhone (1.2)").
>
> Combine two easily visible cases: ICnova A20 and Pine64 PinePhone.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

I can take it through the sunxi tree if you prefer. We do have new
boards coming in this cycle, but I don't think there is any overlap
in the board binding file.

