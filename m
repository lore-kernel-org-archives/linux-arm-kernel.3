Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B0CE7718E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k38+bC4o4JY/nExyesCKw1Oyf/W4W8hN/wgHfx4tKk=; b=uUSP87rxWBuVMmTINYoBHE1USH
	b/llBvA6kbBKMjUbt41G9b4ct/I0Kgl6JxZlQV3mTdR10v0pheZ1GWG3j0VjE4oF7+XwrwR1SUArv
	lDgcgE/uKp+DuFGO0n+wJ5f5AUSF2+vQVFx7AcR93aZxsV++C63jiMRYdCuD61OKtsd2o3ExgE3F7
	z3s6KOKkmBmx1SChFGmt62JhkJl/wJeZHB/Fib59JUdvVOAYT7itOUxmRGmG+/rcktyzulYuVW8CY
	SztnezS+FGfslDkuGc+tl2FDaxp3tywKv5lcg3RWjEWJy3tosOk9P03FyrD87Hz8VEwIOiNHEfgrW
	wpGmiUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTGL-00000008qSp-2wA9;
	Sun, 22 Dec 2024 21:13:21 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTF9-00000008qPH-2RHb;
	Sun, 22 Dec 2024 21:12:08 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21644aca3a0so37988805ad.3;
        Sun, 22 Dec 2024 13:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734901926; x=1735506726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k38+bC4o4JY/nExyesCKw1Oyf/W4W8hN/wgHfx4tKk=;
        b=lUm361Tqx4fGZSYA5jmF5DgpJ4ULbbOKUwACY4qF5vHF/pf71E/f5tEgztwljElIdh
         H1kZr3I8DFeQ+iRq3E6CVOfC7oRwSfbzpPcJuiDCAmciq1iw9Iu/r9PyiSoGbeT7LK6G
         a5On073Ds+Q3N1k5hXxgxENIUQDvVkZ6q6d8wyKtR50lw6hvZhGsCJpsdxwj1uuJ8gCU
         YRrWzYSyT2169m1CqtJhJikwYhq/vGXinvQZ8K1WteZKP3M60MpjsY3KKCxI09LH+TFu
         XkudH7GQtjqa97S1LHSK0QhgK09dxTWzFjYIR9l9y0vk50gac32/doiRQy4AFYTRuTtn
         JTZA==
X-Forwarded-Encrypted: i=1; AJvYcCXT3cY3loy9dzt6tyP89iZpxF1fV/q8baiaAg8IspJLEOu16F5Bc4mTOGskNe/tfNLKNPE0zTuawDtvCe+2yVI=@lists.infradead.org, AJvYcCXdZ6A2Tl944azING6kL54TueiA7oc2QFSOMtIX3QpMuGHfuS9FhIc1Uom8318Euq2qkKpJ79LZ0X4v02hWXIUa@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHj0nXll+X6EAAegNHXHOyeDgJBz+6+XnKmtCEGYdOu2jdBcW
	wgKLfsMfcIesGAg1AdbRE922nOnPxu9bycCRbG5As6zKlBlyIYPc
X-Gm-Gg: ASbGncu25pIniC+yYFXt5bfP+K5PhxNje4UDiB665qVzBus01Dr8KRNFcj2ajVIpi/T
	uakF6UsAXDHqu2FKMXfVIA+fzQEoxEF7cytQxEbgur2tudQGIb6dwD+NDnsJaxuTrnYYPsdZtyT
	qD/eC2ZBa9wHocoOGKfxURtwHcfApiyOA+5UC8JwPTa4sALZ/3PVpXPouOf07vsbDPYT4e07I3a
	E5Jp3cs7UM+Os9HGkDOzxE21DGwXoLOj4pf3kE1+tOLGujBiYQaGW5m0JLmqtfAezh01WXgMz6D
	fxzd48TtWHZs57o=
X-Google-Smtp-Source: AGHT+IHvYfdLxwvSBegIAr+l+/j6AuDpyaWscN+dBbMElcNGPAGpUwZZ++vm4K3x0zJBaL3mmLcrHg==
X-Received: by 2002:a17:902:f644:b0:215:7421:262 with SMTP id d9443c01a7336-219e6e89283mr175922225ad.12.1734901926177;
        Sun, 22 Dec 2024 13:12:06 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d444csm60664785ad.137.2024.12.22.13.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 13:12:05 -0800 (PST)
Date: Mon, 23 Dec 2024 06:12:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Enumerate endpoints based on
 dll_link_up irq in the combined sys irq
Message-ID: <20241222211203.GC3111282@rocinante>
References: <20241127145041.3531400-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127145041.3531400-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_131207_644710_5CA3CF6B 
X-CRM114-Status: GOOD (  12.30  )
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

Hello,

> Most boards using the pcie-dw-rockchip PCIe controller lack standard
> hotplug support.
> 
> Thus, when an endpoint is attached to the SoC, users have to rescan the bus
> manually to enumerate the device. This can be avoided by using the
> 'dll_link_up' interrupt in the combined system interrupt 'sys'.
> 
> Once the 'dll_link_up' irq is received, the bus underneath the host bridge
> is scanned to enumerate PCIe endpoint devices.
> 
> This commit implements the same functionality that was implemented in the
> DWC based pcie-qcom driver in commit 4581403f6792 ("PCI: qcom: Enumerate
> endpoints based on Link up event in 'global_irq' interrupt").
> 
> The Root Complex specific device tree binding for pcie-dw-rockchip already
> has the 'sys' interrupt marked as required, so there is no need to update
> the device tree binding. This also means that we can request the 'sys' IRQ
> unconditionally.

Applied to controller/rockchip, thank you!

[01/01] PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ in the combined sys IRQ
        https://git.kernel.org/pci/pci/c/191b732176e7

	Krzysztof

