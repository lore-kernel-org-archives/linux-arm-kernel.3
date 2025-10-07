Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44343CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w56vpyq36HF8RpsGhMYvJCK01J/8OiGiiJ7vKt8zJro=; b=c9T19t5vlR7SE1vBPG7ki+RHv5
	shXraGEoLADKDY2Jszufnlk6jmx5ZVdtjY+HSD1yMWiG2w5O7NmINi7N9WrsoJftcTLlU4cF26Bn2
	UcnMGptkFW41XQSa6i2kZPQp7IKGY36fY5wHfYov4AKGbfR/RDmc1V9rmTR9lFjkSj+DsltRzYXh/
	aCL0TClDypOVtw8QHWCd0uZvMymp5ked8tGjbdBCKWDIviPZxOXzheDHjIWz+NRqGWGC1dHd7LE5v
	3j3pmfjdI2evC1JbxTeL+UmEccTeBphlshFPvDluwNYA+Zk7nIi+Xv/5g/pxK0Rkj69Y91UK3VbFq
	jGn5N0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DCL-00000002fID-18dr;
	Tue, 07 Oct 2025 19:18:09 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DCI-00000002fHt-1mFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 19:18:07 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-71d60501806so74009037b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 12:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759864685; x=1760469485; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w56vpyq36HF8RpsGhMYvJCK01J/8OiGiiJ7vKt8zJro=;
        b=aTRCskjyRQT7F0RZS2oRAZYduViTOokEVR3V+a0EIiHOmjkX8ODJgXODk2F1McQZmm
         zYQap0CezI2gVeu41eTp9dNPnJ7dLK9pB2fsqc4dUN5m4Hm/Q5NIaWFWBXu+zFiF6EIE
         7ROdIzqzJ5YyeyCbc9AJDP+g1m7Is4he9maznHV7Dwblag8w8+sNc1IXSvb4cGU3bgD3
         wTyM12/oEJsvUFlcGlxlqIQp4tUOlXEWpRJ3fpV1DP0mgZTAdUpwE50vsp5Vy4hqhPf3
         +dMPGsGDmgMSVCQEuHNV9YJwB+Z68sZC8355IJIBVZ5Y7HmVOZOffARs6Of2oBhIKZOV
         jEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759864685; x=1760469485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w56vpyq36HF8RpsGhMYvJCK01J/8OiGiiJ7vKt8zJro=;
        b=A6sH0H+2Kx/AHI/IIKTPfbsaYLotmNm1f0DIvFFwmqz7aWyamLQNbWEQAbS6Ukjp2r
         wJpuzuNs73CWD/NA5K+azLOvpsOH0N8ngQwQ39VyLuCSVbn4i8WGOmJYILhM3xY9hJT+
         l1AEcuROZzI9HdGyNTrJEBgqo5wY0BERlg9iqZIoaysG6tRZ9YOS1XJxZEudLPa7rE3/
         MSh94pqTFqsYVmpbJv2qrfqrwNIogf+4gcHWpeg+nTOlhj2TK5anXzF9htW5miJvn532
         QqG8P3ltu4ig5yJaZhhMNdJOcowq2OqXEoVZxtcnRSMmg0Yq1+F/Pq6cqXxjLv+GaB3l
         Jdjg==
X-Forwarded-Encrypted: i=1; AJvYcCWu1Kwx7pqJS/R2+gn8xqCY/N6vofzn9EEeYdqt9vKwSLk4u8MLPfUgu7T0oY1QEyPtxsdv7/s79UJdtoMPANnM@lists.infradead.org
X-Gm-Message-State: AOJu0YxVXMXLyaQ9rMNqxNPUOhZASVllPB6cs3r0/bvnCxWl4mNCXlFE
	8EhU8wSP2v7tJkSOS9oo8to105lruHXxDUYWarosZsDJhIXZntXodmv5rZ6dFyI8URRJ2SA1Qdp
	eqw1prkebgN+TNoiojPkDhaBLt0quDb7E/7HxNiAiYw==
