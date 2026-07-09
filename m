Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72534C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uk1paIY8euqKKlETQZ8oULEMJ7HstW0bVetbSs+wtjk=; b=r+cjsCFGvXR6AHGPgeRGGeXT4m
	l6BlWNO1g7GIRK2SfsWscDB3tzXpXL4xHkc8W1FGEFfOu2U4p/pSXhyabM44qub5zTYhvclYbHywr
	xP5qwweyNUnySGGP6kfHT7X52ac1bDqL9KQlP2uaOmxMsvmiv0LpwH6JCj1yEXav9cAxJYysLLkXI
	QcGYdxhrjIkeQI4KnHCeDp2Gf1U3mX0rJQM2Tdr0iP3LeiZ/BEVk2lVOeM5rep097vqlOF/7bZUii
	1Jfmqihh2Lg+VVzeHlthN7HfHphYH2heCKRAte2fPqxdLrh5cOCMccHsmZz834iLj3zQVbOMYU8mw
	FpGwwwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpm5-00000002lr0-0lBh;
	Thu, 09 Jul 2026 14:30:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whplx-00000002lio-2wB8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:30:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA32743643
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 14:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED991F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607440;
	bh=Uk1paIY8euqKKlETQZ8oULEMJ7HstW0bVetbSs+wtjk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RPN0dW6PuazA0DKoZ2ps2OmJJ3t8w5Z4d769XH0gGOekHGK+UzxclezCPCuebxz0R
	 bMiCG7stnBWSKK4KUw/HHvytQteBYxb+DQedgiF5NOEq6xYCQGMoMr6OQ6NunZSUj3
	 gFsFhFyPU5SmiSGn1//yco5O2nFhuWD9OB73iL+0vl7qWkOcly5jCzj2aYNKbxUes4
	 DFuEg/5c3MgF0iAnb9feN4f+m3Pdd3yHZRP6C+15w4+uew5Vd7hj9VcqvuRYoG55t7
	 oUXGEPZouC4ZQ26OQFMOeB/ZIRmXJwSRzWJ4QVdO8UrF3KX8I95kFTNqSv4NjKxBrN
	 y39JW28REyEXg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso907089e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpn3OJc5y9zERGkq67HkDQtAbK3Tk47uXoZwoze33mE5YUx1PBChOTC3mYxR9u0jlwwGICkc3C2UZ9K4BdT0G0a@lists.infradead.org
X-Gm-Message-State: AOJu0YwjvyAMsceeA+ulxbKu3q7QU/wjyKpAcS2Qfl2sMgwbtKxQyOV+
	gQNiFZCtmGYManeJWDwiMGZ5EKFKg9GjpmhXS+Wm1C42fQ2U871Dq0gAD2hrcGFPdwT861uxeFy
	fAB+erGKqv6nbXA8aCenUQtIOH0cL/f1v0iooYhzPMg==
X-Received: by 2002:a05:6512:1415:b0:5ae:b88c:3ff2 with SMTP id
 2adb3069b0e04-5b0114afdadmr1759669e87.51.1783607439457; Thu, 09 Jul 2026
 07:30:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:30:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:30:36 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709095726.704448-7-wenst@chromium.org>
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-7-wenst@chromium.org>
Date: Thu, 9 Jul 2026 07:30:36 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfx1qoHWs08xOqNzmp3+RroPXQF1ps0Q_bu+17DWz0eWw@mail.gmail.com>
X-Gm-Features: AVVi8CcTCqwQAcyQVn3vmM3d_PiKCDTxzoT6aStAZSp__o8inJgUu4b7eftjDFw
Message-ID: <CAMRc=Mfx1qoHWs08xOqNzmp3+RroPXQF1ps0Q_bu+17DWz0eWw@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] usb: core: Move struct usb_port and related APIs
 to port.h
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

On Thu, 9 Jul 2026 11:57:11 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
>
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
>
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

