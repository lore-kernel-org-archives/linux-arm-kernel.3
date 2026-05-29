Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52918CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flVuTYQMPE98WVvZ/bed+lF6Q3W4uYVMMxpgyqZY3FQ=; b=z4rcoWTV3VRV8yGbUZFTANtHIj
	Ui67KS8zhJb6mWwb6YQOZ5XV/dFgLRQTyIKd1TfuDiA+opTR10ZuAT4ALMV5AFwNimT6MuOaZQF1K
	MT6G4BaywDjMTXF/zGp5f9XR45WUDNdMkLJtSw8VBMmevtRFVLm/FCKHDcVhsOTLFA4fllK0O2BwM
	OT1pxJK3Iv0n4gDR8wVhxBu6L2GlL5M+X8RsCWI2rhbB8ybZ07+IlVm+F7RaFd/uiXzx81gVOfofH
	0y8iHjejaYzFKIdtSkNSLBMntVxXuCGS18APneyE2zfyKCm8dKclOTauePH7hsWoHEbSZtaFbcCZZ
	3V4VNQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3rO-00000008Dx5-1CsD;
	Fri, 29 May 2026 20:31:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3rN-00000008Dwd-0ity
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 20:31:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 510B6605DF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086571F0089F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780086672;
	bh=flVuTYQMPE98WVvZ/bed+lF6Q3W4uYVMMxpgyqZY3FQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DzPGRoQRXxlO98kzFknnqbv66lXJDatBV8P/Lq4TYfX/dNnQJMZjv4WACrC0jbVPU
	 zxkN3U0VJqrhcGuKfCjHhdaYxUFVgAR01hNVk2UkbxBDd0DYUzVBVAmHy1GVfcQ2HV
	 rtY4oDMuklf3/2WvilxspzK8DMcoDlmOZWbpX/3Zwjh8boReF6r6477PqozAsJiRLc
	 2Dy1vbj33sTW40HLvQh71b2bjgCrDCbWf1MuDhAOF1oH+eW9ah96R7uNucNZP1J47H
	 z7JT7hh+hHdZfSHc+wk3OhCFdHuqc8kfVhmu+7cCLq9RZO9MZFFZsnp8xS0QjCRG9Z
	 +RFiqrhPom70A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa5aba358dso1006675e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 13:31:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+E2/MBkGQYzh2f+fi8dWr6QQyvkOxEEP20am4ErXZDnsx1kHrL8A71JbO+VB4RgSM72f/XVLrTBgHXo9Jo0z90@lists.infradead.org
X-Gm-Message-State: AOJu0YwfcqTTc2D3MBsLwPFoNzx7VjjUjCVt69VX1xLJSGLJHI85UcBn
	o/YKIK1vjFeO+MGMmKce+sVdwFPlTPTwY0XCGuy72SKbeP3k6IRIzJ+CYJCrk9PfumdUaUNnSOZ
	ff4LFJVCHTuKATt0S3WLEOe0CamIqQeo=
X-Received: by 2002:a05:6512:3f07:b0:5a8:fbe0:bc53 with SMTP id
 2adb3069b0e04-5aa608ef062mr483883e87.24.1780086670800; Fri, 29 May 2026
 13:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
 <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com> <36cdfa84-1e83-4a44-a529-653d476778fd@amlogic.com>
In-Reply-To: <36cdfa84-1e83-4a44-a529-653d476778fd@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:30:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLntffpfwtjD16SHD79W-tQKJTMwmjP5y1+0rgNS31yv-w@mail.gmail.com>
X-Gm-Features: AVHnY4JiTwG2IVBsAlj_GioMQiqlf8ek1E0ZiI_k3UEBuzhsFkAe-cqsDu5gZBw
Message-ID: <CAD++jLntffpfwtjD16SHD79W-tQKJTMwmjP5y1+0rgNS31yv-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: add support amlogic a9
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 29, 2026 at 5:02=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.=
com> wrote:

> Hi Linus,
>     I don't see these patches in the for-next branch yet. Were they
> intentionally left out?

Hm I wonder what happened. I probably thought I applied
it and didn't.

I applied it now!

Yours,
Linus Walleij

