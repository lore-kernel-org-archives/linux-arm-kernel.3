Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B3C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khLP39BEbjSp5OxOSY1cE6o564PDLjgx1FqwEwzCaKo=; b=fKpx/QKvGhW5TW+ZLJoe2RDNZD
	zRycvPTuRRAijm8vv8NhRJ+FvIMW5EQAuSP9yvGL6xoY6j8v3/CTT0ldTAu7R1gxlGOBHHdHgMANC
	ObrFhmmgdWedgwj8E2hMZCxZCnmci/w6TMddfl3ap2a51X31MxiBUeAty3qimhvjmAmuI5BfClELu
	lZADYBi9UX1/r1Md6pec5b4au2rrLsiXVDA1llL0+Ovt+spesNjQNh3No+ifGwhxhbwKhf1iwrHQw
	Qz8cHoih7v42gDsq/PIHTsSCOsuJ9ELkJe7jKito4hOUjzPOfbob0zGVq6hZ4XG/ghV7xM9/Fy7j2
	ai5YG85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8ov-0000000DBcN-1bbD;
	Wed, 30 Apr 2025 14:53:57 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8mw-0000000DBOf-3FpK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 14:51:59 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-476ae781d21so87610461cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746024713; x=1746629513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khLP39BEbjSp5OxOSY1cE6o564PDLjgx1FqwEwzCaKo=;
        b=ZRuUm7hGOpYUJrHYz6cuDDdhhpjKq+B4/VB5d9N8Jlm57G53ZPItRhQExErdHyR5yO
         5LPQumDOqPyar9VcFA+n8y/EDpQ3vy2WwisnCEVZSbWuFaaeT1My/jNsQqlNmAoMXKhS
         ohSWhbPOStzXx//UaSIaiCQjoZTPUD0bBdPjPGMVq0Z2de1wCvmX9KUWeqoSj8lJ6rog
         R6bu6eFgPvgjtWwTdr+gGGr49INsEwusuMURo54SnhKclw9kFhXflnE2L9VoIT70I1U3
         0TBHXDaGV8lb3M0TTiBL1W0zzkzFlW+qATRlfr0A5tl/NLNEEnjh9A9rqpMg86L6sb6W
         O1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746024713; x=1746629513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khLP39BEbjSp5OxOSY1cE6o564PDLjgx1FqwEwzCaKo=;
        b=o9v7M7eoCQp2kvVUjNZ/LP9DFYg1x240N5a1Qj2a3viDl+BvBvvx3WUwMnsidQgKgm
         ZAZdz9tsyASbeVkhIYWfrf6JHghVNPCY/4WmoUvJ/RmzAXZM0Iv/FvA1gQz0kwTSw31z
         IkvKSPhepKZuV5shWgF4EskI0DmqLh8be/9/AkmOb76Yc+ozdAW5jFD0g3BextgO3spF
         mugChvHA7QdpoENumsDVE5+bOZ6p5jRr7hoR3ssWwntjUYoTw6ne6fc9K4ssM0yOgXHK
         V95yLMtslNAPwm23gzZ0/ho8BaDWV0pDdFC3yhDTCW2scr1j+Cj1nRAjvvM4Qy+NnZnI
         xTiA==
X-Forwarded-Encrypted: i=1; AJvYcCV+0a+ubcXm7ye8mTEF07UK6aOnlr2Yt2oWhB710ON+Coo75oSzn9/MM1zn228G9wFJBTTeD2qAr78KO2q9itMe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3b+90NnmYihNxmtOp31U+dhfBoBmmELqLpmeLFQQkq6wi+O6Y
	hfdfgzLCY4AwAby/LykkilfysG3dpBSwqUHwkXvoJXlyDjA82tFd1LbEvK2Ta5vc+bthuXPabCV
	2andIhFRPgdHQpNfdRp+YQPYoPk0=
X-Gm-Gg: ASbGncvkjTP7rAY35YNkllw3X50gX/qDaZjo5lRIMFxf3zDz2oN3kuuGhRFrIRmxnup
	Y+3cdPdhCkJpLFBweRsBlgpSwd/CagSEsIlvYykJW4w06uo0KghsdsjTgH11hc5q8rMU7mxYZo2
	Ex5ja5WxJxw4QFgDVZVkaajsqASG1FrZe+wjx3jSx78hGfMfZodP8Clw==
X-Google-Smtp-Source: AGHT+IEKc/pO4ycFj+V8i2s/1L594kwA2Gdb2sAylgWPbU3n+ww3m+g7WIpxkisXNDK8wuk/OCrcHDMU8zMho4EQ4MI=
X-Received: by 2002:a05:622a:4187:b0:477:6f28:3eb7 with SMTP id
 d75a77b69052e-489e44b5a51mr49674381cf.3.1746024713459; Wed, 30 Apr 2025
 07:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250430-rhine-binding-v2-1-4290156c0f57@gmail.com> <236a2ace-24ca-421f-82e8-a2d3910730c7@kernel.org>
In-Reply-To: <236a2ace-24ca-421f-82e8-a2d3910730c7@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 30 Apr 2025 18:51:43 +0400
X-Gm-Features: ATxdqUHo5BlXS1S6bG3pKo3phkXPn6pPaAqcL5Z1mpGc7fhpdiLuN2IJZZ-TQMg
Message-ID: <CABjd4YzpkJTh2v-EzZemSgK6iwwsJJ=4sxpQ7-0vxeQby=1KaA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: net: via-rhine: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_075154_810819_1FBF8FAF 
X-CRM114-Status: GOOD (  13.28  )
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

On Wed, Apr 30, 2025 at 5:25=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/04/2025 12:42, Alexey Charkov wrote:
> > Rewrite the textual description for the VIA Rhine platform Ethernet
> > controller as YAML schema, and switch the filename to follow the
> > compatible string. These are used in several VIA/WonderMedia SoCs
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Changes in v2:
> > - Dropped the update to MAINTAINERS for now to reduce merge conflicts
> >   across different trees
> > - Split out the Rhine binding separately from the big series affecting
> >   multiple subsystems unnecessarily (thanks Rob)
> > - Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-4-f9a=
f689cdfc2@gmail.com/
> > ---
>
> You should have net-next prefix (see maintainer-netdev).

Duly noted, thank you Krzysztof!

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Alexey

