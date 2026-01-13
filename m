Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21290D29DF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOUzZNLG++BOpSvrwpgxq2EsKiP34h5YqbSCpa3qsnM=; b=fPggvc/wZKPQ8XNbU4bQ4V4Voc
	B9lOSsalFh/tXQvzRSl8VFNOMN2ytaQ/sWMan6QHBSwNBUIAl6QJcml03SoiAiFjiuV8JsweTxM1F
	pe6b8jcbhvsmJkmBThAolIjPjgtwPl8b07ZaAi35IzTj3tMVlNzlkqKXq4BGx0aabrY8+XZnvF0vi
	uauRexAmgJUWK4eDVO292W8msdD6UBUTHXlDdRkill6xubcQMfo1yc4PEfp/1yToS+mFJYuzUWH/c
	P07zoVYKYEn+4NpN3gwLGstk1TXGFfisS9H2oeCy9z8NmiVPqJWCQ/PWFau/vvzFtV2VksYotcMeQ
	8TNUeNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfayc-00000006rGk-2QNj;
	Tue, 13 Jan 2026 09:46:14 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfayV-00000006rFN-3Hwo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:46:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso15434094a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768297566; x=1768902366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOUzZNLG++BOpSvrwpgxq2EsKiP34h5YqbSCpa3qsnM=;
        b=qcyRAR3cHyOMAma0CZDvmEIM81+++rW+B+FjUHUw2LTSPL3PPyMwa+q5LlY+EeyptF
         FsXWWk6JGm7NS1uHs1i6tb+K+aJ6iPM0+wUrQhAR68ReJ6hkjMbKEUm3W5ETcEp8wS5i
         43b+2XSKnu1YaN+YgVqLsqBkJcrDXPkBV+0ElBjCA2fnK29THdFEMoFiHebvvmHZI11N
         Fy3sHaDzGwWk7xbJ1FCcSrpadTIp9Qh1cE5ZfEimmshISIJ5BT56WxzeeoAvWxc6scxf
         93GsCmZIHD0dwmNZc1YOt+DPP77Pm1rpqlcfwYKLVMqjlA7ktQQa1cZMHByNhy7w9Vv9
         OzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297566; x=1768902366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOUzZNLG++BOpSvrwpgxq2EsKiP34h5YqbSCpa3qsnM=;
        b=qa1RB0zcPy4HKL2RZucfhXIkrdpwSufKZYn0tKUU3qXt1Bzjwu4SRxAnFEC8uHh94Z
         kyCoCvphfiIrKUOt6x/tXMv0GUvVfvgLeDgmbgrugXCDYa3St6OETVVfdQrjRIA+7NbJ
         Df5UIAv854t5PDAEAgYq7To7OTRpeXxXZMN7csA4ihR0UClvk1keZTobrdlqqbZNo8MS
         6vEdiVjymNS10VzlHmo733JY8HwRGzrxXSH9TWsHxu8kHcKdNznjNZ1+MoFB7U/KdjuG
         icEX2N0iX+3btNplI/bc/SvQpWE9cFlF3TfZYOW7EpoyfCmXlZQSdRXmYV1czdpAQvUu
         RWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBNnGoVD4dvQEzRd9S0IOyh3WSRIzVEgBhmG5JrmLJhbeFgXynSxqNFX+OROZIV5xOSExWx0odHWU850t+fqhJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzA2fBtwJqBvYEgCVakioGuuTpvfNbHSnY2QUPlvVXuB/CKNmbG
	HMObGABoq9SDbHM3oB8txBLZeu/Rf/B7A2xg9pZp9h3coCzwuxL8WethrkvJQrWnLquRq3VxhO2
	CAul+sb17+kyikL6bL63nauIjWhypqXvFu0O/Vm4agw==
X-Gm-Gg: AY/fxX7MFh6bHyVM1WeblKCMhQVervdgOmar0ocEc5pw34/ONUnp7hQHC5hCLBBpsnH
	gfncuZOOxrA3P0rUxfCcXSeFDE192c7UmqoOKSSuZBcMEf9lArAimwkSpVDm3f0Gg2e1uAQ4Xop
	5fQZnlxVCihKleHImxKkFV5yxGg8iNM3sY0YktN6XuzULE/uLHXpNdXD777daj1AcJOLVcHSNWl
	WQ0ItLIu07/DAdyq8gvoXM+2V3bIFwtdJjq3Gcu4lhze6TJfNmKJpO1RLBoG/hNV6dSTfwOL9Dg
	ERD/xeEiyIQHfR+wipV/Wo8t/XNz
X-Google-Smtp-Source: AGHT+IE4ppyO6TNCEJ1MRxCWBiqYIPJmnwgMy07s6owsGKz/BEfqAuqNb/3sIyiNm3JkP0ej35Yf3DJuBcAcOZOJhOg=
X-Received: by 2002:a05:6402:1469:b0:641:8a92:9334 with SMTP id
 4fb4d7f45d1cf-65097dceb25mr19588758a12.6.1768297565698; Tue, 13 Jan 2026
 01:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-2-bd00903fdeb9@linaro.org> <0076e60fb5a4d3a6970d93b4768d4f083baa7a83.camel@linaro.org>
In-Reply-To: <0076e60fb5a4d3a6970d93b4768d4f083baa7a83.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 09:45:54 +0000
X-Gm-Features: AZwV_QhpR9BCCbo7U_TZArIDQIupa5HO8DwIuO1eb58xNI24g4aNmHsPIkfpRwA
Message-ID: <CADrjBPqUv7o+9Tc2buDcLtwCocNdwy=gXz+hBqXC0EGsoMq4Pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_014609_084719_29376770 
X-CRM114-Status: GOOD (  16.37  )
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

Hi Andr=C3=A9,

On Mon, 12 Jan 2026 at 14:32, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > Add dt schema documentation and clock IDs for the Display Process Unit
> > (DPU) clock management unit (CMU). This CMU feeds IPs such as image sca=
ler,
> > enhancer and compressor.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v2
> >  - alphanumeric placement (Krzysztof)
> > ---
> >  .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
> >  include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++=
++++++++
> >  2 files changed, 55 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock=
.yaml b/Documentation/devicetree/bindings/clock/google,gs101-
> > clock.yaml
> > index a8176687bb773ae90800b9c256bcccebfdef2e49..00620ab1872db0489dce182=
3ab500c0062b651f0 100644
> > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -28,6 +28,7 @@ properties:
> >    compatible:
> >      enum:
> >        - google,gs101-cmu-apm
> > +      - google,gs101-cmu-dpu
> >        - google,gs101-cmu-hsi0
> >        - google,gs101-cmu-hsi2
> >        - google,gs101-cmu-misc
> > @@ -82,6 +83,24 @@ allOf:
> >            items:
> >              - const: oscclk
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-cmu-dpu
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (24.576 MHz)
> > +            - description: DPU bus clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: bus
> > +
> >    - if:
> >        properties:
> >          compatible:
> > diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bind=
ings/clock/google,gs101.h
> > index 442f9e9037dc33198a1cee20af62fc70bbd96605..4ee46503663c1f8d9463536=
c347de5d991474145 100644
> > --- a/include/dt-bindings/clock/google,gs101.h
> > +++ b/include/dt-bindings/clock/google,gs101.h
> > @@ -634,4 +634,40 @@
> >  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK              45
> >  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK           46
> >
> > +/* CMU_DPU */
>
> Maybe add this block before hsi0 and after apm to keep alphabetic orderin=
g
> of CMU blocks in this file.

Thanks for the review. Good point, I'll fix that and send a v3.

Peter

