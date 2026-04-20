Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28AEF36C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev7Q2PR+MzeC42yfPBg+fufDGNaPf4avnQMcEXwV9q4=; b=tdw6cGuOVKWw6K37TCk7+g2z8e
	m8gIo5ZG4yWYC0/dwt7WixDZdCisy0F3iikqLsw+tUeGH6in++Nz92se8gSxfXu28jkYl3Z2uDYQy
	VwgpJC3z1K+KlXZFE148g0GPLKLjCzR7SGvNRjhM7wg0lqjvkprP1VjCsn/CLeZPBx1ZseNtIh74q
	AE/KXNVoFeexI+vtMToqcd32TKGfc4CMrYbO+lZTLTSbPsRqHiApf0O5h1CPl5OBf1LexUKdD/Gwc
	d11PLhzq/+7kCRL/V1ENxtI/R2zmCAJ1fPCWgrWqUjHH1gkTkMtF3MBl7prjB09KQAl/AQihxqHsm
	+LN/GXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEiSg-00000006Vrh-1ago;
	Mon, 20 Apr 2026 06:50:26 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEiSd-00000006Vqw-0V5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 06:50:24 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56f3e6bbecdso809970e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 23:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667821; x=1777272621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev7Q2PR+MzeC42yfPBg+fufDGNaPf4avnQMcEXwV9q4=;
        b=jIY+DSOTF+C87fX04bqfuVcPH6yS/JETOcWUBij7D6CFJv4jTchEvKB62ZXFADvzT7
         2wBHnSRJ3xRtjf+XNew9R9gt2+hSKTFvW+QosXwWSgkBrG6t4BzTIBbx61IGjdoe7XbS
         4ke4XYcpyXE9dNLH14p7tLKxUhRxWt4qvYq7ocpRS/kAl1tZLuDePQYbCVuk3wTNNn2G
         drpO1E4HYkSnRK2iY1FDkuSMssahjDbTY643vPA31ndfknO4chqW7oInbSItuuvB9DcT
         BZ/PQ0IfEzBQQp/9HWN3xKBNr4spurhZYzER+ii7GLi84SiCWTxuSKGeWBIJizDauyxA
         bxQg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZtyjMQgf8LJjwujfhpSbVQSpIUkh2DobV97thzTsXAjYb1v8booDDhspjgsMeQBJrUcpvNUHRaKNpfRfwMQMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwOzCqneYO3c9whOoT7sT443F8YrWbYUeQZGbCNt60HU08dzdoD
	4nXK0CTBJygR68U3p/0KTxf5O/ALTmm/grzwY+qKYqRWWU9MFpkAGmik99ynsUFU
X-Gm-Gg: AeBDiet3WjSw6NOajItniwiqfqfjJjUBFqBBH+TyyNHZ2CXx3ooE1a6T8lBTFDn2xaH
	Zchp67uTNi7LcSOaXKSuwhF8kpsEFupymDlmkbc7r6bM7TxyFWbUnFE8nTnYBM2psJsYFgTNH6g
	8ywgIlKRF91ftpTQD1PYVEmAp8ubN6PqQ97KkHY7KcbmqcNWewOUq3RJlKdBM4Ye/zIn45zAzmI
	ldu69lRs1X+YjOYIp3UXPKFeWPbocUTCcmDZRpodGqySZsEuKgm6sv7BgobpR19m3wSx1wA2sgH
	92yLsYRdQ2gA2W+WhS75keQC5s0fmKOg3hlxOzbM1Ip1RGCPvtuIdKM96KdWWat2GbA/KgU6077
	/KcbxRhW7mSz6KGZeJ2hltwjY2DMrBdmze4i0t8gqDgYL131cntlkSVr+WC7J5eYKoNcJkDmA+x
	/S8JQcbY+Jou0mqMzm2joBkHSbcJOvzCyuzJXx4pckwF76T6xPABifrpsFgO2pNY7w1I+yFgk=
X-Received: by 2002:a05:6122:e191:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-56fa5a4666emr4890744e0c.13.1776667820880;
        Sun, 19 Apr 2026 23:50:20 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92f22a4sm5800495e0c.12.2026.04.19.23.50.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 23:50:19 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-610aadb2d9fso830266137.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 23:50:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/n3pfLcSJE3TNMVcQR0r/z8HV6ayDINq3uF/bFTshS222HcyZQ8hQR06OcRvAASG6qwWl8DzwO9/gYARvIRXKj@lists.infradead.org
X-Received: by 2002:a05:6102:6051:b0:60f:7499:9b6b with SMTP id
 ada2fe7eead31-616f859752fmr3673069137.29.1776667818181; Sun, 19 Apr 2026
 23:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2026 08:50:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
X-Gm-Features: AQROBzDvJRShLyy63Y8y4xm5mUkGqHiHZxGK82_lU0-LEkdWIcvZD7MEx0w1d6U
Message-ID: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_235023_162670_B5397FA7 
X-CRM114-Status: GOOD (  18.54  )
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

Hi Thierry,

On Fri, 17 Apr 2026 at 15:15, Thierry Reding <thierry.reding@kernel.org> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Peter sadly passed away a while back. Paul did a much better job at
> finding the right words to mourn this loss than I ever could, so I will
> leave this link here:
>
>   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u
>
> Co-developed-by: Paul Walmsley <pjw@kernel.org>
> Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>

   "every Co-developed-by: must be immediately
    followed by a Signed-off-by: of the associated co-author."

https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submitting-patches.rst#L506

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add more missing entries

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

