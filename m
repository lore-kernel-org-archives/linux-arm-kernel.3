Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C7CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=; b=hCZ9wQFWEujWfP1MT04rvr1EDy
	aW6ak/wylI+bIGGZ2eKEVRdCrWBKlKhANObK6DFwhPCi/SwDwSjyMzFuOGn5+fvz3/dUf3CfUm0Vi
	ScebzL/r8K8pBZc/RVE2EwobEstzzTvQuDmihyRC3cUusTNZORL5tMqNr4vnC1wNhtSG95F4tKdxl
	ON0g2L4QXJc6yRPcr0Hz1eAimVeH+iPHLSEJf4bx2/snnm29W8XVfcy0jB4CTdjtUb0HF8eMmtFfH
	NUD8T6Z8DPgVU8KId+aryPPYavPMoKPNZTN3zmrR62bkCVzugk8FhAeYY86QMI9dNEDHyGjeTkIaH
	eFQXF1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTc2j-00000001w5b-1V2H;
	Mon, 23 Jun 2025 07:56:41 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbgf-00000001sfw-1Uxp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:33:54 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5533303070cso3632171e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750664032; x=1751268832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=ZRkDoFD2XqK2ltBViLJPBSY4SPGFsTZUFrYUlGfBEvz/jmAREEzhDcpTDLZkZuNQxy
         CszmkSgRxQiHBXP2b7cgmIiwYySyeLKQkTAeucKxV1tsxUeTJo9kLyHucvgOyxXtg7xB
         k/VuLjwltCJxB/OOjyDqrWIBvBrobUUcgE5cYlspLvSTmYCjwpgLApAKMKQ211W1nF7D
         rSQ5DV4JKmWn6JHmAQdfJCS09/ycqMXsSL9FWk3DV3iNRt5YJfHqtPSJUcDBF6YLZzMh
         7de+mn20vSeQjucGDo8yhkS679BmtE/quWqmCvQHqV7y//Abjr4CXTrGOmWBZxKQ5/xO
         jTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664032; x=1751268832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=MzPhB6jvrwtw9/ZaQYGqPY+e//TricB1+4i3GvSaRV66lZMxVvnPgLI5aq338GQ5i/
         9sz1k2YG2GedfDUk7KBVfz6Coy4f2DnacjFzU1ynvqRCFPVE2A001oxQLjI2Qprrzk1k
         esGfM8RDRy+2EvMjMtfpgLUM6lr70UDvTTCvnNM329KMGhlJ7vZxP070skY3IlpRLoUW
         RhVvx6zTxwqEtgNjEdQPxzMOxING+ZSrNPtpJ/vhtLZsR6E1WJUaBq580HAZdxhywNkE
         PQ55vhNWuczqllIr4s7gu3CTURE1vRfRCfGHOF93BtB334BKLzfNt4yVYs+z8gFxTEjh
         VCdA==
X-Forwarded-Encrypted: i=1; AJvYcCWBthfFqo40anj+EYkTsDxd6ArLMn+KBFVwSIWvRDX0B1WhvuyWrCpwbBmt+OszpUlA23tS8OhPUW4t+LZz7YCW@lists.infradead.org
X-Gm-Message-State: AOJu0YwSHr46vqClh80e9siCLk81VUu+RgTf2cw1Nk1eEPD7UtDvHdAB
	zZyrI0dKE/3Hlo/UyzDaXwMW3wQqZ/A5uHSQi2fB6YXC05F2Tmv34/XwgWmjzUC8sJM6MSUokAh
	W7bRsW50/7TOLgiD4PMAQSpLtzMimOgmK3nVtotBoDw==
X-Gm-Gg: ASbGncuV6VgSIkvP+6FIgDeNTCLsddghL6/NK9LYHHlQ/OezCeLIoRxH1gC/9YdVzba
	oVGSJGmgVLLoxxF4ryxeK++yAjEwTfpbZ04h7qcbZtGnDuWGU5s7CiDudRVOycOqsYVdwRExNhI
	xGYAvZSv08KZcITWci1cLLfIcGKAFSLdgwSmjATNyDi0N2dZHdO7LPLr4/6HeHjS0ziO5cDevcY
	A==
X-Google-Smtp-Source: AGHT+IHXbQ1G61S6XTmap3R9KFxqdYburMPb7gYbxhsdAd+vhJ5pZrPzhPGsI5r9CHk6R8GllO6W7NbS7Xfzhgc6R0U=
X-Received: by 2002:a05:6512:1153:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-553e3af3b66mr3432565e87.0.1750664031428; Mon, 23 Jun 2025
 00:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:33:40 +0200
X-Gm-Features: AX0GCFvZI7j6aCfaYMvSqKv_YVgtIm3etGx79fDwp0jhT33AUgmaBnK_549jfVI
Message-ID: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_003353_394525_7BE99FEF 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/soc/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       soc: fsl: qe: use new GPIO line value setter callbacks
>       soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>
>  drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>  drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>  2 files changed, 9 insertions(+), 5 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

I see Geert queued patch 2/2, who would take patch 1/2?

Bart

