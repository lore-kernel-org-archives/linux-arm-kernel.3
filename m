Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93080D65C57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3Vt0L1iV0aJH4loN6RbVzcWMTTl2eRa5QJsLVERKNE=; b=tHUAx3OzduHKmjV3RfmcTzf8s0
	WqKAty24mIwrGWCb/nQ8C6EhMNepeVem7OjhO4ujoX5QsWAlni6O+/t+H/icdcKolFWKq2vJFmWUY
	tU24xoOeam8dLeJjIcoR5NeFId7xnLYin/cgqXC1bS8Nw8nd5vKaGee6orJiAOob/wBVyqvJZCEt9
	1RARHy9uDBHffYhf4ijaYz8t3zSJ0q9nnLdBUYCbdVUok0pY5jDNCSNL25+aGG3JcXtmY1yBfJPTo
	qitN7puZ7VR6q830Y5Pwn/UbGfEQYZFFd/RyhF1SI0VvP5+G9M/kLPqJPvlOFbSEDIWErJOCx7XQ/
	RWR8Wijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUVt-000000096lR-21UL;
	Thu, 14 Nov 2024 07:43:37 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUTt-000000096Yh-2DKh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 07:41:35 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so2350311fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 23:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731570091; x=1732174891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3Vt0L1iV0aJH4loN6RbVzcWMTTl2eRa5QJsLVERKNE=;
        b=MzbmY2I3MBr3y8oQVC69AoEQZMtW8Mwt6Y1Aqn9pyNVgyj+nUMDzmB7jRB/gWh/j2Y
         H8aAfrE09nm4H8+EwQFCg3Zsq+eDHwBbVol9foLnf+Io50Oj2WoGgkh2DKymJF/1l4N0
         FINP3/Ke96u940kUV+p4/Fea9fZ/PTu6PSAkmSyE2LuSn97f42sUpbBbkGgyTRLni5M4
         vpZO0tnBIqZ8Ynaw9mO/XSDI4QjpWoBO1hZWlfxc+yDH8JRa/aBq8K2dlWARQUV1bCXk
         E9pCIS3PqbP1QT2xpOl7lVZOavq/XjihTip6gMvDUvl2tpplMXbrHyGaFavtA8B1bl5+
         guFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731570091; x=1732174891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3Vt0L1iV0aJH4loN6RbVzcWMTTl2eRa5QJsLVERKNE=;
        b=JVTO1wa77SVB3Nfmm6e6itCtd2C8RwbE3mkMbbnxIHOCte8iZXZCWBacxPJPPCxTdV
         /QmMDrcmQyGfynTdjZUw/QntX8aJDJcS3vcUfbGiKfsJDxKm0kMxV9/53fADwxhBJtXE
         CS8ZFk8Fy2i/x6PCY1WzL7VMVMmU9C17ojfkAaYZ9pF6bgOuOsziA4jCRtnl7KkEDtaV
         g0Bj1XNhKvKOkDfsE43SfUtDQNBIZYE9dLeFYnmuAxmOH4dX6zKTdg7R3rXrrc/JmJ4T
         zVyAxsGhohY3HUq9gU9GrqkZGF9lMSOQ7AC3uiw5AsCarnxe9q38SXDcx4fq7B47UETk
         WLYA==
X-Forwarded-Encrypted: i=1; AJvYcCUlOiyZtz/OLs4KYrfUlwNBiaATSYC1EBlKbsggjvnPQLmSumJiHfFYPL2BXkD3g9OKioSrSpzwfeD21Q3Ugl3d@lists.infradead.org
X-Gm-Message-State: AOJu0YzG7bI/tlmp/5qi/Q3XL8QG8F3h01AaghkwOW8CILVjn51zjR/+
	rC4prcdgshBoWQ6Tn4aXoh9yVde363DYVh6mCCgnXO387rf9rCl90B70GIJkL3mD1nJtFggjraS
	upiI+zhNVj4TJblO7D5UNhk3cQSHwIFhfrqL0VQ==
X-Google-Smtp-Source: AGHT+IFZt2WkxUHWahBdKUp4llUJ2Ksv3srUJ12mxGXyVTlk6+10rJ31ZqQkVvw0e0LHrOhB0q1fj2ksHthyPGo87Es=
X-Received: by 2002:a2e:a58c:0:b0:2fa:d31a:1b77 with SMTP id
 38308e7fff4ca-2ff5901aaa0mr3885741fa.9.1731570090943; Wed, 13 Nov 2024
 23:41:30 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdb6T5dqgmcVi5m_52uQ4F_wESv4K95Fk1hsZcSaUsY8xA@mail.gmail.com>
 <20241114011939.296230-1-luoyifan@cmss.chinamobile.com>
In-Reply-To: <20241114011939.296230-1-luoyifan@cmss.chinamobile.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Nov 2024 08:41:20 +0100
Message-ID: <CACRpkdauGxfiobFHRJfkRYASZ3GhosTuKNPjQc5sFMhWDCR8jA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: vfp: Fix typographical errors in vfpmodule.c
To: Luo Yifan <luoyifan@cmss.chinamobile.com>
Cc: linux@armlinux.org.uk, ardb@kernel.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_234133_616901_83981C19 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Thu, Nov 14, 2024 at 2:20=E2=80=AFAM Luo Yifan <luoyifan@cmss.chinamobil=
e.com> wrote:

> Correct the misspellings of "noftify" (should be "notify") and "swtich"
> (should be "switch").
>
> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into Russell's patch tracker.

Yours,
Linus Walleij

