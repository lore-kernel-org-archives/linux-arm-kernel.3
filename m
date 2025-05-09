Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3F8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 07:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77qkoKjDKq6SXETuhF5rMrUj8XsUUdj7U8eiTVCOHj0=; b=NVjqNkaWpQDkU74fljjdN4Q/92
	/nD0tl8uwdSGq6Qpc3pTj2u3Ibrrau7JTVYLTjC34w5WvAdCapDdVnxxHZK6/xXhYte/pYihFZM5n
	30Uihtw3yvzGHBz3WUi2x0ueuqJ9pSE5vZI50VGlExy5Clpaaq1ArUeQxNB9Xk5QjNZNl1Hug4UWZ
	643rocDprCCcOaOBqBsTK6ydrs/Dkhyo7ZIkKyVXqR4NLQZVBvuPlOdtfTuPhZCAzplhWQS3SoJ8y
	tW1Rvfoiw5fuvGv3gI8jZB0jEc2aweDjVsyjze4tyjfTJjBUXRt0yC36nsf7fyDrIsQ5U3wkvG9KB
	Q6RX9BOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHuB-00000002i86-0iNM;
	Fri, 09 May 2025 07:12:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHqm-00000002hTf-2ymE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:08:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so20098805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746774530; x=1747379330; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77qkoKjDKq6SXETuhF5rMrUj8XsUUdj7U8eiTVCOHj0=;
        b=O83win9nZiSXpeKSeZeFecCvVfRtVkPKh0emZ/N2x8igXlF8Wk6fugVvbEDoArAfkB
         V5f0HLfho3ONkZanuztzjDgUcVwROlYtA4HQV/O6q1nAtPSaNCNJJExyRhhai+lekJ41
         q3YtK4CUAgAzktGDcZSISNv8u3C0X5njfg3Npkgf3ochOQg+bzj9g5XgxEKp24JeRszm
         orteriQddZ3ijDBfpJ01rfWjuzx75AfBgIXaJFfLPk9g/YLsiQLJJX7n6CQSImPh/1Oc
         0i4w/Uchs/VVJWW7BaRfGaVf9JUL9WgMJEs4MoGghHr11fGLUqSzsWeQwGXdyynzoUBV
         /m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746774530; x=1747379330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77qkoKjDKq6SXETuhF5rMrUj8XsUUdj7U8eiTVCOHj0=;
        b=TLJrjYMr0s1HkMJt4TANRbZjLbt0n9owaJWmuVf7XZdP0EwuBOCdhh9823v+7G5oqX
         2S1/Xe76oCxfRHw7seKXLiTW8B7DxBVxlUGGhSAc7fOBPsYZNQ/8cfEUABs76k7Ht+xI
         f2CHL5G7ZyGQZbbgDBveWR+IntIM71cJ+CzvNEE5/lBCQoO3sbLJXVmbtiU7vyfCBUiT
         L9c/1PlTtrP8XdpdmvQTqS3WKCqQfclqnlr5Anjyhk1E+9OT5+DjtaSspQNyiq+Fluno
         yjO984SawtR7BoPDazFh6dIstAf0wYE5Zx+1uHTHXtp6+0nhnHgt9yOohJRQc+rHLe/S
         /50w==
X-Forwarded-Encrypted: i=1; AJvYcCUKa7/11f9KS6DdgYRtGAgEtsL2FLL3QQQhejy/PLThJPwkXbe0E8a7Bjy5zJQzUInkVGNefwTQ51n6ccRKY9s2@lists.infradead.org
X-Gm-Message-State: AOJu0YzWuSCXbx1QIQaE4mqzHsttIbZe/Z9967mItDtOWWvabr3vANv0
	TrCVSOV9JEl3KaerMIjKo2NmFOB9QatSrhxCKYb1Ju5qOJmH9crFhvy4UViyfw==
X-Gm-Gg: ASbGncv6UNM2grbzeTwdkX2m0AcQq0oSE6wBSVKwbml3B+fuNZ4F9nowk2eKXexvbsT
	Ejrc6R3gLmd4qSqL6mjl8SZIl/laRX63CY7p5V46oIT4aG4UcdIX+5UA1TTCodJ9hStfyGQdx+K
	w3CDYyQwvI3m4UpojzCla/AT/bLKhKOGjHvg2/e7XArRn8iI+eRdEsGh2+EqnfOVH+3CWIwxp9x
	A1Ji7pV9OtCdIfnlJ5WrkInK5x/LKBnj0wb8pd6LW9pLWftCDIFmI3Q94L4As4PQ64io3ycAvVe
	nraShPOGNaSl5OYqhgYN/O0/t2hipZ49NyWUaRalMdKOVHM8VkJTn3A8ZXaimc9zYq/1yd+FLI4
	cNmnprs4hq5D2ehHN52G+7xc=
