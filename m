Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39856C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=74velbzXhj86ayyNJU8eE/T9Ph27FbIFsXRb+I255gE=; b=upuyXXRLFEMQXi
	9Bal7tsHzYOIv9L8gTKKK7I7GftCeDJT0RtT7p0fh7dSOwXoTS82hQdI6fokpsWQ7YuKQJsKxs3bH
	dGcROFYPPf/9JE3qkswzEU6F7L5eYo9QIGPF8Oi7BwluRqhGoOgYjv4FEyozgerJniU0D+5rgnznu
	4W45+oBfkVCO234mxKv3ztKrDh5gT5boJSDM/TcKCuNJk/VhyCPue9JfIX2nXIFt1stBgfYg8xYQD
	XVeIdzxKgJNUdPrl06LJ/zngNsAizE/RTc4tPZ+rS0bKzUNj1UhyD76ylcH82D6Mv1Mv/0mYJO3JG
	FzX0ID5PBtV51Z4Im+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRXB-00000005my8-2s41;
	Thu, 27 Feb 2025 00:13:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRVd-00000005mfN-3dmq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D4485C75EC;
	Thu, 27 Feb 2025 00:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC25C4CEE4;
	Thu, 27 Feb 2025 00:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740615133;
	bh=kFgcrBElLJTonBz0lClAOsPUWgdoPyhvMj791RqwlRA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CJfB1rL5oz2xpW+K4hNOju3ADuUKr3b8mhl4wOWC+Qn0heguTMtKgVXVPzr+VjVen
	 Niv05HKBuXK7mv38wfm9zy4Y9KW0j0a2bvoOz5imlD4kZkxdlvs+64HW2uRAzRDyZj
	 KCEewPo383Hdn6XZLd3uJwtK1+181T8UXgaPvqyljnglkIg8loQHfbYjvRKqvzSk1b
	 zA2ZR+J0YJiI+qMtN84BJDDvA6n372iU2EbFephjXf7tNfX9wpCXBozcw0b0JDhpB9
	 JJTswsUJOmP2WY+kKWa8B+wNCZeYATO3GP9Sd4x8qivhBU11PwR0BHRWxCsP7Lf59g
	 bzInoK3C+tTAw==
Date: Wed, 26 Feb 2025 18:12:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 6/7] PCI: dwc: ep: Ensure proper iteration over
 outbound map windows
Message-ID: <20250227001211.GA566164@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pci_fixup_addr-v9-6-3c4bb506f665@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_161213_945450_FFA69688 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jan 28, 2025 at 05:07:39PM -0500, Frank Li wrote:
> Most systems' PCIe outbound map windows have non-zero physical addresses,
> but the possibility of encountering zero increased with commit
> 700cafbb642b ("PCI: dwc: ep: Add bus_addr_base for outbound window").

I don't know what commit 700cafbb642b is.  It doesn't appear
upstream, and there's no subject line or patch match for
bus_addr_base.

Bjorn

