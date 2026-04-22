Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5687FF94CD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQBlVUrhFqLpmXIMAS6FxW1MbLcWzT++sufCtB36Fh4=; b=Jxu53aJEJKzCFpI4N+gl5zchl0
	8yhZ/ZyEDQ0SmESKlO6Hw7/H/XZJ2y2BRaZmNUcoZ0Xld/9OmBmWb8KNRqIn4tWcfaA/lmHaiyO8W
	pqEdb7V7v8Sx3rE0AQRolTLouIOSfVIOjQUxfMV9wwwewy4SU22N7ExaDJXoA6Pe17XRlmEBI0m5f
	4guSXpQdkymcYqgC28V5q+vQXPXcHubPHWjmk2WGF2kilU3lENjmiaYj5dh409GOyhyTX16Upbbzy
	nFkRPpttxx3c4cX5o29/CMmkRwOora7zq2bQ+5M3w60T2pAFi4olq4DjjLwMucFNszgDvGdS4xMpM
	qSy4MF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRQU-00000009gIu-2j5v;
	Wed, 22 Apr 2026 06:51:10 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRQQ-00000009gIZ-3vTN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 06:51:09 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-60fa13bde2dso3315380137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 23:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840665; x=1777445465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQBlVUrhFqLpmXIMAS6FxW1MbLcWzT++sufCtB36Fh4=;
        b=BAL0w89VW3lq9piE4kmPI8ybE/n0eR3Qm5JZexyfD9aBp6k0luhymMs4kBAG9km9tA
         QyTEFB62qpzbgRp5H6PmxSZLUKDxQh/1/df5hGsG0Inyau8ssEaMk1q6N7bU2ADs6B0c
         TKdJ8Qiy817ZMAVS06Zv50tAOXguxIOPvQ+awrVuQUqhkEl3LXs3VhiOxzWhItm2eLcM
         gqjE/yel8Eks6D6A2H0Dvqwfze8k8g/LBUAEiz9OCmstmxWGIjkyPtY4N6/z4mO6ImPZ
         iSP8Aqz0SvqWtYRF5Gwe8FBJtz+W4QCsTrBG4wAzexQDbHM/U6QXFzzyA+FRHzkwHf8e
         qvbw==
X-Forwarded-Encrypted: i=1; AFNElJ8UAq8bBp6kXupxEX86D2boCY8GGbfkmlkpEKY1N32Af55JxYdjrpvZf+wE8Puq6f0qaD7TELWRuHLG5E4heZN1@lists.infradead.org
X-Gm-Message-State: AOJu0YwqTP3Wb0googcVA3eXAKgQcJW2ohwhauyURWhf6MA4hCoLzBUr
	4fuz5TqKZYTdYfde69eBtPPnWGann0EcND+uUctFT2f9fLeiv1Egau6wyx2pKhTDMts=
X-Gm-Gg: AeBDieuUYHkAxF6f/Zpwmd1yV0+I6lAP48KYGll8W4inu5DJMcB+YslV3CYAGUQb0WH
	/ojDYj753CC4znBkObVIZ6RuoXlJnZJKbqo0ELKBpD49AeQMALQV5aYSAjpsOAKaIbd+dmjEzsa
	2iDMpGzyM49VVAZEERS0qa+6UCXKAE4/jyhTP+AzrI/McYAdKvSzwC01UGlvMM0SQkXMvpiutuE
	vbVFEfj56JY8Rishcq9DLeXboSSy/SzkD/pIAtp7dCnR/tOd/BAVZrTxjemPKfDrw3aWxqbKVae
	SqzvqzcH6qVj0oI+5+ihqpuUAGcKK83AfMXl+vKh8BA4ONjqWTphsK2rqHhAJgP/K9hhNNY7ciy
	dOK5qHkKkeAOh0P7Oq+vou/QO+rCBorU9mA34AbZGkDXGYZRNjWWZ0l49jBfYr6lo4/iZ63rMn4
	tUAekcDVedlNrZ3xjoURPK1GVOenrK23oeSSIG00sNprTaviIaxqCAZuiT/JHzfykpVi14dqo=
X-Received: by 2002:a05:6102:20c8:b0:61a:c2e2:932e with SMTP id ada2fe7eead31-61ac2e297e9mr4551897137.22.1776840664687;
        Tue, 21 Apr 2026 23:51:04 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm7019084241.3.2026.04.21.23.51.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:51:02 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso3084032241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 23:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9d0G3LMtVUZvxLuXhg0IyMM+89ceX4RW8BKu4I0w2rFDpKJGiJvYmnN0pN7T+BXeY15vJP988lHuNdSnKtn8ut@lists.infradead.org
X-Received: by 2002:a05:6102:3a0d:b0:60f:f543:232a with SMTP id
 ada2fe7eead31-616f4b50368mr11299488137.2.1776840661908; Tue, 21 Apr 2026
 23:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
In-Reply-To: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 08:50:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
X-Gm-Features: AQROBzBFb_WdSQXK0LqlocZWzf5masVqawoXkZ-ffV8evv9b39yVA9knMtYt5TM
Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_235106_987760_EE5105FD 
X-CRM114-Status: GOOD (  25.03  )
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

On Tue, 21 Apr 2026 at 20:12, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently non-SCMI drivers cannot find out what the specific versions of
> each SCMI provider implementation on the running system are.
>
> However, different versions may use different ABIs (e.g. different clock
> IDs), or behave different, requiring remapping or workarounds in other
> drivers.
>
> Add a public function to obtain base protocol information for the
> selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
> Generator and Module Controller drivers.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -3504,6 +3504,37 @@ int scmi_inflight_count(const struct scmi_handle *handle)
>         }
>  }
>
> +/**
> + * scmi_get_base_info() - Get SCMI base protocol information
> + *
> + * @of_node: pointer to a device node for an SCMI provider
> + * @version: pointer to write base protocol information
> + *
> + * Check if an SCMI device has been instantiated for the passed device node
> + * pointer, and, if found, return its base info.
> +

Missing asterisk, reported by the kernel test robot.

> + * Return: 0 on Success or -ENOENT.
> + */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

