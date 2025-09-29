Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B27CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zscJNsz9LWE1JCbi4f4RqWFcZGer3C+FRtSw/qqEOSE=; b=tmVaqjo9aA3nkfXeOtqD2KRcTB
	RI1uXPLNv1vZ/3jWyZwo9t/3lDmh+ctyLeoXxBstEaURWl+tT3v6fjJWcCwelrtLnfuv4s5nlhWI7
	L9WDNrtbRn3Pmevnfrmo2SDcENJqJWUPth398euV/6vkOI3bfmHDfSVMiBbNNKvw2dLYMK3E2UeEt
	1HJLsFpylaOfxw70K66MtQUV3eDdELSxJyE1UPQ9pDcedRHM925fmL52CucPwTD/1hgkrcjBaNIoe
	LKjbOa5iwL+nwpPZ2FEOnIaRDEyb7PO9MuAnUz+z5zTd+gTBK8ETyRX4y+bgkvxzR29V587RRcILf
	eEekM/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3C9t-00000002Lf2-3spx;
	Mon, 29 Sep 2025 11:35:09 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3C9q-00000002LeA-4Apz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:35:08 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-890190a3579so772135241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145705; x=1759750505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zscJNsz9LWE1JCbi4f4RqWFcZGer3C+FRtSw/qqEOSE=;
        b=D+2FP/ljGIyfRHL1/ldBGyL3Ysx/F2jnqUwAy7t/ZLTEesFFmhK/ISa7toudS1/5FV
         eHz1LBKGMS1VFdjcS+SfqAQg/prfSZsGcZp4ZJvy5AEZvtQxX9Cal17AyJhEJ6fR+VDM
         8swbpjd3n4Gaj/BT47M2cz7nYaReQ1Ei68YeJzQIdIi8EV2ozVjg1urFaziFQ4v7OUqD
         /STtFVOHrKFk4LJMYUHE7TZp/HNMkuzj9Z3TdlZ5zh13ZcTGM3LPZupYW3N5ak+qf5jG
         enCmLoj2nyW7UFGD7rY61qhKIaxjpZPGyv/bwVKgGwjibx/9bezffR/546zKfIH6YC3u
         /3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEIoabwxZqbV30vVJDbPJe9M5FVFMemK00aXskRy37DesxMWSPdqPJOVr9lFZwLMdmzZkT1hRbpjxhoPnLN6P6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9/pZE3dkPSu70XsFwUne+ArLOVx5399+nm/HrjwBF8joC5LMP
	OY8JDmbsY3PeRy8h3g6zvUXlBmaJQJn8uMOUiNFAV75eE8mSL9iRjqlSLBrjZpob
X-Gm-Gg: ASbGncutKw11QiGpi269XLxbofoiPD5nqIAsso3iNQLc+xhHeqPLUYV5ogivJv+jorF
	1DAdP3ZDweOgtyoVj8aOtpOaAQmn/ruBMyC1EBbE2lCZ6PO0EREk7xV6LaUZDdqqPj5Iqd4TXB8
	7PPNx7kaetXx1MEYuuHYfR7y0KgrbvN+RCthsSCnLddHdhkdGDzpsNBkWfmU05EK/fYSWnRY96u
	TpsEgzWSHm9PE/KE2Dv9jf99nTXYzADSpsXmJdLbFVlKZYfL2ZT7A0vIisQWo9xR9hDX4lzo0Kb
	mBkGt/YsExpwL/Wf612RCMLtoaySEW+g5f58DTZ+3WtaqqQYKaIDHyQ7HfIReVHlad8vM5ng9JM
	SkWFZuP5Tv87FQqlyFFGFmgrGRSUCWoX5/Ct9/MtIioq3KOpf98yoWRUipH5KBH1ZczHJFFE=
X-Google-Smtp-Source: AGHT+IHLIToOZ1LwTt7ZRFdAljO34cMKshLLgG0jc4NCLJ08OruG3Xi80UV1m7v/+Jpc5CMT5Kfmdg==
X-Received: by 2002:a05:6102:370a:b0:598:dff4:6fa6 with SMTP id ada2fe7eead31-5accd21713cmr6946375137.17.1759145705464;
        Mon, 29 Sep 2025 04:35:05 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae305d0c44sm3306851137.1.2025.09.29.04.35.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:35:04 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so638284241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:35:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnPHCWWuWKDgLZlosKR7A0ITGk5UZNXZj1y+Xow3aDf0ksTWiL7A088Q5x0WperDU5KUFlfnXmP1H68FkeWARS@lists.infradead.org
X-Received: by 2002:a05:6102:292c:b0:5a1:ea0:f56d with SMTP id
 ada2fe7eead31-5acd0efb09dmr5673188137.32.1759145704110; Mon, 29 Sep 2025
 04:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
 <20250917170202.197929-4-john.madieu.xa@bp.renesas.com> <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
In-Reply-To: <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:34:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVazggwwtD2pvtzwTwX5XWf=UWsuezTU4vJnU5gtT09yQ@mail.gmail.com>
X-Gm-Features: AS18NWCxvZMcs4IKeRIKmjN1qwZhpwGWh6ZDTAZia6k6h8LSwaxFUr6lA65qWRI
Message-ID: <CAMuHMdVazggwwtD2pvtzwTwX5XWf=UWsuezTU4vJnU5gtT09yQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	lukasz.luba@arm.com, magnus.damm@gmail.com, mturquette@baylibre.com, 
	robh@kernel.org, rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	p.zabel@pengutronix.de, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043507_039472_29CAE6CB 
X-CRM114-Status: GOOD (  18.79  )
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

On Wed, 24 Sept 2025 at 16:07, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 17 Sept 2025 at 19:03, John Madieu
> <john.madieu.xa@bp.renesas.com> wrote:
> > Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

