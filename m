Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A58E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 02:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=intg7CPV5lNN2upqT1uQ/sZ0DfNdXfMH+V8v11jVfBs=; b=zULA9ACBytGsy3FpEEDfnMCIs2
	ebmwzkokPtCcc/LxTHFo2opbeH7juLNgiVUMMEPzXdFMrlypUU9gg1kQ7weJxQLOfUp9qGTIeHAj0
	o5HXMfHuujIWxUjatsnh2QCIZqNR8LqCJN3UZZ74OLN1EN0z7UxmVXxcK3E0ymIbW9wtKNSkG53rA
	9j4OOCRmiXOn4mzCJYp1ND5hTDbGfu1m4T6903S79LUGU9JSvQBsDvSVJJ7OBoF6UVZwbEjIwRSK1
	3uhBSe5USM3Za1kzjLjk2KCp8kdUYxrIDp+FodsbE/o323CvBrszmatVK7kCsenFSIS5Z/U/kBZIm
	zeKYl4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvDM-00000002U6H-0N5z;
	Fri, 13 Dec 2024 02:15:36 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLuF7-00000002NKI-0sqp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 01:13:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso1910476a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 17:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734052399; x=1734657199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=intg7CPV5lNN2upqT1uQ/sZ0DfNdXfMH+V8v11jVfBs=;
        b=AAAXlewYsie5W3pIia6zC0UyCon4yc5J9DZE7O+37WAzKLG6nL+/N4PenaLPnhvPey
         Dsh7l54h1bSmt8ue0VGPMUS1SDwikr676nhAaAqxeJG0buaC+nNHaGBz3Yk34me6S3B8
         RxcCwQuno3+1g7Ud+AiAum9aNHZqcMBR0XZ2Fj4+VPlH/wx0YKgzDxZSAiadMAuqhYsw
         ZMnt5Gj/GSDXBrDZZYrgLHkRcUxqr4K9CPFuZb6GBKtuuY0O72PFejr5uU+gELLeh83c
         H0ddtjiq7c+tx0NWo7duQxtaEjW0crb1/SqTlxiX01tokLB9UKpcdabCxKGu8V3PBPCH
         rHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734052399; x=1734657199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=intg7CPV5lNN2upqT1uQ/sZ0DfNdXfMH+V8v11jVfBs=;
        b=oF7O5XfyqyMEtA5YFb6ZqpzukjwjdbIg/Sf4I8tZkI+Fph6N4yo6GFvJmOY8aqj+eQ
         oiIqksj4oz2wbdIh7RHA6InqwAo7wVwJ5/UC/dx0KIJU/LBaWT439E0Pf0dCHmKVzp7e
         kgHJ0U27BfdrZOdnb/zawmEGIgzLy41VaLzgrp+vxefefM4PR99ZfBDyst7AVRsmMcii
         Mc8DRbOaHnaYTA67XzhukeUXOnwk9RDc9B6BLvGo593aPcyls+o8AjVsC7hD2ZtFR4nd
         dAt1A85E9mpZq/I+6VJNYg3oJlqDi2hVSF+uudGC86Esh1XkrTNL3S9/AZ3mD9GkuAOn
         FxJw==
X-Forwarded-Encrypted: i=1; AJvYcCVy8/MCQa966KmYms6yuZYz7omEpY3nNM/rsSKVIFobgbiQptOGDWbd5M/jAr95V28cSzDg7r9x2ufp+48xrENz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0JNsDZd7tHoRW43QlpY9ukvf3r49M/afiMcE1uhxHri+AeZa8
	8glOTJMCSr+6okBEZXPn6CFiqqlPyr/3rFx0JoefD/Amq2n6W51RFFSKVyDGK8rUsKBGvHz6A3e
	gE9MIHf5udVpv8g3G1laB1yNFcU0=
X-Gm-Gg: ASbGnctx+YkLzng6eABtdpbwasJbz8xm4omLMZxYQYHOgyqL/w5jV9qlM1qRQJKL19/
	fmP9X8FSkpTCrjiPrNhuqdZVARRNnTfqvA0u0KmJb5jWCZQ6DvA0hdyAMWcb9eUr63iEb7Q==
X-Google-Smtp-Source: AGHT+IHJz6/L7nDklgKHeOu8YYD2uzG3zcykfx1TYlduVMTtvi/o/gN9R7X66CTA1wTAxqWAB9Av95x4knxXTSW55Os=
X-Received: by 2002:a05:6402:50c9:b0:5d0:d1e0:8fb2 with SMTP id
 4fb4d7f45d1cf-5d63c314efbmr468103a12.11.1734052398528; Thu, 12 Dec 2024
 17:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20241206214315.3385033-1-zmw12306@gmail.com> <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
In-Reply-To: <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Thu, 12 Dec 2024 20:13:07 -0500
Message-ID: <CAN4iqtRk4g2q-1c3eTjELeKTTtfcV-MU-_36QkRa76+dsE4y1A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: stm32: Add check for clk_enable()
To: Marek Vasut <marex@denx.de>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com, 
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_171321_245382_4CD44321 
X-CRM114-Status: GOOD (  10.97  )
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

On Sat, Dec 7, 2024 at 7:59=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 12/6/24 10:43 PM, Mingwei Zheng wrote:
>
> [...]
>
> > @@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev=
)
> >               if (ret) {
> >                       fwnode_handle_put(child);
> >
> > -                     for (i =3D 0; i < pctl->nbanks; i++)
> > -                             clk_disable_unprepare(pctl->banks[i].clk)=
;
> > +                     clk_bulk_disable(pctl->nbanks, pctl->clks);
> > +                     clk_bulk_unprepare(pctl->nbanks, pctl->clks);
>
> Use clk_bulk_disable_unprepare()
>
> include/linux/clk.h:static inline void clk_bulk_disable_unprepare(int
> num_clks,

Thanks! We used clk_bulk_disable_unprepare() in the patch v4.

Best,
Mingwei

>
> It looks pretty good otherwise, thanks !

