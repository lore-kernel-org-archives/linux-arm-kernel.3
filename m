Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50FC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77+FrcIpWSxgma5SjFDEMO5xH+4H9hBqTDfsgt+zhq4=; b=WPZJSufFD3Y/Aubo5C0FyHeTA8
	jJp2KQqHBs52jL/pdJxFbIga+wJO4/jyOCZ7Sxgbi8lb01w8fPl5ONwkvdD+ZvhQhtZdEtm19beXR
	cRIP7XvfY6bGsjGupapr51mZnIHEAx8turg58JTeS/7bErPR/LvEjFyrlQ2fREv9M+uly99c13GSN
	BQs1JKrUhQj0J4fxoIhx/LYK2KRrfeJpG7oPFUoLY0BFoyxfNsjic11RepPcP1wo04ikKgWrrXJS8
	Rr5fNOBvzexAohmYgIcjggpIIMN0Rkdl+e9qzFAzrupdFniCyYXFHrvFnkKmZFtlBzpBtjVlRoJa3
	e0zUmcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Bb-000000016HW-24Pt;
	Fri, 30 May 2025 16:02:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL29Q-000000015gy-3ORD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:00:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso2397634b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748620807; x=1749225607; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77+FrcIpWSxgma5SjFDEMO5xH+4H9hBqTDfsgt+zhq4=;
        b=Gw2YyRReZltXJcKALKiC+sFVT1bUhIuTokutVw+dd4UPI52zA3uctp+EIekBTIZlvj
         5fwyDUIiDrK+v/z8mTc9viNh43+8kslU1RKEweZfwWf8d0rYeO2+HHDvRT7YjXBWiB1B
         yC/VZk08MHn2NVK5vNyyIb8tR9N6r0yHgPJ+52CilhwLvYSAUgNMczfS100AKqNmB/uO
         jcsNE6UkZcCUurf28p1yOVRxWX7xxjQ4t4gCRhG5wKjBawsRFSE0ChBvHjhd7OWpZN09
         slCrf4MXRDlYVk79vCWfYpm486Y2kbKPLWqSDu34FyZBa+ivwke213l7Vf2ryEsF+g1k
         SWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748620807; x=1749225607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77+FrcIpWSxgma5SjFDEMO5xH+4H9hBqTDfsgt+zhq4=;
        b=Paw/Cv+o2wFS+ESUEF+d7JVIamdK2Q1RPU/5jRAZcJUNTZuAp7Or0lynBUcqX+ujth
         g+qKGvCTukVMAcAlkeA0tLTU62kzs4CgRIQhS9p4XqdKIG6ceJ0fR3bVlUbfUERhm22L
         fLpOXzzTiFP/neqgS/q9UOui55qADwzMhlkms7BShV7G+w/ZkGKOyLlBjIFDB2EOfozH
         M3KIEFr8OKLf6VQ0/bsliglbjeZDCEDT5NlZdv0h8ccY/QDyfA1iFXFSvPhh9DTssBV9
         datwFjiXXjKBYFUFrleiTqxfs6N5YPhkE9N+yaGmm6oLz23Y/TgPnlWwpEf1HwfSOK+t
         uQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjdNobg+dxeyxGfEZpijy8zV8wXiGoKwYM2gNxavQ8zjrlE/73Vy4SY+sbOiJGYWIdN2RZqcIjJhWxkNJ4kvt6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy12xI8rKXuK+WfGMYvGoAsa1BwVRoXI3oP0L6Fozcz6rxZb7+g
	Judpve2mZ+Bv62M8qh4OjQ/4Jl+PkPdJ03PnOmhpESQD8uTfxM2jN8U2YynDXvczVw==
