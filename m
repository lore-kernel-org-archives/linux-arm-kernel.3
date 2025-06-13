Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0A3C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5wEqTLrIuHxlff07XhC6OAddwglGpYMw59cggcJYQ4=; b=RLJQbuQ8CI2AwOli91399jQHIs
	4FIbCFxQL0LbwaAJe1HgjmdGG/Lge4h0ZNUeUkIdFi3+QycaHDS1HU8o9qOmBmy4KnAwjk460KeW4
	68+CmVRy6hhmKefDH1l7OrcNChKG0iY5mD4xfDQlwafSvVuXYif+w6AOoy6w5onvpbKtqe9fyMIct
	+RgsGF3YJOWZFwkGNqlhCHrK/ywxfBYt/uoe0l/yUsK2EZA3EoyJanhnUhlKayazPFwUm1lNFN/7E
	6S+88hpE++tjgNH7E245gvfzdsX0FI6Nf+pZoqvcxYhmmIvVRaRXalx6uj+be+hrdepjERN6qI8OF
	E1a3HqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7TX-0000000H4iY-3TWa;
	Fri, 13 Jun 2025 16:41:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Bj-0000000GqXK-3KDk;
	Fri, 13 Jun 2025 15:19:28 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1857312b3a.1;
        Fri, 13 Jun 2025 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827967; x=1750432767; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5wEqTLrIuHxlff07XhC6OAddwglGpYMw59cggcJYQ4=;
        b=Oo3HmD7lJJo4Q1PovApfETZFwjTpFk+7XJLTzEzLtvEKvsCGiNkWtlBUvxSbFSjsyY
         +90ByfORxH7it0ewXFti4bWar4uqW7Ytvi6YdNKIw+2oH9FhMniw769yHH31Hq/63n7p
         pDj4GJZpxxQ1w1PkY0/OPuO2pvKe7OzeDcwG/58n4caKcWy41Jc50nSaxAojxsmJu0PE
         HOxy85g+s6ON1Ojo5sG8PfIywknJmQdsVFxRMLjXNTmThFj1jyFYVzdn7aQjUGcmpcNU
         bSXTCLZhYs8wz0HYcu4OdriXdwjjIyW2t8lNPGIEUCU9ing/2mcsZ5r1BPJLVn9H5i3B
         yZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827967; x=1750432767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5wEqTLrIuHxlff07XhC6OAddwglGpYMw59cggcJYQ4=;
        b=f7A5bjibcGXATlih154Mqlq0pD/UnjZqja81n31gMp+d8ZaI4pMojod8FqzBiy0lBS
         GdQQkZUTBqLk06X0G9Ocruxw4OQoV3xs4OtcdhpyY7hqFGf61W1MnaN1cnduWmewDAmC
         M6A+aKlg9ycTO6+wRWagoYDHDJAHVAzRnzhD3htvOYbxKW0JyhIxKdl1CcDb1no3UYUC
         vP9Yb06xC5GSBGgr0eStsq6GUl0uBjRzZwadR9PRQ3joW8E7/SN9UZOsKRSGkT/lQ5Sp
         u11Xj+i1amwIIaRVHptoJ53YOY7oHrBkRT8rjyDJIEFAQ4EyAHSFoYMRw+fFMUxU7IoD
         rV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+eoaVhOdb5YdOavNq0eSis/S2aMY6tfAS1LJvpLA9ku2flPeKA0npIoAf7/+mTCBP/N/rrcdnDO30@lists.infradead.org, AJvYcCXGUQqNIua/BjRzxx3Ngun7zO8lD+DtgTk6JMXxUPARzJDaH4P6CW25KvdfLf0En8Nd5J68exQnrp2qFJG9oaEh@lists.infradead.org
X-Gm-Message-State: AOJu0YzbDGAqXNKUnguXi98m2Odi8rkX0RHwUB7l1CwC/lRMFcLnIp9E
	0Uyph5ugZutxzY9bAVRtm+xl8ieg3VwDO+/X5ZXT/1sNCxxf9U2V+nsJ
