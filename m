Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B9FCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z76NHbYS0l11eBUt7HKnQi+UP7NNGUE+0BdLSRPd0MQ=; b=SbcutD+I17N/25rQ/Z1e23MxL7
	qlUgNOpWiO8shuVw1xmCXHvtWBM1B5z/YTc0aw9Par4odwtnnAMxbB/CzWGmU4Dcj/GrTH0+H15rG
	YiEVLg8CcHjhR92bLXGCrb36G3pfuas2fJ+FeKp0gxondISaQEuQUZA7Mb9JtCKWMOOyR/JFzfVeb
	/3sy4Tg4jWc5y76gF9MiwQTfp/TcTpBDhrlSnmxkVGXfFu+C3PqPgC+0Bu+aw0kuvxYJ/T931OLZe
	DyZ+b00e81F1kWI9DeIPvQG+8v8yy8Buky//zS5QrUQY/JsCQxqL2JGM7ph9g+lHxJMaRKeWpHZHj
	IbTXejdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvA5-00000006Kon-3HaI;
	Thu, 23 Oct 2025 13:15:25 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvA2-00000006KnA-2jtd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:15:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3737d09d123so11007551fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761225320; x=1761830120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z76NHbYS0l11eBUt7HKnQi+UP7NNGUE+0BdLSRPd0MQ=;
        b=Pe3V64h9lCwcXUS3w9SajWvtG/KHgpQlFBGU5E/TugoIHv+hYqG+EGSeim/BkRw5TP
         m4MDRoxs/2V4zBxddZw6c+XoBjj3J4deDoedKIC1F6dvuGifEPMucbfvB0V0rLXk4qnU
         Hx2kKhGVaCAGK0XeF/rlUo/7kE1NqWiJ/Zn1pI0+p+kfSg2dKSB7HegTh0eJyAuMX5vn
         UBUCVKzBN2uY1mbhvY7kRYHIKcXdzmT9+OFuNd4LP3ZK4v+OIflWLcxyW5PSDNkgW1ve
         76hRUikVBRrOnGODCxTDwEvu57gEQAbO6Q5iVN9it7kGvUb/dal2xW5dybHQyuQzBM/v
         Te/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225320; x=1761830120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z76NHbYS0l11eBUt7HKnQi+UP7NNGUE+0BdLSRPd0MQ=;
        b=Il21wRcaGf50e+5hPR1CtjhjQ00kGCiFKvjm3aidf08imL8HCE5AQVnsY36TVrv1EE
         UbfnEcP/IUlhWD8yShWKlgM1WRJf9JBI3TKP5C21iez1L5ytuglKo5fuIKwuaXD8hXGF
         Gqofie4yF25l6Ck71FFZmfu/QR4ZBA1ep9MVQiV/6K8MV/8+Tc0K1JfUOVRyLKPo6LjX
         qlspvcNl2UZTGa5ZJx7yW0U6HkyjtKhj0ElDxVEFElXV/IqC32XnN41rNNveR6UuUdhV
         PeKbQenbSDdmpV78aHNCUgEqoswpOZly68N0EfXcCDXVIyezaRHV0ggsm36lympKERWv
         ccyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9bQyLTYiYap/VQMU+K/rG5NNerYrxU61Bl9b9CYrihVidLjV24np3rO+OO0/QSN4cGxPjdGSzEGzyFN9Jp0Zc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz42yg2LqepU7Ye0p6MRhwBatf5VbeQ+nX2saG+do8wI/MHz+FK
	Wb0Lg414O1A0R5LnCxorANrU7bp/EHchi46Op2MzPtBId6GWbh6XAK7mA1n5BQXlHeLFWNogkfL
	ePzObm5iOfJ/WZeH4OO2r7g3S755Rpoyt/oJfLe48oQ==
X-Gm-Gg: ASbGncvv9/d3GX2so5Kj+GJna3HPc4dt79swootvexDHffArQo9vVZcPUEdnWuu4csG
	iwMKjLumO90JmKOQQGzGvazHI/bj03i480MWBrTkFWSRNxEhIHdhBWi29amsbpTb88R2+czIeUs
	yn0/tHPCSz7mHesTCXIkD7AGQsTDih8XeMgzZ6YvGkrvL+Tu+94/3lBGC+M/I/CFXf3q8Y2mcF9
	E0hVFPvK+Lx5F4u+22+a5+Wdt9npJDAZKpGUHBXtfCjVjEw7lVW2iFNvlCWzgwJZYgkj17hH93U
	Wm2xmA==
X-Google-Smtp-Source: AGHT+IG/ZAd7RUnoCK6/TWMMjPJ1VQjmx8Caf3SATBmY9x3/PxhBlmEnwJGz57NSvFmOq7fh2pz0uSBe0AV0o43DOpw=
X-Received: by 2002:a2e:a906:0:b0:378:d424:d3d0 with SMTP id
 38308e7fff4ca-378d424e478mr9052641fa.8.1761225320551; Thu, 23 Oct 2025
 06:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org> <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 15:15:09 +0200
X-Gm-Features: AS18NWB6N45TxgNnccz0wGQlLC0_F0Qi57GxnfcGIPV2g0I0ThiCPIszr8ydkDg
Message-ID: <CACRpkdZ8rcWy9SvNuh+wq0Yz+byYMPkK6ZMkqjd8YW3SKKBzug@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: toshiba,visconti: Drop
 redundant functions type
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_061522_700377_174FB508 
X-CRM114-Status: UNSURE (   7.90  )
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

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Referenced pinmux-node.yaml schema already defines type for "functions"
> so $ref is redundant.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for next.

Yours,
Linus Walleij

