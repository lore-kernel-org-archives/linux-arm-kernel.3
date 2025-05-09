Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9263CC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOJLYiG65TWuBlIxtqgWoUH11LDO0PGmxxByMRSQU9U=; b=AL72ALCTDqtoYOwwC0K437N+O/
	8BMszjJTm6fIJopSMcEDDgu1elD5lIffY6LHZ5binBKqeWhwO9T2oPUHtw9k82t8MFMbZHuX876TB
	cemUluvsI6VzRRcqWxv6vK23r2VzBpadP3dBjIrahv3cpZ2ROwdSlWQk9d1pNb6iD78sci/Uc/+Nz
	lhStIObHObsYqQfdNJTEBAez5XvGTm/C16WRGXsmnyhDREIrzrrH/8egQ8h9cI6np6sddAqubzCup
	jHyxoerDn0wPAzDNjXZVkAvEJN4zPsxaw2wGYN3BcjAgsuIiaGMeV5zlPjo9LyguQPeDuRfzGtOsK
	OFMW8XZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJg-00000004oY7-22UX;
	Fri, 09 May 2025 20:27:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRw2-00000004VDL-2RZG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 17:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3D97A4CC3F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 17:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6531BC4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 17:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746813297;
	bh=KOJLYiG65TWuBlIxtqgWoUH11LDO0PGmxxByMRSQU9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kIeI3oew9kGkoFgw29zR9WHx9t00qjurtl2Mk5eDdv66tHBjgg9ctOKP44Ec81FZi
	 dukEW6W56aKMfGTle89s1IoThDu6ex/UGgvmEnRPtPALYBltoOFFYEwyTc1zjiLnc/
	 zBG7Uvq3LbzZrwzO/DXWgxVAPxxPq2AgW8JpPY6v/3SOBp62UcTvmV3404JlQoTvG+
	 goiK96XDKF39oK4R+9acrWlAJ6619v+ZZmUYb/DHyS2ggcgtA92ndAS23ZmgyYBrVH
	 YmUJgMlGQnJEA7Mw0ce6c1fxkuVtJdalgvO39qn/wxLhiciRG7R8fcqYcdlcDxzB23
	 AFQRNDXGvU8xA==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2db0217abe4so1205572fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 10:54:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+o/dDcBPC/U3YepJC+yp5H6TUV2j2ay7ZL3dypLhQsw3ZrVq5peI+8P9NruYH43b0Ce9d4RVd+LMlPk2+nwF5@lists.infradead.org
X-Gm-Message-State: AOJu0YyTvJZYr7UcXyIJtxpwo1ZOYpSEkvoW3MyKa75FdW/dNUxANMKq
	bmmCeX2deL9i+tmyPztzPUhKj1G4h7Lo0PKoZ4KbZmC4FT5nJnkW3lohT+M3/8fllskAUYQZ+RV
	hOEQwQADaD/hXpixEAEuKOAmxWE8=
X-Google-Smtp-Source: AGHT+IH+jDF/fm0Bn7a7TtISeRixJH2NGz85rKoIe9PgVRkGUorVZ8oAkej18qlnfpmvd8IxnZLcR24rfpdzrPlIZTI=
X-Received: by 2002:a05:6870:f206:b0:2d4:ce45:698d with SMTP id
 586e51a60fabf-2dba4216488mr2969585fac.4.1746813296734; Fri, 09 May 2025
 10:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
 <20250327195928.680771-3-csokas.bence@prolan.hu> <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
 <b38b27d4-c3d3-450c-8634-2e07f393a76c@prolan.hu> <CAJZ5v0hRsXw45utNMEhLB=i56tsJDz8AvYfV2stPbtRHh09HUg@mail.gmail.com>
 <8dadb7ae-1a7d-48d4-8dbd-40f6d9f35a6d@prolan.hu>
In-Reply-To: <8dadb7ae-1a7d-48d4-8dbd-40f6d9f35a6d@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 9 May 2025 19:54:45 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hmmtiKnJ9=ejZXP3YdQYJ5pojqSAU2_KP6Y372-NQ-0A@mail.gmail.com>
X-Gm-Features: ATxdqUEiOx41ppybYx5hV00Fa-RDYzYUrpyGFFfZ9PKXJsOblhz9_YvaMeeRbSU
Message-ID: <CAJZ5v0hmmtiKnJ9=ejZXP3YdQYJ5pojqSAU2_KP6Y372-NQ-0A@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] pm: runtime: Add new devm functions
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Len Brown <len.brown@intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Pavel Machek <pavel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_105458_755468_1B00C42F 
X-CRM114-Status: GOOD (  15.42  )
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

Hi,

On Mon, May 5, 2025 at 9:02=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.bence=
@prolan.hu> wrote:
>
> Hi Rafael,
>
> On 2025. 04. 29. 13:08, Rafael J. Wysocki wrote:
> >> Did this end up being applied?
> >
> > Just applied as 6.16 material, I'll let you know when the tag to pull
> > from is ready.
> >
> > Thanks!
> >
>
> Thank you! In the meantime, I submitted the DMA cleanup part as well,
> for now rebased onto pm-next, but there seems to be no diff between it
> and dma-next in the relevant files (drivers/dma/dmaengine.c and
> drivers/spi/atmel-quadspi.c).

I've just added a tag from which this change can be pulled:

https://lore.kernel.org/linux-pm/CAJZ5v0hNb8eB2tAig1BiUMHLQ3JRak3EXFid9qmHz=
6iWvh5q6g@mail.gmail.com/

