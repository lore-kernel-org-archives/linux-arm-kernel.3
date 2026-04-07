Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F4FF5105
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=; b=t1WBlBMVCUkuAg5zB+ipcpE/Ya
	/OcFGbsmxWF+sVsRgPd5uEXCTGfYqwNbH3GNZ5bp4d+pAi3+uikwuXe4i4UIzArYnhB0GpbFxXOD9
	EGEi0UTeGt3skS2lCf7YM3ZlMb6wwjfWWs4DZR/VL81oPWJ22Dk51Ue6soeWrKRn2XPe7HIdLgbE9
	XE385ITfF1WtKQmVKEcGGkNxB3HgKGu58zQAoyqkR4G26Z86ytLUc9ZwzyGy9xPyqedjTz8dZh2WR
	zgjAT0u4GXGYuI29ZmbPyNtyStO2mfhNwEwhHzIPDOfoxADMyGRYmGz1Q8TyR6QCpRKyayDpDD30z
	5He+PDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8DO-00000006ghP-2i1S;
	Tue, 07 Apr 2026 15:19:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8DM-00000006ggr-05E7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:19:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82ce49785a0so2177613b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775575178; x=1776179978; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=u+1hzlGMzAAdNTzKGuxgu7+WoS3o5qEh/UnnmWdDwFdtfoUtKfrCeKxD6egPZGwICK
         hrAFIV8IdYo+tGlLRPhTwWRptPJOcg8mtMj9PCU0NTq7fiXNkvgFH666JzjMZrLAZOp5
         e3+YSIU+3Q3bW1gj6hxcxWyVaawQaf+2b27cO3LrWfecE6psE+hTrVwEgCSPjA1FH4xq
         4/qjDxOicmGVJ7jNqzJjMqA/Eb7O0h4tOUytswDc+zZNu275KTe+TvgvejSE9NPfSd9e
         sVz3FH8cYwrA85tF8ovp/ju3PQeCS661zVKyq4aiLeKC+e6ER4jpqTcELqzvKkTrT7bF
         TLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575178; x=1776179978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=gsvjZpkkoGeX54LSgPIisekVhOL+rHLBWgerNqf0LK4KmR1Ov9B3x2lj/ykgcl1CCS
         T0ldWDA0fSAz0wFzWIPiQDjZuSCoZv1NvKzh3DD4UrTO3MaVRAosmUoB47sJLUtkEc3/
         ThzxLqHb2haNFDNlEcsttby3QhOVN1rg1JRMC02+afNpNLhhoC01I2ZBCjFREySclD8y
         DMFpMwbL+xXnqQocqkYwLPWcmre/eATTMNXKCp0o18m8JnkuJovEy4Qdy/UESnlACpmZ
         A+1SPTQBzFMkHsqyFgRi2YK+0MlcsZct9es32rRPXqPXj7aYTedWgn3F8m6tLjRYlaGK
         pkYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEDOGVcp3K8rWi4tGHa59/muDX3eKhbB8r0LKlMpL2CYMGgsngQPs2O7rFFPngfl39bnAwQ3QEQCsf6J5F/527@lists.infradead.org
X-Gm-Message-State: AOJu0YxDm8IezRoDv8GyzK6jRUUgTIIbKkjWD8aGzQO74bZJ+V6F2B/J
	Lhnc4QY5CtikxBQd6NH126ykDpPVk7xKXOCfsLQgGWhbkxMFEOpJOOZvDRh08Mxjz2A=
X-Gm-Gg: AeBDiesc+O1ygVR+YtUOL+YHTWKhrlZUCww9jJyy64vFh6ht4WtJn+qtw9j/Su1cZE2
	2P2F1UtQsCLm1236ezp+amerPv5QIndYITOzKW8XWFe3En1wbe8QnzQRYKDe64Z8Ep6qNekXxN7
	3ZdpgIjOx+OlBqv6tSUcmYPkyhLu7F3f2QhFCOfTwwBjotXIIt/nXhUAsgJ3LsxCrO130261v2k
	aZDSqRjIVwwDdi7fq50QvNi/oTQIjFhfbhSX7s3C9Wqt++LE5a4pi1umxzz6M0vumuXnTCgxvA3
	j/4uvEykBJCQ6XLg01ViSJ495n4UFt/6Dzf6dKtpwRULXr0FYrl9UFZaIMbnzt03qmmmT9579Qn
	lnBdFJulqurtRhLS+rUIQAjjpJS3O78rScNie3x2cyxwAbCdR5uJltb8MP09ntH+hyIiAqZc8Hr
	/IbEoA34nhXiArZ3BX65ZnRBlh34E=
X-Received: by 2002:a05:6a00:3926:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-82d0da2c50cmr17909669b3a.5.1775575177733;
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:97a2:befd:d439:79fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm18101364b3a.45.2026.04.07.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:19:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adUghiyZbe3fmcNX@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acs2PAZq2k3zjmDW@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_081940_088302_3B4368CA 
X-CRM114-Status: GOOD (  22.56  )
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

On Tue, Mar 31, 2026 at 10:49:32AM +0800, Peng Fan wrote:
> On Mon, Mar 30, 2026 at 10:22:35AM -0600, Mathieu Poirier wrote:
> >On Fri, Mar 27, 2026 at 10:42:03AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Cortex-M[7,33] processors use a fixed reset vector table format:
> >> 
> >>   0x00  Initial SP value
> >>   0x04  Reset vector
> >>   0x08  NMI
> >>   0x0C  ...
> >>   ...
> >>   IRQ[n]
> >> 
> >> In ELF images, the corresponding layout is:
> >> 
> >> reset_vectors:  --> hardware reset address
> >>         .word __stack_end__
> >>         .word Reset_Handler
> >>         .word NMI_Handler
> >>         .word HardFault_Handler
> >>         ...
> >>         .word UART_IRQHandler
> >>         .word SPI_IRQHandler
> >>         ...
> >> 
> >> Reset_Handler:  --> ELF entry point address
> >>         ...
> >> 
> >> The hardware fetches the first two words from reset_vectors and populates
> >> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> >> Reset_Handler.
> >> 
> >> However, the ELF entry point does not always match the hardware reset
> >> address. For example, on i.MX94 CM33S:
> >> 
> >>   ELF entry point:     0x0ffc211d
> >>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
> >>
> >
> >But why?  Why can't the ELF image be set to the right reset base?
> 
> Per zephyr general link script[1]:
> ENTRY(CONFIG_KERNEL_ENTRY)
> 
> CONFIG_KERNEL_ENTRY(_start) is the first instruction that Cortex-M starts to
> execute.
> 
> config KERNEL_ENTRY
>         string "Kernel entry symbol"
>         default "__start"
>         help
>           Code entry symbol, to be set at linking phase.
> 
> The hardware reset base is different: it is the address where the hardware
> fetches the initial MSP and PC values from the vector table. Hardware uses
> this base to initialize the stack pointer and program counter, and only then
> does the Cortex‑M begin execution at the reset handler.

That part is clear.

> 
> Aligning the ELF entry point with the hardware reset base on Cortex‑M systems
> is possible, but it comes with several risks.

I'm not asking to align the ELF entry point with the hardware reset base.  All I
want is to have the correct start address embedded in the ELF file to avoid
having to use a mask.

> 1, Semantic mismatch (ELF vs. hardware behavior)
> 2, Debuggers may attempt to set breakpoints or start execution at the entry symbol
> 
> [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc1/source/include/zephyr/arch/arm/cortex_m/scripts/linker.ld#L103
> 
> Regards
> Peng.
> > 

