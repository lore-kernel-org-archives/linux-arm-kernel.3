Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB04C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=; b=P+PWolDQsuG3gPnhn2IGYI2vKs
	z2BX1D7WoHJc0W/4Y70AtIfI7CJugTapuQIIazV2S7/ekTsJMvJed+ra6jKZ0xBSIfuVNdlBq9hpt
	OENmqTb4oAGiwyWoIgA8Mc0bvhnBb3PILUyO0f8TkYYV8qesUHgaD1D9WtJo/5rFyWMNvLtYjEEC2
	vt6HpAyxPmBTvkTLS+88QKOTD8qfHOLDMXwt7+73u1RG/ow8je8zsszPmCllgRPsIwqaRqAL54FFi
	ziTEV12cVvThmbmGadtr6DbB4rvxqYf5VpwFgaovl6M8r7PXPH/EUXtFnD+i7kqtCCuqGW+Sc/O0M
	lf00YW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlc2-0000000AzcK-0ROe;
	Thu, 10 Jul 2025 07:22:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkX9-0000000ApVu-0JVZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:13:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-453066fad06so3041655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752128005; x=1752732805; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
        b=w5577d2kaU9yZotRk84BQnbO3oRsSbVyI3fxIV1n6lFz77jA7olfkbpgmHYXANfh5d
         nFl0I88BfF+gUubhggK1swMede8Neax2GjJ/6WBkqXd8QJsno84pKCFFzg6MnrCF7CbR
         UomjTX3bj0IMdVOed3j5vKOCdcM1PtAxVqVupvzZLOuLqXJOoavlMeFdl4c9TnMauTKU
         jaUCnV3AYgHEx7fbtUCMOD4CfnFeD5XWX0yAQyArazfILq5UtM44Cd+KKEq/bONIddGw
         wtxU2uqRmVK82xXA2vFHwv0UEksnmjsS3YRNsMlK6IBlHuQKwVn4bNtnuhXoO32P+Pwy
         Oqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752128005; x=1752732805;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIGl3ofMZN4YGC3+hkJsdrAC35OHZlbE6ayWuOboDj4=;
        b=KndHoNXO1IsyapKM9ZxM4VwveSWSo++p4xtBRQ1ZRtbEt+GwJfW9/rwZ3vBozXOVw2
         rdDrJycV+v6qguUgZU+r/rwjmguFPVtDl4VKLTvyRwIkOyB+DBRBKNMtc8iQgLRpGuW4
         mw9eRPIeiFOxVJvoQH4F6MGMr06jd6WP+wfF1p62TLHxsfb6G6mo1wq+YVBi2WzXd/Q5
         8Yf9rhhhEpy1xmHywO1q2KCBc8Ha555LsPXKTYFGXlGGVukKMHXCkHBH3MYXAE465emZ
         DMGL7tcxWAIDdjho2oQy0C6wjjafT6yUrl165FWiEn3toN2T7QspTosn5w6ZOWFKyrFA
         kQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvRUvZwFUdzzrrHPD7hcto1/Iy2eYc3VyFbqKjzZf7pPe2uAz18uO474koZD/ryEqW7XvPVO4V8X0gL7EW6vJr@lists.infradead.org
X-Gm-Message-State: AOJu0YzFBohVf5c6+H0xRZmcwz1cVw6nu1nB9cMOrJrDqmUoMSrRFyF0
	wea5FMQymGeuzQ3pqApxfJCqzC99uIRb3h2nsNF2Zs009jo+zx7UdonICHnBmS0brnM=
X-Gm-Gg: ASbGncuZeHaDZicKBnOn94am5+fNOdngzdeppvtwqB0BdDD56qSLEXAHs8T7nr++8u6
	f+QAuemm4KcNTYJ7VylmQDmvUmc9s+XZsfTEfno4WfIOpTHLWcTPWX/D5eT/xcQ0K4jd1Fhgkp2
	9UKFqO1OuNG9EQr9F5uCspV6r2Tbb7JaVnlDnHy505DdZIHEsKWyDknKmTSXzvB01XWfUjIKg5U
	3+hhIOo9AVJ+OgkBYYRIgs8WCYfwqjd3zqp2sVrdto+d/j5nN9p5vhIjBbuaGf4tf57vgz8B+GJ
	pyxbgEfguwXfdVamDK7kDRP2jOGU6WF69yeLD+rGCQcDXxkcNFon1B2AGP80BGmJkQ==
X-Google-Smtp-Source: AGHT+IGiIzBae/Gufxz9lausYNLZM0rhTyqOuwPMyv4+f1cfDIVfKWfit+8EynHpXSbDAsUNoJUfhg==
X-Received: by 2002:a05:600c:3512:b0:453:78f:fa9f with SMTP id 5b1f17b1804b1-454d52fb600mr47227905e9.11.1752128004704;
        Wed, 09 Jul 2025 23:13:24 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1741sm928783f8f.18.2025.07.09.23.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:13:24 -0700 (PDT)
Message-ID: <e653f4b90422ee9ac09c62292dfb7a2af1f897d0.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Thu, 10 Jul 2025 07:13:22 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231327_144922_EE4F226E 
X-CRM114-Status: UNSURE (   9.53  )
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

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this patch be merged please?

Cheers,
Andre'

