Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE71CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H8mi4wzWuOnGOUj+vry+C/RsrNVNIni+GZfNRFC6RQ=; b=W6MtHwVggp7NI+95ZQ8s5Kj73o
	yIF5oK4QpZaIfbYuHOHEw8A/goDP7FvyKC4Ca2AMa3UV9YUHTQIH2yTqEo3AnJXE1kshQI6U8TE7v
	qMSBmtzVYfd2V19GTDr1nxBhUtNKAQkbZSqcABNKNTKmaJCzBYjBGIg6fTrbYTFpBmZ7TlkRoxipC
	aqRcz9FhaJncQQrmvjVoWqcNMSujLWseeAwAeApxLnraG3J+KS+TdYh8fEM8dVXTt84tjZ0mHuj7r
	88GJZAcgiapjI5GlvjZ2ZsE3xnUdigtpY3H23fINVbXLp7VTXp5uhph5iJ9T7eauUrFjyzLH86tNO
	naxkJvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA5B-00000008mgT-0kNG;
	Wed, 12 Nov 2025 12:36:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA58-00000008mfz-2Wnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:36:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-594285c6509so775238e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762950972; x=1763555772; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H8mi4wzWuOnGOUj+vry+C/RsrNVNIni+GZfNRFC6RQ=;
        b=YTYq11UfKN0gE5ZHjf4FwtXwMN73fLQlXUv3bPWuporUDSf+B6qb3MjN0Ty41Jc9Cd
         PDC47Vd71b94LVr/TAv7gUG5UUyvHN/FetQOpldtd27Yn0zm0xzhoXILrIkekFFTHuqg
         K82K9DvVEYJ00oZxvImxdUwzH/RAS2L9OXJ62seTkSypE6o/mwIEVDHioRP7jgw3b7Ry
         K/LFFkSWGyGDLQ4INP3hzKu0ZmIK7AFOxQuAVuKZm7rTojz6l8gT3YdvWiJGuw+Jdqqq
         C2ZxHDPfs/P7o5pQCZ+4LEc1RLEbOMU/xurNA4583ehJVb7iS2aZjCUz/ju01jOnuRdG
         iuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950972; x=1763555772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+H8mi4wzWuOnGOUj+vry+C/RsrNVNIni+GZfNRFC6RQ=;
        b=XS4H7wPCgrNbI2n0qRuKRSwJcEwWFLJX1Xdru3KO8zpEp8MBvK+W9q8lsDN6I2p5yO
         5yKAZGWF9b2MGi6t1zzlMZMatsLiVqh06U836YwOa/zOrikNWYkEWQeJFwmUy1xl9JRt
         bJlZ/WNPwNy2kLTsoCh9x3Oa9Vaq8jMYxjbViiy2xlwPGUjBZ4nLaJCdP8AuoMn37q/C
         Qay4chSX/oHrBYQPQ08NLZY0Aqv8XziVBm8FbOoRwwwQfH07dL7JdyJriWzICCppjPLk
         V2BnWm6DrVHSH7m7Jw8A1ajIKOxsShGCTbUWN5pRaJ/y2BmFerIyoL/YVv7R7ujzF8mB
         YFPw==
X-Forwarded-Encrypted: i=1; AJvYcCVAeJeJeAQrUImLlOiJxANXXpmetNCFzzhGV7JsVA8ilEobgXGPpS7qer6u7/+RWMozZ3aI9Hc6KaHSTV9a3yo6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi2t6qloU29a8iySGdzgtuQJZC/EngpsrhXdu0gXfx11NR4PrP
	fOX01LA6fTwOFOd0SLePkVAgI8m4Qz9oG02G1ZVOd1a1SQXl5/50yMtnUt6WL84IYoRGl8wDBt/
	AfjmNpuZMid5yljKTG5gr5m5UbOUJRWQV7zmrDdqURA==
X-Gm-Gg: ASbGncul+L1kB5RsoQpZQnEXih6/TV9rH6m+jRzplWwPNU9Kp6QtzYydxHzMcLXgBFk
	6dqimL54tCCpO2ZCQNAs68E0B4zCQg4D1jdYex3MD1dD6R53WDf5nIOyPz42uG0V+ukfsgWagVj
	rs8e5uoac9+1Xmxxwg37sxwxQK4cg9UHPEB7fRXbF2Rz09gOx/l7hOvzGGvxcDEMngeqVruCuYr
	GkkVieuJbFnpdWauDIHzIpPk5DN54WGf58xhjRQH+ppv26XboWx1n7xnnTs
X-Google-Smtp-Source: AGHT+IF35xdCqK83Nq/ybJ3AbuqFKvL1x2W49echwpcmfLqDZKgxLvlKCL2HANZseQeKP1IlFhLxTXVM/a5c4VD3rP0=
X-Received: by 2002:a05:6512:3089:b0:595:7dcc:3a8d with SMTP id
 2adb3069b0e04-5957dcc3d9dmr101267e87.48.1762950971883; Wed, 12 Nov 2025
 04:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
 <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org> <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
In-Reply-To: <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Nov 2025 13:36:00 +0100
X-Gm-Features: AWmQ_bnt3mMa52ZapQDOrQjKyBrrsOytzgBujrgqyXTEfoNcsLTSjhn-fe-x9cc
Message-ID: <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_043614_671659_0E113E3F 
X-CRM114-Status: UNSURE (   9.07  )
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

On Wed, Nov 12, 2025 at 1:26=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> There will be some Laguna SoC
> drivers for pinctrl, clocks etc,

Oh new pin control, interesting!

Will you be doing the upstreaming of that?

Yours,
Linus Walleij

