Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC377CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FangEPCYJ/rRCDDLMOYHEdKjmgCazFk4RNT28+XjQGE=; b=sjjfFgVNnN8fd6BVn85cuPess6
	0zuhklupkc6t4sY1k5ItPuUpt8ZpDkt3a7gPXMgO3XChVjQEJrxHvCpdbGKBRFAQ9PIFoT7SUvDPw
	mx0hs6w++1bM81OvUZNYQzRTH4OvDIHWrtUixiuPpa4XU8AcOTnBjKZbxwmEMvA/rBmhym2OQ4Hbh
	HuYGgvBWY6t7bNKLuo+FMENASdVhDOAl/QF8KQO4BppwBBbnT7bLmfxxATFTH/ado194YEloVCkG4
	JSg6ExhKNUyOMCDdcYClyJq9B4JCCDCE81nnLREf1RQwTemxIjcySKsOgM2ffccbDuH7vKPHvk2x8
	/f9HeeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGof-0000000024w-0zcO;
	Tue, 18 Nov 2025 08:11:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGoc-0000000024T-46HW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:11:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b736ffc531fso643271966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763453513; x=1764058313; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FangEPCYJ/rRCDDLMOYHEdKjmgCazFk4RNT28+XjQGE=;
        b=SDEoIHsn0OqdFK+xREcJlyo35FvyKpABzHbnK3X2Fk8hKlw3HozrVimlRJhOVoilDW
         suIZc5Eb/PdgPmxfC1lEaYQjfHTUocfh2to7WsSntr4rnyKjv33VYnfp/yPjXY6avTtl
         pskRi+cMUUN8955FFd9xUyvCaIAKoo+aJm8Woys5xk4k2ZOEsDArgH3iWkouHl9TDC6r
         ZlfSw/juja92cSF9WsFivXdaRePtvbTARZ/8ayYFrL/GMKZD120jgLQVZsJBBz/8j7H5
         pgnSmJMeHRfqKHPMHOYzryeK4/Zx6FqiDe5O5qwFSzc4jjhmCMQv3kaECaq+u04yyYCP
         6YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763453513; x=1764058313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FangEPCYJ/rRCDDLMOYHEdKjmgCazFk4RNT28+XjQGE=;
        b=RghEY6sQEiyRGx7tefXs+GjlvX+4SPxQQMHEA3OpIRTIsHRH0WaK3ZzPOKzoYvI8A6
         UgyC6rR2fGzeYf7n8R7uQRG2SLIT5AZeFbORBko1zkvKATfJVh937JB/aA4ECeCD+ZCX
         Q8zH0m1sCdCx46ngfLGLmvgZMoMrxxtMLXtk4efvohSgrqshsKMVzJToMGrNK5zI0F3p
         H0UAD0zaWSrms5S7J+ufBqSTaLNuT9egHZ9j4/sruIUTddxrw5xK6h792iXcGT6tA1Eb
         Ce2VHEx/uz9qCOh7qtAd8EBCQruC5VEHGf28UPIqGQHnAA5mBJpzNLjiSMvvuPklD/C1
         bLTA==
X-Forwarded-Encrypted: i=1; AJvYcCV5o0/gJ+cAiHkDoFB6z2dkctBTyiUZJC6ycJlk03tD5XdrNKOsqGBriKyd9dVJpvFJbZJCRovcLN2iReTuGxfl@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ/CHfrOgI3bi+u/8LN0FHUCUwCuBuyNI4ex11q1Amvj/ht+nR
	STjooHeFAIu0nVuliH/3tZk+ZrmblDaRyrHwXyaN0YRBTw87N6cR9oZJuvH9nIDWVWKFvg5kpk6
	NamXrCUcmaHJlC1YEmXtAU4Hk7vTbBmg=
X-Gm-Gg: ASbGnctkMMENoosQU8KHrjCd/UjEk6BB7hpi2A7m/LkQC9N7VvXad3Gzoyu3wUGAwGj
	9MPLMphTlrGSJ0GE1r52eeyMKK6/M8wlw0XkJtElaBQBpqa5Ogr28gNXrRDVNARGC6DNy//9ygK
	TjtMSUFfDjVBtcmGPXjsaQdLmWscKruopL/t8lOVYFCj5wYnuxZqegQ5UKuyopdYFqtviY0e+Zk
	X10y8GI2+fvVVuIna7qJGJkyIwYmxQ6gXh1HPH3P56Q4e037JqLkeSsHAW7dyf1swKFAtSg
X-Google-Smtp-Source: AGHT+IEHcPR+OwRwsqJJ0/uai7T9Z5bK+GvtX4wZ68Jnfq3MM6pnPM1BSU0qX5Ee3pQ1MpaQJy38JCaslU+Q+taVZiE=
X-Received: by 2002:a17:906:fe07:b0:b73:870f:fa2b with SMTP id
 a640c23a62f3a-b73870ffaf8mr1152686566b.27.1763453513074; Tue, 18 Nov 2025
 00:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20251112211248.3711889-1-sjg168@gmail.com> <20251118041058.1342672-1-sjg168@gmail.com>
 <20251118041058.1342672-2-sjg168@gmail.com> <c061ee38-5026-497d-b757-b0b9db2e6729@kernel.org>
In-Reply-To: <c061ee38-5026-497d-b757-b0b9db2e6729@kernel.org>
From: Peter Shen <sjg168@gmail.com>
Date: Tue, 18 Nov 2025 03:11:41 -0500
X-Gm-Features: AWmQ_blpk2ySgsdJXTAlDZEU8KUMAaf5aD3b5YcZV7RoXMMcHgsFu67psNDCtEU
Message-ID: <CAJTz7Jd_fuTXpsseEE_161a7nLgoh4g9nH7M__HTsGihqNLQWA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add compatible for
 Facebook Anacapa BMC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	peter.shen@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_001155_061493_BBF50A91 
X-CRM114-Status: GOOD (  17.88  )
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

Hi Krzysztof,

Thanks for your detailed explanation. I apologize for ignoring it earlier.
I now understand the importance of Acked-by/Reviewed-by/Tested-by tags, and=
 of
not attaching patchsets to unrelated threads.

I will follow the proper process from now on, and also fix my local b4
environment so that generating the correct trailers works smoothly.

Best regards,
Peter

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=8818=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:21=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 18/11/2025 05:10, Peter Shen wrote:
> > This patch adds the compatible string for the Facebook Anacapa BMC
> > which uses an Aspeed AST2600 SoC. This is required before adding
> > the board's device tree source file.
> >
> > Signed-off-by: Peter Shen <sjg168@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
>
>
> So you just ignored everything I wrote? Long explanation and you just
> don't care?
>
> If so, then:
>
> NAK,
>
> Also, do not attach (thread) your patchsets to some other threads
> (unrelated or older versions). This buries them deep in the mailbox and
> might interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
> Best regards,
> Krzysztof

