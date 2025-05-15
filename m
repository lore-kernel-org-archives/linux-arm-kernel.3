Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5BEC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5Dm294PbrWONSf7K3CLqY0H7cYyRoYEw+bT1IPWQHo=; b=yU1LDzdum8CppYviL0EZNKxyVp
	lhsi3ULw0LIVm1La+mONbhQvJdEUttVtp8FYki9TEp7ZN6prCeVZ5J1P20xgJhkRpSt8luLhJSG4x
	tO6Dk2otj/Wc4MYNTz8oncWEXOU+ywU9mGqSVyfJ2PYca3J2SPecxp1Vjvf5/3qa/5UtpAfvbBJ0B
	PdUDUku/i9EYzle6A2aJptimwY4wFeWgVNphj6Ah/QNsEl6x2lr27TI8mxzx+SA42tI0t5YJVQzjL
	7TaoIBSWBNalFqAH/yCNV5lxcBOfglsSpI1/88A4JOezzhKDqLWQDVT+u+k2gTLje8qYwJ+O/awLb
	+/5hcKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXLI-00000000Uih-1z2c;
	Thu, 15 May 2025 12:05:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXJG-00000000UR1-3lHu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 12:03:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-441ab63a415so9092405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747310613; x=1747915413; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5Dm294PbrWONSf7K3CLqY0H7cYyRoYEw+bT1IPWQHo=;
        b=KE9fAo6K2OAOP6Dr4HR4V91DBVp8iwpXiDtZY4s9nW1fdqsL3gBcdeBNH069Wx5kn5
         jZXY/Qem0AKkKjeVxwURFj710CWL4M2k7D9kBKeh/aL6hm5YMkfru2o5jaD5UkZkmKXH
         5wMsLNbxFdiAAdY+ADi+7HHJLLpjnd7bRGufVsNqgJlA5IP38mVnZAM/0bAh6s8OP8RF
         Fc1lQr2btkUrMwGzT1A+XqsfabZ84/+Zh17n/vv8MSp7B4vELfI+nXyYDBiDkahfA/Cl
         NJXSQ9Yo2X0sRwMoO0+XkspphN12HLYLSNcGOavZz1yIMTY5kKdy9NSj4aivGpusViXv
         CYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310613; x=1747915413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5Dm294PbrWONSf7K3CLqY0H7cYyRoYEw+bT1IPWQHo=;
        b=G7LHmj/Fi7tQuvTo1QRdOBqQNzF97u6Nd9kiExhebq0MSkhpahJh9SdU290mHtvbbI
         LDvTFkBgbgO3Q7n2MpCnPJlv3APPyvOSUpHeWsQsb6SknNaubd2Fc3l6G2w9fYuWivIP
         yb7tOigkBe8CfMNPFiacRmRpKfDbfmPoGfuuoiQr4G5d6zmZYZyQeYO/NPsMmFF3KtoY
         IYnGtc1b/wUyXnimxdQGalP7T/c6lo7kC50qgfsLwFJgSIRFj6XFA4XPg0dwq23KJBpS
         Bnt78l3ZZeNl1soGP8DBxVLsBPvSxvvt1QpZsiH/gIS0r4XVimRmH02MScyX4R9iQflp
         Thuw==
X-Forwarded-Encrypted: i=1; AJvYcCVmnwdRk85tfiEk5afsJVkvjBeXXgp6wnVyC/dXq8woOrXcGJA5S+rpaCrGa+M0ZEwQjawjGliOV8tH4PmiuPJT@lists.infradead.org
X-Gm-Message-State: AOJu0YxpGYaPlYH5YERqamoc8caqD4AbuMWWXw6JR0KjwmWpK76PA9sI
	NhLlswyxTP3aVkId/KIPl/7vRSfxuEQ9+gkmVprONtntlYHSy7cZ3yi7A6VB7A==
X-Gm-Gg: ASbGncvSrPLy0AnH0ErHOS/zrcyRY7TXGD5Tqkt7UXzPFTTfWW/ponaDgJdimwDgy4N
	ZdxIGWpUbtCu/inisIrLOCu8438ddEHXQTfnCVFt127ZoXYI6u0Rl8SAgcVpAtwdq22IvWvEe4z
	E0fsCAXmf7XYxTAf4woF7UiUuyWVTNpRVrB84KOfVoFKMyR4q+C/j7JxI+HINY/JviW+OUQo6HZ
	Q4EtdoL3/UpIYR23tTRXMxmNA5/pe1sICgw3CHp9fZZuwUIpyBFsHxEgUrbrsfD9PlJLPRHt8OW
	mYCO6bgJ0lBXL8g65s5BGWS0OcVmZMs3kWpBWpxsOVoBh+69A4V5QSIjljM5SXikbv7NRweHaGa
	FJ2GV+aA5jU7JEg==
X-Google-Smtp-Source: AGHT+IHlVMLx2LBOebfEdakAr7jMaTKb4vKCXk6oSYtrA1JygFEFmKNR3fFjnt2BvUb5BojRv/MYmQ==
X-Received: by 2002:a05:600c:a42:b0:442:cd13:f15d with SMTP id 5b1f17b1804b1-442f217a65fmr61066245e9.29.1747310612978;
        Thu, 15 May 2025 05:03:32 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2961sm22525510f8f.45.2025.05.15.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:03:32 -0700 (PDT)
Date: Thu, 15 May 2025 13:03:30 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de, yue.wang@amlogic.com, neil.armstrong@linaro.org, 
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <wqzay2jvimjvpsj5rzh6xwxgmrerma5qesbwa6fkjepibhdv6e@hi4dpp4kmt5u>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
 <oy5wlkvp7nrg65hmbn6cwjcavkeq7emu65tsh4435gxllyb437@7ai23qsmpesy>
 <20250509160025.s65aw5ix6s7533b5@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509160025.s65aw5ix6s7533b5@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_050334_947699_B2469F43 
