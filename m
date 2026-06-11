Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D8CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaWx8ntXsuM96Pn2hdwxwXAPPKnzorenweIrZzy4GK8=; b=QSUqc4LuIpRWYA/qA7Qfr879Ty
	A/mtUwIsKCKmi+qckTe4KjdtjxEcqw7lbVHpWM9L4iMqBDCQ5rVyVaN4ADVAeZGvvsejxqgxlhdKt
	vJYpstFNHDdQ4KebPp7vxrAY7QCBWNtlnMJ/4aK5dvlavyVVzh0mIk5Kc9laYcvQaGPZKLgnGA0z4
	XHf+oOGglcgwTtT1t/o4A+DNWvhoZWppA7YtCFJGg7+6VNdvI+vZS8HHv3SLmTdLzLVYEU66xu+KG
	tc3gQwTXYqrzzXWxsfZDH9F0yTYK9Kwo6uZybjtWjlT51dWvoQg8yG2pjDwKqa4XmfitAu/vLl7vp
	uC7/fCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXabs-00000008zJR-3JXJ;
	Thu, 11 Jun 2026 08:17:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXabq-00000008zJ2-3Irr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:17:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C75544272
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECFF1F00898
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165874;
	bh=qaWx8ntXsuM96Pn2hdwxwXAPPKnzorenweIrZzy4GK8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ax9Ae/gZHGie3gCb7JuI+NSQ7kHM1EM/qVFJxb9aiciImMjST6c8o4cvWd5PjHPZR
	 uvlWZyjcj+1jBOXZjE6f9Ba8KlQlCsw3LEZ1hNXrr9UNGe+OsOSmAhKm5JovN14xeV
	 b7HQMQzLknvP/w469emCcWdYGQsdjKsy+Z5ZKRt/N8Y4tJSZiTFjafcXoLHsryuHhr
	 6phpOMgR0i/eWnpNpDbsXI6evj3LdC3Jw5bsUm8Dezhsb5aalPtVIPq0udQecodlWg
	 SORzDhPk3xukvwagHUsvRIT1rZF2oF+GFJN7oWyVnKAUT+wyHZQQpWl88Au9a4d1C9
	 N0829CZP/trWg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso7803124e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CgSfUSK4lkauS5cE6g3jtEtNOpN2k9W+7EiFKrnR+TX+xNzApPArzIUepjMsphPDvLRO2PVipa0gN6MmpoeTm@lists.infradead.org
X-Gm-Message-State: AOJu0YwteefUVKOYujM+9VSUkqSSx/9gKl3pBxROIiHe2t9f/oZBeOX1
	U98TxQfm/OU8A1QoZDfwShclQVLCEdHXrdw2yvZlt/JM/+7Q5w2G5oZtd9TLyiR2E3EScGrdaYq
	XwIswuAlptYv73teQRiRZhBzL8e+yePLheNPB27pwnw==
X-Received: by 2002:a05:6512:33d0:b0:5aa:5f06:b01a with SMTP id
 2adb3069b0e04-5ad27fb2c6dmr485526e87.25.1781165873117; Thu, 11 Jun 2026
 01:17:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 03:17:51 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 03:17:51 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610084053.2059858-5-wenst@chromium.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-5-wenst@chromium.org>
Date: Thu, 11 Jun 2026 03:17:51 -0500
X-Gmail-Original-Message-ID: <CAMRc=MduBaCYzB40+b35ogxKgBx6zkB5WMV_zBPkZpec6O1Grw@mail.gmail.com>
X-Gm-Features: AVVi8Ccelzelin4KP3uByrL3JP8Pe5yqhtuz-V7A9LSr5BQSCNVmXC1yUbrpp3k
Message-ID: <CAMRc=MduBaCYzB40+b35ogxKgBx6zkB5WMV_zBPkZpec6O1Grw@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] usb: hub: Return actual error from
 hub_configure() in hub_probe()
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

On Wed, 10 Jun 2026 10:40:38 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The addition of power sequencing descriptor handling in the USB hub code
> requires dealing with deferred probing from pwrseq_get(). The power
> sequencing provider may not yet be available when the USB hub probes.
>
> Return the actual error code from hub_configure() when it fails, so that
> the driver core can notice the deferred probe request.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

