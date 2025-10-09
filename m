Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AE2CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=; b=1Mr+hMYWSOzSKAYPRYaCaVQVHv
	WzFWQiU9H8KerdF6IZjKUJV45nRCGFnse7s80+jI7Vkv221Zy27pNj5psExL6Nwm3NENJCuJkZ69E
	UlgjnYweQ5wsJEO0TUdOU4qjGPcio+aTOVq3/HOdf8SVn9W/FvnKG/TKe6KsTPOlJHlZqCtlHoIKy
	OJk0KLZZodbUpvnNojC+gSSbLkkFlj6fhiswcDLdcn9Vi3kFMLELj1iLW46A++GJ7xMBcoBdDvMh4
	OT60xw+kNwW1mEsJmABxxFZwVHGr3DYFEq5Fus7EGIWSH3shjnnu7CpHeJH+q1xOxWtgxnRlGtUaf
	7TSIus4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6m5E-00000005X2h-46WS;
	Thu, 09 Oct 2025 08:33:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6m5D-00000005X2B-0vYd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Oct 2025 08:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=; b=QoVB7ByC4zpMgt0pJSKvGMQZHR
	ijDHQWf1N9rtiHwDlANKVj/2ODsBfoKVfeLmUJwsXKrLb2UzB2lJlMVYxPOnDtVc6MC3C3oDTEEF1
	U9bNMtDoOaFNqWKZBjFu6PiV3f5UNQQS7l+luD5I/7gqBJ0Tf1WeU7OuBD5r1ySSg0PVWKGb+fljF
	KTMYgDScye/YJ/gPUcnPUwHoGTV86G5Zb5vZrfGuiApUzQG9+N1fdsAfZkT3FHIcaxkaMVAmyme6n
	JxqV2hREdSD++7TQK/D/RxjphzMl+Ml2Q5JqjGO9WqZZcc1Fg0Ln2hgDHLJGmLq2vs7MOk/+XC6pp
	yTFvfPsg==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6m56-00000001Io6-2k5r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:33:05 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-36a6a39752bso6165611fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759998777; x=1760603577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=;
        b=SdwdhZY5p25yZwhH+Z4WbALFfM6op68On569Pxe1I0+7b755yfQa0W8hbO4SWzQyKn
         jnPhJcK3oxknTrfvDb1mepzS24nsPA+yYJFWXDI2KP66VNilJSABNJNIIl8QjxClXFdO
         CRMa0SI33pjdKT/vWyzxuNfsUj3BXGIpuxUhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998777; x=1760603577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=;
        b=Yt1y+IuvdLQDeHeTra5fwE1xC4WR8JkHFl7y7ixBSpEoLYtAZAleGAuk/E1LGxY1lY
         fr8jaFB+Kor4M6Le5i9yyg5YkwiBjBCvYQIP3WD+V5v/pSarrBLP13NuxUfQedpeXpKa
         XJaZIi90k3j1vvQEluZJF4m3mqnMLU6gqz5QXQBcQDkCdRpeut8N+anKoHAZpfJU9b2F
         UNGVDlP/AxPSPGN9Joqjnor//4i3+u2mZXOZ65JP9O9i8USJayi0A0vMxkDpKcLDGy89
         C8yV1nZX1PRLBjdkq8hO6nYygQ2etJpq7UBF2GTTKSexZ/Tvk740oAnIkIhdV7jpOEt1
         QBvg==
X-Forwarded-Encrypted: i=1; AJvYcCVkGzV5HYSDuk3kob74wTWSe6pVUZ7HK9rC1jYpn9OOqZJbQPB5Xj/qnUqYuR1RJssDEw0HebO0YwGGPpKjspxJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgVSvFdKi8u3KXlF2ZxcbvKjaJP4RVdZ1oVzMXM/5YUUq3rUY
	MhhdvIX7XEzi9byMVtxVrOVY9b68TioCQr59MGHtcopJfZH+HMcNgquUyXEdIXE1mA8inLhB9F0
	NxekuIcg3le9iCN3ei9z7WvYMGK3msrMJS1ZhmiTG
X-Gm-Gg: ASbGncsqPkRKar1sU2NxsKYt3jJxAdpkiGC0lzJElSJOky0UC7LMiiF+Cl+XvBIX/vB
	3++ll3y4z2SQ+1RxclQ/CvyK8sx73+Ex9QuJVhgalRd6x4ne0v+nREca6EaNCu2aEYzVekmT8dg
	yd8DWrMQSVp2tvrBZmnXOcgXAvIhlx1BiZBkeBSmgdomxKCw3+QhgegMk36DD/dM5NZCU/uclEz
	nSTTXzdJkxjhrDUhmvJG+3LleSJcXPIeqt/UdGgHm1qK+g40TPavq/Ng9yHEA==
X-Google-Smtp-Source: AGHT+IGNqC+T82k2UhLGhs5Z+RJRCLCjdXUj8T+fy/dwo+JYeZAn+ZeihTGmoYgDd/1wSNYOMWZ3ybZyqQU5hYgcf5M=
X-Received: by 2002:a2e:a99e:0:b0:36e:93a3:979d with SMTP id
 38308e7fff4ca-37609d52442mr16172291fa.19.1759998776858; Thu, 09 Oct 2025
 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-3-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-3-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 16:32:45 +0800
X-Gm-Features: AS18NWD6JVU3Hv0pwNvYA85CDPCr9XWrThP36lbmILYiActB6r-bT0qxLSR0NtI
Message-ID: <CAGXv+5G8XMRGasd2=H_obsLJ-97M-cNPDo3BJCrwhx2+GHhYcA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: mediatek: Pass device to clk_hw_register for PLLs
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_093303_900572_BF342D94 
X-CRM114-Status: GOOD (  15.12  )
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Passing the struct device pointer to clk_hw_register allows for runtime
> power management to work for the registered clock controllers. However,
> the mediatek PLL clocks do not do this.
>
> Change this by adding a struct device pointer argument to
> mtk_clk_register_pll, and fix up the only other user of it. Also add a
> new member to the struct mtk_clk_pll for the struct device pointer,
> which is set by mtk_clk_register_pll and is used by
> mtk_clk_register_pll_ops.
>
> If mtk_clk_register_pll is called with a NULL struct device pointer,
> then everything still works as expected; the clock core will simply
> treat them as previously, i.e. without runtime power management.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

