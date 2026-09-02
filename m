Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B976C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=; b=vQqQ/X7E5VROKZw8NbbyAO0IJK
	BwYYSfIsQZVXCuZGoEXnjuRfUFuJUBD2u2uIg9m4m/n5mFGsClwVi8eV7upmgFgDblTIBi5sLFahv
	mt6KFd5mBwam1yDkePr7s5jG9nZsyRAag8TPw6dF0lzuUoV/y5WTE5ZRS5cx3n7qV+e9lpyqH7z7a
	rPSBuXO/eWYXbPVGevrCCosZCZHbYWiSGypTwEBNpBtVDRZZP7NTud5iKQIsSVGPvfJZ/qqqiY0ln
	Forzh9rvxdHeFZd9WSLZOGcxtr0F4OwPe0kvN/Si14S5gvnRW5LCQpSE3Dcqo2/6iczf+1sD0cofC
	vYzbVGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1obG-0000000FQ2C-1GIm;
	Wed, 02 Sep 2026 17:18:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1obC-0000000FQ1Q-2gCM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:18:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso10282345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369489; x=1788974289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=bC9THaLpcuaVCr5pUVcmWxd0IDX0IagQz5OxWQjM1pcdOIIcq/DVBzVJgACYd/UkdC
         eipezI1z8P18XrV61YEiFJbC4boR9dg5Ga2oEgxw2wpguIWwaRPu6rfDzWh7qlxWwBsj
         8GGht8xADyr3OhEpEd8RT6pe+WJ9PKhAy+wCUxtRD5A7jQ/CAgoET1KTQP/s2qa2ow9F
         J9IqkieCs/XWYOZttQa48VpdvPj0vYG8jKPfnc+n+KKnI14L4KxgeKpVia0iyUPavb7A
         AiOqbA3jOdShS3HuxaDaNRe6IY6AMBcApRYFWbr8TO9CfH0vNC9PeDx5I/MZ87lqh1pr
         ZJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369489; x=1788974289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=JaBv0y7eLTtSMpkkwOKyTsTUL05YnpzULt9HRTQPlvgNWAU/5MCoEiaHKNz7alUgxQ
         YiPQ1zWNfd03EK/VarwAbcrnWgOt8KRotZWos4/VADczyJEy+ZOKbqEOyuf6umWErLsi
         Z0y0VWJ7h+gTQ7LVnGx2fOL3vawzsSehsCKKkB1bvoo/hYv2n36zpbvRfM6Z+X7PbGHZ
         Hw3PxEqNzj+/tuYFrn3FRFzJROM2GhsWIVx/ts1rwI39niK2auBQe259wA/lP5QxFYih
         FY2RQrD5dgtgwQUb0MCf6yrG+ZtCSZnEzJodQFxFmJMqWLtbxGmcncKjWSKCAJSUTfXE
         orcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGrGaW9XamXIon7KUi0Zyvwj4SEbnF1tQuk+TWlBniLJallCMkyk7IhoRwHYgy0zWeNgHvKRQivD1vR3ieXRKA@lists.infradead.org
X-Gm-Message-State: AFuF++lW0/HT3nzOdvFC7WrpnVOeAIoCmh5lgOVm2sdokfnOLYshx3j0
	OMyODfvF9NpIaaLBdTivmNIH6cYMHVkvVcX094LswHkj76cJlRGz0xmq
X-Gm-Gg: AR+sD103ROmTnxKdmOfU8FIVGRtJ4KALQx7cyfFAPRb4Scg4zqIit7nt2T7J+j60DOb
	fcGVOgkSSeKxTlcV1j+luZ3kaRzxH13w+eDIFaAIaCaYJt4eO1j2SKkovmA6YTlkUC9LVb2lj99
	J2vyTd3Z2OPFV/U5OCrwbQgSE0ZI6yC/VtCSZvfBVbdBVLE1MS7aiOPr8PdVjdZu5K28p/dTnRz
	kFVZcvQykTd2EZdZc+msPnpc58JprMWlUaW7ZpWLdQQN6xfN1vVmfVbAbPKoEbW07CA3J61Jpq/
	f9tqZGUQo1VHAsKgT5fJNNSh+PLYiYpAjq2uSzB1W+qDfEp77pC3tbm/s1aVfS6f7ob82BvdfJf
	NtM8v0T9DKqYrkxRYVmsdgQnKilljpsGynoP1q51ivwU8XSXE3NjueiAj4Gzsx37KLHStrdZZOc
	ke2yov0niUUYpnxy9fSceww/2aetrc5NhTG2JPrZyruWS82NiPA5qe54lZqEK/TSmD3/Fa/VG2b
	6gw
