Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF86D66BB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 04:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGMgbMDKyJQFsX2FhhmL+N7rAH4Be2hXmFG8guEZ4I4=; b=Zv2Vrb3y8ccgQ6gKTzKbdUmRas
	Tm5roGDcvRrmhK6oArsefcBgGrXhfH90+vHP1dxw4JMsPZmo0Ig0RbJdjveZibbeiqemel1gBjHZR
	z1CCQLihsgWFnA0UJF0E2KjF+5V9TxMFjvyNiFwje8+4HtOYGVbsjGPCP+dwftFoHxaZeLnl7V0zz
	SkI2Z4p+Qjk54aECU2X8Dq/ftQQ2XMkTibZMimoyZWb3t6mH++GpxIgMsK/C4eJgqTT2rvjwTImxn
	iO2UDhVsaWGvUJErm4LW0L7GA2iL8D8hzqete/4QpUOEsqMYNh0e1dIbiCfbztsNmUO2QfQrKqVZf
	itkv1O7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG9KD-0000000CBdV-05wt;
	Wed, 27 Nov 2024 04:06:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG9JF-0000000CBZ8-1REF;
	Wed, 27 Nov 2024 04:05:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434aafd68e9so1044835e9.0;
        Tue, 26 Nov 2024 20:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732680347; x=1733285147; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGMgbMDKyJQFsX2FhhmL+N7rAH4Be2hXmFG8guEZ4I4=;
        b=HQrjhj6oqnsas5sP/XKJfqMY42Ntp2kg6lewCkbFpUJBcaScKI9N7gsVetJlYsg4xQ
         JhJurNd92aAKQasAsgDwuLmWiFlyIFC2nj1Xk+wh0xb5sTD/6V2+R6LZ53DaATJAmLAy
         Lf0Ys6yiRuBAGVLhmM6+YWXjR/4qfikGLQrUzJCiuRd7d4WB3XtFJtj2hX7i74loIt74
         SjFUkrDWHzzgNq2jJnqXkec9KzXhk0blbANxJQW+j8OsrlUKUUNPSHzqsfl2GXC7ibfk
         otgCPWYwEKSFrMs1EB3ni2evIuHiiEU1dB9xaNNzqxLU4J0bHF218Bt4Tj2wl4+T6t9z
         SpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680347; x=1733285147;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGMgbMDKyJQFsX2FhhmL+N7rAH4Be2hXmFG8guEZ4I4=;
        b=k/dwb3nsX636+t85IvNeX0IAGKIXv0qz96sztCUag6bZ/xosOk77PYuL+ibSsaKUa2
         3lu5MJ5xzYvnU/v2OpmL/9+9f3U0vIzXcbplGrxE4MPZlvw45U0cC39EoE1siFfdLT17
         VRUzVmQz21tk66f1rS4+EV11BLnfowwN5N6bel/rXANyY+AXnONU6WgTmZR8mdsQdxdY
         iMtXkxkupvna3OLVIre3wqoGpJ5RI8d+tWaGXVUawHJgTqNOYQ83oyjrPPaaJvAmirF2
         Aj33LXCquygv+jTAQ+snBJzQ9h5O0VpWgklkXugHEHkMV6ohqmSH49Kv7zpS0zrr5bJW
         HfXg==
X-Forwarded-Encrypted: i=1; AJvYcCUIvXesDbElzYC98qdGgOvpNvewjsi2HwqJuKtDJb8+K5MIxDopsDu2gdFWfGOwsSfyNB6QEvH5Xbx8FE6n@lists.infradead.org, AJvYcCVUpAhA3yFuiHP1P2JmiaR82g+56m4eGS2RUAoFPe6Y+r5if/oG7FJpV1yyLejr53W+IKkIIEcPXRvgYxIvJaAJMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhHl6sbnV8HqTAwSVlEpqwv2OdVOD63k6gpAW/Q3MWdJ020x8x
	9dPAaV3o5ipKjbkf01rbWML4d4JbhKyPNxsITfckD1sPpmoJuLPs
X-Gm-Gg: ASbGncscL5x3hRf9tF7nmS8hAJx84IA1kX9l6y9QbNgGgz/LWdrCPrl4LPY/I4dK+TC
	775Bvk7kscJHNALaG6zXKShJjgTC1Jf5349HGbCabrfBpEgwE6oDk7OICCQ69VMLoBfemlOTQnw
	LVQ/NGTbqjxTAC8XWOQKdWXJnpHcQlGOfWNfLSiwUuqv5bMwG+mkaZrwOSwEer4bhoqd6iRUjiH
	qE5w5/9GU31FlfVr0gRm45vqeg7FVwhE/R62rX1PSHirtvFHXYuTF1in3QMCz2n5ycaECw1
X-Google-Smtp-Source: AGHT+IHc99eGtijXfEAq6+Nq0ctt6V5ES855jF/j39G6AUo9KVVVWLSlAJEn/iJyJYwFhVzX13IpTQ==
X-Received: by 2002:a5d:59a3:0:b0:37c:cc67:8b1f with SMTP id ffacd0b85a97d-385c6ef477amr1008941f8f.48.1732680346883;
        Tue, 26 Nov 2024 20:05:46 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe504sm14932923f8f.25.2024.11.26.20.05.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Nov 2024 20:05:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] WIP: arm64: dts: meson: drop broadcom compatible from
 reference board SDIO nodes
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <027767d4-89e7-4665-b840-294a84a89869@linaro.org>
Date: Wed, 27 Nov 2024 08:05:33 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B479B54-2784-4D75-BEE8-23A52EEFBF17@gmail.com>
References: <20241124083453.900368-1-christianshewitt@gmail.com>
 <027767d4-89e7-4665-b840-294a84a89869@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_200549_401573_79E10D37 
X-CRM114-Status: GOOD (  11.84  )
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

> On 24 Nov 2024, at 8:11=E2=80=AFpm, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 24/11/2024 09:34, Christian Hewitt wrote:
>> Drop the Broadcom compatible and use a generic sdio identifier with =
the Amlogic
>=20
> 1. Heh, what? Why? This is not really explained and does not look
> sensible at all.
> 2. What is "generioc sdio identifier"?
>=20
>> reference boards. This allows a wider range of Android STB devices =
with QCA9377
>> and RTL8189ES/FS chips to have working WiFi when booting from the =
reference dtb
>=20
> Please wrap commit message according to Linux coding style / =
submission
> process (neither too early nor over the limit):
> =
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/sub=
mitting-patches.rst#L597
>=20
>=20
>> files. There is no observed impact on Broadcom devices.
>=20
> So how does it allow wider range of devices to have working wifi?

Sending patches while recovering from a 100km Triathlon last weekend
resulted in some formatting and submission mistakes - sorry for that :(

I=E2=80=99ll send a v2 shortly with reduced subject/line length and a =
better
description of the change and reasoning.

Christian=

