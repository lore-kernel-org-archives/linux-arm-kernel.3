Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21306C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bB0FA1hVPZJ0S4Y1IaK4hi0Fvaas9G2N8erQYJkQNzE=; b=EoMoOYCtz1Auir7sh51/hCruW8
	JCEPqaXe6Ihyg01+CjwnrwaprfBvWQO6hnP716n3KUvK5ZpsnXimInRGaPkqUWgUH1xFgR1hq2bkl
	VpiOjKLPsAMQWoO50UZ+FnxkV515u7hd7Zfnt7P7PhkV+1c66Wn5+LC2G56EPP2A6FAAoz5pNkEdL
	FqEJaF/XtbVSh3nxip+ySZkXQqSQqQuGEGkSX+B35Kiy1I+GcwblDALnZuU7wd7qECaiuhHN/693n
	P9htgr+ZUVkbeQVgCxS4aqjd+SfCBLcdi4dwtLAAYWYo5U19+Ryc4AyfJc9FKMm7Z0iHD5kkHIC8I
	au85xuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUuq-00000005Nei-3FgB;
	Tue, 04 Mar 2025 16:14:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTiF-000000055sU-2bmb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 14:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bB0FA1hVPZJ0S4Y1IaK4hi0Fvaas9G2N8erQYJkQNzE=; b=BWKL3M/CtbLIit/oVRmmQUltVj
	8RukW383OsP9xSMgqSUbATB6jq/VpVy4zEhvLGin3qhCAlUVikTDa5qeZ9CVhg4NHAamv8Nv17g9h
	NFGUvoHU7GIkXoPlUAv/CCc5Tpzyjx5JSUWeFDDCeRYsUANsezcHq3C/78BZEAXyk9dsW/NX+yiDo
	bo25PNS+zDsCDgzs1ejvfQJD1AA//bwF+I0ZGYvUzIFRCcYy2SppNjbP7yG8WnhDgWu27vsjn+aZS
	MT1dx09G86Hh0Qtk4uOP0WHkyNpetU4/m3qJGkF3fKIaafu5WqLjVFu2yCBwRhvU09BDzH/tduti6
	vNyLPQtg==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTiC-000000003Hu-0kek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:57:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22328dca22fso86401485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741100252; x=1741705052; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bB0FA1hVPZJ0S4Y1IaK4hi0Fvaas9G2N8erQYJkQNzE=;
        b=kKhO3WPl6reb3gYuhCMlHJpo8PPDl+1S/N/BcgDUh84OsXla95X7kexJFCGPH4+Afi
         qBXKUpWrC6CLdSy3X+uvvHdHI+xMU5xn9nGdWll3K5sIQbNDBusolHK3sm9C213muIgg
         f4DMvOsdlTwhSEkQ79Pt2FORTpzOBN6KrIf/hRsc5TvTW536wigpN6JlgdOiAdG8Coxf
         DlCze97VfIdRLZ6KJKIKxycOlMODnEByEAGQgku165jSlATs3B/gqyRPB3hIbO0uajst
         fTnYimlnEzarAQtLiH5OQmfMT+5on1Qrmbyg4Rp18kiHVOoHD6Tpq5ttdCCg5uuzjQLo
         bCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100252; x=1741705052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bB0FA1hVPZJ0S4Y1IaK4hi0Fvaas9G2N8erQYJkQNzE=;
        b=VDg38cNqivfRxOGXpBZDYBun1j8B/rlVTlSS49ztFKJ+06TzIsrJjFhFKo0Foz5AVL
         6JYI54CKaQbdFzoG2uqVssiD3eMtC1Vpi6vAe60r/KQl47sShzanpulZDyVjtzaOP8Db
         13hqGA+eCWhXYw5G1g1oeWW94dXL4g92V2i+5htTFXIMlStkSTb+nOm7I3j0PKD5wn+/
         RTt4rIiNQRdnXkD1N9EirUFpFc+EjghbsKlfapnCVh1wkz/OopnLFnNZfmAz+G8XI+dN
         IZ56CkROaNkV2kfr+ha4mqyltEjvXS6bTeGGnINUizTf55Mfouyfo/UF65UqQb4zRdEN
         0F+g==
