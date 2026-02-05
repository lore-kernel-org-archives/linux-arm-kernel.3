Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1C6EC1E86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g/5cSIXjGo3ImCL2VsizCAIdAMiuL2cAntOyKg+ot4=; b=lbyMCXhJJ3PnOEoUZjGDGvjGzH
	cpR2ZPTW6P64Lu6DM6pPKdrh0GaBxukzE0O1FF8szo2DU9nj0xr5gl3+k/+2/yzZFm8VARdOdbjQf
	Ly/9b+5g7F5MSR74Lg5v37G34FixM/12DUuEOcjI+yAIAkMXmrDKH4VfrfFDfmkSn9dpUYQqbQREm
	VieTIUg6iv5fDL5XUweGXF162/jaQo4CbzZv8gFj4Z8WsqRWX0mzR8vMBaOJW3tRz8yjR+X5pOoRh
	GYrmuNca9vU20e1O1JQuevRxtFS8VcN6TBMQXDmpg94xtrnXo3woWHuQOU1sf3cYcsXEozN3rDY71
	EJtuNLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwLN-00000009lHn-0Siw;
	Thu, 05 Feb 2026 10:12:13 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwLL-00000009lHQ-0rpW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:12:12 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1233c155a42so1031313c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 02:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770286330; cv=none;
        d=google.com; s=arc-20240605;
        b=ECBXn5x4Q36ixMKr8ysdG6rWViA9lihyuDi2Rx8LZiaNDq9nY/ncjVnf821d+BgapJ
         o4zmaKzjhxzHxK8wbaa8cRtEABDmsAfl0DgbokVVGN1chURgO07fUxLqzH2vsddw7Uwm
         V9HeeNPl/EuNIn+4AXSQT4XN7YdaI73Y8yLFid5kN8GD4SKeZ0ZYdCb2U0j2oyeQh3oU
         vezd+o4gYHG3jCDiJ43NAaMQZ/Agwv0rFJTqfZkTiOWrIGTAzx1I2WYULsVGrVYhUmmZ
         S6gtIxAmvt6YRD6W8XaoX1yh9368bhGbgp8UKHveBZ+gcp2Dkq8M1QdIfGzF3QbakU71
         jzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0g/5cSIXjGo3ImCL2VsizCAIdAMiuL2cAntOyKg+ot4=;
        fh=x2EaeRyAb17II+44DEoXz7GU4REa6ZcBEYsylAto9Mc=;
        b=F3KP2t0D9HRHC9uJNreQeMhSiJ8ruOP7hPlZTb9gP1YBB2YL2HbqdNLxgjp3CrKdT5
         tyttg8z/7A2syDjcZJVb2PL3jL9Vfuu2jw+EbLfTvgiG2hMnYd8hstLVRxr8U8tHKJFC
         1kyc+X9PfSlFySDId/PMSgB2xxpepISrJyeAmM19IW3i2CBpgVlWEE+k+N7AucQRutjp
         MtyaKpXyflmVbihWmnZEUxLNghZKWMt/Tgl4eRJcfJzH2w0fpTbEKFisEw2xk62wp+76
         CY8+bHgMAuAkf0P/xej2w5FvTrrXevON+hPi6JbFhClHsKm1ZgYx+a9KleSjS0MGdIHs
         YXvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770286330; x=1770891130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g/5cSIXjGo3ImCL2VsizCAIdAMiuL2cAntOyKg+ot4=;
        b=OQzwRXKndFxJW7Ign0XMbTuIhmRBqJ8SaruB7XQSg5Fw12eh5g1Tov59bRiDEShrLn
         VyOjvS0WVqZejCKzto0bfQLNe0ANE6ydsVILb08pnOG48AWSsxI65THfqHvMjlfH5QL9
         IlcCgWzwpTasZvnmrfy2hFiDvgX08tl7tiTAxsD8IbBr6pkv2Ov5+61hLVc1AShrGk5a
         ZpZUX21vZRE1NChRmWh/uc/e99nYzdTXvbUVGGTW6vC+6pmo5OY0I+n7/hdMW5mJ1v9i
         TdGH8JZzMn9Iutzq4bsKAjg8Qb72jhRWeCQ/658mP0ZZXS0BQXWljgka8jXSqe7PZt+a
         3GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770286330; x=1770891130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0g/5cSIXjGo3ImCL2VsizCAIdAMiuL2cAntOyKg+ot4=;
        b=GKnFEDWCWWnhupXLi2rbj+e9FbC2jHujn9iHCV9w/bItXjltjPXv+yCRKAYKHXw+6C
         vB4I1RW9AJBk4nnByy9/QATYx5sydmFd5abROfJlENEKUSKmyMdyKNzqQzKn5pyRioYZ
         fgnFN7zwZ0wxHR8TXnPmbrxwnVe79BmR3x1j+0XD5Pcczs6Df/HtVoCONLvsOMC+udVj
         kn3sBUyvkO/hNJG0sLDhIM16L+WBebG7PbPgpWY0TYhit2a05IydHK6u2LlpoTCoMB+s
         IqplmlTZa9dguOxqHas+OgLd+gB+R41Lp9kcYbR53KIdoTmn94aumPJeo5fR9UQSaVoe
         Q6AA==
