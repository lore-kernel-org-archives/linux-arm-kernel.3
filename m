Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFFBC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 03:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=; b=28qoObvgajRuDKCgCl0Rd17JKE
	oglHWEXe1QmzxM7wyJmNsYpyWD6F1eEf4UYXzlpODQA5QrTuuRfxqMYpxAzNCdeXtt3F5awrKr+oo
	43u/MZbm4f4FT71TaKHIusYzKyRWTklndHlCIf93OSaXE5bAdC0AwKxYP/TuGfYloym4MKpde4mgx
	dzxuBTd85Ve+CStCUYq2H9NW0IicC0xKnREKYbddLcopfuQ+Qm3BwGpryWP296vFl06wLLRSM+cJB
	L0yX/W0+bXD2n/9avKmz13woi0ylh4AfuJSeiOQqk5VFczb81bNCOIgEz7Hl+qOiFpCL1j71YLVdW
	yyu+IBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXJI-0000000DARH-0q2d;
	Fri, 04 Jul 2025 03:42:00 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXGw-0000000DAHn-26sk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 03:39:35 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-70e3980757bso4853077b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751600372; x=1752205172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=Pb7Ti/CH/+5sJoQXJgCAMoyveqV9F7pfWVveWMERAn87N+UY3YpbWFbh6DaFRf8Y5P
         Dy8M/fUuXrA4fYBKmWHGaClTMne+f1bPfJfzbRhcIQRuRdZGZJ5uxv664yFEaxCVSQL7
         5R+z3kWWVz0217NrdAx5yXS5vssSe7jp1se2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751600372; x=1752205172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=DL82Cl5Kt5nRWNhN5yJdj7w3AfU6QJHGJyI4LU1k5K1G1V4NEoUiG8OXu3+UnUznGi
         PzjaijanJ/ccXbV7+RO1IfKZi65wUvXwWwcsphm0hcdUu8ILoBAIuV160gbCrgxJ4RxS
         rIogFZW6/gESW7SVsaD2nYx0go61lTQK+D4qJIFu6M3M3hkxw6WQfJXiMj+6zDQ8krnn
         XnCG4p1tUMseFFJQW1kNmjp1EZut4vSSvYOd2dy1z844ga6JP671CTPuzCf21SVNO7TH
         cpDTAfWeAQZrJL+K9f+EDQPNsZesGHYsBdVqjMnImB/QTts41LNsoXQWdcm3LmlVkR+V
         d8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2mRXhd1zOS0f0Rw4xnMDVFvyk3m3qgebwCTiW2i6G8VsGL+tNeI1n+Qp2Gn493Hu3A+DRDrd01nusX5AxDdyL@lists.infradead.org
X-Gm-Message-State: AOJu0YxDreUFgSR6Ns9jjn6wAwVoBDY1eKvT5SMqmG4BkI2btSW2v04T
	gnItHaTMYO0t/3QZgBKZT+Y1Gjm89HDllo0wKg5MHY087K1cFNHUq1M8DeKw8W9/xDSB5SrKSu4
	K0ymd+aaUl5JqpuqXRT5Axqe0Nsq+RrOYPDmFIdf9
X-Gm-Gg: ASbGnctlp51W3U2BEk0A7HkTFHwCvEG6+hCl8n1dtYcAoVwpzW9OjAMko+6TiDr84la
	gRUIXHKCXEH/yEn3UsbCAdSa6vrfhylqG4NNQB8JZMse/ImkvGwbLGNRalpMQgMBQZuHYRohr6C
	mEdPsKr+G9DPB5LATT0TXZMIqzwUKvKcAzL3RnTbIXyVFX
X-Google-Smtp-Source: AGHT+IEpv4/ABsyEPWBaSbnhDaxcTMMoASH0qOMAb1EUBzfvoB9Rs9KL0TsrqeATirMWAbb6GqIiVFu78+U/gU30DoM=
X-Received: by 2002:a05:690c:46c5:b0:712:cc11:aff with SMTP id
 00721157ae682-716672d3d02mr24980587b3.11.1751600372350; Thu, 03 Jul 2025
 20:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250703183523.2075276-1-robh@kernel.org> <aGdAmGGPDA71rDE3@google.com>
In-Reply-To: <aGdAmGGPDA71rDE3@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 4 Jul 2025 11:39:05 +0800
X-Gm-Features: Ac12FXx1clDJs40GrPtAnmhl7h9XO9sxxgXTs_ThD6wPGcXtPD9F4XTO-6ZiN-s
Message-ID: <CAFv8NwJcwD0wqJAoe99M+dQYA383n0g9U+5+Z77uuQ2d=Ac5pA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_203934_554155_AB8674DF 
X-CRM114-Status: GOOD (  10.32  )
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

On Fri, Jul 4, 2025 at 10:46=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for the patch!

Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>

