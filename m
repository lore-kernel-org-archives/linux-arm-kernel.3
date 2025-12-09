Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50142D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6dkCRgMUzPsvV6D96ULPzNpmJjBVF4blXdXebng13Q=; b=mnQeFF5rixdntfsQX+vUF2+s6u
	Xs132CjFkwfMKUh5nE9622tGmF9aV8QPzmY4n8Kek7EI4RHop68HtvEWtRatW3KKO17KlGiY9U2NZ
	ktXu8Yb4Q2cue0ivTHrrRIOFq8z3UVXpvd2WI44dJovwH4/oNjPJsE4yopFAeAJSbbh0IXAEClDFC
	ByWDT8LxRZExMPxK/mfPY3zTdxF5FuCsfXDvp6Zvfm9bLrG/qAxqCr8J2dhlvr2kap5v1S4R5ASnA
	j+bUB2zP6EDn4dl4rmCMLNw7Yr+lJC3TRjb4cHVU+3YCoOaBtUzjAtjMlCp13JHQbGewKssHhjRGP
	ceFAsq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSsPl-0000000Dxbb-3Bpk;
	Tue, 09 Dec 2025 07:45:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSsPk-0000000DxbN-1X5Q;
	Tue, 09 Dec 2025 07:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37350600AD;
	Tue,  9 Dec 2025 07:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12366C4CEF5;
	Tue,  9 Dec 2025 07:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765266338;
	bh=Yo7QujsU1IxW5dtrMTM5USn8VYa+1A0rsI10H/kNWL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+3TeinBB99sw9kcl6aOOCwj9AXTkaD3uxYmB2X125JZh+9UxFJ+0iKHgqosYTK0q
	 2SwmPPPGEgLhYdAJeMgT+RNmmvDG7uZipns26XEpYjh73lZY0kIl2Pj13x0U0GkL3o
	 IVcaQfsJx617QOL/Ev0hrJh2TbZWWNG9sMMpod9LXa30kg9sK/aOFIBWdngrCEdiBr
	 Dpvb2QahO4Q8PhsuL398NuRLSj6+MtcLr3cnukgX4MsaGvgpy+UKLHzzUgQIM4i2at
	 Ok52vwDD9ny7DQcU6DF+DpYcqRssMu+dcIZW5U2R2+bywkHYMfoUQOwt3Cx8NXNBoZ
	 yJPy3MA57uWHQ==
Date: Tue, 9 Dec 2025 08:45:33 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Val Packett <val@packett.cool>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: Make Link Up IRQ logic handle already
 powered on PCIe switches
Message-ID: <aTfTnZfLDlt24ZKw@ryzen>
References: <20251201063634.4115762-2-cassel@kernel.org>
 <5cdf685c-5a37-1b65-3e87-9262f3ed7bd4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cdf685c-5a37-1b65-3e87-9262f3ed7bd4@linux.intel.com>
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

Hello Ilpo,

On Tue, Dec 09, 2025 at 09:11:37AM +0200, Ilpo Järvinen wrote:
> 
> Now this patch looks interesting (and managed to catch my attention 
> despite being a controllers/ patch).
> 
> You're only talking about bus number allocations here but we did hit a 
> similar problem with bridge window allocations where not enough 
> information is available at the time of the initial scan + resource 
> allocation (currently it is one of the issues that prevents fixing one 
> resource overlap bug):
> 
> https://lore.kernel.org/linux-pci/8f9c9950-1612-6e2d-388a-ce69cf3aae1a@linux.intel.com/

I'm quite sure that Val's problem will be solved by applying:
https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com/

If not, he could try applying the above series, and then this patch on top.


Kind regards,
Niklas


