Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB19CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBeBnLojRUp+3BGjW9hqqMrpXMlk2wEyeaFT1Bjf2RU=; b=x4fkbxYNR+uZZ4HDBOgdL5wt40
	ibvLrTe15MnzLBJsLngSin3WP1f1FVyzzQ0//4KMvLqpSQqgG39rWUjeEyrJGgw6jH52dZRGM4Tkk
	/xk6OgtkTmfgj+QBeM7hwyU49+Z59Oc5vWWhkQXQmNE3eFzzUhFuSvUXWxTaghI6nKsJ3AHG0Cvp0
	VpbyN4zr98FfpC2gjmbp7gO1aQnDg2Kq8i87lo76oyuJHj2R4P7khsfwmPIVy3LaqV3PKGdLahFIB
	VGwpeSbCmnLooOI+DKgfkkLlorRUy2aAlb9Hbwlv8RdHdKFC/dUZM1JVBA10R3mAeSc1gtPUOAnU8
	75nx9+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ku8-0000000Dm4C-3hqj;
	Mon, 13 Oct 2025 15:56:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ku3-0000000Dm14-1s2A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:56:07 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso8430358a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370961; x=1760975761; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YBeBnLojRUp+3BGjW9hqqMrpXMlk2wEyeaFT1Bjf2RU=;
        b=RQYjIkw3xVMkjDVkj92mub5nPkI1SgnWA9l0umHkwevRJkQ7y9eDrrNdNAwOPgTHqh
         cl8AB++Vamf74lGyIfRMOMqijLU7P4nzCXNYUBP9NxcFgJ8f1lwKbrUH4wDWiKQUNYUw
         SQjQHmt9Zw+TiSgeKKBZFp+fs6Zrvf+E6OfF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370961; x=1760975761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBeBnLojRUp+3BGjW9hqqMrpXMlk2wEyeaFT1Bjf2RU=;
        b=C8KYhD8RMqpU9c9rVViTtDCp9hp8zsj6UK0yC47YRr4NRUip36U70hz7RfoVDJO5q3
         7GzcIXJ08CVsQPBs4iNqIu8HYrjb8mi3DueLx2gfJbx/NRFS3mGeN5bXYbU1AQnjnIFN
         4BznfDcT/uuAWNxwm6JByLhnJ9BkgcEC+gV8RPlRoao5Rg8bCCfSCzzFU4GAjcU4xzwK
         klkSYMQQwJnaYzp2lSl1yuPoZBd0QAc9sdlb1sPo8Gr8Y9vAXulLj5xWepg63iOejvPI
         MoMLibg3rrprpMR+h7rEPfCzT2S74obEg1OkBVJ/gL94I9ZOuoRVhH3Xbxt4R3OrE+Ug
         jrdA==
X-Forwarded-Encrypted: i=1; AJvYcCUKE1+UWbR4okV+bi5lhJtffP8mIIgx8TDRlL5rlQUCH+jwxfe6RydKU9Pl6QziD9n/OVHIpC7B6qDStWP4Ii+w@lists.infradead.org
X-Gm-Message-State: AOJu0YwGFDB3eLW27mcCWUtyQ5DIbbvjyfHhKbKvX0KUSge5kLu5RBIZ
	l1qrRlsomUEosNfyIDnw7iy47YbyPye/VmlvcAamMCbZkK9YtA/sLS/8vhrrCK9Exd7YjcvJHxc
	o0yir7r4+
X-Gm-Gg: ASbGncsyg4D1qQlYmbZjSj4SOzn0yCoc4xociaB48seWaTR43wM/i7ZaD7TMUB3B22e
	+wHRPC8HkS0OunrkPFf8lq3ESmfgihj7gL3MqOeP0dpboDf/54qL/KG3jr1nFtV8RzWA2iEKd89
	TvNk2tQLh+qgVvwa8BP+Q5ShKdyHwg88iT4V+o/R9ksRX1o2RdJs7neLs5lpyIvov0BFbLC+2bi
	+9fGd4pTmTgyi559dG4LR1dyxR4PlTIcKohyRRo5WyXAMps0f8sPIclq6NsvmfiGBB2lcP4Wlv8
	MtXAKoJbDyyoyKjM/tKPQKvFdJiWtzLXv6cVYlZUb9dkAaab6w3DSUb1q0p054O//CzpwnRlsYP
	+iRL08nd7omEjolhk4sx0f8Y631Ak/+agkDHO81KLES0ROuQ/RtfzFto3/K6yXkitV7Pp+obM7F
	61Y+9r98+xMe1Jbw==
X-Google-Smtp-Source: AGHT+IFo2V8kA9niIDNUYQWasmLbNB9Fc+MRbirtpckpezESVMpOl3tgF+b0cYShypf6LvVmcoqb8A==
X-Received: by 2002:a17:907:8e07:b0:b3e:c99b:c77f with SMTP id a640c23a62f3a-b4f4310366cmr2608793266b.24.1760370961417;
        Mon, 13 Oct 2025 08:56:01 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f42esm9101358a12.12.2025.10.13.08.56.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:56:01 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-636535e4b1aso8586531a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkK4E6sTm8caGic8EyjnOdybwCcJBdsbM0JQS91rCGOA+8vsRCjjMfAJc8YRH53qKnyZGr7POF8Xkc+vZNPyiJ@lists.infradead.org
X-Received: by 2002:a05:6512:1329:b0:581:bdb8:6df9 with SMTP id
 2adb3069b0e04-5905e1ffebamr6390861e87.10.1760370468172; Mon, 13 Oct 2025
 08:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251013-dts-v1-1-5731ed92684a@chromium.org> <aO0eLbLCGLKf6sF+@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0eLbLCGLKf6sF+@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:47:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCu2hdaO5r8v_GcCksepy58AJFsuLb-xxz3WYOUknvKLwg@mail.gmail.com>
X-Gm-Features: AS18NWCpy9_8RtaLxButea2qoJBXTdgqbhebqmgYPmIE7BU8dSEVQ_qnVy1gyYw
Message-ID: <CANiDSCu2hdaO5r8v_GcCksepy58AJFsuLb-xxz3WYOUknvKLwg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: fsl,imx6q-vdoa: Remove redundant quote
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_085603_521773_A9445433 
X-CRM114-Status: GOOD (  21.59  )
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

Hi Frank

On Mon, 13 Oct 2025 at 17:43, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:52:20PM +0000, Ricardo Ribalda wrote:
> > Latest dts-ci complains about this:
> > ./Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
> >
> > Fix it to make our CI happy.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
>
> Thank you fix it. I have posted at
>
> https://lore.kernel.org/imx/20250925193546.305036-1-Frank.Li@nxp.com/

Sorry, I missed that one :)



>
> Frank
>
> >  Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > index 511ac0d67a7f2360afe22b81d76644575081089b..988a5b3a62bdebeda6b922a986b9ac93d0933e51 100644
> > --- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > @@ -16,7 +16,7 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    const: "fsl,imx6q-vdoa"
> > +    const: fsl,imx6q-vdoa
> >
> >    reg:
> >      maxItems: 1
> >
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251013-dts-83ce7f7b9e54
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >



-- 
Ricardo Ribalda

