Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5665D2FEF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwMRVR4JPiCqluFN5GCDrX6bmKnCS/BpUIJaA9qie7o=; b=ANSizbMZFTMQwAedW0Cx41G+lG
	ijQSJ3nHVdo4Nr59TtoVpHYPA1xSf58aFzIykwaNlYZh42Cdx8GFB9sJPD4ZedHxnmmInnJSMGDV7
	CFCIuwyBuEYCKNUNsjCL0hmuLWsuiF7v/MrGlV0XBWtRJmehMqBVyWFkC753llDuRqmaAsQulHBt3
	b/Bw6mcS+S4byEEvMglERUnnrByLmNLJqplFQy322o6IerSXF4on6Krb4Yauj3vdMxOgdEFSdDiGI
	wT4XeasKFhvbnXSXN9khmi3yFX5U8/nPykvXKcM0GutOtXv7sW8cqXsdfRyw98HADtAc7CQZ+u4iQ
	jwR43pqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrLZ-0000000F603-2frS;
	Tue, 27 Jan 2026 22:15:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrLX-0000000F5zf-1PQr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 22:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3C174445D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 22:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E99CC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552138;
	bh=TwMRVR4JPiCqluFN5GCDrX6bmKnCS/BpUIJaA9qie7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VRFfMsiXlGrFgXEPj5uhScqB60qnBKXNWD58MRM3oINCFZfJ+FKflt4hbvURJWT4e
	 aMpQ0uyHxvcJfF1BLjHe1I+/hQY0jn2R7YIgA7bcs1UwkL1/Cs6aO59QiBNgvJo8Ti
	 3WGrYxKDMPIfP7CxoiVFPjbM5JA/MZ6A+oxVjhcJFR5VhDrVS6dm9gzLwPW7ILsb9E
	 NDsUdjuER4IG1Nwqst2ZFq+x1rpRZNNfS/YPm/F/LY1RyNziqwHgQn4WfpyUDVI2AG
	 o9iYg04fk/xGIOWKfCz4ZlNUydxaIEX03kfOzivbN2W4zUXMXYjd/9NNJblEP+zV2O
	 ZD/fy7IksfPfg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78f89501423so3360807b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKF4M3DqRLpwTVmwWnc1VnS0FuPclWFfAjmHqJcVoqDW7k2DfxfUTDoVZ/lsoyXElJajlnMBThCWnbFiAxIUGE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+IMmESRp3tDPq+FJaKfzt4ljCavXD4z2yVV2BzhEVf+y5o38a
	iPkNoa+VPcpd5HOJeOT9AETn4QIN98/pfFhGoqZ7jpk2SoB19ciqHMxn/XTdvch0RYAGv461W9v
	tqEnHfdCk7mJj4gK3wbNodiMbGc82vnk=
X-Received: by 2002:a05:690e:bc6:b0:649:60a9:bd74 with SMTP id
 956f58d0204a3-6498fb29b23mr2176803d50.42.1769552137859; Tue, 27 Jan 2026
 14:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com> <20260127214656.447333-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-2-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 23:15:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLnH-A=nir6YSLnsEjLmF63D+kGV=JdYDQNy6QcHhx+J8A@mail.gmail.com>
X-Gm-Features: AZwV_QgrUdPwMsQ3oS8gzJSozvL58RrBTgR4nkrOKICAx_ZJLz6HuLBvQIuQ4SU
Message-ID: <CAD++jLnH-A=nir6YSLnsEjLmF63D+kGV=JdYDQNy6QcHhx+J8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: brcmstb: correct hwirq to bank map
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_141539_418975_A89ECD01 
X-CRM114-Status: GOOD (  12.76  )
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

On Tue, Jan 27, 2026 at 10:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> From: Doug Berger <opendmb@gmail.com>
>
> The brcmstb_gpio_hwirq_to_bank() function was designed to
> accommodate the downward numbering of dynamic GPIOs by
> traversing the bank list in the reverse order. However, the
> dynamic numbering has changed to increment upward which can
> produce an incorrect mapping.
>
> The function is modified to no longer assume an ordering of
> the list to accommodate either option.
>
> Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

This looks right.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

