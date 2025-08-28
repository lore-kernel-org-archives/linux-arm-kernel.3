Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA5CCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=; b=n3nOuuPDxi6QnqCCLAsagHa5t3
	BiRPnSXNLwvpxY0fQevjq8xHbiIpxZSZZMjLZu1/wPe4+nmTnKPI2p1gcqvy9vcoDxgI/nRf+Vj5C
	vuYPhEuHpvuZXdhzh9xhexeVOrSRVHosv3+LP9uD74bPComnymBxWzQql6+Derba4/CCf8R74n6uK
	3ZJDzeWK7Qfo/JsNv0/h0v/MEL7pJ5HYpyGKtKWTFKT6JcGsLqnDoiB6Q6+3Biiii2JfQMuZ0GnOd
	gcIlTATeSaur5r2JLErwcDdhcH/a9boBJ5QXB9Gqq5sRT8K1sN6d5WsiwYXtiitPn/zU1qr3rmY4e
	oMhtHDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urndT-00000003xVg-3Oql;
	Fri, 29 Aug 2025 01:10:35 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriom-000000037An-0CSk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:01:57 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b4c645aaa58so879624a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 13:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756411315; x=1757016115; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=;
        b=g8pO4gB/UFqK2jagFdPABKdtVN1dAxsPrtdug+4xKQpdaWENt5BynhnXId3yF/Srhm
         tM1NhRO0MJXdBhfGcaHF2rpBuC3WQlHPMHDWgihXIAyiU4FJo5tnff7OT1Ig/c4OCgKG
         ZeiClDFvkwmT7xc+5ZqwtTldsUL8Cv43O3JPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756411315; x=1757016115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=;
        b=TbD4oHWyPiBoG9C2GBKbFEpIO9tFKU9Ppb307q+8VM/WXfmRmFF/EnN+4m1ariYpGm
         IRpryQdZed+PO7Nf9ZYtIJaZnWDBzo8tfuA+cgzb8U9MYUABo0q3NhrTt/FdCWz+9lYz
         fKEu7BtRhACWIGQ839KKAyB/qO4OTv24tgSr5nsJCw7YdfS/xlSCM7hdQ3GWrun0EWqx
         4OeN1B3CC0Hek05M6XzdmKsnx/N+X1focrxqk1EzqfHvsz8SFXPqeVKj4tcWGZEKzFKm
         nDBbS2WtNHz2pMeFFBlmTEkG37o/qwrgBmXWwQcntk9uxQDVVgckancE+8+P422oH3n/
         SmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI2lwH5rTxtb5CO9cijdpxJk+4wFJkEvc3ZGnooQO+lzMyZ1YBQPh2vn0FcHlIfR9ai7l2qNsJ0NtiMoZLg2g/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5sGk7B6ZIyo29zWcYqql6rdrzCj71SSqadSFgPtyuhk0U8nA5
	5axNxopwKmimeSS3sJq1AONvCzGoUhUOjhdtKHNDq26RX6RWIdfus7Vv9gKotBtpug==
X-Gm-Gg: ASbGncuPBv0tT9dhSt56UTctLUavJ9/0URLp05fo8aprmc0p//bcCQAON1I4F3PW+wm
	/o1LxVP6nn0ZC2ErjFZG15Ib2N/HjElI2zas932HDax7UPpRfCUJYznm+GUe6JWTSDxyEHU8Kfn
	ial6GfkqIPSs+b2Oe7TZHbmDw2rkC8RGmbKifE2LmPZANQJgMU8kV8cwNWfFjf8shuX2wimL8Dv
	yccp17zM98yNjSWZgGcnFEX/4W4KkCdFPNYgAfrcM/ZEPZv1MXEKoIIyF66oJx1z0aOfJDXA2Uy
	7Xve+pTRpmoD/wTBBqZDPaWFejQ/B7d7bAOAA5oLtrAr1iI2pPlPEpSE1W6lbDFNmbzYI6RXDkf
	21XGv6Nie89hKyor/YN4uDVY/swoxSrkZC9haFa/xn1xp0W2ntK7o2igaKQiTRJi4vVpURdg=
X-Google-Smtp-Source: AGHT+IGRMI2y6ukLzuxA0A2Y52962J0xzxUUU/p9/lxC5pAaBaeFe2iw+3odm0xYYkw4AIuMGBT6Hw==
X-Received: by 2002:a17:903:13c8:b0:248:6d1a:430f with SMTP id d9443c01a7336-2486d1a46b2mr149396845ad.25.1756411314801;
        Thu, 28 Aug 2025 13:01:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:2893:df0f:26ec:df00])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24905da3be1sm3479885ad.69.2025.08.28.13.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 13:01:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:01:51 -0700
From: Brian Norris <briannorris@chromium.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aLC1rzdTVoN56Phc@google.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_130156_122901_77CFD9C9 
X-CRM114-Status: GOOD (  28.01  )
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

On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
> Port) and its subordinate devices by invoking bridge control reset and FLR. But
> in some cases like AER Fatal error, it might be necessary to reset the Root
> Ports using the PCI host bridge drivers in a platform specific way (as indicated
> by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
> Otherwise, the PCI link won't be recovered successfully.
> 
> So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
> host bridge drivers to reset the Root Port when a fatal error happens.
> 
> Also, this series allows the host bridge drivers to handle PCI link down event
> by resetting the Root Ports and recovering the bus. This is accomplished by the
> help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
> expected to call this API (preferrably from a threaded IRQ handler) with
> relevant Root Port 'pci_dev' when a link down event is detected for the port.
> The API will reuse the pcie_do_recovery() function to recover the link if AER
> support is enabled, otherwise it will directly call the reset_root_port()
> callback of the host bridge driver (if exists).
> 
> For reference, I've modified the pcie-qcom driver to call
> pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
> LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
> callback to reset the Root Port. Since the Qcom PCIe controllers support only
> a single Root Port (slot) per controller instance, the API is going to be
> invoked only once. For multi Root Port controllers, the controller driver is
> expected to detect the Root Port that received the link down event and call
> the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.
> 
> Testing
> -------
> 
> I've lost access to my test setup now. So Krishna (Cced) will help with testing
> on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
> platform. For the moment, this series is compile tested only.

For the series:

Tested-by: Brian Norris <briannorris@chromium.org>

I've tested the whole thing on Qualcomm SC7280 Herobrine systems with
NVMe. After adding a debugfs node to control toggling PERST, I can force
the link to reset, and see it recover and resume NVMe traffic.

I've tested the first two on Pixel phones, using a non-upstream
DWC-based driver that I'm working on getting in better shape. (We've
previously supported a custom link-error API setup instead.) I'd love to
see this available upstream.

Regards,
Brian

