Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A84AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWC8TK/CZLbEW+1tkvwXLeCJBYK6BKk4PiQCgLFscV8=; b=QggtPMKuWSgqzNCULYTP0ZbKpY
	d/00YD84Dq4TZ1G1C7mxYvIsCn1URlaNPi+XMMSs+BVf3HbHzQ714FSMzmElsclCziVu067kgyY6/
	DQAvk4K6Qt865r1tRugTAuABlXMeZK+J7SzpI+Kq234HZ2mvxwouRU1jxPVgBtBqgLi9zF4XdY88C
	rcpKaaW8lzq1RMYZ48CygA/zpvmk+eNBk+iqpdw9Q97tyxMXVL4TVsL7cRP8EA/yQdE1bDUCXgS/h
	bsEGT9Du4O++cb4P1N+SZv+FJyX7T5VPbIe9vhlwf3bZ/5X4gf1eyTJysrFu82nGp9ZKv3+g5STms
	P5sqd5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsy7-0000000GZIX-2upU;
	Wed, 18 Dec 2024 12:15:59 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsx1-0000000GZ5T-3Pq2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:14:52 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3eba0f09c3aso1868392b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524090; x=1735128890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWC8TK/CZLbEW+1tkvwXLeCJBYK6BKk4PiQCgLFscV8=;
        b=ryA8iJ5GOGQQT/KcwjCEt0749Kux3SdzMo1APcCaV9znzLzvcaHtAzZnaVGuGGxKdJ
         yYhtctGHFEAl1T6baUjFfSjqJLC62KTB2fMlOQKAh0mZzTxFXEP8oP9YBBtsNevJZNQf
         Q0dEGs4AcM9wFUFj5Um6YSg6QHqRq7KOOeY2+vaAxVvDNlteEXJ1f9g2fyXT7fVad9vI
         ZCPYWdaC3pjM5GMeLFWvSTmPVqZdj/zupfDlZrMasgiyik/5mbi3VQXv6qILxUto6TxV
         qNyBqL88/HQcZJlhRv/AmLtnEh76/KsrX5ei3K7csFaES1f5ok2j8hd59qRgBj4X+h1P
         Tkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524090; x=1735128890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWC8TK/CZLbEW+1tkvwXLeCJBYK6BKk4PiQCgLFscV8=;
        b=s3BeYLRFV42nWxZZ7hmO2OlZTvIdjpBWlQv2NikvKVIH2+/2jeNaL7rWUttBNI2wHX
         uiKJ8D3msuRYxEoAiim/VETITibSytVOMTbaoB1q+QlDuxwDZnIAm1IOaUmQ3R0XQuXv
         faQED5ySvEa+L/zyLqsRl1UfTNf83BCUbLSgpdLAzwTjbpHU2ppnwyJJ1PcCOODcNtwM
         jM51CAoo6jYjnF/0UDWWQ2TWJTg82zvhO8ITFfomlsSo7nYwzwJhLd00ZYAxAnoWG+e2
         ltcmExgNeuW18SDYAdxZvxkFg/3VgoL6Uo5MQavC2A/IfvSRIR/0OAIm0Q1TcK+/eyfA
         Hynw==
X-Forwarded-Encrypted: i=1; AJvYcCWesJVbZd2zspuV8UCwIdkzyC+PP1Zcw9FpDw/A3JtD/JPMfh6BdncHxKhLoecrpfKyye1GQ4K8z0gECxBt+U4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzsvJViRwtj9YUOr5o+o/jjz/yk7Zu+0bGfSCmzzn9T/BScgPrF
	JFJ3DAovIrHhxRzww3sb97DI/Bv6fSo29weP3SAcu2dw5CWtdrOnDbnL/ZPx1S4ldQyJv1OHUyO
	CUaYB2cGRMsTz5LAhOeZm98+dsZld6lykQlvjsg==
X-Gm-Gg: ASbGncsMHwHufBGjnpIH8a3OzpO1dCrcMBdiqajBTvksSyvnHWX4WnRhQ6Pu+f0M1So
	DdzAy8cbH2lw7bBrKhTstPYhyqqLKHSZb5wV1Uh4=
X-Google-Smtp-Source: AGHT+IFdw7iYmOiyk30Vm81g/2qKdB3Em6Po0+spT5pDn8MU1wacuialp5Zo32J1hgw5gReqkX3215F81udAl9ELCSg=
X-Received: by 2002:a05:6808:4443:b0:3eb:8855:eff7 with SMTP id
 5614622812f47-3eccc093e98mr1458028b6e.27.1734524090549; Wed, 18 Dec 2024
 04:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org> <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 12:14:39 +0000
Message-ID: <CADrjBPqUcsiX5u80ASfWOe17Cwnr6EA0g2bxfgc-e8YpmWkUYg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6
 & 6Pro parts into a .dtsi
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_041451_863241_B0FEA086 
X-CRM114-Status: GOOD (  16.01  )
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

On Mon, 16 Dec 2024 at 13:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> we have to be able to distinguish them properly as we add support for
> more features.
>
> For example, Raven has a larger display. There are other differences,
> like battery design capacity, etc.
>
> Move all the parts that are common for now into a gs101-raviole.dtsi,
> and just leave the display related things in gs101-oriole.dts.
>
> Raviole was chosen as the name because Google uses that when referring
> to the combination of Oriole & Raven, keeping the familiar terminology.

As discussed off list lets not use the "raviole" terminology (as it
precludes Pixel 6a / Bluejay which is also based on gs101). I think
something like gs101-board-common.dtsi would be better.

Additionally I tested this series on a Pixel 6 Oriole device (with the
latest Yocto initramfs) and the frame-buffer was functional.

With the above comments addressed

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

