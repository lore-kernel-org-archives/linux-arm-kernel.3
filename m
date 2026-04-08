Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADDE10F9953
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5zH5Yy++LFl5X1883WPkm0h00qGtgJqcjU1g/XLy30=; b=jqRMhCWRKpnOr5PVoJOoNNcATE
	69nJNUczX40s1uv/FkS4TOGXlLbqHSH797iL5z6UFm+0De2S88BF6sXbaF4L3ITCBXW/HAqlAbGQH
	4RCcn7+aa7x9eSp0im3xiS7nxGEmjoEhj0ozFMC1wphp0WqktPLp1QDNmy+oHACe18Z7UKaaBZ+bp
	XjVgIlT7xMZn6q5yMM5SlRrbGCRm1P0UfSJTjVIGsM2uTvKuiVCWwNVPy5ofkdOvYipRJH4DD5Bj2
	GhuNMfWCm20LtMX9FGzL3YbAB8X7lFZq2BL/JLwBKlgje3GhflQs8MxOy/iwdOOQoYbyABuqcEWzm
	7KwSuPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAV72-000000094nb-0tkD;
	Wed, 08 Apr 2026 15:46:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAV6z-000000094n9-2byV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 15:46:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82c68339cf0so597707b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775663196; x=1776267996; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5zH5Yy++LFl5X1883WPkm0h00qGtgJqcjU1g/XLy30=;
        b=mAqej2/Su0grJQeUsYTzNcsSIZ8LKTe0aArJJx7mzDhOsO9994EsFu2VR92dXrFPSv
         UKVDD0xQc3jme7E1Eza5vZLxNt56FBBTZXO6NZW7UNYozrrR3f5/QHt4/LDZnzNmaUdy
         lVDUyiCg5v+4qTIcnvBoln4pJVTJuTAIiwAmEO5CWKGhfbnGE+uhwkAy4UjCV22609tF
         xobkubZikRDwh61A8IrEjLyiJv+mk+SiyK9mopfEVCawWLdL6o/HXIqiA21X2elpNDrV
         3pmljgVIePe/YjOMgTSh7sYz5SwzSJb478oEAoWZPum/o6EX2lG+WW71PpBeiihxQBC0
         RLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775663196; x=1776267996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5zH5Yy++LFl5X1883WPkm0h00qGtgJqcjU1g/XLy30=;
        b=m6DsDBeU20GKey02y0H197A2jzsYk3aiDERAxDvOH3ZtGo/iY0BZ++n5CfP/FsqlYe
         uLry5+gj14hc2WCLOmoMbEPLfHKOM0PUM+t6Vroc9B1zMLCaOX3Y6rp+K9ymVU850lYC
         ouqqQrypn/4FUyRYnCIlVZBXM43sq6NXWL0xRwWjkHXR4J9mA0tBRwMDosY6y8CkAgnD
         XzsxGavwNTQZY+x81FhpiFJjORVtl17PPmTpAeyQiWGO+18Np+J+LxBNHxpRG2FES1J1
         J4PZgvA8F6ZpuRZKwtXJivLQdpX/2VYkd0hlnE4o5QPskBMWOxwUGC75kyCak8ODZUJw
         ncGw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/mKy602362413bSjug8K7H9n/RXwWL9oTJh4PUFqngYzJTl0av77YOtleXZuRxhDDRT6wsmcwVJDQ8+5Z5DP@lists.infradead.org
X-Gm-Message-State: AOJu0YzwfDG9TqyOvipYvgpVrDj0T5YBr8mkEo4axOhenZfPpzvv1cEt
	s2surK+eUfhmamYOfYxMtg2xgvsuimCw61sCvEGgHvARjwo6s6EdPnAaBNSs5OvWUvw=
