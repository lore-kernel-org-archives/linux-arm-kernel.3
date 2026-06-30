Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E591AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 21:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JxJYxohjUwYJZXlwl2tLOoasJsXfNDAaAFi3yYBE98=; b=sS3HZJY9oxZtUl4gJJxvbdcfyd
	6Gi/N1Wfya9SB6Tm991NUJsfg1dP3CR8aAjiZvUncUDzqvd6F9lywvz6LcUV2Llpj8JD74+89kTHA
	7VUoabTYb95V91HSTD96Qt773Ry5AhxR6Qs8QuuIb7byWhMu9ObQJbbgifDr7UhlodzqAcbP9uNm6
	C5QgeLVOVmpzLAA77JliwjYMksLmkgmGyP3yrIPwrO1vO2vhN3ah0o9/wFKQON0UVhhGCc73bvjeX
	4BwSe2P0ts+yO8JTvOhgIvU+5H1SPInQRFe63JcuzwmznlHHHvgE3Ww0KJhQ3XNCDsR9MgH6TU/X0
	SU/UFnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegIr-00000000Gk8-25Kp;
	Tue, 30 Jun 2026 21:47:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegIo-00000000Gjr-3Wl8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 21:47:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E03860103
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 21:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD751F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782856053;
	bh=2JxJYxohjUwYJZXlwl2tLOoasJsXfNDAaAFi3yYBE98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y9NGkgHZLpaRaQ/GYEiL6lK3CAMGUofQgj6W749BCmhAJwGfv7PfPOzT0Lrhf9wjJ
	 odK6K1HXY8GRgj9N0Sr7mmgq0f3iFRok76msFEnfPsxjMEo6RZQEViSTYAL6veHifz
	 xuSoGxrVGpPRx6LldqQUky3tXsZaFP6sjDlLALL6dYen6EzJbGI/TBQ76DExATBq2Y
	 7m+anBtqBIyk8bXp9kkzI+Ybu4R2I20wbiThaT9wIbS4UgPlRNGZ5mPo11lNsHIa7n
	 necjaN5baTVa1Ncu9tnTWyy6NvA/XMLVvhyBTV4bELdcdzANXN5pT/+kamfV54zJHE
	 wz7eCnP1bsnlw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso2702758e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:47:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrE6xF6AfxMvlBelmFW0EfHIm4zrNw6l/1BcbE/LTclWA67nJnuxbhvcx2NAa1K+kvukZv7BdYneRvP5A27NvBX@lists.infradead.org
X-Gm-Message-State: AOJu0YxHuFzdgq6EcRDDxut+30r2DbokcDM23W8rgcwb0gJcCLAbCLbB
	bYrNWDMWx8cs2FVNXuB/5aPlZn8uAfrJDxynUdZOVlT0jHNMycY+gJh9zSvoTvAJWeBTxi8SYik
	Wi8W2FS+GT1vq0rQuuBqhMBGqryb0V1w=
X-Received: by 2002:a05:6512:3349:b0:5ae:b24c:7723 with SMTP id
 2adb3069b0e04-5aebdb8affamr1374084e87.17.1782856052738; Tue, 30 Jun 2026
 14:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 23:47:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmx7sJCsxMOp63OfHzBHL8Ps7i7PAQK=6ebx-e05rzcgA@mail.gmail.com>
X-Gm-Features: AVVi8CfiTow26248TidhGIW7dw9G825VZt5ZIC_cLTjC4s5J8jEFZkDnZkIzjiU
Message-ID: <CAD++jLmx7sJCsxMOp63OfHzBHL8Ps7i7PAQK=6ebx-e05rzcgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601
 (should be st,stmpe610)
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 30, 2026 at 12:37=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:

> From: Frank Li <Frank.Li@nxp.com>
>
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
>
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed=
 to match any schema with compatible: ['st,stmpe610']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Fixes: e10038ce1ba9 ("dt-bindings: mfd: Convert STMPE to YAML schema")

With that added:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

