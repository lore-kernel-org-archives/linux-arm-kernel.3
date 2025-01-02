Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34545E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 01:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5A+fNOs2v+iDXy9gnfB/Cm/s+5oEu/VzCUjXzL1flU=; b=0T/X2rQITXthkctwl7OxMb4G1X
	TUhrYN8kNjTIN9nGhDkFh27dMdg3mQXmL9cZuZiFoDl5DWf1Ip9R1DEMM6OaFlq11oK86I+V50rX0
	9/Zkn4Ly3SQ3K4yblkeFNl/iyXyyK1m7EwKvPFg0yaku33VXAx0QlNXRLd6RWgg3uoOBC1Wru7nMJ
	ZWlpJHvwsjagv+USFbgQ/cVP1ZSp81FwAoamdgFucWbLDT9rW3cTS4VSvOvNU/bYC6Md8/IrvaBDa
	fkX6Z1FPq5zSrwMaSbnyvWWDQRCRixnTJ3/Ku3u+HkijV6WLe5CXtrAH6xY2xRcLcG9hAPG0iAzD5
	dVTUsYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTA1a-00000009Yg1-0uJL;
	Thu, 02 Jan 2025 01:29:22 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTA0Q-00000009Ybg-3c97
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 01:28:12 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54263b52b5aso647716e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 17:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735781288; x=1736386088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5A+fNOs2v+iDXy9gnfB/Cm/s+5oEu/VzCUjXzL1flU=;
        b=R79TqYLm2Gui0CNqYHVssO4lguJw6N2wmsHft5vjDcn+lEFkIuVwbEeogOqqxqGH/6
         X6SXhMBGCF+qzRZSgW03mvj+O/IENCykaaulMMx/IjTrR4ZDwG4ZOx8jdldKhQc3NYZb
         EN1hPXAERmicULALz1q0h0SLdMdAItjT6KLe93Pgr9WgphrFwAAMXT/oUZUK8R4UKqpP
         wn9MTNI9rTpN6iMwTRg0cOPxPUJ1JF2au4b/+a9mE9sPD6hvx8peMc+3/W0USdYn5zy4
         5B/BaD7pooWDS5Dn1fK1EkFl54Cqn7GHUg/ebdg8oxHmTMUJKnepk/3Zh4N/X0sgO7sj
         aDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735781288; x=1736386088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5A+fNOs2v+iDXy9gnfB/Cm/s+5oEu/VzCUjXzL1flU=;
        b=J5wVKyhDV+/XteTxB/LbFp1qOfjXzlifM5Aca+jN6z8XMPVZ7GcwDbX4b9Dd/XFPth
         BqLxvtBZAND74XrmgxRa0MHCHoRBjRxbbyU8ah3t3lOJezEI0yLfSICG3itS1pUri/mA
         Va141tklXbKniGo2fy95Q4wcUiR90NmO8QuA2yxDwXfexfNQieP5Gg+f8lfEe1hGXafX
         Dqcl6LlmsxfG325h5ejQXz9AgQsXJg4eR7plx3vC8nxr+HzffzOPFEvGuckOZg4GHv+Y
         AQWyo/rpBFDDu3m7y5dYaYPySk2sd62/Xf+h6dO4kWGrZyaLuJuo8DGI1Ch0EOAdtL4o
         JILQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeCq3faS9nVGKxGZ6PFOLa/nnVBeHyTWyBHxjNfYAt8IxWdiEVod532FEWCfxI4QEG9jupyjWNtPYSYIMpTshF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7yq5oDbD/fxOMejvuCv/DrbpM2NYdnPKykI7Dv9bTbSJu+oW8
	cZSYxdWqObl0iXVEdloYxf7/Heofe5VtaBkRe/wBymew3JrqbvM8tmCTpnUduyF+yp35HPN8HrU
	wThEOTd54q7mE2mDWNhFqdQ785Z7kKpWnUAJ2nQ==
X-Gm-Gg: ASbGncvHnzKFhDt54zz3qpGKy3vr9PJAp6vtrEuTqtwgBQOAipB28edzsOyB/Q7vI+6
	9nRVsaZIecLQZMLtqjvSH5re5BlGG8m9T2iVh
X-Google-Smtp-Source: AGHT+IG/UDsEg+0XNkiO7o/fl6fn+k5MfWwRaGYodEMlM7U/ikDReDME0rwrPQXTrVNcfbKoL7bMCXkw0iHb9fPnuCU=
X-Received: by 2002:a05:6512:318e:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54229533e65mr13622135e87.16.1735781288248; Wed, 01 Jan 2025
 17:28:08 -0800 (PST)
MIME-Version: 1.0
References: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
In-Reply-To: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 02:27:57 +0100
Message-ID: <CACRpkda4uVYGZYZEWxyS_Tw9ZC9EfiZZ1D3oshZg3fh+N7zL1w@mail.gmail.com>
Subject: Re: [PATCH] ARM: omap1: Fix up the Retu IRQ on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-omap@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_172810_932340_D21A9FB1 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, Jan 1, 2025 at 1:12=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi>=
 wrote:

> The Retu IRQ is off by one, as a result the power button does not work.
> Fix it.
>
> Fixes: 084b6f216778 ("ARM: omap1: Fix up the Nokia 770 board device IRQs"=
)
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Sorry for all my mistakes :(
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

