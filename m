Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DD3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 22:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=; b=KswC6yJ5k0yVe/RM52IpvO9k1b
	9tg0melcF56LHrPyXEMFapIPPwZbbeVK5lfA5jitU25CAJ22vk/5OfywGpGye4+DHYWIcB6n4cU3A
	tAuZAiTMAPpzWrqiLeZamktBK67rPKnMTV5vfq0VvH9sged+V2RL8TZP531PXtObQRFzzqGvqvEKE
	gE3FvjbT4zBujeMXf52+x2StQVyozRIrZJCcRhWcAPaRhmkymQCp4liUNogIlO2U7+dgcBGkIBD9J
	v89aQaR+6lzOXNwDCdb3sxqrhmzLmJ1tWo59uHDBg3xBZTK0/8KL6OVVeCtS+WVumGnAcuzKtOQnU
	RHWQLyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfja-00000002VQf-0GUL;
	Sat, 28 Dec 2024 22:56:38 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfiO-00000002VHu-022H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 22:55:25 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53e399e3310so9972322e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 14:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426521; x=1736031321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=taVdMpreIowOn9rP+LLzCfFQRF3k6nQ86UD2mrPe4FUPLR02QNosTajQmE8YWGgYwt
         5j98K3WIX5TqDUAcsEounGzk4n0/JO4WcVEXcZXa7q0dX4sXTWtFjG+9RJS1t+bKwwuL
         wteN22QJMz2lvqBzU/IVWvxcK1Q2BC+V2UTXI6BHRnybGDjNV1ty/U483Ab0VQ6QHUCX
         pm1/1/oWl7MoUNYmupEPUeyvXv0SwmaweY6xzcXA4O+qR8HK7+moXIa6fbOXJZS8GZPo
         /jXVqjwRwnRLdSYN7ptnhPdldMTvEJe6Ilf1AxY9O960lBFu728YVZw6pUE/YkmdbCkM
         ap/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426521; x=1736031321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=Nllu3VfyNPHNSfsIHk3Ovg+eMP9xCuCKrp2UGWaeODF2eaUQHHIt/EcnOGdkZRrzVQ
         fSjd0xo02ZTJNfkJv4IM4wBKrzpLhihX+rCBjW1BGFT/BsocY8xbnyWyku0PcecWfbdA
         K00FQzh4idI/CtwJlwO3hiW46LsiZUQ+ImkS2dj0yGyfFHrvL5jlMzr2wHHgg6lu6jdX
         GTXGmDTCiFn9C0/3jY8FsGQ3J2YFNYUnRu7cMhJlRiZyZ/Yu95IaPzvTedC7/U720kt8
         ObEyxZcjatZQUfsUx5m7aGDw4M30jEiR0l/71wavRmjz82h1n3x2Y5sVayYzKlTG1cOU
         I+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwrRGylSzThUnCEV9ZLpx/tHwiVzdHg3Vc1x1RkuRPZUHktync3F7zayzkxZ7MxW5TMczGPNbTsMMmESbDQzQf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0nSNAzjpxgoGYXQtl9Sj5nHWuCi4OwmUxrqrX3iVSfg26P5a7
	1ygLf2nueW/7pr7qcI5HlsJE8CcP282mhqV8W6INwpaF2oD+2cOc1TrR3ix6LZbam6LaRk5c1rX
	ePsoNtOqNPgZRihOXW+Pogr/FTjEXzjjE/LeNUw==
X-Gm-Gg: ASbGncstNd4I3ZEiJUvcoyg/dcPA+VXgMVGUBq7E2/4bY4DpRZGADnuhtDsHqr89fuH
	Y66Emxo28wFCXjrO2/I527sN7E+6kiAgLDGew
X-Google-Smtp-Source: AGHT+IEeHS7qBCOkGJkLci2K1l4MO3cQjjPsp4mJA4mp2Fct0kochwX6HgM8ASkaZLPLeUe5QHN30KZL6jeoExuit3I=
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id
 2adb3069b0e04-5422953c19cmr7875781e87.25.1735426521162; Sat, 28 Dec 2024
 14:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:10 +0100
Message-ID: <CACRpkdYaWTdOoLXcpWG92+OyRwsPMxMbhQ6djdzO07x0sPz4oQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: ab8500: Use resource managed API to simplify code
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_145524_047760_1433ABF8 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On Sat, Dec 28, 2024 at 2:16=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
> error handling code and 'driver.remove()' hook.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

This looks very nice provided the core code is merged.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