X-Google-Smtp-Source: AGHT+IHR5+ZqZWgRoRLa1o1Gg2Cvw+npoLGEsXcz8CnQxm7QZTBi9ul3cXloYS+TYHobQ2CzSJpuaQ==
X-Received: by 2002:a5d:5f51:0:b0:3a1:f563:f84e with SMTP id ffacd0b85a97d-3a1f6a4370emr1630423f8f.16.1746774530584;
        Fri, 09 May 2025 00:08:50 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde1asm2305688f8f.8.2025.05.09.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:08:49 -0700 (PDT)
Date: Fri, 9 May 2025 12:38:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de, yue.wang@amlogic.com, neil.armstrong@linaro.org, 
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <oy5wlkvp7nrg65hmbn6cwjcavkeq7emu65tsh4435gxllyb437@7ai23qsmpesy>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507163620.53v5djmhj3ywrge2@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_000852_742617_8A2BAECF 
X-CRM114-Status: GOOD (  38.30  )
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

On Wed, May 07, 2025 at 06:36:20PM +0200, Pali Rohár wrote:
> On Wednesday 07 May 2025 23:06:51 Hans Zhang wrote:
> > On 2025/5/7 23:03, Hans Zhang wrote:
> > > On 2025/5/7 01:41, Pali Rohár wrote:
> > > > On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
> > > > > The Aardvark PCIe controller enforces a fixed 512B payload size via
> > > > > PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
> > > > > core negotiations.
> > > > > 
> > > > > Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
> > > > > PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
> > > > > during device initialization, leveraging root port configurations and
> > > > > device-specific capabilities.
> > > > > 
> > > > > Aligning Aardvark with the unified MPS framework ensures consistency,
> > > > > avoids artificial constraints, and allows the hardware to operate at
> > > > > its maximum supported payload size while adhering to PCIe
> > > > > specifications.
> > > > > 
> > > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > > > ---
> > > > >   drivers/pci/controller/pci-aardvark.c | 2 --
> > > > >   1 file changed, 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/pci-aardvark.c
> > > > > b/drivers/pci/controller/pci-aardvark.c
> > > > > index a29796cce420..d8852892994a 100644
> > > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > > @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct
> > > > > advk_pcie *pcie)
> > > > >       reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > >       reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
> > > > >       reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> > > > > -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > > > >       reg &= ~PCI_EXP_DEVCTL_READRQ;
> > > > > -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
> > > > >       reg |= PCI_EXP_DEVCTL_READRQ_512B;
> > > > >       advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > > -- 
> > > > > 2.25.1
> > > > > 
> > > > 
> > > > Please do not remove this code. It is required part of the
> > > > initialization of the aardvark PCI controller at the specific phase,
> > > > as defined in the Armada 3700 Functional Specification.
> > > > 
> > > > There were reported more issues with those Armada PCIe controllers for
> > > > which were already sent patches to mailing list in last 5 years. But
> > > > unfortunately not all fixes were taken / applied yet.
> > > 
> > > Hi Pali,
> > > 
> > > I replied to you in version v2.
> > > 
> > > Is the maximum MPS supported by Armada 3700 512 bytes?
> 
> IIRC yes, 512-byte mode is supported. And I think in past I was testing
> some PCIe endpoint card which required 512-byte long payload and did not
> worked in 256-byte long mode (not sure if the card was not able to split
> transaction or something other was broken, it is quite longer time).
> 
> > > What are the default values of DevCap.MPS and DevCtl.MPS?
> 
> Do you mean values in the PCI-to-PCI bridge device of PCIe Root Port
> type?
> 
> Aardvark controller does not have the real HW PCI-to-PCI bridge device.
> There is only in-kernel emulation drivers/pci/pci-bridge-emul.c which
> create fake kernel PCI device in the hierarchy to make kernel and
> userspace happy. Yes, this is deviation from the PCIe standard but well,
> buggy HW is also HW.
> 
> And same applies for the pci-mvebu.c driver for older Marvell PCIe HW.
> 

Oh. Then this patch is not going to change the MPS setting of the root bus. But
that also means that there is a deviation in what the PCI core expects for a
root port and what is actually programmed in the hw.

Even in this MPS case, if the PCI core decides to scale down the MPS value of
the root port, then it won't be changed in the hw and the hw will continue to
work with 512B? Shouldn't the controller driver change the hw values based on
the values programmed by PCI core of the emul bridge?

But until that is fixed, this patch should be dropped.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

