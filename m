Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796C8D31A3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQwoLslnjX1W0FyM8XHVf4CZqHjqzYWMX1mzng2p1Bk=; b=o8/E1IHtAbpj6+u8mwTLo8Vcdd
	5BKJ7wjDH8IU2LNL1zyoCJ4XYq8WUMUDLtPWvq44J8B9/Ck8HZRKBU3D6+rgM3ntLDylQ+x/XuEgl
	9Htfdd99zDUotWHLh4e5hoISObz8P4U8kEs1x83uLf2GMSOBgVd698Vj+dUmRab192mO+vjzarqQY
	QzBigB8jw3nQMD0tInF9r8HSG3B0P7dIC3sb3UFfaBKoJ7l7HNlWXI21vyo3mqchAKOT6NIj3htrW
	D+SA4McKZISpOvyRS4BYtBzGhko1yN8b/Y2/WBE972KsztMeG6Z/rogPD2kdZSgw+6CWMWS4EOOCH
	aqD/rGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxma-00000008gZD-0AuE;
	Wed, 14 Jan 2026 10:07:20 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxmX-00000008gWH-14y5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:07:18 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2ae53df0be7so14250453eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768385236; x=1768990036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQwoLslnjX1W0FyM8XHVf4CZqHjqzYWMX1mzng2p1Bk=;
        b=NYf/Npg1a42LRfLE3OJ6qs29x+bX3SCD+9FA8yUdfY/p0ciFDG4ZBV4SmUXcIMXzEv
         zmivPSeRBK406Cwi2XQ00Sppw53tIpJbiOoLII0GeNv1sMzbTRpeGzqqGotjn1+yjXGK
         lpG2YB0cpW26g5RZJFKJfsGBhD/e39LojI7b74hX93yZ8mXfX4WpEi7UG0ytL0Z0hiuZ
         Z6K8JBShmYHIUHCPFXyOg8SbeBoRcdcrgC7c8EtR+ujbB4HZL7qGzma7u1CGT4Jq5BUa
         kJ20WtIiG/KFJiFeGb+q6qr2op6p2aXVmlTHNZ6N+xelukdRrtgOam30J/+Tp290vGpR
         iM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385236; x=1768990036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NQwoLslnjX1W0FyM8XHVf4CZqHjqzYWMX1mzng2p1Bk=;
        b=Y6rCx7pJQBKBTe39UQyt8o5vYjDuZjh62dHTaTBuPI7Nlo8GhL5Pis980zDBGsyJTV
         jJxjQ9t5PG3mJbzHuTXB6Wp5Ram/42UES8pnB62Sl6Kp0yyoTY2A9fCBN6BqOkWIFwUs
         Lh07uAz0S3JMM7qRWJrggD91/s4VhrhOkeU7usKn5YT7gftNkWMvEydnNLssUT+Qn0/V
         RXdO8v7WMRFn42GftsX2Z+fA4rt+20frvTRRipb76g2+e8WrtUCpPPL07qMSw025qge/
         We+lt5OI4i6olCHenBJ4pHm9KUk7uMih6o0XovZjK0FcE2PsFjDnaCxnWCPc0uNOqEVb
         w1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR1xIZhxRrSa8Dkhcnylgkbtt3e9SzSOiwXP5mO44b8truJk4IKVF5vxrgjUy6H7V/cifrhYz0GmmH4IWGi1JT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy11Js/AHDnVGNeoJ+3K5xZX+ck31K+q+2mNPpv4it2gYHys/66
	lzyuOXghAQhDWE7NAGOF6/2nuAEdoAeLyVFiyp7wvRTsQE/iFFC2J8lh/dv8cLQdr1cRcLa/qTq
	MEm4FktUb/hX1yg8RU2bjmRdNx1PwRb0=
X-Gm-Gg: AY/fxX5gSWdGCgemcAk86kS2XsQ9xAqdOHGHgPp5KgV4qMg1eATAc7TsN9fCfFNdReA
	b/MgRIaT6PBLN+OCyhCQhxL9X0p3HTrGN+uAl19AyblzG47zUhebT0fn2CYftzOO7NyvV8VAmY6
	iqQGxzgrM6UH5gbxYAQ1ZA5ksex+mja7tQSNIr9ParXmw68Xv3p26lCyRsuQ0sYC5NrbknUfNc8
	M7ZT7JCX714cF6YEbZhtB8HTuje1SGmLjKqY4Z67YQNl2CCQTttgDWvReJtAYRyVsqXHPx0
X-Received: by 2002:a05:7301:6583:b0:2ab:ca55:b763 with SMTP id
 5a478bee46e88-2b48f70baefmr2178644eec.42.1768385236327; Wed, 14 Jan 2026
 02:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20260114062549.68954-1-nick@khadas.com> <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll>
In-Reply-To: <20260114-slick-passionate-mink-216a3a@quoll>
From: Nick Xie <xieqinick@gmail.com>
Date: Wed, 14 Jan 2026 18:07:05 +0800
X-Gm-Features: AZwV_QjSdpwi2V3tZNa-BESE2_IXXSE5rUYX5Df18jOqnSGHXgYKZ2hDVq57tOo
Message-ID: <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, xianwei.zhao@amlogic.com, 
	christianshewitt@gmail.com, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, nick@khadas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020717_294369_F84A76A3 
X-CRM114-Status: GOOD (  18.06  )
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

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=B8=89 16:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jan 14, 2026 at 02:25:48PM +0800, Nick Xie wrote:
> > Add devicetree binding for Khadas VIM1S board based on
> > Amlogic S4 S905Y4 SoC.
> >
> > Signed-off-by: Nick Xie <nick@khadas.com>
>
> You still have the same From/SoB mismatch.

OK,  I will fix it in next version.

>
> > ---
> >  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Docum=
entation/devicetree/bindings/arm/amlogic.yaml
> > index 08d9963fe9259..55663e0f7f915 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > @@ -247,6 +247,12 @@ properties:
> >                - amlogic,aq222
> >            - const: amlogic,s4
> >
> > +      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
> > +        items:
> > +          - enum:
>
> Yopu already have exactly such enum with such description, so your
> compatible goes there. Look - it is called "Boards" - plural.

The exist board aq222 is based on SoC S905X2, but the new board vim1s
is baed on S905Y4,
they are different SoC, so we need to put S905Y4 under S805X2 ?

>
> > +              - khadas,vim1s
> > +          - const: amlogic,s4
>
> Best regards,
> Krzysztof
>

