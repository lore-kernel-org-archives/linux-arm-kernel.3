Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E752C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RElqtDNXiao5Fe66tX7PbQO9u80Hzs14f9V2tQZKzpA=; b=XGm5iSbGlKrt/7otzyNSzfuJww
	k33JzO0o5Nbc0Pa2XhkV4/Vpm2NFfAaQDPJUrRZ3gkpS2MHbnut3DqX+oqW6BEcmjrYsl2AXhO3Ve
	tO5XwNTVclLOHJEKb/MhACsyRNtwPIRgIFA+g0BClvDFMlF1N0k7XUZnA5KGKRHF9x7u/jOgqEueY
	wZzP8rBfPPKw5PmdTE4s2WToxMQkXtwEwEsza/fAaeducf7RLMloQB2sk3OYCnCjIKer6wGam/Y71
	//wJfRtHMKq11r/oCRADeZiDP0fk92DVHkARUtS6cY+KXbDugpKytGerNm4cDEAuekT/WEkJ0lSbV
	wt82VDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfyo-000000044Do-1idm;
	Tue, 01 Apr 2025 18:04:54 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfx1-0000000443v-17Lz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:03:04 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-702599fa7c5so637367b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743530581; x=1744135381; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RElqtDNXiao5Fe66tX7PbQO9u80Hzs14f9V2tQZKzpA=;
        b=FOczdu/Y4u9pXj0r/v5YviysNJQP8y8rErgkFYweP01YWkR2JkodjFFZxzSG6HOhJo
         g5Qtyu73AlyW7CdoByT87s2XQLGHXfyeJxHThrEhWD+D8aif74wkp7wY2RIQt1ccmbRc
         Wr1rt17B8hA4nIB25IDQdT3WNBU1IB4bAA1da0Mrc+L7y+wa6FZNilE/K74IVPCeV9eE
         U4ql/lpm4IsIKoN48aLg/Upg5fQInGFSK3wIQ3DTKLA0ptPPlNdluC9LUUJ4pgMZZvA7
         ZNjLO0Ja2fji6yqfDeaP5J4kWAebtlgm9q8/fQFr9XNMEa0R6ElvO+lxDCWyeB1KfnYr
         owKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530581; x=1744135381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RElqtDNXiao5Fe66tX7PbQO9u80Hzs14f9V2tQZKzpA=;
        b=qYLEcZY089XtPEhehfModvakcl3F9KY1wV4fQa2HLJ3Bh8N0nIRhKzGTDmN83EPrK+
         VAu2UN1FpH6MUnH8fOql2zFyD9MBo5MdVz59ILqkipxIhuhVkqHXyYWOEEmFFHnNDyTK
         FrYGto39yEKlL++Fq9goldE4j+uJRClrnU6zIZRktFXM70072ArmC6pb98IC2eRHTxvK
         v0O0uHa3InNDHxLaoOTO/vcmlArdnwH+z1E4KGj+vhPMOI0sNMxMagZteEB+iMZUUQI0
         Zni/7mSKSsw4pUJ5HVJ1WFUJI3aiVZhHjfhi4PBXmiiz044kQqhZEBVMnKvROely7N1J
         3QUg==
X-Forwarded-Encrypted: i=1; AJvYcCUJLvZmvXQ4GA+ozotjqP5Avv6+WDK5N55oGSG6Y+PlmurJWyEVGAlyIZPIqOpzOh0d8hKUMIW6OgC8VU4iAH8f@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0FcbyTFjAh3y0ksVvkNG1HP3Q0bSUOGxqPI2gUUJLjb+9Ltq4
	kyEjf7tZjJb8M9ka9XPMUbXnD/nWeArJV29UTsgJyVbhm7KFL69k0rYkBF0oVWJy4DYsNwODvkT
	LiiewL0EaJfVP0x+WVctpnyOMg2e8YZR9xzvk0g==
X-Gm-Gg: ASbGnctHb6b3GXlOcCTKoYhOkbR0NrYAxyieZTexHruZtC06251QnQGXtfdMSN0G763
	LeSH89ddZA2bqkCbiAH1RHkJUWysbwvPksU63dSrZ+LPW07jii+0cD95y77Lo6+7kfezRF8r2RV
	EpZg/yIffXMpKSmnrtursQgH0JfXtCsrEjYpnIhmSXY2I5+f4dluuu5EOTog==
X-Google-Smtp-Source: AGHT+IEAZ9awAdsvEF18jxvMFTvl6qOXCPx2YncirI/WvgPAq+emAZx1k23zW+DI5dEunJl/9DWT7JfGSiLy6Ulrod0=
X-Received: by 2002:a05:690c:6b86:b0:6ea:8901:dad8 with SMTP id
 00721157ae682-703b65e9521mr14267287b3.3.1743530581705; Tue, 01 Apr 2025
 11:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 1 Apr 2025 18:02:41 +0000
X-Gm-Features: AQ5f1JqNWcGg680Z3tQAJYQEnY6EuyQA4mTpaPDzPlzakkRAMGdaRw5B6PW0Yrk
Message-ID: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
Subject: Re: [PATCH v1] clk: bcm: Add NULL check in raspberrypi_clk_register()
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com, 
	mripard@kernel.org, u.kleine-koenig@baylibre.com, nathan@kernel.org, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_110303_381849_4652B78F 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Henry

Thanks for the patch.

On Tue, 1 Apr 2025 at 14:23, Henry Martin <bsdhenrymartin@gmail.com> wrote:
>
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> raspberrypi_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: 7dad8a613185 ("clk: bcm: rpi: Give firmware clocks a name")

Nit: It was 93d2725affd6 ("clk: bcm: rpi: Discover the firmware
clocks") that introduced the devm_kasprintf. 7dad8a613185 only changed
the thing being printed.

> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 0e1fe3759530..720acc10f8aa 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>         init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
>                                    "fw-clk-%s",
>                                    rpi_firmware_clk_names[id]);
> +       if (!init.name)
> +               return ERR_PTR(-ENOMEM);
>         init.ops = &raspberrypi_firmware_clk_ops;
>         init.flags = CLK_GET_RATE_NOCACHE;
>
> --
> 2.34.1
>

