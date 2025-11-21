Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEE2CFA756
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Zl49bFVQ8HXNASEX2XzPWaAJ5IL+RSr8MjMD86xJZI=; b=Gsn+uPUEFr1A3EOLO6SgQ15nQR
	fYSzDeBCqxknBXBLKBTBtJIS2w12eB/KmP16fNVXGnIoD7MiU6g8vDpbmJJ4BaaWnsDtL4Zfn222W
	VjjSk7cqr+HnbNZ6gexjhOZUZNBopNagFiI31R7BH6Yn+NaPtGnwP+wBKeRf0EHmzVImiN5uKxSUH
	sOfAD01TYmZ91BLRhQfM5IoxabjdglLqYs3yz0cDZxxAP93AxMP2H0ZJ3Mc1mkXZm+nDAUBF/6nLu
	oULo52lg/eLB0dkui8cO+E1Jk/Un1c6wV1whXtRJSOYq3oydwa9E//8DYkDxNblpiLNwT4gMZk0vm
	/fXWwtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMrH-00000008686-3DE1;
	Fri, 21 Nov 2025 08:51:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMrD-0000000867F-2Ulk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:51:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-297dd95ffe4so15517145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763715066; x=1764319866; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Zl49bFVQ8HXNASEX2XzPWaAJ5IL+RSr8MjMD86xJZI=;
        b=VDMrOqsqwxvvdWrtwWBtRkjZ0r7cXtLRhF6Om3/Q8KSI05ALvH/2dmM8ecFtJiQwma
         4w5lRykzVSSsA+rjO/nvzbQlf/28n5lYhezyYZJ87HfGHRfZTeeZsk1JsA0/81eRjRLi
         1j926vFq9K/LPTgQ6ALcxZ9ml6qw7BXiPGYj+cchr0gSv0AjoldUryhfvZYTiV4bTvoh
         KwG5fIaztP9U1mJLcpHGLU7pKgYHiI0GzwveGoJo5KLEXgaiH/TNFvotoNOA8hKSIHw7
         82+nSZWMjyCE6hHgMtJ390tQPHizpD5vVdLwCbVCdlgS65qMRB1FpQDDv3phOw2DOW0v
         HKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715066; x=1764319866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zl49bFVQ8HXNASEX2XzPWaAJ5IL+RSr8MjMD86xJZI=;
        b=WH+hvlG8jlA3WszgFDJicoAnBHjaIpDr3VqmX2hfdDxA9qk5SH5EdT66WUpdEIYm8P
         opqmxk6u+Yepu9tEsIoxt+AGItiDPFsredyIRAIfnZgWte+0DzQtVjgUOQEvstkQ6yKk
         mqIa4Q/ZThO9UEoGGw2QrKk2oEoF73Ua+XOBnqsM4kRZs6MXGDu/DvkJh2CYEFXj4oDE
         hsg2XgxVQZtua81MsWrTbtfCZo9xz2A5o4JTIrSrPL2ufrhhtqkL5atHbpEquWT7VsBk
         8wUCN9/jCe6oWVjST0vg25zW9icqdArWX8LzrFJxD+jPfclcHf4DOquWQmTloH9ZHhzd
         p3ug==
X-Forwarded-Encrypted: i=1; AJvYcCW1QOoQQRaXsK3UQwytjzMdkjl9cE6w36sOivJmnWm1C1nR3WJit8iv+9iOwHhpIJsDIm4WNdBiCKwRWWI6EwvA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe1Xq8kwtTMt66+SoyGjsOoKsKbpod/GN4+diyLDlqKFgLqRTx
	3PY6S6ln4gDwolBJ1cFInETMDA0T0ZsenZA2qNITPbvuRB7y/STkWOW4wmxpZ0CszoA=
X-Gm-Gg: ASbGnctzUT3xEGaK5xA11GV5KD10H3rwk3UarHKtnFUYGfQnGxJDlYL7UHjpChWtg8O
	VpNmNcPQ6/tYWethRxTvGIerNdvjBOpMFC3nx8wgKPzYNmMyB0kfUEIuYsm0Czv6rb0ScImsbPn
	vKUYo/wW2VxTGaqt9aBOWspZMH2kA+k5G7biHphpW9duw1odrdRt+C64BVjk28FF3f9uR5p1PCL
	XXhxXGFDcMD2KdBUGgjnPhk1CLgNiACm3+9MaB4TXxES8CnxQ36k++4NWN/wE3JW/6S9IHZlQZ1
	J1ru0iqHx7iJ/4TMs9uePMc3u11qNWLZH+PDz90O8DC8JJ3qyJT9KlUtdlrU53nBCbCBuaiSPhd
	H2PPywn1tErA7psIzoBksiHwc9gNSfO+tTdZ8inpsFpOPEfwc4/NKAD4EtYvvMxS3poj0SRb0mY
	OK9ao6oJnIiUbDUJ4L
