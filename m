Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE48C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5UG7QxVR++WRdYY+/35YW2yLibbafgum8u029E2OUk=; b=Mwx9XIc1/t3awiDwEZXF6v0RLT
	CM8dWzgK08lyVuelA2/O2uySqSQOJt2cxTZJVLYQzriuXLfCwq3N2V1suA/yJfJ1OHlV6P7eB4jDz
	xGnGN1J6JjzOk7YZALmlkhYsMlpokg/dWJkrFgWszwSiMWN0nApU54eSKgZ/YOAcv5BpqlONG1Oif
	cs0wm5c0JM5Qn1FgJToqKITyduqxzYrFYMoxmLiLmcb3qubYI6F6Qi1w+7MSygG7PRP9FYcU1YXwA
	sY497o82PoiPD8yrzXeYXp0P97H6vO29J7fpI6Sbc/4LcrzUen7sEpWV23IW/4Drds/irzgWtTewf
	3Gy1HXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY77d-0000000CaDL-1tpZ;
	Wed, 15 Jan 2025 17:24:05 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY76L-0000000CZxe-1oCp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:22:46 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5f2ed0b70d6so2726508eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 09:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736961764; x=1737566564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5UG7QxVR++WRdYY+/35YW2yLibbafgum8u029E2OUk=;
        b=ntJjoPEln4BeBy4nCbCfpzVrct790OGLVE3u52XCg0F7N/r5cdjhdAqbeTn+/HRMx5
         zkSsu0YIEx8AGdrvMpgz/KHaBWwZOMaeVFh43u9HDt1r5hmpViQecZGeEU8jeZdoEfvs
         sgeJFtA9KpKDTKXYsWZgH6XQE0zSE6mo/oHJ9YynMk6GF92GDB/fs00449JunyTcEPnN
         ouCfpUnMakrw+mwM6pw+89slVK1ULJiJ1s4G4sbCrc+zv8e68lceP+L6kzEcmRCorzdm
         J0ZeC8RNzOmM2/rCTakMxNwckwchXjQBXSEIemkfaj3uZSW8UoDzITePPHFG7Cv53EkP
         /Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961764; x=1737566564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5UG7QxVR++WRdYY+/35YW2yLibbafgum8u029E2OUk=;
        b=YuYewYjuSZhHvUdRRN5s3/kHVH25lHb2I5qV8bbVSByt1zYNIzjaNfdFnyJBOh52FJ
         ItXEwP+zfuAZCHyOF9yoRvNRl0yYiXM2AaJCFgCrsX/Z6OfF7f2mpEtHxnqdKztnx7tM
         RTseinu6OZDksVNZPUWq+wlItpbNPV3Qx28X9x2V5zVMB6LU7lJbA9CORpQIHzBGtVuf
         lj1nBcm6EC4krm7cLDf3D5jroN109VQP5p2g46+NbcMSVvTFji9Vh3GDxTNd7bvtD1sl
         5zmS+0exuW1a0yXZAE0AuLE8QThgkgIc1bF2SQ7h91hmCbo7TaORkzx7CgaA6etnLRgl
         t9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCX256EN+hSLPFHhyBDjCOx79TPUTBIJ7n+uW1FeqxiPtYSjLTAxkCp/okObfD4hWuslADGHzHCVryWJjZIoe9/9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvvl63cXcnf0gUp2QzIBRUhhg8MZtBIaTEsjs50W1Zy7R4LN4n
	zkIDhVLSl1G538+TIXpwAq+XCFb7dlV6wJjJnF99Drh1MI0zf7QlDe/MADRdoksbliJ7kYeJYp1
	uGGoqIPf/ggeRb5VuGFgoUmYnGR4=
X-Gm-Gg: ASbGncv6I281hNhKRZ4vUkQsK6IqOnCyNIjKTlqzsej5qpF/TLQSYoDap9qABlMvLD8
	2E7bfRhz42kJuNSskTRDgnU3BWwFZbVJpJdp6Ahs=
X-Google-Smtp-Source: AGHT+IHTdiOgOQ8loJ8iUlob993v8iSy5RRS4v9nUw0JLwCAvYfy9EWLVKdFgVIWtMBC+CDkgbJDOHm0KeGaXielf2s=
X-Received: by 2002:a05:6871:d28b:b0:29e:255e:9540 with SMTP id
 586e51a60fabf-2aa069ac21dmr18581926fac.35.1736961763883; Wed, 15 Jan 2025
 09:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
In-Reply-To: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 15 Jan 2025 11:22:32 -0600
X-Gm-Features: AbW1kvYjzVhFBXbtTBnJQ6T6zBUhDMPTiScx8oqCLHH6G7qIWKMnlkm5RSVwuPk
Message-ID: <CABb+yY0+L0c_si3uHcmBQgwN-JWkb6ZzEDN0zk2Y6q1r+xnhEw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] mailbox: add Samsung Exynos driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_092245_468133_EFA62E8B 
X-CRM114-Status: GOOD (  12.42  )
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

On Wed, Jan 15, 2025 at 8:18=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi,
>
> Now that the channel identifiers are passed through 'void *data' in
> send_data(), the clients now depend on the message format introduced in
> include/linux/mailbox/exynos-message.h. If Jassi finds this set fine,
> then he shall provide either an immutable tag so that Krzysztof uses it
> if applying the ACPM interface driver, or to ACK this set and let Krzyszt=
of
> queue it.
>
   v6  =3D>  11 files changed, 366 insertions(+), 2 deletions(-)
   v7  =3D>    6 files changed, 268 insertions(+)

Awesome! we have far fewer changes and no new api added.
I will queue the driver.

Cheers!

