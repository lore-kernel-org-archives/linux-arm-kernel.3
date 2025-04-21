Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B91C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouxcv+1YvuOkFG0jn+K0SUmzYu0kHcqjiq9UZ3JDI9g=; b=cCPy2XLu/ukAsWTRrD2l/yS0VK
	1P20NUNXBBNmndP6S62ksLLe64YjdnrQj9R1qlPBFnEhR3E/KAzP1RtrKZFiq5PkUovgboT4fSXAY
	93imV7xHC3Bsa3LPE1DOU7UoIKY11YDTjWwtTfKTzEps3+rTnlWLdZipJNXzwZpcQOvHQG0OYucqG
	ps9MaCDTa12GPAuphMRfaLuHgwsNxjFBVNpW1bBOtjveSITpjTQyIUlYNIK1dZQ7doSTLxQ6Nbu8V
	cOjYVurDGOJyu7LNMcKTaMsUyD7O3VkbjDYohN9iQxuozs9TGYl0PTKULoyvpQY/U2wkXe0e+n/pX
	xcTdlm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6n38-00000003xTP-0z30;
	Mon, 21 Apr 2025 09:02:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6n1H-00000003xMv-0LEr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 09:00:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22c33ac23edso36193185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 02:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745226050; x=1745830850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouxcv+1YvuOkFG0jn+K0SUmzYu0kHcqjiq9UZ3JDI9g=;
        b=klPnvi6HejSe73lxMH5OkZW3/fi9W41Ccutkey7QAl/OZd8KqCRzMldUv61uvgoMPF
         7RjaS6Qv/eh0jpf9f0NQOvboUNVhgV2ZeXtCUEdZldRlEur0uqB1FW5CZYdTRx5tjZ1z
         9bkAudvTXj4XyKGn3hev5Oiph/yIkax0kZ3vTKgiXxjgSdimjw05Eqkta644UZIDls2V
         blC8pKzTeDJyceateilpEB5tynvitbbqW9mz4YyoGWGUXlgOcW3zdbXNiuZfZ1RBFv3N
         97d77XCfmJZrzZMMd/I3hQsUuOAfWWFVeYWPaqxiizxDk8w7n6BhZ+iduACyM78ymomw
         OKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226050; x=1745830850;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouxcv+1YvuOkFG0jn+K0SUmzYu0kHcqjiq9UZ3JDI9g=;
        b=SfE9QHtK+510f5/OiyPNnBv4hdpI5LoeVwhuMDjSumIJL6yy2rcgjDtsIpXkH/jwh4
         m3hjX34T87kJGSrtVWePVTvNH+MevuT0E782xcNRXylodLlbskM9uez9+wCDMOd9NRJC
         baheJwR8bovan+ke1NHn7eHrk8EVSzlqrwUtUuCEAhCtItLPPE4JEP3NcHglTH65AnG0
         3KzhUUhXEjqCid0krSgShRuEnlAhGgX3RnTGi0hRneJESOda8DPGcli6B3+jrDaKB0sF
         9vRAOevqBkJqNYdlM4MizQjhTQpwkHijIBtP/3Z7YMnLP4JWcLaHebPnxavIOF06I6dN
         h6rw==
X-Forwarded-Encrypted: i=1; AJvYcCVJbi4B3qS9WYholD7uB+a87R4ndkz9X4ycgr9GTVq5k+2tXCrv0MgagJwUjbZZze2jYMfeyKpJv5A5rg6DVN++@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4kkxjEAM+DxVNdfuvYOoRxZOEoPv79lSescrQ4CWD+togg3bi
	7N93xtszytO/VO3wD3SrjUXH55OMWLewOE3qGovynJfSKORrJ5yImv5kWJ/rKQ==
X-Gm-Gg: ASbGncvtAr2+eg7zNL3pdWkfpIzQEVHkm0dmGh/FrHwaSSLEo4RGATvhUbOiFzNj2cp
	SN9B/SzIZKcYI1bzLax73K0YrITtlG6sD0jiUY544qQS4AT8keEBKA1808UZcTf/TkEEkoVFWJG
	OnxLbWzGOQjDm3+S2gPRDRS7fcpXvEI+N8ZQRhdiUPhFrrLgCrgSHEMR7R21r9BQe6clqimJUoa
	1YaSTrkffchP/vGcwyD+FhLqu/mL+xGfQxN7moQn2TQ+n84q6rtTy/jfw5ccygiO2IO9aE3KqXs
	CkvJYmrc0tj0eKG11H00ujXpxqF55plu6ueWVxR6hzLMS7Yv+rieGJE=
X-Google-Smtp-Source: AGHT+IHiH+ZKaGvLzhdCRmqt8PauvespnoNN+FTbSbWKbr7BrL2gDOrlx85PNmYsb8mZdnhuym89Hg==
X-Received: by 2002:a17:902:e5cf:b0:223:6657:5003 with SMTP id d9443c01a7336-22c53611037mr177515125ad.32.1745226049715;
        Mon, 21 Apr 2025 02:00:49 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.74.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db1273edbsm5278363a12.8.2025.04.21.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:00:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
 bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, 
 18255117159@163.com, cassel@kernel.org, 
 wojciech.jasko-EXT@continental-corporation.com, thomas.richard@bootlin.com, 
 bwawrzyn@cisco.com, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srk@ti.com
In-Reply-To: <20250417124408.2752248-1-s-vadapalli@ti.com>
References: <20250417124408.2752248-1-s-vadapalli@ti.com>
Subject: Re: [PATCH v4 0/4] Loadable Module support for PCIe Cadence and
 J721E
Message-Id: <174522604280.13504.6844455381479495318.b4-ty@linaro.org>
Date: Mon, 21 Apr 2025 14:30:42 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_020051_129666_0EE1A172 
X-CRM114-Status: GOOD (  13.34  )
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


On Thu, 17 Apr 2025 18:14:04 +0530, Siddharth Vadapalli wrote:
> This series enables support to build the PCIe Cadence Controller drivers
> and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
> Modules. The motivation for this series is that PCIe is not a necessity
> for booting the SoC, due to which it doesn't have to be a built-in
> module. Additionally, the defconfig doesn't enable the PCIe Cadence
> Controller drivers and the PCI J721E driver, due to which PCIe is not
> supported by default. Enabling the configs as of now (i.e. without this
> series) will result in built-in drivers i.e. a bloated Linux Image for
> everyone who doesn't have the PCIe Controller. Therefore, with this
> series, after enabling support for building the drivers as loadable
> modules, the driver configs can be enabled in the defconfig to build
> the drivers as loadable modules, thereby enabling PCIe.
> 
> [...]

Applied, thanks!

[1/4] PCI: cadence: Add support to build pcie-cadence library as a kernel module
      commit: b51c6fee0a06b71e9bf610f4b294426d0a1f1b51
[2/4] PCI: cadence-host: Introduce cdns_pcie_host_disable helper for cleanup
      commit: 23c498ea9abd7bed7d0f8c1c5f63459100b01028
[3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable helper for cleanup
      commit: 5f8c840aa407588a7eae89af1301ba19c307aab7
[4/4] PCI: j721e: Add support to build as a loadable module
      commit: 7a68d4ab59fa66ebbd9b8abdbffcaf748e109ad7

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


