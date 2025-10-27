Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF2DCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=; b=erlR8Ab241zaQAFBFBKq1qM1Ts
	sO3pDyLxOHVasD2aGPSGjCjR9ISyDTzHvlzzDQS0TJrr7R54McywMfVpH8fYwRcGq3PEM0te9T2DR
	hlR2/vH/H6L2Rl9V05wgQKvg2vy/XuskhyRNr4ruC7fVGZyoG7Q8ZQ3AFO4dXU8RJ7lb1Vl3QyeS1
	5gcDqbBn1Qc1cerAXIHpRY2Z+qmMJ305xYWV/Tygt29ik7RYIcYdDqqP2N7WVHxPrEeWTQRe4r4Aq
	AirrsQVesbDOJwX1GHMhw1iUQJLY/8vcepWa6F8up+hdJwFAli1Xd8dJC0Kb7EdaqtyksXYdkGvNf
	fBdkuklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVSR-0000000EqCN-3tEg;
	Mon, 27 Oct 2025 22:12:55 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVSP-0000000EqBZ-1pz3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:12:54 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-375eff817a3so55268441fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603171; x=1762207971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=;
        b=NTo5m3HBpXJMgDjlvKjF9efvH0tHTGSwSn6A+NwArbHz+kebSXbS3Lf4ELtcbDL0A+
         is8y4ctrY1AlJz9Ihdhdg3x1PDwC6ZCvLzWU3Q5IZAa43mfPwPGInYCByDhiFE3uRQpi
         6KAejrK5NUtwJwPmsWmwedOc05pT70fSoPOKK55zjrikVwGPlIC3V7EEnvf5072AQaL7
         I8BJIyEnkzlR8xx0zuJr7ojKryiVD0f0Hf5s5ADqwxZ9TBBkve3xxpLfiThSSpC+/JJ0
         oCETbVyUzMJ8UM7Gh/hj83UeWqkQwoxur1bPYAFv+Z8GmVK0Nl+fNQ+WiDSfc7Lx67wu
         R6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603171; x=1762207971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=;
        b=RNo1ABZdJx+epS8ANluGoZh6BoNrP8woGuQzgWTd6DZugQXQv880yROlHnfsbUp3zz
         y8UFmyH4rL58ckUpYsITJ5Ne/vEnUxwNLrZNlpNs+AOYmxY3ZMa0vAFLLLYFRSYf9xt5
         3A89nAA4gcc2JAF58Get8gYnp+YoBhc5M4m2Dp9yleGlT02HgTOCG2qD8l8w5mpd7lo+
         NiOvsqrlz+UrhwYIzqOVLEvJMeIOF/sqO71kmO7stSppDGdg2Tz8hvMpyNn6wvYWqGm5
         mqodsVd1ri6ecYnocYrBdwbcNPkLFt59Xqsa2MgIeLRBDAII5G4BN2DpKfeonZ/Lgxg4
         H3yA==
X-Forwarded-Encrypted: i=1; AJvYcCWsw0GyqelULjylid9C981V5RmDCQTXEcC+EpPcyHGtUTZ4sq2NoY+dggn/PKc4j4+awIESdglPMIZUOcp5uIQI@lists.infradead.org
X-Gm-Message-State: AOJu0YwrFY7WPc9HyJtAYLuBFhfGepUbzrZij6mNI5XeZZxGSJ+HZs/v
	icD1+g5rIRRajPiu1T6ZUYU65uSO6QupzaI0IZUBxbe4Vkool1ZFWNCgwsWstYXuZpp2PoD9LFk
	5XcKzwEeoMD7UloOu4QppRSm50QIXTOsyc5HmrrmocA==
X-Gm-Gg: ASbGncuSKn+je+hqQr1d2ZAXTmJaI5kfIwNXNYRV2R3p/yv0xW1/vG6OieqXFCwtoDH
	PmulIfTDsTiA162vbAGPGLGp01PrN+S1JYxh9ODikqVPaon4wRfZwBgbT5A0lOg1AttBEe2C+Nm
	xN2sLjeDJFaSfRCBq+EIIh5qoRtNdC688uWL76qLxPxNpinrsOc3ulrwO94Z2Ss/zCxtVYfraLc
	hWptKnXjglJjl43ZJjXoLmCRngGM0E4rFfoftAJ22L0MicRACv06XUpNnW3
X-Google-Smtp-Source: AGHT+IEO4OBX6LOPY6n+Kwj2RHxhOjz2+JIoc8GL2mJCp5ePHLtyDD4AZKAQpVBpjKroBtS/M17W9y9jzhmN3enwix8=
X-Received: by 2002:a05:651c:4406:20b0:378:e437:904f with SMTP id
 38308e7fff4ca-3790774c7cdmr3152661fa.40.1761603171396; Mon, 27 Oct 2025
 15:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-7-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-7-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:12:40 +0100
X-Gm-Features: AWmQ_bmFZYqcGNF8COoxdkJmlFz45N7cHtmhxRN-kPjjoyKz6dQA3AfG9pT2B40
Message-ID: <CACRpkdaSvKiGaOMbp5cmH=cCCzmi=cbUf+=4GvMZ-e-NbJT=+w@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] pinctrl: stm32: Simplify handling of backup pin status
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151253_480689_4331EE11 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Use C bit-field to keep the backup of the pin status, instead of
> explicitly handling the bit-field through shift and mask of a u32
> container.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