X-Gm-Gg: ASbGnctJStaA0FTI33oIEDz/SxMlHhFwhaNY7/v7qdp5BX2w1Oq1jkCMahk2bm008UN
	nMemwJbc63wixyb+gK86+8wtYTd4bK1O8ruKs43mVd/LWIQ5OTbhEmYoK94A1KnCv7my9AN7fbx
	lfWvH3Jd71A6uWU6yBkDDMCP68FCsMu+bZo6TKAcd8cR8lOJqnZaZmxFpzE40yyHlWe/p7fNttl
	DYa4uY+t3rEV2LcJrPthihcaHwBSB3rQ7dM+z/lHfQHkZExfrJO+LKcvvOeCCM+q2HcVC8ew249
	w7p5aUmBRB7z7vviXkBDPAgkghTsAdJIL/9YKeW+NQcdxUC1aQ==
X-Google-Smtp-Source: AGHT+IH6BtrN8GvaynSvVoLNqD2VGmMz6n61XivbhbvYaO0BgySl9/odnV8zmrOFQ6SXd92rPXn+AA==
X-Received: by 2002:a05:6a00:10c9:b0:742:b928:59cb with SMTP id d2e1a72fcca58-74898586762mr1340177b3a.7.1749827966984;
        Fri, 13 Jun 2025 08:19:26 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489008303fsm1687203b3a.79.2025.06.13.08.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:19:26 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:19:20 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v4 2/5] PCI: rockchip: Drop unused custom registers
 and bitfields
Message-ID: <aExBeNdkOtFtW87z@geday>
References: <cover.1749826250.git.geraldogabriel@gmail.com>
 <ed25d30f2761e963164efffcfbe35502feb3adc2.1749826250.git.geraldogabriel@gmail.com>
 <97114c68-5eb7-18b0-adbd-227e1d7957c6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97114c68-5eb7-18b0-adbd-227e1d7957c6@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_081927_831899_AA8A32EA 
X-CRM114-Status: GOOD (  21.04  )
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

On Fri, Jun 13, 2025 at 06:03:14PM +0300, Ilpo Järvinen wrote:
> On Fri, 13 Jun 2025, Geraldo Nascimento wrote:
> 
> > Since we are now using standard PCIe defines, drop
> > unused custom-defined ones, which are now referenced
> > from offset at added Capabilities Register.
> 
> These are quite short lines, please reflow the changelog paragraphs to the 
> usual length.

Hi Ilpo,

I'll reflow for v5.

> 
> > Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip.h | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> > index 5864a20323f2..f611599988d7 100644
> > --- a/drivers/pci/controller/pcie-rockchip.h
> > +++ b/drivers/pci/controller/pcie-rockchip.h
> > @@ -155,16 +155,7 @@
> >  #define PCIE_EP_CONFIG_DID_VID		(PCIE_EP_CONFIG_BASE + 0x00)
> >  #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
> >  #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
> > -#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_BASE + 0xc4)
> > -#define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
> > -#define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
> > -#define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
> > -#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_BASE + 0xc8)
> > -#define   PCIE_RC_CONFIG_DCSR_MPS_MASK		GENMASK(7, 5)
> > -#define   PCIE_RC_CONFIG_DCSR_MPS_256		(0x1 << 5)
> > -#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_BASE + 0xcc)
> > -#define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
> > -#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
> > +#define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
> 
> This will cause a build failure because PCIE_RC_CONFIG_CR is used in 1/5 
> but only introduced here so you'll need to do this in the same patch as 
> any step within a series must build too. IMO it would anyway make sense to 
> combine patches 1 & 2.

Ah, interesting angle. I'll fix it.

> 
> >  #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
> 
> Aren't you going to convert this as well?

I can, but I can't test it however! But I'll Cc: someone who hopefully
can.

Thanks,
Geraldo Nascimento
> 
> >  #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
> >  #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
> > 
> 
> -- 
>  i.
> 