X-Gm-Gg: ASbGnctNa1FsEJe8jtIi+eUpsE+DIrD5ZZ8t4uwS/p+BciiYpwLjNrIDsicZAVxKnY7
	eFGbie4P0N7GmklDG2ksK2sZWbqktDCo+fgJE/+/KJeQsDrcBuyaswMg8L4M5e0a8mI9YS2ifKF
	eFon9YLpa1R/k4R3pq2Mwa+bi/mcQPcd71IgBEdd4if29VTU5SodQrEZnYSAfvv+lJE56X8S+Nm
	eWaxhBuyLesSC1o2vhtRrpFImBdoYTepgl/B1QgQHshgT637+hj/o8z6YmJx+hX1CP9bubTRmOR
	TOxE1NAscsX/JKtLJKFSbJebcgrT3Bd3/lfZHLKYusnXcA+EvG0pyoefSzyGHBN1pcxeOPUL
X-Google-Smtp-Source: AGHT+IF/8QTsNcVL/z+rQlAga/Geyj/2FCJ5vD5YDtu2ldaYPZerMoqgdp4D+2pixaewJCBXnV6XdQ==
X-Received: by 2002:a05:6a00:1743:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-747bd980d13mr5393036b3a.12.1748620804748;
        Fri, 30 May 2025 09:00:04 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed34fdsm3213450b3a.75.2025.05.30.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:00:04 -0700 (PDT)
Date: Fri, 30 May 2025 21:29:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Laszlo Fiat <laszlo.fiat@proton.me>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <fbvatgydh64wr2z2srivbuurjonxpq46xie3bq57grtosesfti@v6vplhyxc343>
References: <20250506073934.433176-7-cassel@kernel.org>
 <20250528224251.GA58400@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528224251.GA58400@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090008_860241_115EA46C 
X-CRM114-Status: GOOD (  24.93  )
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

On Wed, May 28, 2025 at 05:42:51PM -0500, Bjorn Helgaas wrote:
> On Tue, May 06, 2025 at 09:39:36AM +0200, Niklas Cassel wrote:
> > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > and instead enumerate the bus when receiving a Link Up IRQ.
> > 
> > Laszlo Fiat reported (off-list) that his PLEXTOR PX-256M8PeGN NVMe SSD is
> > no longer functional, and simply reverting commit ec9fd499b9c6 ("PCI:
> > dw-rockchip: Don't wait for link since we can detect Link Up") makes his
> > SSD functional again.
> > 
> > It seems that we are enumerating the bus before the endpoint is ready.
> > Adding a msleep(PCIE_T_RRS_READY_MS) before enumerating the bus in the
> > threaded IRQ handler makes the SSD functional once again.
> 
> This sounds like a problem that could happen with any controller, not
> just dw-rockchip?  Are we missing some required delay that should be
> in generic code?  Or is this a PLEXTOR defect that everybody has to
> pay the price for?
> 
> Delays like this are really hard to get rid of once we add them, so
> I'm a little bit cautious.
> 

Ok, I digged into the spec a little more and I could see below paragraph in
r6.0, sec 6.6.1 for devices not supporting Device Readiness Status (DRS):

"With a Downstream Port that does not support Link speeds greater than 5.0 GT/s,
software must wait a minimum of 100 ms following exit from a Conventional Reset
before sending a Configuration Request to the device immediately below that
Port.

With a Downstream Port that supports Link speeds greater than 5.0 GT/s,
software must wait a minimum of 100 ms after Link training completes before
sending a Configuration Request to the device immediately below that Port.
Software can determine when Link training completes by polling the Data Link
Layer Link Active bit or by setting up an associated interrupt
(see § Section 6.7.3.3 ). It is strongly recommended for software to use this
mechanism whenever the Downstream Port supports it."

We are not checking for DRS after the PERST# deassert or after link is up, I
think DRS check only applies to enumerated devices, but I'm not 100% sure. But
if we assume that the devices doesn't support DRS, then we should make sure
that all controller drivers wait for 100ms even after link up event before
issuing the config request.

So I don't think this is a device specific issue but rather controller specific.
And this makes the Qcom patch that I dropped a valid one (ofc with change in
description).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

