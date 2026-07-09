Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F136EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZamOEqvf20g5QpO72EPkaDRuNkZPExK+6Unu2WZF2DI=; b=JgHpXc4vx5AYfCZbOzXXTPjH07
	imxujjsQh6VL+JvTRiu4Wnrcvt7lEYhn39dGfTL0/sXsyXLBAH1RePVKl9KwdyuBFx5weg9rqgC58
	UAEZ+AyBToxHLeiMQQpyaP4pRN3aG2RPSoUnAaJGtLBdWPI6/iDMnTY/s5ddUj1VfDiKMerFzW/8c
	kitBMK0wKshvWhtjjaRoiiNsguIztEex3+HkUADHTDTpBzM0MXZjvM0t/pncfcII4ziWb++5EEFbM
	YQXyhG3KlNOmk5d6h7Ct5Ba2Yk7mGI1OIJFX/pPLOsCsbh1k6jknS0CMtSKChzQXBAWvZyApUkp4s
	WTnvz2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm0U-00000001way-2pRT;
	Thu, 09 Jul 2026 10:29:26 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm0R-00000001waI-1IO1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:29:25 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf9466412fso310195e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592962; x=1784197762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZamOEqvf20g5QpO72EPkaDRuNkZPExK+6Unu2WZF2DI=;
        b=kTcx1wS2KsNE8fPHogv3rBLTy3bXUO0whgMvGGqv4Um+gZkFYalkPfarD8GCWlcQVF
         KngWJvu6masSqJF5SeazOAdAe53A4ek5GJEOEK5qRFEG2GyyNZxLjUJm9zyxWZvcY9zR
         PqcuUr/7L5VIepNkvskf1UGGJKj4bpW1WsFMjek5SF9vhrybFXS+QmAbeXgE/sV6fYG2
         CJ35tBgwqkIk1id7eqil90Sg+M7gBpg3C/YvxSeJZ5645TF8TUu3BiZW1F7eRGdmt0dV
         veXmWFzXIRCZuamETp/jIMHmCWDqTO2qzv4zi3by00Kx6flACtFHnNbwdlUtBd41yMyx
         NksA==
X-Forwarded-Encrypted: i=1; AHgh+RpevuAl6WK00VGfMPFtq3UinfsxaXsseDIgA0AlZW/IOlpgbdmfvMFkUJ5Ht/r3mNPFe5X1osRomNTUrVYaaB+o@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8J3SpG/Nj4zk0LWx0ddIOUH6ijEZZmS9E7fJRhaxzyzB8MMlO
	q64t/HVSkzdRO6aGVLuSyCffpJaHHh35H/dXU+uUiG9O/GfbCSON9f40MPZPnN+VcGw=
X-Gm-Gg: AfdE7ckw6RCNSGrQZfrb9jJjiHwMqb4ZAqYk2KquhT9fG13z6ux+FUYkQ390pl1tTTQ
	tQduXBFFRAnIrHHJoGOa+5GceNhSIbAr3pq83YjkphPx3HwcZNPGakmbd+DXQdKDDY0CjxTXt48
	R1UlSyZo/okzIQ4GFgfjhwBah+20zyI+ikCBF5zbJtugRxOZb0+ehO1v4YDb6XxtaQSrQKVvkgq
	N3QYWYU/FGII+ZPrxo7J1dfhYJu5oQRMXejRacpjWZ5mMUKg8/7KBrlKiUfKkvHscbwTNz1QRJH
	5chx7V63Guv2Zw+HBt8MOopd8b9YQSrpIq803Jg4/I1PTfpSsczaC0BQ4NvHvUbT/vZOgaWR66e
	1uvdOwZ6vcUQlhr7g8LZ0U3QTT7k/cCjtvSLFS0NVdNgen1gapn91ijrKyTZBP7crYpDgEp6bWF
	04pPxPKVivz+QC4zOlBVDS5gigcqG9ESI+0ZnJ9QL3gA3GHASzfReGFg==
X-Received: by 2002:a05:6102:5a93:b0:6c5:d55d:c096 with SMTP id ada2fe7eead31-744e01c13d5mr3810430137.16.1783592961646;
        Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38e25sm3207830137.11.2026.07.09.03.29.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso298956e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpXOt6rtJjE6MoRAPAQ+HC+vC5DpP5ifOlf1t8GTLDCnui4ZgOK/53HhhTJsWO9IQX2GC7VwXJgUxWQpycG1lsL@lists.infradead.org
X-Received: by 2002:a05:6122:16a2:b0:5bd:9d27:1ded with SMTP id
 71dfb90a1353d-5bf75d09a7dmr3522535e0c.3.1783592960849; Thu, 09 Jul 2026
 03:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
In-Reply-To: <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:29:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
X-Gm-Features: AUfX_mxryCBg0UJms9GxmXbM4sVe50wH12jLcYc8l3gBc8Xa9jNslCUWm3ZIyfc
Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_032923_373057_449B312E 
X-CRM114-Status: GOOD (  22.30  )
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

Hi Marek,

On Wed, 8 Jul 2026 at 23:55, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -358,6 +358,7 @@ config ARCH_R8A78000
> >       default y if ARCH_RENESAS
> >       default ARCH_RENESAS
>
> I know this ^ is not related to this patch, but is the "default y" and
> "default ARCH_RENESAS" above valid ? I can find exactly one such use of
> Kconfig in the tree.

Thanks, both are valid, but sort of duplicates.
I will send a patch to drop the latter, and restore consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

