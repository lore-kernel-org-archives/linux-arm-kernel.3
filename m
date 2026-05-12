Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F7FCD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5afZUW8VRAgRwwZqxbpryqh9Su0hrtmWrw6tgsZctM=; b=r0T+2hrPzDGDJMcTB5p3ib7JGW
	X7lK7NPwjvakqFx+Tn5z6BG9Gw5B++Db9vSu2NHoDIUD/XAgWLginfD2kBAYEpyGnTyZWo6HjolCY
	lhCtp8nn/p3/fQxKE4cG7/adgilL4rPhLlgAnfm6wL+cfX8n65QN+6sbjD9LRisL8lmqpm9WiUNS5
	K/dAYysRWxaTfXyH3U2nMm2zIJ8/fVmEzPNKZoZN5Ik82pzabPK12z4g7zwA97yvzKqDOI6Pqmt2O
	HKjahM4EIZ0xBQRVTBXdK7sKqKoQmhLakL+AetJqAOQcaBe919DwKrkyreeU6YoA7xAevab0gU1o6
	ECCjm1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdNe-0000000FKH2-2ejb;
	Tue, 12 May 2026 03:01:58 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdNc-0000000FKGO-1FHI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 03:01:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a8891febd2so5908132e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778554914; cv=none;
        d=google.com; s=arc-20240605;
        b=Xjoun2qutYUqpHm3PzKPzh+mwonkrmgPN2XCwD4GBD1oyLxLwC3vF6EqJC8GdM1tCJ
         O1N3hfs4BXya0knLVGe/Pu2+6DOPdNuzmtBPZo7+DZ6+RrHwox/jcK+IhHXmRDVFFh85
         0Bizjfx7trczH6deWJcPahmRmsPmjHCmwaxtpb8uwWdpsF1QkYs8liAKIv8n43/HiVtY
         vwixrqew4aNfNxyjR1q9tZg5rtyNLYeNWyf2sMN6eoKvtwmESb6MVurwe6s/euHuMCpV
         EY+EgMTs5uWUsNgx/LZXKRAtBFqV5mtxDjLn93MWI6AZJ3HX3LInYn//o/WJ9gksoJ2o
         H+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f5afZUW8VRAgRwwZqxbpryqh9Su0hrtmWrw6tgsZctM=;
        fh=KtCVBZEDevTuPUgwV7VTDsgDGfb1eInNBTqb5C8zPgg=;
        b=W01h1JfSRE7cn35BzM0HwGdKe1gKg5uoNY9wC6FnMxW5NhLwpQSvVr3BO6J51c2SlM
         a++Gwal1DwPmXsv+1y3JLa60PmYF3mQxqbe/yyucBOlRo72Ihvgw8ORfNn10NrLtEbl4
         8hIH0zBK+q2tNOQUDf7l52lP+55MT4557hcNS4VgsagT6tvq4Uf+mueW6cJlZQHuTu47
         rJB4bktr5Ax2jt8A2Cx40O3gLYrJoQLdqMHbYTmaeUklG9O4SJY+G9JiqgsVV2vb+Xah
         uDYz8fTWAdZXf6uZpD05cuPzsKraYAs/1ZBi0IfqEZ42OpLT+TeZtLACRQMd/khzcvT7
         dprQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778554914; x=1779159714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5afZUW8VRAgRwwZqxbpryqh9Su0hrtmWrw6tgsZctM=;
        b=eRTLngqoVraMkFKElNkqxjzP1hQqpGZSmCj1CpondcoSvBGRjzGlSW4WDiLBgGLSj8
         KIe8l71nX+1QNimdD5q16t3DYfivburWXaWYyeivbdTg8/DvDHti831Adn2h8Qle7pN9
         0969t7DhDRlYIzsJnC+ZCaeJWdcqAmoxKyX9DU4ksK/bPC6NX4YvJFjOiM5cD2pOl5f0
         6Ybnuz7yMT0ho5pf3TJX2+p71L+7VSLJeRV5Rc4bwaNpksqLqiPRiwik/Zw3TbMNbZSY
         dscdPW1CRJxwIuhXMcxfdq2bFHw9766jrghyaCYFK7PPay0o5G+6+rbgw5wkmLYHjUzg
         4xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554914; x=1779159714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5afZUW8VRAgRwwZqxbpryqh9Su0hrtmWrw6tgsZctM=;
        b=fQdXNOw6rzmbkZ3C5khAQ2PC8kra2/+S0LJYhCyP1dchtZVY/00fIYWRC5ZJu06L5B
         /4zUsnvBTbzi6tIw7p4EQvvlEf6eW6Ubqen+U+jM7n2DkzOADA3J/u+Qf90l/tJckCyI
         0z706MOMukwM2sG1UMOz4faHIyI6P/xV8jp/kuMr+pBEf20feXEcx1zeZB+fUs6s6Jhk
         ijBGhwGKux2b+EjG0N7bq0ykcJJbpIBKm59yFCRF6Il01g2FY+GfKf5oJPHEocdQdOT8
         CLqjKXPEjsM2qL72hDKgSo/2s27CVvLXpoqJPl78TPXaYRcv3UdREv5tVjqNUSwnfQj6
         Tuvg==