X-CRM114-Status: GOOD (  54.08  )
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

On Fri, May 09, 2025 at 06:00:25PM +0200, Pali Rohár wrote:
> On Friday 09 May 2025 12:38:48 Manivannan Sadhasivam wrote:
> > On Wed, May 07, 2025 at 06:36:20PM +0200, Pali Rohár wrote:
> > > On Wednesday 07 May 2025 23:06:51 Hans Zhang wrote:
> > > > On 2025/5/7 23:03, Hans Zhang wrote:
> > > > > On 2025/5/7 01:41, Pali Rohár wrote:
> > > > > > On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
> > > > > > > The Aardvark PCIe controller enforces a fixed 512B payload size via
> > > > > > > PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
> > > > > > > core negotiations.
> > > > > > > 
> > > > > > > Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
> > > > > > > PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
> > > > > > > during device initialization, leveraging root port configurations and
> > > > > > > device-specific capabilities.
> > > > > > > 
> > > > > > > Aligning Aardvark with the unified MPS framework ensures consistency,
> > > > > > > avoids artificial constraints, and allows the hardware to operate at
> > > > > > > its maximum supported payload size while adhering to PCIe
> > > > > > > specifications.
> > > > > > > 
> > > > > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > > > > > ---
> > > > > > >   drivers/pci/controller/pci-aardvark.c | 2 --
> > > > > > >   1 file changed, 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/pci/controller/pci-aardvark.c
> > > > > > > b/drivers/pci/controller/pci-aardvark.c
> > > > > > > index a29796cce420..d8852892994a 100644
> > > > > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > > > > @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct
> > > > > > > advk_pcie *pcie)
> > > > > > >       reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > > > >       reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
> > > > > > >       reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> > > > > > > -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > > > > > >       reg &= ~PCI_EXP_DEVCTL_READRQ;
> > > > > > > -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
> > > > > > >       reg |= PCI_EXP_DEVCTL_READRQ_512B;
> > > > > > >       advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > > > > -- 
> > > > > > > 2.25.1
> > > > > > > 
> > > > > > 
> > > > > > Please do not remove this code. It is required part of the
> > > > > > initialization of the aardvark PCI controller at the specific phase,
> > > > > > as defined in the Armada 3700 Functional Specification.
> > > > > > 
> > > > > > There were reported more issues with those Armada PCIe controllers for
> > > > > > which were already sent patches to mailing list in last 5 years. But
> > > > > > unfortunately not all fixes were taken / applied yet.
> > > > > 
> > > > > Hi Pali,
> > > > > 
> > > > > I replied to you in version v2.
> > > > > 
> > > > > Is the maximum MPS supported by Armada 3700 512 bytes?
> > > 
> > > IIRC yes, 512-byte mode is supported. And I think in past I was testing
> > > some PCIe endpoint card which required 512-byte long payload and did not
> > > worked in 256-byte long mode (not sure if the card was not able to split
> > > transaction or something other was broken, it is quite longer time).
> > > 
> > > > > What are the default values of DevCap.MPS and DevCtl.MPS?
> > > 
> > > Do you mean values in the PCI-to-PCI bridge device of PCIe Root Port
> > > type?
> > > 
> > > Aardvark controller does not have the real HW PCI-to-PCI bridge device.
> > > There is only in-kernel emulation drivers/pci/pci-bridge-emul.c which
> > > create fake kernel PCI device in the hierarchy to make kernel and
> > > userspace happy. Yes, this is deviation from the PCIe standard but well,
> > > buggy HW is also HW.
> > > 
> > > And same applies for the pci-mvebu.c driver for older Marvell PCIe HW.
> > > 
> > 
> > Oh. Then this patch is not going to change the MPS setting of the root bus. But
> > that also means that there is a deviation in what the PCI core expects for a
> > root port and what is actually programmed in the hw.
> 
> Yes, exactly this aardvark PCIe controller deviates from the PCIe spec
> in lot of things. That is why it is needed to be really careful about
> such changes.
> 
> Same applies for pci-mvebu.c. Both are PCIe controllers on Marvell
> hardware, but it questionable from who both these IPs and hence source
> of the issues.
> 
> Also these PCIe controllers have lot of HW bugs and documented and
> undocumented erratas (for things which should work, but does not).
> 
> So it is not just as "enable or disable this bit and it would work". It
> is needed to properly check if such functionality is provided by HW and
> whether there is not some documented/undocumented errata for this
> feature which could say "its broken, do not try to set this bit".
> 
> > Even in this MPS case, if the PCI core decides to scale down the MPS value of
> > the root port, then it won't be changed in the hw and the hw will continue to
> > work with 512B? Shouldn't the controller driver change the hw values based on
> > the values programmed by PCI core of the emul bridge?
> 
> Marvell PCIe controllers has their own ways how to configure different
> things of PCIe HW via custom platform registers. This is something which
> needs to be properly understood and implemented as 1:1 mapping to kernel
> root port emulator. Drivers should do it but it is unfinished. And as I
> already said I stopped any development in this area years ago when PCIe
> maintainers stopped taking my fixes for these drivers. As I said I'm not
> going to spend my free time to investigate again issues there, prepare
> fixes for them and just let them dropped into trash as nobody is
> interested in them. I have other more useful things to do in my free
> time.
> 

If the patches are not related to unloading the driver which acts as a msi
controller, I don't see issues with them ;) But I have no visibility on the past
conversations.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