X-Forwarded-Encrypted: i=1; AJvYcCVAINMHjHS+yaI6oV9EeLG+SQsIK2au5DmtUaXKVKDlE6VplzvVTn/qtZwBm8k6o0Y7pBD25tMjyWc+NCUNUkxj@lists.infradead.org
X-Gm-Message-State: AOJu0YyY+by/vC3b6khkX1kZQVrn6VrC8tSDTsxhxwL9hMnTiWQPR1Ag
	pRssiBxetd0yJ5qzwgLF5nwCpaDnG95LLqhGlIsVqOLK7uAltYOILS7OqcicWQ==
X-Gm-Gg: ASbGnct8/o2DEBFS3+YHzOhtFwTb2V2bPGlbXYG1FPZINbtteKfHxF9pVlKKaqXsdU/
	uzLvP+yL8dCmtiiEQOCU8QYVlQIpXzmDp4suCDh8g8Lb7sMbw/uXdNRn5s8EVBXlsqlrKGB9vNY
	tzgMU8a88gspIv0gw6MdrWb4wuRA6RSqt4/m4H8lhGSQLK92PpYDSBchR9vI2ksJZ3X647JdLYc
	b/vUePG0S+IOPRPXXItBHIZlYpVKIdHSo6AAshRUsY8FzRabpdwpalNFkKQmPujfhBG0RTcXUQD
	XLzZg1TzqDrHsC/7gUr+XWkIEP5Fkp2Xiv6lboMhqYJq0VPwAzqi/Wg=
X-Google-Smtp-Source: AGHT+IGo7wa+ol8U/rxNOCJnFdMfRJrO9oY2HvfjcAeePQLXu1JAeASpEDGGST/KBMpQr7w4rAQjHw==
X-Received: by 2002:a05:6a21:6f09:b0:1f3:46cd:d01f with SMTP id adf61e73a8af0-1f346cdd0f4mr1167212637.21.1741100252271;
        Tue, 04 Mar 2025 06:57:32 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73519c31931sm8622046b3a.20.2025.03.04.06.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 06:57:31 -0800 (PST)
Date: Tue, 4 Mar 2025 20:27:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] PCI: brcmstb: Do not assume that reg field starts
 at LSB
Message-ID: <20250304145724.itrzj6wnflxxf3up@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-4-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-4-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_145736_868157_BF48F5A2 
X-CRM114-Status: GOOD (  21.70  )
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

On Fri, Feb 14, 2025 at 12:39:31PM -0500, Jim Quinlan wrote:
> When setting a register field it was assumed that the field started at the

s/a register field/LNKCAP and LNKCTL2 register fields,

> lsb of the register.  Although the masks do indeed start at the lsb, and
> this will probably not change, it is prudent to use a method that makes no
> assumption about the mask's placement in the register.
> 
> The uXXp_replace_bits() calls are used since they are already prevalent
> in this driver.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-brcmstb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 98542e74aa16..e0b20f58c604 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -415,10 +415,10 @@ static void brcm_pcie_set_gen(struct brcm_pcie *pcie, int gen)
>  	u16 lnkctl2 = readw(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
>  	u32 lnkcap = readl(pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
> -	lnkcap = (lnkcap & ~PCI_EXP_LNKCAP_SLS) | gen;
> +	u32p_replace_bits(&lnkcap, gen, PCI_EXP_LNKCAP_SLS);
>  	writel(lnkcap, pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
> -	lnkctl2 = (lnkctl2 & ~0xf) | gen;
> +	u16p_replace_bits(&lnkctl2, gen, PCI_EXP_LNKCTL2_TLS);
>  	writew(lnkctl2, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
>  }
>  
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

