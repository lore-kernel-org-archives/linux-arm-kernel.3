Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88B4CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 06:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWqwEWx8zwWItcJwZ8fd27r7w2elRRbG49uTkJHmkqc=; b=ZWb14Lb6S7VAaTQuNwl1GThYHs
	fbKnDR95Exb5x2kvhwl6zbjbm+u0y+jLKpINtEWjJMCKEx/xMbNp2dIVQYPZQw86Ne1ZsE8dX8Bmn
	FcoLudALrk3z1mDa/2bTpHKCu0qKqlJI6AIBKVl9PIc1vxQt13lJgDkwBi+qn8POAr1nFQ2UgaRVN
	MyngUTXjgGHD39IYd9B1nKH+XM5Dadl05JElkFQW6CQ2S9safoFM1nM95UgAYKNwjsPo2rgGXkIL8
	hoHKkxe1ivb3lgJ8YXBs+RA6hIZVVhDg0cqYoAi/e737lakgZ1hDKvopG+s2cXTYNZb85MyHGlgdY
	0lBDpq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CzB-00000009k8T-0M6j;
	Thu, 02 Oct 2025 06:40:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Cz9-00000009k85-2g8R
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Oct 2025 06:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oWqwEWx8zwWItcJwZ8fd27r7w2elRRbG49uTkJHmkqc=; b=aLTa2YBxkcMeWyF1FV62jNB50l
	pIO6ZCS9UOfuOJHOZWxWZZVFshrMx+JYt8YDovabXuK+mL9iWm4L2PLaOinB0QHHJN1BtGoZv/hp2
	skvuV13Y2Xq8msjME2PHz8ivq6c7goOu82n1z8kft6vkiy2D8eURn+DgXFcZsn+Lpid5yvlgO9wAL
	Sz7cVOurwQsOfsXDHPJoYHy6wHHk1yeNKYDWbkWOgjuVpQZ8gzRfd/TkQ5B8gNhThFJb4w/oUCmp0
	O5yXowPTc/cjFvjMI2xg34JgZunGMNK8b/bQm5nPzoIk8OvTJno0Sbifq6hWiRSQ1SuI8ggtXiNVF
	CqhO9fIQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Cz5-0000000E6Mc-3vhf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 06:40:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3875D45550
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Oct 2025 06:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A6EC116B1
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Oct 2025 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759387210;
	bh=oWqwEWx8zwWItcJwZ8fd27r7w2elRRbG49uTkJHmkqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rlSxbq2aRzxfcMKB2aNQECztMvISDp8XZalihZIOzysf/FUerJ1qJ6sYMfHTeUONE
	 62DOVUPnSTf0z2Gz7YC+gEt+IvcgptSvTab0KUw5vfuxhlHUA6CsMjvBF1+Th9JVjt
	 mUmuKy2lMTbC3OyOoMGgZkCIR0Jf50TAQkAEmyd70lxN6m1n3WmohzZslosFXEzdHC
	 cnEhaIVJlQz+riaPK0Y4Q7iUcjlRxNndIlZHkdMz6FSHql9EKIZ2JbazxfEijDpO27
	 wfvi+waLKnJZ4ZqDJii7yAlSACnjNtNZznkNNEQ2Z23elLGfH8Z4gZ3vt4k6nO+Fsk
	 6tHq+vxFarxNQ==
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b54dd647edcso564500a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 23:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWtl3bZYia6jw/dqbXMvpcgCEi0FqJCdtUrKjjdUDF+LZhPT6DkCIySzCWiAcRRYlH972pACWATA2cq8Ys242Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzKIxREDSuHq/YtubOm3XtQtSfaRlnMHHJz2nF5/Y3XFnWTjiii
	Z7BAXl2WOmTmZ6S2aTSusgU4riXUPQMHXXy1w/UNjD/DhGbQoZVaV+VFWOV5itxlXLBjKYkvtVA
	t9jdJIIoyhrluu4+oPu5tHu1i/L+A7bE=
X-Google-Smtp-Source: AGHT+IGdtzOpvUYdPLtelHaB8zJ6rwGT1VrlFmtzCJU8l7UzsZsbFUnbb5aDI8NKj4eZKGgGJDmSr+LU1AO2yz3t6r0=
X-Received: by 2002:a17:903:32c9:b0:270:ea84:324a with SMTP id
 d9443c01a7336-28e7f328b47mr76608265ad.38.1759387209439; Wed, 01 Oct 2025
 23:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2@epcas5p1.samsung.com>
 <20250901051926.59970-1-ravi.patel@samsung.com>
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 2 Oct 2025 15:39:57 +0900
X-Gmail-Original-Message-ID: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
X-Gm-Features: AS18NWDO2eUChAY4_CCzuKLny2cYJfsAdkZKqOgM2dKZNuIdZKWV3kyYmcxtbLo
Message-ID: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add support for the Axis ARTPEC-8 SoC
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, 
	pjsin865@coasia.com, gwk1013@coasia.com, hgkim05@coasia.com, 
	mingyoungbo@coasia.com, smn1196@coasia.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074012_745381_DB94BA3A 
X-CRM114-Status: GOOD (  15.88  )
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

On Mon, 1 Sept 2025 at 14:42, Ravi Patel <ravi.patel@samsung.com> wrote:
>
> Add basic support for the Axis ARTPEC-8 SoC which contains
> quad-core Cortex-A53 CPU and other several IPs. This SoC is an
> Axis-designed chipset used in surveillance camera products such as
> the AXIS Q1656-LE and AXIS Q3538-LVE.
>
> This ARTPEC-8 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
>
> List of Samsung-provided IPs:
> - UART
> - Ethernet (Vendor: Synopsys)
> - SDIO
> - SPI
> - HSI2C
> - I2S
> - CMU (Clock Management Unit)
> - Pinctrl (GPIO)
> - PCIe (Vendor: Synopsys)
> - USB (Vendor: Synopsys)
>
> List of Axis-provided IPs:
> - VIP (Image Sensor Processing IP)
> - VPP (Video Post Processing)
> - GPU
> - CDC (Video Encoder)
>
> This patch series includes below changes:
> - CMU (Clock Management Unit) driver and its bindings
> - GPIO pinctrl configuration and its bindings
> - Basic Device Tree for ARTPEC-8 SoC and boards
>

Pretty useless cover letter since it doesn't say the damn most
important thing : dependency!

So this went unnoticed and now mainline (Linus tree) is affected. See
Linus rant on soc pull request

I'm very disappointed, actually mostly on me that I picked this up.
Your future patches, need to improve quality and probably you need to
go back to how Git works and how maintainer trees are organized. Read
carefully, really carefully please maintainer profile .

I'll be putting artpec 9 on hold, till you confirm what was wrong here
and how are you going to fix it in the future.

