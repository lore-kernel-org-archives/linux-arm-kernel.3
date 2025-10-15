Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFDFCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBB+tx3cM4x5fX1WF9iQ80hRaOkWFOCmJITCOBeGcEU=; b=YOVv7IB0ranubOaTxl6a8ndta0
	uaZVgGEhDzH+7/1eutkfUEoetZiyS9f1lShY99UkVSFofqHLkBgnBD2aOXSW5aMELcyqyvBLUkgRN
	Qfvl14sqwEXbN8PYWv/sPpuHzTRQf3jd86FqqNNOTevrieSy0pPbtbPYn1jZC48meEcsilQutR8e4
	2EDuEOZDjSoQqRvkH8c+HmsUX8JpKPJWSBCSEf1gZpyPxFMnLkzw21VNsLOoKb5Jw/q+Pv4oktucB
	zuLJ0Q2WqeK98y7sXoKpU7E/dcCe/B2Kdv3mZcJfuBD80iZW2zlBkG+pF0pzQ2PpBcUFyEYA/28XG
	3QJeYGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93Xc-0000000277P-463f;
	Wed, 15 Oct 2025 15:35:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93Xb-0000000276s-12pH;
	Wed, 15 Oct 2025 15:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BA5A6029C;
	Wed, 15 Oct 2025 15:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAFFC4CEF8;
	Wed, 15 Oct 2025 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760542550;
	bh=Mfl/KuDgepkgRe4RzqZUTCXxFBk4cWh2aDflI/RVyTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhbPkj3Q/aNMPcFdwaF2hvZdFux5rYRjsk7ulff1UfQrKrh9cbieJncYHQqPYKLj2
	 kWzy03hDppQg3Wg4DelZpjhPPyXp1WOslmpkVJr4H+/XrEejL5F3USigQZHgZJPFBE
	 r4WdlwkZHPxJEJ4a0ezEAQMlnbIizaurKbvkI/Hi0JDzrPeCxbJf24fuxIi0GuzK+S
	 s92qqx05U9cOdDtrRhVnpy2tVwoZmlBTs4Crb9mu1WUNow5E4zFNimFcm0YYToxtuk
	 KehnmeiVYfsgHNmX07H0DY63ZMjT5AnI30qDSbiU1G+VmiDJ2hVZG67Xh7Ma9yEUD/
	 H1Q2Vw97xgDig==
Date: Wed, 15 Oct 2025 17:35:43 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Simon Xue <xxm@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Disable L1 substates
Message-ID: <aO-_T7rKFLSOCllp@ryzen>
References: <20251015123142.392274-2-cassel@kernel.org>
 <DDIXEBYPYJX8.2BPOQ14F816T2@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDIXEBYPYJX8.2BPOQ14F816T2@cknow-tech.com>
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

Hello Diederik,

On Wed, Oct 15, 2025 at 03:21:48PM +0200, Diederik de Haas wrote:
> On Wed Oct 15, 2025 at 2:31 PM CEST, Niklas Cassel wrote:
> > The L1 substates support requires additional steps to work, see e.g.
> > section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0.
> 
> I visually compared '18.6.6 PCIe Power Management' of Part 2 V1.1
> (20210301) of the RK3568 TRM with '11.6.6 PCIe Power Management' of
> Part 2 V1.0 (20220309) of the RK3588 TRM.
> AFAICT they are word for word the same ... until I got to 'Table 18-14
> PCIe Interrupt Table' (RK3568) and 'Table 11-22 ...' (RK3588) where
> there are differences. I don't understand enough of this material so I
> would appreciate if you could take a look to see if that difference is
> or could be relevant.

What you should compare is "18.6.6.4 L1 Substate" of RK3658 TRM Part2 V1.1,
vs "11.6.6.4 L1 Substate" of RK3588 TRM Part2 V1.0.

But I have just done that, and I can tell you that they are identical.


Shawn also replied here:
https://lore.kernel.org/linux-pci/7df0bf91-8ab1-4e76-83fa-841a4059c634@rock-chips.com/

that there is indeed a lot of things missing for L1 substates to work,
including proper pinmuxing.


Kind regards,
Niklas

