Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B610CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh30CCw7YMNuF2HgMY+MTEvAKCGP+j5wjDlIx45ktn0=; b=U9ds7d8f/S73m2/tISjTNEEc/N
	8zj1YEra5O4geAiJ0Ys9igf96BMaRV2ZVy6ZN5ONFP182w9k1WCC1ySVr1LSY/d1W2JYnMSHTpQXY
	TllxZBBKCdCN/OD5NUYvAFrs1PMNOfm+zVUQmtlw0KGu8zt7cLrrR3HMLqgRSIhT2HSBwjCQQV6jY
	lAs/slJ2n3b3C9/6xvq+cju8C8rolIKeCSUvXvYfZO40ktmSiK/Hi8Q4Ni8ICulP4nGMJQ1LGFyrn
	OH3RCxtfP1Fyb76Owoth1LLt9rfwynoyCDHi1N39kRuQDadUJ1n4uwDvcfAGMfX1KNsbdKKjtFqp4
	I3GeCZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zng-0000000AXxG-0mCZ;
	Wed, 23 Apr 2025 13:06:04 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YbD-0000000AOMv-2o3p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:49:08 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-47662449055so33752771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745408946; x=1746013746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh30CCw7YMNuF2HgMY+MTEvAKCGP+j5wjDlIx45ktn0=;
        b=InXedMx5wM7iGPOyZ7QBRTk8ChuVExlHonje4v8NGBttjl8UOO+5eDsX1RpGWaIi9i
         PkeWqE+xjP9Gdy2dHxBgYpZKU1gH6TDPaqJPdGRKEvDVNl2cXKyTw2AVRfL3N6jXOu1I
         KGQFDjk9TD2YN8TwxyTKF0wUWz4KRk2jGtVPdudfBAwL0mydvX60a/6+JnjNnQ3nvKHm
         fW42FXbK0xdW5THgu5/M1ymw5Jqn3Ly/ElKoK0BjwZBdvMhcFiV5HKq967KZJDMPxBOd
         dq73e4l/2Xyetqsnl1FXHrmI48Pd5pIs/YCcsqbnzTLN4ad65eoYmxNKB8wNNfUzwm2X
         l3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408946; x=1746013746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mh30CCw7YMNuF2HgMY+MTEvAKCGP+j5wjDlIx45ktn0=;
        b=Wb1JjqXF4/6j/BhACphievdjrvcU4VUNDibL7guD9edqL5H+kAxMxG6MS/3h454mP2
         y+6LADvgC3ebM8/deC1ISO8NV547btamd9aoNSAM1L1c8IqWZqxy5+sRkFYPFpgWf0JA
         wAn945g04RT1MF+uWOwnZc8f66Rtk7a4k6Kf9vKYvHiRIM81tkbwCtwnYjjp2cQU7BaT
         qitsyavChkfxgebUSBWyMBJv6KyPq6fjmUS01ehMP05eSi4uYeIf0kqcLxts193qehpK
         1R6i6Tb5U3AY23822lYNzcIwUOlcznmhrxcVkjckh7/vMHP3ZCCCfK/BpRmTLSOAx04J
         DxIg==
X-Gm-Message-State: AOJu0YwudBVu9FBWyfFbbQifbmXpF/gPbcNNaTpns2l+vlOn1qgQU3uO
	DDkuROXCniLxPOTcrZ3XrJ5BAxBIPHP1J3nQBGscNkhE4z02KE/91Bi2jE/420XH0DHCkYqRvkL
	CVyHYAdbZ7qcrNoDhwlN75WDvf5Xoj6JX9QE=
X-Gm-Gg: ASbGnctVy67Ia3PBvzjrs9gIPjS2dGaek2Ze/EtkAZFISGVhIbGWQQTuNgjAQRwPRwk
	YTh2Nrx3GPr72CPDVzoApB5+R5gbSJ6ACIUH+CHfHdvv2cAJp5qLTnUTVkjKPLDXNa8XBYb6L80
	kY09aQRGDIAssSDqYFaYhI80h8KT/CPMm+AZm4jWo8YPUqbZblyKg=
X-Google-Smtp-Source: AGHT+IHnmHVj6mrD4yULm797iJp2Hge3Q1/IoUPfy4o1SBoGiTD5PJbKw40s+FG3p+g2LQD2zcyNiHAKlhiwni4/o0A=
X-Received: by 2002:ac8:5d09:0:b0:476:8eae:3366 with SMTP id
 d75a77b69052e-47aec409d6cmr327008441cf.30.1745408945916; Wed, 23 Apr 2025
 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com> <20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 15:49:12 +0400
X-Gm-Features: ATxdqUGsZKSYp_qBuVFzW8QPobruMrp4O3AQIQ9bZeUJ2Rcu3zjTKfwK4KpQDLQ
Message-ID: <CABjd4YyXf=dO-GqVJ4sacbdiTTh8uyPUpe4Q68L0tMg4RYyRVQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: net: via-rhine: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_044907_707272_BCF6AA88 
X-CRM114-Status: GOOD (  12.75  )
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

On Wed, Apr 16, 2025 at 12:22=E2=80=AFPM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> Rewrite the textual description for the VIA Rhine platform Ethernet
> controller as YAML schema, and switch the filename to follow the
> compatible string. These are used in several VIA/WonderMedia SoCs
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 ++++++++++++++++=
++++++
>  .../devicetree/bindings/net/via-rhine.txt          | 17 ---------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 42 insertions(+), 17 deletions(-)

Dear all,

There haven't been any review comments on this one. Shall I resubmit
this patch separately from the big series for easier merging (perhaps
also dropping the MAINTAINERS update until later, so as to minimize
conflicts in linux-next)? It doesn't have any external dependencies,
and the binding itself is rather boring/trivial.

Best regards,
Alexey