X-Forwarded-Encrypted: i=1; AJvYcCW0i0U+SOTePEJ69RDJYKGq3oys1VibVBLuLM/cgw/0AahpgB8Wgyoh9wlxMB6CAOVpyHmJ+CRguuQmb1FhVWO/@lists.infradead.org
X-Gm-Message-State: AOJu0YzWWiXft/cVAQqwQtVNspFM0o+1KANEv9oFwOUei192m0pIZHwo
	h1SBFeaSgFhLWzR/+E+IgdBHNNDWUlc2RuRf20ZAHk1d+ctfNUZUcJZBfrTJ4c54Aviwe9Xw7nQ
	dmvNexZFyTzHREAZDGslFEKckwHaoQqW4jQ==
X-Gm-Gg: AZuq6aIxZLiQ/KH0kt509I0qRXP5BMpJ/kOOp2GGDs5lAu4rzYXs1nQ/wYFqDUhjsVk
	J5wTCfCmMkOn/ZyN+sC0NzPSGmYcrTpjT1l+U0c00yJAHLXCbUB3I0dgSR3y8v0B/P0MrmTrd/I
	FNYYAmV/7bwC0fN+ZoZiJIlbW6qMRpVV4fccQy5ai4rFOvSVOwj3Nd1cIXSFRqcQi34VUhvJ22H
	qG34mVadzA+w6dhUVKjZuap4oV+EWM0GCqzcVCJ/162ZafLTOFh9tr1vUmtuFRSfZwuanIArWgM
	YwPm8JzdAcKQdz3OCRGTyc0KbFmQRVXd8HpNXmGJpDf7QALP2ijto0ijpDjRHyYq7hT+aA9oH4Z
	i0GHUghrFxQ==
X-Received: by 2002:a05:7022:43a6:b0:11b:2138:4758 with SMTP id
 a92af1059eb24-126f479a420mr3236887c88.21.1770286329645; Thu, 05 Feb 2026
 02:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20260205100125.9095-1-stefano.r@variscite.com>
In-Reply-To: <20260205100125.9095-1-stefano.r@variscite.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Feb 2026 12:14:54 +0200
X-Gm-Features: AZwV_QjJxBdSpSEqOMEqS_vmPt7Et7QepYBy906r-rPjo4KFoR-K-6KfSW1grbY
Message-ID: <CAEnQRZDVsv8_uH5B6k-RsrQmSszGQ8OCJT=2a9AqNCq+TzP1kQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	festevam@gmail.com, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_021211_270862_3D194ADB 
X-CRM114-Status: GOOD (  18.01  )
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

On Thu, Feb 5, 2026 at 12:03=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> This patch series adds support for the Variscite DART-MX91 system on
> module and the Sonata carrier board.
>
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
>
> The implementation follows the standard SOM + carrier board pattern
> where the SOM dtsi contains only peripherals mounted on the module,
> while carrier-specific interfaces are enabled in the board dts.
>
> Stefano Radaelli (3):
>   dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
>   arm64: dts: freescale: Add support for Variscite DART-MX91
>   arm64: dts: imx91-var-dart: Add support for Variscite Sonata board
>
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
>  .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
>  4 files changed, 973 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.d=
ts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi

LGTM for entire series:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

For next series please add a changelog for each new version added so
that reviewers
can easily follow what have changed since previous version.

