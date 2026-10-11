Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F460CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzyYwwdi+Gw4Br7ibuX1uhAgZ649p+E+2HalXmhinyI=; b=km2KyaztcLSnsX
	k6KNMBYktPXnXySKzHBeo9ZI6WiD5ML2CelsDmvP6gRXV2YVpy9u8IsyDZzgCJUmilrSeDjxOh/DY
	Atl6d0mthRHZTpr2JxqQ0fdCPRKxHBLyTmNCUr+bdsCHjcnTpwc8K+YQ2o9CZXRbyhgQsSYxireRU
	vJYNIt6MefQB/6QAywwH+B21XDU3KI5QZvXgrqdMRCsdHrozVf5p962/dBTgSmWTI2gRtJtD5nOoC
	Wg1WI51STU4nretZX35eHbO6scqnJT1zcJJqJxYmd53QscTb8U4O9eWrnfrj2cLPEVlFQIXm65/K5
	JEU+f4PY+rWtqyul2Xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuQx-0000000974D-3JV3;
	Sun, 11 Oct 2026 14:21:52 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuQu-0000000972x-0oge
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 14:21:50 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-888cbacf70eso12515597b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 07:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728507; x=1792333307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzyYwwdi+Gw4Br7ibuX1uhAgZ649p+E+2HalXmhinyI=;
        b=dQef5uErEALvTF5QRrGgCxQmTFgB/akKdFhobxQ2D0ryFVRkUIhcfA57aW22lu1IEk
         D/phPLaW500DfJzy+mfCMZNj8KaWNMcYWj8q+/eU7nY6BFrxxL/aVtQzJGXr1NxHANlf
         bmPHWPFgr07KOq4YVkCEHPJTNeb9iXnEriZ+auXPFLij39KFpTqlKj3o0hTDRPxgr2w1
         SDBH4QQLRxBWOVf1S8dNXIiS5qv06bjWYrSOrCshydJv5eGMPsAnsC+e7TTJqFWwth66
         AkCqo6Ate91UzO+tS84Np5Co+5R41OERCqhuZ97CFftVoa78d614j1xJAePqIBbdDQmd
         B16g==
X-Forwarded-Encrypted: i=1; AKwUvBx1gjaavqlAgKkdOraCklC+flsJvrATdLND30qQe4F7B0GxIaTPjrdFY0hhzCtl673fdgHl+nNcwbh7isJqwtBk@lists.infradead.org
X-Gm-Message-State: AFq9FYJyyijx2Jdab0FD2RCjn+RkX4zLkf9VJvYldyPIniyjoP3sN8dF
	LKyHREKa/YpZ0+HjeiTHh2frKblPJC2nSngYYNyvtJ7FSJqkV7GVxrNOhGVSHbR61T0=
X-Gm-Gg: AYBFou12HwEIfiK04BbGfA2t+krdGDkoT4waCabvk4uPYQG4uNKN+j4Zlt6qaVkgqcM
	bDMOoD/05+2aFef0l602d05s2G5kf25J0/+DN0NBxIQhxnxLm7qDqQDdNexJzI1W7BRzyLF134P
	sAuNSFTE4gPIwqRmXC9aCsDMNycXv9GtxPR2+fpFlyUhEwzLGhAXzqWwFpduw4bXPWycPoGg7HL
	v07igHOljmvznQa8rpaM1F1ApOL4cljJWg6/PjAXqQi0IY3aQtSDIAB7RqcgwxtdSvncKdyH4Yj
	8ETEguFLQGUyVxYLUj7Ay9GV37czflj8MmCSi3JWjH2xQ4wczJaOTj1RO4fu3/VZ1NbX7gAuJ2r
	ZEYG/dTSOXlywVoPVg1nHkRskgyo83kirrX7OUf5GPC6myBhWzY9kSKs8thqqWuduFoe/Fyu3dp
	OSvV2TpoJSLqB7Jj5voqHkivRlCP21Rcs5TXSIY487p9UuZe8iM/Odt6xznE5I5B8gRatQ3mS0l
	wbZQZgn5Sc0mSVejrzguqsFsKryU9Ni/OYSRnOyeVGq/xYwN1kdcCFd9B95Qpz/1/U=
X-Received: by 2002:a05:690c:60c1:b0:883:2240:7df1 with SMTP id 00721157ae682-8b07ee2f4a0mr21775927b3.48.1791728507021;
        Sun, 11 Oct 2026 07:21:47 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1ef106sm25900117b3.22.2026.10.11.07.21.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:21:45 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ae8607e8afso6206167b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 07:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzTgtU4Fyh0UcU/PvzilnWpChYF4ofdJcRTcHcdqEAH/+Px5kvC3hLdorAgAoMzokegbsEpXcCAj8TTIdL8Ub6@lists.infradead.org
X-Received: by 2002:a05:690c:309:b0:8b0:9e1c:3148 with SMTP id
 00721157ae682-8b09e1c33cfmr4413327b3.34.1791728503965; Sun, 11 Oct 2026
 07:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
 <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
In-Reply-To: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:21:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
X-Gm-Features: AclHuK90wt6EVCYdNEmq2Fhuw7FDmVki8iPk3nLcnG5vHPlk0pxu17yKPiCVT8U
Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_072148_230554_06A79927 
X-CRM114-Status: GOOD (  14.51  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Oct 10, 2026 at 11:14=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas,
>
> On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +        # The TX delay is a quarter of the RGMII clock period per step=
,
> > +        # which is 2ns at 1Gbit/s.
> > +        tx-internal-delay-ps:
> > +          enum: [0, 2000, 4000, 6000]
> > +          default: 0
> Is 0 a valid value? Let's say we have:
>     phy-mode =3D "rgmii-id";
>     tx-internal-delay-ps =3D <0>
>     rx-internal-delay-ps =3D <0>;
> According to patch 8 this means: MAC is responsible for adding the
> delays - but it doesn't add any delays.
> I'm not sure if this patch (removing 0 from the enum) or patch 8 need upd=
ating.
Yes, you are right. I will remove 0 as a valid value in v4.

Thanks
Lucas
>
>
> Best regards,
> Martin

