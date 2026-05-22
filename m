Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02168CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GDvKPT9BVyh92cXGfrSByV+to8ygxr9SCCX7AQDOOY=; b=VzNaiIh6Cqb3cMAMRbwDQupScS
	9j8xPci8eChaWRJvwhfkqOJf+F9CYUJkdsBYbKlgrE13ZMWMK/58CDo5jiWQq97ulhv/UaeGtR55Y
	HD2uXGvdd1kLFCXlH3NlrT8htyWS2wbKuJV04jZH9n+jPNePqmXLSzXeoPBibvMAoiIA1j0b0iovm
	eINXynwk7W949WYCK8sT2ESGYNRO/hPGxhRF6w/LU88/m86mnOEqzBKezBuHFsfZdXaFpGgN45RHu
	mku3FFBVi2jK1l8GTuL5lJmnBtl++ajOkKh+yP7JNtVX8UXQGIDQaYmDukpEYBFRcNlKOKpB1Z/Z1
	iEPtp/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPrZ-0000000Ay74-0hwj;
	Fri, 22 May 2026 13:24:29 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPrU-0000000Ay5O-3xtD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:24:26 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd4f7f05e90so1324793566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456263; x=1780061063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GDvKPT9BVyh92cXGfrSByV+to8ygxr9SCCX7AQDOOY=;
        b=Xuni+V55iBJYLITlPvjX9VaE+G+9vtC81rChm9XOW2h9XX8n/FHG9qOdJ6IoTmqqRj
         jxDtX33wbeCwYxfaAztMAeorkZv6VEHOezpplIhaESaI+OBLlv0NqpzPOPhNabi2jF3W
         sTqtPExeMSi2hyufgIgtoVQB5p3FRHiugq/qnvtRvT/JBeJIAwaAKBBLihCl3IYl8ZCe
         EwWQEwaemohGj87mcE6x+QAsEYQvB4gzKev8gn0ZDlT+gtJkozDlvngx7tCzlIwdCDuN
         lqEsx07RWsPToTAwFA7UZSA9Dra7SpJ5ypg+5YZV0Ot0MAKiAFQS78o5hhuVoJ0somQV
         m33g==
X-Gm-Message-State: AOJu0Yz3PVSITCq0UncQb3v5GSM5HPPsRCaMITIacJplzfk4gZTxeoHf
	3/9pqv8NEmTvyYKXSSJ7Xu0dTukgAWLnccgMeqHJHyJdWWMWM2SVPUPAYS/HoPhZhLs=
X-Gm-Gg: Acq92OEJOyY+A8/rBvrV7ZgIQhy1k/TGRXv0RlcFRw495vpfIkCHYrefYY6xkS84o1k
	LFSfY3omyAXguk/8z88nHozBkARstaJXobQb1poCMlhFJHE1kVZQs3azYYqD5UO+4oZDDmvVS5b
	/iv7PMopLE28idjBSCwJTjsO25QZaWfYLiXxjA0Q05pQDaabNfezSfGyrREUIqPGIUFWPbklQ2/
	QpfRThXE45Yo5K+Km1qpI/VQOv9nXM6o/j8lbmYJgjX1A9ss/l8zquayZR5avEK9hQxx/BwNH+V
	/6ukgHej28nJMB2Ku8vNUvs4VWPn3caDvQ3jif7l6x63CCTruWowRp2xR+HzWrUCkWQGpr/qvEH
	mgXp9Or0NuWTKdHCcZ/uV3fU2sOMVM8ZyFAWDS+uZjHJQ7yCNVX2ECfMVmuoXPO7zWD9P8yWRe5
	z++oI4iaXOwkJ8ubquBUx/PptZEBrEG9jG+8vLqBku+Cd8vVDedWXdQAe9VM42mZtZtfCUEM8=
X-Received: by 2002:a17:907:c06:b0:bd4:6da5:d5b2 with SMTP id a640c23a62f3a-bdd23cfc4d1mr231615466b.1.1779456262872;
        Fri, 22 May 2026 06:24:22 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d3f21sm53712766b.44.2026.05.22.06.24.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:24:22 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so232537a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:24:22 -0700 (PDT)
X-Received: by 2002:a05:6402:40d4:b0:67b:7d11:758e with SMTP id
 4fb4d7f45d1cf-6889c44d02bmr1805319a12.11.1779456261967; Fri, 22 May 2026
 06:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-11-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:24:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsopE_aeQb25wa-UGbAegObAmuAsjR3KhyE6tqkJX2rQ@mail.gmail.com>
X-Gm-Features: AVHnY4KDNA7entSIpywZdqDZOTEKyZkKaLYsaeA_apHbUNOL0nn5iX7Rgbyd_YU
Message-ID: <CAMuHMdWsopE_aeQb25wa-UGbAegObAmuAsjR3KhyE6tqkJX2rQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: white-hawk: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062424_987249_9C452270 
X-CRM114-Status: GOOD (  19.75  )
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

On Tue, 5 May 2026 at 05:44, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on my White Hawk, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

