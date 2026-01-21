Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E6BC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GEePNXlRioSSI+/e2W8cMzaUuqufuQaYeIjfwb71Kw=; b=tR97F2Dt7kEZ8gyCy6tvdqL1xb
	aqN1RevF6p7sv9ReLsYIIcCKj1FgJr0B14PGeGe9lid/9wLPYA3Db3s6ke8QsTSAgSOJm513zETUA
	wJo22WfV2E6+4Duhf587/vtHcapGwjSYbGlPtAS0azpJJhJXUy3zB1POxPEo/6J46oUSYT4sMSNpZ
	7C8PYisCTIw4Sm5Bt06ZdAYu57BZ3c82a1rE9itZJxKKGNgHDHKVZJpanbxJ32tMA0WxLWyBkGRDo
	37Mz39jZS7yzV14kqCOaEUeEYW0p310HGRG7PFp99UG49PqDzGdfC9n1Y880kEYi5DbiFJZe+84/H
	+ltmvaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibbl-00000005qji-1LWL;
	Wed, 21 Jan 2026 17:03:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibbj-00000005qjY-2TWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 17:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46E0F6013B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 17:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2531C19424
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014981;
	bh=pa8aWCTcpI5fQV8rx/plmPidwgBTTPF3cpoGqJ3CbM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mXbsNauiA8DEehouSx0bo1tQQZObz1DX6hvdtnpcVFOgycqXsZVdgkiON+MmgQlx+
	 Pf+71tP3kA81oTJ74sFcGl2OBUsDCKc2Nh+dv0am40ivp34QijdI3hh+fJcszE9gSB
	 NkX4DiADcoq/Mz1eeqyEl8wJcg2PpOA1EwFAOdqM/lnsJ3Ml3g6IgSo2oCm+wpiwmW
	 jhE4CY4zS01OGoeO5Haj/E0I8mMBVZQ8wQRhFXAim9HX26rqdgbn5KOevD+g07dYTG
	 /j/hW/PJWnNPU4Wb4MyzfdeakmPcMTxhwxTs5KzoZocEC3f1SmmWVlFLsSesR43RIR
	 9tQs7MRpPhihA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b87124c6295so132966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 09:03:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJJieTLMk+afa0DtE/j6K84lrD4fLoWGyNH16xgFUUQiw7eDv1ApVqVAX0Sd8QaAEs4CWacWRGHVTujG/DGFZM@lists.infradead.org
X-Gm-Message-State: AOJu0YxfA0UrvR41eyGjVV9wvI2sWmldsH00AX5sDbEsVDExZoeip6Qi
	wbdZDJZpgcb+e/pk7zsoQfXUaWS+oGvxf1gdQDO8UrVa6xRS5SRtVjcdX+gVDYU3DtWvBobeS/T
	hdetR87yJHjrW8chA/cCsEmV79WsONA==
X-Received: by 2002:a17:907:a05:b0:b87:1b62:13ae with SMTP id
 a640c23a62f3a-b87932b8e26mr1653806366b.61.1769014979483; Wed, 21 Jan 2026
 09:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20260121085347.10368-1-marex@nabladev.com> <176901406635.3440858.3601461880570246394.robh@kernel.org>
In-Reply-To: <176901406635.3440858.3601461880570246394.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jan 2026 11:02:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+v3W2bVCUbYtMZMyvkdP7LGrn4vzca_PFHkwgQptJ6rQ@mail.gmail.com>
X-Gm-Features: AZwV_Qix7oj-Of4DdoJ2Jzyev08ewbS4IgrrQfV85apQDNnlZrqyfeVPrtD3VKk
Message-ID: <CAL_Jsq+v3W2bVCUbYtMZMyvkdP7LGrn4vzca_PFHkwgQptJ6rQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: eeprom: at25: Document Microchip 25AA010A
To: Marek Vasut <marex@nabladev.com>
Cc: kernel@dh-electronics.com, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>
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

On Wed, Jan 21, 2026 at 10:48=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
>
> On Wed, 21 Jan 2026 09:53:19 +0100, Marek Vasut wrote:
> > The Microchip 25AA010A is a 1 Kbit SPI EEPROM with 16 Byte page.
> > Product page is at https://www.microchip.com/en-us/product/25AA010A
> >
> > Signed-off-by: Marek Vasut <marex@nabladev.com>
> > ---
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
> > Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: kernel@dh-electronics.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-stm32@st-md-mailman.stormreply.com
> > ---
> >  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Actually, I applied this one too.

Rob

