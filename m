Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436B2CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UssLPOno9XWeKCQGJZY3GRGKSjKPPao4Ev4zfFKhM8=; b=uwM/lMo5gyNfDJ
	JmnSjwhvcWH21Yy9MSguFaK9a6+ZBYcvCJbrCrkL8OEjqj2TnMYK/k1kvE7EC1w84I4mPXPNsdW7K
	DQIbQUNe1bTW6jQoB6SGws3VA3Jnil//i48FQRyldwMp/qIfSiPNzv3ZuMeX8YhYf6cYJO3CGB1Tl
	bIlP7ki5d3L4JjE1YvqUbSgUvGGPLsCeEa/XVMGeivhvgybGigrt4a452yyB9FMnVHr7qq5EadAFd
	7jG1b0fGvHDDJyHKnjStRQK+b3XtOv4CdwBKd/8K3Rr7T3C9phqYz45CmVf8SGI1L080c4xhuBUda
	U6hVv7PfjKI9GjVyCR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ksl-0000000DlgH-0NM4;
	Mon, 13 Oct 2025 15:54:43 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ksi-0000000Dlfu-3gvg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:54:42 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-58d29830058so5384718e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370878; x=1760975678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+UssLPOno9XWeKCQGJZY3GRGKSjKPPao4Ev4zfFKhM8=;
        b=TjUxwwcSCwqXyUpgKlBuW9CbOw5MvZwaub7mBMl2Lz7934tQfp57NuJprP9EAIuvMc
         RkHJfE2YxHqBunpbD4LbfXvpZwcGUJ5CmpzcbZR4nsoSDiGY182XwjnLzsmJzrVr0PWM
         S5ba5rC947ylMIdyci7rsGZum2ekV4PsCrpaMkFuR5YCgkyZ3/IUbnjjfbixMxiq+5wf
         ejYNBXjem5PTKxnx9nLEwRWduVi89EJekqTIlwL4JLgRbuYkPTrr66MPdiRPNoRydQun
         JkXyitwFE5fzQ9SB7eEBKHswT5of6TxsuNkeuSpkVWVo2jzLzMdsQoPg4M6Hk/bVtUHk
         BAYg==
X-Forwarded-Encrypted: i=1; AJvYcCUz3TThet242lexqqcB1DavcA4Bf1r3syQrHeUrWl1mdgrjdpGrhSLB0Sn0qlHzHkc8pVf64HI+AJyiMFlMQmYc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/N8eOMj/ADMlAAA6JhbfVLXbqGADQ4CNgeP4yMLYh+EYTZput
	7UAgS8J8C/8O7XFOW+3KHznT6YoI/KTx3X4EqVLUqYW7dxyM3W8wvHn0d/fqZTFq
X-Gm-Gg: ASbGncs/z0P/ah1jg/iWlOnUaCJb/3Uj/El21xkxP20yJ2JrQIWitz6xLp9RUvWdKzk
	Z/+qaiJ9A2M9lLbQAUV0aGNE8Kjk54NTQII/jFwu/5nojcjbgy5Gt8gJ2RNl53/D/1x4AKjPSRs
	L2me1X1RCuUw8923PPpOtBdksVP1QWS8MxPDkVaORm4tRWc0OcNzmfoHWAYIh0IkF2FC3tPxBKa
	VXFLl5jgJpkT8GB7byU3bAsxzzTXcgDTS8MJENh0E7W8ISsPpCAtLiL2SZ2KZy20KJMFCKtYHvD
	u77mCEoXYrMtobIIRV52OUzBq8pbivgdke9XpX91ftNpY3ox6PVPy0hGAt0TxQoLyfJoZbP5Xk2
	8MRjgKefheMdxjVkxApdF5teJKkSH1kqOXqYw5hpCh6ylv/3blCTJSTlIYhxDgpIM2KZjcUqbD3
	3D4j4t
X-Google-Smtp-Source: AGHT+IFHUkgFQ4MbdJ7GoDYANwXQ+cCqLvF1GJ95SraiXLeztPLurTAJdmtdvc9EQtFbdYjc0N/YcQ==
X-Received: by 2002:a05:6512:3b86:b0:587:7f2d:2577 with SMTP id 2adb3069b0e04-5906d9e75b4mr6139461e87.43.1760370877550;
        Mon, 13 Oct 2025 08:54:37 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590971ea4easm3118797e87.53.2025.10.13.08.54.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:54:35 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso5084834e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:54:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOydEQn22lYDHPeaY/zHWlnw7XWnGcNSDPQHwQQxRB93ePwMSgm4z+iwo7faKCg8glQzeXgqBYmf6MlijxJ00B@lists.infradead.org
X-Received: by 2002:a05:6512:3e0e:b0:55f:71ad:590f with SMTP id
 2adb3069b0e04-5906daea8f6mr6270458e87.53.1760370875744; Mon, 13 Oct 2025
 08:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251013152645.1119308-1-richard.genoud@bootlin.com> <20251013152645.1119308-3-richard.genoud@bootlin.com>
In-Reply-To: <20251013152645.1119308-3-richard.genoud@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Oct 2025 23:54:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nojdOfU5oDOCTDummqpcXYuu5665MKJRee2-QfhS36A@mail.gmail.com>
X-Gm-Features: AS18NWDKdIBd1rTcxTVsXd-_vXNa-9kC6YbGbqd54hyWKYs7fg_lZoQPdbhPU9g
Message-ID: <CAGb2v66nojdOfU5oDOCTDummqpcXYuu5665MKJRee2-QfhS36A@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_085440_919247_B9F73027 
X-CRM114-Status: UNSURE (   9.94  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 11:27=E2=80=AFPM Richard Genoud
<richard.genoud@bootlin.com> wrote:
>
> H6/H616 has more ECC strenghts than A10/A23.
>
> Move the ECC strenghts array to sunxi_nfc_caps to make it ready for
> H6/H616 support.
>
> No functional change.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