X-Gm-Gg: AeBDietr5teKgcZ3CkVku+lT8zLaFBPbnhcFfGu0R6oDt82IcbIeMBjZt5d4+HYdS/N
	HgMqnJT9TjUDlYXgRo+DBgEwvGakZ5tF8Rg1ItttyTxgTi4SrJ0FwgELcZ3UmJ/Ipt4rytV8Yoh
	9x4jNwqlPk/WShKsCM7ovM+4t4PqMA3MtC4W/qnyq4GJ27YV3QY5ZS0wL2GNtixrRKSYcpm2ixU
	osMkdugvOu0346J00c6xAfUSzbqEbC3xnYtbLBKpuaDQAP1Tal5Jat9Bmg5ypfYvX9qOt9at49S
	7TtEP5dvLu8C98t3EEF7062p4QR3qHbmBDtQezoTHvOlvjNAUtjnHf3aTFOQcvd3E2dbbqmAad6
	9kYFaP9xegmL6667iVOvP0QoJxe0wMyZfDjL7ubQ127R/RrO0N2FOYYMcwa0LIzAknjXRUjaJr9
	C52Pjrvpgfr83j6ZmozPkp20UJVw==
X-Received: by 2002:a05:6a00:188e:b0:82a:170d:fe1d with SMTP id d2e1a72fcca58-82d001e92efmr22313731b3a.1.1775663196006;
        Wed, 08 Apr 2026 08:46:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bec3:28f:3ce4:6925])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm21534378b3a.29.2026.04.08.08.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 08:46:35 -0700 (PDT)
Date: Wed, 8 Apr 2026 09:46:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adZ4WIaC6WN97JhR@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
 <adUghiyZbe3fmcNX@p14s>
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_084637_676490_43CAA57F 
X-CRM114-Status: GOOD (  27.29  )
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

On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
> > SM CPU/LMM reset vector
> > 
> [...]
> > 
> > >
> > > Aligning the ELF entry point with the hardware reset base on
> > Cortex‑M
> > > systems is possible, but it comes with several risks.
> > 
> > I'm not asking to align the ELF entry point with the hardware reset base.
> > All I want is to have the correct start address embedded in the ELF file
> > to avoid having to use a mask.
> 
> I see, per my understanding:
> FreeRTOS typically exposes __isr_vector, which corresponds to the hardware
> reset / vector table base.
> Zephyr (Cortex‑M) exposes _vector_table, which serves the same purpose.
> I am not certain about other RTOSes, but the pattern seems consistent:
> the vector table base is already available as a named ELF symbol.
> 
> Given that, if the preferred approach is to parse the ELF and explicitly
> retrieve the hardware reset base, I can update the implementation accordingly.
> If you prefer to parse the elf file to get the hardware reset base,
> I could update to use them.
> 
> Options1: Something as below:
> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c
> 2. Use below in imx_rproc.c
> ret = rproc_elf_find_symbol(rproc, fw, "__isr_vector", &vector_base);
> if (ret)
>     ret = rproc_elf_find_symbol(rproc, fw, "__vector_table", &vector_base);
> 
> if (!ret)
>     rproc->bootaddr = vector_base
> else
>    dev_info(dev, "no __isr_vector or __vector_table\n")

No

> 
> This makes the hardware reset base explicit, avoids masking e_entry.
> 
> Option 2: User‑provided reset symbol via sysfs 
> As an alternative, we could expose a sysfs attribute,
> e.g. reset_symbol, allowing users to specify the symbol name
> to be used as the reset base:
> 
> echo __isr_vector > /sys/class/remoteproc/remoteprocX/reset_symbol
> 

Definitely not.

The definition of e_entry in the specification is clear, i.e "the address of the
entry point from where the process starts executing".  If masking is required
because the tool that puts the image together gets the wrong address, then it
should be fixed.

> The remoteproc core would then resolve that symbol from
> the ELF and set rproc->bootaddr accordingly.
> This provides maximum flexibility but does introduce a new user‑visible ABI,
> so I see it more as an opt‑in or fallback mechanism.
> 
> Please let me know which approach you prefer, and I will update
> this series accordingly in v3..
> 
> Thanks,
> Peng.
> 
> 
> > 
> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2, Debuggers may
> > > attempt to set breakpoints or start execution at the entry symbol
> > >

