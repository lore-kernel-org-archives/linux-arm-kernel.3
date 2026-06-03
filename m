Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904C7CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vDFPb86PvQvyL1RfDQoX7OYCgpH5JEVJJIcrin/l7k=; b=TIpR8ZGbpzNfDi4Y6KYXA5mDa7
	IwxT94YWba3xSPsq6qYoLkXuj0NeUQv2kr9/4TOTLgLLSv2thIQi5TJMEHsbPyyDDAXMO3PC9/JZP
	maGN9T5zf+0aWDxMh7K3wzd/8zcW3vQ2B08q4H0k6okoq+x/fkd4E8Ad9MY3evhvxT1CD0BGn+P0+
	BSzFrqQqjIRCkDQLKOUMFboVuAyLLaMOrdDPQP2RVJXrJ0hra8MPbgf39HQ/ikzMdRhsb0eo/oyU6
	MGaXFI/hjiNd95LZD9EgDSYBXrqykEkOu3jZjbxxz1SNo4V6JSts1R9LohmlOP9MPOyC3+CHcOxA0
	hr80MDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlIf-0000000F7yp-2Q6a;
	Wed, 03 Jun 2026 13:06:25 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlIb-0000000F7vk-1zxz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:06:23 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bebde89cfd3so535828866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491979; x=1781096779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vDFPb86PvQvyL1RfDQoX7OYCgpH5JEVJJIcrin/l7k=;
        b=F0NbJ//WdNJJ3LiwM6wBuuu89hXFM0txjZVuS5C522zuv6DYrE4W9KWsupIly9pYeM
         l4IACVz8GJvhRR4lWI7cVsR7pnJ5UfF41ZHWBltFrqMj6BXx34SzNVN8gexaiaGmu4kc
         pFseMjSzg/QVP3pu1DvyMA8wqw6LD54AW0hOheuC8W2+dwsZOtPlZvoscmXtnLH8xvdu
         e2ezNydMIO9CVqEtQ+hY8MTYjqyIvUP7CsV1DAdAJWlwmyj77dAR7EfYUdqt79LjnXvJ
         TfvvPdgm6QVRENIDYJNxlHb+3xtiT37LTAB8oo45kVOXKCXhwXqIMaVK68kdlNSDo+O4
         BcXg==
X-Forwarded-Encrypted: i=1; AFNElJ9Kob/2fTr7fq5ryof1zp/wdvPnVlz2KNWlSrkIJw+cADG10VQ5VEcslnayb2D8Jzqgn9s/udOqSf3IJnUQnL1V@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3f+O1qwuXtEZTa9GMVN0U8dkiZk0wOLF1W8peHjvzMRb+rRg7
	5cFBxw9r754BGV7duABzARbOLyC1KeOmjoIIg50v2MUR45qBon4W4AhLAZLZiZHac7c=
X-Gm-Gg: Acq92OHSJB1GTYHppj8epfeZ42LuJmoDb2dOyD3y2Ztf+4K0p2Nta0YY06jc6l+F5SX
	mBdTq+CHGa/Q6nysSpsfdTIljwgP2TDj11YG+ra9DIpwVQ+BDav6DSFEmSRltPK0JhBrI4EjiFn
	N45R4LZADtrV4IMYFSxzRkKR5JSGYkUFLYbYjeH/Z+Qnydlsli+ijYr3NeyGDRltpqcxnYWudOb
	SRgYztqnwOb1lAKegeqJKuID2kdnN5klZeC82DhAUg6fLgjObHAqRFvAuRBrb9t4Zq61lcTSPmK
	7a0uGFl3o/iHMi5H5sgDwU/GZ+jDRLP/I4A/nXsepJy6Bn97oYt/o6R3yhwfAjcXDymAomPj9o9
	SqIUmWXfgQ5qKEsTbXk4nnC2x0roE4W+lP8Y+gw2NooyDmn57BRlbi1B2Y8Eg0BljaRrebazMtT
	bv4KatsO83GEOoCbpaCSDeSWTm1o8hd+nDiK/s4/eZdMQl6mzMuAsGAWw1tuoVBTsBDUaDTuQ=
X-Received: by 2002:a17:907:1c15:b0:be2:9d25:3da0 with SMTP id a640c23a62f3a-bf0aa105800mr173048466b.25.1780491978499;
        Wed, 03 Jun 2026 06:06:18 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm143376966b.45.2026.06.03.06.05.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:06:00 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6896c54a7easo2182095a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NwwKer+ZObR6X4qx3+ZRmG7l2WvTfFNg4jyLdos4owkcWJwkS2J+elhJ6DJHuI9pv/lc65kq7gbxwhNcD/MsI@lists.infradead.org
X-Received: by 2002:a05:6402:e08:b0:686:9c15:3121 with SMTP id
 4fb4d7f45d1cf-68e713e3184mr1563082a12.12.1780491958656; Wed, 03 Jun 2026
 06:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com> <aiAkdZ5XuYC-wpCL@ninjato>
In-Reply-To: <aiAkdZ5XuYC-wpCL@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jun 2026 15:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXG200TTrZGp1YJGt7T2u9vUy9ipoRaOWw_jTaa8Ui81A@mail.gmail.com>
X-Gm-Features: AVHnY4Jn5WJuuexJ9K698In0uzIER4UcBvwdWNgk9D9nn5i9fKP95_v3uD6TZnc
Message-ID: <CAMuHMdXG200TTrZGp1YJGt7T2u9vUy9ipoRaOWw_jTaa8Ui81A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060622_457877_C3350DF0 
X-CRM114-Status: GOOD (  17.89  )
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

Hi Wolfram,

On Wed, 3 Jun 2026 at 14:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> how do you generate the CC list? I wonder because linux-renesas-soc is
> added while only files in the freescale directory are touched? Any idea?

DTS:

+       pcieclk: clock-generator@6a {
+               compatible = "renesas,9fgv0241";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

