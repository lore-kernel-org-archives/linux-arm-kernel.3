Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769BBCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZUL55pfekAnXESqd14ABzPRjbkHUYXBXBngBC6u3ko=; b=k2TSeZWH8QyYr8/+ezb7/1nfRe
	A0pwOC7vmnj/ZNCTCZK8Ff1b5mi+y7OnMMRvOFOqToCg3op+U1DIoU2NmYXIp7xZXuXf5jSl3Ioq/
	L/BRJJSCb/nLQUzE57vSE72h5NvnDIap9OnwOII9Pvb564FFMWk7EupZpEpqBuUldwbd37KeFUI9X
	P6DFB6OtGGBRnLHVAMsiBQO2XNUNjd5DCjd3NSNCYrehZ5nI+MoAfTjs7KaZMqVxPmdRFhhBY9f8V
	IjPl88TqmvqsioH1RxCeV69tRnYqtFWwDWhWdtaWM4eiG8mV3M+ErWAtJRhVMPZ4ZIPOZBNp+S/+k
	c1BgdMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbDp-0000000947p-0L9G;
	Thu, 11 Jun 2026 08:57:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbDo-0000000947i-218W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:57:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35F3B44244
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182F71F0089C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168228;
	bh=DZUL55pfekAnXESqd14ABzPRjbkHUYXBXBngBC6u3ko=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cx8nueHu4fYirKSLCXETsXEVv1xXfDm500rY3WLLSdyDbQhSYqJmUOojpbivEE/CT
	 vBWo6FlB+FwcBjVJ2fxzU/tv07PbSafuRUsgc3+XHWz0XOs/OyAIts4l0VVVwXoBBx
	 1nlR+LTv2okHUf/NrrroYh3AP6YF05JtVR4/JO/ZBE/M0DYnVaP00cDcRhTm8Xz5Ur
	 MeNQzpGLEOxsniUIR5sxT3BT9GuN6+WFJLRE1fG6cLump1Q3nhpsCvUttR8PjSnUGK
	 4nJzgjsOX8+nFt+hqulZmzXGi+eFB7TN5QShe60fODh3CZN25IeWzOOFy5xJHSnlh/
	 spujFhoK32ejQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-396771119c4so77016721fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:57:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9xUR44NTBrCNn4QmuiCD+tLZjgEr98zcVZEKqU8QmrQuZVGsQpmPAZr8m3/rTj/qiRK9+xWH6zGXRL5zjwrded@lists.infradead.org
X-Gm-Message-State: AOJu0Yz75thsvC7PfDzYMCKye9zZ+Un16aA0ryazhQW3s9buFWHKmCQS
	a6111KhO9P9FUvOtZsDYP3I9S3fJfujZuwCIoVCVkQ+Fn3lt17xT9VGQMzxPw+N8quSTCZU883d
	vw0ywTowNVjDgLEBX3E+18keVdmqU5rRn27K1lQmLkA==
X-Received: by 2002:a2e:bd88:0:b0:396:954c:3536 with SMTP id
 38308e7fff4ca-3991a1d57b1mr5490001fa.28.1781168226843; Thu, 11 Jun 2026
 01:57:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:57:04 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:57:04 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610084053.2059858-9-wenst@chromium.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-9-wenst@chromium.org>
Date: Thu, 11 Jun 2026 04:57:04 -0400
X-Gmail-Original-Message-ID: <CAMRc=McEd7HbUsyuqM3tr6Uu6Z2hSmL_hMNXgCOT-yHTM2FAqg@mail.gmail.com>
X-Gm-Features: AVVi8CfiEyvWm7heKsTNAZ-cli_fcxMC9z08AYGILVkLB8mgt-RjTQC7sfys9CA
Message-ID: <CAMRc=McEd7HbUsyuqM3tr6Uu6Z2hSmL_hMNXgCOT-yHTM2FAqg@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add
 port for SuperSpeed EP"
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
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

On Wed, 10 Jun 2026 10:40:42 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
>
> mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
> (SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
> The SSUSB controller handles the device or gadget mode. Saying that
> SSUSB handles the HS portion is wrong.
>
> Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Maybe put it in the front of the series?

Bart

