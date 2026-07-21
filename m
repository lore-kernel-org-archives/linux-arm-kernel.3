Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72DAC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvM+G7VRk/YqTwwm/37jHxsh/YM0a3jwdT/iGpNt7ns=; b=GCKEQPz2l0e5yasex80xhm5iDC
	Zm42QnJrpjGRSN9rZIhnZU+HxAt1tcdvwykY79hgyld7ijN6TsDlPyAzGDRkOJFYhY7wkv4g8o73X
	Ry+6tcdSpflwUgfGHb5v3aL6ouza+EY5pXeD7LhFcgt5nhDSVSrZmh3xCVRb+EHtZeueeJ14C4hzi
	p3gAU3YSwJ/NpwEV/2Y2eqSK3i1QNI5D3Wy456PE/yD9an7OTPgYQts6reN4RE2QpgU4c3aIfRmk6
	S08eWmwKpVAvqUilc/npduVcvITF4U6ESj7szBUk4UEhrKfxrsyOB9kq+IfJv14t9IXKe2j/YUQ5f
	4XlHwUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6U3-00000008vr0-40HK;
	Tue, 21 Jul 2026 09:09:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6U2-00000008vqQ-2KDE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:09:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 062C560A9B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B249B1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624989;
	bh=uvM+G7VRk/YqTwwm/37jHxsh/YM0a3jwdT/iGpNt7ns=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MVQO9e13QUrl1ydM9tLxQtUaLCsnbcAtu8NgunLGYE4inVyVPW19Oav9+VQRrvtqa
	 wmKELzHocua82VssA7btIuIuDdOSyzsdxQUjVe1815Zw/htwZXJ+yQtpe+a+6wt5wh
	 +4j1aVXPzGCBf7oD26cJMav8pl/WEdSZrXJuFV0Zy0Fg4XrpxIa68x5pQQNY8vbOon
	 2Jb4Om5yt/pVv3lweKK87+3r6/K0Ayn0C1tuO52khz0O+QvalM2yny3NEZ0hZ9HF7h
	 frdv1XoaboFv7IEsh69K3VaUb3f5IZL78qHP2sWT5Aq9Z3gHI3BUoRl6RBQJCedg/p
	 0FRgkMqlPYC1A==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c94d4fdb9so66642211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCSss2bFTYJWa/59t+TDjaBqoLTK4pfskirq22cWWYBAIX8uNgGqTE9RSqlfUgEImgwZ/V5QKwfVrhO9hSArpT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3wFLUnWKkvNeFv6FXJcF6yD665emgnjzg3TQRmAOWymTfF5/R
	/Wi7CZPycjkHiO4l/izVjShzx0PGWC7q2aBuzEe0jS6Z0bE2pWuvPprIL7yxJ23SbPGYp+kOnCD
	ODFr3uscq2mgZQPd6Okh3G8mDP2BDKw+16P0dQQ3OmA==
X-Received: by 2002:a2e:b8c7:0:b0:394:8fc:8c3d with SMTP id
 38308e7fff4ca-39eb273c8e4mr29254061fa.4.1784624988499; Tue, 21 Jul 2026
 02:09:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:09:46 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:09:46 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721065413.2306137-5-wenst@chromium.org>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-5-wenst@chromium.org>
Date: Tue, 21 Jul 2026 09:09:46 +0000
X-Gmail-Original-Message-ID: <CAMRc=McBNjvJK-dMBgifFxtgw0-bM_jaMYwJOWCRnV1PTLt-2w@mail.gmail.com>
X-Gm-Features: AUfX_mwsGGPfxToi9CFWvHg8F0vayIDb1DET27lB_HvrcHXw8Ht65VkjHJmkwKw
Message-ID: <CAMRc=McBNjvJK-dMBgifFxtgw0-bM_jaMYwJOWCRnV1PTLt-2w@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
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

On Tue, 21 Jul 2026 08:53:59 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> usb_hub_set_port_power() open-codes assign_bit(). Just use the
> assign_bit() macro instead. This makes subsequent additions to
> usb_hub_set_port_power() easier to read.
>
> This change does not introduce any functional changes.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

