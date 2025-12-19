Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D687D7878A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYvv94Zsk3x17wcAmOB8XNIIZZOimm0gG0SNyPnA8+I=; b=z6cfzVwBXMSNwKwYSysQVpG05G
	eKk+SLUzNR+r7ExtGEOi6yVw8r16KyPakjScrGPeOCgmKWazdmOL/WluhTQ8iRMLzYz0vY9vdqd07
	Qemp0JSQB6nEE0TCCq7XCdICMvXcuUs2JLYE0KERPeqj/824GOp1Cs+AAMSoW7tZjqb0hU5iIJZ4I
	boP7eRWulTQyIyIDgwiU+zhJbA9alqVubQx2b5eO0j1HzUxkSlSSc3k1IRO2FwXpxdlCKKWDbluhW
	VRnBsVOEcC5Fe4E6BTK8mCaNJ/EA6IU3jQ80eRS4ak6m2w+X8+S46gjEm7vVWvFOMe0DaTxLFU7CY
	V3yAlIpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcMF-0000000AVTf-3KkK;
	Fri, 19 Dec 2025 15:25:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcME-0000000AVTW-2Mnx;
	Fri, 19 Dec 2025 15:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEFE460008;
	Fri, 19 Dec 2025 15:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBE9C4CEF1;
	Fri, 19 Dec 2025 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766157929;
	bh=b7ZQFUmybQOKOhzGs8UkdT5AC/ICY2hLdh/vjkXWyaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXdQBjNeX/Bqk7SOAQ72GTn3XZquDe5oklsreC30NWFztnWgXtzQSwF9jGWbVn/I6
	 7Hh5EkuMS+vQpFwkPmzBV/PNP+2hu1UlCpDlwGni6IP1a56PJCHV4xFHtj3ahvfIPl
	 thEwGdmZNBh1oXSr5lMQeVpJy3763/VIA8VtKdQQYSItwyL6JJd0fit0SKrAXZkszI
	 +i1AuoFPa1FaJ+F0MC/l1g+D3pUXdm6rUK2dpjyBfkbSVaE82+H+ffmY3Gg6Jf7Oev
	 suyBS6/QJH9dyyTzLZVYVOZ9EKRUdjCiGXTKGj6PKIQja/M15mChjIqq5EYrn79+V/
	 SL75hkgARsRQg==
Date: Fri, 19 Dec 2025 09:25:26 -0600
From: Rob Herring <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 0/4] Fix RP1 DeviceTree hierarchy and drop overlay support
Message-ID: <20251219152526.GA3333129-robh@kernel.org>
References: <cover.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1766077285.git.andrea.porta@suse.com>
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

On Thu, Dec 18, 2025 at 08:09:05PM +0100, Andrea della Porta wrote:
> The current RP1 implementation is plagued by several issues, as follows:
> 
> - the node name for RP1 is too specific and should be generic instead
>   (see [1]).
> 
> - the fully defined DTS has its PCI hierarchy wrongly described. There
>   should be a PCI root port between the root complex and the endpoint
>   (see [1]).
> 
> - since CONFIG_PCI_DYNAMIC_OF_NODES can be dropped in the future
>   becoming an automatically enabled feature, it would be wise to not
>   depend on it (see [2]).
> 
> - overlay support has led to a lot of confusion. It's not really usable 
>   right now and users are not even used to it (see [3]).
> 
> This patch aims at solving the aforementioned problems by amending the
> PCI topology as follows:
> 
>   ...
>   pcie@1000120000 {
>     ...
> 
>     pci@0,0 {
>       device_type = "pci";
>       reg = <0x00 0x00 0x00 0x00 0x00>;
>       ...
> 
>       dev@0,0 {
>         compatible = "pci1de4,1";
>         reg = <0x10000 0x00 0x00 0x00 0x00>;
>         ...
> 
>         pci-ep-bus@1 {
>           compatible = "simple-bus";
>           ...
> 
>           /* peripherals child nodes */
>         }; 
>       }; 
>     }; 
>   }; 
> 
> The reg property is important since it permits the binding the OF
> device_node structure to the pci_dev, encoding the BDF in the upper
> portion of the address.
> 
> This patch also drops the overlay support in favor of the fully
> described DT while streamlining it as a result.
> 
> Links:
> [1] - https://lore.kernel.org/all/aTvz_OeVnciiqATz@apocalypse/
> [2] - https://lore.kernel.org/all/CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com/
> [3] - https://lore.kernel.org/all/CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com/
> 
> Andrea della Porta (4):
>   dt-bindings: misc: pci1de4,1: add required reg property for endpoint
>   misc: rp1: drop overlay support
>   arm64: dts: broadcom: bcm2712: fix RP1 endpoint PCI topology
>   arm64: dts: broadcom: rp1: drop RP1 overlay

Thanks for doing this.

Reviewed-by: Rob Herring <robh@kernel.org>

