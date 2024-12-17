Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E37CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97u39/mB75Gyvq3MUoP9A6BWuOZp1jV8oYjBZnf5YHs=; b=dgjHRmkNqyU+mDYdmAuVgOyI4B
	04TtetrViXekgIxJE44SSMSYGI1EtbkSeSeCKyjF0EUIUgVHkm/dshVJllbDKsx/EgOOhU8GH6s14
	1GiCa277W2Bl5mswY0jIa6R0arEPKH+YxNS6lGbE31KPf+m7wZObp3mLD9muHE6/B6ItLEZXW36v+
	dpquoUZ6QjG+h+cdv7gBVHQqPbTRyuNRvN/eD5cEO5X+pwQ+LKz8ZoamXzAIewpLMpDix3nrQ892a
	OBwGm60hMhfUAndkqzHKPviPh5flLAetjqrAlIXnOqERqQsgh+XE9SjXX4xAXRjyPul49jnuQXx3k
	0dq4P3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbGa-0000000EJXm-46D6;
	Tue, 17 Dec 2024 17:21:52 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbFU-0000000EJMh-1scT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:20:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso4367789a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734456043; x=1735060843; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=97u39/mB75Gyvq3MUoP9A6BWuOZp1jV8oYjBZnf5YHs=;
        b=dUZS2RuG44Xlv5Lg2Dm4ZoHVcO0ZpdqQf0phn8lDiM1NM45xoheeWBfWZSR5qJcfFg
         grNgjYyWCxjckRK0Uefwh5yXVdCDEfX5i6vK24zcq7efwlXTFDlGeP7D9HAoLWTyFlMV
         sbj78oSegYM01MmPhCUnw0YuD5z73J2DeCFaC9zX9pTe4WeLRRV44IBEryPu1kW/nHEW
         lQ50rsq8RtWW7249muP73CMHoitVBmctq6UvbRIvZIBINPJidWcsIDUdxOYhc9pR5GDX
         FnVB2zhDaBsaikMTcrXkU1vtTP9qLmp8Du1LMatuu7/40DLr0SrNi2lqGkOAmJZrUOP2
         r7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456043; x=1735060843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97u39/mB75Gyvq3MUoP9A6BWuOZp1jV8oYjBZnf5YHs=;
        b=DC+yS1Vj90pOqOvRG3xdEu0J2rbw32zZ0j2h/pJMaTOwigI/9y/qVovf/4HRhIZIzb
         aFEprK/CDH7o3I6j7VXmBYXLWj+4aor6NfeCEG1JF4QXYTbjcf1px7TY+QQ78o+AB9OQ
         PQJvzbA6EntoSpy8Ec3MNRP5xU+0gpkkV+Z/hCzH94vuEaqdXkSv39RdWc2Gy0pBKs+p
         ZVr9Vj7RV7ufiN8g6Wd1wub2+xzPeW540QbYe94W/bESvIEm0c50B+s1VQTQlcRxVnZ5
         ID37oT+fG4uSM+s7sce5bI6Gurhjos7Hq/oqPP/5oUblHX07+Fn6tQ+XHqTcHlA+F5xT
         DDGw==
X-Forwarded-Encrypted: i=1; AJvYcCXixyRqYHdxtIVzWoa/rw7wLfXvomtQnwiRKV6kBCBjRvAzl255Zr7Bo99kM5CkgZswSTzcmhfofIpO8OB2LLDX@lists.infradead.org
X-Gm-Message-State: AOJu0YzO6qaHABp/PdTEa5GiT/vUYEW2yawTG1sMQTh0nUsgasHpfIDj
	0NwgLVBa7jDvTP7F75MiiBkSl9cmBDmIqqVcEwUetMrN3imui+QOTd5/FCFoUQ==
X-Gm-Gg: ASbGnct0aKxm8A3EDDNQt7AU6YbcEBFpuGye7IzTeVM6ktkZNJ0pAM17nZXodGftYF2
	qzuRqbJ/cCI2TdhwqJdtTWNFuSHktHo1mBK7v32FiLF5xQ9uDSMJMO/7zARemNRt2RjLLNOkt9i
	OLjKV28hMCbMvsjqfuYhAz5f4ZwjRLyufhm2Q9UI/BqMEq0lSGYSfN/lW921lTyYnVZgUZmFTDT
	BQ5cxU5hKS6aU9VJnsHBAba6iHWYEpemUTfd92RtnJy/UCmibDc9WToYmqL/8+LieP7
X-Google-Smtp-Source: AGHT+IGjUccenohiYb+SDkdAmpf0k5ZpdC9204RkXFZyFmXwB9GNV/fs0d/6P1jKINhalSCuMQyisw==
X-Received: by 2002:a17:90b:2750:b0:2ee:7504:bb3d with SMTP id 98e67ed59e1d1-2f2d867445amr6395058a91.0.1734456043265;
        Tue, 17 Dec 2024 09:20:43 -0800 (PST)
Received: from thinkpad ([117.193.214.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2a2434a7bsm6848964a91.36.2024.12.17.09.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 09:20:42 -0800 (PST)
Date: Tue, 17 Dec 2024 22:50:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Christian Bruel <christian.bruel@foss.st.com>,
	Rob Herring <robh+dt@kernel.org>, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241217172033.zxl4bufakzx7eww5@thinkpad>
References: <20241126155119.1574564-2-christian.bruel@foss.st.com>
 <20241203222515.GA2967814@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203222515.GA2967814@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_092044_488120_CFC1BDBE 
X-CRM114-Status: GOOD (  22.47  )
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

On Tue, Dec 03, 2024 at 04:25:15PM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
> > Document the bindings for STM32MP25 PCIe Controller configured in
> > root complex mode.
> > 
> > Supports 4 legacy interrupts and MSI interrupts from the ARM
> > GICv2m controller.
> 
> s/legacy/INTx/
> 
> > STM32 PCIe may be in a power domain which is the case for the STM32MP25
> > based boards.
> > 
> > Supports wake# from wake-gpios
> 
> s/wake#/WAKE#/
> 
> > +  wake-gpios:
> > +    description: GPIO controlled connection to WAKE# input signal
> 
> I'm not a hardware guy, but this sounds like a GPIO that *reads*
> WAKE#, not controls it.
> 
> > +    pcie@48400000 {
> > +        compatible = "st,stm32mp25-pcie-rc";
> > +        device_type = "pci";
> > +        num-lanes = <1>;
> 
> num-lanes applies to a Root Port, not to a Root Complex.  I know most
> bindings conflate Root Ports with the Root Complex, maybe because many
> of these controllers only support a single Root Port?
> 
> But are we ever going to separate these out?  I assume someday
> controllers will support multiple Root Ports and/or additional devices
> on the root bus, like RCiEPs, RCECs, etc., and we'll need per-RP phys,
> max-link-speed, num-lanes, reset-gpios, etc.
> 
> Seems like it would be to our benefit to split out the Root Ports when
> we can, even if the current hardware only supports one, so we can
> start untangling the code and data structures.
> 

+1 for moving the properties to RP node where they should belong to. The
controller driver might have to do some extra work to parse the RP node and get
these properties, but it is worth the effort.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

