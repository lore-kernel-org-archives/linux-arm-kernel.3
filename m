Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258EAD10390
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3ew91ZImWbWhfHK6tR0O58sGF2lXLkOfJoWIQesi1U=; b=VWexeOb3mcwRFxeR+VgRWHEMxy
	uLetvLfZGdcrAzX5bzvjSkI0Wt2pEnUcpskNV++WIlonbKQAKu2UNOsaSeh+FAP4l6POZxrpTX9ad
	dpxBT3yvfuqqCKh2678eq1KWpEJ+15Jxrq3HnVBhjnICK7zNPopMcj5ssSjbYMuUzS6O10Y/Ea9Zd
	CTP9Gkd2EyvI8e/cO4PaDgKOkEkT+Wt+wd8Levu5QG8yV9pMD29i9wNNlPD+w0nCgkwlFZF2f9BpL
	x8/S0uL4YpBYaFE1CglswHbHF9F50YVtyQloYFJTfIAV7D2rCGwvDtjTE8jBnMzoHF4wRSKzkXKSl
	2rW4VH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBXg-0000000Egk8-439n;
	Wed, 26 Nov 2025 09:10:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBXg-0000000Egjf-05n3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E4A660195
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A11C19423
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764148226;
	bh=1Gh+v9gZlx4T+2vP2/a+CEj14Wm+hS7qirELQBW3q2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sM9Is7k3eU0F3ztx/WM5nzni6cOpY/uH4/mAKFOAYlTUmWGZhZWSrqEnON5xhtH7G
	 cWCxGIruK9vTN7pfPFx39xsW0SMCsvISaGl3R3j/qnDrx7XHJbACnHWOWSCeLq/y8G
	 PU6v6zbpuAgC6Cj5ETXQniGzliyiNGI58ANT0eyFiYF73i6a/CZLk8h685G8Uc+TVl
	 /fry9Nd3R0IqZJjh0ziocV9eXvbIvWdcuCFpMITLpHIEk9o1P/CkzLB7JRyy+674/L
	 JH4atSITnJRvCeXVkupXjp5iruIulXzJfKFnXpnOW48Ne/03vCIPgBefuvUVZHYFS+
	 wpUvl//oExOPQ==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6420c0cf4abso5731745d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 01:10:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/t+pctPypclqMqlxTOEoyOe3w+MguAn7AjV8wZ4Jl1/I5IZHjLH5a84DdNSmASx8U7LOd8wmubKLJZ3QIiR9f@lists.infradead.org
X-Gm-Message-State: AOJu0YxdRw7esCHB8NbasTw33BvajDqcuNcrAYFaDhAAc3IXoD5LQA5O
	SSzC52YxKXf1vfnJHsj1xuVtq/NiYqwzL73Flc+OAlM4f8waRbekpR9Ydgu8Up6fK9UrJKjuxYU
	5goTXNQMe8RxryN/SH7lCs3IJfZc/EG8=
X-Google-Smtp-Source: AGHT+IEn+dWU8mxRAWLhMi7GP0Lw8+OC8N4aZc4Hh63NWSD8PewoKHoDsfkyUR8ez/7yCP4Jhv1U4PvoktYwLmnE7yE=
X-Received: by 2002:a05:690c:48c8:b0:789:552f:b576 with SMTP id
 00721157ae682-78a8b490616mr155805427b3.15.1764148226208; Wed, 26 Nov 2025
 01:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20251125023639.2416546-1-lei.xue@mediatek.com> <20251125023639.2416546-3-lei.xue@mediatek.com>
In-Reply-To: <20251125023639.2416546-3-lei.xue@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 26 Nov 2025 10:10:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmlrwKgRMkbTd5MLDMlxjKIz8VWVRw6PHOOri4KCmVC5vDi2iUqAwHA-0o
Message-ID: <CAD++jL=h4ZEgrjgGOfgFyAXBM7EL91ZD-La82UQ7GPOXv8h9WQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add acpi support
To: Lei Xue <lei.xue@mediatek.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, yong.mao@mediatek.com, 
	qingliang.li@mediatek.com, Fred-WY.Chen@mediatek.com, 
	ot_cathy.xu@mediatek.com, ot_shunxi.zhang@mediatek.com, 
	ot_yaoy.wang@mediatek.com, ot_ye.wang@mediatek.com, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Nov 25, 2025 at 3:36=E2=80=AFAM Lei Xue <lei.xue@mediatek.com> wrot=
e:

> Add acpi support in the common part of pinctrl driver. Parsing
> hardware base addresses and irq number to initialize eint
> accroding to the acpi table data.
>
> Signed-off-by: Lei Xue <lei.xue@mediatek.com>

I'd ideally like Andy and the ARM64 ACPI maintainers look on
this. (Added to To:) and CC linux-acpi@vger.kernel.org.

I'm not aware of the best way to deal with ACPI in combined drivers
but things like this:

> -               hw->base[i] =3D devm_platform_ioremap_resource_byname(pde=
v,
> -                                       hw->soc->base_names[i]);
> +               hw->base[i] =3D is_of_node(fwnode)
> +                       ? devm_platform_ioremap_resource_byname(pdev, hw-=
>soc->base_names[i])
> +                       : devm_platform_get_and_ioremap_resource(pdev, i,=
 NULL);

Just look really quirky, I think there are better ways to go about
this and sometimes the ACPI maintainers give some good
pushback about the firmware as well.

Yours,
Linus Walleij

