Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50900C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTMqa3/iThHUj62i5Lna3n7hgfqWAVpg9kIVXMcn2OA=; b=pIbTgympHYucnJ2vEZjWjXx/hT
	eH8ygwgLMRTkkTF9fRpOjDauKvE16VZCpJKR2AVfRBuwYne2IhZq2s1sfswM6qgdnVZ/FwQB7kBR4
	KdWrgsRCx+vmeML2ffH4VG/rbtbfFFjC7CktOYbXMM797LLujWcwu5h+cCii4k12LwLCFPgHwNQK2
	cnd0vGtNRftFA0aGHINjWn02/2tm82YVBjhfAd0JY9S7oV0Vq2/P+rwrn4JTzNesGQ83rnmHxaM/8
	wON+NEgkMnSLCLM7/Y5gQsL8PPyEzPx+grXWb7k/nTTcgScsYRZVnr7sO47D19Ix+prVseZ6V+POc
	KYpkgz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx00g-00000005FD0-0LVF;
	Tue, 25 Mar 2025 08:51:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzyH-00000005Eqi-24Iz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:49:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2243803b776so32467165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742892556; x=1743497356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTMqa3/iThHUj62i5Lna3n7hgfqWAVpg9kIVXMcn2OA=;
        b=JNcIMvkgFtf0RdiMuLeR2c64aNjylzLn/aTYKpMyGeB4hhizdDLn81nQCNlhgzoJwc
         GvO86tgQUZ8GrThHFZxQVO7YpcGL+ED1HpZIvZ7nIhi4Oq478G0WtVtoNrKDlN9pRVix
         upl7aS4XIkMHC9IonkwvR9b/KYZMcjpqzgxIG+0M66hEn6XcSVeIOwpCDBE/17F/2X+Y
         H9+Nin8SFZc1BpZZ8LQnyC1QZ5QJ5sjIINwypRR060Gnwg1L0kqplgy4sox0ioaiCDYi
         t+z0nL1MXAeGl9w6w7rYOieNWOw9Y9XMw63g+t7CfE0uX7arMyqmhb6cAZjFCBHjbw5U
         FLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742892556; x=1743497356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTMqa3/iThHUj62i5Lna3n7hgfqWAVpg9kIVXMcn2OA=;
        b=gkjnhu+w3qt/9KOuIMCWynRC+ScigdX8tC5aTcXWHBuW3v+O7yA6p9FVko4b4H5I/C
         8D3M9WPeVWe344yHuEp4J0PSyd/PrkH2v72k6TVqyZU+eiVqvftLIPDcKe3DBbPgaieD
         7xkuwDDlfOsg/1iirgDK+3r0DDjVBhFpTSaundK5JIa2h65jeSU81cGYySi4Yh9YbM2d
         va8QzboHtp0BBrt3a5ceUvz/nExzFCctEE4j7DTYrqeAzq+X0mXszH2D9HOqAUmBgggJ
         s4RQg3zouwQawPMRSaFeUz9m/b7y10cRN/YGqwsrYzOw10YNeAO95QLrrj/Qp+Hgt47s
         vKUQ==
X-Gm-Message-State: AOJu0YyrBMt2I6M3Hscx1K5mIc7Fw7m75zrr1L14DLXZ+Fkof2COT7EC
	A/b8DziW9PnMfBREpF1KgAeKHuE5E97ksry5/beFAf3jc9/mXj8OINsG9W1u7aYqfZ+iHdlWeXl
	+1P27jOTnPPPBcq6rD4WAj3aOUcY=
X-Gm-Gg: ASbGncvCOfGu2fXTUT1IdFM5WwSVYRx8rlBHO2vJ/TTOE2JvzU6IGCJi3C6hBykpMtu
	qgVGz+gUAlTKTG5dOUT0xptuLNqiUhB6rG5J2vUyFzGdprx+wjuFYLmP1tooSNeTg0gZruYATYF
	9aas8n+HVqKqaFCBenhiiEloE=
X-Google-Smtp-Source: AGHT+IGdUevWbt9B6OCFjrfKlwOyeQ+1e0MLr3UjHCkhv56/tA48akFvVsynr6iH2spJ/xGrmJk6TrqDw1VcLtJz89Y=
X-Received: by 2002:a17:90b:3d8b:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-3030fe855d1mr26348075a91.7.1742892555925; Tue, 25 Mar 2025
 01:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250324234013.140440-1-marex@denx.de>
In-Reply-To: <20250324234013.140440-1-marex@denx.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Mar 2025 10:50:42 +0200
X-Gm-Features: AQ5f1Jp83_swMO_7jm3Y2fbbueh5o_M1drf9oc9W2FWr-Vtdud0qx3Z5t9ySw6k
Message-ID: <CAEnQRZB068dzjLmeoFdPtcX_Wc_Or0idd_J0OKi-UqgD=Lmcaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin
 Evaluation Kit (EVK)
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <joao.goncalves@toradex.com>, 
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_014917_548100_22D410C5 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue, Mar 25, 2025 at 1:40=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx=
95-evaluation-kit
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

