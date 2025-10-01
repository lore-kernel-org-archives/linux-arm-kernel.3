Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA763CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=; b=XDCcV/JIyADBAkD7RyDEZ5gyaC
	vQzalfA8N9iMz0/dSPjson7I4Hc9kZ/2OEnXP3Dd1VTouI9JBJZWPXHHKQRHWA0FKTyYaBC6Xip4i
	/DnxwUzjl5n0+e9iEkOYFVof5MP1+xFB7QV3WMt3oEOKS3JV2wrpKXOTNgugIbDff1h5b1pFmT3U9
	1GDmHHI0RF3uvyu7dXGYFITW6SpTrKM4nyiNSQlzaynBLv1S0HmVgpUqohsIiZydi5gizModKwE6L
	R/uiGdXUyHJIs0XSD+1IZ6F0/Qc/sf1Xk3MRhg3lYBbMHxfEJ4n6HYn8zEMHoKR3SO3hp5U2g+HHg
	GefvibRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3q6s-00000006mdP-25WS;
	Wed, 01 Oct 2025 06:14:42 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3q6p-00000006mcw-1ri6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 06:14:40 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso5675032e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 23:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299277; x=1759904077; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
        b=ujRsZF3BX+Jzq+e7+FurokkgcpURYClmF9k3l5jflRc0rInE308S0oi3UeHqgUG3RW
         6DGqRnsoP1cDOLldIav0jyvD7nv485GPDmHpuvXJrFEWe/B9XGwf+wirbuo9bU073cS8
         U5/VbLdN4XKCWmECemlfvDl6si8ewkp+tswSrMVKhofJ5TfkzQn2HN/271vdZIheUtr8
         5LjmXgKbIe1qAJ4SM7hXYmjTBYavZiRbfTFvjbUIloz4R//Lg75XAIOtRWatKZvpCekY
         2eDK1SQCkqBNjkhZJ4CrSz3/jxahKBUokd62cPYsMXNprhZ/JqLhqe2igvvwlqIGBw6n
         sPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299277; x=1759904077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
        b=VIBjlUl7bO77vvRVsHIaTW//X2NvpwRV3nB7EHycK7KBu2CWXmjRsG8Ikf5B/vsApH
         evsNmuw2JYRSYmziH7pd0Wr4nJQrtPtxgf6LB5PS2lJM+4LhvlZwT9UxZtFsxX3Hlrkg
         BDyiWPwqQA9EVoN77dpeMNruvNGUr6/YC6+3b4ksmmRww9OGrPVDuCLC8H4x7pHW70Tv
         lwfhfsQVrVS5jKQYEy7pO0+xSJdUpzl73Wu8IQLwOqF4SaSgX4b7uXYWcY/zKbiXwhXS
         7UCzRiBoFEQVjYBgSMNwvBijYBcniyy9yFXRwmzb/41EJzj2DhgaJlAiEIoGPoQTiJzN
         sURg==
X-Forwarded-Encrypted: i=1; AJvYcCVz+s8URFpcFDobqVN/0ISvrDnPC101MVN4/lSVIjQ+CetDI5ScIip7RbMTRCIEpR+sFTfsDI2Hbp8OCserLIFa@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw3qMfZ9cfKoGADJs+AqSagdhQwBsoXaCjVmLQBzYMxRgvY3sY
	D+Bx9pwgq1UzA87pCA6t0cX3t854PD+l2oJ7JDwEaGyUZUV7L/pOsYXvUQyaa396orjiWemAsk2
	7HMkOpgy3fonSoOWJKLvv/bI7RGeCwAtmifkEWywT0Q==
X-Gm-Gg: ASbGncsRrzHbjOypzdA6PvxI546sjEmwPPsBNfJ3S3K6hLRLvdgBuCUhFfFffM9U6XN
	uOkNs6nV1JjKZoIJHnaRBkpgkNTtBkxI+KTfgUBcJAsFTsL2E1IFGxcLBd2/qgAX/C3w6YnCkWo
	PHeiT+Fl4cHMmot9oh4t4bWoSn05N3cFVPulPcXFN2A4y5GE0VgPuVTaFKJZiPyRNMAHl/nEoKL
	+qraeysjQwGabjm0CmUPvkw5WkbjEw=
X-Google-Smtp-Source: AGHT+IG2GQMXvM5wXsx6CzkWWALkmKJo7n9m32peMSwizZiLBt3hdl4uunMSSjoXjLkgjaoaZY2YYv9fSHpGi6xLHvU=
X-Received: by 2002:a05:6512:12c9:b0:58a:f88b:25a1 with SMTP id
 2adb3069b0e04-58af9ed287cmr658282e87.5.1759299277410; Tue, 30 Sep 2025
 23:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com> <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:14:26 +0200
X-Gm-Features: AS18NWCsR4raMo4wbunxRFTWZtDHnEXvF9gNLQU5m7trixs7xTJv_rQ_r124Pjg
Message-ID: <CACRpkdar_4UR-HtBb88dKLWbaM-p_vx_Z7RBEg5szPTMbdLN4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_231439_490960_FEFDDCE4 
X-CRM114-Status: GOOD (  11.51  )
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

On Fri, Jul 11, 2025 at 1:42=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I signed off the patch and sent it separately to the SoC tree.

Yours,
Linus Walleij

