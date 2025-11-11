Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3616CCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv5b/xw8gYFcuSk4kaCj42BkeJNohwR9re6S4f8Ipq0=; b=B/z+Yd6oain4pL8L+O7xIA8ag1
	LdEH3s8YIrqpL7WKI2Un9lIOYd/fhTdQoM3Ql5FBqjN0s+K2irjibQ7Rk//xlrYx+dumfBnVreI77
	UBAHlNoZhZle7xRiAT//izoEKEmbqHHoOxrKtNDo9JPoek5n/U/90XKsyFJl9Q55wMgo+GnfedCLf
	ZHAHwWiYD+7wDYwNuFfm9BB0kRnFnVl4sHBifVs8rJhPMewi3ga5YlIO3p/DDe02A1AJzzb4SSNoA
	G1btj+gVdmZsPT+UKLh8054H9wVpHknkQFdGb6C8lDy8op6ej4pAgTkZC+ym3SUdkvPJeeBa5YHNI
	A7wEOh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImtl-000000077DA-0tbi;
	Tue, 11 Nov 2025 11:50:57 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImth-000000077Bs-300p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:50:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5943b62c47dso3685144e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762861851; x=1763466651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv5b/xw8gYFcuSk4kaCj42BkeJNohwR9re6S4f8Ipq0=;
        b=Fd01eox5Qp7aJ70UyVW/s3mBP49RONBkUgYioCjD+ub44mkm2OXFocENgvbHGdGsOl
         SAkF/vHDjwaTDg8eprJU4gHec4+pMaxoYA0e+152DU+s8c4iPXwKes4Gj0spIKPLJOQ2
         pV+yZ/JYw9MF1BvI74jwzbfC+HwC9KfYJB+k00LCugB6RUGhfWe1Q/N+jPLcQiw/6aFY
         6K809PQKiWnmSRoIoGZ/jE/Eh92CoC+IiiVVnYEAjzo53nteiPyvtvvv0eVYCWktB/1P
         t3vNXXOBo3K1p4j2tg6eId4z7AiCu8Q8cbqcVsJyyzy2jZayVNEUPTHCMFuLN2lRrmYJ
         X8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861851; x=1763466651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mv5b/xw8gYFcuSk4kaCj42BkeJNohwR9re6S4f8Ipq0=;
        b=bN4HOUcNqwneUNsUuVCyZrH+X+PD38/t3eDQLtRqYpNrwj6p4LWZhwD7OiGswN10q0
         /aEmHnUGDfS9EytDzc1z+WX/S3bu4lmu/FTmpD11M/OkwX2sNwXRX7YfwdiVYAf885+b
         NSTrUjC+1p6q9311u0RvehZCfX+1oKr88kVzhnY52k2gO3kxdPIkyJbVY83gTbacxslg
         Adnj0RkHcklxN+kdd7g3fzMtlV3iuaNvtZcuK8ydESmMiP71VmSg9bmWqBtlit4Q3xGm
         +ZZfFLsWz1ZTHewVX5Y4RPLCrr5EnbjnDWJEPcyXbpFCTZUSt7UbDbzjc321qhKvGC42
         Ynew==
X-Forwarded-Encrypted: i=1; AJvYcCUDuffkyXpJuOlwvOK4rOlDUaZj1I39pzVWw5Hj4X+Uh7fRXxRVn1oeYYqi1SDj/J+3JYOuglbQSbsLB21Nq4yJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc6DtlE9IET0MY+64sScNvck5aTyv3GCx6x79KBQwlCEUB4DJK
	X6EYUxz4pk9BMTH83liJLYjQ6XvRvJLGjEvzvQWh0aKIpH6s3Er97hSvlKTz/dkXoAzepXtBTff
	qXYdv3fjka7S8AbFJs64766lhufI082k=
X-Gm-Gg: ASbGncsMUOZehiy2tpsSFL/HeIkzEayoXQltI+QUghLb7onwzjw4yov0BHpTrtrGuQQ
	NUYvZhdl1wqzC3YpCfcdqIugyVnxocaGzAUsY7UBVIrhRC5F6f8n5CnjRaK7RohmdU7hdKjPFUV
	rPzE46G4YWpR/uP0o3wcTpJCCn4yNuq6ZD+TbHo4y7EO5kq8ECxRXRz35tZA/BVwV7N6DR3EU/E
	IajZy6COy5BYLyEQtHGjdvvFJ6AuR0kMTXBUR1A4LOB7E1lMdZPebloJiqgX6I8h4/tB84+DiHG
	EG72hqfqq3ykdMlC
X-Google-Smtp-Source: AGHT+IF88z5at8UsnN1rJmg2IhGaaNFuSng3Rlf9evtFG8rtfKiEGAp8AmRAUYBfUbuGiUayIKhWFzPcbtLj8c4U6/A=
X-Received: by 2002:a05:6512:3b06:b0:594:4e03:2be2 with SMTP id
 2adb3069b0e04-5945f19c023mr3782490e87.14.1762861851172; Tue, 11 Nov 2025
 03:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
In-Reply-To: <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 11 Nov 2025 08:50:39 -0300
X-Gm-Features: AWmQ_blgZMv3waf3DojzBGgJUKYe7alAx5RXa_SxBDQp7LxHHOXCa8N82h9a1G8
Message-ID: <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_035054_726986_6DEFF68C 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Daniel,

On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:

> In addition to that, Rogerio please read:
>
> https://docs.kernel.org/process/submitting-patches.html
>
> At this moment I think you should keep the original author of the
> patch.

Right, but NXP makes a total mess with authorship.

Please see this version from February that states the original author
as Xiaofeng Wei <xiaofeng.wei@nxp.com>:

https://github.com/nxp-imx-support/meta-imx-frdm/blob/lf-6.6.36-2.1.0/meta-=
imx-bsp/recipes-kernel/linux/linux-imx/0023-arm64-dts-Add-i.MX8MP-FRDM-boar=
d-support.patch

Then this one from July states the original author as Joseph Guo
<qijian.guo@nxp.com> and it also has:

Signed-off-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>

https://github.com/nxp-imx/linux-imx/commit/fd8010b46bb00344fa519c73b643fad=
71da5887b

How are we supposed to know the correct authorship tags from the NXP
commit, then?

> Then mark your contribution as follows. If you just picked the patches
> tested them and made minor modifictions only add your S-o-b
>
> e.g
>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
>
> If you made significant changes add your C-d-b like this:
>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Co-developed-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

Rogerio's changes are significant as the dt-schema passes now.

The NXP commit has all the dt-schema warnings found in downstream BSPs.

For example, it makes the old mistake of describing:

 spidev1: spi@0 {
   reg =3D <0>;
    compatible =3D "lwn,bk4";
    spi-max-frequency =3D <1000000>;
 };

Which is totally wrong.