X-Forwarded-Encrypted: i=1; AFNElJ+qC1tvHi9dZSprqJM/I1cMrEfuRoPZU1HQH9zsIDmOTyB7Z9j5fRrXZQwjcN/s9pSGEjKYJQV9q6E0pOrar7r7@lists.infradead.org
X-Gm-Message-State: AOJu0YxbX6OBml9Z5lI6Eac2WX875JxDYPTdEjN3V7stJrigYxGq7KQW
	QdW41aRiGVj8CLkU2/BuhFWwQuRnbM2UaPAYUxZcoNRMZnLg5yF7bd2iuEuQ26A8R9eFosy7VuV
	fo23lOCN1VWCkaTrFB2ho14+dS776sfk=
X-Gm-Gg: Acq92OEOBp2UkfBux236pOHu4JPuarCybgtNS31g5MG52yqzR+BkrE7MuJE28tczRAu
	1pUptJowvv2AeAguzG/y5A/r7Aqxlcen1DcE0Z6ggd7nnyXM5MWfUkIVRfOUHyvwHCJaHuxHHh7
	an+3xhzBzKsagpvZCUfxf0hX3gxqZwYEUt0Hw5uykrLE5v95kh6WJQuD1vKreDzTugc7PVufJ9/
	pzBk1iniIi5W2iD8TpTuQYRd6qewc04XthDjlyXmMdHaSeu5bkFFN5YP38JkNQHSxRiOF0eBxOJ
	X2c6o5Qbuz5oT0X9Zia+wh+DtFF5iwPIAaqya4rJcjYsKvhlFuPxEKrbw6F8ey6Td1/KBcvPsuy
	jwGSVKJI=
X-Received: by 2002:a05:6512:3d04:b0:5a8:2b1a:26f5 with SMTP id
 2adb3069b0e04-5a8e31f5a98mr270389e87.39.1778554913320; Mon, 11 May 2026
 20:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260512024850.904551-1-alice.guo@oss.nxp.com>
In-Reply-To: <20260512024850.904551-1-alice.guo@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 00:01:42 -0300
X-Gm-Features: AVHnY4JM8xWYId7_GEwqhTuQbzqK_Z2r74tfHHyGe9m6Ozr37EBkt-UJHpZx-e8
Message-ID: <CAOMZO5AzNnpL2bCf3h-4Q+sp6Y7aPgGJoGC6_xLaN4dOOZdUKw@mail.gmail.com>
Subject: Re: [PATCH v1] arm: dts: imx: Add watchdog support for early boot stages
To: alice.guo@oss.nxp.com
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_200156_354045_66F882D5 
X-CRM114-Status: GOOD (  10.24  )
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

On Mon, May 11, 2026 at 11:46=E2=80=AFPM <alice.guo@oss.nxp.com> wrote:

> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -325,6 +325,17 @@ smc1: clock-controller@40410000 {
>                         clock-names =3D "divcore", "hsrun_divcore";
>                 };
>
> +               wdog2: watchdog@40430000 {
> +                       compatible =3D "fsl,imx7ulp-wdt";
> +                       reg =3D <0x40430000 0x10000>;
> +                       interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +                       assigned-clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +                       assigned-clock-parents =3D <&scg1 IMX7ULP_CLK_FIR=
C_BUS_CLK>;
> +                       timeout-sec =3D <40>;
> +                       status =3D "disabled";

You missed passing bootph-all here.

Adding wdog2 would probably make more sense on a separate patch.

