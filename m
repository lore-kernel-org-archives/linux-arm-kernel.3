Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5294C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=o4LwrGMKdsyiGbYcgs69UzBmVusf0+mW1ZKjaz2vMXM=; b=BS+/Og1U2eg1ST
	SeyjUHZh5BSeoI6Bfn/xkGYrpn7UdX7+dyMe+BCcFaPySf4tG5rrdvkBNkw6qXMqX0QrLZ3iEMFUL
	Xd8mH4TI8sGpIYp6qFP4hl1Q33C4DV6dIJB+emU7OjaDhU9uN9l5+GcLHd1ggDuoFYQwP4Nk69WAC
	Xj96AKV3mAY6cYzxfqWjpXxnrDNKHsECTh+/erEZU2tZMYIer3OhWxwShjA7gAqNsNPR69OWWp/o8
	SbNW0RCbpRC3ZYALh1Ewhf3a6Ev3Q10LUt0iIAGbaLjdSSavwHIrlhBw8uyuF1aupxMzCbpIcoVM+
	oNmBueZ29oX2qHXojZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAwz-00000008xkK-3tf2;
	Wed, 29 Jul 2026 20:32:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAwy-00000008xk8-2nje
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:32:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BEDEC6004E;
	Wed, 29 Jul 2026 20:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AD41F000E9;
	Wed, 29 Jul 2026 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785357143;
	bh=o4LwrGMKdsyiGbYcgs69UzBmVusf0+mW1ZKjaz2vMXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=a8XJqTZ/HQZ9S20Svo+TSeJ3O15hqPvyEAFQHqwuLVM7Y8GQCrC0lw7lylri6Hrm+
	 eO3howZapdbNEpYPTUqtykbCQOpvtlHC6hKftdD7GKmyGkGDIpeFQdW5rhtDEF3Ome
	 Q8EQQGlQ2QNBXWomPXj2frAYA9rnqVY63aGo4SmN3Y/SLpJPfUtInugJvud/YiWo4L
	 2ZzmxH9HuTwCsAUp+a8+k2kh3kZNjIdmQg5zxniMfNZPLA3hmNmjPzU78PHneHJCIv
	 u/PCq1faZh9hg55FcxFYK5a2Fx0EytjGDX7R7ceowr/k0ysoFFOtysWufr5GkxhSyp
	 3KbDmgbdu8MOw==
Date: Wed, 29 Jul 2026 15:32:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v8 3/6] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <20260729203221.GA1465128@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-tegra264-pcie-v8-3-23e51589229b@nvidia.com>
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

On Thu, Jul 16, 2026 at 07:07:14PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of defining the wait values for each driver, use common values
> defined in the core pci.h header file. Note that while most drivers use
> the usleep_range(), it looks like these were mostly cargo culted and
> msleep() is a better choice given the fixed delay that the specification
> calls for. Convert all drivers to msleep() and use the existing
> definition.

Thanks for doing this, removing all this needless duplication is
great!

