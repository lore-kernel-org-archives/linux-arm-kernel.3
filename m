Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C178C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o58uTMMNFS4Q0L85ZfDPFylZSbgHXx097G7NyDQv2i8=; b=OxHI7n6BZnpnKQTnyIzBMHzIGX
	paTc++CJH75iKSJPgcltgl2jcMKeLmhaWWt3/T31TwHGQR3IWCr5HR8xjE5vI/0iHBCU6kIOSbsvz
	oLwAbEGxEB01oaZHd0El1w/kH6I6SaD32SUJMXQExx55KFB7PdOge6yJUHbHDyWrTHZhZkP3+ix89
	QQ2nlvtDpI0iq+MNCimImYF5fZ8FXnao5ScdGM1lrDk8lNlC6ggHRxk3skTTSqNJnDIdrw6UoITfU
	6yWM/a6UFLD4Lb7VF3neXs+FBv14jz8b6ZV0h6337F8dScAJ8TG90ew9SHwz9qTwMB87pf69J9zO8
	fHOWzRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnlY-0000000ALmI-1WRN;
	Fri, 31 Jan 2025 09:56:48 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdniK-0000000ALQo-2V5w;
	Fri, 31 Jan 2025 09:53:29 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5187f0b893dso557480e0c.3;
        Fri, 31 Jan 2025 01:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738317205; x=1738922005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o58uTMMNFS4Q0L85ZfDPFylZSbgHXx097G7NyDQv2i8=;
        b=ZgqASf/7TRiLtCaAeD9oA66ehObEePWXJfyAtMnAijDdbgRP+fd7kwZda6ZKNyGg0z
         Stm3Qk2X3Fnyg+nMtRM/Rv+CiqLR+7NcNQW8sqYZd+5Qoff1LyJuy9TcFw0iMpZC8bPY
         2Ts16qz460v1fwAkbrx4KeVbW9aVSMLBj3datMSr2o/AIakxoWt/n1tkhdeeq1pmGz7T
         cHzonnIUY785QfMpMUZ4RoO2Q2U8cVXUA2ug/+q/cJ5nRbjeclTZOyYPWp3zCwvauPfK
         J8TvlmbDqPG8wmcYLnRhHlYRABeG2sdHUWQMlf5JzUpxpOAnTkC3LA4WcGNDlKwt2ffo
         GVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7fS+M838D6ZzhWPGNMIVOvBpITuKKC30aSGCTD4aFyulQkPh7ktmMg5iE2wyw0kRkyFTJMwqA6HKBYzs/oARq@lists.infradead.org, AJvYcCVWc9jKGgsJToEuUHdGPteH89LZhM60wjGBUBqMqpwlAEXBtvVxh1wV7NPRblWUgIH4F7+8DJkXLeiovP3Xu/U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrZ63TkdvAIwu3UxKhL1eSFA3eufmSRdchPR+FHwX8mmk5uBD6
	EYkUpqV7AALGLyYjwTgLBdQLdZQ+oA9pxrcu3JDrXdePt1tZWOJU2vpDuRAY0Lw=
X-Gm-Gg: ASbGncsdSIryahmwrdHEKo95WSwtWDamvo8bngq86HeB0oJJkXh4AZy2KEoSM3mqIvK
	JjJ8wr2mMUpbE77H67WrGruQMNW5A1TU1bX63vZTeWEKd94hQL1Lk4JdBFwoam0GJd4shd8HqkR
	Boa62cSm8JmjaOyXObaZgwhAHa5q8iI6cGpP6sPdHAyo41c5RDh9I9cVNTj93TcJFDQwN6pnhHv
	Kc88+oea0mukDocs0OOtXLxlJIZD/o+g+B6w+xBDCrnA88/KkGZeervbS2J+UrS3E7pAOSHyZT+
	etXspmRhgXJxiw5MaxtxpDNZSIGbnbjG/4fxKdRO2eEx/JA0JTWxfQ==
X-Google-Smtp-Source: AGHT+IGKwVSpe+y02Kya2FOkwkxzZlnRjT4tdtOz75zI6oAx/LmlPOeuzpDJks8JQRLCxPVvGvPYRQ==
X-Received: by 2002:a05:6122:4f8d:b0:50d:a31c:678c with SMTP id 71dfb90a1353d-51e9e3e850fmr9856135e0c.2.1738317205296;
        Fri, 31 Jan 2025 01:53:25 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1be84ecsm446424e0c.6.2025.01.31.01.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:53:24 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c4cd95885so440852241.1;
        Fri, 31 Jan 2025 01:53:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfon0YDbgWvOJpafAdgr3aKTL0KTuePJ/rZBR5k5vtWhQEdqwwxOgbcl25gtNiws/msgbkKu8WSBZE3x1magw=@lists.infradead.org, AJvYcCXTFZdP3mKMRPOO4wTJjjrtduiXZbHYXhj84JPJp7OJDci6Ap6ikD7PmRMgYU+oqFEKoSpxLw1CwuStZh0ZFadI@lists.infradead.org
X-Received: by 2002:a05:6102:3ed5:b0:4b2:5d10:2cc6 with SMTP id
 ada2fe7eead31-4b9a4f23e07mr7603457137.6.1738317204143; Fri, 31 Jan 2025
 01:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20250131094812.118340-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131094812.118340-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Jan 2025 10:53:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyEEPLTc7y+3PP2xWH8e0Ho-fxpO2=SgxW0O6+S0pAAQ@mail.gmail.com>
X-Gm-Features: AWEUYZmGjIbMT5HT7Ryhuh9-zuTjarNP4o4GHQiQZq3NCHMcWFbcty6bTmSHSqI
Message-ID: <CAMuHMdWyEEPLTc7y+3PP2xWH8e0Ho-fxpO2=SgxW0O6+S0pAAQ@mail.gmail.com>
Subject: Re: [PATCH] of: base: Add of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_015328_631996_4D935153 
X-CRM114-Status: GOOD (  25.27  )
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

Hi Biju,

On Fri, 31 Jan 2025 at 10:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> There are lot of drivers using of_get_child_by_name() followed
> by of_device_is_available() to check the child node availabilty
> by name for a given parent. Provide a helper for these users to
> simplify the code.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -824,6 +824,34 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
>  }
>  EXPORT_SYMBOL(of_get_child_by_name);
>
> +/**
> + * of_get_available_child_by_name - Find the child node availabilty by name for a given parent

available child node?

> + * @node:      parent node
> + * @name:      child name to look for.
> + *
> + * This function looks for child node for given matching name and check the

checks

> + * device availability for use.

device's

> + *
> + * Return: A node pointer if found, with refcount incremented, use
> + * of_node_put() on it when done.
> + * Returns NULL if node is not found.
> + */
> +struct device_node *of_get_available_child_by_name(const struct device_node *node,
> +                                                  const char *name)
> +{
> +       struct device_node *child;
> +
> +       for_each_child_of_node(node, child)
> +               if (of_node_name_eq(child, name))
> +                       break;

child = of_get_child_by_name(node, name);

> +
> +       if (child && !of_device_is_available(child))
> +               of_node_put(child);

Missing return NULL.

> +
> +       return child;
> +}
> +EXPORT_SYMBOL(of_get_available_child_by_name);
> +
>  struct device_node *__of_find_node_by_path(const struct device_node *parent,
>                                                 const char *path)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