X-Received: by 2002:a05:600c:4f88:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49ce58388demr95277025e9.10.1788369488491;
        Wed, 02 Sep 2026 10:18:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm8076593f8f.10.2026.09.02.10.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:18:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 19:18:06 +0200
Message-ID: <20260902171806.4141524-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902155931.38FCC1F000E9@smtp.kernel.org>
References: <20260902154525.4090276-2-mehmet.fide@gmail.com> <20260902155931.38FCC1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_101810_723738_79542CDA 
X-CRM114-Status: GOOD (  23.26  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> This isn't a bug introduced by this patch, but since you are adding bounds
> checking here, does imx_pinconf_set() also need this verification?
>
> Without validation, a malformed gpio-ranges property in the device tree could
> translate to an invalid pin_id. Since imx_pinconf_set() lacks the
> if (pin_id >= info->npins) check, this unvalidated pin_id could cause an
> out-of-bounds array access in imx_pinconf_set_mmio():
>
> 	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
>
> Could the same missing bounds check also cause out-of-bounds array accesses to
> ipctl->pin_regs in the GPIO direction callbacks like imx_pmx_gpio_set_direction()
> and vf610_pmx_gpio_set_direction()?

No. Everything that reaches the driver through a gpio range goes through
pinctrl_gpio_request() first, and pin_request() looks the pin up with
pin_desc_get(), which fails for a pin the controller does not have. A bad
gpio-ranges entry therefore fails the GPIO request, and the direction and
config callbacks never see that index.

Which also means the npins check I added in this version is redundant
and its commit message overstates the problem. I can drop it in a v4 or
keep it as a cheap guard, whichever Bartosz and Linus prefer.

> [Severity: High]
> This is another pre-existing issue, but does imx_pinctrl_parse_pin_mmio() also
> lack bounds checking for *pin_id during device tree parsing?
>
> The pin_id is derived algebraically from raw device tree properties:
>
> 	*pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
> 	pin_reg = &ipctl->pin_regs[*pin_id];
> 	pin->pin = *pin_id;
> 	pin_reg->mux_reg = mux_reg;
> 	pin_reg->conf_reg = conf_reg;
>
> If the parsed *pin_id exceeds info->npins, this uses the unverified index
> directly on the ipctl->pin_regs array, leading to an immediate out-of-bounds
> memory write.
>
> Does imx_pinctrl_parse_pin_scu() have a similar vulnerability when indexing the
> info->pins array with an unverified pin->pin?

Yes, that is the one real hole, and it is where the fsl,pins value is
turned into an index. As said on v2, I will send a separate bounds check
for the parsers after this series.

> [Severity: High]
> This is a pre-existing issue, but can concurrent driver probes cause
> hardware state corruption of the shared input_reg in imx_pmx_set_one_pin_mmio()?
>
> There is an unprotected read-modify-write on shared general-purpose IOMUXC
> registers:
>
> 	val = readl(ipctl->base + pin_mmio->input_reg);
> 	val &= ~mask;
> 	val |= select << shift;
> 	writel(val, ipctl->base + pin_mmio->input_reg);
>
> If two drivers concurrently request pinctrl states that share the same
> general-purpose register, and the pinctrl core calls pinmux_enable_setting()
> locklessly, will these RMW operations race and overwrite each other's
> configurations?

The core does call set_mux without a lock and the driver has none around
that read-modify-write, so in principle yes. This series does not touch
the mux path and I have not seen it on Vybrid, so I leave that one to
the i.MX maintainers.

Mehmet