X-Gm-Gg: ASbGncswzVswuCLm4sEHHyTdbpT6y5GdscWvuCUfAjccKtmwchBXdGfFw5lio0QQ/MS
	j18RsUnKCx7BdCcsC3D0KIkB+L7yZBMAdzSddmTE68E1bZISDhVDT+iGuvRNeubztbFjWuDVOpU
	UbJdq0XxAT32H/f5U1ZbGbat9YsSQv34fEh43DgskvYZHrXzS4fWmVBN6yr0KzkC1Iesg2GpwCZ
	icYxFWDAjMWc6dyf8eCNzxgQBz73TBgvw==
X-Google-Smtp-Source: AGHT+IGMX2m5vC5IgwIyyLUsmiZiXribIWN75UHjEqcGSweB7XgIU8ixi33FHOzX5pt05B8rZ7NfuKMui5fZiPzZq0Q=
X-Received: by 2002:a05:690e:429a:20b0:632:9d08:e3ec with SMTP id
 956f58d0204a3-63ccb8d82damr755481d50.25.1759864685141; Tue, 07 Oct 2025
 12:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
 <CAPLW+4kAzXmd7mv279wMJCT0gVP5A+2Xe0q3MgX1OENH5PC2dQ@mail.gmail.com> <a09b6b493b41bff39000df61dd14693af8b0f053.camel@linaro.org>
In-Reply-To: <a09b6b493b41bff39000df61dd14693af8b0f053.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 7 Oct 2025 14:17:54 -0500
X-Gm-Features: AS18NWDVKcO3PeRXDNI0DF_p50lDT8d8A_Mox4i1JZNZGvpUO0f_-kjnkIWXx_o
Message-ID: <CAPLW+4mitF8rDcKdp3Bgs7sF88WbV981hEkM0LiTqYKSLN2_Jw@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_121806_469305_10620F09 
X-CRM114-Status: GOOD (  20.91  )
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

On Mon, Oct 6, 2025 at 1:36=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Hi Sam,
>
> On Fri, 2025-10-03 at 11:59 -0500, Sam Protsenko wrote:
> > Hi Andre,
> >
> > On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszi=
k@linaro.org> wrote:
> > >
> > > Accessing non-existent PMU registers causes an SError, halting the
> > > system and rendering it unuseable.
> > >
> >
> > I wonder if this issue you describe here is similar to what I'm seeing
> > on E850-96. When I'm trying to read these files
> >
> >     /sys/kernel/debug/regmap/dummy-syscon@0x0000000010020000/registers
> >     /sys/kernel/debug/regmap/dummy-chipid@0x0000000010000000/registers
> >     /sys/kernel/debug/regmap/dummy-system-controller@0x0000000011860000=
/registers
> >
> > I'm seeing "synchronous external abort" during regmap operations
> > (judging from the backtrace). Do you think this series fixes the same
> > issue on gs101?
>
> Yes, but for the system controller (PMU) only.
>
> On E850, it appears to be the same and there are many holes in the PMU me=
mory
> range. You can confirm using debugfs by manually skipping invalid ones, e=
.g.
>
> dd if=3D/sys/kernel/debug/regmap/dummy-system-controller@0x00000000118600=
00/registers \
>    ibs=3D15 count=3D1 \
>    skip=3D$(( 0x28 / 4 ))
>
> should give you register 0x28 without SError.
>
> while
>
> dd if=3D/sys/kernel/debug/regmap/dummy-system-controller@0x00000000118600=
00/registers \
>    ibs=3D15 count=3D1 \
>    skip=3D$(( 0x4 / 4 ))
>
> should crash.
>

Thanks for the details! Guess I'll wait for your series to be merged first =
:)

> >  If so, I'd probably want to adapt it for Exynos850
> > later.
>
> +1. Note though that a custom regmap is used on gs101 for the PMU in the =
first place.
>
>
> Cheers,
> Andre'
>
>
> >

