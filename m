Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828FCC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qde20GPEW8GrZb6i2zWlEkGphLDMaxaujFgrrC5mKsw=; b=nzc+xAUJO57iFpyEvB/8BeFbMI
	1whatnZRn6JKNmCHX1/dWrnccfPaqbfXqrTIt8OxZU2FTJ69qQjZTBWQDy83LEf5ajGA/YTpPOduo
	jZwkxW9USqfKsJaDIYmpFVPOblqEs1p8qG69iie4TUf3jfzEqVFpqPqiq8Bo5BE7FIiJMZaFIs5cl
	xSxw+HIIWwscMtLyS6kBPQMz6xIubt6PH9/T66cx10KekLWBXwBEbquRRXaMq9wHDGpgKyVNtGVqr
	idcTGgH3RqCv1cLakn47/1pW1UZd4Gp+i9PfueKWjW/nEo9T/MAU1XSRc8aFIxqYETtWqJjRRRrlb
	8AkpHqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ56U-00000004zar-0Fi9;
	Tue, 08 Jul 2025 09:59:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4Uu-00000004sSB-0RF7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 09:20:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae3b37207easo761693866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751966418; x=1752571218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qde20GPEW8GrZb6i2zWlEkGphLDMaxaujFgrrC5mKsw=;
        b=vp7b6V2SGr4ISbJmrNFiEdLpKq17ADvAokYW2DMaCj3/wyst1ykWzKkglHr+5C1/xu
         o11CetPhYYMs7Ol/FM9+9qq2QVmxielPAli/9XQd8rlDDl1mkOePyzAgOGyG+HDgCBaQ
         2S4OvIb3j/sM9pedKIv939hTKCnDD8mWRRj088vTXzUn/BG2ObloJLRT5pPLnIiiJVLz
         G4083qx0+iTNZ9B34dbBek2mSmiduwmEG8Lah2uqhf5KnlXPk65I/bDqxje9+4uFl3Pu
         D5SnJw8VbZM80cYg4fkrs5is9mX9CqyUsVRZIvwf1q8SOm8aujsctbsv/jansCFDncKZ
         rRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751966418; x=1752571218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qde20GPEW8GrZb6i2zWlEkGphLDMaxaujFgrrC5mKsw=;
        b=wWHiRxX9IPiMGmMFcT4dilJOd2uzdKmwtyhTVkrnZgxhAwVYicO+duL1TuqpgvQuKc
         PuUxAcvCHkERyUgKPThQPskGzJBUd3S2xC6RlWPOP8PWbkVbB7+5cPxHIf65+QI/VU5A
         viRQunaYO6fQ6VzsauyeVblQZl5VkyzDL11eu31So5Umi2UR07yVoBqV3fDVBbeQdC0h
         uM/Q4P0AHKh26UBNSdk0gwpXGQfoyKyZlPM9MM+UmagmEFnawboccO5UCxdLZ4ivgdmO
         EBpelVKJ0V998QlFHDlU6fjOaLrucnofjLYpI7LKFwdjtktahKWFWOxDaIb/4gLzUaWf
         oStg==
X-Forwarded-Encrypted: i=1; AJvYcCV3JMPzuairkXPCfmK5cAasx0jw2HSkdB5l5+u8+s80KL5audvKLGwZmi0mKCGk1eIhpH3OA6mO3oqfPM0avqnP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkjg5R98BK+8hpsttEtGxlAoeGTPDq6JLtrfd3DOdQ9xhXyCVy
	SWVXQGXGX6uJGs6IWHB275dH4kyQ7vQwWLFji0wliCU+YW/kmtGiQuhJYEeHKRxbmRWNPVsVD3N
	ygtOg
X-Gm-Gg: ASbGnctzgGClsDi/KqGNO+iaBB7norkKuB+XuirxTWyWP1XcAxPWADCOvkqlOZlv6jb
	L/ND2Rs0vAPo3LtKkKt+rAt9ps5ScMxp5byvxZbUr7cE582wriOFa2t9Wc5GrFx/8p/achhxREX
	qqO3H/ZdkObGNd33mBZFN96+xHu9bsV6vGZykU1Cin6Dy3jM8b+CH/b6n3qzggp/6Cqq8LL8+PM
	qwblk3FJKtyJ5PXjDsZiAUaEUmHhZLSytNoYrVSeu0UZ1RD6MIMZeEK0dIu0zYY/XEtt+fV4ipi
	z3JURpfAdBZfTjr2vVcLMeOuFonvdiRSRbmSFCmh1HLl0PaALnyNpeoSi9k=
X-Google-Smtp-Source: AGHT+IHP/+5wQx+82Xsq93Q+p1ivWxiCeoN5FhCTp6b5wZJQBNJcP3y1aTVdV3ogaf3T1uMqF+NcPg==
X-Received: by 2002:a17:906:f592:b0:ae0:a351:49b with SMTP id a640c23a62f3a-ae6b06f2722mr201059366b.34.1751966417914;
        Tue, 08 Jul 2025 02:20:17 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e7d4asm840670366b.23.2025.07.08.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 02:20:16 -0700 (PDT)
Date: Tue, 8 Jul 2025 12:20:15 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v3 0/6] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Message-ID: <aGzizyLX8HDWsWWm@linaro.org>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_022020_147988_9D68ED85 
X-CRM114-Status: GOOD (  15.39  )
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

On 25-07-07 10:24:36, Peng Fan wrote:
> Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
> clock gate for LVDS and DISPLAY Controller. So following same approach
> to add the support, as what have been done for i.MX95.
> 
> Patch 1 is to add the binding doc.
> Patch 2 is fixes when supporting i.MX94, but the issues are
> also exposed to i.MX95 even not triggered. No need to rush the
> two patches for 6.16.
> Patch 3 and 4 is to add the clk driver. Patch 3 is almost picked from
> NXP downstream with a minor update. Patch 4 is modified from NXP
> downstream with a few minor patches merged and updated.
> Patch 5 is the dts part to give reviewer a whole view on how it is used.
> 
> Thanks for Frank Li helping do NXP internal review for the patchset.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For some reason, this doesn't apply cleanly.

Can you rebase on 6.16-rc1 and resend?

Thanks,
Abel


