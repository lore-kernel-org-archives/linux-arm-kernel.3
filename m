Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF66C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJAWY5I+EE7ypsQMmGeF7ePDs3+5/nc9dm1EvLwWSd8=; b=doSAgqw0QmLhiQ3ABXWRs1jTKW
	KCcWYFgTT5T49/ve26VlGuZxD0ng78kdNzQKPOkT9egVw/fqCz1ISaU3YPKLo8iWYHhen9gh81G+V
	r3UNNiH3H5VB4RNcEtt48mOe/9fPiGbzPJEw3HOFqYDHlBVIB0WqvNARbQgskXWenkNJ8UgIHLjj/
	2D4/vWjlyOzTXnds0Le6zOJXkdIx6UOIoNw6R6h8Fko23PfDsc9R+JUNDbje8JuYywBWHS9GIyxyk
	XbQrxIMzu5U5wOf58Qr4HchY62bpl0n4qJaZqsv38EfLS87XyZtxtpYvnvEz5RwMPK6q0g23/Zhoe
	PpWEnKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6TR-00000008vW3-1ezU;
	Tue, 21 Jul 2026 09:09:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6TQ-00000008vUn-0iSG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:09:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9343F60A9B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DA21F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624951;
	bh=jJAWY5I+EE7ypsQMmGeF7ePDs3+5/nc9dm1EvLwWSd8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=foJLZx2IuPGexbJUlKxQfk3MNY2hO2lFMjD0RSceNM8RULTHr4+o/wqsxvk6DIN9y
	 5EMoJIi9qFWUvo6eCQ3RU2QKmGxty1nssDEOUVW0NBDgP0tEZqitllWU92bL+ol5j+
	 jg/daGT6XERjIfctGw1bMlNIDh9Mc/4sNP7F+qXWBlV2hVazImQqf1PsZwSGzOT9rh
	 09JLrururGcpRhAvU5e5XfPEjErnhW3JGm8U+MLPaNPzh/BcSiyUYXbB+gHnLbQsKQ
	 553dfAT1SWrjh3e506iY1pDNGi53cfxNlXn9WsG6QFJR4zwbN7BHj5beils/2Cvioj
	 x4nQMUNJBKHuQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c95395230so62313381fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqrS2zvdWX2UA6nPsO6qa4UkzKcLlTEL9PUcgx3fiLcIo8WCCt9mWxAHOtmu9suIfOrNu+Sl6b8KURx3SpNIj5T@lists.infradead.org
X-Gm-Message-State: AOJu0YxuLo7eGwehkDKRyVcVCJs315sCjMzbMzaH2EA0OcvzHQztyTrM
	f38GwXaQW5UZY2YQ6rPJ6CopzIC8AaJebVVU7pE1Nw13trZA1ChdT0i5oH4Y1z5VR6esRZyenK+
	hgU/Xt8fbCGedn5CRfS8aRJJ8+j7Ktsy0wokCnsN5vw==
X-Received: by 2002:a05:6512:8054:b0:5b0:d25:fa6b with SMTP id
 2adb3069b0e04-5b28f9aa2acmr2799921e87.33.1784624950061; Tue, 21 Jul 2026
 02:09:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:09:09 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:09:09 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721065413.2306137-17-wenst@chromium.org>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-17-wenst@chromium.org>
Date: Tue, 21 Jul 2026 09:09:09 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mfv7P74+cpvmHaF=aSYLO=RtFbxenJHMrCjgOMoHuLvQQ@mail.gmail.com>
X-Gm-Features: AUfX_myi0Upu0FA2vAaH9dLIsivFKjcILpMP1JD9Wz9GpUGoO5swX9n-_RCCXGU
Message-ID: <CAMRc=Mfv7P74+cpvmHaF=aSYLO=RtFbxenJHMrCjgOMoHuLvQQ@mail.gmail.com>
Subject: Re: [PATCH v6 16/16] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT
 as M.2 E-key slot
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 21 Jul 2026 08:54:11 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The MT8188 Geralt design features a chip-on-board WiFi/BT solution. This
> is a M.2 E-key WiFi/BT board layout directly inserted into the mainboard
> design. The connections to the rest of the board are almost the same as
> if it were a separate M.2 card. The only addition is the PMU_EN pin on
> the chip; on M.2 cards this would be tied to the primary power source.
>
> Model the chip-on-board WiFi/BT solution as a M.2 E-key slot with PCIe,
> USB and auxiliary signals. The PMU_EN pin, which enables the internal
> power controls and regulators, is modeled as a regulator fed by the
> pp3300_wlan regulator. Since power sequencing is now correctly modeled
> using the M.2 E-key slot, drop the "regulator-always-on" property one
> pp3300_wlan regulator. Also drop the comment in xhci2 saying "MT7921's
> power is controlled by PCIe".
>
> Also drop the voltage range on the pp3300_wlan regulator. This
> "regulator" is just a load switch and does not provide any regulation.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

