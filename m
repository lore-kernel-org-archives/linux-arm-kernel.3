Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1D8D68BC8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf0zb4VfVYz2bFnhNWmndenFn6+Q+jSFdMU6+/qUZVw=; b=3J2OEqt7QVQzJuNhJzhmOr+HGh
	RYtdW5vbGb0DNSkrKJiy7PMHEyJyO1VfrVlgStRY1SHQtbVvbTzsbxTsArACR4x0JaxLCXbwko8vk
	pieN12YB2ZqfkOYaC6lllYZ3YofIJh54+nGwBLjrylv3QRGthmn4e8xdG6ltRkM8oxDAuLHpZGQbG
	HRRVIs2yw4Ja0IRnM2SzWhNgjypPCrKJqVIi4WXik1YG9DQ9ZFSRKwC3hZpUZEXkfv2jLyDR89Apr
	RDN3II5bTgfM7EW3QKiIiU6D2eVLdn+uSwBWtvMpKK1X7CkJr8p4zr5vBbjkUvo1nk6TNGzM1wq60
	ZKyYV+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByzr-00000003JHz-0xHE;
	Fri, 15 Nov 2024 16:16:35 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByyv-00000003JBW-46I9;
	Fri, 15 Nov 2024 16:15:39 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539ee1acb86so1974564e87.0;
        Fri, 15 Nov 2024 08:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731687336; x=1732292136; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qf0zb4VfVYz2bFnhNWmndenFn6+Q+jSFdMU6+/qUZVw=;
        b=ClkSZpGsMD6CfFNW5M/xm3pMz7/C3BMDLxWmWxZcyc73KQ/rsBd30iAQtiFTECbnQU
         vSjNAu7mvhJaUxz5H0p8tsoH5wjFvkgVLVffOeISlFheDne5NUDYAL9zBthfPg2zg8Jw
         UmmxXdMy7/iLJm1Z0yEUaEIeOfKxPpe3USw1cG7hNPVCa0COZ2mSNlkHgZhNaK2Mbu/x
         LV9GuO5Tz6Z+1L6eazrK8xMkgZ3TNji+ELQQ5pcfXg+xL0g0qC8IdxhduoqVGXR8KRFK
         h/9hiCtmwOrC9iVpvwhT2gyDi/WCpif8qKAwut29Onb4Gw4kLPIZCSgZ011gipvYKGo8
         w1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731687336; x=1732292136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qf0zb4VfVYz2bFnhNWmndenFn6+Q+jSFdMU6+/qUZVw=;
        b=UhNSaABZzktMMnN2f9peRdz6ntqDn0Dr5y5t7qnKpkpxwNTEfXNcaRNMF6ReezOyqZ
         3bFiaw1SgRFnX6Sa+MM5FN6zEG88SbKOPutclWHw2ecOj9XM16EcxEtzEMpI7gg8zlGN
         lXIHlY/DBUhab9bsyRimbxQvD2SlCKcAKz6OnKYa5wfGZ5nIeoTe3M1hDJrwKAbxaJlF
         0ts/USYwoyEWVhIdOSPVorLgEshNJ6XKMPL6xHsI7VwjKxn3cLxUDE/GB7NF2QTx9lbT
         oitIemVbZOZb0L3vT767+8t6+yCR3gae1a4zqzlcRU15QvDl97Uw4jLApbHt7q/vpM50
         ZW6g==
X-Forwarded-Encrypted: i=1; AJvYcCWH/Wq2+AgncVSuyC7rW2YobZqDxEBcvrcX8G+Ed1qTEeChh3ySUZhLk+ZYHBWtI/ORzi7vUIWT4jzpVYVrJow=@lists.infradead.org, AJvYcCXWTGRsSmXlXPD2agkX+6hf58Qe7GbvpBzthvj4WDvud0nDpUV9T/Dpr6gygnV9A9IerHRhQ6yGZwNv8vmFk6gw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8o6lq+KyYBo4z+54ILc8D6dj87nVNqf6BHA1MQ4vlr69NLoru
	Xs2SOZNd04epudbq/KdnzJMyf/9HFimNS9OElnE6zL9bS83MJ8eqi2aHWtYEaOL1aR7+joTRFkB
	5L8I0lFIp+DfvBa2lN6fboTVaIPI=
X-Google-Smtp-Source: AGHT+IEMckUqroiNvqBAubYUa6y/ZYk5x3dY2AgrwbVdsf0BF7y5A7gqM/UNhT4Pfc3C7QURedxq81KHBe0chgKmZ/Q=
X-Received: by 2002:a05:6512:3e28:b0:53d:a6c8:fb94 with SMTP id
 2adb3069b0e04-53dab2a2213mr1563377e87.28.1731687335399; Fri, 15 Nov 2024
 08:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20241111045408.1922-1-honyuenkwun@gmail.com> <20241111045408.1922-7-honyuenkwun@gmail.com>
In-Reply-To: <20241111045408.1922-7-honyuenkwun@gmail.com>
From: Marco Schirrmeister <mschirrmeister@gmail.com>
Date: Fri, 15 Nov 2024 17:15:23 +0100
Message-ID: <CAGJh8eDdj5zwENGWHHdZt8ejdVZ=d4GTNzW57rohyL2rvEA_hg@mail.gmail.com>
Subject: Re: [PATCH 3/3 v3] arm64: dts: rockchip: Add Orange Pi 5 Max board
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_081538_018560_0D6AB4AC 
X-CRM114-Status: GOOD (  12.45  )
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

Hello Jimmy,

On Mon, Nov 11, 2024 at 6:01=E2=80=AFAM Jimmy Hon <honyuenkwun@gmail.com> w=
rote:
>
> The RK3588 Single Board Computer includes
> - eMMC
> - microSD
> - UART
> - 2 PWM LEDs
> - RTC
> - RTL8125 network controller on PCIe 2.0x1.
> - M.2 M-key connector routed to PCIe 3.0x4
> - PWM controlled heat sink fan.
> - 2 USB2 ports
> - lower USB3 port
> - upper USB3 port with OTG capability
> - Mali GPU
> - SPI NOR flash
> - Mask Rom button
> - Analog audio using es8388 codec via the headset jack and onboard mic
> - HDMI0

in your v1 patch series you mentioned you do not have access to EMMC
to test. I am happy to test EMMC, but I had problems with the v2 and
v3 patches.
v2 dts did not compile and I was getting errors for the hdmi0 entries
like "Label or path hdmi0 not found". I assume I am missing patches.
After removing it compiles but the board does not boot.

v3 patches don't work against 6.12-rc6/rc7 snapshot. The patch that
modifies the 5 plus dts fails. I again assume I am missing other
patches.

If you have some info with which kernel or other modifications I can
use your patches, then I am happy to do some testing.

Cheers,
Marco

