Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDACCD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZLjE0blDgs8rIXohnrgIdGtGyxBNGZG1NuH9Cx+4Uk=; b=Fi5DCz3fuDhTc7iQwxyWclcloV
	SNUio7XqCV/uHoJ2RtSEUlPcXUM03tDxYqsG87wwT3pkrk8odQgzi4Xgp7HlCLmWaAHt6VNH7v1i1
	7C8SDTq575DTntesdDXlACsBvkWvSx3iTc8J89CixqaPvm9kF5vpinpg9V9biFygWaw8OeQycroOP
	YG3tl0XSzMq8A9mVL2GbOkCAD08K6MwbTCA+hFCk5n/bB0L7PGSr7Ys+hjV1NpLj7VNO3sUw8YOc8
	F844Yl/EwK6WyrE1IgWDBTzAJNnn+SjdsH6BwdLbxcNLpUnNJEps5sn0WP3O1XlEVaqjV8IjHH+Nd
	Q0aOLI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoUq-00000001a8S-3vTb;
	Tue, 26 May 2026 09:54:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoUo-00000001a7Z-3WZ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:54:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D840544281
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8331F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779789285;
	bh=1ZLjE0blDgs8rIXohnrgIdGtGyxBNGZG1NuH9Cx+4Uk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dxo6ihjwxavCdVOP1XWBGE+CkJ5yd5Rv29vX2ChuIA1yStvCAP5yhZmBA2tSp+SLN
	 ZGYgq6fL8aF//hkfq4hea9/4p6nNiRRn1dd7RvQhkgriGbpd7AYgtf8nzrgv54pEkL
	 FtnwdVnuu3caxpfCEQ5XLQ6YbK2i9zWas0+SvodAnE9U43wB2ibokvXXHXRlv9SFoj
	 2ws8LUYedbQAAdtLXRPngPkW+VeYpO99ar7J/DGDCTnuVY6GIPrlTa8o3e2rGupwlQ
	 AgNihSRCENfYI7yCxNdbQIm2fOyl9OJ1LTb8E026FUtVnmeJo9h/IGPeMYHcSj1nox
	 wt4ZOQCcbEjmg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa1b2327c8so11967024e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 02:54:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/tTe3+HN0/3mQmQiZU3tQ9dwVkffwwaXJCAfYnGnJl6Q+T59vAJkIesC2dYiAqPE87cZOGyeW8phawUewyKw23@lists.infradead.org
X-Gm-Message-State: AOJu0Yza0IGj1Mki2j1V/EOWCGi0JVvXb7pgulgJ+HVgY5DU2sAGvf/2
	tO+uVGTKHGHt5bSI5C4mPqKgMv9Y+z2W74/z6sLJ9dR1HKu5y2lWBYMfs1Ieq1ICWdie71NHVmg
	DkYcYdqoB4UuaQj0Z855W3XI+og0jvzQ=
X-Received: by 2002:ac2:43d3:0:b0:5a8:ee4c:8ae2 with SMTP id
 2adb3069b0e04-5aa3237c1e2mr3443175e87.30.1779789284401; Tue, 26 May 2026
 02:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:54:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0NVSdZ6jMprK0W+5h8gSoxjZRNqrHmfTSMPf0obTnJA@mail.gmail.com>
X-Gm-Features: AVHnY4LigDhYSCnaPwhQTYPGRYJs6hffPdPcGze_-mYukq-oq5Xsx1gQevrGyvU
Message-ID: <CAD++jL=0NVSdZ6jMprK0W+5h8gSoxjZRNqrHmfTSMPf0obTnJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_025446_933411_ADF0168E 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, May 18, 2026 at 10:26=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> When the system transitions from bootloader to kernel, the GPIO is
> expected to keep driving high.
>
> However, the Linux kernel first configures the pin direction and then
> sets the output value. This may cause a brief low-level glitch on the
> GPIO line, which can be problematic for regulator control.
>
> By configuring the output value before switching the pin direction to
> output, the glitch can be avoided.
>
> This commit fixes the issue by swapping the configuration order.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied as non-critical fix based on my gut feeling.

Yours,
Linus Walleij