X-Google-Smtp-Source: AGHT+IForle4Voi5B250DXGCJPKzmYnRrMuv4VZwFpXmqKqn4IMqRvfMy2WJ1GWndhzWr/EzoK5qvQ==
X-Received: by 2002:a17:90b:35cc:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-34733f19c00mr2066526a91.24.1763715066040;
        Fri, 21 Nov 2025 00:51:06 -0800 (PST)
Received: from sunil-laptop ([106.51.195.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b036a282sm5593927a91.4.2025.11.21.00.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:51:05 -0800 (PST)
Date: Fri, 21 Nov 2025 14:20:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: niliqiang <ni_liqiang@126.com>
Cc: apatel@ventanamicro.com, ajones@ventanamicro.com, anup@brainfault.org,
	atishp@atishpatra.org, bjorn@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, frowand.list@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, maz@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org, saravanak@google.com,
	tglx@linutronix.de, hu.yuye@zte.com.cn, deng.weixian@zte.com.cn,
	ni.liqiang@zte.com.cn
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for
 direct-mode
Message-ID: <aSAn8DdQVBBzenlJ@sunil-laptop>
References: <20240307140307.646078-7-apatel@ventanamicro.com>
 <20251120144311.5083-1-ni_liqiang@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120144311.5083-1-ni_liqiang@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_005107_652264_A31D86AE 
X-CRM114-Status: GOOD (  25.70  )
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

Hi Liqiang,

On Thu, Nov 20, 2025 at 10:43:11PM +0800, niliqiang wrote:
> > diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
> > +static const struct of_device_id aplic_match[] = {
> > + { .compatible = "riscv,aplic" },
> > + {}
> > +};
> > +
> > +static struct platform_driver aplic_driver = {
> > + .driver = {
> > +  .name  = "riscv-aplic",
> > +  .of_match_table = aplic_match,
> > + },
> > + .probe = aplic_probe,
> > +};
> > +builtin_platform_driver(aplic_driver);
> 
> Dear Anup Patel and all concerned,
> 
> I am writing to inquire about the historical rationale behind defining the APLIC driver's
> initialization priority using builtin_platform_driver in the current implementation.
> 
> In our environment, we are encountering an issue where this priority level causes ACPI-based PCIe
> enumeration to be executed in the system_unbound_wq work queue. This parallel execution model
> results in PCIe devices being enumerated in an arbitrary order rather than strictly following the
> sequence defined in the ACPI DSDT table.
> 
> The random enumeration order is adversely affecting customer experience, particularly in scenarios
> where device ordering is critical for proper system operation or application compatibility.
> 
> We are considering modifying the APLIC driver's initialization priority to ensure PCIe enumeration
> occurs sequentially according to the DSDT specification. However, before proceeding with such
> changes, we wanted to consult with you regarding:
> 
> 1. Were there specific technical considerations that led to the current priority selection?
> 2. Are there any potential side effects or broader impacts that we might have overlooked?
> 3. Would you support such a priority adjustment, or do you have alternative suggestions to 
> address the enumeration order issue?
> 
> We greatly appreciate your insights and expertise on this matter, as it will help us make an
> informed decision while maintaining system stability and compatibility.
> 
> Thank you for your time and consideration.
> 

IRQ subsystem maintainers rejected the idea of relying on initcalls to
enforce probe order because initcalls do not guarantee ordering. The
Linux driver model instead ensures probe order through device
dependencies. Since PCI INTx depends on the APLIC being probed first,
the PCI host bridge probe cannot occur until after the APLIC probe
completes. This requirement and behavior are the same for both DT and
ACPI. In DT, the driver model uses fw_devlink to establish probe
ordering, while in ACPI this is handled through either an explicit _DEP
or, on RISC-V, the GSI mapping.

Typically, this dependency appears in the DSDT only for the PCI host
bridge. Individual PCIe devices are enumerated through the standard PCI
scan once the host bridge has been probed. Therefore, I’m not sure what
you meant by a probe sequence defined in the DSDT for PCIe devices.

Regards,
Sunil

